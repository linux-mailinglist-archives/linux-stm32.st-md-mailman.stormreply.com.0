Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 206547BF4BE
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Oct 2023 09:51:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB1C1C6B442;
	Tue, 10 Oct 2023 07:51:23 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2288EC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 07:51:22 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qq7WR-00087P-3k; Tue, 10 Oct 2023 09:51:19 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qq7WQ-000bjD-4I; Tue, 10 Oct 2023 09:51:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qq7WP-00Cvn3-RF; Tue, 10 Oct 2023 09:51:17 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Tue, 10 Oct 2023 09:51:10 +0200
Message-Id: <20231010075112.755178-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231010075112.755178-1-u.kleine-koenig@pengutronix.de>
References: <20231010075112.755178-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=J3d8GcPNU2JxszGotBSV8ACakmJafzp5yz5XcHiQaD0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlJQJm44pduhUOh3aCddSM3B/P4UVVaobbygE6l
 PzBHz6cq3mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSUCZgAKCRCPgPtYfRL+
 Ttx5B/49/KWR8RJARvVqld2wmoZpAKyXjgurfzNnviwVQFJQM+/rLjfSK0agiFekdEWjBpVSafI
 lFTXT1N8uZyDciIu+oQJuaeyfSWBvIruNaaWMw3cr/WHagipYYcApQG3rLg3p1hcd/6U+m0p5/l
 95aiQVEhxDs0ABlwM4qh5NAflNSTzdkNT4MgeHAdQZZsN0UTs4gGKXrlSocIlyVOMk5UQlrKr5h
 H9mRdqdIp7lbr09q4O0uNITV/yY2abY3g8VRHAeMJ7FkGFtT7TcnK7pc6703kZAUIybpoPlsO/T
 G1X7NCDPAVzkiwIUt+68oOjW60G5vkwQV8qI2Kvs4/B5m1+a
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
Subject: [Linux-stm32] [PATCH 09/11] pwm: stm32: Use
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
cHdtL3B3bS1zdG0zMi5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIu
YyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCmluZGV4IDNkNmJlNzc0OWUyMy4uYTljN2I1YjZh
YjIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYworKysgYi9kcml2ZXJzL3B3
bS9wd20tc3RtMzIuYwpAQCAtNjQ2LDcgKzY0Niw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRp
YyBpbnQgX19tYXliZV91bnVzZWQgc3RtMzJfcHdtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2
KQorc3RhdGljIGludCBzdG0zMl9wd21fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJ
c3RydWN0IHN0bTMyX3B3bSAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCXVuc2lnbmVk
IGludCBpOwpAQCAtNjY3LDcgKzY2Nyw3IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3Rt
MzJfcHdtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogCXJldHVybiBwaW5jdHJsX3BtX3Nl
bGVjdF9zbGVlcF9zdGF0ZShkZXYpOwogfQogCi1zdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHN0
bTMyX3B3bV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQorc3RhdGljIGludCBzdG0zMl9wd21f
cmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2ID0g
ZGV2X2dldF9kcnZkYXRhKGRldik7CiAJaW50IHJldDsKQEAgLTY4MCw3ICs2ODAsNyBAQCBzdGF0
aWMgaW50IF9fbWF5YmVfdW51c2VkIHN0bTMyX3B3bV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2
KQogCXJldHVybiBzdG0zMl9wd21fYXBwbHlfYnJlYWtpbnB1dHMocHJpdik7CiB9CiAKLXN0YXRp
YyBTSU1QTEVfREVWX1BNX09QUyhzdG0zMl9wd21fcG1fb3BzLCBzdG0zMl9wd21fc3VzcGVuZCwg
c3RtMzJfcHdtX3Jlc3VtZSk7CitzdGF0aWMgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTKHN0bTMy
X3B3bV9wbV9vcHMsIHN0bTMyX3B3bV9zdXNwZW5kLCBzdG0zMl9wd21fcmVzdW1lKTsKIAogc3Rh
dGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3RtMzJfcHdtX29mX21hdGNoW10gPSB7CiAJ
eyAuY29tcGF0aWJsZSA9ICJzdCxzdG0zMi1wd20iLAl9LApAQCAtNjkzLDcgKzY5Myw3IEBAIHN0
YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bTMyX3B3bV9kcml2ZXIgPSB7CiAJLmRyaXZl
cgk9IHsKIAkJLm5hbWUgPSAic3RtMzItcHdtIiwKIAkJLm9mX21hdGNoX3RhYmxlID0gc3RtMzJf
cHdtX29mX21hdGNoLAotCQkucG0gPSAmc3RtMzJfcHdtX3BtX29wcywKKwkJLnBtID0gcG1fcHRy
KCZzdG0zMl9wd21fcG1fb3BzKSwKIAl9LAogfTsKIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoc3Rt
MzJfcHdtX2RyaXZlcik7Ci0tIAoyLjQwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
