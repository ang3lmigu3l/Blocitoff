
## Bloccit: A Self-discrupting To-do 

<p align="center"><img src="http://miguelquintana.xyz/img/blocitoff.png"  align="center" width= "500" ></p>



##A Simple To-Do App that aims to help you complete you To-Do item on a 7 day deadline. 

Blocitoff allows the user to create and manage their to-do items as well as encouraging the user to complete them before they expire. Blocitoff was my first project going solo and it allowed me to follow a User Story tool to complete the tasks that was ask for.

  * Uses rake task to delete List items after seven days if not completed . (*)
  * Integrates Ajax to create and Delete to-do Items . 
  * User authentication through Devise gem .

*
  ```
  desc "Delete Expired Items (7 days)"
  task delete_items: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
end
```

