# Cursor 模板 - 一键安装

## 🚀 快速使用

### 方法一：一键安装（推荐）

```bash
# 在这个项目中运行
chmod +x install-cursor-template.sh

# 安装到你的项目
./install-cursor-template.sh /path/to/your-project

# 或安装到当前目录
./install-cursor-template.sh .
```

### 方法二：手动复制

```bash
# 复制模板到你的项目
cp .cursorrules.template /path/to/your-project/.cursorrules
```

## ✏️ 填写配置（3分钟）

打开 `.cursorrules` 文件，搜索 `[CUSTOMIZE]`，填写你的项目信息：

```markdown
Project Name: [改成你的项目名]
Tech Stack: [改成你用的技术，如 Python, React, Django]

# 改成你的安装命令
npm install      # 或 pip install, uv run pytest, 等等

# 改成你的测试命令
npm test         # 或 pytest, cargo test, 等等
```

**只需要填这几项最重要**：
1. 项目名和技术栈
2. 安装依赖的命令
3. 运行测试的命令
4. 代码在哪个目录（如 `src/`, `app/`）

其他不重要的可以删掉。

## ✅ 完成

保存文件后，Cursor 的 AI 就会按照你的配置工作了。

## 📚 需要更多帮助？

查看 `CURSOR_TEMPLATE_GUIDE.md` 了解详细说明和示例。
