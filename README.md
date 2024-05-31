# TMYCIN-Expert-System
A simple AI tool designed to assist in selecting the best plants for landscaping in Texas. This expert system leverages the TMycin framework to provide recommendations based on various plant characteristics and environmental conditions.

## Usage
```
(load "tmycin.lsp")
(load "plants.lsp")
(doconsult)
```

### Example Session
```
>(load "tmycin.lsp")
;; Loading "tmycin.lsp"
;; Finished loading "tmycin.lsp"
T

>(load "plants.lsp")
;; Loading "plants.lsp"
;; Loading "tmycin.lsp"
;; Finished loading "tmycin.lsp"
;; Finished loading "plants.lsp"
T

>(doconsult)


What is the REGION of PLANT0?
    What is the region for the plant?
    multiple regions, use the following format:
    Region A: Panhandle and High Plains
    Region B: North and Central Texas
    Region C: Northeast and Central Texas
    Region D: West Texas
    Region E: Upper Rio Grande
    Region F: Hill Country and Central Coast
    Region G: Southeast Texas
    Region H: Rio Grande Valley
    Expected values are: (A B C D E F G H)

>a
What is the COLOR of PLANT0?
    List the colors of the flowers. If there are
    multiple colors, use the following format:
    ((color 1.0) ...), for example,
    ((RED 1.0) (YELLOW 1.0) (GREEN 1.0))
    Expected values are: (TAN BROWN BLACK GREY GREEN PINK RED YELLOW
                              ORANGE)

>yellow
What is the SIZE of PLANT0?
    Give the approximate size of the plant.
    tiny = 6 inches or less, small = 7-18 inches,
    medium = 19-36 inches, large = 37-120 inches,
    huge = over 120 inches.
    Expected values are: (TINY SMALL MEDIUM LARGE HUGE)

>huge
What is the TYPE of PLANT0?
    What type of plant is it?
    tree = woody plant with a single trunk
    shrub = woody plant with multiple stems
    herb = non-woody plant
    grass = grass-like plant
    Expected values are: (TREE SHRUB HERB GRASS)

>tree
What is the PERIOD of PLANT0?
    What is the time of year when the plant flowers?
    Expected values are: (SPRING SUMMER FALL WINTER)

spring
What is the EXPOSURE of PLANT0?
    How much sunlight does it need?
    tree = woody plant with a single trunk
    shrub = woody plant with multiple stems
    herb = non-woody plant
    grass = grass-like plant
    Expected values are: (SUN PARTIAL-SUN)

>sun
What is the FEATURES of PLANT0?
    Enter features observed about the plant,
    or UNK if unknown or absent
    Expected values are: (THORNS FLOWERS BERRIES EDIBLE)

>(unknown)
What is the BEHAVIOR of PLANT0?
    Enter any observed behaviors or stages,
    Expected values are: (BLOOMING FRUITING)

>blooming
Is EDIBLE true of PLANT0?
    Expected values are: Yes/No

>(unknown)


The conclusions for PLANT0 are as follows:


IDENTITY :  BLACK-WILLOW (1.00)


LATIN-NAME :  Salix nigra (1.00)


EDIBLE :
PLANT0

>
```
