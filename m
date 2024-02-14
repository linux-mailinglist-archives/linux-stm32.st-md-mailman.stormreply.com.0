Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5089885456C
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 10:34:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7479C640E5;
	Wed, 14 Feb 2024 09:34:45 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E469BC035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 09:34:43 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf5-0005rI-Mh; Wed, 14 Feb 2024 10:34:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf2-000fGK-QI; Wed, 14 Feb 2024 10:34:36 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1raBf2-004Y85-2N;
 Wed, 14 Feb 2024 10:34:36 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org
Date: Wed, 14 Feb 2024 10:32:50 +0100
Message-ID: <7e3dbf3b70126038c0ba16331ca8c07cab575bd3.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2455;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=Bb8YBorqx+bVzwUkLBbdXoJMd39BE0M+Jl5c4roRp5w=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIjYOMQ8tTWUOYAVYGSFAA+Yj0Hz+F/f4oxBl
 Rnfs+qAKOGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyI2AAKCRCPgPtYfRL+
 Th1jB/0fMrZDxTfd7Yt+yAj4BDFhl1L44RtBqZZzcd1IUYVMTqIwcgf76dzxY1D879k4DWMYWnH
 4Qm4c4MoBoAhwFS7b9es8RzCCxmNZqwHGYASw8WyyaWHsexjOTvI3n436eZzN6KOk5HVrUNfLU4
 7CU4WRiFuAUiT8h4DMuJsdqAkFC7Eju+QqYLX4BDITHtibkh58JrxaYobxYvAADm3Q9oNs1V4gc
 Fb4TFuw69uGkZ4Pv43Z0BBebpEdEi++I9Vr92rIvhxG9UWPDoZ4la0/jkcJOpMA5dkdmE/djM9v
 xBq2hV0PAPuPFd06QXzl6mQeCCU8+n+7m6mvMjR3bozH6tlO
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 123/164] pwm: stmpe: Make use of
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

VGhpcyBwcmVwYXJlcyB0aGUgcHdtLXN0bXBlIGRyaXZlciB0byBmdXJ0aGVyIGNoYW5nZXMgb2Yg
dGhlIHB3bSBjb3JlCm91dGxpbmVkIGluIHRoZSBjb21taXQgaW50cm9kdWNpbmcgZGV2bV9wd21j
aGlwX2FsbG9jKCkuIFRoZXJlIGlzIG5vCmludGVuZGVkIHNlbWFudGljYWwgY2hhbmdlIGFuZCB0
aGUgZHJpdmVyIHNob3VsZCBiZWhhdmUgYXMgYmVmb3JlLgoKU2lnbmVkLW9mZi1ieTogVXdlIEts
ZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJz
L3B3bS9wd20tc3RtcGUuYyB8IDM4ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXN0bXBlLmMgYi9kcml2ZXJzL3B3bS9wd20tc3Rt
cGUuYwppbmRleCAwNWYzZjM4MDMxZWUuLmJiOTEwNjJkNWYxZCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9wd20vcHdtLXN0bXBlLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXN0bXBlLmMKQEAgLTI3LDEz
ICsyNywxMiBAQAogCiBzdHJ1Y3Qgc3RtcGVfcHdtIHsKIAlzdHJ1Y3Qgc3RtcGUgKnN0bXBlOwot
CXN0cnVjdCBwd21fY2hpcCBjaGlwOwogCXU4IGxhc3RfZHV0eTsKIH07CiAKIHN0YXRpYyBpbmxp
bmUgc3RydWN0IHN0bXBlX3B3bSAqdG9fc3RtcGVfcHdtKHN0cnVjdCBwd21fY2hpcCAqY2hpcCkK
IHsKLQlyZXR1cm4gY29udGFpbmVyX29mKGNoaXAsIHN0cnVjdCBzdG1wZV9wd20sIGNoaXApOwor
CXJldHVybiBwd21jaGlwX2dldF9kcnZkYXRhKGNoaXApOwogfQogCiBzdGF0aWMgaW50IHN0bXBl
XzI0eHhfcHdtX2VuYWJsZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNl
ICpwd20pCkBAIC0yOTIsMzMgKzI5MSwzNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHB3bV9vcHMg
c3RtcGVfMjR4eF9wd21fb3BzID0gewogc3RhdGljIGludCBfX2luaXQgc3RtcGVfcHdtX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IHN0bXBlICpzdG1wZSA9
IGRldl9nZXRfZHJ2ZGF0YShwZGV2LT5kZXYucGFyZW50KTsKKwlzdHJ1Y3QgcHdtX2NoaXAgKmNo
aXA7CiAJc3RydWN0IHN0bXBlX3B3bSAqc3RtcGVfcHdtOwogCWludCByZXQ7CiAKLQlzdG1wZV9w
d20gPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpzdG1wZV9wd20pLCBHRlBfS0VS
TkVMKTsKLQlpZiAoIXN0bXBlX3B3bSkKLQkJcmV0dXJuIC1FTk9NRU07CisJc3dpdGNoIChzdG1w
ZS0+cGFydG51bSkgeworCWNhc2UgU1RNUEUyNDAxOgorCWNhc2UgU1RNUEUyNDAzOgorCQlicmVh
azsKKwljYXNlIFNUTVBFMTYwMToKKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwg
LUVOT0RFViwKKwkJCQkgICAgICJTVE1QRTE2MDEgbm90IHlldCBzdXBwb3J0ZWRcbiIpOworCWRl
ZmF1bHQ6CisJCXJldHVybiBkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIC1FTk9ERVYsCisJCQkJ
ICAgICAiVW5rbm93biBTVE1QRSBQV01cbiIpOworCX0KKworCWNoaXAgPSBkZXZtX3B3bWNoaXBf
YWxsb2MoJnBkZXYtPmRldiwgMywgc2l6ZW9mKCpzdG1wZV9wd20pKTsKKwlpZiAoSVNfRVJSKGNo
aXApKQorCQlyZXR1cm4gUFRSX0VSUihjaGlwKTsKKwlzdG1wZV9wd20gPSB0b19zdG1wZV9wd20o
Y2hpcCk7CiAKIAlzdG1wZV9wd20tPnN0bXBlID0gc3RtcGU7Ci0Jc3RtcGVfcHdtLT5jaGlwLmRl
diA9ICZwZGV2LT5kZXY7CiAKLQlpZiAoc3RtcGUtPnBhcnRudW0gPT0gU1RNUEUyNDAxIHx8IHN0
bXBlLT5wYXJ0bnVtID09IFNUTVBFMjQwMykgewotCQlzdG1wZV9wd20tPmNoaXAub3BzID0gJnN0
bXBlXzI0eHhfcHdtX29wczsKLQkJc3RtcGVfcHdtLT5jaGlwLm5wd20gPSAzOwotCX0gZWxzZSB7
Ci0JCWlmIChzdG1wZS0+cGFydG51bSA9PSBTVE1QRTE2MDEpCi0JCQlkZXZfZXJyKCZwZGV2LT5k
ZXYsICJTVE1QRTE2MDEgbm90IHlldCBzdXBwb3J0ZWRcbiIpOwotCQllbHNlCi0JCQlkZXZfZXJy
KCZwZGV2LT5kZXYsICJVbmtub3duIFNUTVBFIFBXTVxuIik7Ci0KLQkJcmV0dXJuIC1FTk9ERVY7
Ci0JfQorCWNoaXAtPm9wcyA9ICZzdG1wZV8yNHh4X3B3bV9vcHM7CiAKIAlyZXQgPSBzdG1wZV9l
bmFibGUoc3RtcGUsIFNUTVBFX0JMT0NLX1BXTSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsK
IAotCXJldCA9IHB3bWNoaXBfYWRkKCZzdG1wZV9wd20tPmNoaXApOworCXJldCA9IHB3bWNoaXBf
YWRkKGNoaXApOwogCWlmIChyZXQpIHsKIAkJc3RtcGVfZGlzYWJsZShzdG1wZSwgU1RNUEVfQkxP
Q0tfUFdNKTsKIAkJcmV0dXJuIHJldDsKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
