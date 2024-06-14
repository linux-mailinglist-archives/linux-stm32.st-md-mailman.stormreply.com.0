Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 282719085B8
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2024 10:10:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB2FCC78011;
	Fri, 14 Jun 2024 08:10:46 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32F0CC78010
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 08:10:45 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-57cc1c00ba6so417430a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2024 01:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718352645; x=1718957445;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oy65aQubSD4tbmjRxefZecoIq4GXZIdFH64RPRpuevk=;
 b=X/6qkVyekkEWUn3lZAkltQTfiVk6GmTc9PmKdsOCmCpSDvtbTqN17zEFQ2MF5uOd7P
 FtT+7+foxzITtZ9agzShUp6IDsb7pOYBajSp0Sug0HTyyX8q9TG2n8QRO4UKNlnv3gFL
 i8SA9S+TPnF/7wakf2uE3+nvEALgOzGJVeL0+bhpJAD22Bo61Zd+5ovJBuCQcfdyNW2K
 Mvigl1aFQQOBbXkDTzqTTzhTHRqYIuUdmk/11NCci2iBadRZZUqVnWlzATmd5vmbQDit
 2TCxZ5D8vqIFzxe7j+a9MA81sAwqvrms0vzhzYiZBVqod5m/RWcAqleRiBlzq9PY3qaS
 lADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718352645; x=1718957445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oy65aQubSD4tbmjRxefZecoIq4GXZIdFH64RPRpuevk=;
 b=dvCCPmc/rYSscQuLPmqJ4FCkB9RzDQai+HJu+uUPZgfSe6d3S/+rVhf7GgHZcCJtdQ
 dRl1bou8A5wZZt8JnK7/0L2I1Q7bR5mmVBI6ARW+li/SAvDpCHuBn3NvHeEiaw4YW5lB
 m5qTQ3KYKGq0ne8KBmqm521b5RK1+bfTCipO1XORWpqHInqniUm/1jrQCXW9H65PoIIA
 f+VurHhwCgKZeeqQ5PZOUBJ0QKI3qJb9N2RtPH0+iIXvE7x/Fk1dJeM6lxoh026DpIef
 zchaOHujYuKH3mPNfm0efC3o2/qYvcMsYkQYn1+hStVLmOTdV9q+mAeEDo91Ooo2kkji
 HKCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4jLx+gkaf8PxKXoJUo3+VlgHdodwcdA/+YHNanaiu4GYYHcV4xcrpCZWPFrt2vYhuoR5cLZ63jOjEvxyhk+Ualf+lO4X9cHBWuCjqdmYWDx3trR7Ibhmh
X-Gm-Message-State: AOJu0YwDATNq8yiePY8JtNMlMHV1ODsRz0dQkfHykzNssdyBvv3xrqWP
 7wQs3OYXVnR9kf1ue7KsndkyLx+LMNaZqID7IyoIyH6lSxmB1T7Mo28RXLGd0o4=
X-Google-Smtp-Source: AGHT+IG8vyu+lChvA75pP+yobBANu/WNvOVceOlafrcqMeCCCsOH0P5Be43wvfozwTxwaqjrFdJqbw==
X-Received: by 2002:a50:ab1d:0:b0:57c:a7dc:b0e4 with SMTP id
 4fb4d7f45d1cf-57cbd674334mr1467162a12.3.1718352644618; 
 Fri, 14 Jun 2024 01:10:44 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72ce07esm1910194a12.12.2024.06.14.01.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 01:10:44 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 William Breathitt Gray <wbg@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Lee Jones <lee@kernel.org>
Date: Fri, 14 Jun 2024 10:10:14 +0200
Message-ID: <765681be4da184d8886e9837fcbe35321a5827f1.1718352022.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1718352022.git.u.kleine-koenig@baylibre.com>
References: <cover.1718352022.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3795;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=I3iLNPbAvcDPk6Nw1QUlh23HxzYQPmXbPfOcTvZTTEE=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBma/rxUqR8k2kQlHINVk2JFXnkxxfFoFaxndNGF
 3aiztX7/haJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZmv68QAKCRCPgPtYfRL+
 ThklB/97HZsttyevmt4/WDxNzPTV1K7YemJMyPrX/qSaW/Izjg3FteFk8dQREwIT+SZb0yE/Rvk
 QFDdO9eqv/fHBkEvlk9ZD6VVISOXUlHdFI1ZzoOeraUg0epyeMQA6CmLWM0rwSst512yjG3Iin2
 4Xn3CDsGAlXu1pWyFrsiuHUaUmhW99UsAMgfwGGwadOC9XBOgzAC3/7FdeZ4wJEUMBFCPBG6NPG
 ETc6E4OqBCJvi2GVXFG9WDCkN+jGMrTOCmp015RmPJaRktmKEIiDy3h/GofbKF3wYPrBnzHjQsg
 ore9yeaohvi1xHsMJ71ed9vH9kUvxlliZen1Fl+zFw1+m1C8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 4/4] pwm-stm32: Make use of parametrised
	register definitions
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

VGhlcmUgaXMgbm8gc2VtYW50aWMgY2hhbmdlLCBidXQgaXQgaXMgYSBuaWNlciBvbiB0aGUgZXll
cyBvZiBhIHJlYWRlciwKYmVjYXVzZQoKCVRJTV9DQ1IxICsgNCAqIGNoCgplbmNvZGVzIGludGVy
bmFsIHJlZ2lzdGVyIGtub3dsZWRnZSwgd2hpbGUKCglUSU1fQ0NSeChjaCArIDEpCgprZWVwcyB0
aGF0IGluZm9ybWF0aW9uIGNvbXBsZXRlbHkgaW4gdGhlIGhlYWRlciBkZWZpbmluZyB0aGUgcmVn
aXN0ZXJzLgoKV2hpbGUgSSBleHBlY3RlZCB0aGlzIHRvIG5vdCByZXN1bHQgaW4gYW55IGNoYW5n
ZXMgaW4gdGhlIGJpbmFyeSwgZ2NjIDEzCihhcyBwcm92aWRlZCBieSBEZWJpYW4gaW4gdGhlIGdj
Yy0xMy1hcm0tbGludXgtZ251ZWFiaWhmIDEzLjIuMC0xMmNyb3NzMQpwYWNrYWdlKSBjb21waWxl
cyB0aGUgbmV3IHZlcnNpb24gd2l0aCBhbiBhbGxtb2Rjb25maWcgdG8gbW9yZSBjb21wYWN0CmNv
ZGU6CgoJJCBzb3VyY2Uvc2NyaXB0cy9ibG9hdC1vLW1ldGVyIGRyaXZlcnMvcHdtL3B3bS1zdG0z
Mi5vLXByZSBkcml2ZXJzL3B3bS9wd20tc3RtMzIubwoJYWRkL3JlbW92ZTogMC8wIGdyb3cvc2hy
aW5rOiAwLzIgdXAvZG93bjogMC8tNDg4ICgtNDg4KQoJRnVuY3Rpb24gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgb2xkICAgICBuZXcgICBkZWx0YQoJc3RtMzJfcHdtX2dldF9z
dGF0ZSAgICAgICAgICAgICAgICAgICAgICAgICAgOTY4ICAgICA5MzYgICAgIC0zMgoJc3RtMzJf
cHdtX2FwcGx5X2xvY2tlZCAgICAgICAgICAgICAgICAgICAgICAxOTIwICAgIDE0NjQgICAgLTQ1
NgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXls
aWJyZS5jb20+Ci0tLQogZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgfCAyMiArKysrKysrKysrKy0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgYi9kcml2ZXJzL3B3bS9w
d20tc3RtMzIuYwppbmRleCBhMmYyMzFkMTNhOWYuLjQ5YTc2NTE0YjgzZSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKQEAg
LTM2MCw3ICszNjAsNyBAQCBzdGF0aWMgaW50IHN0bTMyX3B3bV9jb25maWcoc3RydWN0IHN0bTMy
X3B3bSAqcHJpdiwgdW5zaWduZWQgaW50IGNoLAogCWR0eSA9IG11bF91NjRfdTY0X2Rpdl91NjQo
ZHV0eV9ucywgY2xrX2dldF9yYXRlKHByaXYtPmNsayksCiAJCQkJICAodTY0KU5TRUNfUEVSX1NF
QyAqIChwcmVzY2FsZXIgKyAxKSk7CiAKLQlyZWdtYXBfd3JpdGUocHJpdi0+cmVnbWFwLCBUSU1f
Q0NSMSArIDQgKiBjaCwgZHR5KTsKKwlyZWdtYXBfd3JpdGUocHJpdi0+cmVnbWFwLCBUSU1fQ0NS
eChjaCArIDEpLCBkdHkpOwogCiAJLyogQ29uZmlndXJlIG91dHB1dCBtb2RlICovCiAJc2hpZnQg
PSAoY2ggJiAweDEpICogQ0NNUl9DSEFOTkVMX1NISUZUOwpAQCAtMzgyLDkgKzM4Miw5IEBAIHN0
YXRpYyBpbnQgc3RtMzJfcHdtX3NldF9wb2xhcml0eShzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2LCB1
bnNpZ25lZCBpbnQgY2gsCiB7CiAJdTMyIG1hc2s7CiAKLQltYXNrID0gVElNX0NDRVJfQ0MxUCA8
PCAoY2ggKiA0KTsKKwltYXNrID0gVElNX0NDRVJfQ0N4UChjaCArIDEpOwogCWlmIChwcml2LT5o
YXZlX2NvbXBsZW1lbnRhcnlfb3V0cHV0KQotCQltYXNrIHw9IFRJTV9DQ0VSX0NDMU5QIDw8IChj
aCAqIDQpOworCQltYXNrIHw9IFRJTV9DQ0VSX0NDeE5QKGNoICsgMSk7CiAKIAlyZWdtYXBfdXBk
YXRlX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ0NFUiwgbWFzaywKIAkJCSAgIHBvbGFyaXR5ID09
IFBXTV9QT0xBUklUWV9OT1JNQUwgPyAwIDogbWFzayk7CkBAIC00MDIsOSArNDAyLDkgQEAgc3Rh
dGljIGludCBzdG0zMl9wd21fZW5hYmxlKHN0cnVjdCBzdG0zMl9wd20gKnByaXYsIHVuc2lnbmVk
IGludCBjaCkKIAkJcmV0dXJuIHJldDsKIAogCS8qIEVuYWJsZSBjaGFubmVsICovCi0JbWFzayA9
IFRJTV9DQ0VSX0NDMUUgPDwgKGNoICogNCk7CisJbWFzayA9IFRJTV9DQ0VSX0NDeEUoY2ggKyAx
KTsKIAlpZiAocHJpdi0+aGF2ZV9jb21wbGVtZW50YXJ5X291dHB1dCkKLQkJbWFzayB8PSBUSU1f
Q0NFUl9DQzFORSA8PCAoY2ggKiA0KTsKKwkJbWFzayB8PSBUSU1fQ0NFUl9DQ3hORShjaCk7CiAK
IAlyZWdtYXBfc2V0X2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ0NFUiwgbWFzayk7CiAKQEAgLTQy
Miw5ICs0MjIsOSBAQCBzdGF0aWMgdm9pZCBzdG0zMl9wd21fZGlzYWJsZShzdHJ1Y3Qgc3RtMzJf
cHdtICpwcml2LCB1bnNpZ25lZCBpbnQgY2gpCiAJdTMyIG1hc2s7CiAKIAkvKiBEaXNhYmxlIGNo
YW5uZWwgKi8KLQltYXNrID0gVElNX0NDRVJfQ0MxRSA8PCAoY2ggKiA0KTsKKwltYXNrID0gVElN
X0NDRVJfQ0N4RShjaCArIDEpOwogCWlmIChwcml2LT5oYXZlX2NvbXBsZW1lbnRhcnlfb3V0cHV0
KQotCQltYXNrIHw9IFRJTV9DQ0VSX0NDMU5FIDw8IChjaCAqIDQpOworCQltYXNrIHw9IFRJTV9D
Q0VSX0NDeE5FKGNoICsgMSk7CiAKIAlyZWdtYXBfY2xlYXJfYml0cyhwcml2LT5yZWdtYXAsIFRJ
TV9DQ0VSLCBtYXNrKTsKIApAQCAtNDkzLDggKzQ5Myw4IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdt
X2dldF9zdGF0ZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsCiAJaWYgKHJldCkKIAkJZ290byBvdXQ7
CiAKLQlzdGF0ZS0+ZW5hYmxlZCA9IGNjZXIgJiAoVElNX0NDRVJfQ0MxRSA8PCAoY2ggKiA0KSk7
Ci0Jc3RhdGUtPnBvbGFyaXR5ID0gKGNjZXIgJiAoVElNX0NDRVJfQ0MxUCA8PCAoY2ggKiA0KSkp
ID8KKwlzdGF0ZS0+ZW5hYmxlZCA9IGNjZXIgJiBUSU1fQ0NFUl9DQ3hFKGNoICsgMSk7CisJc3Rh
dGUtPnBvbGFyaXR5ID0gKGNjZXIgJiBUSU1fQ0NFUl9DQ3hQKGNoICsgMSkpID8KIAkJCSAgUFdN
X1BPTEFSSVRZX0lOVkVSU0VEIDogUFdNX1BPTEFSSVRZX05PUk1BTDsKIAlyZXQgPSByZWdtYXBf
cmVhZChwcml2LT5yZWdtYXAsIFRJTV9QU0MsICZwc2MpOwogCWlmIChyZXQpCkBAIC01MDIsNyAr
NTAyLDcgQEAgc3RhdGljIGludCBzdG0zMl9wd21fZ2V0X3N0YXRlKHN0cnVjdCBwd21fY2hpcCAq
Y2hpcCwKIAlyZXQgPSByZWdtYXBfcmVhZChwcml2LT5yZWdtYXAsIFRJTV9BUlIsICZhcnIpOwog
CWlmIChyZXQpCiAJCWdvdG8gb3V0OwotCXJldCA9IHJlZ21hcF9yZWFkKHByaXYtPnJlZ21hcCwg
VElNX0NDUjEgKyA0ICogY2gsICZjY3IpOworCXJldCA9IHJlZ21hcF9yZWFkKHByaXYtPnJlZ21h
cCwgVElNX0NDUngoY2ggKyAxKSwgJmNjcik7CiAJaWYgKHJldCkKIAkJZ290byBvdXQ7CiAKQEAg
LTcwMiw3ICs3MDIsNyBAQCBzdGF0aWMgaW50IHN0bTMyX3B3bV9zdXNwZW5kKHN0cnVjdCBkZXZp
Y2UgKmRldikKIAljY2VyID0gYWN0aXZlX2NoYW5uZWxzKHByaXYpOwogCiAJZm9yIChpID0gMDsg
aSA8IGNoaXAtPm5wd207IGkrKykgewotCQltYXNrID0gVElNX0NDRVJfQ0MxRSA8PCAoaSAqIDQp
OworCQltYXNrID0gVElNX0NDRVJfQ0N4RShpICsgMSk7CiAJCWlmIChjY2VyICYgbWFzaykgewog
CQkJZGV2X2VycihkZXYsICJQV00gJXUgc3RpbGwgaW4gdXNlIGJ5IGNvbnN1bWVyICVzXG4iLAog
CQkJCWksIGNoaXAtPnB3bXNbaV0ubGFiZWwpOwotLSAKMi40My4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
