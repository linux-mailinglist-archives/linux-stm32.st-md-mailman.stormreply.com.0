Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F37FC7D3E33
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Oct 2023 19:46:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80917C6C841;
	Mon, 23 Oct 2023 17:46:51 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BD6FC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Oct 2023 17:46:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1quz0p-0001Me-OQ; Mon, 23 Oct 2023 19:46:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1quz0p-003lPs-9r; Mon, 23 Oct 2023 19:46:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1quz0p-004VDK-0c; Mon, 23 Oct 2023 19:46:47 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 23 Oct 2023 19:46:25 +0200
Message-ID: <20231023174616.2282067-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231023174616.2282067-13-u.kleine-koenig@pengutronix.de>
References: <20231023174616.2282067-13-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1926;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=j6pb/bV7NFfh0Gqb+2QiCXxN6H2/hM95jTbHcSXTb7s=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlNrFxtiOf3cCM+SIIMQgzW7RHIZJ8t/7gucUMF
 KUWAaeslESJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTaxcQAKCRCPgPtYfRL+
 TjwMCACis/W5xSSy60KGWrakgAbnTqLOUTaABwG5nH3FIf3TR3N0hlM+pWXWiucM5eApCrO/riI
 nN8JhXBoBlym2WqXj2S/VQHyKbpJWOyI9ZT/xSIeZDCi4K63d6kwJWnKGzmtlv3fF9gmCVu99gg
 9T2jD/KQTR1FaPMla9UqhjuFxExGRzrGDbKNoBIJoccOmH/i5QDtvKmeSgmReDvv5EeU1K2eCPr
 QQ6NNLext5VCcQFIKCiaViBAUIUTXzBRcPrTgfEnkP5qOHmOWR5a7APO0LWxOBLXssUysfNAPiI
 sdbgzrlWAicBWKCkhG7aIWASue2N+PnR/B/jcZQgkPXH4+u5
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, kernel@pengutronix.de,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 08/11] pwm: stm32-lp: Use
	DEFINE_SIMPLE_DEV_PM_OPS for PM functions
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

VGhpcyBtYWNybyBoYXMgdGhlIGFkdmFudGFnZSBvdmVyIFNJTVBMRV9ERVZfUE1fT1BTIHRoYXQg
d2UgZG9uJ3QgaGF2ZSB0bwpjYXJlIGFib3V0IHdoZW4gdGhlIGZ1bmN0aW9ucyBhcmUgYWN0dWFs
bHkgdXNlZCwgc28gdGhlIGNvcnJlc3BvbmRpbmcKX19tYXliZV91bnVzZWQgY2FuIGJlIGRyb3Bw
ZWQuCgpBbHNvIG1ha2UgdXNlIG9mIHBtX3B0cigpIHRvIGRpc2NhcmQgYWxsIFBNIHJlbGF0ZWQg
c3R1ZmYgaWYgQ09ORklHX1BNCmlzbid0IGVuYWJsZWQuCgpSZXZpZXdlZC1ieTogSm9uYXRoYW4g
Q2FtZXJvbiA8Sm9uYXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZl
cnMvcHdtL3B3bS1zdG0zMi1scC5jIHwgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9w
d20tc3RtMzItbHAuYyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jCmluZGV4IGI2Nzk3NGNj
MTg3Mi4uNDM5MDY4ZjNlY2ExIDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tc3RtMzItbHAu
YworKysgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzItbHAuYwpAQCAtMjE4LDcgKzIxOCw3IEBAIHN0
YXRpYyBpbnQgc3RtMzJfcHdtX2xwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3RtMzJfcHdtX2xw
X3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQorc3RhdGljIGludCBzdG0zMl9wd21fbHBfc3Vz
cGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IHN0bTMyX3B3bV9scCAqcHJpdiA9
IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCXN0cnVjdCBwd21fc3RhdGUgc3RhdGU7CkBAIC0yMzMs
MTMgKzIzMywxMyBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHN0bTMyX3B3bV9scF9zdXNw
ZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIAlyZXR1cm4gcGluY3RybF9wbV9zZWxlY3Rfc2xlZXBf
c3RhdGUoZGV2KTsKIH0KIAotc3RhdGljIGludCBfX21heWJlX3VudXNlZCBzdG0zMl9wd21fbHBf
cmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKK3N0YXRpYyBpbnQgc3RtMzJfcHdtX2xwX3Jlc3Vt
ZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJcmV0dXJuIHBpbmN0cmxfcG1fc2VsZWN0X2RlZmF1
bHRfc3RhdGUoZGV2KTsKIH0KIAotc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKHN0bTMyX3B3bV9s
cF9wbV9vcHMsIHN0bTMyX3B3bV9scF9zdXNwZW5kLAotCQkJIHN0bTMyX3B3bV9scF9yZXN1bWUp
Oworc3RhdGljIERFRklORV9TSU1QTEVfREVWX1BNX09QUyhzdG0zMl9wd21fbHBfcG1fb3BzLCBz
dG0zMl9wd21fbHBfc3VzcGVuZCwKKwkJCQlzdG0zMl9wd21fbHBfcmVzdW1lKTsKIAogc3RhdGlj
IGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3RtMzJfcHdtX2xwX29mX21hdGNoW10gPSB7CiAJ
eyAuY29tcGF0aWJsZSA9ICJzdCxzdG0zMi1wd20tbHAiLCB9LApAQCAtMjUyLDcgKzI1Miw3IEBA
IHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bTMyX3B3bV9scF9kcml2ZXIgPSB7CiAJ
LmRyaXZlcgk9IHsKIAkJLm5hbWUgPSAic3RtMzItcHdtLWxwIiwKIAkJLm9mX21hdGNoX3RhYmxl
ID0gc3RtMzJfcHdtX2xwX29mX21hdGNoLAotCQkucG0gPSAmc3RtMzJfcHdtX2xwX3BtX29wcywK
KwkJLnBtID0gcG1fcHRyKCZzdG0zMl9wd21fbHBfcG1fb3BzKSwKIAl9LAogfTsKIG1vZHVsZV9w
bGF0Zm9ybV9kcml2ZXIoc3RtMzJfcHdtX2xwX2RyaXZlcik7Ci0tIAoyLjQyLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
