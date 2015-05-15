# SolarCV

CV template, written in LaTeX, based on [Adrien Friggeri CV](https://github.com/afriggeri/cv),
slighty modified to use [Ethan Schoonover Solarized color palette](https://github.com/altercation/solarized).

![SolarCV screenshot](https://github.com/antenore/solarcv/blob/master/img/Screenshot_2015-05-15_17-43-33.png)  

## Features

   * Most of the Friggeri features
   * Portrait picture
   * Solarized color palette
   * PDF metadata (with my copyright, can be modified as per CC BY-SA 3.0)

## How to use

   * Modify the cv-config.tex file with your personal details.
   * Modify solarcv.cls and set your favorite fonts, you will need a Math font for LaTeX symbols.
   * Install all the TeX packages that are required (see the cls files for a list).
   * Modify the SolarCV.tex file and adapt to your paper size
   * Modify each file under tex directory and substitue each '\blind\*' text to
     your needs.
   * Put a photo of yourself under img (FirstnameLastname.png)
   * Build it -->

   ```bash
   make clean
   make
   make display
   ```

## License

[![Creative Commons License](http://i.creativecommons.org/l/by-sa/3.0/88x31.png)]    
This work is licensed under a [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/).  
