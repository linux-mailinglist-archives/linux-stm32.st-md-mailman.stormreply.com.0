Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7923806E78
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Dec 2023 12:48:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EBE3C6DD6A;
	Wed,  6 Dec 2023 11:48:47 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52144C6DD69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Dec 2023 11:48:46 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAqON-0007Vn-GE; Wed, 06 Dec 2023 12:48:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAqOL-00DwxK-AA; Wed, 06 Dec 2023 12:48:37 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAqOL-00FR2k-12; Wed, 06 Dec 2023 12:48:37 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Wed,  6 Dec 2023 12:44:48 +0100
Message-ID: <08caf1d4a05831c7372d5f9c888dd495c01ddb26.1701860672.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2375;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=fUvyGLEsmdMLS9fUd3TDhVk3pL+KBTfDCccgiYGomQI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcF8j9+D52Bo6wMkF+nbCxh26G6YrEXw1s8xhE
 OOBGvElwj6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXBfIwAKCRCPgPtYfRL+
 TnSqB/95x30HM0fSMYu4cFoDcq1fkeemIN0qStKihS5vGg2r7f4QBzukXXhlmtpmyc2/Ut2YWGu
 mnrzdBzy1VIV9ENbMp2eNztK+xqaJ08iFu7/D/Yd/jL4jxNZHeuod0JJ8gtnYIqG8+sbrSG9hsL
 Yh7lWfpw7JEnnoe4F5AR5J0cq2jrXQgKtGQIRqscxpUSlHlhpk6n6DlP8yMoWFO/11AnHiDRzKK
 8uL5+5T0d4hTdQ5kfBsn5qwprAjfL6+LrF5gGdOpPxi8dTszsCXsyKcgkVF/CwrBTnB6WEOWufK
 bir+a0TShU1kP0p1ogfA1A7yMDbH71xTS1L6lKDjVGMC3q4P
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, kernel@pengutronix.de,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 094/115] pwm: stm32-lp: Make use of
	devm_pwmchip_alloc() function
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

VGhpcyBwcmVwYXJlcyB0aGUgcHdtLXN0bTMyLWxwIGRyaXZlciB0byBmdXJ0aGVyIGNoYW5nZXMg
b2YgdGhlIHB3bSBjb3JlCm91dGxpbmVkIGluIHRoZSBjb21taXQgaW50cm9kdWNpbmcgZGV2bV9w
d21jaGlwX2FsbG9jKCkuIFRoZXJlIGlzIG5vCmludGVuZGVkIHNlbWFudGljYWwgY2hhbmdlIGFu
ZCB0aGUgZHJpdmVyIHNob3VsZCBiZWhhdmUgYXMgYmVmb3JlLgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2
ZXJzL3B3bS9wd20tc3RtMzItbHAuYyB8IDIzICsrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzItbHAu
YwppbmRleCAzNzU0ZmFlY2E4MzguLjU3OWZlYTlhMGRhNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9w
d20vcHdtLXN0bTMyLWxwLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMKQEAgLTE4
LDE0ICsxOCwxMyBAQAogI2luY2x1ZGUgPGxpbnV4L3B3bS5oPgogCiBzdHJ1Y3Qgc3RtMzJfcHdt
X2xwIHsKLQlzdHJ1Y3QgcHdtX2NoaXAgY2hpcDsKIAlzdHJ1Y3QgY2xrICpjbGs7CiAJc3RydWN0
IHJlZ21hcCAqcmVnbWFwOwogfTsKIAogc3RhdGljIGlubGluZSBzdHJ1Y3Qgc3RtMzJfcHdtX2xw
ICp0b19zdG0zMl9wd21fbHAoc3RydWN0IHB3bV9jaGlwICpjaGlwKQogewotCXJldHVybiBjb250
YWluZXJfb2YoY2hpcCwgc3RydWN0IHN0bTMyX3B3bV9scCwgY2hpcCk7CisJcmV0dXJuIHB3bWNo
aXBfZ2V0X2RydmRhdGEoY2hpcCk7CiB9CiAKIC8qIFNUTTMyIExvdy1Qb3dlciBUaW1lciBpcyBw
cmVjZWRlZCBieSBhIGNvbmZpZ3VyYWJsZSBwb3dlci1vZi0yIHByZXNjYWxlciAqLwpAQCAtMTk2
LDIwICsxOTUsMjAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwd21fb3BzIHN0bTMyX3B3bV9scF9v
cHMgPSB7CiBzdGF0aWMgaW50IHN0bTMyX3B3bV9scF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQogewogCXN0cnVjdCBzdG0zMl9scHRpbWVyICpkZGF0YSA9IGRldl9nZXRfZHJ2
ZGF0YShwZGV2LT5kZXYucGFyZW50KTsKKwlzdHJ1Y3QgcHdtX2NoaXAgKmNoaXA7CiAJc3RydWN0
IHN0bTMyX3B3bV9scCAqcHJpdjsKIAlpbnQgcmV0OwogCi0JcHJpdiA9IGRldm1fa3phbGxvYygm
cGRldi0+ZGV2LCBzaXplb2YoKnByaXYpLCBHRlBfS0VSTkVMKTsKLQlpZiAoIXByaXYpCi0JCXJl
dHVybiAtRU5PTUVNOworCWNoaXAgPSBkZXZtX3B3bWNoaXBfYWxsb2MoJnBkZXYtPmRldiwgMSwg
c2l6ZW9mKCpwcml2KSk7CisJaWYgKElTX0VSUihjaGlwKSkKKwkJcmV0dXJuIFBUUl9FUlIoY2hp
cCk7CisJcHJpdiA9IHRvX3N0bTMyX3B3bV9scChjaGlwKTsKIAogCXByaXYtPnJlZ21hcCA9IGRk
YXRhLT5yZWdtYXA7CiAJcHJpdi0+Y2xrID0gZGRhdGEtPmNsazsKLQlwcml2LT5jaGlwLmRldiA9
ICZwZGV2LT5kZXY7Ci0JcHJpdi0+Y2hpcC5vcHMgPSAmc3RtMzJfcHdtX2xwX29wczsKLQlwcml2
LT5jaGlwLm5wd20gPSAxOworCWNoaXAtPm9wcyA9ICZzdG0zMl9wd21fbHBfb3BzOwogCi0JcmV0
ID0gZGV2bV9wd21jaGlwX2FkZCgmcGRldi0+ZGV2LCAmcHJpdi0+Y2hpcCk7CisJcmV0ID0gZGV2
bV9wd21jaGlwX2FkZCgmcGRldi0+ZGV2LCBjaGlwKTsKIAlpZiAocmV0IDwgMCkKIAkJcmV0dXJu
IHJldDsKIApAQCAtMjIwLDEzICsyMTksMTMgQEAgc3RhdGljIGludCBzdG0zMl9wd21fbHBfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogc3RhdGljIGludCBzdG0zMl9wd21f
bHBfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7Ci0Jc3RydWN0IHN0bTMyX3B3bV9scCAq
cHJpdiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOworCXN0cnVjdCBwd21fY2hpcCAqY2hpcCA9IGRl
dl9nZXRfZHJ2ZGF0YShkZXYpOwogCXN0cnVjdCBwd21fc3RhdGUgc3RhdGU7CiAKLQlwd21fZ2V0
X3N0YXRlKCZwcml2LT5jaGlwLnB3bXNbMF0sICZzdGF0ZSk7CisJcHdtX2dldF9zdGF0ZSgmY2hp
cC0+cHdtc1swXSwgJnN0YXRlKTsKIAlpZiAoc3RhdGUuZW5hYmxlZCkgewogCQlkZXZfZXJyKGRl
diwgIlRoZSBjb25zdW1lciBkaWRuJ3Qgc3RvcCB1cyAoJXMpXG4iLAotCQkJcHJpdi0+Y2hpcC5w
d21zWzBdLmxhYmVsKTsKKwkJCWNoaXAtPnB3bXNbMF0ubGFiZWwpOwogCQlyZXR1cm4gLUVCVVNZ
OwogCX0KIAotLSAKMi40Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
