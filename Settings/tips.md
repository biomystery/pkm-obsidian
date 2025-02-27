**Q1: how to add updated timestamp in the template?**

A: Use `Update Time on Edit` plugin and then in the template add:

```
---
created: {{date:YYYY-MM-DD}} {{time:HH:mm:ss}}
updated: {{date:YYYY-MM-DD}} {{time:HH:mm:ss}}  # This will be updated automatically
---
```

**Q2: How to enable vertical stack of tabs?**

A: Choose `Stack tabs` group: https://help.obsidian.md/tabs#Stack+tab+groups .

![vertical stack of tabs](https://user-images.githubusercontent.com/693981/188205363-0f24b2a5-3706-4a8c-b38b-7a66baa68ce6.gif)

**Q3: How to add integrated Terminal like VSCode?**

A: `Terminal` plugin; toggle off `Focus on new instance`; set hotkey for `Terminal: Open current directory in terminal: Intergrated`.
