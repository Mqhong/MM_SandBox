### What is it?
A simple class, enable you to view sandbox file system on iOS device, share files via airdrop, super convenient when you want to send log files from iOS device to Mac.

### How to use?
After your key window is created, add below code:
```
#if DEBUG
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
        MM_AirSandBox.sharedInstance.enableSwipe()
    }
#endif
```
now swipe from the right edge of the screen, a simple file browser shall pop up.

no more instructions needed.

### Licence
MIT


