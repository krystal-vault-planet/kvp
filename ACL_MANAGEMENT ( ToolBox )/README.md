# 🚧 DRAFT VERSION — UNDER REVIEW BY CYBERARK FUN CLUB 🚧

---

# 🔐 ACL_MANAGEMENT (ToolBox)

## 📖 Overview

The **ACL_MANAGEMENT ToolBox** is a lightweight and modular framework designed to:

- Extract CyberArk Safe ACLs using REST API
- Normalize permission data using a compact encoding model
- Convert permissions into human-readable roles
- Perform controlled ACL updates (add / modify / suppress)
- Provide a visual governance layer using Excel PivotTables and Office Scripts

This solution is part of the **Krystal Vault Planet (KVP)** initiative and the **CyberArk Fun Club community**, and is intended for:

- Lab environments (KVS)
- Quick customer assessments
- PAM governance workflows

---

## 🏗️ Architecture Overview

       +----------------------+
       |   CyberArk PVWA API  |
       +----------+-----------+
                  |
                  v
         [ $1_INIT_.cmd ]
                  |
                  v
         [ $2_EXTRACT_ACL_.cmd ]
                  |
                  v
   REST ACL → SMART_STRING → ROLE
          (LogParser Engine)
                  |
                  v
  [_<VAULT_CONTEXT>_]_OWNERS_ROLE_MATRIX_.tsv
                  |
     +------------+-------------+
     |                          |
     v                          v
Excel / Pivot Analysis     ACL Update Scripts
|                          |
v                          v
Visual Feedback Layer     [ REFRESH / SUPPRESS ]
|
v
[ $4_TERM_.cmd ]


---

🔴 **[PLACEHOLDER — ADD ARCHITECTURE DIAGRAM SCREENSHOT HERE]**

---

## 📁 Folder Structure

### 📦 `bin/`
Contains:
- Executables (.exe)
- DLL libraries
- PowerShell scripts

👉 Used for:
- REST API communication
- ACL extraction and updates

---

### ⚙️ `cfg/`

Configuration files (one per Vault):


PVWA_URL=https:///PasswordVault
VAULT_CONTEXT=MYVAULT
MATRIX_CONTEXT=DEFAULT

- `VAULT_CONTEXT` prefixes:
  - logs
  - temp files
  - output
- Enables **multi-vault parallel execution**
- `MATRIX_CONTEXT` defines ACL conversion logic

---

### 🧠 `sql/`

Contains LogParser SQL logic:

- ACL → SMART_STRING
- SMART_STRING → ACL_ROLE
- Reverse transformations

---

### 📝 `log/`

- Execution logs
- Debug logs
- Prefixed by `VAULT_CONTEXT`

---

### 🧪 `tmp/`

- Intermediate processing files
- Automatically generated
- Prefixed by `VAULT_CONTEXT`

---

### 📊 `xls/`

Office Scripts for:

- Data formatting
- Pivot creation
- Refresh automation
- Visual feedback (coloring / marking)

---

### 📚 `doc/` (Planned)

Future documentation:
- Command guides
- Installation steps
- Processing explanation
- Test scenarios

---

## ⚙️ Command Workflow

### 🚀 `$1_INIT_.cmd`

- Prompts for config file
- Loads environment
- Authenticates via `curl` to PVWA
- Retrieves authentication token

✅ Best practice:
Use **Auditor account** for extraction

---

### 📥 `$2_EXTRACT_ACL_.cmd`

#### Features:
- Safe filtering (regex)
- ACL extraction via PowerShell
- Data consolidation

#### Conversion pipeline:

REST API → SMART_STRING → ACL_ROLE

#### Output:

[<VAULT_CONTEXT>]OWNERS_ROLE_MATRIX.tsv

#### Option:

-CONVERT-ONLY
→ Run conversion only

---

### 🔄 `$3_REFRESH_ACL_.cmd`

Input:

[<VAULT_CONTEXT>]ROLE_MATRIX#REFRESH#_.tsv

- Converts ROLE → REST ACL
- Applies modifications

#### Option:

-CONVERT-ONLY
→ Validation mode (no change)

✅ Requires privileged account

---

### ❌ `$3_SUPPRESS_ACL_.cmd`

Input:

[<VAULT_CONTEXT>]ROLE_MATRIX#SUPPRESS#_.tsv

- Removes permissions

#### Option:

-CONVERT-ONLY
→ Dry-run validation

✅ Requires privileged account

---

### 🔒 `$4_TERM_.cmd`

- Logs off from PVWA
- Clears session variables

---

## 🔁 ACL Conversion Model

### 🔹 SMART_STRING

- Compact format
- 1 character per permission

Example:

RWX--

---

### 🔹 ACL_ROLE

- Human-readable abstraction

Example:

FULL_ACCESS
READ_ONLY
SAFE_OWNER

---

✅ Unknown combinations are preserved  
✅ Conversion is reversible  
✅ Fully controlled by `MATRIX_CONTEXT`

---

## 📊 Excel Visualization Layer

---

### 📥 Import Data

1. Open Excel  
2. Go to **Data → From Text/CSV**  
3. Import file:


[<VAULT_CONTEXT>]OWNERS_ROLE_MATRIX.tsv

4. Ensure:
- Tab delimiter
- Correct column recognition

---

🔴 **[PLACEHOLDER — ADD RAW TSV IMPORT SCREENSHOT HERE]**

---

### 🧱 Format Table

Script:

ACL_MANAGEMENT_(1)_Format_Table.osts

- Normalize dataset
- Prepare for Pivot usage

---

### 📊 Create Pivot Table

Script:

ACL_MANAGEMENT_(2)_Create_PivTab.osts

Creates:
- Normalized ACL matrix
- SAFE / MEMBER / ROLE view

---

🔴 **[PLACEHOLDER — ADD PIVOT TABLE SCREENSHOT HERE]**

---

### 🔄 Refresh Pivot Table

Script:

ACL_MANAGEMENT_(3)_Refresh_PivTab.osts

- Re-applies formatting
- Cleans layout after refresh

👉 Recommended usage:
- Assign to Excel button

---

### ✏️ Mark Cells (Optional)

Script:

ACL_MANAGEMENT_(4)_Mark_Cells.osts

- Adds visual markers (cross)
- Supports manual review workflow

---

🔴 **[PLACEHOLDER — ADD MARK CELLS SCREENSHOT HERE]**

---

### 🎨 Color Feedback (Optional)

Script:

ACL_MANAGEMENT_(5)_Color_Feedback.osts

Adds visual cues:

| Color   | Meaning |
|--------|--------|
| YELLOW | Input dataset |
| ORANGE | Pivot results |
| BLUE   | SAFE / MEMBER / ROLE markers |

👉 Can also enrich source dataset

---

🔴 **[PLACEHOLDER — ADD COLOR FEEDBACK SCREENSHOT HERE]**

---

## 🧠 Key Design Principles

- ✅ Multi-vault support (VAULT_CONTEXT)
- ✅ Stateless execution model
- ✅ Reversible transformation pipeline
- ✅ Clear separation:
  - Extraction
  - Transformation
  - Action
  - Visualization

---

## 🚀 Use Cases

- CyberArk Safe ACL audit
- Permission review workshops
- Lab environments (KVS)
- Customer quick assessment
- Governance visualization

---

## ⚠️ Notes

- Provided **as-is**
- Community-based support
- Validate in lab before production use

---

## 🤝 Contribution

Part of:

- **Krystal Vault Planet (KVP)**
- **CyberArk Fun Club**

Contributions and feedback are welcome!
