class Array
  def median
    sorted = self.sort
    mid = (sorted.length - 1) / 2.0
    (sorted[mid.floor] + sorted[mid.ceil]) / 2.0
  end

  def mean
    self.sum/self.length.to_f
  end
end
