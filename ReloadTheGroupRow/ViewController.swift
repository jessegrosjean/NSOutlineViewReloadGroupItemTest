//
//  ViewController.swift
//  ReloadTheGroupRow
//
//  Created by Jesse Grosjean on 11/3/16.
//  Copyright © 2016 Jesse Grosjean. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var outlineView: NSOutlineView!
    
    let child0 = "child 0"
    let child1 = "child 1"
    let child2 = "child 2"
    var count = 0

    @IBAction func increment(_ sender: Any) {
        count = count + 1
        outlineView.beginUpdates()
        outlineView.reloadItem(child0)
        outlineView.reloadItem(child1)
        outlineView.reloadItem(child2)
        outlineView.reloadData(forRowIndexes: IndexSet(integersIn: 0...2), columnIndexes: IndexSet(integersIn: 0...0))
        outlineView.endUpdates()
    }
    
}

extension ViewController: NSOutlineViewDataSource {
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if item == nil {
            return 3
        }
        return 0
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        return false
    }
    
    func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {
        if (item as? String) == child1 {
            return true
        }
        return false
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if index == 0 {
            return child0
        } else if index == 1 {
            return child1
        } else {
            return child2
        }
    }
    
}

extension ViewController: NSOutlineViewDelegate {
    
    func outlineView(_ outlineView: NSOutlineView, viewFor viewForTableColumn: NSTableColumn?, item: Any) -> NSView? {
        if let item = item as? String {
            let identifier = self.outlineView(outlineView, isGroupItem: item) ? "HeaderCell" : "DataCell"
            let view = outlineView.make(withIdentifier: identifier, owner: self) as! NSTableCellView
            view.textField?.stringValue = "\(item) \(count)"
            return view
        }
        return nil
    }
    
}
