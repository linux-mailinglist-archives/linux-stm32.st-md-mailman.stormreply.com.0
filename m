Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A8F47FB71
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Dec 2021 10:45:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E3AAC5F1F3;
	Mon, 27 Dec 2021 09:45:51 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E8DAC5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Dec 2021 09:45:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n1mZY-0006ao-6E; Mon, 27 Dec 2021 10:45:40 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n1mZV-006u9h-UN; Mon, 27 Dec 2021 10:45:37 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n1mZU-0005Xv-F0; Mon, 27 Dec 2021 10:45:36 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Date: Mon, 27 Dec 2021 10:45:24 +0100
Message-Id: <20211227094526.698714-22-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211227094526.698714-1-u.kleine-koenig@pengutronix.de>
References: <20211227094526.698714-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=3ifQeCGsrN8bDZ+8L0RwjEjBBqDg0yaW9Y6socn1Xa8=;
 m=bh1D/32vqT5ZQCdwe9S838jSJgWgolNVHJYJDwXN/TI=;
 p=pJzg69aNue7hAcBVfXoVSTVMsFTFo3LAeRjoB3UydzI=;
 g=836db4a11bf0dbaa143b374b2fe2833ce5e5b8ab
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHJisMACgkQwfwUeK3K7Al/Uwf+JJF
 yRyvorB5ezvuINE91dwBroGOrlMl48B4eYf6pyGPVdewwtALvMPFuDoaI0DSpIHhLmmMe0Lg4ICU6
 Cx0KgsfgBOKOwicWRlGDiF16hy1qQ13714IFZvzbvXpgcYXcF5yEh84S5VBJSFzjcEMp857Rd9onb
 HOSlJdc0Af2Q+p0cfoh9Xfa0q/nRWnRiQKPyAlrtG+vdJvAO994aA+z5spR6VIvpYzJ9vG9cXRg1D
 O0F5KBdWx1mOzbPE1NV9/f6pyk3dHqPTYDLJBiQBhRAO/n7xG5AHihCYykHfKWHFHiXE/ypDmVMbL
 o4ZRxm/d6qhp9Uv/VnktLhk57HPS+Dg==
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, kernel@pengutronix.de,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [Linux-stm32] [PATCH v2 21/23] counter: stm32-lptimer-cnt: Convert
	to new counter registration
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

VGhpcyBmaXhlcyBkZXZpY2UgbGlmZXRpbWUgaXNzdWVzIHdoZXJlIGl0IHdhcyBwb3NzaWJsZSB0
byBmcmVlIGEgbGl2ZQpzdHJ1Y3QgZGV2aWNlLgoKRml4ZXM6IDU5N2Y1NWUzZjM2YyAoImNvdW50
ZXI6IHN0bTMyLWxwdGltZXI6IGFkZCBjb3VudGVyIGRldmljZSIpClNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJp
dmVycy9jb3VudGVyL3N0bTMyLWxwdGltZXItY250LmMgfCAzMyArKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY291bnRlci9zdG0zMi1scHRpbWVyLWNudC5jIGIv
ZHJpdmVycy9jb3VudGVyL3N0bTMyLWxwdGltZXItY250LmMKaW5kZXggOWNmMDBlOTI5Y2MwLi42
ODAzMWQ5M2NlODkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY291bnRlci9zdG0zMi1scHRpbWVyLWNu
dC5jCisrKyBiL2RyaXZlcnMvY291bnRlci9zdG0zMi1scHRpbWVyLWNudC5jCkBAIC0yMCw3ICsy
MCw2IEBACiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KIAogc3RydWN0IHN0bTMyX2xwdGltX2Nu
dCB7Ci0Jc3RydWN0IGNvdW50ZXJfZGV2aWNlIGNvdW50ZXI7CiAJc3RydWN0IGRldmljZSAqZGV2
OwogCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsKIAlzdHJ1Y3QgY2xrICpjbGs7CkBAIC00MTEsMTQg
KzQxMCwxNyBAQCBzdGF0aWMgc3RydWN0IGNvdW50ZXJfY291bnQgc3RtMzJfbHB0aW1faW4xX2Nv
dW50cyA9IHsKIHN0YXRpYyBpbnQgc3RtMzJfbHB0aW1fY250X3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IHN0bTMyX2xwdGltZXIgKmRkYXRhID0gZGV2X2dl
dF9kcnZkYXRhKHBkZXYtPmRldi5wYXJlbnQpOworCXN0cnVjdCBjb3VudGVyX2RldmljZSAqY291
bnRlcjsKIAlzdHJ1Y3Qgc3RtMzJfbHB0aW1fY250ICpwcml2OworCWludCByZXQ7CiAKIAlpZiAo
SVNfRVJSX09SX05VTEwoZGRhdGEpKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCXByaXYgPSBkZXZt
X2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpwcml2KSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKCFw
cml2KQorCWNvdW50ZXIgPSBkZXZtX2NvdW50ZXJfYWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpw
cml2KSk7CisJaWYgKCFjb3VudGVyKQogCQlyZXR1cm4gLUVOT01FTTsKKwlwcml2ID0gY291bnRl
cl9wcml2KGNvdW50ZXIpOwogCiAJcHJpdi0+ZGV2ID0gJnBkZXYtPmRldjsKIAlwcml2LT5yZWdt
YXAgPSBkZGF0YS0+cmVnbWFwOwpAQCAtNDI2LDIzICs0MjgsMjYgQEAgc3RhdGljIGludCBzdG0z
Ml9scHRpbV9jbnRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlwcml2LT5j
ZWlsaW5nID0gU1RNMzJfTFBUSU1fTUFYX0FSUjsKIAogCS8qIEluaXRpYWxpemUgQ291bnRlciBk
ZXZpY2UgKi8KLQlwcml2LT5jb3VudGVyLm5hbWUgPSBkZXZfbmFtZSgmcGRldi0+ZGV2KTsKLQlw
cml2LT5jb3VudGVyLnBhcmVudCA9ICZwZGV2LT5kZXY7Ci0JcHJpdi0+Y291bnRlci5vcHMgPSAm
c3RtMzJfbHB0aW1fY250X29wczsKKwljb3VudGVyLT5uYW1lID0gZGV2X25hbWUoJnBkZXYtPmRl
dik7CisJY291bnRlci0+cGFyZW50ID0gJnBkZXYtPmRldjsKKwljb3VudGVyLT5vcHMgPSAmc3Rt
MzJfbHB0aW1fY250X29wczsKIAlpZiAoZGRhdGEtPmhhc19lbmNvZGVyKSB7Ci0JCXByaXYtPmNv
dW50ZXIuY291bnRzID0gJnN0bTMyX2xwdGltX2VuY19jb3VudHM7Ci0JCXByaXYtPmNvdW50ZXIu
bnVtX3NpZ25hbHMgPSBBUlJBWV9TSVpFKHN0bTMyX2xwdGltX2NudF9zaWduYWxzKTsKKwkJY291
bnRlci0+Y291bnRzID0gJnN0bTMyX2xwdGltX2VuY19jb3VudHM7CisJCWNvdW50ZXItPm51bV9z
aWduYWxzID0gQVJSQVlfU0laRShzdG0zMl9scHRpbV9jbnRfc2lnbmFscyk7CiAJfSBlbHNlIHsK
LQkJcHJpdi0+Y291bnRlci5jb3VudHMgPSAmc3RtMzJfbHB0aW1faW4xX2NvdW50czsKLQkJcHJp
di0+Y291bnRlci5udW1fc2lnbmFscyA9IDE7CisJCWNvdW50ZXItPmNvdW50cyA9ICZzdG0zMl9s
cHRpbV9pbjFfY291bnRzOworCQljb3VudGVyLT5udW1fc2lnbmFscyA9IDE7CiAJfQotCXByaXYt
PmNvdW50ZXIubnVtX2NvdW50cyA9IDE7Ci0JcHJpdi0+Y291bnRlci5zaWduYWxzID0gc3RtMzJf
bHB0aW1fY250X3NpZ25hbHM7Ci0JcHJpdi0+Y291bnRlci5wcml2ID0gcHJpdjsKKwljb3VudGVy
LT5udW1fY291bnRzID0gMTsKKwljb3VudGVyLT5zaWduYWxzID0gc3RtMzJfbHB0aW1fY250X3Np
Z25hbHM7CiAKIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwcml2KTsKIAotCXJldHVybiBk
ZXZtX2NvdW50ZXJfcmVnaXN0ZXIoJnBkZXYtPmRldiwgJnByaXYtPmNvdW50ZXIpOworCXJldCA9
IGRldm1fY291bnRlcl9hZGQoJnBkZXYtPmRldiwgY291bnRlcik7CisJaWYgKHJldCA8IDApCisJ
CXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIHJldCwgIkZhaWxlZCB0byBhZGQgY291
bnRlclxuIik7CisKKwlyZXR1cm4gMDsKIH0KIAogI2lmZGVmIENPTkZJR19QTV9TTEVFUAotLSAK
Mi4zMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
