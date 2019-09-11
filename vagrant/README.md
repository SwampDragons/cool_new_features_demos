# Packer vagrant integration

Packer has a somewhat new Vagrant builder which allows users to build from
already-existing vagrant boxes, and export new vagrant boxes from those boxes.

The builder is still fairly new, so expect a few warts until we sort out all the
possible use cases.  Currently, you can build boxes using a variety of sourcing
methods:

First, try to build from a known vagrant box on Vagrant Cloud
(ie: `hashicorp/precise64`):

`packer build vagrant_builder_from_precise64.json`

Building from this template will pull down a Vagrant box and then save it to a box named
`/precisebox/package.box` in your current working directory.

Once you have that box built, you should be able to run
`packer build test_vagrant_from_box.json`, which will open up
`precisebox/package.box`, modify it, and then save it to a new output box,
`testydir/package.box`

You can also build from a vagrant global ID.  Use `vagrant global-status` to
list the available IDs, then put that ID into the `test_global_id.json` file.

For example, `"global_id": "a3559ec"`.  Then run the build using

`packer build test_global_id.json`

You can also use Vagrant to build from a box that has already been opened and
installed on your system, using the source name of the box. For example,

Try it with `packer build test_vagrant_from_opened_box.json`, where the
source_path is `"source_path": "testy-packer",`, which we previously created in
the test_vagrant_from_box.json build.

