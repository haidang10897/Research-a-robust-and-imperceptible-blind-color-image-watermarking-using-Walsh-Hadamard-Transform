# Research a robust and imperceptible blind color image watermarking using Walsh Hadamard Transform
# Table of contents
* [1. Project Information](#1)
* [2. Overview](#2)
* [3. System information](#3)
* [4. How to use](#4)
* [5. How to install](#5)  
* [6. Embed Result](#6)  
* [7. Attack Result](#7)  
* [8. Note](#8)  

<a name="1"></a>
# Project information
Scholar: Tran Hai Dang    		
Class: AT12ET - AT120515    
Instructor: Ths. Tran Thi Xuyen  
Academy: Academy of Cryptography Techniques  
Project: Research a robust and imperceptible blind color image watermarking using Walsh Hadamard Transform  
Reference: An effective robust and imperceptible blind color image watermarking using WHT, K. Prabha, I. Shatheesh Sam  

<a name="2"></a>
# Overview
<img src = "./Image/Home.png">  

<a name="3"></a>
# System information

CPU: Intel Core I7-3770 3.4GHZ  
RAM: 16GB  
VGA: NVIDIA GeForce 650Ti  
Software: Matlab R2018a  
OS: Windows 10 build 19041
Display: Asus VA24EHE

<a name="4"></a>
# How to install  

** Go to [Release](https://github.com/haidang10897/Research-a-robust-and-imperceptible-blind-color-image-watermarking-using-Walsh-Hadamard-Transform/releases/tag/v1.0) to download**  

### For MATLAB user

    1. Download "WatermarkWHT_for_MATLAB_user" lastest version.
    2. Open "MATLAB" program.
    3. Change Workspace/Current folder to where you save the downloaded file above.
    4. Right-click to the ~.mlappinstall file to install.
    5. On top of the MATLAB menu, change to tab "Apps" and choose the program you've just installed.  

### For non-MATLAB user

    1. Download "WatermarkWHT" lastest version.
    2. Open the install file to install the program.
    3. Follow the instruction in the setup file.
    4. When done, open the program and begin to use.

### For Developer

    1. Clone or Fork,... the repository (E.g: Click Code -> Download ZIP on above menu of this web)
    2. Open "MATLAB" program.
    3. Change Workspace or add to path the folder you've just downloaded.
    4. Begin edit.

<a name="5"></a>
# How to use
> The program have GUI so it's very easy to use, if you still not know how to use, so go to the tab "About" in the program you've opened and read the guide. Beside, there are videos below the guide to help you (but require internet). - BacDau

> Tutorial videos: https://www.youtube.com/playlist?list=PL5D4ygJQLkjgtDO9FgI8tZhbU6i3DRSIl  

<a name="6"></a>
# Embed Result
| Host image | Watermark image |
|--|--|
| <img src = "./Test%20sample/Non-square%20Host%20Image/shima.png">   | <img src = "./Test%20sample/Watermark/Shimakaze.png"> |  

| Embedded host image | Extracted watermark image |
|--|--|
| <img src = "./Test%20sample/Processed%20Image/Watermarked/shima_with_shimakaze_watermarked.png"> | <img src = "./Test%20sample/Processed%20Image/extracted_watermark/Extracted_Watermark_Shima_Shimakaze.png"> |

<a name="7"></a>
# Attack Result
| Attack | Extracted Watermark |
|--|--|
| Rotate | <img src = "./Test%20sample/Processed%20Image/Extracted_Attack/shima%20and%20shimakaze/rotate.png"> |
| Resize | <img src = "./Test%20sample/Processed%20Image/Extracted_Attack/shima%20and%20shimakaze/resize.png"> |
| Crop Vertically | <img src = "./Test%20sample/Processed%20Image/Extracted_Attack/shima%20and%20shimakaze/crop.png"> |
| Salt and Pepper | <img src = "./Test%20sample/Processed%20Image/Extracted_Attack/shima%20and%20shimakaze/salt%20and%20pepper.png"> |
| Median filter | <img src = "./Test%20sample/Processed%20Image/Extracted_Attack/shima%20and%20shimakaze/medfil.png"> |
| Brighten | <img src = "./Test%20sample/Processed%20Image/Extracted_Attack/shima%20and%20shimakaze/brighten.png"> |
| Darken | <img src = "./Test%20sample/Processed%20Image/Extracted_Attack/shima%20and%20shimakaze/darken.png"> |
| Compress | <img src = "./Test%20sample/Processed%20Image/Extracted_Attack/shima%20and%20shimakaze/compress.png"> |

<a name="8"></a>
# Note
- Make sure to read the guide before using.
- If you're a developer, or just want to edit code, make sure you have MATLAB R2018 or newer, because "App designer" only have in that MATLAB version.


