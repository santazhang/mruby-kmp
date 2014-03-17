class KMP

  def initialize(needle)
    @needle = needle
    m = @needle.size
    return if m <= 0
    i = 0
    j = -1
    @skip = []
    @skip << j
    while i < m do
      while j >= 0 and @needle[i] != @needle[j] do
        j = @skip[j]
      end
      i += 1
      j += 1
      @skip << j
    end
  end

  def match_first(haystack)
    match = -1
    m = @needle.size
    n = haystack.size
    return 0 if m == 0
    return -1 if n == 0
    i = 0
    j = 0
    while i < n do
      while j >= 0 and haystack[i] != @needle[j] do
        j = @skip[j]
      end
      i += 1
      j += 1
      if j == m
        match = i - j
        break
      end
    end
    return match
  end

  def match_all(haystack, overlap=true)
    match = []
    m = @needle.size
    n = haystack.size
    return [0] if m == 0
    return [] if n == 0
    i = 0
    j = 0
    while i < n do
      while j >= 0 and haystack[i] != @needle[j] do
        j = @skip[j]
      end
      i += 1
      j += 1
      if j == m
        match << (i - j)
        if overlap
          j = @skip[j]
        else
          j = 0
        end
      end
    end
    return match
  end

end
