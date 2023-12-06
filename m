Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 206EE80769C
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Dec 2023 18:30:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B2090C6DD6A;
	Wed,  6 Dec 2023 17:30:54 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AD60C6C85F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Dec 2023 17:30:53 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAvjX-0000Ul-92; Wed, 06 Dec 2023 18:30:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAvjW-00E0iy-B0; Wed, 06 Dec 2023 18:30:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAvjW-00FdcZ-1R; Wed, 06 Dec 2023 18:30:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Wed,  6 Dec 2023 18:30:43 +0100
Message-ID: <20231206173042.1762233-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2911;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=vC1n9UqzjYgVwvtpQ0rpTKRf0oBlyHd84psPO2kGVTk=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcK/D0emr33wY8gr0c3fyro3jDAZFmdv96BWgl
 TNDQr8HafSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXCvwwAKCRCPgPtYfRL+
 Tq15B/9QFXtj60VmNUyFVM7whafg5aew9JZVK9JerSltr/zMHPfIKyTojZHE3Fu6QCbbsKKtYVR
 aebHIOj6j6rgI+sE6VgGnor8G5JaNd5+xkyvGWXgdWhJ9WuyTat4MKzz35/Nmx1S7BDbYeLVQwY
 VG7sF7FUJ1zS6Sn52qcHty51Vs6zpk5fSgIpJ7mORpb2PdXxrx1SEBLlzXQs+QJzZutMKJ64Jqi
 n41e+XE9dsNxNg+LJemSA1GSlKux9P2JqG0c4hoB6KA/tTMqKCWX0LpVc6iiS5qqwXlayQ6OUJI
 OzSndfXqCpB4gIYfcn7cdyQ+b+7bzbExaIDsMKtqEPci0T61
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] pwm: stmpe: Silence duplicate error messages
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

c3RtcGVfcmVnX3JlYWQoKSBhbmQgc3RtcGVfcmVnX3dyaXRlKCkgYWxyZWFkeSBlbWl0IGVycm9y
IG1lc3NhZ2VzIHdoZW4KdGhleSBmYWlsLiBTbyB0aGUgZXh0cmEgZXJyb3IgbWVzc2FnZXMgaW4g
dGhlIHB3bSBkcml2ZXIgYXJlIG9ubHkgbGl0dGxlCnVzZWZ1bC4gVGhleSBhcmUgdXNlZnVsIGlu
IHNvbWUgc2l0dWF0aW9uLCBhcyB0aGV5IGdpdmUgYSBiaXQgb2YgY29udGV4dAp0byB0aGUgZmFp
bGluZyByZWdpc3RlciB3cml0ZS4gU28gZG9uJ3QgcmVtb3ZlIHRoZW0gYnV0IGRlZ3JhZGUgdGhl
bSB0bwpkZXZfZGJnKCkuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KSGVsbG8sCgpzb21lIHRpbWUgYWdvIEkgc3Vn
Z2VzdGVkIHRvIHJlbW92ZSB0aGUgZXJyb3IgbWVzc2FnZXMuIFRoaWVycnkKc3VnZ2VzdGVkIGlu
c3RlYWQgdG8gdHVybiB0aGVtIGludG8gZGV2X2RiZyBpbnN0ZWFkLgoKU2VlCmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LXB3bS8yMDIzMDcyODA4MTgwMy5hc3diejRzbHZycXFpNWhjQHBl
bmd1dHJvbml4LmRlCmZvciB0aGUgdGhyZWFkIHdoZXJlIHRoYXQgaGFwcGVuZC4KCkJlc3QgcmVn
YXJkcwpVd2UKCiBkcml2ZXJzL3B3bS9wd20tc3RtcGUuYyB8IDEyICsrKysrKy0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3B3bS9wd20tc3RtcGUuYyBiL2RyaXZlcnMvcHdtL3B3bS1zdG1wZS5jCmluZGV4
IGQ3MzA2MzFjNjU4My4uMTljMGMwZjM5Njc1IDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20t
c3RtcGUuYworKysgYi9kcml2ZXJzL3B3bS9wd20tc3RtcGUuYwpAQCAtNDQsNyArNDQsNyBAQCBz
dGF0aWMgaW50IHN0bXBlXzI0eHhfcHdtX2VuYWJsZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0
cnVjdCBwd21fZGV2aWNlICpwd20pCiAKIAlyZXQgPSBzdG1wZV9yZWdfcmVhZChzdG1wZV9wd20t
PnN0bXBlLCBTVE1QRTI0WFhfUFdNQ1MpOwogCWlmIChyZXQgPCAwKSB7Ci0JCWRldl9lcnIoY2hp
cC0+ZGV2LCAiZXJyb3IgcmVhZGluZyBQV00jJXUgY29udHJvbFxuIiwKKwkJZGV2X2RiZyhjaGlw
LT5kZXYsICJlcnJvciByZWFkaW5nIFBXTSMldSBjb250cm9sXG4iLAogCQkJcHdtLT5od3B3bSk7
CiAJCXJldHVybiByZXQ7CiAJfQpAQCAtNTMsNyArNTMsNyBAQCBzdGF0aWMgaW50IHN0bXBlXzI0
eHhfcHdtX2VuYWJsZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpw
d20pCiAKIAlyZXQgPSBzdG1wZV9yZWdfd3JpdGUoc3RtcGVfcHdtLT5zdG1wZSwgU1RNUEUyNFhY
X1BXTUNTLCB2YWx1ZSk7CiAJaWYgKHJldCkgewotCQlkZXZfZXJyKGNoaXAtPmRldiwgImVycm9y
IHdyaXRpbmcgUFdNIyV1IGNvbnRyb2xcbiIsCisJCWRldl9kYmcoY2hpcC0+ZGV2LCAiZXJyb3Ig
d3JpdGluZyBQV00jJXUgY29udHJvbFxuIiwKIAkJCXB3bS0+aHdwd20pOwogCQlyZXR1cm4gcmV0
OwogCX0KQEAgLTcwLDcgKzcwLDcgQEAgc3RhdGljIGludCBzdG1wZV8yNHh4X3B3bV9kaXNhYmxl
KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwKIAogCXJldCA9IHN0bXBlX3JlZ19yZWFkKHN0bXBlX3B3
bS0+c3RtcGUsIFNUTVBFMjRYWF9QV01DUyk7CiAJaWYgKHJldCA8IDApIHsKLQkJZGV2X2Vycihj
aGlwLT5kZXYsICJlcnJvciByZWFkaW5nIFBXTSMldSBjb250cm9sXG4iLAorCQlkZXZfZGJnKGNo
aXAtPmRldiwgImVycm9yIHJlYWRpbmcgUFdNIyV1IGNvbnRyb2xcbiIsCiAJCQlwd20tPmh3cHdt
KTsKIAkJcmV0dXJuIHJldDsKIAl9CkBAIC03OSw3ICs3OSw3IEBAIHN0YXRpYyBpbnQgc3RtcGVf
MjR4eF9wd21fZGlzYWJsZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsCiAKIAlyZXQgPSBzdG1wZV9y
ZWdfd3JpdGUoc3RtcGVfcHdtLT5zdG1wZSwgU1RNUEUyNFhYX1BXTUNTLCB2YWx1ZSk7CiAJaWYg
KHJldCkKLQkJZGV2X2VycihjaGlwLT5kZXYsICJlcnJvciB3cml0aW5nIFBXTSMldSBjb250cm9s
XG4iLAorCQlkZXZfZGJnKGNoaXAtPmRldiwgImVycm9yIHdyaXRpbmcgUFdNIyV1IGNvbnRyb2xc
biIsCiAJCQlwd20tPmh3cHdtKTsKIAlyZXR1cm4gcmV0OwogfQpAQCAtMjMzLDcgKzIzMyw3IEBA
IHN0YXRpYyBpbnQgc3RtcGVfMjR4eF9wd21fY29uZmlnKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwg
c3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKIAogCQlyZXQgPSBzdG1wZV9yZWdfd3JpdGUoc3RtcGVf
cHdtLT5zdG1wZSwgb2Zmc2V0LCB2YWx1ZSk7CiAJCWlmIChyZXQpIHsKLQkJCWRldl9lcnIoY2hp
cC0+ZGV2LCAiZXJyb3Igd3JpdGluZyByZWdpc3RlciAlMDJ4OiAlZFxuIiwKKwkJCWRldl9kYmco
Y2hpcC0+ZGV2LCAiZXJyb3Igd3JpdGluZyByZWdpc3RlciAlMDJ4OiAlZFxuIiwKIAkJCQlvZmZz
ZXQsIHJldCk7CiAJCQlyZXR1cm4gcmV0OwogCQl9CkBAIC0yNDIsNyArMjQyLDcgQEAgc3RhdGlj
IGludCBzdG1wZV8yNHh4X3B3bV9jb25maWcoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3Qg
cHdtX2RldmljZSAqcHdtLAogCiAJCXJldCA9IHN0bXBlX3JlZ193cml0ZShzdG1wZV9wd20tPnN0
bXBlLCBvZmZzZXQsIHZhbHVlKTsKIAkJaWYgKHJldCkgewotCQkJZGV2X2VycihjaGlwLT5kZXYs
ICJlcnJvciB3cml0aW5nIHJlZ2lzdGVyICUwMng6ICVkXG4iLAorCQkJZGV2X2RiZyhjaGlwLT5k
ZXYsICJlcnJvciB3cml0aW5nIHJlZ2lzdGVyICUwMng6ICVkXG4iLAogCQkJCW9mZnNldCwgcmV0
KTsKIAkJCXJldHVybiByZXQ7CiAJCX0KLS0gCjIuNDIuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
