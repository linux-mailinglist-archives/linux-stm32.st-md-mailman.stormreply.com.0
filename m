Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AA8754466
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jul 2023 23:45:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95180C6B457;
	Fri, 14 Jul 2023 21:45:35 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34CC1C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 21:45:34 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qKQbT-0004K1-36; Fri, 14 Jul 2023 23:45:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qKQbS-00ER0c-DR; Fri, 14 Jul 2023 23:45:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qKQbR-004ugH-8a; Fri, 14 Jul 2023 23:45:29 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 14 Jul 2023 23:45:19 +0200
Message-Id: <20230714214519.2503468-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230714214519.2503468-1-u.kleine-koenig@pengutronix.de>
References: <20230714214519.2503468-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2652;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=EDmD91sjWnCFgWsPh20j8mnlhmGqcCydxE/nXHu6EDQ=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkscHulkxsmIfUAq2oACNEu2mBf4pYSihPeL7DC
 QWmHFzanYqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZLHB7gAKCRCPgPtYfRL+
 TsSCCACqH0TGE8lm/P/kgKhzeTvJ7qkTUxJSTpNJLWty1GXePG7nMi7rx18Yiu023PKv2TAxsyA
 hSl3J1FRMsluqDHWNrrc0THITbaM+uqhCHFjYXZ5XZJZguoeds44Tkz+QAzYqRZjJOXiMP45R6x
 VdefOBtJJfA9xKPyGuogienbEq+Fxu/Bod/y74AgFDdRnPla6oGXt26R3dMxdjP2NDBp0I0r/hK
 NJwr81VPEpcY4vKed/VlN4F6xaWSb0x04NH+Jy7+R67mfOrQ6tkAsAXaG/07G17HNlxGdeswmCw
 rx9AVmGRs59AHrLbxJBLqjVzk4kSbh2KYq8I2DE8EnL3ymw8
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@pengutronix.de
Subject: [Linux-stm32] [PATCH 2/2] pwm: stmpe: Don't issue error messages
	for problems in .apply_state()
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

cHdtIGRyaXZlcnMgYXJlIHN1cHBvc2VkIHRvIGJlIHNpbGVudCBmb3IgZmFpbHVyZXMgaW4gLmFw
cGx5X3N0YXRlKCkKYmVjYXVzZSBhIHByb2JsZW0gaXMgbGlrZWx5IHRvIGJlIHBlcnNpc3RlbnQg
YW5kIHNvIGl0IGNhbiBlYXNpbHkgZmxvb2QKdGhlIGtlcm5lbCBsb2cuIFNvIHJlbW92ZSBhbGwg
ZXJyb3IgbWVzc2FnZXMgZnJvbSAuYXBwbHlfc3RhdGUoKSBhbmQgdGhlCmZ1bmN0aW9ucyB0aGF0
IGFyZSAob25seSkgY2FsbGVkIGJ5IHRoYXQgY2FsbGJhY2suCgpTaWduZWQtb2ZmLWJ5OiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZl
cnMvcHdtL3B3bS1zdG1wZS5jIHwgMzUgKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1zdG1wZS5jIGIvZHJpdmVycy9wd20vcHdtLXN0bXBl
LmMKaW5kZXggZTIwNTQwNWM0ODI4Li40YThkMGQ5YjljZmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
cHdtL3B3bS1zdG1wZS5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1zdG1wZS5jCkBAIC00MywyMiAr
NDMsMTIgQEAgc3RhdGljIGludCBzdG1wZV8yNHh4X3B3bV9lbmFibGUoc3RydWN0IHB3bV9jaGlw
ICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtKQogCWludCByZXQ7CiAKIAlyZXQgPSBzdG1w
ZV9yZWdfcmVhZChzdG1wZV9wd20tPnN0bXBlLCBTVE1QRTI0WFhfUFdNQ1MpOwotCWlmIChyZXQg
PCAwKSB7Ci0JCWRldl9lcnIoY2hpcC0+ZGV2LCAiZXJyb3IgcmVhZGluZyBQV00jJXUgY29udHJv
bFxuIiwKLQkJCXB3bS0+aHdwd20pOworCWlmIChyZXQgPCAwKQogCQlyZXR1cm4gcmV0OwotCX0K
IAogCXZhbHVlID0gcmV0IHwgQklUKHB3bS0+aHdwd20pOwogCi0JcmV0ID0gc3RtcGVfcmVnX3dy
aXRlKHN0bXBlX3B3bS0+c3RtcGUsIFNUTVBFMjRYWF9QV01DUywgdmFsdWUpOwotCWlmIChyZXQp
IHsKLQkJZGV2X2VycihjaGlwLT5kZXYsICJlcnJvciB3cml0aW5nIFBXTSMldSBjb250cm9sXG4i
LAotCQkJcHdtLT5od3B3bSk7Ci0JCXJldHVybiByZXQ7Ci0JfQotCi0JcmV0dXJuIDA7CisJcmV0
dXJuIHN0bXBlX3JlZ193cml0ZShzdG1wZV9wd20tPnN0bXBlLCBTVE1QRTI0WFhfUFdNQ1MsIHZh
bHVlKTsKIH0KIAogc3RhdGljIGludCBzdG1wZV8yNHh4X3B3bV9kaXNhYmxlKHN0cnVjdCBwd21f
Y2hpcCAqY2hpcCwKQEAgLTY5LDE5ICs1OSwxMiBAQCBzdGF0aWMgaW50IHN0bXBlXzI0eHhfcHdt
X2Rpc2FibGUoc3RydWN0IHB3bV9jaGlwICpjaGlwLAogCWludCByZXQ7CiAKIAlyZXQgPSBzdG1w
ZV9yZWdfcmVhZChzdG1wZV9wd20tPnN0bXBlLCBTVE1QRTI0WFhfUFdNQ1MpOwotCWlmIChyZXQg
PCAwKSB7Ci0JCWRldl9lcnIoY2hpcC0+ZGV2LCAiZXJyb3IgcmVhZGluZyBQV00jJXUgY29udHJv
bFxuIiwKLQkJCXB3bS0+aHdwd20pOworCWlmIChyZXQgPCAwKQogCQlyZXR1cm4gcmV0OwotCX0K
IAogCXZhbHVlID0gcmV0ICYgfkJJVChwd20tPmh3cHdtKTsKIAotCXJldCA9IHN0bXBlX3JlZ193
cml0ZShzdG1wZV9wd20tPnN0bXBlLCBTVE1QRTI0WFhfUFdNQ1MsIHZhbHVlKTsKLQlpZiAocmV0
KQotCQlkZXZfZXJyKGNoaXAtPmRldiwgImVycm9yIHdyaXRpbmcgUFdNIyV1IGNvbnRyb2xcbiIs
Ci0JCQlwd20tPmh3cHdtKTsKLQlyZXR1cm4gcmV0OworCXJldHVybiBzdG1wZV9yZWdfd3JpdGUo
c3RtcGVfcHdtLT5zdG1wZSwgU1RNUEUyNFhYX1BXTUNTLCB2YWx1ZSk7CiB9CiAKIC8qIFNUTVBF
IDI0eHggUFdNIGluc3RydWN0aW9ucyAqLwpAQCAtMTI0LDExICsxMDcsOCBAQCBzdGF0aWMgaW50
IHN0bXBlXzI0eHhfcHdtX2NvbmZpZyhzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21f
ZGV2aWNlICpwd20sCiAKIAkJcmV0ID0gc3RtcGVfc2V0X2FsdGZ1bmMoc3RtcGVfcHdtLT5zdG1w
ZSwgQklUKHBpbiksCiAJCQkJCVNUTVBFX0JMT0NLX1BXTSk7Ci0JCWlmIChyZXQpIHsKLQkJCWRl
dl9lcnIoY2hpcC0+ZGV2LCAidW5hYmxlIHRvIGNvbm5lY3QgUFdNIyV1IHRvIHBpblxuIiwKLQkJ
CQlwd20tPmh3cHdtKTsKKwkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7Ci0JCX0KIAl9CiAKIAkv
KiBTVE1QRTI0WFggKi8KQEAgLTI0MSwxMSArMjIxLDggQEAgc3RhdGljIGludCBzdG1wZV8yNHh4
X3B3bV9jb25maWcoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdt
LAogCQl2YWx1ZSA9IHByb2dyYW1baV0gJiAweGZmOwogCiAJCXJldCA9IHN0bXBlX3JlZ193cml0
ZShzdG1wZV9wd20tPnN0bXBlLCBvZmZzZXQsIHZhbHVlKTsKLQkJaWYgKHJldCkgewotCQkJZGV2
X2VycihjaGlwLT5kZXYsICJlcnJvciB3cml0aW5nIHJlZ2lzdGVyICUwMng6ICVkXG4iLAotCQkJ
CW9mZnNldCwgcmV0KTsKKwkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7Ci0JCX0KIAl9CiAKIAkv
KiBJZiB3ZSB3ZXJlIGVuYWJsZWQsIHJlLWVuYWJsZSB0aGlzIFBXTSAqLwotLSAKMi4zOS4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
