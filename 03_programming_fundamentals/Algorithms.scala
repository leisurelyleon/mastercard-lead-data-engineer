package com.mastercard.algorithms

object Algorithms {
  // QuickSort implementation
  def quickSort(xs: List[Int]): List[Int] = xs match {
    case Nil => Nil
    case pivot :: tail =>
      val (less, greater) = tail.partition(_ < pivot)
      quickSort(less) ::: pivot :: quickSort(greater)
  }

  // Binary search on sorted array
  def binarySearch(arr: Array[Int], key: Int): Int = {
    @annotation.tailrec
    def loop(lo: Int, hi: Int): Int = {
      if (lo > hi) -1
      else {
        val mid = lo + (hi - lo) / 2
        if (arr(mid) == key) mid
        else if (arr(mid) < key) loop(mid + 1, hi)
        else loop(lo, mid - 1)
      }
    }
    loop(0, arr.length - 1)
  }
}
