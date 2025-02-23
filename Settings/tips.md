**Q1: how to add updated timestamp in the template?**

A1: Use `Update Time on Edit` plugin and then in the template add:

```
---
created: {{date:YYYY-MM-DD}} {{time:HH:mm:ss}}
updated: {{date:YYYY-MM-DD}} {{time:HH:mm:ss}}  # This will be updated automatically
---
```
