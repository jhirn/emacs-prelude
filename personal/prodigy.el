(require 'prodigy)

(prodigy-define-tag
  :name 'docker)

(prodigy-define-tag
  :name 'thin
  :ready-message "Listening on 0\\.0\\.0\\.0:[0-9]+, CTRL\\+C to stop")

(prodigy-define-tag
  :name 'webrick
  :ready-message "WEBrick::HTTPServer#start: pid=[0-9]+ port=[0-9]+")

(prodigy-define-tag
  :name 'mongrel
  :ready-message "Ctrl-C to shutdown server")

(prodigy-define-tag
  :name 'rails
  :tags '(thin mongrel webrick))

(defun prodigy-define-docker-compose (project cwd)
  (prodigy-define-service
    :name (concat project "-services")
    :command "docker-compose"
    :args '("up")
    :cwd cwd
    :tags '(docker)))

(defun prodigy-define-rails-server (project cwd)
  (prodigy-define-service
    :name project
    :command "bundle"
    :args '("exec" "rails" "server")
    :cwd cwd
    :tags '(docker)))


(let ((project "vivor")
      (cwd "~/src/devmynd/vivor"))
  (prodigy-define-docker-compose project cwd)
  (prodigy-define-rails-server project cwd))
