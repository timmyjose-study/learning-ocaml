(* representation with tuples *)
type 'a tree = 
  Leaf 
  | Node of 'a tree * 'a * 'a tree

let t1 = Node (Node (Node (Leaf, 1, Leaf), 2, Node (Leaf, 3, Leaf)), 4, (Node (Node (Leaf, 6, Leaf), 5, Node (Leaf, 7, Leaf))))

let rec tree_size = function
  | Leaf -> 0
  | Node (l, _, r) -> 1 +  tree_size l + tree_size r 

(* representation with records *)

type 'a tree = 
  Leaf
  | Node of 'a node  
and 'a node = {
  left: 'a tree;
  value: 'a;
  right: 'a tree;
}

let t2 = Node {
  left =  Node {
    left =  Node {
      left =  Leaf;
      value = 1;
      right = Leaf;
    };
    value = 2;
    right = Node {
      left = Leaf;
      value = 3;
      right = Leaf;
    };
  };
  value = 4;
  right = Node {
    left = Node {
      left = Leaf;
      value = 6;
      right = Leaf;
    };
    value = 5;
    right = Node {
      left = Leaf;
      value = 7;
      right = Leaf;
    }
  }
}

let t3 = Node {
  left = Node {
    left = Leaf;
    value = 1;
    right = Leaf;
  };
  value = 2;
  right = Node {
    left = Leaf;
    value = 3;
    right = Leaf;
  }
}

let rec tree_size = function
  Leaf -> 0
  | Node { left; value; right } -> 1 + tree_size left + tree_size right

let rec mem x = function
  | Leaf -> false
  | Node { left; value; right } ->
      x = value || mem x left || mem x right

let rec preorder = function
  | Leaf -> []
  | Node { left; value; right } ->
      [value] @ (preorder left) @ (preorder right)

let preorder_lin t = 
  let rec preorder_lin_aux acc = function
    | Leaf -> acc
    | Node { left; value; right } -> value :: (preorder_lin_aux (preorder_lin_aux acc right) left)
  in
    preorder_lin_aux [] t
  