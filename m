Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0D790E7F7
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 12:12:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9DF75C78006;
	Wed, 19 Jun 2024 10:12:19 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BFDDC78019
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 10:12:16 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52bc27cfb14so7767177e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 03:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718791935; x=1719396735;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Oy65aQubSD4tbmjRxefZecoIq4GXZIdFH64RPRpuevk=;
 b=AM7UWcYL1I3k9QjudveX7mNQsxuErQYOfAKcXQtVs6uo6ZttOwfKwWgRuMHw5NdwyX
 dhEMF57i5i3qLUjhcnlSp6HHPi+qMWRaLzmHRWIt1zud6tVcj5Fhmj7s6CXsnOxtZNHe
 juVMZon19R100X35QePhFiTDMGcrDFxVvH7pmIBZqTbpfcYQ4D2ZEX+HLaZlHXSouxPP
 +sBcY50mCSsu2ri0Udqfx0vdqOTOMUiP1EAYbQJiwpuTAEkgxLEcXpiJOW5Ol2MvgfTf
 /uMDChIqP0nIZx9vSc7Cajm2O/SOjQpzT5C6qZ/8vUpeGr6Oa7JBZy5JsIUPJfeuekvG
 MHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718791935; x=1719396735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Oy65aQubSD4tbmjRxefZecoIq4GXZIdFH64RPRpuevk=;
 b=jiBAw8a0b4YYv5xWbQ0i4IpJZY9GFocjhWO649YL0RiIKYkk/teFCsy20nvCn2AGSs
 qrr2gSc79rxe4i6kZoJZrn/xqHT/icg/UPFQhoRzJpn2GC0+F26Wu0vuEYikfw2Jpbb/
 dCh7nYHzaZku24VCNIyaM8ZhO6T6jldrCNhpP8ZO7JrpzRwo1CUkBM3qVl9S214ggryF
 zB92Ezk6vxW0F7LVB5ePHpAZWoqHD5FTJ4uRa7dxlZAzbqW4w+CI7QW9btpe8c7mpjHB
 kYxLOmsAroLpldECv+VPcyC/60DSfdSbd/9qqEj9oYfVpd24+xf1V/D40JbApaq54zWB
 j0jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpJY8mNetkqfZmI6xN59U1cT+DfyOChKfB3WLBA2JF8sHXwr27dhtFfJYOG8oBgzMUUhwdOAz5Ku3FNvj7bYHCg/yHdXTxRmZ7bd7HIWuEFgwO4c4z5DiY
X-Gm-Message-State: AOJu0YxlWOAsmc+MeAeaAQG8YbkMqV1JTqLPInOkcZnGFQROo+K38BMx
 Asnd0m52syIJKOA0lqHaq78wtb8Jiiti1fOJ2F0qNPwE/MLrN72K+94JzSW7Ru0=
X-Google-Smtp-Source: AGHT+IElXV90COGxqoASkehEGVkVUJcHtIY55Qg2BOMAPU5KAnXGT3gOKzusHP31PljuwUXHfU62qQ==
X-Received: by 2002:a05:6512:448:b0:52c:80fb:ee76 with SMTP id
 2adb3069b0e04-52ccaa594ecmr1527652e87.58.1718791934559; 
 Wed, 19 Jun 2024 03:12:14 -0700 (PDT)
Received: from localhost (p509153eb.dip0.t-ipconnect.de. [80.145.83.235])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42286fe9184sm255060585e9.13.2024.06.19.03.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 03:12:14 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 William Breathitt Gray <wbg@kernel.org>, Lee Jones <lee@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 19 Jun 2024 12:11:46 +0200
Message-ID: <d7ef7a6158df4ba6687233b0e00d37796b069fb3.1718791090.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
References: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3795;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=I3iLNPbAvcDPk6Nw1QUlh23HxzYQPmXbPfOcTvZTTEE=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmcq7q8zY1OOIGZ/eP/4KeEUhCpX1HQd4lcfMiE
 qgoW7JMHLiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZnKu6gAKCRCPgPtYfRL+
 Toq4B/43LSGZu83nHMjrJj4MVPM4vtZms21eY4jgIjU0Gvcs7NtU61MHYKGY3AQOsxCPCNc9EvE
 t9VLqpH3lK2V4Haw2olqbsodrKWM508IzC24LQtqaqS8f1FqyzXuKaocLu4LYI2GsxUSURmkZh9
 wRXRlhUikcxngpax3XlBNCaZ5ciBR68PmvbY+C2R7MgF6K4LkKRFYLr9PvvT9Gizpxp3hfYTAvP
 k1TXOVJaY2Tjv7E5t+9Advu+4qK49FdWMUpbx+/GfU21s6WTNwPLWCw7Rd14FtsQ/G8ymng3Vux
 Ga/FXD/DKAYkCorgEQiWt4mZDuWDWL/lOX6/6dpm/p8Lg+zi
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Cc: linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thorsten Scherer <T.Scherer@eckelmann.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 5/5] pwm-stm32: Make use of parametrised
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
