Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C4E85456F
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 10:34:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C853C71286;
	Wed, 14 Feb 2024 09:34:47 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C222C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 09:34:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf5-0005pL-H8; Wed, 14 Feb 2024 10:34:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf2-000fGD-FG; Wed, 14 Feb 2024 10:34:36 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1raBf2-004Y7x-1G;
 Wed, 14 Feb 2024 10:34:36 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org
Date: Wed, 14 Feb 2024 10:32:48 +0100
Message-ID: <04af7b3d00bc932dd025200a3bf74527c29ca47a.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=wTHot0rCpWKiBWRtIdmgUzbIiXlsK2MsHRkggFr4Eu0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIjWfsROWMer2NPaGM8yPEtjhSeNg1XRlolg8
 AWibishgfCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyI1gAKCRCPgPtYfRL+
 TgWUB/4y5vvEIFNjKDCx+K+e0lnQAquLBXIOyrCvlRTM8vqRsMv7KoBhHJvLFg8qouNbV+kYFf5
 1UB3e+nPKQf26XZrNHZxD9C2PliRnTkH8SghTrdTQ6Ch/up7RgLTJBDgYZcFxJkX81Hpg68FpQY
 uVw981KCUCJUR6ZWuF/Yx2SmpJ/9lm/RL2n6pBYIzJdOh4dtn+7MmHWSP5Y+5WDw170r7feOlYG
 tLwXdqBrA7ehW28wQN6bGwBpLj3XJXMC2MPMzdqQ9Xm0SAIB++IE8rqaj7gyTtP/auOd764igOR
 2Z/68WgrXM9Asoo/a3v7Q6DUTYAmq35xWNRqK54Msj0C0IdS
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 121/164] pwm: stm32-lp: Make use of
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
ZXJzL3B3bS9wd20tc3RtMzItbHAuYyB8IDEzICsrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
d20vcHdtLXN0bTMyLWxwLmMgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzItbHAuYwppbmRleCA5NTgw
NDNiYzVjOTIuLjk4OTczMTI1NmY1MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLXN0bTMy
LWxwLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMKQEAgLTE4LDE0ICsxOCwxMyBA
QAogI2luY2x1ZGUgPGxpbnV4L3B3bS5oPgogCiBzdHJ1Y3Qgc3RtMzJfcHdtX2xwIHsKLQlzdHJ1
Y3QgcHdtX2NoaXAgY2hpcDsKIAlzdHJ1Y3QgY2xrICpjbGs7CiAJc3RydWN0IHJlZ21hcCAqcmVn
bWFwOwogfTsKIAogc3RhdGljIGlubGluZSBzdHJ1Y3Qgc3RtMzJfcHdtX2xwICp0b19zdG0zMl9w
d21fbHAoc3RydWN0IHB3bV9jaGlwICpjaGlwKQogewotCXJldHVybiBjb250YWluZXJfb2YoY2hp
cCwgc3RydWN0IHN0bTMyX3B3bV9scCwgY2hpcCk7CisJcmV0dXJuIHB3bWNoaXBfZ2V0X2RydmRh
dGEoY2hpcCk7CiB9CiAKIC8qIFNUTTMyIExvdy1Qb3dlciBUaW1lciBpcyBwcmVjZWRlZCBieSBh
IGNvbmZpZ3VyYWJsZSBwb3dlci1vZi0yIHByZXNjYWxlciAqLwpAQCAtMjAwLDE2ICsxOTksMTQg
QEAgc3RhdGljIGludCBzdG0zMl9wd21fbHBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAlzdHJ1Y3QgcHdtX2NoaXAgKmNoaXA7CiAJaW50IHJldDsKIAotCXByaXYgPSBkZXZt
X2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpwcml2KSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKCFw
cml2KQotCQlyZXR1cm4gLUVOT01FTTsKKwljaGlwID0gZGV2bV9wd21jaGlwX2FsbG9jKCZwZGV2
LT5kZXYsIDEsIHNpemVvZigqcHJpdikpOworCWlmIChJU19FUlIoY2hpcCkpCisJCXJldHVybiBQ
VFJfRVJSKGNoaXApOworCXByaXYgPSB0b19zdG0zMl9wd21fbHAoY2hpcCk7CiAKIAlwcml2LT5y
ZWdtYXAgPSBkZGF0YS0+cmVnbWFwOwogCXByaXYtPmNsayA9IGRkYXRhLT5jbGs7Ci0JY2hpcCA9
ICZwcml2LT5jaGlwOwotCWNoaXAtPmRldiA9ICZwZGV2LT5kZXY7CiAJY2hpcC0+b3BzID0gJnN0
bTMyX3B3bV9scF9vcHM7Ci0JY2hpcC0+bnB3bSA9IDE7CiAKIAlyZXQgPSBkZXZtX3B3bWNoaXBf
YWRkKCZwZGV2LT5kZXYsIGNoaXApOwogCWlmIChyZXQgPCAwKQotLSAKMi40My4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
