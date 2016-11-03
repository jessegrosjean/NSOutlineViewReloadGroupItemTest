# NSOutlineViewReloadGroupItemTest

This example is trying to understand why NSOutlineView.reloadItem() and NSOutlineView.reloadData(forRowIndexes:columnIndexes:) seems to fail for items in the outline view that are designated "isGroup" by the NSOutlineView delegate.

To see the problem:

1. Run App
2. Click "Increment Counter"
3. Note Rows 0 and 2 update with new counter values.
4. Note Row 1 does update update, even though it's handled in exactly the same way except for the fact that's it's a group row.
