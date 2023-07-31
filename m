Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1E0769D3A
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 18:55:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8484C6B46E;
	Mon, 31 Jul 2023 16:55:13 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7570C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jul 2023 16:55:12 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQWAk-0006a2-1i; Mon, 31 Jul 2023 18:55:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQWAf-000AQY-St; Mon, 31 Jul 2023 18:55:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQWAe-009NYj-T5; Mon, 31 Jul 2023 18:55:00 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thomas Bourgoin <thomas.bourgoin@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Date: Mon, 31 Jul 2023 18:54:55 +0200
Message-Id: <20230731165456.799784-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731165456.799784-1-u.kleine-koenig@pengutronix.de>
References: <20230731165456.799784-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ytR44w6YRN9/39C6QY8fX1uvrs6YC4VRP3jW0CSfK4E=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkx+dbulbrGasJLiVz+QSlpZN4aNuwRTOthCnUy
 sBwL75kSTuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMfnWwAKCRCPgPtYfRL+
 TotlCACW/Am2SIw1H/thaOKdb64wke3z0Pp6zVWWJNvJGpJanowdIrFAMxrzcXg9pjiGhMhuzyZ
 vuKHdeoerW8Alwor3VD/eBFOXvN6w5UH1cc/FbbE3P9qP3H46vR3K+VrapKrrDn6HsN3O1QMDwO
 Ukc0d97RLSiQ0Im7gZFJIDh9ZjamnKdqEQPf5Kwy99Negw29L7hbfCveYP3d2SvzBoy9PU1YCRG
 RQtphDBAuo9oVEMn7St+5V+BB14XlB/d265qyMz88zrPy80y/lWkpWI57b3ELXJIny+dIKghWfP
 SjoWJLt5gQBEPZ2ybOqBa+9ihwtnEf3eDeakwmeLgxnqT9jB
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/3] crypto: stm32/hash - Drop if block with
	always false condition
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

c3RtMzJfaGFzaF9yZW1vdmUoKSBpcyBvbmx5IGNhbGxlZCBhZnRlciBzdG0zMl9oYXNoX3Byb2Jl
KCkgc3VjY2VlZGVkLiBJbgp0aGlzIGNhc2UgcGxhdGZvcm1fc2V0X2RydmRhdGEoKSB3YXMgY2Fs
bGVkIHdpdGggYSBub24tTlVMTCBkYXRhIHBhdGFtZXRlci4KClRoZSBjaGVjayBmb3IgaGRldiBi
ZWluZyBub24tTlVMTCBjYW4gYmUgZHJvcHBlZCBiZWNhdXNlIGhkZXYgaXMgbmV2ZXIgTlVMTAoo
b3Igc29tZXRoaW5nIGJhZCBsaWtlIG1lbW9yeSBjb3JydXB0aW9uIGhhcHBlbmVkIGFuZCB0aGVu
IHRoZSBjaGVjawpkb2Vzbid0IGhlbHAgYW55IG1vcmUgZWl0aGVyKS4KClNpZ25lZC1vZmYtYnk6
IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQog
ZHJpdmVycy9jcnlwdG8vc3RtMzIvc3RtMzItaGFzaC5jIHwgNiArLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2NyeXB0by9zdG0zMi9zdG0zMi1oYXNoLmMgYi9kcml2ZXJzL2NyeXB0by9zdG0zMi9zdG0zMi1o
YXNoLmMKaW5kZXggNzVkMjgxZWRhZTJhLi5iMTAyNDMwMzU1ODQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvY3J5cHRvL3N0bTMyL3N0bTMyLWhhc2guYworKysgYi9kcml2ZXJzL2NyeXB0by9zdG0zMi9z
dG0zMi1oYXNoLmMKQEAgLTIxMTQsMTMgKzIxMTQsOSBAQCBzdGF0aWMgaW50IHN0bTMyX2hhc2hf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAogc3RhdGljIGludCBzdG0zMl9o
YXNoX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewotCXN0cnVjdCBzdG0z
Ml9oYXNoX2RldiAqaGRldjsKKwlzdHJ1Y3Qgc3RtMzJfaGFzaF9kZXYgKmhkZXYgPSBwbGF0Zm9y
bV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAlpbnQgcmV0OwogCi0JaGRldiA9IHBsYXRmb3JtX2dldF9k
cnZkYXRhKHBkZXYpOwotCWlmICghaGRldikKLQkJcmV0dXJuIC1FTk9ERVY7Ci0KIAlyZXQgPSBw
bV9ydW50aW1lX2dldF9zeW5jKGhkZXYtPmRldik7CiAKIAlzdG0zMl9oYXNoX3VucmVnaXN0ZXJf
YWxncyhoZGV2KTsKLS0gCjIuMzkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
