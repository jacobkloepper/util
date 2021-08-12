"""
    Basic n-ary tree class.

        The only ambiguity I can think of is that itemize_tree() must be passed an empty list
        I don't want to set the variable to an empty list internally because it's a recursive function.
"""


class NaryTreeNode():

    def __init__(self, val, parent=None):
        self.children = []
        self.parent = parent
        self.id = val

    # Get/set self
    def get_id(self):
        return self.id
    def set_id(self, val):
        self.id = val

    # Get/set parent
    def get_parent(self):
        return self.parent
    #def set_parent(self):

    # Get child objects
    def get_child_by_id(self, val):
        for child in self.children:
            if (child.get_id() == val):
                return child

    # Set child objects
    def add_child(self, val):
        self.children.append(NaryTreeNode(val, parent=self))

# Debug helpers
def print_tree(node):
    if (node is not None):
        if node.children:
            for child in node.children:
                print_tree(child)
            print(node.get_id())
        else:
            print(node.get_id())

def print_branches(root_node, leaf_val):
    # Look through the tree, find leaf_val, then print its parents back up to root.
    tree = []
    itemize_tree(root_node, tree)

    leaves = [node for node in tree if ((node.get_id() == leaf_val) and (not node.children))]

    for leaf in leaves:
        print_to_root(leaf)

def print_to_root(node):
    print(node.get_id())
    if (node.get_parent()):
        print_to_root(node.get_parent())

# Get containers of nodes. ...FUNC_ids() indicates that the function 
#   returns the node ids, not the node objects.
def itemize_tree(node, scanned_tree):
    # Note: scanned_tree must be an empty list when first passed.
    if (node is not None):
        if node.children:
            for child in node.children:
                itemize_tree(child, scanned_tree)
            scanned_tree.append(node)
        else:
            scanned_tree.append(node)

def itemize_branches(root_node, leaf_val):
    # Look through the tree, find leaf_val, then print its parents back up to root.
    tree = []
    itemize_tree(root_node, tree)

    branches = []
    leaves = [node for node in tree if ((node.get_id() == leaf_val) and (not node.children))]

    for leaf in leaves:
        _tmplist = []
        scan_to_root(leaf, _tmplist)
        branches.append(_tmplist)
    
    return branches

def itemize_branch_ids(root_node, leaf_val):
    # Look through the tree, find leaf_val, then print its parents back up to root.
    tree = []
    itemize_tree(root_node, tree)

    branches = []
    leaves = [node for node in tree if ((node.get_id() == leaf_val) and (not node.children))]

    for leaf in leaves:
        _tmplist = []
        scan_to_root_ids(leaf, _tmplist)
        branches.append(_tmplist)
    
    return branches

# Helpers to traverse and collect from the tree. ...FUNC_ids() indicates that the function 
#   returns the node ids, not the node objects.
def scan_to_root(node, branch_list):
    branch_list.append(node)
    if (node.get_parent()):
        scan_to_root(node.get_parent(), branch_list)

def scan_to_root_ids(node, branch_list):
    branch_list.append(node.get_id())
    if (node.get_parent()):
        scan_to_root_ids(node.get_parent(), branch_list)