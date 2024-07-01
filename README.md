# Quicksort Assembly IA32 AT&T Syntax

This project stems from the desire to demonstrate the utility of **Assembly** and **low-level programming** in general, even for tasks not strictly related to operating system development. **Quicksort** is a fitting example for us, not only because of its easy implementation and optimization with **IA32 registers** (32-bit architecture) but also due to its adaptability to modern contexts such as:

- **Databases**: Query optimization, indexing...
- **Data Science and Machine Learning**: Sorting and preprocessing large datasets
- **Search Engines and Web Crawling**: Page ranking, website indexing..
- **Telecommunications**: Network traffic analysis, call detail records...
- **E-commerce**: Product listings, customer data processing...
- **Scientific Research**: Various fields including Astronomy, Healthcare, Genomics and Bioinformatics...

an so on. 

With an array of **n = 100000000** random entries the average result is:

    Created C array in 1.00 seconds
    Created Assembly array in 1.00 seconds
    Test (C): Sorted array in 11.00 seconds
    Test (Assembly): Sorted array in 10.00 seconds

With these results, its utility for handling large datasets is easily verifiable.

To use the program download it from this page or in command line:

    git clone https://github.com/mariomarra99/quicksort-assembly

In Linux, open a terminal in the main repository and then:

    make -s
To launch the script use:

    ./quick
