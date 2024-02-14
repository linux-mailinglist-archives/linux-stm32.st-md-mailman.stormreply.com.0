Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC3E855B6F
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Feb 2024 08:12:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A43BDC62EFE;
	Thu, 15 Feb 2024 07:12:02 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8238C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 09:34:43 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf4-0005jX-9X; Wed, 14 Feb 2024 10:34:38 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf1-000fFl-Cn; Wed, 14 Feb 2024 10:34:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1raBf1-004Y7U-11;
 Wed, 14 Feb 2024 10:34:35 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org
Date: Wed, 14 Feb 2024 10:32:41 +0100
Message-ID: <33790c64563cb0434d7156d96f189c6037b3eb0b.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=14MfV+FXrX/aTvW2MLXTLmHT0CglDRMiyFAOzxxibSU=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhtQzHecu1gXPzzUPOtNe/yIl7YvfP489k+6fn3urYYJ15
 ESPbguGTkZjFgZGLgZZMUUW+8Y1mVZVcpGda/9dhhnEygQyhYGLUwAmUriJ/Z9N2r1LBXrmkyQM
 XoRdENM9Kjy188Bit1n3zZVObvRhm2/68MHk31tj926Qe9z0b6PvhpbIU1nqhUbKViveypS5sXc
 nTlLfuEN01hQNzrDl4Qa1TpI86v0Xc7YcaLnxqtZYcYuqzbTPsd7vLU6+kfx5LtW4qeRi2/kGQ6
 dAoQg32yrpKdKcBzIfTSlPNOy/PYsvkE+2NE38FqdxTPMR5rO5JrMcFpQp9DtV/5aQf/XzRHxsK
 e9d67jy3++a37z9kj9zeofR+8eik+asVTTolJzX+ZLN9r5al1jTAUVfva/FhS4nWlLUJIPjmz/Z
 MFfERWwqeiAhto/hIWO1A9uE0P5nTPxv8v6VeVjyrD0NAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Thu, 15 Feb 2024 07:12:00 +0000
Cc: kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 114/164] pwm: stm32: Change prototype of a
	helper to prepare further changes
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

VGhpcyBwcmVwYXJlcyB0aGUgZHJpdmVyIGZvciBmdXJ0aGVyIGNoYW5nZXMgdGhhdCB3aWxsIG1h
a2UgaXQgaGFyZGVyIHRvCmRldGVybWluZSB0aGUgcHdtX2NoaXAgZnJvbSBhIGdpdmVuIHN0bTMy
X3B3bS4gVG8ganVzdCBub3QgaGF2ZSB0byBkbwp0aGF0LCByZXdvcmsgc3RtMzJfcHdtX3Jhd19j
YXB0dXJlKCkgdG8gdGFrZSBhIHB3bV9jaGlwLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1L
w7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL3B3bS9w
d20tc3RtMzIuYyB8IDEzICsrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXN0bTMy
LmMgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwppbmRleCAyMDIxMTRjMDBhZDMuLmVjMTViYzUx
ZDkzMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKKysrIGIvZHJpdmVycy9w
d20vcHdtLXN0bTMyLmMKQEAgLTkwLDExICs5MCwxMiBAQCBzdGF0aWMgdTMyIGFjdGl2ZV9jaGFu
bmVscyhzdHJ1Y3Qgc3RtMzJfcHdtICpkZXYpCiAgKiAtIFBlcmlvZCAgICAgPSB0MiAtIHQwCiAg
KiAtIER1dHkgY3ljbGUgPSB0MSAtIHQwCiAgKi8KLXN0YXRpYyBpbnQgc3RtMzJfcHdtX3Jhd19j
YXB0dXJlKHN0cnVjdCBzdG0zMl9wd20gKnByaXYsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCitz
dGF0aWMgaW50IHN0bTMyX3B3bV9yYXdfY2FwdHVyZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0
cnVjdCBwd21fZGV2aWNlICpwd20sCiAJCQkJIHVuc2lnbmVkIGxvbmcgdG1vX21zLCB1MzIgKnJh
d19wcmQsCiAJCQkJIHUzMiAqcmF3X2R0eSkKIHsKLQlzdHJ1Y3QgZGV2aWNlICpwYXJlbnQgPSBw
cml2LT5jaGlwLmRldi0+cGFyZW50OworCXN0cnVjdCBzdG0zMl9wd20gKnByaXYgPSB0b19zdG0z
Ml9wd21fZGV2KGNoaXApOworCXN0cnVjdCBkZXZpY2UgKnBhcmVudCA9IHB3bWNoaXBfcGFyZW50
KGNoaXApLT5wYXJlbnQ7CiAJZW51bSBzdG0zMl90aW1lcnNfZG1hcyBkbWFfaWQ7CiAJdTMyIGNj
ZW4sIGNjcjsKIAlpbnQgcmV0OwpAQCAtMTcwLDcgKzE3MSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJf
cHdtX2NhcHR1cmUoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdt
LAogCiAJcmV0ID0gY2xrX2VuYWJsZShwcml2LT5jbGspOwogCWlmIChyZXQpIHsKLQkJZGV2X2Vy
cihjaGlwLT5kZXYsICJmYWlsZWQgdG8gZW5hYmxlIGNvdW50ZXIgY2xvY2tcbiIpOworCQlkZXZf
ZXJyKHB3bWNoaXBfcGFyZW50KGNoaXApLCAiZmFpbGVkIHRvIGVuYWJsZSBjb3VudGVyIGNsb2Nr
XG4iKTsKIAkJZ290byB1bmxvY2s7CiAJfQogCkBAIC0yMDgsNyArMjA5LDcgQEAgc3RhdGljIGlu
dCBzdG0zMl9wd21fY2FwdHVyZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2
aWNlICpwd20sCiAJCQkgICBUSU1fQ0NFUl9DQzEyUCA6IFRJTV9DQ0VSX0NDMzRQLCBwd20tPmh3
cHdtIDwgMiA/CiAJCQkgICBUSU1fQ0NFUl9DQzJQIDogVElNX0NDRVJfQ0M0UCk7CiAKLQlyZXQg
PSBzdG0zMl9wd21fcmF3X2NhcHR1cmUocHJpdiwgcHdtLCB0bW9fbXMsICZyYXdfcHJkLCAmcmF3
X2R0eSk7CisJcmV0ID0gc3RtMzJfcHdtX3Jhd19jYXB0dXJlKGNoaXAsIHB3bSwgdG1vX21zLCAm
cmF3X3ByZCwgJnJhd19kdHkpOwogCWlmIChyZXQpCiAJCWdvdG8gc3RvcDsKIApAQCAtMjI5LDcg
KzIzMCw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX2NhcHR1cmUoc3RydWN0IHB3bV9jaGlwICpj
aGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCQkvKiAybmQgbWVhc3VyZSB3aXRoIG5ldyBz
Y2FsZSAqLwogCQlwc2MgLz0gc2NhbGU7CiAJCXJlZ21hcF93cml0ZShwcml2LT5yZWdtYXAsIFRJ
TV9QU0MsIHBzYyk7Ci0JCXJldCA9IHN0bTMyX3B3bV9yYXdfY2FwdHVyZShwcml2LCBwd20sIHRt
b19tcywgJnJhd19wcmQsCisJCXJldCA9IHN0bTMyX3B3bV9yYXdfY2FwdHVyZShjaGlwLCBwd20s
IHRtb19tcywgJnJhd19wcmQsCiAJCQkJCSAgICAmcmF3X2R0eSk7CiAJCWlmIChyZXQpCiAJCQln
b3RvIHN0b3A7CkBAIC0yNTcsNyArMjU4LDcgQEAgc3RhdGljIGludCBzdG0zMl9wd21fY2FwdHVy
ZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCiAJCQkgICBG
SUVMRF9QUkVQKFRJTV9DQ01SX0lDMVBTQywgaWNwc2MpIHwKIAkJCSAgIEZJRUxEX1BSRVAoVElN
X0NDTVJfSUMyUFNDLCBpY3BzYykpOwogCi0JcmV0ID0gc3RtMzJfcHdtX3Jhd19jYXB0dXJlKHBy
aXYsIHB3bSwgdG1vX21zLCAmcmF3X3ByZCwgJnJhd19kdHkpOworCXJldCA9IHN0bTMyX3B3bV9y
YXdfY2FwdHVyZShjaGlwLCBwd20sIHRtb19tcywgJnJhd19wcmQsICZyYXdfZHR5KTsKIAlpZiAo
cmV0KQogCQlnb3RvIHN0b3A7CiAKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
