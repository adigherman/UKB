# UKBimgTools
Installing the UKBImageTools package

You can install `UKBImageTools` from github with:
``` {r}
# install.packages("remotes")
remotes::install_github("adigherman/UKBImageTools")
```

# System dependencies

### OSX
Unfortunately, UK Biobank currently (05/14/2019) only provides binaries for unix and Windows OS. Natively, OSX is not able to run unix binaries, however, thanks to [noah](https://github.com/linux-noah/noah) this is possible. The quickest way to install `noah` is by using `Homebrew`:
```
$ brew install linux-noah/noah/noah
$ noah
```
`Macports` can also be usied to install `noah`. Please check the [noah GitHub](https://github.com/linux-noah/noah) for additional details and documentation.

In order to be able to successfuly fetch UKB data, one additional step is needed after `noah` was installed. The `resolv.conf` file needs to be edited and have it point to Google's public DNS (8.8.8.8). To do this `vi` or `vim` or any other editor can be used. The `resolv.conf` file is located inside your user home folder (eg. `~/.noah/tree/etc/resolv.conf`). Modify the first `nameserver` IP address to `8.8.8.8` and save the file. 

