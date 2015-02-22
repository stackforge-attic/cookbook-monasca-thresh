WARNING!!

Monasca is now deployed via Ansible. This Chef cookbook project is no longer maintained and may be out of date. It will be moved to the StackForge attic soon.

monasca_thresh Cookbook
===================
This cookbook sets up a monasca-thresh which runs under storm. It is assumed this cookbook is installed on the storm nimbus node.

Requirements
------------
No special requirements at this time

Attributes
----------
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>[:monasca_thresh][:data_bag]</tt></td>
    <td>String</td>
    <td>Data bag to use</td>
    <td><tt>monasca_thresh</tt></td>
  </tr>
</table>

Data Bags
---------
The node[:monasca_thresh][:data_bag] data bag is used for all items.

The following data bag items are used:
  - thresh - Holds basic configuration details of the threshold engine

