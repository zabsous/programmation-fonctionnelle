let g1 =
  [(1, 0, [2;4]) ; (2, 0, [1;3]) ; (3, 0, [2;5]) ; (4, 0, [1;5;6]) ;
   (5, 0, [3;4;9;10]) ; (6, 0, [4;7;8]) ; (7, 0, [6]) ;
   (8, 0, [6;11;12]) ; (9, 0, [5;13]) ; (10, 0, [5;11]) ;
   (11, 0, [8;10]) ; (12, 0, [8;16]) ; (13, 0, [9;14;15]) ;
   (14, 0, [13;15;17]) ; (15, 0, [13;14]) ; (16, 0, [12;17]) ;
   (17, 0, [14;16;18;19]) ; (18, 0, [17;19]) ; (19, 0, [17;18] )];;
(*exercice 1*)
(* 1) *)
let rec sucesseur sommet graphe = match graphe with
                                    []->failwith "sommet pas dans le tableau"
                                    |(x,_,z)::r->if x = sommet then z
                                            else sucesseur sommet r;;
sucesseur 2 g1;; []->[]

(* 2) *)

let rec est_marque sommet graphe = match graphe with
                                  []->false
                                  |(x,y,z)::r->if x = sommet then y>0
                                          else est_marque sommet r;;
est_marque 3 g1;;
(* let rec parcour list = match list with
                                     []->[]
                                     |w::r-> if(est_marque w graphe) then w::(parcour r)
                                              else parcour r
                                     in *)
(* 3) *)
let rec succ_marques sommet graphe = match graphe with
                                     []->[]
                                     |(x,y,z)::r-> if x = sommet then  List.fold_left (fun w t -> if ( est_marque t graphe ) then t::w else w) [] z 
                                                   else succ_marques sommet r ;;
succ_marques 2 g1;;

(* 4) *)

let rec marquer nbr sommet graphe = match graphe with 
                                    []->[]
                                    |(x,y,z)::r-> if x = sommet then (x,y+nbr,z)::r else (x,y,z)::marquer nbr sommet r;;
marquer 2 2 g1;; 

(* exercice 2*)
let rec chemins sommet_init sommet_fin longueur graphe tab pred  =match longueur with
                                                             0->[tab @ [sommet_init]] 
                                                             |n->List.fold_left (fun x y->if y!=pred && sommet_init!=sommet_fin then(chemins y sommet_fin (longueur-1) graphe (tab@[sommet_init]) sommet_init  ) @ x else x)  [] (sucesseur sommet_init graphe) ;; 

let rec fin_de_la_liste liste= match liste with
                                       []->failwith "pas de liste"
                                       |[x]->x
                                       |x::r->fin_de_la_liste r ;;
(* 
let rec bon_chemin list sommet_fin=match list with
                              []->[]
                              |x::r-> if fin_de_la_liste x sommet_fin then x::bon_chemin r sommet_fin else bon_chemin r sommet_fin;; *)

let rec tous_chemin sommet_init sommet_fin longueur graphe= let l1 =List.fold_left (fun x y -> ((chemins y sommet_fin (longueur-1)  graphe [sommet_init] sommet_init))@x) [] (sucesseur sommet_init graphe)
                                                       in
                                                       List.fold_left (fun x y -> if fin_de_la_liste y = sommet_fin then y::x else x ) [] l1;;
                                                       

(* 
tous_chemins 4 10 3 g1 [] 0;; *)
tous_chemin 1 18 9  g1;;

let rec marquer_chemin l_sommet graphe=List.fold_left (fun x y -> marquer 1 y x) graphe l_sommet;;
marquer_chemin [1;2;3;4;5] g1;;
let g2 = marquer_chemin [1; 4; 5; 10; 11; 8; 12; 16; 17; 18] g1;;


(* exercice 3 *)
(* let rec longueur list = List.fold_left (fun x y -> x+1 ) 0 list;;

longueur [1;2;3;4;5];; *)

let rec parcours_retour_tous sommet_init sommet_fin graphe_marque pred tab = List.fold_left (fun x y -> if (est_marque y graphe_marque)&&(sommet_init!=sommet_fin)&&(y!=pred) then (parcours_retour_tous y sommet_fin  graphe_marque sommet_init (tab@[sommet_init]) ) @ x else if (sommet_init==sommet_fin) then [(tab@[sommet_init])]@x else x ) [] (sucesseur sommet_init graphe_marque);;   


let rec parcours_retour sommet_actuel sommet_fin graphe_marque = match (parcours_retour_tous sommet_actuel sommet_fin graphe_marque sommet_actuel []) with
                                                                []->[]
                                                                |x::r->x;;
                        
parcours_retour 18 1 g2;;

(* let rec enlever_marques n chemin graphe = *)

Random.self_init();;

Random.int 5;;

let rec reset sommet_actuel graphe=  match graphe with 
                                []->[]
                                |(x,y,z)::r-> if x = sommet_actuel then (x,0 ,z)::r else (x,y,z)::reset sommet_actuel r;;

let rec enlever_marques  n chemin graphe =List.fold_left (fun x y -> if (Random.int 101)<=n then reset y x else x ) graphe chemin;;

enlever_marques 10  [1; 4; 5; 10; 11; 8; 12; 16; 17;18] g2;; 