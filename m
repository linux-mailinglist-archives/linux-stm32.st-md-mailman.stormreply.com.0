Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5267F2F4B
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Nov 2023 14:51:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9DF6C6B47C;
	Tue, 21 Nov 2023 13:51:53 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22308C6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Nov 2023 13:51:53 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5RAN-0005N2-4r; Tue, 21 Nov 2023 14:51:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5RAM-00AayD-MK; Tue, 21 Nov 2023 14:51:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5RAM-004xcY-D6; Tue, 21 Nov 2023 14:51:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 21 Nov 2023 14:49:31 +0100
Message-ID: <20231121134901.208535-30-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3973;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=mp3SZMZIe1BVlm7AXDhMEr/586ii1475FtFyYgu5PSY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlXLVtYTn1MI7JGHGLwXoPx7lnAhxhLCnxk6M7O
 /MwO8SkBCWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVy1bQAKCRCPgPtYfRL+
 Tla4B/9heKoRuVqdFKkLxv5wGVy3ZI4YM1CL04RbhW7lj0ZEgWV6j8SeyI7uamIexcEyt3KZ2xi
 7SxSXEjr0wwW2qZb4Ftmsp424uPCgc1czuVwh0zCSTGoCvTf2yvq17lMjHQ5xnjcfV73MheCO4X
 2o5SkWtPNSHnfzXuyEaHV/wwD1L53z92o8V/+Jk8/2/HJ8pbKabSA1XPNfUF334flGarjCp8odl
 SPO+GkjY8fuenjW5ELsq+9e/Kgmvabyyxvi5smpg/L9cIgp+1EogIlCZiHVteEmPfhr5Zf1g+aa
 g0Vk9fHXgGPCCvbN/q1iazkYSX118WZCYBw9K74anLBzMR5U
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 029/108] pwm: stmpe: Make use of
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
cGUuYwppbmRleCBhNDZmNWI0ZGQ4MTYuLjQ5MjQ5NGI3M2E4NyAxMDA2NDQKLS0tIGEvZHJpdmVy
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
