stopAfter=overlapper

# original asm settings
utgErrorRate = 0.25
utgErrorLimit = 4.5

cnsErrorRate = 0.25
cgwErrorRate = 0.25
ovlErrorRate = 0.25

merSize=14

merylMemory = 128000
merylThreads = 16

ovlStoreMemory = 8192


#ovlMemory=8GB --hashload 0.7
ovlHashBits = 25
ovlThreads = 4
ovlHashBlockLength = 20000000
ovlRefBlockSize =  50000000

# for mer overlapper
merCompression = 1
merOverlapperSeedBatchSize = 500000
merOverlapperExtendBatchSize = 250000

frgCorrThreads = 2
frgCorrBatchSize = 100000

ovlCorrBatchSize = 100000

# non-Grid settings, if you set useGrid to 0 above these will be used
merylMemory = 128000
merylThreads = 4

ovlStoreMemory = 8192

ovlConcurrency = 6

cnsConcurrency = 16

merOverlapperThreads = 2
merOverlapperSeedConcurrency = 6
merOverlapperExtendConcurrency = 6

frgCorrConcurrency = 8
ovlCorrConcurrency = 16
cnsConcurrency = 16
