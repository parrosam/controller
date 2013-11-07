# Created by Actel Designer Software 11.0.0.23
# Thu Nov 07 12:54:57 2013

# (OPEN DESIGN)

open_design "controller.adb"

# set default back-annotation base-name
set_defvar "BA_NAME" "controller_ba"
set_defvar "IDE_DESIGNERVIEW_NAME" {Impl1}
set_defvar "IDE_DESIGNERVIEW_COUNT" "1"
set_defvar "IDE_DESIGNERVIEW_REV0" {Impl1}
set_defvar "IDE_DESIGNERVIEW_REVNUM0" "1"
set_defvar "IDE_DESIGNERVIEW_ROOTDIR" {N:\373\controller\designer}
set_defvar "IDE_DESIGNERVIEW_LASTREV" "1"


# import of input files
import_source  \
-format "edif" -edif_flavor "GENERIC" -netlist_naming "VERILOG" {../../synthesis/controller.edn} -merge_physical "no" -merge_timing "yes"
compile
report -type "status" {controller_compile_report.txt}

save_design
