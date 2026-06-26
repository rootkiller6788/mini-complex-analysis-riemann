# Mini Complex Analysis & Riemann Surfaces（迷你复分析与黎曼曲面）

一套**从零开始的 Lean 4 实现**，涵盖大学层次的复分析、全纯函数与黎曼曲面。每个子包对应 MIT 及其他顶尖大学课程，使用 Lean 4 证明助手和内核库从第一性原理构建复分析的基础。

## 子包

| 子包 | 主题 | 核心课程 |
|------|------|----------|
| [mini-complex-numbers](mini-complex-numbers/) | 复数、极坐标形式、棣莫弗公式、复平面拓扑 | MIT 18.04, Stanford Math 116 |
| [mini-holomorphic-functions](mini-holomorphic-functions/) | Cauchy-Riemann 方程、解析函数、幂级数、Liouville 定理 | MIT 18.04, Harvard Math 113 |
| [mini-complex-integration](mini-complex-integration/) | 围道积分、Cauchy 定理、留数演算、辐角原理 | MIT 18.04, Princeton MAT 325 |
| [mini-conformal-mapping](mini-conformal-mapping/) | 共形映射、Mobius 变换、黎曼映射定理 | MIT 18.04, Cambridge Part II |
| [mini-entire-harmonic](mini-entire-harmonic/) | 整函数、调和函数、Poisson 公式、Dirichlet 问题 | MIT 18.112, Berkeley Math 185 |
| [mini-meromorphic-functions](mini-meromorphic-functions/) | 极点、Laurent 级数、亚纯函数、Mittag-Leffler | MIT 18.112, Oxford Part B |
| [mini-special-functions](mini-special-functions/) | Gamma、Beta、Zeta 函数、椭圆函数、模形式导引 | MIT 18.112, Princeton MAT 330 |
| [mini-riemann-surfaces](mini-riemann-surfaces/) | 黎曼曲面、层上同调、Riemann-Roch、单值化 | MIT 18.117, Harvard Math 213a |

## 设计理念

- **零外部依赖** -- 纯 Lean 4，仅导入内核模块及同级子包
- **自包含子包** -- 每个子包拥有独立的 `lakefile.lean`、Core/、Morphisms/、Constructions/、Theorems/
- **理论到代码的映射** -- 每个模块包含内联 `#eval` 示例和定理陈述

## 构建

```bash
cd mini-complex-numbers
lake build
lake env lean --run Test/Smoke.lean
```

需要 **Lean 4** 和 **Lake**。

## 项目结构

```
7. mini-complex-analysis-riemann/
├── mini-complex-numbers/           # 复数、极坐标形式、拓扑
├── mini-holomorphic-functions/     # Cauchy-Riemann、解析函数、幂级数
├── mini-complex-integration/       # 围道积分、Cauchy 定理、留数
├── mini-conformal-mapping/         # 共形映射、Mobius、黎曼映射定理
├── mini-entire-harmonic/           # 整函数/调和函数、Poisson、Dirichlet
├── mini-meromorphic-functions/     # 极点、Laurent 级数、Mittag-Leffler
├── mini-special-functions/         # Gamma、Beta、Zeta、椭圆函数、模形式
└── mini-riemann-surfaces/          # 黎曼曲面、Riemann-Roch、单值化
```

## 许可证

MIT
