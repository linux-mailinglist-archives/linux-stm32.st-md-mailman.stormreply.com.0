Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B796D3862
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Apr 2023 16:31:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AD23C6A5FD;
	Sun,  2 Apr 2023 14:31:16 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06CF9C6A5FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Apr 2023 14:31:15 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1piyjI-0002tv-B5; Sun, 02 Apr 2023 16:30:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1piyjF-008TQw-4g; Sun, 02 Apr 2023 16:30:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1piyjE-009zBt-I8; Sun, 02 Apr 2023 16:30:44 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Sun,  2 Apr 2023 16:30:24 +0200
Message-Id: <20230402143025.2524443-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
References: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=anKtvZugCAQ7612WUfgw0lecBejL8+CxdJGcr65UJQw=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhhTNiZWbugVTy1km2KinmF0Pjv5aWRTW155csLqkVPlcH
 pvCzJJORmMWBkYuBlkxRRb7xjWZVlVykZ1r/12GGcTKBDKFgYtTACayYiL7f38RnVcbu255Ptqc
 PydwSoNrUePp/s/ztx/ZqTX5Cu++7H0uBr7yZvVqhrUWO9etPL1uU2ap+PKK/u2xF86sb+n8L3b
 op7NshTbbzytGgq2Trp++HH7iqH1354LU8gUX+G31bz+3k2t3lTkh/XKXe1fg3qoInsMtGc/vxJ
 me4imuVM5TLJrgvS7+9f706rDwRNaEh388js6evc+GW1hP8KFb5JatWfpvF+Unxfb/XXron26IH
 zejvVWYtVkW477wbBm9rgzTYysMZJXmNyllmTL8DPpy3/2czH4O3V9zjp+uemG1WVn6KueRWWrN
 Fs/yGyN+ihttZ5X5evzyrKXZqtsK817Y3tN9zGEXFuMEAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH net-next 10/11] net: stmmac: dwmac-sun8i:
	Convert to platform remove callback returning void
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
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3VuOGkuYyB8IDYgKystLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN1bjhpLmMg
Yi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdW44aS5jCmluZGV4
IGY4MzQ0NzI1OTlmNy4uYjEyOTI3Yzc5OWNlIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdW44aS5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN1bjhpLmMKQEAgLTEyODIsNyArMTI4Miw3IEBAIHN0
YXRpYyBpbnQgc3VuOGlfZHdtYWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
IAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IHN1bjhpX2R3bWFjX3JlbW92ZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZvaWQgc3VuOGlfZHdtYWNfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IG5ldF9kZXZpY2UgKm5kZXYg
PSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAlzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYg
PSBuZXRkZXZfcHJpdihuZGV2KTsKQEAgLTEyOTcsOCArMTI5Nyw2IEBAIHN0YXRpYyBpbnQgc3Vu
OGlfZHdtYWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAlzdG1tYWNf
cGx0ZnJfcmVtb3ZlKHBkZXYpOwogCXN1bjhpX2R3bWFjX3Vuc2V0X3N5c2NvbihnbWFjKTsKLQot
CXJldHVybiAwOwogfQogCiBzdGF0aWMgdm9pZCBzdW44aV9kd21hY19zaHV0ZG93bihzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQpAQCAtMTMyOSw3ICsxMzI3LDcgQEAgTU9EVUxFX0RFVklD
RV9UQUJMRShvZiwgc3VuOGlfZHdtYWNfbWF0Y2gpOwogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3Jt
X2RyaXZlciBzdW44aV9kd21hY19kcml2ZXIgPSB7CiAJLnByb2JlICA9IHN1bjhpX2R3bWFjX3By
b2JlLAotCS5yZW1vdmUgPSBzdW44aV9kd21hY19yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBzdW44
aV9kd21hY19yZW1vdmUsCiAJLnNodXRkb3duID0gc3VuOGlfZHdtYWNfc2h1dGRvd24sCiAJLmRy
aXZlciA9IHsKIAkJLm5hbWUgICAgICAgICAgID0gImR3bWFjLXN1bjhpIiwKLS0gCjIuMzkuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
