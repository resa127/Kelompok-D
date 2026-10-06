# API Contract
## Sistem Informasi Seminar dan Sidang Berbasis Mobile

### 1. Base URL

`/api`

### 2. Standard JSON Response

#### Success Response

```json
{
  "status": "success",
  "message": "Request berhasil diproses",
  "data": {}
}

Error Response
{
  "status": "error",
  "message": "Terjadi kesalahan",
  "errors": {}
}

3. Authentication
API menggunakan autentikasi berbasis token.
Header:
Authorization: Bearer {token}
Accept: application/json
Content-Type: application/json

4. Roles
- student — Mahasiswa
- lecturer — Dosen
- admin — Administrator
5. Endpoint List
No	Method	Endpoint	Deskripsi
1	POST	/api/login	Login pengguna
2	POST	/api/logout	Logout pengguna
3	GET	/api/profile	Melihat profil pengguna
4	PATCH	/api/profile	Mengubah profil pengguna
5	GET	/api/registrations	Melihat daftar pendaftaran
6	POST	/api/registrations	Membuat pendaftaran seminar atau sidang
7	GET	/api/registrations/{id}	Melihat detail pendaftaran
8	PATCH	/api/registrations/{id}	Mengubah data pendaftaran
9	DELETE	/api/registrations/{id}	Membatalkan atau menghapus pendaftaran
10	GET	/api/documents	Melihat daftar dokumen
11	POST	/api/documents	Mengunggah dokumen
12	DELETE	/api/documents/{id}	Menghapus dokumen
13	GET	/api/schedules	Melihat jadwal seminar dan sidang
14	POST	/api/schedules	Membuat jadwal
15	PATCH	/api/schedules/{id}	Mengubah jadwal
16	DELETE	/api/schedules/{id}	Menghapus jadwal
```
### 6. Detail Endpoint

#### 6.1 Login

**Endpoint**

`POST /api/login`

**Request Body**

```json
{
  "email": "user@example.com",
  "password": "password123"
}

Success Response — 200
{
  "status": "success",
  "message": "Login berhasil",
  "data": {
    "token": "example_token",
    "user": {
      "id": 1,
      "name": "Nama Pengguna",
      "email": "user@example.com",
      "role": "student"
    }
  }
}

Error Response — 422
{
  "status": "error",
  "message": "Validasi gagal",
  "errors": {
    "email": [
      "Email wajib diisi"
    ],
    "password": [
      "Password wajib diisi"
    ]
  }
}

Error Response — 401
{
  "status": "error",
  "message": "Email atau password salah",
  "errors": null
}
#### 6.2 Logout

**Endpoint**

`POST /api/logout`

**Authentication**

Bearer Token

**Success Response — 200**

```json
{
  "status": "success",
  "message": "Logout berhasil",
  "data": null
}

Error Response — 401
{
  "status": "error",
  "message": "Pengguna belum terautentikasi",
  "errors": null
}

Error Response — 403
{
  "status": "error",
  "message": "Akses ditolak",
  "errors": null
}
#### 6.3 Lihat Profil

**Endpoint**

`GET /api/profile`

**Authentication**

Bearer Token

**Success Response — 200**

```json
{
  "status": "success",
  "message": "Data profil berhasil diambil",
  "data": {
    "id": 1,
    "name": "Nama Pengguna",
    "email": "user@example.com",
    "role": "student"
  }
}

Error Response — 401
{
  "status": "error",
  "message": "Pengguna belum terautentikasi",
  "errors": null
}

Error Response — 404
{
  "status": "error",
  "message": "Profil tidak ditemukan",
  "errors": null
}
#### 6.4 Ubah Profil

**Endpoint**

`PATCH /api/profile`

**Authentication**

Bearer Token

**Request Body**

```json
{
  "name": "Nama Pengguna Baru",
  "email": "userbaru@example.com"
}

Success Response — 200
{
  "status": "success",
  "message": "Profil berhasil diperbarui",
  "data": {
    "id": 1,
    "name": "Nama Pengguna Baru",
    "email": "userbaru@example.com",
    "role": "student"
  }
}

Error Response — 422
{
  "status": "error",
  "message": "Validasi gagal",
  "errors": {
    "email": [
      "Format email tidak valid"
    ]
  }
}

Error Response — 401
{
  "status": "error",
  "message": "Pengguna belum terautentikasi",
  "errors": null
}
#### 6.5 Lihat Daftar Pendaftaran

**Endpoint**

`GET /api/registrations`

**Authentication**

Bearer Token

**Success Response — 200**

```json
{
  "status": "success",
  "message": "Daftar pendaftaran berhasil diambil",
  "data": [
    {
      "id": 1,
      "student_id": 1,
      "type": "seminar",
      "title": "Sistem Informasi Seminar dan Sidang Berbasis Mobile",
      "status": "pending"
    }
  ]
}

Error Response — 401
{
  "status": "error",
  "message": "Pengguna belum terautentikasi",
  "errors": null
}

Error Response — 403
{
  "status": "error",
  "message": "Akses ditolak",
  "errors": null
}
#### 6.6 Membuat Pendaftaran

**Endpoint**

`POST /api/registrations`

**Authentication**

Bearer Token

**Request Body**

```json
{
  "type": "seminar",
  "title": "Sistem Informasi Seminar dan Sidang Berbasis Mobile"
}

Success Response — 201
{
  "status": "success",
  "message": "Pendaftaran berhasil dibuat",
  "data": {
    "id": 1,
    "student_id": 1,
    "type": "seminar",
    "title": "Sistem Informasi Seminar dan Sidang Berbasis Mobile",
    "status": "pending"
  }
}

Error Response — 422
{
  "status": "error",
  "message": "Validasi gagal",
  "errors": {
    "type": [
      "Jenis pendaftaran wajib diisi"
    ],
    "title": [
      "Judul wajib diisi"
    ]
  }
}

Error Response — 401
{
  "status": "error",
  "message": "Pengguna belum terautentikasi",
  "errors": null
}
#### 6.7 Detail Pendaftaran

**Endpoint**

`GET /api/registrations/{id}`

**Authentication**

Bearer Token

**Success Response — 200**

```json
{
  "status": "success",
  "message": "Detail pendaftaran berhasil diambil",
  "data": {
    "id": 1,
    "student_id": 1,
    "type": "seminar",
    "title": "Sistem Informasi Seminar dan Sidang Berbasis Mobile",
    "status": "pending"
  }
}

Error Response — 404
{
  "status": "error",
  "message": "Data pendaftaran tidak ditemukan",
  "errors": null
}

Error Response — 401
{
  "status": "error",
  "message": "Pengguna belum terautentikasi",
  "errors": null
}
#### 6.8 Ubah Pendaftaran

**Endpoint**

`PATCH /api/registrations/{id}`

**Authentication**

Bearer Token

**Request Body**

```json
{
  "type": "sidang",
  "title": "Sistem Informasi Seminar dan Sidang Berbasis Mobile"
}

Success Response — 200
{
  "status": "success",
  "message": "Pendaftaran berhasil diperbarui",
  "data": {
    "id": 1,
    "student_id": 1,
    "type": "sidang",
    "title": "Sistem Informasi Seminar dan Sidang Berbasis Mobile",
    "status": "pending"
  }
}

Error Response — 422
{
  "status": "error",
  "message": "Validasi gagal",
  "errors": {
    "type": [
      "Jenis pendaftaran tidak valid"
    ]
  }
}

Error Response — 404
{
  "status": "error",
  "message": "Data pendaftaran tidak ditemukan",
  "errors": null
}
#### 6.9 Hapus atau Batalkan Pendaftaran

**Endpoint**

`DELETE /api/registrations/{id}`

**Authentication**

Bearer Token

**Success Response — 200**

```json
{
  "status": "success",
  "message": "Pendaftaran berhasil dibatalkan",
  "data": null
}

Error Response — 404
{
  "status": "error",
  "message": "Data pendaftaran tidak ditemukan",
  "errors": null
}

Error Response — 403
{
  "status": "error",
  "message": "Anda tidak memiliki izin untuk membatalkan pendaftaran ini",
  "errors": null
}
#### 6.10 Lihat Daftar Dokumen

**Endpoint**

`GET /api/documents`

**Authentication**

Bearer Token

**Success Response — 200**

```json
{
  "status": "success",
  "message": "Daftar dokumen berhasil diambil",
  "data": [
    {
      "id": 1,
      "registration_id": 1,
      "document_type": "proposal",
      "file_path": "/uploads/proposal.pdf",
      "verification_status": "pending"
    }
  ]
}

Error Response — 401
{
  "status": "error",
  "message": "Pengguna belum terautentikasi",
  "errors": null
}

Error Response — 404
{
  "status": "error",
  "message": "Dokumen tidak ditemukan",
  "errors": null
}
#### 6.11 Upload Dokumen

**Endpoint**

`POST /api/documents`

**Authentication**

Bearer Token

**Request Body**

```json
{
  "registration_id": 1,
  "document_type": "proposal",
  "file_path": "/uploads/proposal.pdf"
}

Success Response — 201
{
  "status": "success",
  "message": "Dokumen berhasil diunggah",
  "data": {
    "id": 1,
    "registration_id": 1,
    "document_type": "proposal",
    "file_path": "/uploads/proposal.pdf",
    "verification_status": "pending"
  }
}

Error Response — 422
{
  "status": "error",
  "message": "Validasi gagal",
  "errors": {
    "registration_id": [
      "Pendaftaran wajib dipilih"
    ],
    "document_type": [
      "Jenis dokumen wajib diisi"
    ],
    "file_path": [
      "File wajib diunggah"
    ]
  }
}

Error Response — 401
{
  "status": "error",
  "message": "Pengguna belum terautentikasi",
  "errors": null
}
#### 6.12 Hapus Dokumen

**Endpoint**

`DELETE /api/documents/{id}`

**Authentication**

Bearer Token

**Success Response — 200**

```json
{
  "status": "success",
  "message": "Dokumen berhasil dihapus",
  "data": null
}

Error Response — 404
{
  "status": "error",
  "message": "Dokumen tidak ditemukan",
  "errors": null
}

Error Response — 403
{
  "status": "error",
  "message": "Anda tidak memiliki izin untuk menghapus dokumen ini",
  "errors": null
}
#### 6.13 Lihat Jadwal

**Endpoint**

`GET /api/schedules`

**Authentication**

Bearer Token

**Success Response — 200**

```json
{
  "status": "success",
  "message": "Daftar jadwal berhasil diambil",
  "data": [
    {
      "id": 1,
      "registration_id": 1,
      "schedule_date": "2026-10-20",
      "start_time": "09:00:00",
      "room": "Ruang Sidang 1"
    }
  ]
#### 6.14 Membuat Jadwal

**Endpoint**

`POST /api/schedules`

**Authentication**

Bearer Token

**Request Body**

```json
{
  "registration_id": 1,
  "schedule_date": "2026-10-20",
  "start_time": "09:00:00",
  "room": "Ruang Sidang 1"
}

Success Response — 201
{
  "status": "success",
  "message": "Jadwal berhasil dibuat",
  "data": {
    "id": 1,
    "registration_id": 1,
    "schedule_date": "2026-10-20",
    "start_time": "09:00:00",
    "room": "Ruang Sidang 1"
  }
}

Error Response — 422
{
  "status": "error",
  "message": "Validasi gagal",
  "errors": {
    "registration_id": [
      "Pendaftaran wajib dipilih"
    ],
    "schedule_date": [
      "Tanggal jadwal wajib diisi"
    ],
    "start_time": [
      "Waktu mulai wajib diisi"
    ],
    "room": [
      "Ruangan wajib diisi"
    ]
  }
}

Error Response — 403
{
  "status": "error",
  "message": "Anda tidak memiliki izin untuk membuat jadwal",
  "errors": null
}
#### 6.15 Ubah Jadwal

**Endpoint**

`PATCH /api/schedules/{id}`

**Authentication**

Bearer Token

**Request Body**

```json
{
  "schedule_date": "2026-10-21",
  "start_time": "10:00:00",
  "room": "Ruang Sidang 2"
}

Success Response — 200
{
  "status": "success",
  "message": "Jadwal berhasil diperbarui",
  "data": {
    "id": 1,
    "registration_id": 1,
    "schedule_date": "2026-10-21",
    "start_time": "10:00:00",
    "room": "Ruang Sidang 2"
  }
}

Error Response — 422
{
  "status": "error",
  "message": "Validasi gagal",
  "errors": {
    "schedule_date": [
      "Tanggal jadwal tidak valid"
    ]
  }
}

Error Response — 404
{
  "status": "error",
  "message": "Jadwal tidak ditemukan",
  "errors": null
}
#### 6.16 Hapus Jadwal

**Endpoint**

`DELETE /api/schedules/{id}`

**Authentication**

Bearer Token

**Success Response — 200**

```json
{
  "status": "success",
  "message": "Jadwal berhasil dihapus",
  "data": null
}

Error Response — 404
{
  "status": "error",
  "message": "Jadwal tidak ditemukan",
  "errors": null
}

Error Response — 403
{
  "status": "error",
  "message": "Anda tidak memiliki izin untuk menghapus jadwal",
  "errors": null
}
### 7. Role-Permission Matrix

| No | Endpoint | Student | Lecturer | Admin |
|---|---|---|---|---|
| 1 | `POST /api/login` | ✓ | ✓ | ✓ |
| 2 | `POST /api/logout` | ✓ | ✓ | ✓ |
| 3 | `GET /api/profile` | ✓ | ✓ | ✓ |
| 4 | `PATCH /api/profile` | ✓ | ✓ | ✓ |
| 5 | `GET /api/registrations` | ✓ | ✓ | ✓ |
| 6 | `POST /api/registrations` | ✓ | ✗ | ✗ |
| 7 | `GET /api/registrations/{id}` | ✓ | ✓ | ✓ |
| 8 | `PATCH /api/registrations/{id}` | ✓ | ✗ | ✓ |
| 9 | `DELETE /api/registrations/{id}` | ✓ | ✗ | ✓ |
| 10 | `GET /api/documents` | ✓ | ✓ | ✓ |
| 11 | `POST /api/documents` | ✓ | ✗ | ✓ |
| 12 | `DELETE /api/documents/{id}` | ✓ | ✗ | ✓ |
| 13 | `GET /api/schedules` | ✓ | ✓ | ✓ |
| 14 | `POST /api/schedules` | ✗ | ✗ | ✓ |
| 15 | `PATCH /api/schedules/{id}` | ✗ | ✗ | ✓ |
| 16 | `DELETE /api/schedules/{id}` | ✗ | ✗ | ✓ |

**Keterangan:**
- ✓ = Diizinkan
- ✗ = Tidak diizinkan
- Student hanya dapat mengubah atau menghapus data miliknya sendiri.
- Admin memiliki hak pengelolaan seluruh data.
- Lecturer dapat melihat data pendaftaran, dokumen, dan jadwal seminar atau sidang.
}

Error Response — 401
{
  "status": "error",
  "message": "Pengguna belum terautentikasi",
  "errors": null
}

Error Response — 404
{
  "status": "error",
  "message": "Jadwal tidak ditemukan",
  "errors": null
}
### 8. Error Handling

API menggunakan HTTP status code yang konsisten.

| Status Code | Arti |
|---|---|
| 200 | Request berhasil |
| 201 | Data berhasil dibuat |
| 401 | Pengguna belum terautentikasi |
| 403 | Pengguna tidak memiliki izin |
| 404 | Data tidak ditemukan |
| 422 | Validasi request gagal |
| 500 | Terjadi kesalahan pada server |

### 9. Changelog

#### v1.0
- Membuat rancangan awal API.
- Menambahkan endpoint autentikasi.
- Menambahkan endpoint profil pengguna.
- Menambahkan endpoint pendaftaran seminar dan sidang.
- Menambahkan endpoint dokumen.
- Menambahkan endpoint jadwal.
- Menambahkan standard JSON response.
- Menambahkan error handling.
- Menambahkan role-permission matrix.
