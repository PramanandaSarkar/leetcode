# Definition for a binary tree node.

from typing import Optional, List


class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

    
class Solution:
    def sortedArrayToBST(self, nums: List[int]) -> Optional[TreeNode]:
        if not nums:
            return None
        mid = len(nums) // 2
        root = TreeNode(nums[mid])
        root.left = self.sortedArrayToBST(nums[:mid])
        root.right = self.sortedArrayToBST(nums[mid + 1:])  
        return root  


def printTree(root):
    if not root:
        return
    queue = [root]
    level = 0
    while queue:
        level_size = len(queue)
        for _ in range(level_size):
            node = queue.pop(0)
            print(node.val, end=" ")
            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)
        print()
        level += 1  


test_set = [[-10, -3, 0, 5, 9],
            [1, 3]]
solution = Solution()
for nums in test_set:
    root = solution.sortedArrayToBST(nums)
    printTree(root)
    print()
    

