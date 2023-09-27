Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6887B0CB5
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Sep 2023 21:38:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41F71C6A60C;
	Wed, 27 Sep 2023 19:38:02 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40C1AC65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 19:38:01 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qlaM1-0002Z8-Qe; Wed, 27 Sep 2023 21:37:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qlaM0-009Pap-Lt; Wed, 27 Sep 2023 21:37:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qlaM0-005Rh4-CR; Wed, 27 Sep 2023 21:37:48 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Wed, 27 Sep 2023 21:37:32 +0200
Message-Id: <20230927193736.2236447-28-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230927193736.2236447-1-u.kleine-koenig@pengutronix.de>
References: <20230927193736.2236447-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1809;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=wdpMw5JzEvxaXagtk1dsizCUtUbJdxGNcbw4iT5Zf2s=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlFIR3hjV5wMnJA98u7QQq2KRE6NFjbR30iM1Ta
 LaitesBBjuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRSEdwAKCRCPgPtYfRL+
 Tga3B/489By4Xyjqvz19TcCTf3qVlYoLp1qqBeeSm+U+vlQtQlZ4GcdmT3FP93Dt9cqFDXYkpD5
 3DQam1eMaragsy3YpLSolLr7ULjIJbaxiBY1YS3QJoawLArV4j2DVdZKOmy2F4CHxqNDuAmDdCB
 T177yZYTqsIw8v8ZP8LopiRUpAtGMFiJdMSywzJ/sGM8hM6oGQ0XpUA1Ltrv834pk3OYeTZNDhL
 SSEgfIDhrn9WiL7xACX7EkWBxX7yuryJ/MFFS4OZfjXmS8+0y03wnRdG1A1jMdSmflegmW+Olv4
 oY3u3/aPHlu6xKfmQ7hBkVyXRqPevQlXLpGKdPOyHF3Zfvjp
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Rob Herring <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Florian Fainelli <f.fainelli@gmail.com>, kernel@pengutronix.de,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pm@vger.kernel.org,
 Amit Kucheria <amitk@kernel.org>, Minghao Chi <chi.minghao@zte.com.cn>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 27/31] thermal: stm: Convert to platform
	remove callback returning void
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
CgpUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYSBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuCnZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMgcXVlc3QgYWxsIGRy
aXZlcnMgYXJlIGNvbnZlcnRlZCB0bwoucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVy
bnMgdm9pZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycwphcmUgY29udmVydGVkLCAucmVt
b3ZlX25ldygpIHdpbGwgYmUgcmVuYW1lZCB0byAucmVtb3ZlKCkuCgpUcml2aWFsbHkgY29udmVy
dCB0aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCmNh
bGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50LgoKU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2
ZXJzL3RoZXJtYWwvc3Qvc3RtX3RoZXJtYWwuYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGhl
cm1hbC9zdC9zdG1fdGhlcm1hbC5jIGIvZHJpdmVycy90aGVybWFsL3N0L3N0bV90aGVybWFsLmMK
aW5kZXggMTQyYTdlNWQxMmY0Li4zNDc4NWI5Mjc2ZmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdGhl
cm1hbC9zdC9zdG1fdGhlcm1hbC5jCisrKyBiL2RyaXZlcnMvdGhlcm1hbC9zdC9zdG1fdGhlcm1h
bC5jCkBAIC01NjksMTQgKzU2OSwxMiBAQCBzdGF0aWMgaW50IHN0bV90aGVybWFsX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGlu
dCBzdG1fdGhlcm1hbF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRp
YyB2b2lkIHN0bV90aGVybWFsX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQog
ewogCXN0cnVjdCBzdG1fdGhlcm1hbF9zZW5zb3IgKnNlbnNvciA9IHBsYXRmb3JtX2dldF9kcnZk
YXRhKHBkZXYpOwogCiAJc3RtX3RoZXJtYWxfc2Vuc29yX29mZihzZW5zb3IpOwogCXRoZXJtYWxf
cmVtb3ZlX2h3bW9uX3N5c2ZzKHNlbnNvci0+dGhfZGV2KTsKLQotCXJldHVybiAwOwogfQogCiBz
dGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG1fdGhlcm1hbF9kcml2ZXIgPSB7CkBAIC01
ODYsNyArNTg0LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtX3RoZXJtYWxf
ZHJpdmVyID0gewogCQkub2ZfbWF0Y2hfdGFibGUgPSBzdG1fdGhlcm1hbF9vZl9tYXRjaCwKIAl9
LAogCS5wcm9iZQkJPSBzdG1fdGhlcm1hbF9wcm9iZSwKLQkucmVtb3ZlCQk9IHN0bV90aGVybWFs
X3JlbW92ZSwKKwkucmVtb3ZlX25ldwk9IHN0bV90aGVybWFsX3JlbW92ZSwKIH07CiBtb2R1bGVf
cGxhdGZvcm1fZHJpdmVyKHN0bV90aGVybWFsX2RyaXZlcik7CiAKLS0gCjIuNDAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
