Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE32806E4C
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Dec 2023 12:48:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44318C6C855;
	Wed,  6 Dec 2023 11:48:30 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5132C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Dec 2023 11:48:28 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAqOA-0006MX-Mc; Wed, 06 Dec 2023 12:48:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAqOA-00DwtV-8W; Wed, 06 Dec 2023 12:48:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAqO9-00FQyi-Vg; Wed, 06 Dec 2023 12:48:25 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Wed,  6 Dec 2023 12:43:48 +0100
Message-ID: <57e5d3873f70b3568276acf19e4aab44aca38b2f.1701860672.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3973;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=nqOHV/tDUo+hlfo/kuwHS6rUPZZdrb3LlgXb0vkwHf0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcF6IqR/Jbb4F/7/mtJ1ztdur93516c4DMrzuN
 pkHIpszuqSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXBeiAAKCRCPgPtYfRL+
 TkehB/4yysccF1XsJXaCpQVfnRw/Lw9bPSWyK22hf8BtIfpdApX0SxE5x8FNgNZXdlLWgIgRrJS
 mR/CCgpWIaw6KdWygXORZe47nfocKz2jlnG9BJZuf20kSCMzOw6rFt3VmpehZ3baiTM1qyUHDIW
 XTXwF1rHPwAfel6gj/lbMRMcNhZCr1A+Rrl5sjNhZtrV/0su2alVOYy7i4AstmgaqqD5YcPogxh
 XeQHrQru5IEsCrjrHSE/hjfM1lPKc5a4KeoDZ11Xv/nPXL3uy05znLs1lDffLqB/xBvURV1HQmy
 qTeudK+mnruWdMArHH/+tCiHtm/gxWLc9vmEc82oYeufZS+W
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
Subject: [Linux-stm32] [PATCH v4 034/115] pwm: stmpe: Make use of
	pwmchip_parent() macro
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

c3RydWN0IHB3bV9jaGlwOjpkZXYgaXMgYWJvdXQgdG8gY2hhbmdlLiBUbyBub3QgaGF2ZSB0byB0
b3VjaCB0aGlzCmRyaXZlciBpbiB0aGUgc2FtZSBjb21taXQgYXMgc3RydWN0IHB3bV9jaGlwOjpk
ZXYsIHVzZSB0aGUgbWFjcm8KcHJvdmlkZWQgZm9yIGV4YWN0bHkgdGhpcyBwdXJwb3NlLgoKU2ln
bmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25p
eC5kZT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tc3RtcGUuYyB8IDIwICsrKysrKysrKystLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXN0bXBlLmMgYi9kcml2ZXJzL3B3bS9wd20tc3Rt
cGUuYwppbmRleCBkNzMwNjMxYzY1ODMuLjk0MWIxZTIxOGUzNSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9wd20vcHdtLXN0bXBlLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXN0bXBlLmMKQEAgLTQ0LDcg
KzQ0LDcgQEAgc3RhdGljIGludCBzdG1wZV8yNHh4X3B3bV9lbmFibGUoc3RydWN0IHB3bV9jaGlw
ICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtKQogCiAJcmV0ID0gc3RtcGVfcmVnX3JlYWQo
c3RtcGVfcHdtLT5zdG1wZSwgU1RNUEUyNFhYX1BXTUNTKTsKIAlpZiAocmV0IDwgMCkgewotCQlk
ZXZfZXJyKGNoaXAtPmRldiwgImVycm9yIHJlYWRpbmcgUFdNIyV1IGNvbnRyb2xcbiIsCisJCWRl
dl9lcnIocHdtY2hpcF9wYXJlbnQoY2hpcCksICJlcnJvciByZWFkaW5nIFBXTSMldSBjb250cm9s
XG4iLAogCQkJcHdtLT5od3B3bSk7CiAJCXJldHVybiByZXQ7CiAJfQpAQCAtNTMsNyArNTMsNyBA
QCBzdGF0aWMgaW50IHN0bXBlXzI0eHhfcHdtX2VuYWJsZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAs
IHN0cnVjdCBwd21fZGV2aWNlICpwd20pCiAKIAlyZXQgPSBzdG1wZV9yZWdfd3JpdGUoc3RtcGVf
cHdtLT5zdG1wZSwgU1RNUEUyNFhYX1BXTUNTLCB2YWx1ZSk7CiAJaWYgKHJldCkgewotCQlkZXZf
ZXJyKGNoaXAtPmRldiwgImVycm9yIHdyaXRpbmcgUFdNIyV1IGNvbnRyb2xcbiIsCisJCWRldl9l
cnIocHdtY2hpcF9wYXJlbnQoY2hpcCksICJlcnJvciB3cml0aW5nIFBXTSMldSBjb250cm9sXG4i
LAogCQkJcHdtLT5od3B3bSk7CiAJCXJldHVybiByZXQ7CiAJfQpAQCAtNzAsNyArNzAsNyBAQCBz
dGF0aWMgaW50IHN0bXBlXzI0eHhfcHdtX2Rpc2FibGUoc3RydWN0IHB3bV9jaGlwICpjaGlwLAog
CiAJcmV0ID0gc3RtcGVfcmVnX3JlYWQoc3RtcGVfcHdtLT5zdG1wZSwgU1RNUEUyNFhYX1BXTUNT
KTsKIAlpZiAocmV0IDwgMCkgewotCQlkZXZfZXJyKGNoaXAtPmRldiwgImVycm9yIHJlYWRpbmcg
UFdNIyV1IGNvbnRyb2xcbiIsCisJCWRldl9lcnIocHdtY2hpcF9wYXJlbnQoY2hpcCksICJlcnJv
ciByZWFkaW5nIFBXTSMldSBjb250cm9sXG4iLAogCQkJcHdtLT5od3B3bSk7CiAJCXJldHVybiBy
ZXQ7CiAJfQpAQCAtNzksNyArNzksNyBAQCBzdGF0aWMgaW50IHN0bXBlXzI0eHhfcHdtX2Rpc2Fi
bGUoc3RydWN0IHB3bV9jaGlwICpjaGlwLAogCiAJcmV0ID0gc3RtcGVfcmVnX3dyaXRlKHN0bXBl
X3B3bS0+c3RtcGUsIFNUTVBFMjRYWF9QV01DUywgdmFsdWUpOwogCWlmIChyZXQpCi0JCWRldl9l
cnIoY2hpcC0+ZGV2LCAiZXJyb3Igd3JpdGluZyBQV00jJXUgY29udHJvbFxuIiwKKwkJZGV2X2Vy
cihwd21jaGlwX3BhcmVudChjaGlwKSwgImVycm9yIHdyaXRpbmcgUFdNIyV1IGNvbnRyb2xcbiIs
CiAJCQlwd20tPmh3cHdtKTsKIAlyZXR1cm4gcmV0OwogfQpAQCAtMTI1LDcgKzEyNSw3IEBAIHN0
YXRpYyBpbnQgc3RtcGVfMjR4eF9wd21fY29uZmlnKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3Ry
dWN0IHB3bV9kZXZpY2UgKnB3bSwKIAkJcmV0ID0gc3RtcGVfc2V0X2FsdGZ1bmMoc3RtcGVfcHdt
LT5zdG1wZSwgQklUKHBpbiksCiAJCQkJCVNUTVBFX0JMT0NLX1BXTSk7CiAJCWlmIChyZXQpIHsK
LQkJCWRldl9lcnIoY2hpcC0+ZGV2LCAidW5hYmxlIHRvIGNvbm5lY3QgUFdNIyV1IHRvIHBpblxu
IiwKKwkJCWRldl9lcnIocHdtY2hpcF9wYXJlbnQoY2hpcCksICJ1bmFibGUgdG8gY29ubmVjdCBQ
V00jJXUgdG8gcGluXG4iLAogCQkJCXB3bS0+aHdwd20pOwogCQkJcmV0dXJuIHJldDsKIAkJfQpA
QCAtMTUwLDcgKzE1MCw3IEBAIHN0YXRpYyBpbnQgc3RtcGVfMjR4eF9wd21fY29uZmlnKHN0cnVj
dCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKIAkJcmV0dXJuIC1FTk9E
RVY7CiAJfQogCi0JZGV2X2RiZyhjaGlwLT5kZXYsICJQV00jJXU6IGNvbmZpZyBkdXR5ICVkIG5z
LCBwZXJpb2QgJWQgbnNcbiIsCisJZGV2X2RiZyhwd21jaGlwX3BhcmVudChjaGlwKSwgIlBXTSMl
dTogY29uZmlnIGR1dHkgJWQgbnMsIHBlcmlvZCAlZCBuc1xuIiwKIAkJcHdtLT5od3B3bSwgZHV0
eV9ucywgcGVyaW9kX25zKTsKIAogCWlmIChkdXR5X25zID09IDApIHsKQEAgLTIxNiw3ICsyMTYs
NyBAQCBzdGF0aWMgaW50IHN0bXBlXzI0eHhfcHdtX2NvbmZpZyhzdHJ1Y3QgcHdtX2NoaXAgKmNo
aXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCiAJCQlwcm9ncmFtWzFdID0gQlJBTkNIOwogCQl9
CiAKLQkJZGV2X2RiZyhjaGlwLT5kZXYsCisJCWRldl9kYmcocHdtY2hpcF9wYXJlbnQoY2hpcCks
CiAJCQkiUFdNIyV1OiB2YWx1ZSA9ICUwMngsIGxhc3RfZHV0eSA9ICUwMngsIHByb2dyYW09JTA0
eCwlMDR4LCUwNHhcbiIsCiAJCQlwd20tPmh3cHdtLCB2YWx1ZSwgbGFzdCwgcHJvZ3JhbVswXSwg
cHJvZ3JhbVsxXSwKIAkJCXByb2dyYW1bMl0pOwpAQCAtMjMzLDcgKzIzMyw3IEBAIHN0YXRpYyBp
bnQgc3RtcGVfMjR4eF9wd21fY29uZmlnKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3
bV9kZXZpY2UgKnB3bSwKIAogCQlyZXQgPSBzdG1wZV9yZWdfd3JpdGUoc3RtcGVfcHdtLT5zdG1w
ZSwgb2Zmc2V0LCB2YWx1ZSk7CiAJCWlmIChyZXQpIHsKLQkJCWRldl9lcnIoY2hpcC0+ZGV2LCAi
ZXJyb3Igd3JpdGluZyByZWdpc3RlciAlMDJ4OiAlZFxuIiwKKwkJCWRldl9lcnIocHdtY2hpcF9w
YXJlbnQoY2hpcCksICJlcnJvciB3cml0aW5nIHJlZ2lzdGVyICUwMng6ICVkXG4iLAogCQkJCW9m
ZnNldCwgcmV0KTsKIAkJCXJldHVybiByZXQ7CiAJCX0KQEAgLTI0Miw3ICsyNDIsNyBAQCBzdGF0
aWMgaW50IHN0bXBlXzI0eHhfcHdtX2NvbmZpZyhzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVj
dCBwd21fZGV2aWNlICpwd20sCiAKIAkJcmV0ID0gc3RtcGVfcmVnX3dyaXRlKHN0bXBlX3B3bS0+
c3RtcGUsIG9mZnNldCwgdmFsdWUpOwogCQlpZiAocmV0KSB7Ci0JCQlkZXZfZXJyKGNoaXAtPmRl
diwgImVycm9yIHdyaXRpbmcgcmVnaXN0ZXIgJTAyeDogJWRcbiIsCisJCQlkZXZfZXJyKHB3bWNo
aXBfcGFyZW50KGNoaXApLCAiZXJyb3Igd3JpdGluZyByZWdpc3RlciAlMDJ4OiAlZFxuIiwKIAkJ
CQlvZmZzZXQsIHJldCk7CiAJCQlyZXR1cm4gcmV0OwogCQl9CkBAIC0yNTUsNyArMjU1LDcgQEAg
c3RhdGljIGludCBzdG1wZV8yNHh4X3B3bV9jb25maWcoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBz
dHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCS8qIFNsZWVwIGZvciAyMDBtcyBzbyB3ZSdyZSBzdXJl
IGl0IHdpbGwgdGFrZSBlZmZlY3QgKi8KIAltc2xlZXAoMjAwKTsKIAotCWRldl9kYmcoY2hpcC0+
ZGV2LCAicHJvZ3JhbW1lZCBQV00jJXUsICV1IGJ5dGVzXG4iLCBwd20tPmh3cHdtLCBpKTsKKwlk
ZXZfZGJnKHB3bWNoaXBfcGFyZW50KGNoaXApLCAicHJvZ3JhbW1lZCBQV00jJXUsICV1IGJ5dGVz
XG4iLCBwd20tPmh3cHdtLCBpKTsKIAogCXJldHVybiAwOwogfQotLSAKMi40Mi4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
