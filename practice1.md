## リクエストからレスポンスまでの流れについて(GET 編)

##### ① クライアントからのリクエストが URL（/users)としてアプリケーションのルーティングに届く

##### ② ルーティングがファイル（routes.rb)に設定されている通りに、URL と HTTP メソッド（/users だと GET)の組み合わせからコントローラーとアクションを特定する

resources メソッドによりアクションに関するルーティングを一括で設定する

```
(routes.rb)

Rails.application.routes.draw do
root to: 'tasks#index'
resources :tasks
end

```

Request URL と Request Method からルーティングがコントローラーとアクションを特定する
[![Image from Gyazo](https://i.gyazo.com/847d96809f536ad7fde325629d65a994.png)](https://gyazo.com/847d96809f536ad7fde325629d65a994)
今回の場合は、ユーザーの一覧表示がしたいので、tasks_controller の index アクションを使う

```

(tasks_controller.rb)

class TasksController < ApplicationController
def index
@tasks = Task.all
end
end

```

##### ③ コントローラー内のアクションでモデルとのやりとりを行なってデータベースから必要なデータを取得する

全ユーザーのデータを表示したいので、インスタンス変数の@tasks に all メソッドを使ってデータベースの情報を格納する

```

(tasks_controller.rb)

def index
@tasks = Task.all
end

```

##### ④ ビューの作成

アクションで定義したインスタンス変数の@tasks を使って、ユーザーの名前と作成日時を表示する

```

(index.html.slim)

@tasks.each do |task|
tr
td = link_to task.name, task
td = task.created_at

```

レスポンスとして表示される HTML ファイル
[![Image from Gyazo](https://i.gyazo.com/f5bf4c72760fb19cd1ae3377e5532966.png)](https://gyazo.com/f5bf4c72760fb19cd1ae3377e5532966)

## リクエストからレスポンスまでの流れについて(POST 編)

##### ① クライアントからのリクエストが URL(tasks/new)としてルーティングに届く

##### ② ルーティングがファイル（routes.rb)に設定されている通りに、URL と HTTP メソッド（/tasks/new だと GET)の組み合わせからコントローラーとアクションを特定する

resources メソッドによりアクションに関するルーティングを一括設定

```

(routes.rb)

Rails.application.routes.draw do
root to: 'tasks#index'
resources :tasks
end

```

RequestURL が tasks/new、RequestMethod が GET
[![Image from Gyazo](https://i.gyazo.com/a980f5b4b1483b56677ea61dbcfdc4e1.png)](https://gyazo.com/a980f5b4b1483b56677ea61dbcfdc4e1)
今回は新規登録を行いたいので、tasks_controller の new アクションを使う

```

(tasks_controller.rb)

class TasksController < ApplicationController
def new
@task = Task.new
end
end

```

##### ③ オブジェクトの作成

new メソッドを使って空のインスタンス変数の@task を作る

```

(tasks_controller.rb)

def new
@task = Task.new
end

```

##### ④ ビューの作成

form_with メソッドを使って、フォームの送信に必要な HTML を作成する

```

(new.html.slim)

= form_with model: @task, local: true do |f|
.form-group
= f.label :name
= f.text_field :name, class: 'form-control', id: 'task_name'
.form-group
= f.label :description
= f.text_area :description,rows: 5, class: 'form-control', id: 'task_description'
= f.submit nil, class: 'btn btn-primary'

```

##### ⑤ 新規作成ページで form_with で作られた入力欄にタスク名を打ち込む

##### ⑥ 作成ボタンを押す

form_with で POST メソッドを使うことが設定されている
[![Image from Gyazo](https://i.gyazo.com/739dc277ddcd28a7d294f16bebc08fb9.png)](https://gyazo.com/739dc277ddcd28a7d294f16bebc08fb9)

#### ⑦/tasks に対して POST リクエストが送られると routes.rb の resources :tasks で対応する tasks_controller の create アクションが実行される

task_params で取得したデータを task に代入して変数を作成
save メソッドを使って、データベースにデータを保存

```

def create
task = Task.new(task_params)
task.save!
redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました"
end

```

##### ⑦ridirect_to メソッドによって、タスクの詳細画面に遷移する

redirect_to メソッドを使って、詳細画面に遷移する

```

redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました"

```

```

```
