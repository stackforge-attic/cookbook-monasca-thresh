mon_thresh Cookbook
===================

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
    <td><tt>[:mon_thresh][:data_bag]</tt></td>
    <td>String</td>
    <td>Data bag to use</td>
    <td><tt>mon_thresh</tt></td>
  </tr>
</table>

Data Bags
---------
The node[:mon_thresh][:data_bag] data bag is used for all items.

The following data bag items are used:
  - thresh - Holds basic configuration details of the threshold engine

