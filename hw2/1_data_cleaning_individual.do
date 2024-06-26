clear all 

cd "C:\Users\jagal\OneDrive\Escritorio\PhD\2_Second year\Empirical\HW2"

use IND2021.dta, clear

/*Individual database cleaning */

keep /*ages */ ER34904 ER34704 ER34504 ER34305 ER34204 ER34104 ER34004 ER33904 ER33804 ER33704 ER33604 ER33504 ER33404 ER33304 ER33204 ER33104 ER30809 ER30736 ER30692 ER30645 ER30609 ER30573 ER30538 ER30501 ER30466 ER30432 ER30402 ER30376 ER30346 ER30316 ER30286 ER30249 ER30220 ER30191 ER30163 ER30141 ER30120 ER30094 ER30070 ER30046 ER30023 ER30004  /*ages*/ /*sex*/ ER32000 /*sex*/ /*relation to the head */ ER30537 ER30500 ER30465 ER30431 ER30401 ER30375 ER30345 ER30315 ER30285 ER30248 ER30219 ER30190 ER30162 ER30140 ER30119 ER30093 ER30069 ER30045 ER30022 ER30003 ER33503 ER33403 ER33303 ER33203 ER33103 ER30808 ER30735 ER30691 ER30644 ER30608 ER30572 ER34303 ER34203 ER34103 ER34003 ER33903 ER33803 ER33703 ER33603 ER34903 ER34703 ER34503 /*relation to the head */ /*interview number */ ER34901 ER34701 ER34501 ER34301 ER34201 ER34101 ER34001 ER33901 ER33801 ER33701 ER33601 ER33501 ER33401 ER33301 ER33201 ER33101 ER30806 ER30733 ER30689 ER30642 ER30606 ER30570 ER30535 ER30498 ER30463 ER30429 ER30399 ER30373 ER30343 ER30313 ER30283 ER30246 ER30217 ER30188 ER30160 ER30138 ER30117 ER30091 ER30067 ER30043 ER30020 ER30001 /* interview number*/ /*person number*/ ER30002 /*person number*/

*Rename sex*
rename ER32000 sex

*Rename person number*
rename ER30002 person_number

*Renaming ages*
foreach i in ER30004 ER30023 ER30046 ER30070 ER30094 ER30120 ER30141 ER30163 ER30191 ER30220 ER30249 ER30286 ER30316 ER30346 ER30376 ER30402 ER30432 ER30466 ER30501 ER30538 ER30573 ER30609 ER30645 ER30692 ER30736 ER30809 ER33104 ER33204 ER33304 ER33404  {
	if "`i'" == "ER30004" {
		local j = 1968
	}
	rename `i' age`j'
	local j = `j' + 1
}

foreach i in ER33504 ER33604 ER33704 ER33804 ER33904 ER34004 ER34104 ER34204 ER34305 ER34504 ER34704 ER34904 {
	if "`i'" == "ER33504" {
		local j = 1999
	}
	rename `i' age`j'
	local j = `j' + 2
}

*Renaming relation to head*

foreach i in ER30003 ER30022 ER30045 ER30069 ER30093 ER30119 ER30140 ER30162 ER30190 ER30219 ER30248 ER30285 ER30315 ER30345 ER30375 ER30401 ER30431 ER30465 ER30500 ER30537 ER30572 ER30608 ER30644 ER30691 ER30735 ER30808 ER33103 ER33203 ER33303 ER33403 {
	if "`i'" == "ER30003" {
		local j = 1968
	}
	rename `i' head`j'
	local j = `j' + 1
}

foreach i in ER33503 ER33603 ER33703 ER33803 ER33903 ER34003 ER34103 ER34203 ER34303 ER34503 ER34703 ER34903 {
	if "`i'" == "ER33503" {
		local j = 1999
	}
	rename `i' head`j'
	local j = `j' + 2
}

*Rename Household id*

foreach i in ER30001 ER30020 ER30043 ER30067 ER30091 ER30117 ER30138 ER30160 ER30188 ER30217 ER30246 ER30283 ER30313 ER30343 ER30373 ER30399 ER30429 ER30463 ER30498 ER30535 ER30570 ER30606 ER30642 ER30689 ER30733 ER30806 ER33101 ER33201 ER33301 ER33401 {
	if "`i'" == "ER30001" {
		local j = 1968
	}
	rename `i' household_id`j'
	local j = `j' + 1
}

foreach i in ER33501 ER33601 ER33701 ER33801 ER33901 ER34001 ER34101 ER34201 ER34301 ER34501 ER34701 ER34901 {
	if "`i'" == "ER33501" {
		local j = 1999
	}
	rename `i' household_id`j'
	local j = `j' + 2
}

*keep if !(household_id1968> 5000 & household_id1968<7000)
keep if household_id1968 <3000
egen person_ID = group(person_number household_id1968)
reshape long age head household_id, i(person_ID sex) j(year)

compress
save individual_psid_cleaned.dta, replace