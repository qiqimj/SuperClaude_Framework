# Cursor 配置模板使用指南

这个指南将帮助您理解如何使用 `.cursorrules.template` 为您的项目配置 Cursor AI 助手。

## 📖 什么是 .cursorrules？

`.cursorrules` 是 Cursor IDE 用来理解您项目的配置文件。它告诉 AI：
- 您的项目使用什么技术栈
- 如何运行测试和构建
- 代码风格和命名规范
- 项目结构和最佳实践

**好处**：
- ✅ AI 生成的代码更符合您的项目规范
- ✅ 减少来回沟通，提高效率
- ✅ 新团队成员可以快速了解项目标准
- ✅ 跨项目使用相同的模板保持一致性

## 🚀 快速开始

### 方法一：新项目使用模板

```bash
# 1. 复制模板到您的新项目
cp /path/to/.cursorrules.template /path/to/your-project/.cursorrules

# 2. 编辑 .cursorrules 文件
cd /path/to/your-project
code .cursorrules  # 或使用您喜欢的编辑器

# 3. 搜索并替换所有 [CUSTOMIZE] 标记
# 填写您项目特定的信息

# 4. 删除模板说明部分（文件末尾）
```

### 方法二：现有项目添加配置

如果您已有项目，按照相同步骤操作，但要注意：
- 先了解项目现有的规范和约定
- 与团队确认配置内容
- 逐步完善，不必一次性填写所有内容

## 📝 自定义步骤详解

### Step 1: 项目基本信息

找到文件顶部的项目概述部分：

```markdown
## 📋 Project Overview
[CUSTOMIZE] Project Name: [Your Project Name]
[CUSTOMIZE] Description: [Brief description of what this project does]
[CUSTOMIZE] Tech Stack: [e.g., Python, TypeScript, React, Django, etc.]
[CUSTOMIZE] Version: [Current version]
```

**示例填写**：
```markdown
## 📋 Project Overview
Project Name: E-Commerce API
Description: RESTful API for online shopping platform with user management and payment processing
Tech Stack: Python 3.11, FastAPI, PostgreSQL, Redis, Docker
Version: 2.3.0
```

### Step 2: 包管理器和命令

这是**最重要**的部分！告诉 AI 如何运行您的项目：

```bash
### Package Manager
Primary: uv  # 或 npm, pnpm, poetry, etc.

### Build & Test Commands
```bash
# Install dependencies
uv pip install -e .

# Run tests
uv run pytest

# Build
make build

# Lint & Format
uv run ruff check
```
```

**常见包管理器配置**：

<details>
<summary>Python + UV</summary>

```bash
# Install dependencies
uv pip install -e .

# Run tests
uv run pytest

# Lint & Format
uv run ruff check
uv run ruff format
```
</details>

<details>
<summary>Node.js + pnpm</summary>

```bash
# Install dependencies
pnpm install

# Run tests
pnpm test

# Build
pnpm build

# Lint & Format
pnpm lint
pnpm format
```
</details>

<details>
<summary>Python + Poetry</summary>

```bash
# Install dependencies
poetry install

# Run tests
poetry run pytest

# Lint & Format
poetry run black .
poetry run flake8
```
</details>

<details>
<summary>Rust + Cargo</summary>

```bash
# Install dependencies
cargo build

# Run tests
cargo test

# Lint & Format
cargo clippy
cargo fmt
```
</details>

### Step 3: 项目结构

根据您的实际项目结构填写：

```markdown
## 📂 Project Structure

src/
├── api/              # API endpoints
├── models/           # Database models
├── services/         # Business logic
├── utils/            # Helper functions
└── tests/            # Test files

docs/                 # Documentation
config/               # Configuration files
scripts/              # Automation scripts
```

**技巧**：可以运行 `tree -L 2 -d` 查看项目结构

### Step 4: 代码风格

填写您团队使用的代码规范：

**Python 项目示例**：
```markdown
### Naming Conventions
- Files: `snake_case.py`
- Functions: `snake_case()`
- Classes: `PascalCase`
- Constants: `UPPER_SNAKE_CASE`

### Code Formatting
- Line length: 88 chars (Black default)
- Indentation: 4 spaces
- Quotes: Double quotes
- Formatter: Black + isort
```

**TypeScript 项目示例**：
```markdown
### Naming Conventions
- Files: `kebab-case.tsx`
- Functions: `camelCase()`
- Classes: `PascalCase`
- Constants: `UPPER_SNAKE_CASE`

### Code Formatting
- Line length: 100 chars
- Indentation: 2 spaces
- Quotes: Single quotes
- Formatter: Prettier + ESLint
```

### Step 5: 测试标准

告诉 AI 您的测试要求：

```markdown
## 🧪 Testing Standards

### Test Organization
- Unit tests: `tests/unit/`
- Integration tests: `tests/integration/`
- E2E tests: `tests/e2e/`

### Test Requirements
- All new features must include tests
- Minimum coverage: 80%
- Test file naming: `test_*.py`
```

### Step 6: Git 工作流

配置您的分支和提交规范：

```markdown
## 🌿 Git Workflow

### Branch Naming
- Features: `feature/user-authentication`
- Bug fixes: `fix/login-error`
- Documentation: `docs/api-guide`

### Commit Convention (Conventional Commits)
feat(auth): add JWT token validation
fix(api): handle timeout in payment service
docs: update deployment guide
```

## 🎯 实际应用示例

### 示例 1: Python FastAPI 项目

```markdown
## 📋 Project Overview
Project Name: Task Management API
Description: RESTful API for team task tracking with real-time notifications
Tech Stack: Python 3.11, FastAPI, PostgreSQL, Redis, WebSocket
Version: 1.0.0

## 🔧 Development Environment

### Package Manager
Primary: uv

**Critical Rules**:
- Always use `uv run` for Python commands
- Never use `python -m` or `pip install` directly

### Build & Test Commands
```bash
# Install dependencies
uv pip install -e ".[dev]"

# Run tests
uv run pytest -v

# Run with coverage
uv run pytest --cov=src

# Start dev server
uv run uvicorn src.main:app --reload

# Lint & Format
uv run ruff check .
uv run ruff format .
```

## 📂 Project Structure
```
src/
├── api/              # API route handlers
│   ├── v1/          # API version 1
│   └── deps.py      # Dependencies
├── core/             # Core functionality
│   ├── config.py    # Settings
│   └── security.py  # Auth logic
├── models/           # SQLAlchemy models
├── schemas/          # Pydantic schemas
└── tests/            # Test files
```

### Naming Conventions
- Files: `snake_case.py`
- Functions: `snake_case()`
- Classes: `PascalCase`
- API endpoints: `/api/v1/tasks` (lowercase, plural)

### Framework-Specific Rules
- Use Pydantic v2 for all schemas
- Use dependency injection for database sessions
- All endpoints must have OpenAPI documentation
- Use HTTPException for error responses
```

### 示例 2: React TypeScript 项目

```markdown
## 📋 Project Overview
Project Name: Dashboard UI
Description: Admin dashboard with real-time analytics and user management
Tech Stack: React 18, TypeScript, Vite, TailwindCSS, React Query
Version: 2.1.0

## 🔧 Development Environment

### Package Manager
Primary: pnpm

**Critical Rules**:
- Always use `pnpm` not `npm`
- Lock file: `pnpm-lock.yaml` must be committed

### Build & Test Commands
```bash
# Install dependencies
pnpm install

# Run tests
pnpm test

# Start dev server
pnpm dev

# Build for production
pnpm build

# Lint & Format
pnpm lint
pnpm format
```

## 📂 Project Structure
```
src/
├── components/       # Reusable components
│   ├── ui/          # Base UI components
│   └── features/    # Feature-specific components
├── pages/            # Page components
├── hooks/            # Custom React hooks
├── services/         # API services
├── types/            # TypeScript types
└── utils/            # Helper functions
```

### Naming Conventions
- Components: `PascalCase.tsx`
- Hooks: `useCamelCase.ts`
- Utils: `camelCase.ts`
- Types: `PascalCase.types.ts`

### Code Formatting
- Line length: 100 chars
- Indentation: 2 spaces
- Quotes: Single quotes
- Formatter: Prettier

### Framework-Specific Rules
- Use functional components with hooks only
- Prefer named exports over default exports
- Use React Query for data fetching
- Keep components under 150 lines
- Use TypeScript strict mode
```

## 💡 最佳实践

### 1. 保持简洁

不要写太多规则，AI 会被淹没。重点关注：
- 必须遵守的命令（如包管理器）
- 代码风格约定
- 项目结构

### 2. 定期更新

项目演进时，同步更新 `.cursorrules`：
- 技术栈升级
- 新的约定加入
- 废弃的规则移除

### 3. 团队协作

如果是团队项目：
- 将 `.cursorrules` 提交到 Git
- 团队成员共同维护
- 在 PR 中审查变更

### 4. 渐进式完善

不必一次性填完所有内容：
1. 第一步：填写基本信息和常用命令
2. 第二步：添加代码规范和项目结构
3. 第三步：补充测试、部署等细节

### 5. 使用示例代码

在规则中包含代码示例，让 AI 更容易理解：

```markdown
### Import Organization

Example:
```python
# Standard library
import os
from typing import List

# Third-party
import fastapi
from sqlalchemy import select

# Local
from .models import User
from .utils import hash_password
```
```

## 🔧 故障排查

### 问题 1: AI 没有遵循 .cursorrules

**可能原因**：
- 文件位置错误（必须在项目根目录）
- 文件名错误（必须是 `.cursorrules`）
- 规则描述不够清晰

**解决方法**：
```bash
# 检查文件是否存在
ls -la .cursorrules

# 确保文件在项目根目录
pwd
```

### 问题 2: 规则太多导致 AI 表现异常

**解决方法**：
- 简化规则，只保留最重要的
- 将详细文档放到单独的 CONTRIBUTING.md

### 问题 3: 不同项目经常忘记更新

**解决方法**：
- 创建项目初始化检查清单
- 使用项目模板工具（如 cookiecutter）

## 📚 进阶技巧

### 1. 多环境配置

如果有多个环境，可以说明差异：

```markdown
## 🚀 Deployment

### Environments
- Development: Local with hot reload
- Staging: https://staging.example.com (auto-deploy from `develop` branch)
- Production: https://example.com (manual deploy from `main` branch)
```

### 2. 集成 CI/CD 信息

```markdown
## 🛠️ CI/CD

- GitHub Actions runs on every PR
- Required checks: tests, lint, type-check
- Auto-deploy to staging on merge to `develop`
- Production deploy requires manual approval
```

### 3. 性能要求

```markdown
## ⚡ Performance Considerations

- Bundle size limit: 200KB (gzipped)
- Lighthouse score: >90
- API response time: <200ms (p95)
- Database queries: Use indexes, avoid N+1
```

## 🎓 学习资源

- [Cursor 官方文档](https://docs.cursor.com)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)

## 📞 需要帮助？

如果您在使用模板时遇到问题：
1. 查看本项目的 `.cursorrules` 作为参考示例
2. 参考 `examples/` 目录中的示例配置
3. 提交 Issue 获取帮助

---

**祝您使用愉快！** 🎉

记住：`.cursorrules` 是一个活文档，随着项目成长而演进。
