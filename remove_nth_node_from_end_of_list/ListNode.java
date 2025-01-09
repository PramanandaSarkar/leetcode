/**
 * Definition for singly-linked list.
 * */
public class ListNode {
    int val;
    ListNode next;
    ListNode() {}
    ListNode(int val) { this.val = val; }
    ListNode(int val, ListNode next) { this.val = val; this.next = next; }
}

class Solution {
    public ListNode removeNthFromEnd(ListNode head, int n) {
        ListNode root = head ;
        // calculate the length of the list
        int len = 0;
        while (head != null) {
            head = head.next;
            len += 1;
        }
        int index = len - n;
        // remove the head
        if (index == 0) {
            root = root.next;
            return root;
        }
        // remove the node from the list    
        head = root;
        for (int i = 0; i < index - 1; i++) {
            head = head.next;
        }
        head.next = head.next.next;
        return root;

    }
    
}