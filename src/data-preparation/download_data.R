### create directories --------------------------------------------------------
dir.create('../../data')
dir.create('../../data/data-analist')
dir.create('../../data/data-scientist')
dir.create('../../data/marketing-analist')
dir.create('../../data/marketeer')


### download data and save to disk --------------------------------------------
## download datasets data analist ---------------------------------------------
# job postings
download.file("https://docs.google.com/spreadsheets/d/1R0UeBNOPFDPlIBtk9Eb70wmpgXaNjOp4wNGG43aJU10/export?format=csv",
              '../../data/data-analist/data-analist-listings.csv')

# put all job description google drive url ids in a list
da_ids = list('1qUN59K91yMEp0_XQDsQWqC68ESaMn1OSQWqvEE3nYRg', '1aS6kjBJjFBMVfI6WSE2VFlbepAoJe9LcT9pCYQGtaJo',
              '1mo6mnUe9zhraBeOH4Zs3qzg2GDhiU4Ptlu2yQN9WADg', '1zs6DvdCyZ5KF7iJ4z4-4eccEbGXREwq_F5Qzuz7apl0',
              '1GImkxBUEeX7uZWHSN8W99qi2g27I9IH-WZ8doD5yKZI', '1SaSmy2ArhaoZT3HKIwz3vQ68jCSPuW9QcdN6N4JQmjw',
              '1knm3opVKAeQcd81UnLvIsNkKpJGTuKQ6NX-LPJW1kps', '1_SlbNfDYK8egYS6buwXQ-ftKFzhox09y6yQHh0B9o4A',
              '1plsx-B6vt1s7mHaFrNgEBvRkcMFsw7OCgKuoRbIDvak', '1y0eJ9eU-bLbJeDSpDwUlKa71au582zU2e9QKdUIzZg8',
              '1FBVqliDyI-ZIusRrOwjg7tMMQyE8-9T1d4mdtn9yzGg', '1e2z9KbF96vE2BKVAyrv3aUPUK0hGAJsGrJWpFDllJwk',
              '1e2z9KbF96vE2BKVAyrv3aUPUK0hGAJsGrJWpFDllJwk', '1o-QNpwM6kS2AztMhD2N8N1mGDN14hWThZKNb6g0V46k',
              '1xwV0w_ornqA5apJd9MY5fDDZt7-3jyM9OFV5SrFGySg', '1nKSFQQlycklFND0sHToW9FQvh5Z0KhIauHy9kMIKGMs',
              '16ewecByWQdIK6DU-xIScSmFVJ0eGhoyU286f7cwk2I0')

# define function for job descriptions
download_descriptions_da <- function(da_ids) {
  counter = 1
  for (id in da_ids) {
    url = paste0("https://docs.google.com/spreadsheets/d/", id, "/export?format=csv")
    path = paste0("../../data/data-analist/data-analist-descriptions-", counter, ".csv")
    download.file(url, path)
    counter = counter + 1
  }
}

# call function
download_descriptions_da(da_ids)


## download datasets data scientist -------------------------------------------
# job postings
download.file("https://docs.google.com/spreadsheets/d/1MXB35YNUQMbd0804XFctXkm83Clw5qFihvxYTulSU5c/export?format=csv",
              '../../data/data-scientist/data-scientist-listings.csv')

# put all job description google drive url ids in a list
ds_ids = list('1Gljl3BicWU0Q85rUKIWXhdrr4-9xywUQbXDF16CXCXU', '1ltd3jTvK8KLKi3kqFQ0O8bbStVYq3jffEdprCbHkNfY',
              '1xTamLXTMqpoTKeUlUOrqJvCTtzo1_g3gnyrpvW93glc', '1gYvR6A2Sa_JBfNVwuhS3dw-QTH6ldPi-4JjycoCpD0c',
              '1OSw9S-owdgobx5hYRsRhWrMo-UKrgOGoDJDXe-PQxL8', '1a4K3n7RbERBW2zwBDi0bcbM0QpQBqVo2ckMpFC-3Gr8',
              '1grJhWaERQn_dZK0-K0ElOTTR6hL_VHqWnf8yWxY4oBU', '1pgkwXIxXE93BWzaJdavtknBt2ryNMyMcgnNj1fX9WkQ',
              '1IZgiFysMKfTf6PgGsDDnD1EV0cM8vahoFPnO5gDThb0', '12gqHobXy4sQZQyLEPG21xxXAFDlELeLYDcWMgSdwdXc',
              '1HEIdEMoDcxQsfcbYChzpv1HjDlt6jolPcl0u95I5Mkw', '1VDZa56g_MceN_jMhpuRWGnjLT_xLv2a9JqRolP1GdWE',
              '12LYN8XkTBbPGA8FrEsIwX37It3ePKZhZC_8kg8VQeEg', '1fBpGFDgHJ4LWUGbZXtFwuz5Nm8DjFsfNn13-GesCckA',
              '1s0Vxrk_5W9SvCZMrMkD0UcODAayg6tvG5FX0TpHwj7o', '1L8Nhb7M-yiPshM7rYna_vmGGi4dbM-NePoR55UM3H1Q',
              '1Dw6JkKyEyeQYq4iA5Ffwcv305gQQXFff2TYKrCgVnYY', '1vtvR0M8KlYhr9p61GYtdv35_6RbkvCtgCCpb1Lm0Q9I',
              '1eDAiv1C1RWXwD0YRzP3wutdOX6bf9Gc4ScDAB9l4tUQ', '13UnotKDstmMOwakWVD2ODp4mcgngfSglnoFzRGo2Uhw',
              '1Of1GoU1XdH90_xFvw6JnO4sviwMJCil0e-U0M-Hb714')

# define function for job descriptions
download_descriptions_ds <- function(ds_ids) {
  counter = 1
  for (id in ds_ids) {
    url = paste0("https://docs.google.com/spreadsheets/d/", id, "/export?format=csv")
    path = paste0("../../data/data-scientist/data-scientist-descriptions-", counter, ".csv")
    download.file(url, path)
    counter = counter + 1
  }
}

# call function
download_descriptions_ds(ds_ids)


## download datasets marketing analist ----------------------------------------
# job postings
download.file("https://docs.google.com/spreadsheets/d/1x0LQ3HdG6-ni6LByPjmO2y9rgC2jR4Kkl7r52_E7iaE/export?format=csv",
              '../../data/marketing-analist/marketing-analist-listings.csv')

# put all job description google drive url ids in a list
ma_ids = list('1G7wIZxtXVBMBu9l_aO5rJ3I-Hhs_4v0Cfy2fE_zAo58', '1w9VQK1iFdd4gUUtXelHNTWFIwMnMC00oTAVTE3vjr_Q',
              '1hMCfvy5nb8VhYtsMIIGMA835Mr1ZM_oUhLAb8Yg3-hs', '1zSRV5zXpcEld1zx8HN1h0KUiPZhS_T05yGZy0MbbtkE',
              '1WBsYiZ46e7N5sgXasPepv8c_23GwBWylmvnizCio-w0', '1Abgma8inKasggXwAVAaEj2OCBERwc8UUjaozzssmy04',
              '1-mA9KQ29QuWZJ_qcAbxOk3gxgKEmYcY63rFFdDTH9YE')

# define function for job descriptions
download_descriptions_ma <- function(ma_ids) {
  counter = 1
  for (id in ma_ids) {
    url = paste0("https://docs.google.com/spreadsheets/d/", id, "/export?format=csv")
    path = paste0("../../data/marketing-analist/marketing-analist-descriptions-", counter, ".csv")
    download.file(url, path)
    counter = counter + 1
  }
}

# call function
download_descriptions_ma(ma_ids)


## download datasets marketeer ------------------------------------------------
# job postings
download.file("https://docs.google.com/spreadsheets/d/194tm6BioNNQ-3q-0tIayOpiv3iGWCq0kPtaAQIqjt1A/export?format=csv",
              '../../data/marketeer/marketeer-listings.csv')

# put all job description google drive url ids in a list
m_ids = list('1dJmBymPHVkMQKIc5nUc7MFfzw86TWWoKh6DLg7Wg_uE', '13wlj5bzDxAYiS4nFerfsJxK5qLP55t1vgTqmReTOqiI',
             '1_bv5TyeCbqAlzK1KL8qUC6aN9sxSqAvuko-9cRwynlk', '1OBu7YA_pe9tSWnkCwAgCZP2W5WU2qRadMChxlgODNIE',
             '1pjnX3e4NMMQ81ujSeMNtTq8MPbAUWLh9Bzwu8GHiVPI', '1EfJw_ZHntOwAxVxCNY_R6hfeN6f1Avj3ERbw7q9v_t4',
             '1ZQQ0J6DweBsDlOdYfqe0lPQFsZEUiHvkdklSKYthuuw', '1qS9k1w87f8e2z_KkY2Jvql3LKSfbPnW5cM-nzhNdVlU',
             '16nOeEbMeHLRJf1QDtrisd-ILZ4aMNzRDYx5yqAwVwu4', '18u0mzItNgbvS5pdNg_sRIUHY3VxGZZGXKj63bXJ4vU0',
             '1iqU8NU5c95u_PeiIBS26DG_CRubNw9n1KxWHpKZVUC8', '1MoeZBHqMY48tfNhH1anxUQOLcnnDnoRsahjiwzno-go',
             '18RY_LZCjxikzdg8D0-d8DjxvotgCm6lbxguZkBGmD-g', '1FR32l-ovEZ30B2uvVBs08bgBlMMYP2ZYZmdHDuv4amQ',
             '17AerhlTlGNSnW5dWpogA5luaPvKMmYk_HUmUEtXjdJw', '1bDfyfHgKznyJRfQ9brxRmFRyUwmtHcXVo86z7RdQPuI',
             '105-uFYJ0DwbYTChsPfq4ElcP-SGI_83jgFmd1OOzM08', '13s7gW9JryJ1vSO3Gu1cZTed6hW2BSiFuDWikDOPBzvk',
             '1O7D1wvkvqMZW2QliMmYch9jGre7E5oK6Y8zOKTe6u7k')

# define function for job descriptions
download_descriptions_m <- function(m_ids) {
  counter = 1
  for (id in m_ids) {
    url = paste0("https://docs.google.com/spreadsheets/d/", id, "/export?format=csv")
    path = paste0("../../data/marketeer/marketeer-descriptions-", counter, ".csv")
    download.file(url, path)
    counter = counter + 1
  }
}

# call function
download_descriptions_m(m_ids)
