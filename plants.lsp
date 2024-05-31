(load "tmycin.lsp")        ; Load the system first

(defcontext 'plant
 '((region (a b c d e f g h)
	  ("What is the region for the plant?"
	   "multiple regions, use the following format:"
	   "Region A: Panhandle and High Plains"
         "Region B: North and Central Texas"
         "Region C: Northeast and Central Texas"
         "Region D: West Texas"
         "Region E: Upper Rio Grande"
         "Region F: Hill Country and Central Coast"
         "Region G: Southeast Texas"
         "Region H: Rio Grande Valley"))
   (color (tan brown black grey green pink red yellow orange)
	  ("List the colors of the flowers. If there are"
	   "multiple colors, use the following format:"
	   "((color 1.0) ...), for example,"
	   "((RED 1.0) (YELLOW 1.0) (GREEN 1.0))"))
   (size (tiny small medium large huge)
	  ("Give the approximate size of the plant."
	   "tiny = 6 inches or less, small = 7-18 inches,"
	   "medium = 19-36 inches, large = 37-120 inches,"
         "huge = over 120 inches."))
   (type (tree shrub herb grass)
         ("What type of plant is it?"
          "tree = woody plant with a single trunk"
          "shrub = woody plant with multiple stems"
          "herb = non-woody plant"
          "grass = grass-like plant"))
(exposure (sun partial-sun)
         ("How much sunlight does it need?"
          "tree = woody plant with a single trunk"
          "shrub = woody plant with multiple stems"
          "herb = non-woody plant"
          "grass = grass-like plant"))  
   (features (thorns flowers berries edible)
	  ("Enter features observed about the plant,"
	   "or UNK if unknown or absent"))
   (identity (texas-persimmon texas-redbud texas-mountain-laurel
              prickly-pear-cactus texas-bluebonnet indian-blanket
              texas-madrone texas-sabal-palm)) 
   (period (spring summer fall winter)
	  "What is the time of year when the plant flowers?")
   (behavior (blooming fruiting)
	  "Enter any observed behaviors or stages,"
	  "or UNK if none or unknown.")
   (edible nil)
   (latin-name string)
   )
 '(region color size type period)
 '(identity latin-name edible)
)

(defrules

;----------------------------------------------------------------
; First we have a lot of rules to conclude exact identities
; based on good data, assuming it is available.
;----------------------------------------------------------------

(rule01 ($and ($or (same cntxt color yellow)
                   (same cntxt color green))
              (same cntxt exposure sun)
              (same cntxt size huge)
              (same cntxt type tree)
              (same cntxt period spring))
        (conclude cntxt identity black-willow tally 1000))

(rule01a (same cntxt identity black-willow)
         (conclude cntxt latin-name
                   "Salix nigra" tally 1000))

(rule02 ($and (same cntxt color green)
              (same cntxt exposure sun)
              (same cntxt size huge)
              (same cntxt type tree)
              (same cntxt period spring))
        (conclude cntxt identity cork-oak tally 1000))

(rule02a (same cntxt identity cork-oak)
         (conclude cntxt latin-name
                   "Quercus suber" tally 1000))

(rule03 ($and ($or (same cntxt color pink)
                   (same cntxt color white))
              (same cntxt exposure sun)
              (same cntxt size large)
              (same cntxt type shrub)
              ($or (same cntxt period spring)
                   (same cntxt period summer)
                   (same cntxt period fall)))
        (conclude cntxt identity texas-sage tally 1000))

(rule03a (same cntxt identity texas-sage)
         (conclude cntxt latin-name
                   "Leucophyllum frutescens" tally 1000))

(rule04 ($and (same cntxt color white)
              ($or (same cntxt exposure sun)
                   (same cntxt exposure partial-sun))
              (same cntxt size large)
              (same cntxt type grass)
              (same cntxt period summer))
        (conclude cntxt identity dwarf-pampas tally 1000))

(rule04a (same cntxt identity dwarf-pampas)
         (conclude cntxt latin-name
                   "Cortaderia selloana" tally 1000))

(rule05 ($and (same cntxt color white)
              ($or (same cntxt exposure sun)
                   (same cntxt exposure partial-sun))
              (same cntxt size large)
              (same cntxt type grass)
              ($or (same cntxt period summer)
                   (same cntxt period fall)))
        (conclude cntxt identity mexican-feathergrass tally 1000))

(rule05a (same cntxt identity mexican-feathergrass)
         (conclude cntxt latin-name
                   "Stipa tenuissima" tally 1000))

;----------------------------------------------------------------
; In some cases, good data is not available, but we would still
; like to conclude some useful information.
;----------------------------------------------------------------

(rule400 ($or (same cntxt identity prickly-pear-cactus)
              (same cntxt features thorns))
         (conclude cntxt edible yes tally -300))

(rule401 ($and (same cntxt features berries)
               (same cntxt features edible))
         (conclude cntxt edible yes tally 800))

(rule402 ($and (same cntxt behavior fruiting)
               (notsame cntxt features berries))
         (conclude cntxt edible yes tally -400))
)

