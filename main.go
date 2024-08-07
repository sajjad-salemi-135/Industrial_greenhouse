package main

import (
	"database/sql"
	"fmt"
	"html/template"
	"net/http"

	_ "github.com/lib/pq"
)

const (
	host     = "localhost"
	port     = 5432
	user     = "postgres"
	password = "sajjad"
	dbname   = "postgres"
)

var db *sql.DB
var err error
var tpl *template.Template

func init() {
	tpl = template.Must(template.ParseGlob("./html/*"))
}

func main() {
	psqlInfo := fmt.Sprintf("host=%s port=%d user=%s "+
		"password=%s dbname=%s sslmode=disable",
		host, port, user, password, dbname)
	db, err = sql.Open("postgres", psqlInfo)
	check(err)
	defer db.Close()

	err = db.Ping()
	check(err)

	http.HandleFunc("/", index)
	http.HandleFunc("/show", show)
	http.HandleFunc("/insert", insert)
	http.HandleFunc("/insert_karmand", insert_karmand)
	http.HandleFunc("/insert_kood", insert_kood)
	// http.HandleFunc("/insert_hoghoogh", insert_hoghoogh)
	http.HandleFunc("/update", update)
	http.HandleFunc("/update_karmand", update_karmand)
	http.HandleFunc("/update_kood", update_kood)
	http.HandleFunc("/delete", delete)
	http.HandleFunc("/delete_karmand", delete_karmand)
	http.HandleFunc("/delete_kood", delete_kood)
	http.HandleFunc("/drop", drop)
	http.Handle("/favicon.ico", http.NotFoundHandler())
	err = http.ListenAndServe(":8080", nil)
	check(err)
}

func index(w http.ResponseWriter, req *http.Request) {
	tpl.ExecuteTemplate(w, "0.html", nil)
	check(err)
}



func show(w http.ResponseWriter, req *http.Request) {
	if req.Method == http.MethodPost {
		fmt.Fprint(w, "RECORDS:\n")
		a := req.FormValue("nametabel")
		Query := fmt.Sprintf("SELECT * FROM %s", a)
		rows, err := db.Query(Query)
		check(err)
		defer rows.Close()

		Columns, err := rows.Columns()
		check(err)

		values := make([]sql.RawBytes, len(Columns))

		scanArgs := make([]interface{}, len(values))
		for i := range values {
			scanArgs[i] = &values[i]
		}
		for rows.Next() {
			err = rows.Scan(scanArgs...)
			check(err)
			var value string
			for i, col := range values {
				if col == nil {
					value = "NULL"
				} else {
					value = string(col)
				}

				fmt.Fprint(w, Columns[i], ":", value, "\n")
			}
			fmt.Fprint(w, "-------------------\n")
		}
		http.Redirect(w, req, "/index", http.StatusSeeOther)
		return
	}
	tpl.ExecuteTemplate(w, "show.html", nil)
}

func insert(w http.ResponseWriter, req *http.Request) {
	tpl.ExecuteTemplate(w, "insert.html", nil)
	check(err)
}

func insert_karmand(w http.ResponseWriter, req *http.Request) {
	if req.Method == http.MethodPost {
		a := req.FormValue("code")
		b := req.FormValue("name")
		c := req.FormValue("semat")

		stmt, err := db.Prepare("INSERT INTO karmand VALUES($1,$2,$3)")
		check(err)
		defer stmt.Close()

		r, err := stmt.Exec(a, b, c)
		check(err)

		n, err := r.RowsAffected()
		check(err)

		fmt.Fprintln(w, "INSERTED RECORD", n)
		http.Redirect(w, req, "/insert", http.StatusSeeOther)
		return
	}
	tpl.ExecuteTemplate(w, "ikarmand.html", nil)
}

func insert_kood(w http.ResponseWriter, req *http.Request) {
	if req.Method == http.MethodPost {
		a := req.FormValue("id")
		b := req.FormValue("barcode")
		c := req.FormValue("name")
		d := req.FormValue("meghdar")
		e := req.FormValue("tolid")
		f := req.FormValue("engheza")

		stmt, err := db.Prepare("INSERT INTO kood VALUES($1,$2,$3,$4,$5,$6)")
		check(err)
		defer stmt.Close()

		r, err := stmt.Exec(a, b, c, d, e, f)
		check(err)

		n, err := r.RowsAffected()
		check(err)

		fmt.Fprintln(w, "INSERTED RECORD", n)
		http.Redirect(w, req, "/insert", http.StatusSeeOther)
		return
	}
	tpl.ExecuteTemplate(w, "ikood.html", nil)
}

func update(w http.ResponseWriter, req *http.Request) {
	tpl.ExecuteTemplate(w, "update.html", nil)
	check(err)
}

func update_karmand(w http.ResponseWriter, req *http.Request) {
	if req.Method == http.MethodPost {
		a := req.FormValue("code1")
		b := req.FormValue("name")
		c := req.FormValue("semat")
		d := req.FormValue("code0")

		stmt, err := db.Prepare("UPDATE karmand SET kode_meli=$1, name_karmand=$2, semat_karmand=$3 WHERE kode_meli=$4")
		check(err)
		defer stmt.Close()

		r, err := stmt.Exec(a, b, c, d)
		check(err)

		n, err := r.RowsAffected()
		check(err)

		fmt.Fprintln(w, "UPDATED RECORD", n)
		http.Redirect(w, req, "/index", http.StatusSeeOther)
		return
	}
	tpl.ExecuteTemplate(w, "ukarmand.html", nil)
}

func update_kood(w http.ResponseWriter, req *http.Request) {
	if req.Method == http.MethodPost {
		a := req.FormValue("id")
		b := req.FormValue("barcod")
		c := req.FormValue("name")
		d := req.FormValue("meghdar")
		e := req.FormValue("tolid")
		f := req.FormValue("engheza")
		g := req.FormValue("id0")

		stmt, err := db.Prepare("UPDATE kood SET id_kood=$1, barkod_kood=$2, name_kood=$3, mghdar=$4 , tarkh_tolid=$5 , tarikh_engheza=$6 WHERE id_kood=$7")
		check(err)
		defer stmt.Close()

		r, err := stmt.Exec(a, b, c, d, e, f, g)
		check(err)

		n, err := r.RowsAffected()
		check(err)

		fmt.Fprintln(w, "UPDATED RECORD", n)
		http.Redirect(w, req, "/index", http.StatusSeeOther)
		return
	}
	tpl.ExecuteTemplate(w, "ukood.html", nil)
}

func delete(w http.ResponseWriter, req *http.Request) {
	tpl.ExecuteTemplate(w, "delete.html", nil)
	check(err)
}

func delete_karmand(w http.ResponseWriter, req *http.Request) {
	if req.Method == http.MethodPost {
		a := req.FormValue("code")
		stmt, err := db.Prepare("DELETE FROM karmand WHERE kode_meli=$1;")
		check(err)
		defer stmt.Close()

		r, err := stmt.Exec(a)
		check(err)

		n, err := r.RowsAffected()
		check(err)

		fmt.Fprintln(w, "DELETED RECORD", n)
		http.Redirect(w, req, "/", http.StatusSeeOther)
		return
	}
	tpl.ExecuteTemplate(w, "dkarmand.html", nil)
}

func delete_kood(w http.ResponseWriter, req *http.Request) {
	if req.Method == http.MethodPost {
		a := req.FormValue("id")
		stmt, err := db.Prepare("DELETE FROM kood WHERE id_kood=$1;")
		check(err)
		defer stmt.Close()

		r, err := stmt.Exec(a)
		check(err)

		n, err := r.RowsAffected()
		check(err)

		fmt.Fprintln(w, "DELETED RECORD", n)
		http.Redirect(w, req, "/", http.StatusSeeOther)
		return
	}
	tpl.ExecuteTemplate(w, "dkood.html", nil)
}

func drop(w http.ResponseWriter, req *http.Request) {
	a := ""
	Query := fmt.Sprintf("DROP TABLE %s", a)
	stmt, err := db.Prepare(Query)
	check(err)
	defer stmt.Close()

	_, err = stmt.Exec()
	check(err)

	fmt.Fprintln(w, "DROPPED TABLE ", a)
}

func check(err error) {
	if err != nil {
		fmt.Println(err)
	}
}
