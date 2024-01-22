# Learnimal
An app that helps you know more about animal

--- 

### How do I make it?
To begin with, I was given project requirements documents. I read that then I start drafting on what should I do before I open Xcode and start writing codes. First of all, I am trying to understand each requirements stated in the documents, try to grasp as many things as possible. After get the main idea, I look after the specified API that listed below, the one that need to be used. I skim the documentation and see the example response.

Next, I try to create a UI so I can imagine what the end would look like, it helps me to visualize the approach I need to take, the coding steps, and etc. I come up with this image. I assuming that user needs to be able to see animal first time they see the homepage. And going with familiar view so they have natural instict to know what to do. That's why the things looks like Instagram and homepage looks like few app that has big image. And having tab bar interface make them easier to see the main feature of the app.

![](https://lh3.googleusercontent.com/pw/ABLVV8746tk6wregLRnt89Ndh0qB40Dey5BAy4LEGipDlU9I2_mfCZLrp8LU-IYuiTsPsz98q0D3j4qaAcTDajrSmKjWMIxKTKZRKiqWss5hYF4WhaXcy0S8QZ8kpm8g-DCqxG_H3ikizMthtnqXbQW3N24p41KMm8dAiauMNWG7Awp_9MwFZoEJo4rEuzjRQ-9uCHBUvtwyEOOzIZ1XkjrEqzI-OehMcQDgvwHQIRvcSuf-giLuxVSca3uhfozbKR3IrFj6BmtRQIJ2i5tLrdKkD36p6haMnXZinTND1ZoV1jRlA6c9dvuAgo9I1_--rJi5o8CeqAw5c-IxVlXGqa5tuKwE9wCMyWFR7ZU6E-6nPEIk3Ow0z8nONnb_V47fON8CnbHF2zKHH8o7vF5Q9AU9zhDuEcV_os2IfD4gWp0tHMvU3eUXBKXvRDS9d_ExFWdIFx9Yh8Tk8pwV3d8N-MjOg8XbcrkxNwohNMEFZzgWjm_zHg3nEF1VU-zf2CHmUkJu8AOJMpstozsyFT7o1QMGgXvVdm3NY7_s73LFpJ3tRkn6vDJ8LMYpt21dxTb4HaXXqag3eyXZ_gsUSt7uMvDKZcE9U8guELwc07ryMUCAU-8U3JOlfYwMk_RxOmlYW2UA2n9EhU4tOYTRgAH5MPTZFjCw-Mb9apdjSomEINK14x0FXNAPsWJPzVeijpAQHCHTLAQ8Z5e1ywIZ_LuXREMN9I3EpIzf-KrPEd4KPR-gxTV9R6uVCgA-toA2_MFJwXq5KbYSwBrtgPjyqyWsns4FXZyrLILJBH-RPhJRRwriJ98cJ8lzmrqhMo4GHu5Ml8F-fekruBKWkTiTkIweZtoF6L748oyEa7GR2GNEQmYZVZW_vzbNN0mqzA2pJxvz3dQqpJwJieU7fZQoKbs5OQ10hoUdO1c7ZMke=w2160-h1620-s-no?authuser=1)

After that, I elaborate on technical details, like what kind architecture will I use, should I use external framework or just natives one, should I use SwiftUI or UIKit, since there will be lots of images in the app, should I consider caching or not, and because I rarely work on Core Data on my previous company, since mostly data saved on the backend and just simple singleton/user preference, I need to dig more on that for current project.

Then I decide that will just use MVVM, that feels simple and fulfilling. For UI itself, I go with SwiftUI, it is easier and faster compared to UIKit. I can go with Storyboard but it feels heavy, programmatic approach can also be considered but creating constraint is longer and more complex. Coming to images part, I know that taking time to do caching would be more helpful to user experience, but I just rely on native behavior. To help that part, I know after I read the ImageAPI documentation, I can choose small image, so I'll go that way. And for how CoreData part, I took only Favorite part that interact with persistence storage.

When all the main idea is decided, I start to breakdown the task. Here's the flow that I take
1. Create interface with fake data
2. Implement basic business logic and make it work
3. Work on favorite feature using Singleton
4. Make api call and chain it with the existing code
5. Updating the Singleton to CoreData

And while working on it, I also found issue here and there so there are additional bugfix happening. Not to forget add Unit Test for certain part of the app.

---

### How to run the code?
It's very simple, just clone the repo and run it on Xcode. 
- The project itself has minimum requirements of iOS 17.2, nothing specific, it's just default settings.
- Also I run it on Xcode 15.1.
