(require-macros :infix)

(local riteg-box
  {:type "fixed"
   :fixed
     [[(/ -4 16) (infix -1 / 2 + 3 / 16) (/ -4 16)
       (/  4 16) (/  1 2)                (/  4 16)]
      [(/ -1 2)  (/ -1 2)                (/ -1 2)
       (/  1 2)  (infix -1 / 2 + 3 / 16) (/  1 2)]]})

(local fuel 
  {"default:plutonium_dioxide" 3
   "default:plutonium_tetrafluoride" 0.4
   "default:plutonium_trifluoride" 0.3
   "default:uranium" 0.5
   "default:uranium_tetrachloride" 0.1})

(local riteg-formspec
  (.. "size[8,6.5]"
      "label[3.5,0;RITEG]"
      "list[context;place;3.5,0.5;1,1;]"
      "list[current_player;main;0,2;8,1;]"
      "list[current_player;main;0,3.5;8,3;8]"))

(fn update-riteg [pos]
  (let [meta (minetest.get_meta pos)
        inv (meta:get_inventory)
        stack (inv:get_stack "place" 1)
        emf (or (. fuel (stack:get_name)) 0)]
    (meta:set_float :emf emf)))

(minetest.register_node "electricity:riteg"
  {:description "RITEG"
   :tiles
     ["electricity_riteg_top.png"
      "electricity_riteg_bottom.png"
      "electricity_riteg_side.png"
      "electricity_riteg_side.png"
      "electricity_riteg_connect_side.png"
      "electricity_riteg_connect_side.png"]
   :groups {:crumbly 3 :source 1}
   :paramtype2 "facedir"

   :on_construct
     (fn [pos]
       (let [meta (minetest.get_meta pos)
             inv  (meta:get_inventory)]
         (inv:set_size "place" 1) (meta:set_float :resis 0.4)
         (meta:set_string "formspec" riteg-formspec)))

   :paramtype "light"  :drawtype "nodebox"
   :node_box riteg-box :selection_box riteg-box

   :allow_metadata_inventory_put (fn [pos listname index stack player]
      (let [inv (-> (minetest.get_meta pos) (: :get_inventory))]
        (if (= (-> (inv:get_stack listname index) (: :get_count)) 1) 0 1)))

   :on_metadata_inventory_move update-riteg
   :on_metadata_inventory_put  update-riteg
   :on_metadata_inventory_take update-riteg
   :on_destruct (andthen reset_current drop_everything)})

(tset model "electricity:riteg" vsource)