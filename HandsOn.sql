#Hand On SQL DQLab
use dqlabmartbasic

#1
select nama_pelanggan, alamat from ms_pelanggan_dqlab 

#2
select nama_produk, harga from ms_produk_dqlab mpd 

#3
select * from ms_produk_dqlab mpd 
where nama_produk = 'Flashdisk DQLab 32 GB' and harga > 15000

#4
select * from ms_produk_dqlab mpd 
where nama_produk in ('Flashdisk DQLab 84 GB', 'Tas Travel Organizer DigiSkills.id', 'Gantungan Kunci DQLab')

#5
select * from ms_produk_dqlab mpd 
where harga < 50000

#6
select kode_pelanggan, nama_produk, qty, harga, harga*qty as total_harga
from tr_penjualan_dqlab tpd 
where harga*qty >= 200000 
order by harga*qty desc 

#7
select kode_pelanggan, sum(qty) as total_qty, sum(harga) as total_harga, qty%3 as sisa_quantity  from tr_penjualan_dqlab tpd 
group by kode_pelanggan
order by sisa_quantity desc 

#8 concat utk menggabungkan 2 atau lebih string menjadi satu
select distinct  kode_transaksi, tgl_transaksi, no_urut, nama_produk, concat(kode_produk,' ' ,nama_produk) as kode_produk_namaproduk 
from tr_penjualan_dqlab tpd 
where qty = 5

#9 trim(trailing) untuk removes space characters from the end (right side) of a string
select nama_pelanggan, trim(trailing  ',S.H' from 'Eva Novianti ,S.H') as nama_tanpa_gelar, 
				substr('Eva Novianti',1,3) as nama_panggilan  #substr = mengambil karakter /str yg diinginkan
from ms_pelanggan_dqlab mpd  
where kode_pelanggan = 'dqlabcust01'

#10
select nama_pelanggan, substr(nama_pelanggan, 2,3) as Initial
from ms_pelanggan_dqlab mpd 

#11
select nama_pelanggan, substr(nama_pelanggan, 2,3) as Initial, length(nama_pelanggan) as Total_Char
from ms_pelanggan_dqlab mpd

#12
select nama_pelanggan,
case
	when nama_pelanggan = 'Pelanggan Non Member' then 'Not Member'
	else nama_pelanggan 
end as new_revisi_pelanggan, substr(nama_pelanggan, 2,3) as Initial, length(nama_pelanggan) as Total_Char
from ms_pelanggan_dqlab mpd

#13
select nama_pelanggan, upper(nama_pelanggan) as UPPER_NAMA_PELANGGAN, lower(nama_pelanggan) as lower_nama_pelanggan, 
		nama_pelanggan as new_revisi_pelanggan, 
case
	when nama_pelanggan = 'Pelanggan Non Member' then 'Not Member'
	else nama_pelanggan 
end as new_revisi_pelanggan, substr(nama_pelanggan, 2,3) as Initial, length(nama_pelanggan) as Total_Char
from ms_pelanggan_dqlab mpd 

#14
select kode_pelanggan, count(kode_transaksi) as total_order, qty, sum(qty*harga) as revenue from tr_penjualan_dqlab tpd 
group by kode_transaksi 

#15
select distinct kode_pelanggan, count(kode_pelanggan) as total_transaksi, sum(qty) as total_qty, sum(harga*qty) as revenue,
case
	when sum(harga*qty) >= 900000 then 'Target Achieved'
	when sum(harga*qty) <= 850000 then 'Less Performed'
	else 'Follow Up'
end as remark
from tr_penjualan_dqlab tpd
group by kode_pelangganx	

#16 
select kode_transaksi, kode_pelanggan, kode_produk, nama_produk, harga, qty, harga*qty as total from tr_penjualan_dqlab tpd  
order by harga desc

#17
select nama_produk, no_urut from tr_penjualan_dqlab tpd 
union all #duplikat semua row data table yg diinginakan/menggabungkan semua data 
select nama_produk, no_urut from tr_penjualan_dqlab tpd

#18
select nama_produk, no_urut from tr_penjualan_dqlab tpd 
union #tidak menduplicate tp utk mengabbungkan data tetapi unik saja (distinct)
select nama_produk, no_urut from tr_penjualan_dqlab tpd 

#19
select mpd.kode_pelanggan, mpd.nama_pelanggan,mpd.alamat, tpd.nama_produk from ms_pelanggan_dqlab mpd 
right join tr_penjualan_dqlab tpd on mpd.kode_pelanggan = tpd.kode_pelanggan 
where nama_produk in ('Kotak Pensil DQLab', 'Flashdisk DQLab 32 GB', 'Sticky Notes DQLab 500 sheets')

#20
select nama_produk, tgl_transaksi, datediff(now(), tgl_transaksi) as days_aging from tr_penjualan_dqlab tpd 

#21
select nama_produk, tgl_transaksi, month(tgl_transaksi) as month_date, year(tgl_transaksi) as year_date, day(tgl_transaksi) as day_date, datediff(now(), tgl_transaksi) as days_aging
from tr_penjualan_dqlab tpd 

#22
select nama_produk, tgl_transaksi, month(tgl_transaksi) as month_date, year(tgl_transaksi) as year_date, day(tgl_transaksi) as day_date,
	timestampdiff(year, tgl_transaksi, now()) as yearh_aging, timestampdiff(month, tgl_transaksi, now()) as month_aging, datediff(now(), tgl_transaksi) as days_aging
from tr_penjualan_dqlab tpd 

/*JOIN*/
select * from ms_pelanggan_dqlab mpd right join tr_penjualan_dqlab tpd on tpd.kode_pelanggan = mpd.kode_pelanggan 

select * from tr_penjualan_dqlab tpd join ms_pelanggan_dqlab mpd on tpd.kode_pelanggan = mpd.kode_pelanggan 