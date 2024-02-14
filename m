Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 821AF85456E
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 10:34:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16CF5C69063;
	Wed, 14 Feb 2024 09:34:46 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98EFEC035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 09:34:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf5-0005nZ-SR; Wed, 14 Feb 2024 10:34:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf2-000fG6-57; Wed, 14 Feb 2024 10:34:36 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1raBf2-004Y7p-0H;
 Wed, 14 Feb 2024 10:34:36 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org
Date: Wed, 14 Feb 2024 10:32:46 +0100
Message-ID: <df47d1aff9b529c9a4762b6ba339a18cecba1497.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1932;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=DhwVfYK3PSVBUzZ2FBq5DeLipOrGjyXL7mQwfO9Ate8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIjTLu8CxBTkFi4qgs8ztGE1w3A0T1K4W9gN1
 Cf6LJm4zEqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyI0wAKCRCPgPtYfRL+
 TqylCACvPMxKFHFT15Jn4qEunBjFxMOoreUu6c1bQn0YeYAJE92+RJJrGaq/H5m8Y0oJXkRh2ah
 0+tWpqd9Xo6AjXK/turnQ8KpIxTiPKZ0zIJBhKDCuXZ118TeLWjZ08AAvpm4FbtCyA3ehpVcQCr
 kLW4ZH/C1bcX15IpZ/LLZuiR8l9qokNWcYjWsQe76+6QxYDScfEBhbg2+tfsxN6YF2YAr6grLSK
 2oqEdkFkyO9R4cYl+h5cdgo5vwWfA7SpxOEMAPQCY/Fp5RWPrxcXxIw41dr4+2twuCUAKnQD/BH
 zp1n2M7sNTgMEJrpoDvsmd429z1jC8PkbYGENujrDOBBC/hN
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 119/164] pwm: stm32-lp: Prepare removing
	pwm_chip from driver data
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

VGhpcyBwcmVwYXJlcyB0aGUgZHJpdmVyIGZvciBmdXJ0aGVyIGNoYW5nZXMgdGhhdCB3aWxsIGRy
b3Agc3RydWN0CnB3bV9jaGlwIGNoaXAgZnJvbSBzdHJ1Y3Qgc3RtMzJfcHdtX2xwLiBVc2UgdGhl
IHB3bV9jaGlwIGFzIGRyaXZlcgpkYXRhIGluc3RlYWQgb2YgdGhlIHN0bTMyX3B3bV9scCB0byBn
ZXQgYWNjZXNzIHRvIHRoZSBwd21fY2hpcCBpbgpzdG0zMl9wd21fbHBfc3VzcGVuZCgpIHdpdGhv
dXQgdXNpbmcgcHJpdi0+Y2hpcC4KClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1
LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9wd20vcHdtLXN0bTMy
LWxwLmMgfCAxOCArKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1zdG0z
Mi1scC5jIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMKaW5kZXggYmJhYjZiZTMxNGE4Li5i
NDZkODE5M2RkMGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jCisrKyBi
L2RyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jCkBAIC0xOTcsNiArMTk3LDcgQEAgc3RhdGljIGlu
dCBzdG0zMl9wd21fbHBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlz
dHJ1Y3Qgc3RtMzJfbHB0aW1lciAqZGRhdGEgPSBkZXZfZ2V0X2RydmRhdGEocGRldi0+ZGV2LnBh
cmVudCk7CiAJc3RydWN0IHN0bTMyX3B3bV9scCAqcHJpdjsKKwlzdHJ1Y3QgcHdtX2NoaXAgKmNo
aXA7CiAJaW50IHJldDsKIAogCXByaXYgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9m
KCpwcml2KSwgR0ZQX0tFUk5FTCk7CkBAIC0yMDUsMjggKzIwNiwyOSBAQCBzdGF0aWMgaW50IHN0
bTMyX3B3bV9scF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJcHJpdi0+
cmVnbWFwID0gZGRhdGEtPnJlZ21hcDsKIAlwcml2LT5jbGsgPSBkZGF0YS0+Y2xrOwotCXByaXYt
PmNoaXAuZGV2ID0gJnBkZXYtPmRldjsKLQlwcml2LT5jaGlwLm9wcyA9ICZzdG0zMl9wd21fbHBf
b3BzOwotCXByaXYtPmNoaXAubnB3bSA9IDE7CisJY2hpcCA9ICZwcml2LT5jaGlwOworCWNoaXAt
PmRldiA9ICZwZGV2LT5kZXY7CisJY2hpcC0+b3BzID0gJnN0bTMyX3B3bV9scF9vcHM7CisJY2hp
cC0+bnB3bSA9IDE7CiAKLQlyZXQgPSBkZXZtX3B3bWNoaXBfYWRkKCZwZGV2LT5kZXYsICZwcml2
LT5jaGlwKTsKKwlyZXQgPSBkZXZtX3B3bWNoaXBfYWRkKCZwZGV2LT5kZXYsIGNoaXApOwogCWlm
IChyZXQgPCAwKQogCQlyZXR1cm4gcmV0OwogCi0JcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwg
cHJpdik7CisJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgY2hpcCk7CiAKIAlyZXR1cm4gMDsK
IH0KIAogc3RhdGljIGludCBzdG0zMl9wd21fbHBfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYp
CiB7Ci0Jc3RydWN0IHN0bTMyX3B3bV9scCAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwor
CXN0cnVjdCBwd21fY2hpcCAqY2hpcCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCXN0cnVjdCBw
d21fc3RhdGUgc3RhdGU7CiAKLQlwd21fZ2V0X3N0YXRlKCZwcml2LT5jaGlwLnB3bXNbMF0sICZz
dGF0ZSk7CisJcHdtX2dldF9zdGF0ZSgmY2hpcC0+cHdtc1swXSwgJnN0YXRlKTsKIAlpZiAoc3Rh
dGUuZW5hYmxlZCkgewogCQlkZXZfZXJyKGRldiwgIlRoZSBjb25zdW1lciBkaWRuJ3Qgc3RvcCB1
cyAoJXMpXG4iLAotCQkJcHJpdi0+Y2hpcC5wd21zWzBdLmxhYmVsKTsKKwkJCWNoaXAtPnB3bXNb
MF0ubGFiZWwpOwogCQlyZXR1cm4gLUVCVVNZOwogCX0KIAotLSAKMi40My4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
