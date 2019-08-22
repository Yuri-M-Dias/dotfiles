function clearSomeMemory -d "Clears up some memory by dropping linux caches"
  free; and sync; and sudo sh -c "echo 3 > /proc/sys/vm/drop_caches"; and free
end
