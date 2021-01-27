package tree

import (
	"errors"
	"sort"
)

type Node struct {
	ID       int
	Children []*Node
}

type Record struct {
	ID     int
	Parent int
}

// func Find(root *Node, ID int) (*Node, error) {
// 	if root == nil {
// 		return nil, nil
// 	}
// 	if root.ID == ID {
// 		return root, nil
// 	}
// 	for _, child := range root.Children {
// 		res, ok := Find(child, ID)
// 		if ok == nil && res != nil {
// 			return res, ok
// 		}
// 	}
// 	return nil, nil
// }

// func Build(records []Record) (*Node, error) {

// 	for _, record := range records {
// 		parent = Find(
// 	}
// }

func Build(records []Record) (*Node, error) {
	if len(records) == 0 {
		return nil, nil
	}
	// Used to find existing nodes
	idMap := make(map[int]*Node)
	// Used to find parents quickly
	parentMap := make(map[int]*Node)
	sort.Slice(records, func(i, j int) bool {
		return records[i].ID < records[j].ID
	})
	if len(records) != 1 {
		for i := 1; i < len(records); i++ {
			if records[i].ID - 1 != records[i-1].ID {
				return nil, errors.New("non-continuous IDs")
			}
		}
	}
	for _, record := range records {
		if record.ID != 0 && !(record.ID > record.Parent) {
			return nil, errors.New("invalid record")
		}
		if record.ID == 0 && record.Parent != 0 {
			return nil, errors.New("Root has parent")
		}
		cleanNode := &Node{ID: record.ID}
		// step 1. see if this node was already made because it's the parent of someone
		oldNode, wasParent := parentMap[record.ID]
		updatedNode := cleanNode
		if wasParent {
			updatedNode = oldNode
		}
		// make sure we're not making a duplicate node
		_, exists := idMap[record.ID]
		if exists {
			return nil, errors.New("Duplicate node")
		}

		if record.ID == 0 {
			// Zero shouldn't be added as a child of anybody's
			idMap[0] = updatedNode
			parentMap[0] = updatedNode
			continue
		}
		parent, ok := parentMap[record.Parent]
		if !ok {
			// Non-existent parent node, so make a new one, add this to it
			parent = &Node{ID: record.Parent}
			parentMap[record.Parent] = parent
		}
		// Parent node now definitely exists, so just add this to its Children
		parent.Children = append(parent.Children, updatedNode)
		sort.SliceStable(parent.Children, func(i, j int) bool {
			return parent.Children[i].ID < parent.Children[j].ID
		})
		idMap[record.ID] = updatedNode
		parentMap[record.ID] = updatedNode
	}
	if _, ok := idMap[0]; !ok {
		return nil, errors.New("No root node")
	}
	root, ok := parentMap[0]
	if !ok {
		return nil, errors.New("No root node")
	}
	return root, nil
}
