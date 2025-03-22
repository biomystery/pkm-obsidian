---
created: { { date } }
tags: daily
---

1. 每日笔记模板

````markdown
## 📝 今日任务

```
TASK
WHERE file.day = date(today)
```
````

### 2. 任务记录格式

在每日笔记中用特定语法记录任务：

```markdown
- [ ] 任务描述
      ➕ 创建:: {{date:YYYY-MM-DD}}
      🔖 标签:: #项目 A
      🎯 截止:: 2025-03-25
      💡 优先级:: P1
```

---

## 二、Dataview 任务库

创建`00-任务总览.md`文件，包含以下查询：

````markdown
```
TASK
WHERE !completed
SORT 💡优先级 DESC, 🎯截止 ASC
GROUP BY 🔖标签
```
````

---

## 三、进阶功能实现

### 1. 状态追踪系统

在任务行添加状态标记：

```markdown
- [ ] 写会议纪要 ➕ 创建:: 2025-03-22 🔄 最后更新:: 2025-03-22 📌 状态:: #进行中
```

### 2. 自动进度统计

创建`00-项目进度.md`：

````markdown
```
TABLE WITHOUT ID
  "🟢 " + round((filter(rows, r).completed).length / length(rows)*100) + "%" AS 进度,
  length(rows) AS 总任务数
WHERE 🔖标签 = "项目A"
GROUP BY 🔖标签
```
````

---

## 四、使用流程

1. **每日记录**：在每日笔记中按模板新增任务
2. **全局查看**：打开`00-任务总览.md`查看所有任务
3. **状态更新**：直接勾选任务复选框完成状态同步
4. **进度追踪**：通过项目进度文件查看统计

---

## 五、优势特点

1. **纯文本管理**：所有数据存储在 Markdown 文件中
2. **动态更新**：Dataview 自动汇总最新状态
3. **多维视图**：通过不同查询实现按日期/标签/优先级查看
4. **零外部依赖**：仅需 Dataview 一个插件

**提示**：可通过`ctrl/command+E`快捷键快速插入任务模板字段，建议将常用字段保存为代码片段（Snippets）提升效率。
