# NCU-Latex-Templeate

## 編譯順序

>* 順序=Xelatex + Bibtex + makeindex + Xelatex + Xelatex
>	
>* 如果沒有使用Bibtex請拿掉
>	
>* 使用window用戶可以直接跑Script.bat，會自動幫你編譯Main.tex，
>	
>* 如果主檔案更名，請改把主tex檔案拖拉到Script上


## build成功的範例檔案為
>* [NCU_thesis_sample.pdf](https://github.com/RainJayTsai/NCU-Latex-Templeate/blob/master/NCU_thesis_sample.pdf)
    

## Todo List 用法
用法

* `\todo[inline]{需要記錄的事情}`

當完稿時請把
* `\usepackage[]{todonotes}`% 約在第四行

改成
* `\usepackage[disable]{todonotes}`% 約在第四行
    
        
		
## cover Logo
*  `\logo{NCUlogo}   %中央校徽在封面`

* ##### 不要封面有校徽請註解掉
    

## 浮水印
1. 在mypreamble.tex中取消下面註解

    * `\usepackage{background} %取消整串註解，`
        
2. 並在ncuthesisXe.cls檔案中找出
 
    * `\renewcommand\bg@material{}  %並取消註解，以確保cover不會產生浮水印`
    

## 換段落
>請案兩次enter
    

## 章節結構
	\chapter{章名} % 宣告某章開始
		\section{節名一} % 宣告某節開始
		\section{節名二}
			\subsection{小節名} % 宣告小節開始
				\subsubsection{小小節名} % 宣告小小節開始
