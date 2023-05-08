Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B766FB2BF
	for <lists+linux-stm32@lfdr.de>; Mon,  8 May 2023 16:27:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23EFFC6A606;
	Mon,  8 May 2023 14:27:05 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 013F4C6A5F7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 14:27:04 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1pA-0008Nw-R9; Mon, 08 May 2023 16:26:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1p5-0021HH-4G; Mon, 08 May 2023 16:26:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1p4-002Skf-E4; Mon, 08 May 2023 16:26:42 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Date: Mon,  8 May 2023 16:26:36 +0200
Message-Id: <20230508142637.1449363-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2037;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=9Shlmb8v+AhrVeULIB1h6y4X5PTP/bx9o18siJBdxbU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWQaYjHwoE7ffOgbnN/9zHTc2Ys1dOEWaUDmSv
 mL7daHRPGCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFkGmAAKCRCPgPtYfRL+
 ThxmB/9YpT7i0/4pZzNkykAmPpG7K2UmndtkX7viodk5rK+y7/jHpI9MzQoOvSmiOvbXKbHq23W
 ADUBp9RqsR9mAAGey6oGiA1f9eZ4ki7UOmCSVY0PH3HeZtV6qC4mMxh3IpkfHY95X5VVJAoFBJU
 emePzbIsg6mxX0FoEtXGY2vEN65lcb3oH7VVDbjjnJ+fS5SCFlrDxVN6B6YlESprSxQyyXeSHEb
 G935F40kizAYB//cM5dO/r2D7UyjQgIbBf5ZTSdEIyrlAC+WPJDvXLZKSOMsMmJUlBYlFeEA+ap
 ombLLAXhTZIEiDeobwalJvUmgZDdSTrTrckMD6ftRx/M8NFW
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, kernel@pengutronix.de,
 Simon Horman <simon.horman@corigine.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 10/11] net: stmmac: dwmac-sun8i:
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
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KCkFja2VkLWJ5OiBKZXJuZWog
U2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogU2ltb24gSG9y
bWFuIDxzaW1vbi5ob3JtYW5AY29yaWdpbmUuY29tPgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN1bjhpLmMgfCA2ICsrLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdW44aS5jIGIvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3VuOGkuYwppbmRleCBjMmM1OTJi
YTBlYjguLjFlNzE0MzgwZDEyNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvZHdtYWMtc3VuOGkuYworKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1zdW44aS5jCkBAIC0xMjk0LDcgKzEyOTQsNyBAQCBzdGF0aWMgaW50
IHN1bjhpX2R3bWFjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJu
IHJldDsKIH0KIAotc3RhdGljIGludCBzdW44aV9kd21hY19yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIHN1bjhpX2R3bWFjX3JlbW92ZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVjdCBuZXRfZGV2aWNlICpuZGV2ID0gcGxhdGZv
cm1fZ2V0X2RydmRhdGEocGRldik7CiAJc3RydWN0IHN0bW1hY19wcml2ICpwcml2ID0gbmV0ZGV2
X3ByaXYobmRldik7CkBAIC0xMzA5LDggKzEzMDksNiBAQCBzdGF0aWMgaW50IHN1bjhpX2R3bWFj
X3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJc3RtbWFjX3BsdGZyX3Jl
bW92ZShwZGV2KTsKIAlzdW44aV9kd21hY191bnNldF9zeXNjb24oZ21hYyk7Ci0KLQlyZXR1cm4g
MDsKIH0KIAogc3RhdGljIHZvaWQgc3VuOGlfZHdtYWNfc2h1dGRvd24oc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKQEAgLTEzNDEsNyArMTMzOSw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUo
b2YsIHN1bjhpX2R3bWFjX21hdGNoKTsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIg
c3VuOGlfZHdtYWNfZHJpdmVyID0gewogCS5wcm9iZSAgPSBzdW44aV9kd21hY19wcm9iZSwKLQku
cmVtb3ZlID0gc3VuOGlfZHdtYWNfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gc3VuOGlfZHdtYWNf
cmVtb3ZlLAogCS5zaHV0ZG93biA9IHN1bjhpX2R3bWFjX3NodXRkb3duLAogCS5kcml2ZXIgPSB7
CiAJCS5uYW1lICAgICAgICAgICA9ICJkd21hYy1zdW44aSIsCi0tIAoyLjM5LjIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
