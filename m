Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE777C8C7A
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Oct 2023 19:42:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C8DEC6B45E;
	Fri, 13 Oct 2023 17:42:31 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6A33C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 17:42:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qrMBA-0004W5-5f; Fri, 13 Oct 2023 19:42:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qrMB9-001Rgt-7B; Fri, 13 Oct 2023 19:42:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qrMB8-00Fim8-U2; Fri, 13 Oct 2023 19:42:26 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Fri, 13 Oct 2023 19:42:14 +0200
Message-ID: <20231013174204.1457085-22-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013174204.1457085-13-u.kleine-koenig@pengutronix.de>
References: <20231013174204.1457085-13-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=8LOtNenmZF8wkliwgTRGuRDknwBK+eJm9E5HUGBysKU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlKYF31hWc33CRR/2b76E9SKmrA340sicAvYfa4
 67mDAktmeCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSmBdwAKCRCPgPtYfRL+
 TslDCACq68fONJQpm9wTYhKsRdckUMaZ2l50fTJlGwjxlrBJV0yrBIe/2VRyDaC961gEjp3MShG
 mNDlg5VA7i0Ydi4ikY326E3GCWSFO5MXbkDY3TP1UVERTDxMgSZy7mSZjLHUl3OmDdCu5p5XZ2F
 +GSVg1aN2RpjgbyTOaNMxoWi8ldCWf5fn/jwpv9QcxetmEDup0ikDOodsatsFZ2uQKsWRJlEd8i
 l9YO1C7y47Kopsz8KM47IebvnPEgpdys0Yh03CsyafASLBAv0bq1BPtG6JDIahfE+v1V2wrge7F
 gk0+ApkSQ2/syWIuEERbKyipwOGHmEXwkHjztNt7a5DO2SB6
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
Subject: [Linux-stm32] [PATCH v2 09/11] pwm: stm32: Use
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
cnMvcHdtL3B3bS1zdG0zMi5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc3Rt
MzIuYyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCmluZGV4IDMzMDNhNzU0ZWEwMi4uOGJlMDM3
NzU3YjhiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYworKysgYi9kcml2ZXJz
L3B3bS9wd20tc3RtMzIuYwpAQCAtNjQ1LDcgKzY0NSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdt
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIDA7CiB9CiAKLXN0
YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3RtMzJfcHdtX3N1c3BlbmQoc3RydWN0IGRldmljZSAq
ZGV2KQorc3RhdGljIGludCBzdG0zMl9wd21fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7
CiAJc3RydWN0IHN0bTMyX3B3bSAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwogCXVuc2ln
bmVkIGludCBpOwpAQCAtNjY2LDcgKzY2Niw3IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQg
c3RtMzJfcHdtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogCXJldHVybiBwaW5jdHJsX3Bt
X3NlbGVjdF9zbGVlcF9zdGF0ZShkZXYpOwogfQogCi1zdGF0aWMgaW50IF9fbWF5YmVfdW51c2Vk
IHN0bTMyX3B3bV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQorc3RhdGljIGludCBzdG0zMl9w
d21fcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2
ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAJaW50IHJldDsKQEAgLTY3OSw3ICs2NzksNyBAQCBz
dGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHN0bTMyX3B3bV9yZXN1bWUoc3RydWN0IGRldmljZSAq
ZGV2KQogCXJldHVybiBzdG0zMl9wd21fYXBwbHlfYnJlYWtpbnB1dHMocHJpdik7CiB9CiAKLXN0
YXRpYyBTSU1QTEVfREVWX1BNX09QUyhzdG0zMl9wd21fcG1fb3BzLCBzdG0zMl9wd21fc3VzcGVu
ZCwgc3RtMzJfcHdtX3Jlc3VtZSk7CitzdGF0aWMgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTKHN0
bTMyX3B3bV9wbV9vcHMsIHN0bTMyX3B3bV9zdXNwZW5kLCBzdG0zMl9wd21fcmVzdW1lKTsKIAog
c3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3RtMzJfcHdtX29mX21hdGNoW10gPSB7
CiAJeyAuY29tcGF0aWJsZSA9ICJzdCxzdG0zMi1wd20iLAl9LApAQCAtNjkyLDcgKzY5Miw3IEBA
IHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bTMyX3B3bV9kcml2ZXIgPSB7CiAJLmRy
aXZlcgk9IHsKIAkJLm5hbWUgPSAic3RtMzItcHdtIiwKIAkJLm9mX21hdGNoX3RhYmxlID0gc3Rt
MzJfcHdtX29mX21hdGNoLAotCQkucG0gPSAmc3RtMzJfcHdtX3BtX29wcywKKwkJLnBtID0gcG1f
cHRyKCZzdG0zMl9wd21fcG1fb3BzKSwKIAl9LAogfTsKIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIo
c3RtMzJfcHdtX2RyaXZlcik7Ci0tIAoyLjQyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
