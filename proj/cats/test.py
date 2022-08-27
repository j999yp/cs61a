from cats import *


all_words = lines_from_file("data/words.txt")
common_words = lines_from_file("data/common_words.txt")

autocorrect("woll", common_words, key_distance_diff, 4)
'will'
key_distance_diff.call_count <= 98924
True
key_distance_diff.call_count = 0
faster_autocorrect("woll", common_words, meowstake_matches, 4)
'well'
key_distance_diff.call_count
0
key_distance_diff.call_count = 0
faster_autocorrect("woll", common_words, key_distance_diff, 4)
'will'
key_distance_diff.call_count <= 2000 #key_distance_diffs should be memoized, this is the first call to faster_autocorrect
True
key_distance_diff.call_count = 0
faster_autocorrect("woll", common_words, key_distance_diff, 4)
'will'
key_distance_diff.call_count #faster_autocorrect should be memoized and this is the second call
0
autocorrect("woll", common_words, key_distance_diff, 4)
'will'
key_distance_diff.call_count <= 2000 #key_distance_diffs should still be memoized but autocorrect should not be
True
key_distance_diff.call_count = 0
faster_autocorrect("woll", common_words, key_distance_diff, 3)
'will'
key_distance_diff.call_count <= 41546 #different limit so it should have to recompute many calls
True
key_distance_diff.call_count = 0
faster_autocorrect("woll", all_words, key_distance_diff, 2)
'will'
key_distance_diff.call_count <= 6173942
True
key_distance_diff.call_count = 0