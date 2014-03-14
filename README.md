#Problem

Start with a doubly-linked list of 200 nodes with random values between 1 and 100. Now remove any nodes as required, so that each value is only in the list no more than one time.

An example with values less than 10:

Input:

8 <=> 4 <=> 2 <=> 4 <=> 9 <=> 4 <=> 8 <=> 8 <=> 1 <=> 3

Output:

8 <=> 4 <=> 2 <=> 9 <=> 1 <=> 3

##Solution 1

The first solution, `List#deduplicate!`, uses an Array to store the values of the nodes, if that value exists it removes the node and continues to traverse the list.

##Solution 2

Without using the Array to store the values, `List#dedup` uses two pointers while traversing the linked list and removing any nodes that are the same as the first pointer.

###Benchmarks

Benchmarks using 200, 400, 600 and 1200 nodes with random values half of the # of nodes
```
                                   user     system      total        real
deduplicate array 200 nodes    0.130000   0.000000   0.130000 (  0.128571)
deduplicate pointer 200 nodes  0.340000   0.000000   0.340000 (  0.348790)
                                   user     system      total        real
deduplicate array 400 nodes    0.380000   0.010000   0.390000 (  0.810305)
deduplicate pointer 400 nodes  1.260000   0.000000   1.260000 (  1.488321)
                                   user     system      total        real
deduplicate array 600 nodes    0.770000   0.000000   0.770000 (  0.930702)
deduplicate pointer 600 nodes  2.750000   0.010000   2.760000 (  3.298579)
                                   user     system      total        real
deduplicate array 1200 nodes    2.720000   0.010000   2.730000 (  3.417358)
deduplicate pointer 1200 nodes 10.710000   0.020000  10.730000 ( 12.887650)
```
