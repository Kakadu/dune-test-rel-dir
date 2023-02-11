let prj = Sys.argv.(1)
let ws = Sys.argv.(2)

let () =
  (* print_endline prj;
     print_endline ws;
     print_endline  (Unix.realpath prj);
     print_endline  (Unix.realpath ws); *)
  let ans =
    if prj = ws then "."
    else
      let len = String.(length ws - length prj) in
      StringLabels.sub ws ~pos:(String.length prj) ~len
  in
  Stdlib.Out_channel.with_open_text "delta-path.cfg" (fun ch ->
      output_string ch ans);
  ()
