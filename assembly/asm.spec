cnsErrorRate = 0.10
ovlErrorRate = 0.10

overlapper = ovl
unitigger = bogart
utgBubblePopping = 1

merSize = 14

merylMemory = 128000
merylThreads = 16

ovlStoreMemory = 8192

#ovlMemory=8GB --hashload 0.7
ovlHashBits = 25
ovlThreads = 6
ovlHashBlockLength = 20000000
ovlRefBlockSize =  5000000

# for mer overlapper
merCompression = 1
merOverlapperSeedBatchSize = 500000
merOverlapperExtendBatchSize = 250000

frgCorrThreads = 2
frgCorrBatchSize = 100000

ovlCorrBatchSize = 100000

# non-Grid settings, if you set useGrid to 0 above these will be used
merylMemory = 128000
merylThreads = 12

ovlStoreMemory = 8192

ovlConcurrency = 8

merOverlapperThreads = 6
merOverlapperSeedConcurrency = 2
merOverlapperExtendConcurrency = 2

frgCorrConcurrency = 8

ovlCorrConcurrency = 16
cnsConcurrency = 16

doToggle=0
toggleNumInstances = 0
toggleUnitigLength = 2000

doOverlapBasedTrimming = 1
doExtendClearRanges = 2
