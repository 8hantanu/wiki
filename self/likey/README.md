---
cars:
  - title: Renault R17 Restomod
    image: https://www.ora-ito.com/wp-content/uploads/2024/10/R17_04_1960x1120-980x560.jpg
    about: A retro-futuritic sports coupe mod of the classic Renault R17
    refer: https://www.ora-ito.com/studio/projects/r17-electric-restomod/
  - image: https://www.globalsuzuki.com/automobile/lineup/jimny/img/slide/key_img05.jpg
    title: Suzuki Jimny
    about: If I could have any SUV this would be it
    refer: https://www.globalsuzuki.com/automobile/lineup/jimny/
---

# Me likey 💖

Places, people, products that I like.

{% assign collections = page.cars %}
{% include collection.html collection = collections randomize = true %}