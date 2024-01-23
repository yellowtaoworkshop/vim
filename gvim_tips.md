

# `vim` Registers 

## What are `vim` registers

You can think of registers as a bunch of spaces in memory that `vim` uses to store some text or operation details. Each of these spaces have a identifier, so it can be accessed later. 

In fact, registers are used everywhere in `vim`.  For example:

- When you delete or copy/yank some test, `vim` will put those texts into the register <kbd>“”</kbd> by default. 
- Once we execute an Ex command(<kbd>:command</kbd>) in `vim`, the register <kbd>“:</kbd> holds the command
- When we search text by <kbd>/pattern</kbd> or <kbd>?pattern</kbd>, the search pattern is stored in the <kbd>“/</kbd> or <kbd>”?</kbd>

## Types of `vim` registers  

- <kbd>”0</kbd> to <kbd>”9</kbd>:  Numbered registers "0 to "9

     Numbered register 0 contains the text from the most recent yank command, unless the command specified another register with ["x].
  
  Numbered register 1 contains the text deleted by the most recent delete or change command, unless the command specified another register or the text is less than one line (the small delete register is used then).  
  
  The "- register is used as well if the delete is within a line.
  
  With each successive deletion or change, Vim shifts the previous contents of register 1 into register 2, 2 into 3, and so forth, losing the previous
  contents of register 9.
  
- <kbd>“”</kbd>: unnamed register (the default register you use) 

  `Vim` fills this register with text deleted with the <kbd>d{motion]</kbd>, <kbd>c{motion}</kbd>, <kbd>s</kbd>, <kbd>x</kbd> commands or copied with the yank <kbd>y</kbd> command, regardless of whether or not a specific register was used (e.g.  "xdd).  This is like the unnamed register is pointing to the last used register.  An exception is the  register: <kbd>"_dd</kbd> does not store the deleted text in any register. 

  `Vim` uses the contents of the unnamed register for any put command (p or P) which does not specify a register.  Additionally you can access it with the name '"'.  This means you have to type two double quotes.  Writing to the ""register writes to register "0.

- <kbd>“+</kbd>: system clipboard register

- <kbd>“*</kbd>: system selection|primary register 

- <kbd>“=</kbd>: calculation register 

- <kbd>“%</kbd>: current file register 

- …

## Using the register 

- In normal mode: 

  For next delete, yank or put. 

  >  <kbd>“</kbd> + <kbd><reg_name></kbd>   

- In insert mode: (including the inserting in the command-line and buffer)

  > <kbd>CTRL</kbd> + <kbd>r</kbd>+ <kbd><reg_name></kbd>

- In command mode (put the contents of register into the buffer) 

  > <kbd>:</kbd> + <kbd>put</kbd> + <kbd>“</kbd> + <kbd><reg_name></kbd>  
  
- Copy the current file path to the CLIPBOARD or PRIMARY 

  Put the setting below into your vimrc:

  ```
  nnoremap <leader>cpfc :let @+ = expand("%:p")<cr>
  nnoremap <leader>cpfp :let @* = expand("%:p")<cr>
  ```

  

# Complex repeats 

## Demo video 

[repeat with recoding macro](https://synopsys-my.sharepoint.com/personal/taohua_synopsys_com/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Ftaohua_synopsys_com%2FDocuments%2FDocuments%2FZoom%2F2021-11-23 16.00.40 Gavin Huang's Zoom Meeting 95921385130%2Fcomplet_repeat_recoding.mp4&parent=%2Fpersonal%2Ftaohua_synopsys_com%2FDocuments%2FDocuments%2FZoom%2F2021-11-23 16.00.40 Gavin Huang's Zoom Meeting 95921385130)



## How to do

1. Record you actions 

   In normal mode, press the key sequence below:

   >  <kbd>q</kbd> + <kbd>a</kbd> (you can replace the <kbd>a</kbd> with <kbd>b</kbd> or <kbd>c</kbd> … or <kbd>z</kbd>)

   Note: 

   ​	The actions here should be generic and abstract, so that it fits for all other lines to which you want to replay the recoding. 

   ​	For example, 

   - do NOT use the <kbd>h</kbd>, <kbd>j</kbd>, <kbd>k</kbd> and <kbd>l</kbd> to move your cursor

   - It is recommended that we always start our action from a “fixed position” in each line. Like column 0. (press the <kbd>0</kbd>)

2. Stop recording 

   In normal mode, press the key below:

   > <kbd>q</kbd>  

   After the step 1 and 2, your repeat actions are restored in the register “a (or “b … “c)

3. Replay 

   Basically, you can replay your recoding by pressing the  key below in normal mode, then it will make the do the repeat action to the specific line. 

   > <kbd>@</kbd> + <kbd>a</kbd> (or <kbd>b</kbd> , <kbd>c</kbd>, … <kbd>z</kbd>), 

​		And you want to replay the recording multiple times , you can:

  -  Replay your recoding to the specific lines one by one

    In normal mode 

    > [number] <kbd>@</kbd> + <kbd>a</kbd> (or <kbd>b</kbd>, <kbd>c</kbd> … <kbd>z</kbd>) 

    By this way you can replay your recoding to the specific lines one by one, but if there are some issue in one execution, the sequential executions will be terminated.   -

  - Replay your recoding to the specific lines parallelly 

    In normal mode

    > 1. use the <kbd>SHIFT</kbd> + <kbd>v</kbd> to select the lines to which you want to replay the recoding

    > 2. <kbd>:</kbd> <kbd>n</kbd><kbd>o</kbd><kbd>r</kbd><kbd>m</kbd><kbd>a</kbd><kbd>l</kbd><kbd>@</kbd><kbd>a</kbd>(or <kbd>b</kbd>, <kbd>c</kbd> … <kbd>z</kbd>)



# Code snippet 

[UltiSnips ](https://github.com/SirVer/ultisnips)



# Ctags with vim

`ctags` is a tool which can generate a “*tag*” file with some specific format. And this “*tag*” file can be used by `gvim`. with that, you can jump the definition:

- for `C` language:

​		function , variable, …

- for `Verilog` | `SystemVerilog` language: 

  class, module, package, enum, all kinds of variable, function, task, covergroup, … 

- for `Perl`, `Python`, `Tcl` ….

  …

…‘presentation here’….. 

## How to configure 

1. copy the ctags configuration file for the SystemVerilog into your home directory  (to support the `SystemVerilog`)

   ```shell
   cp ~taohua/.ctags ~
   ```

2. Generate the tag file for the TB and RTL

   ```shell
   ctags -f $REPO_PATH/tags -R $REPO_PATH/verif/verif_categories/uvm/* $REPO_PATH/design/* 								
   ```

   **Note**:  

   ​		The default ctags program in our Linux Env isn’t the one we designed. We can use the *which* command to check if the default command is under the Emacs install path. If yes, we need to change it to the Exuberant Ctags in your alias setting files.

   ```shell
   #Supposed that you use the csh/tcsh
   alias ctags /depot/ctags-5.8/bin/ctags
   ```

3. add the following lines in your vimrc

   ```vimrc
   "tell the gvim where are your tags files
   set tags+=$REPO_PATH/tags
   
   "always shows all the tag, and you need enter the number to select which entry you want to jump (**optional**)
   nnoremap <C-]> :ts \<C-R\>\<C-W\>\<CR\>
   ```

   

4. put the cursor on the class/package/variable/module/interface.... name, and press the keys below: 

   - Go to the definition

     <kbd>Ctrl</kbd> + <kbd>]</kbd> 

   - Go back 

     <kbd>Ctrl</kbd> + <kbd>t</kbd>

   For example, currently, you cursor on the class name *hbm_base_test*, and you want to check the definition of this class. 

   ✔ The position of the cursor before you go to the definition.

   ![image-20210603215029368](C:\Users\taohua\AppData\Roaming\Typora\typora-user-images\image-20210603215029368.png)

   ✔ The position of the cursor after you go to the definition (<kbd>Ctrl</kbd> + <kbd>]</kbd>)

   ​		![image-20210603215619433](C:\Users\taohua\AppData\Roaming\Typora\typora-user-images\image-20210603215619433.png)

   ​		Now, you can move your cursor to go thought what you want to check. And if you want to go back, just press <kbd>Ctrl</kbd> + <kbd>t</kbd>, no matter where your cursor is on 

# Reproduce the tests in the CRDB 

## Features

- dump the waver 
- set the verbosity to UVM_LOW
- the run path will be associated with the changelist 
- reproduce multiple tests 
- update the change list of current local workspace to the one in CRDB (optional)
- compile the build if needed 
  - When you update the change list 
- run the tests automatically 
- …. 

All the action above just in one command 

**Note:** only tested in the

- DDR CRDB:

   - hwt test

   - mission mode test

   - ate test 
- HBM CRDB: 

## Script path: 

> /u/taohua/App/bin/dbgrf

use the option “-h” or “—help ” to get the help information 
