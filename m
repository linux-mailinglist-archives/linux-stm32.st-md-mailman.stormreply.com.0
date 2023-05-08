Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 210F16FB2B7
	for <lists+linux-stm32@lfdr.de>; Mon,  8 May 2023 16:26:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7C84C6A606;
	Mon,  8 May 2023 14:26:58 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6236BC6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 14:26:56 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1p7-0008Nv-FY; Mon, 08 May 2023 16:26:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1p4-0021HD-Rx; Mon, 08 May 2023 16:26:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1p3-002SkW-Tl; Mon, 08 May 2023 16:26:41 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon,  8 May 2023 16:26:34 +0200
Message-Id: <20230508142637.1449363-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=vvW9RACgElBEGGSHwLzRmR6fBtfpgdwfH66Xci8Z+vg=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWQaW73y5JVQKY+U6ekSEbJxfA5Bt5ER9oD9ug
 mYZXqs3lqeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFkGlgAKCRCPgPtYfRL+
 TlR/CAC6DgP+iR6ECWIqxeoM7CYVDnohhr9E9fBJ4rWTj0cN5DH9GuM2jGlIrqHm6S8ZQtW5PwJ
 rcYD1i1AuJ546JcDZ3xHwSsfT+HcemFfCavNE6agF1aq6wTtB5DlG6UXPKENG7FQVAc86jFLW/M
 6/uYfNG11+EGo9zuxbCecvM+1iVnC7FTtj2gb/tk3LG5ZhscVwikcCl/CoAyiHC3aBqbA4nb8Dy
 ZOPTNVHoG6Z98FFcxDL0OMcFAhed6y8QA2hvMHtuw2QTBfVJhV3UOAgt5pujrUunrrjvoPdbIyN
 kBnj9vfeNexsknbvPywPmmLFQWtgHxYqPOymcEVwkjHi8QKq
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Simon Horman <simon.horman@corigine.com>
Subject: [Linux-stm32] [PATCH net-next v2 08/11] net: stmmac: dwmac-sti:
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
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClJldmlld2VkLWJ5OiBTaW1v
biBIb3JtYW4gPHNpbW9uLmhvcm1hbkBjb3JpZ2luZS5jb20+ClNpZ25lZC1vZmYtYnk6IFV3ZSBL
bGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3RpLmMgfCA2ICsrLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1zdGkuYyBiL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN0aS5jCmluZGV4IDQ2NWNlNjZl
ZjljMS4uZGNiYjE3YzRmMDdhIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1zdGkuYworKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9kd21hYy1zdGkuYwpAQCAtMzE3LDE1ICszMTcsMTMgQEAgc3RhdGljIGludCBzdGlf
ZHdtYWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gcmV0Owog
fQogCi1zdGF0aWMgaW50IHN0aV9kd21hY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKK3N0YXRpYyB2b2lkIHN0aV9kd21hY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKIHsKIAlzdHJ1Y3Qgc3RpX2R3bWFjICpkd21hYyA9IGdldF9zdG1tYWNfYnNwX3By
aXYoJnBkZXYtPmRldik7CiAKIAlzdG1tYWNfZHZyX3JlbW92ZSgmcGRldi0+ZGV2KTsKIAogCWNs
a19kaXNhYmxlX3VucHJlcGFyZShkd21hYy0+Y2xrKTsKLQotCXJldHVybiAwOwogfQogCiAjaWZk
ZWYgQ09ORklHX1BNX1NMRUVQCkBAIC0zNjUsNyArMzYzLDcgQEAgTU9EVUxFX0RFVklDRV9UQUJM
RShvZiwgc3RpX2R3bWFjX21hdGNoKTsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIg
c3RpX2R3bWFjX2RyaXZlciA9IHsKIAkucHJvYmUgID0gc3RpX2R3bWFjX3Byb2JlLAotCS5yZW1v
dmUgPSBzdGlfZHdtYWNfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gc3RpX2R3bWFjX3JlbW92ZSwK
IAkuZHJpdmVyID0gewogCQkubmFtZSAgICAgICAgICAgPSAic3RpLWR3bWFjIiwKIAkJLnBtCQk9
ICZzdGlfZHdtYWNfcG1fb3BzLAotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
