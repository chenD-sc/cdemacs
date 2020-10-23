(require 'pyim)
(require 'pyim-basedict)

(pyim-basedict-enable)
(setq default-input-method "pyim")

(setq pyim-default-scheme 'quanpin)

;; pyim探针设置,中英文动态切换规则:
;; 1. 光标只有在注释里面时，才可以输入中文。
;; 2. 光标前是汉字字符时，才可以输入中文。
;; 3. 使用 s-j 快捷键，强制将光标前的拼音字符串转换为中文。
(setq-default pyim-engine-input-switch-functions
              '(pyim-probe-dynamic-english
                pyim-probe-isearch-mode
                pyim-probe-program-mode
                pyim-probe-org-structure-template))

(setq-default pyim-punctuation-half-width-functions
              '(pyim-probe-punctuation-line-beginning
                pyim-probe-punctuation-after-punctuation))

;; 开启拼音搜索功能
(pyim-isearch-mode 1)

;;使用popup-el绘制选词框
(setq pyim-page-tooltip 'popup)
;; 选词显示5个候选词
(setq pyim-page-length 5)

(provide 'cda-pyim)
