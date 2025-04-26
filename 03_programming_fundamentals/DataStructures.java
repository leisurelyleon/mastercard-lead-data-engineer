package com.mastercard.datastructures;

// Simple singly-linked list implementation
template <typename T>
public class SinglyLinkedList<T> {
    private static class Node<T> {
        T value;
        Node<T> next;
        Node(T value) { this.value = value; }
    }

    private Node<T> head;

    public void add(T value) {
        Node<T> node = new Node<>(value);
        if (head == null) head = node;
        else {
            Node<T> curr = head;
            while (curr.next != null) curr = curr.next;
            curr.next = node;
        }
    }

    public boolean contains(T value) {
        Node<T> curr = head;
        while (curr != null) {
            if (curr.value.equals(value)) return true;
            curr = curr.next;
        }
        return false;
    }
}

// Basic binary tree node
public class TreeNode<T> {
    public T value;
    public TreeNode<T> left, right;
    public TreeNode(T val) { value = val; }
}
