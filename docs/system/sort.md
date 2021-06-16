# Sort
The sort module is used for table sorting, from the native Quicksort implementation, to other sorting algorithms, like bubble sort, merge sort, et cetera.

## Methods
!!! abstract ".Bubble(Table: table)"
    Sorts the table with bubble sort

!!! abstract ".Merge(Table: table)"
    Sorts the table with merge sort

!!! abstract ".Quick(Table: table)"
    A wrapper for `table.sort`, `table.sort` uses the Quicksort algorithm

!!! abstract ".Bogo(Table: table)"
    A joke; You shouldn't use this in production