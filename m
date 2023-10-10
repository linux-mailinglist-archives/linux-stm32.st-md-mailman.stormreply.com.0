Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5707BF4BD
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Oct 2023 09:51:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE3CAC6B45E;
	Tue, 10 Oct 2023 07:51:23 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 245B4C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 07:51:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qq7WR-00087G-3k; Tue, 10 Oct 2023 09:51:19 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qq7WP-000bj9-U6; Tue, 10 Oct 2023 09:51:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qq7WP-00Cvn0-Km; Tue, 10 Oct 2023 09:51:17 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Tue, 10 Oct 2023 09:51:09 +0200
Message-Id: <20231010075112.755178-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231010075112.755178-1-u.kleine-koenig@pengutronix.de>
References: <20231010075112.755178-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1865;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Ie2lp5jK0RCijQw0QeInl/FaAgYLDxQHke+dn88ClU8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlJQJl2mAn/jl4uOMOspFvPR6S+3oYZDPCWeC6L
 +OuWe3zDvWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSUCZQAKCRCPgPtYfRL+
 TvIEB/9ABMEJUE/NOby37gCqrb4KC3z5SDOZIZPoBsVrQXbXcDwwsK+H8/ecRTHXKyHnaNicyVL
 GCPexNj4ZyC4hkYEdBPEgPZPR1wrQ68gKC49hqL9W/r0sqBwYY2Nv//EHG7DviaEjz5XCQWPPPj
 oheWF3hZoo5CrK+uQuU1nB4bKu+gjtuTzZVmvtRQPeFvlMuv7sCM7nYc4vjwYYOcPnFI+avhJa7
 q+TLTRwmKHqyESxWAT5GkhjWr7Gps3eU73sKJF7UBTkAat7iyKRHnh3bFdpccIqfr1t3YgdP+s0
 3T4QK5bdDvVEWbkOxhskn7DT5eeAy+Enj971PGAr5mVe2+HN
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, kernel@pengutronix.de,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 08/11] pwm: stm32-lp: Use
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
c3R1ZmYgaWYgQ09ORklHX1BNCmlzbid0IGVuYWJsZWQuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xl
aW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMv
cHdtL3B3bS1zdG0zMi1scC5jIHwgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20t
c3RtMzItbHAuYyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jCmluZGV4IGJiM2EwNDVhNzMz
NC4uYWMwMGY5MjI0YmRhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tc3RtMzItbHAuYwor
KysgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzItbHAuYwpAQCAtMjE5LDcgKzIxOSw3IEBAIHN0YXRp
YyBpbnQgc3RtMzJfcHdtX2xwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJ
cmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3RtMzJfcHdtX2xwX3N1
c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQorc3RhdGljIGludCBzdG0zMl9wd21fbHBfc3VzcGVu
ZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IHN0bTMyX3B3bV9scCAqcHJpdiA9IGRl
dl9nZXRfZHJ2ZGF0YShkZXYpOwogCXN0cnVjdCBwd21fc3RhdGUgc3RhdGU7CkBAIC0yMzQsMTMg
KzIzNCwxMyBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHN0bTMyX3B3bV9scF9zdXNwZW5k
KHN0cnVjdCBkZXZpY2UgKmRldikKIAlyZXR1cm4gcGluY3RybF9wbV9zZWxlY3Rfc2xlZXBfc3Rh
dGUoZGV2KTsKIH0KIAotc3RhdGljIGludCBfX21heWJlX3VudXNlZCBzdG0zMl9wd21fbHBfcmVz
dW1lKHN0cnVjdCBkZXZpY2UgKmRldikKK3N0YXRpYyBpbnQgc3RtMzJfcHdtX2xwX3Jlc3VtZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJcmV0dXJuIHBpbmN0cmxfcG1fc2VsZWN0X2RlZmF1bHRf
c3RhdGUoZGV2KTsKIH0KIAotc3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKHN0bTMyX3B3bV9scF9w
bV9vcHMsIHN0bTMyX3B3bV9scF9zdXNwZW5kLAotCQkJIHN0bTMyX3B3bV9scF9yZXN1bWUpOwor
c3RhdGljIERFRklORV9TSU1QTEVfREVWX1BNX09QUyhzdG0zMl9wd21fbHBfcG1fb3BzLCBzdG0z
Ml9wd21fbHBfc3VzcGVuZCwKKwkJCQlzdG0zMl9wd21fbHBfcmVzdW1lKTsKIAogc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3RtMzJfcHdtX2xwX29mX21hdGNoW10gPSB7CiAJeyAu
Y29tcGF0aWJsZSA9ICJzdCxzdG0zMi1wd20tbHAiLCB9LApAQCAtMjUzLDcgKzI1Myw3IEBAIHN0
YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bTMyX3B3bV9scF9kcml2ZXIgPSB7CiAJLmRy
aXZlcgk9IHsKIAkJLm5hbWUgPSAic3RtMzItcHdtLWxwIiwKIAkJLm9mX21hdGNoX3RhYmxlID0g
c3RtMzJfcHdtX2xwX29mX21hdGNoLAotCQkucG0gPSAmc3RtMzJfcHdtX2xwX3BtX29wcywKKwkJ
LnBtID0gcG1fcHRyKCZzdG0zMl9wd21fbHBfcG1fb3BzKSwKIAl9LAogfTsKIG1vZHVsZV9wbGF0
Zm9ybV9kcml2ZXIoc3RtMzJfcHdtX2xwX2RyaXZlcik7Ci0tIAoyLjQwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
