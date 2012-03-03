# Simple Forms

## Install

### Add as a submodule

If you're using git as your project's scm, add Simple Form as a submodue:

```bash
git submodule add https://github.com/makadaw/Simple-Form
```

#### Download source

Download source code from https://github.com/makadaw/Simple-Form/zipball/master and unzip it to your project root directory.

#### Add Simple Form project to your workspace

Add Simple Form project to Project navigator. To do this, drag *ITForm.xcodeproj* from the Finder to your project navigator panel

#### Add public headers to search path

Open your project's build settings and add *"$(SOURCE_ROOT)/ITForm/ITForm"* to **Header Search paths**.


#### Copy Resources directory
And copy Resources to your project (if you want to use standart images)