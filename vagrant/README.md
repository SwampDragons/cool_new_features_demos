# Packer vagrant integration

Packer and Vagrant are neatly integrated.

You can now start a packer build file from :

* A vagrant global id (ie: `a3559ec`):

  try it with `packer build test_global_id.json`

* A vagrant box (ie: `./precisebox/package.box`):

  try it with `packer build test_vagrant_from_box.json`

* A runnin vagrant box ( using ssh ):

  try it with `packer build test_vagrant_from_opened_box.json` ( you have to have a running box ).

* A known vagrant build (ie: `hashicorp/precise64`):


  try it with `packer build vagrant_builder_from_precise64.json`
  
