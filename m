Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6477A69F9
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Sep 2023 19:50:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F7C2C6C828;
	Tue, 19 Sep 2023 17:50:06 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00DE4C6B46F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 17:50:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qierE-0006oF-OM; Tue, 19 Sep 2023 19:49:56 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qierD-007VXS-23; Tue, 19 Sep 2023 19:49:55 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qierC-0034YZ-P5; Tue, 19 Sep 2023 19:49:54 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Cameron <jic23@kernel.org>
Date: Tue, 19 Sep 2023 19:49:14 +0200
Message-Id: <20230919174931.1417681-33-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
References: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1890;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=1E1pAxL1slucP/NdCRPrAAnNueAQtE2tI92XC3vHMko=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCd8TndXU+X4IeUGAZjN0gRQMAv4+4U2ky6rBo
 7lhgZL5lJqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQnfEwAKCRCPgPtYfRL+
 Tm0bB/0dVN7L64XU6aR7N8KV0PfiWkfxSE7gJxoJhqJU6XTbFQ/42csRaO0voPW102yzYGgPsSq
 ckKaZqIjvVYKG/0rVdM9ZS5lrUeZKrpBQS1K3Kb9ZPFVYJv8UiJO7iXo1c59ZqPh2NEQ8gSlFPb
 v/+lE+hQAXchj06AnsMUt3WP1VM9YLF7iI5S32Lq6IV3ywfC3lo+L69G6fvdCDtHHSbIp2hILXb
 is9VZb5lFUPhaQWHzTAnrPA2WN1Cf9+l9llJwX/p2XkvXjn/j87C46qNPNhjAlSnFLqID//fO/j
 dzn3zJFm+OJsG8kK1kfThoFIUhsZriEJA70+HSxvr4mokJ/2
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Lars-Peter Clausen <lars@metafoo.de>, kernel@pengutronix.de,
 linux-iio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 32/49] iio: dac: stm32-dac: Convert to
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
cy9paW8vZGFjL3N0bTMyLWRhYy5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vZGFjL3N0
bTMyLWRhYy5jIGIvZHJpdmVycy9paW8vZGFjL3N0bTMyLWRhYy5jCmluZGV4IDNjYWIyOGM3ZWUz
Yi4uNWE3MjJmMzA3ZTdlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9kYWMvc3RtMzItZGFjLmMK
KysrIGIvZHJpdmVycy9paW8vZGFjL3N0bTMyLWRhYy5jCkBAIC0zNjIsNyArMzYyLDcgQEAgc3Rh
dGljIGludCBzdG0zMl9kYWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAly
ZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IHN0bTMyX2RhY19yZW1vdmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIHN0bTMyX2RhY19yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2ID0gcGxh
dGZvcm1fZ2V0X2RydmRhdGEocGRldik7CiAKQEAgLTM3MSw4ICszNzEsNiBAQCBzdGF0aWMgaW50
IHN0bTMyX2RhY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlwbV9ydW50
aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7CiAJcG1fcnVudGltZV9zZXRfc3VzcGVuZGVkKCZwZGV2
LT5kZXYpOwogCXBtX3J1bnRpbWVfcHV0X25vaWRsZSgmcGRldi0+ZGV2KTsKLQotCXJldHVybiAw
OwogfQogCiBzdGF0aWMgaW50IHN0bTMyX2RhY19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikK
QEAgLTQwMCw3ICszOTgsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBzdG0zMl9kYWNfb2Zf
bWF0Y2gpOwogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG0zMl9kYWNfZHJpdmVy
ID0gewogCS5wcm9iZSA9IHN0bTMyX2RhY19wcm9iZSwKLQkucmVtb3ZlID0gc3RtMzJfZGFjX3Jl
bW92ZSwKKwkucmVtb3ZlX25ldyA9IHN0bTMyX2RhY19yZW1vdmUsCiAJLmRyaXZlciA9IHsKIAkJ
Lm5hbWUgPSAic3RtMzItZGFjIiwKIAkJLm9mX21hdGNoX3RhYmxlID0gc3RtMzJfZGFjX29mX21h
dGNoLAotLSAKMi40MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
