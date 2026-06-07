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
\[_<VAULT_CONTEXT>_\]_OWNERS_ROLE_MATRIX_.tsv
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

### 
🧬 ACL SMART STRING — Detailed Model

The **ACL_SMART_STRING** is the core normalization format used by the ToolBox.

It provides a **compact, deterministic, and reversible representation** of CyberArk Safe permissions.

---

### 🔹 Global Format

Example:

#_LuR_CPWTnrDU_SmOaB_A_N_mcd_#

---

Structure:


#<ACCOUNT_PERMISSIONS><SAFE_PERMISSIONS>#

Each character represents a **specific permission** as defined in the CyberArk PVWA permission panel.

---

### 🔹 Permission Encoding

Each letter corresponds to a permission:

#### 📦 Account Permissions

| Letter | Meaning |
|--------|--------|
| L | List accounts |
| u | Use accounts |
| R | Retrieve / View secret |

---

#### 🔧 Account Management

| Letter | Meaning |
|--------|--------|
| C | Create accounts |
| P | Modify properties |
| W | Update password |
| T | CPM operations |
| n | Specify next password |
| r | Rename account |
| D | Delete account |
| U | Unlock account |

---

#### 🛡️ Safe Permissions

| Letter | Meaning |
|--------|--------|
| S | Manage Safe |
| m | View members |
| O | Manage owners |
| a | View audit |
| B | Backup |

---

#### ✅ Access Control

| Letter | Meaning |
|--------|--------|
| A | Approve requests |
| _ | Confirmation level placeholder |
| N | No confirmation required |

---

#### 📁 Folder Permissions

| Letter | Meaning |
|--------|--------|
| m | Move |
| c | Create folder |
| d | Delete folder |

---

### 🔹 Key Characteristics

- ✅ Fully reversible
- ✅ Deterministic encoding
- ✅ No information loss
- ✅ Supports unknown patterns (preserved as-is)

---

🔴 **[PLACEHOLDER — ADD ACL SMART STRING PERMISSION TABLE SCREENSHOT HERE]**

---

## 🧾 ACL ROLE MATRIX

The ToolBox converts SMART_STRING into **human-readable roles** using configurable matrices.

---

### 🔹 Example — Internal Roles

| SMART_STRING Pattern | Role |
|----------------------|------|
| `#_LuR_CPWTnrDU_SmOaB_A_N_mcd_#` | (M)_MASTER_(M) |
| `#_LuR_CPWTnrDU_SmOaB_A__N_mcd_#` | (M)_SUPER_ADMIN_(M) |

---

### 🔹 Example — CyberArk Default Roles

| SMART_STRING Pattern | Role |
|----------------------|------|
| `#_Lu__________________________#` | (C)_CONNECT_ONLY_(C) |
| `#_LuR_________________________#` | (C)_READ_ONLY_(C) |
| `#_LuR___________mOa___A_______#` | (C)_APPROVER_(C) |

---

### 🔹 Example — End-User Roles

| SMART_STRING Pattern | Role |
|----------------------|------|
| `#_LuR_____T____m_____#` | (R)_END-USER_(R) |
| `#_LuR_WT___U___m_____#` | (R)_END-USER+UNLOCKER_(R) |

---

### 🔹 Example — Technical Roles

| SMART_STRING Pattern | Role |
|----------------------|------|
| `#_LuR_CPWTnrDU__a____mcd_#` | (T)_CPM_ENGINE_(T) |
| `#_Lu_______U___________#` | (T)_PSM_UNLOCKER_(T) |

---

### 🔹 Example — Internal Built-in Roles

| SMART_STRING Pattern | Role |
|----------------------|------|
| `#______________B_________#` | (i)_BACKUP_(i) |
| `#_L____________m________#` | (i)_AUDITOR_(i) |
| `#_Lu_______U____mcd______#` | (i)_OPERATOR_(i) |

---

### 🔹 Special Case

| SMART_STRING Pattern | Role |
|----------------------|------|
| `#________________________#` | (?)_NO_PERMISSION_(?) |

---

🔴 **[PLACEHOLDER — ADD ACL ROLE MATRIX SCREENSHOT HERE]**

---

## 🔄 Conversion Consistency

The ToolBox ensures:

- Forward conversion:

REST ACL → SMART_STRING → ROLE

- Reverse conversion:

ROLE → SMART_STRING → REST ACL

---

### ⚠️ Important

When updating role matrices:

- Update **conversion mapping (LogParser file #2)**
- Update **reverse mapping (LogParser file #3)**

👉 Both directions must remain consistent

---

## 🧠 Design Insight

The SMART_STRING model provides:

- ✅ A normalized identity for ACL sets  
- ✅ A comparison-friendly format  
- ✅ A bridge between:
  - Technical permissions (REST API)
  - Functional roles (human-readable)

---

👉 This enables:
- PivotTable aggregation
- Role-based analysis
- Governance reporting
- Automated remediation workflows

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
