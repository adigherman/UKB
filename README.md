# UKBImageTools
[![Travis build status](https://travis-ci.com/adigherman/UKBImageTools.svg?branch=master)](https://travis-ci.com/adigherman/UKBImageTools)
[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/adigherman/UKBImageTools?branch=master&svg=true)](https://ci.appveyor.com/project/adigherman/UKBImageTools)

Installing the UKBImageTools package

You can install `UKBImageTools` from github with:
``` {r}
# install.packages("remotes")
remotes::install_github("adigherman/UKBImageTools")
```

# System dependencies

### OSX
Unfortunately, UK Biobank currently (as of 05/14/2019) only provides binaries for unix and Windows OS. Natively, OSX is not able to run unix binaries, however, thanks to [noah](https://github.com/linux-noah/noah) this is possible. The quickest way to install `noah` is by using `Homebrew`:
```
$ brew install linux-noah/noah/noah
$ noah
```
`Macports` can also be usied to install `noah`. Please check the [noah GitHub](https://github.com/linux-noah/noah) for additional details and documentation.

In order to be able to successfuly fetch UKB data, one additional step is needed after `noah` was installed. The `resolv.conf` file needs to be edited and have it point to Google's public DNS (8.8.8.8). To do this `vi` or `vim` or any other editor can be used. The `resolv.conf` file is located inside your user home folder (eg. `~/.noah/tree/etc/resolv.conf`). Modify the first `nameserver` IP address to `8.8.8.8` and save the file. 

# Setup, download and convert UKB data
Please consult the short guide to [using UKB data](https://biobank.ndph.ox.ac.uk/showcase/exinfo.cgi?src=accessing_data_guide) to familiarize yourself with the UKB tools and the overall UKB framework.

In order to access and download UKB data, you need to be have an Application for acessing the UK Biobank data approved and also have received an email containing a 32-character MD5 Checksum and a 64-character Password. 

### Download helper programs
Several binary files need to be downloaded locally in order to access/query/download UKB data. The files `ukbmd5`, `ukbconv`, `ukbunpack`, `ukbfetch` can be downloaded from [here](http://biobank.ndph.ox.ac.uk/showcase/download.cgi).

### Download UKB data
Below are the steps to download the data locally once you have the checksum and the password.

1. Login to the Application Management System at https://bbams.ndph.ox.ac.uk/ams/
2. Go to the Projects section for your Application xxxx and click on the Data Tab then the "Go to Showcase download page" button.
3. On the Downloads page of the UKB Showcase, go to the Dataset Tab and click on the entry with ID xxxxx;
4. Enter the MD5 checksum for the data (see below) and click Generate;
5. On the following screen, click Fetch to download the data.

### Verify the download integrity
After the bulk data was downloaded, it is recommended to verify the integrity of the file, making sure that it was not corrupted during transfer. To do so, the `ukbmd5` utility will be used. 
```
#for Unix and Windows
ukbmd5 filename

#for OSX
noah ukbmd5 filename
```
Make sure that the MD5 checksum generated is exactly the one received in the email.

### Unpack the bulk data
Datasets are supplied in a compressed encrypted format. The ukbunpack program decrypts and uncompresses the downloaded file into a custom UK Biobank format. The `ukbunpack` utility will be used for this operation. 
```
#for Unix and Windows
ukbunpack ukbXXXXX.enc keyvalue/keyfile

#for OSX
noah ukbunpack ukbXXXXX.enc keyvalue/keyfile
```
`Keyvalue` represents the 64 character Password from the notification email, which you will need to input. `Keyfile` is the name of a plain text file holding the Password, which you will need to create. Either one will work.

### Convert data for R
The result of the unpacking program is a dataset in a custom UK Biobank format. The `ukbconv` program will be used to transform the data into a format suitable for the R language.
```
#for Unix and Windows
ukbconv ukbXXXXX.enc_ukb r

#for OSX
noah ukbconv ukbXXXXX.enc_ukb r
```

# Usage
Both UKB data and binary utilities must be in the same folder.
