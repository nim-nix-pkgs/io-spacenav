{
  description = ''Obsolete - please use spacenav instead!'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-io-spacenav-master.flake = false;
  inputs.src-io-spacenav-master.owner = "nimious";
  inputs.src-io-spacenav-master.ref   = "master";
  inputs.src-io-spacenav-master.repo  = "io-spacenav.git";
  inputs.src-io-spacenav-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-io-spacenav-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-io-spacenav-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}