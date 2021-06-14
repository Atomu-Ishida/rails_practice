### curl で記事を更新

```
curl -X PATCH -F 'article[title]=hoge2 updete' -F 'article[content]=fuga2 update' http://localhost:3000/articles/1
```

[![Image from Gyazo](https://i.gyazo.com/60932dbd0e3faed0ce916660caedf2f8.png)](https://gyazo.com/60932dbd0e3faed0ce916660caedf2f8)
<br>

### curl で記事を削除

```
curl -X DELETE http://localhost:3000/articles/1
```

<br>
### postmanで記事を更新
[![Image from Gyazo](https://i.gyazo.com/6d5642503e54b04f7f129ffeff55cb5f.png)](https://gyazo.com/6d5642503e54b04f7f129ffeff55cb5f)
<br>
### postmanで記事を削除
[![Image from Gyazo](https://i.gyazo.com/a91b8aa43fd3ed3b1768b01f5547440a.png)](https://gyazo.com/a91b8aa43fd3ed3b1768b01f5547440a)除
