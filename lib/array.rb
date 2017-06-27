class Array
  def median
    sorted = self.sort
    mid = (sorted.length - 1) / 2.0
    (sorted[mid.floor] + sorted[mid.ceil]) / 2.0
  end

  def mean
    self.sum/self.length.to_f
  end

  def sample_variance
    m = self.mean
    sum = self.inject(0){|accum, i| accum +(i-m)**2 }
    sum/(self.length).to_f
  end

  def standard_deviation
    return Math.sqrt(self.sample_variance)
  end
end
