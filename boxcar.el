;;; boxcar.el --- boxcar integration for Emacs

;; Copyright (C) 2014 James Andariese

;; Author: James Andariese <james@strudelline.net>
;; Version: 1.0
;; Keywords: boxcar

;;; Commentary:

;; This package provides a function to send messages to your iPhone
;; through boxcar

;;;###autoload
(defun boxcar-send (title msg)
  (interactive "sTitle: \nsMessage: ")
  (start-process "boxcar.strudelline.net" nil
		     "curl"
                     "-d" (concat "user_credentials=" boxcar-auth)
		     "-d" (concat "notification[title]=" title)
		     "-d" (concat "notification[long_message]=" msg)
		     "https://new.boxcar.io/api/notifications"))

;;;###autoload
(defgroup boxcar nil
  "boxcar integration options"
  :group 'applications)

;;;###autoload
(defcustom boxcar-auth
  ""
  "boxcar auth token"
  :type '(string)
  :group 'boxcar)

;;; boxcar.el ends here
