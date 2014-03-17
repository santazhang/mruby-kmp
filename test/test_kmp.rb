assert('KMP on string') do
  kmp = KMP.new "iloveny"
  assert_equal 7, kmp.match_first('oh yes iloveny')
end

assert('KMP on string, match_first') do
  kmp = KMP.new "abc"
  assert_equal 0, kmp.match_first('abc abc abc aabbcc aabcc')
end

assert('KMP on string, match_all') do
  kmp = KMP.new "abc"
  assert_equal [0, 4, 8, 20], kmp.match_all('abc abc abc aabbcc aabcc')
end

assert('KMP on string, match_all, overlapping') do
  kmp = KMP.new "rr"
  assert_equal [0, 1, 2], kmp.match_all('rrrr')
end

assert('KMP on string, match_all, no overlapping') do
  kmp = KMP.new "rr"
  assert_equal [0, 2], kmp.match_all('rrrr', overlap=false)
end

assert('KMP on array') do
  kmp = KMP.new [1, 9, 8, 7]
  assert_equal 6, kmp.match_first([-1, 0, 1, 9, 8, 0, 1, 9, 8, 7, 1987])
end
