Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 479E97A69EB
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Sep 2023 19:50:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8603C6C822;
	Tue, 19 Sep 2023 17:50:02 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1AE2C6B46F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 17:50:01 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qierD-0006np-Vf; Tue, 19 Sep 2023 19:49:56 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qierC-007VXN-QQ; Tue, 19 Sep 2023 19:49:54 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qierC-0034YV-H2; Tue, 19 Sep 2023 19:49:54 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Cameron <jic23@kernel.org>
Date: Tue, 19 Sep 2023 19:49:13 +0200
Message-Id: <20230919174931.1417681-32-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
References: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1937;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=dmnIAymv8CNJCPiwRLOlHvdF2Tf0Xf8o90wtNRq3GDc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCd8SRgMUKbaWv9gUSvomUJ6Gc5+zXzKlEC1o2
 YlBlzSTPH+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQnfEgAKCRCPgPtYfRL+
 TtGLB/9WLjl6A/vXfiGlsa4FIvIL6cjjJUnlwft+OZnvRC01DtIQ4sz13F1qqx4UA12XVOzLZhq
 3YAUSBlEcVkxZ5dxJHtRxwi4C5Wj7Z14OrOYehYl/EEwna45dkvdDKk9G1yLWLRfzmdDJRe0mWQ
 iMqHPTQq4tUm5deo3LeZrLoxzB26HfqjQSKhdUmJVu4GxOxDe4wlPfVKOK7j7HA1JI2daLYPbKl
 +sC/15meFfshu0eOfDc52iTgMvpQnv4Doy6lX+5dlrM6ot64/PAUslOsI6XDTBWAM/yuivDX0qn
 u1Rz8gTuVzlddqa67J0mrlTSgMY6mPvsERiAmx5HFz+d7OsD
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Lars-Peter Clausen <lars@metafoo.de>, kernel@pengutronix.de,
 linux-iio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 31/49] iio: dac: stm32-dac-core: Convert to
	platform remove callback returning void
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

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydApmcm9tIGVtaXR0aW5n
IGEgd2FybmluZykgYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3Mu
ClRvIGltcHJvdmUgaGVyZSB0aGVyZSBpcyBhIHF1ZXN0IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxs
YmFjayByZXR1cm4Kdm9pZC4gSW4gdGhlIGZpcnN0IHN0ZXAgb2YgdGhpcyBxdWVzdCBhbGwgZHJp
dmVycyBhcmUgY29udmVydGVkIHRvCi5yZW1vdmVfbmV3KCkgd2hpY2ggYWxyZWFkeSByZXR1cm5z
IHZvaWQuIEV2ZW50dWFsbHkgYWZ0ZXIgYWxsIGRyaXZlcnMKYXJlIGNvbnZlcnRlZCwgLnJlbW92
ZV9uZXcoKSB3aWxsIGJlIHJlbmFtZWQgdG8gLnJlbW92ZSgpLgoKVHJpdmlhbGx5IGNvbnZlcnQg
dGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpjYWxs
YmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3ZSBL
bGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVy
cy9paW8vZGFjL3N0bTMyLWRhYy1jb3JlLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9k
YWMvc3RtMzItZGFjLWNvcmUuYyBiL2RyaXZlcnMvaWlvL2RhYy9zdG0zMi1kYWMtY29yZS5jCmlu
ZGV4IDgzYmYxODRlM2FkYy4uMTVhYmUwNDg3MjllIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9k
YWMvc3RtMzItZGFjLWNvcmUuYworKysgYi9kcml2ZXJzL2lpby9kYWMvc3RtMzItZGFjLWNvcmUu
YwpAQCAtMTgzLDcgKzE4Myw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfZGFjX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBzdG0z
Ml9kYWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBz
dG0zMl9kYWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJcG1fcnVu
dGltZV9nZXRfc3luYygmcGRldi0+ZGV2KTsKIAlvZl9wbGF0Zm9ybV9kZXBvcHVsYXRlKCZwZGV2
LT5kZXYpOwpAQCAtMTkxLDggKzE5MSw2IEBAIHN0YXRpYyBpbnQgc3RtMzJfZGFjX3JlbW92ZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+
ZGV2KTsKIAlwbV9ydW50aW1lX3NldF9zdXNwZW5kZWQoJnBkZXYtPmRldik7CiAJcG1fcnVudGlt
ZV9wdXRfbm9pZGxlKCZwZGV2LT5kZXYpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQg
c3RtMzJfZGFjX2NvcmVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKQEAgLTI0OSw3ICsyNDcs
NyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBzdG0zMl9kYWNfb2ZfbWF0Y2gpOwogCiBzdGF0
aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG0zMl9kYWNfZHJpdmVyID0gewogCS5wcm9iZSA9
IHN0bTMyX2RhY19wcm9iZSwKLQkucmVtb3ZlID0gc3RtMzJfZGFjX3JlbW92ZSwKKwkucmVtb3Zl
X25ldyA9IHN0bTMyX2RhY19yZW1vdmUsCiAJLmRyaXZlciA9IHsKIAkJLm5hbWUgPSAic3RtMzIt
ZGFjLWNvcmUiLAogCQkub2ZfbWF0Y2hfdGFibGUgPSBzdG0zMl9kYWNfb2ZfbWF0Y2gsCi0tIAoy
LjQwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
