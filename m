Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B4E96D2C0
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2024 11:07:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3FE4C78013;
	Thu,  5 Sep 2024 09:07:05 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CA6DC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 09:06:59 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2f4f8742138so5863431fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2024 02:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725527218; x=1726132018;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7a9eA0yUdZtAcxMzsuuAdHiqNG9lReTW+KBbCyW2EoM=;
 b=Mm7loNuuXDL3UkFnDdyfblZthxOOgkrZUEiea/dWIN6e3cG7W8W9yvvxNRK0pIKqBx
 83OhH7a1U5TZsyBgxQxmtlgkupSl6erN4E3IE+FumaoubdFizIhu/DJ7sF55Xtq7iDFP
 AcCbhkNX80+LaKdvSx+CaYB4CXVMmXyrNrevIGrsDIxUhsWbIqnamDsgjbyCZEhC5NHs
 z4aZ6+PbrjRStiHT86f/a6rILvwnZU9evoQSF/CPUWMyewzgQzHrPQfFyXtSQiRd0zHw
 LOLqNtklSc/teyin87KMVd0gLcQ75AeAwAeBJ1ZfG5YmDHPd45LlvMqxBwRD7kLt5Aul
 W80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725527218; x=1726132018;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7a9eA0yUdZtAcxMzsuuAdHiqNG9lReTW+KBbCyW2EoM=;
 b=JyZ0Ao5Sv5DotFPpVHQ2BtYQpQWGhwuD2io++qGc/mdFTtRB/NSiDrMt1oTtLkwxVJ
 L7NZv/0K9PvRYYVrCjFwK2PL3m2RvJIZEa0pbbUYa6CM3h8j8umQwL0LBFqAjksJab+3
 28Ij28S6gAQ0+C+x5dQeByOOHoWc6uwOnADjrkrgPQk71TQZgFsNnp40Y5iPT8iyMpq1
 S4g8nh+gRjgzsrarD3aXx8CChl+C4Mmweb/3YDp9W37Yrxfs3AiTgRAMm5LxFodSj4bN
 hr6/5S3qJxKzvsZEz4jAHZzyQToC4ebBPw4Fr7dGKRWMVb6xxB73ZeeqHUOKHVKh97ea
 3iNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtVvOHbFRCxJhisoT4Wb5SN0AKI5tDnSkxIYXWDVkm/24fHxXxzzkJoPg2kiWj1suxTygY8Oqi52TQqg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzgms8A+BJMpcZ6YEehTjkxdJ70FWSaZhNc0i7ePWAAzLinfUwv
 D3H1LCMej2Kx2Od6UbfUMGOLC6uHeJTmV0WD+Yff3twn5P2ciGQmdoJYyMMqzUQ=
X-Google-Smtp-Source: AGHT+IFSI5lj6rwftgWCpFh5EKDnxXc7Y6Pjuctts1dZ7WJpCwziqAL0dEhqVe5Igk8aaH8eoiJBbA==
X-Received: by 2002:a05:6512:33c8:b0:535:6bb6:e7b5 with SMTP id
 2adb3069b0e04-5356bb6e93dmr1854557e87.9.1725527218002; 
 Thu, 05 Sep 2024 02:06:58 -0700 (PDT)
Received: from localhost (p5dc68f76.dip0.t-ipconnect.de. [93.198.143.118])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a61fbaf77sm107827666b.39.2024.09.05.02.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 02:06:57 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	linux-pwm@vger.kernel.org
Date: Thu,  5 Sep 2024 11:06:24 +0200
Message-ID: <20240905090627.197536-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1511;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=9YAv06fWG26oklo9XdJghSD4Pq6gsCOwAPUQlIpjLWc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBm2XSTO2fuoUly3bf3CcnfPnw65cjTrC1kFih7w
 70NCDxDEy+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZtl0kwAKCRCPgPtYfRL+
 TkXxB/9k3jZR9QzT8q4GtLtVtIwb1PFWDvqB+N0lA5tphTB5aoqeaEuFra/CzE7hy0C0PgKPtIG
 5SLugAFZukofLefe4TsoriqxVT6svyUgOSBZNUdzRpwG7QjcD1+guffh0d2L9phVROZXX+IO6PC
 4/7dk8xiuP6pYqe+QVdWX1GBhQLBqbpnt95Zxvlz25khvECFI7tkU0o7bz0hBmDer71e3I/08pt
 p+GztrpUeY6/envxBziXn7FumPCfu8uL/VcOwQ9ytDDeNfEmKiZ6+ZtePsArEAm9Eij9wsi1o2q
 CICPfk/+HJnaj/hdQXj6bZia/41Z+g8HYm7TAqhngiIMuITd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] pwm: stm32: Use the right CCxNP bit in
	stm32_pwm_enable()
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

VGhlIHB3bSBkZXZpY2VzIGZvciBhIHB3bV9jaGlwIGFyZSBudW1iZXJlZCBzdGFydGluZyBhdCAw
LCB0aGUgZmlyc3QgaHcKY2hhbm5lbCBob3dldmVyIGhhcyB0aGUgbnVtYmVyIDEuIFdoaWxlIGlu
dHJvZHVjaW5nIGEgcGFyYW1ldHJpc2VkIG1hY3JvCnRvIHNpbXBsaWZ5IHJlZ2lzdGVyIGJpdCB1
c2FnZSBhbmQgbWFraW5nIHRoYXQgb2Zmc2V0IGV4cGxpY2l0LCBvbmUgb2YKdGhlIHVzYWdlcyB3
YXMgY29udmVydGVkIHdyb25nbHkuIFRoaXMgaXMgZml4ZWQgaGVyZS4KCkZpeGVzOiA3Y2VhMDVh
ZTFkNGUgKCJwd20tc3RtMzI6IE1ha2UgdXNlIG9mIHBhcmFtZXRyaXNlZCByZWdpc3RlciBkZWZp
bml0aW9ucyIpClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2Vu
aWdAYmF5bGlicmUuY29tPgotLS0KSGVsbG8sCgpkdXJpbmcgcmV2aWV3IG9mIGEgcGF0Y2ggdG8g
dGhlIHN0bTMyIHB3bSBkcml2ZXIgRmFicmljZSBwb2ludGVkIG91dCBhCndyb25nIHVzYWdlIG9m
IFRJTV9DQ0VSX0NDeE5FLiBXaGlsZSAoSSB0aGluaykgd2UgYm90aCBhc3N1bWVkIHRoaXMgd2Fz
CmEgcHJvYmxlbSBpbiBzYWlkIHBhdGNoLCB0aGF0IHByb2JsZW0gZXhpc3RlZCBhbHJlYWR5IGJl
Zm9yZSBhbmQgdGhlCnByb3Bvc2VkIGNoYW5nZSBqdXN0IG1vdmVkIHRoZSBwcm9ibGVtIGFyb3Vu
ZC4gU28gaW5zdGVhZCBvZiAob25seSkKdXBkYXRpbmcgdGhlIHBhdGNoIGxhdGVyLCBoZXJlIGNv
bWVzIGEgc2VwYXJhdGUgZml4IGZvciB0aGUgZHJpdmVyLgoKSSBpbnRlbmQgdG8gc2VuZCB0aGlz
IHRvIExpbnVzIHRvbW9ycm93IHRvIGdldCBpdCBpbnRvIDYuMTEtcmM3LgoKQmVzdCByZWdhcmRz
ClV3ZQoKIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdt
LXN0bTMyLmMgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwppbmRleCBmZDc1NGE5OWNmMmUuLmY4
NWViNDFjYjA4NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKKysrIGIvZHJp
dmVycy9wd20vcHdtLXN0bTMyLmMKQEAgLTQxMiw3ICs0MTIsNyBAQCBzdGF0aWMgaW50IHN0bTMy
X3B3bV9lbmFibGUoc3RydWN0IHN0bTMyX3B3bSAqcHJpdiwgdW5zaWduZWQgaW50IGNoKQogCS8q
IEVuYWJsZSBjaGFubmVsICovCiAJbWFzayA9IFRJTV9DQ0VSX0NDeEUoY2ggKyAxKTsKIAlpZiAo
cHJpdi0+aGF2ZV9jb21wbGVtZW50YXJ5X291dHB1dCkKLQkJbWFzayB8PSBUSU1fQ0NFUl9DQ3hO
RShjaCk7CisJCW1hc2sgfD0gVElNX0NDRVJfQ0N4TkUoY2ggKyAxKTsKIAogCXJlZ21hcF9zZXRf
Yml0cyhwcml2LT5yZWdtYXAsIFRJTV9DQ0VSLCBtYXNrKTsKIApiYXNlLWNvbW1pdDogODQwMDI5
MWUyODllZTZiMmJmOTc3OWZmMWM4M2EyOTE1MDFmMDE3YgotLSAKMi40NS4yCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
