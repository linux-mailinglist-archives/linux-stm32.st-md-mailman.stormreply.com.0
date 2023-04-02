Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EDF6D385A
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Apr 2023 16:31:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F365BC6A603;
	Sun,  2 Apr 2023 14:31:05 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76494C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Apr 2023 14:31:04 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1piyjJ-0002ti-SF; Sun, 02 Apr 2023 16:30:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1piyjE-008TQc-4W; Sun, 02 Apr 2023 16:30:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1piyjD-009zBU-7C; Sun, 02 Apr 2023 16:30:43 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Date: Sun,  2 Apr 2023 16:30:18 +0200
Message-Id: <20230402143025.2524443-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
References: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2002;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=LkVihdJ5p8UbHHRBOAjFQZc0NQcaCwML95naO1Tshi4=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKZFy3bkYvutTDJfuvw/GXbtcjwpuz40aqGhZ8
 e9Lv4GGvmaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCmRcgAKCRCPgPtYfRL+
 TsmtB/0XvwsWvMGfui5gmzs6r4sUlkDtS6Cpd5c6a754loJS84H83j0nYAuQ3MsqAryR3HBTHst
 GFngmBVWdcZS5c4TGzxiPzoO/lHvqO/Pjecb/TB0vO8eFcvfztmLITthvAc9P5duy9LmbFCaS91
 C0jXE3VgARt+Kao60zfI6cw5/O9jfGZ8LZN5NXyWAcIbylPnX3YPnL1lS4u3lHmiFU5A7V9WLHL
 CT6o5k5Aw2xu1PIPKPRAPdfIQXnjLz0+4DXX08FF/iwrazecZEVYfVLMQGWJBjeNoo418bvYiba
 8IfA09cXcG3FyySHwzx9L02CX447CaDc5EYK7Tw/1Tf9RXfj
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 04/11] net: stmmac: dwmac-visconti:
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
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtdmlzY29udGkuYyB8IDcgKyst
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy12aXNj
b250aS5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtdmlzY29u
dGkuYwppbmRleCA3NTMxZmNkNGZmZTIuLmFjYmIyODRiZTE3NCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtdmlzY29udGkuYworKysgYi9kcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy12aXNjb250aS5jCkBAIC0yNTcs
MTkgKzI1NywxNiBAQCBzdGF0aWMgaW50IHZpc2NvbnRpX2V0aF9kd21hY19wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBpbnQgdmlz
Y29udGlfZXRoX2R3bWFjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3Rh
dGljIHZvaWQgdmlzY29udGlfZXRoX2R3bWFjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogewogCXN0cnVjdCBuZXRfZGV2aWNlICpuZGV2ID0gcGxhdGZvcm1fZ2V0X2RydmRh
dGEocGRldik7CiAJc3RydWN0IHN0bW1hY19wcml2ICpwcml2ID0gbmV0ZGV2X3ByaXYobmRldik7
Ci0JaW50IGVycjsKIAogCXN0bW1hY19wbHRmcl9yZW1vdmUocGRldik7CiAKIAl2aXNjb250aV9l
dGhfY2xvY2tfcmVtb3ZlKHBkZXYpOwogCiAJc3RtbWFjX3JlbW92ZV9jb25maWdfZHQocGRldiwg
cHJpdi0+cGxhdCk7Ci0KLQlyZXR1cm4gZXJyOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCB2aXNjb250aV9ldGhfZHdtYWNfbWF0Y2hbXSA9IHsKQEAgLTI4MCw3ICsyNzcs
NyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCB2aXNjb250aV9ldGhfZHdtYWNfbWF0Y2gpOwog
CiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciB2aXNjb250aV9ldGhfZHdtYWNfZHJpdmVy
ID0gewogCS5wcm9iZSAgPSB2aXNjb250aV9ldGhfZHdtYWNfcHJvYmUsCi0JLnJlbW92ZSA9IHZp
c2NvbnRpX2V0aF9kd21hY19yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSB2aXNjb250aV9ldGhfZHdt
YWNfcmVtb3ZlLAogCS5kcml2ZXIgPSB7CiAJCS5uYW1lICAgICAgICAgICA9ICJ2aXNjb250aS1l
dGgtZHdtYWMiLAogCQkub2ZfbWF0Y2hfdGFibGUgPSB2aXNjb250aV9ldGhfZHdtYWNfbWF0Y2gs
Ci0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
