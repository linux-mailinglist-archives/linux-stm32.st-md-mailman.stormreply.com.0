Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5EE6FB2BC
	for <lists+linux-stm32@lfdr.de>; Mon,  8 May 2023 16:27:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17619C6A60A;
	Mon,  8 May 2023 14:27:01 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EFEEC6A61F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 14:27:00 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1p9-0008Nq-6W; Mon, 08 May 2023 16:26:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1p3-0021Gu-Sd; Mon, 08 May 2023 16:26:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pw1p3-002SkH-3G; Mon, 08 May 2023 16:26:41 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon,  8 May 2023 16:26:30 +0200
Message-Id: <20230508142637.1449363-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=f1VX9aZsYjsNQjEPdjGt9G3P4qRJ2KP7jOAOGg9ARiE=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWQaRqTpoZnRy8N63siCcOMXC2feri6I+1rA7j
 OtUut3ggM2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFkGkQAKCRCPgPtYfRL+
 TkCGB/0QbxwooxkpXGIIM3X4Z5SHGVwV1pbCcMPScL/b3RvgyCo1TT7z2bEbS77hs9zT1xoQ8HE
 Y7zRSRnFXy92QCMMahQiUK69od5XuoJN0CJYkZkktoF128mbLUJSSabzgLpGhzeMLcxlWgEOCmK
 cj4Qa8MYQ7Zz+P2Erwf93b8o5KgIhnPj7NQC0NIEuf2+JPxXT5E41lfFQ0iCLNX8pzH1kltc70J
 vs0S8l3a9i4tbgYxWdxZT9gHl1Qyy52vnPcVxbu/9hbFRkDNeM+N/qHtNmwA8eRz3mR49j9Cujn
 BulDh4AEw8TiijnyoG+5ZCe4g5DOCfdPidzVesGIWpeEsKuV
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
Subject: [Linux-stm32] [PATCH net-next v2 04/11] net: stmmac:
	dwmac-visconti: Convert to platform remove callback returning void
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
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtdmlzY29udGkuYyB8IDYgKystLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXZpc2NvbnRp
LmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy12aXNjb250aS5j
CmluZGV4IDU2MjA5YWY2MjQzYy4uYWNiYjI4NGJlMTc0IDEwMDY0NAotLS0gYS9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy12aXNjb250aS5jCisrKyBiL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXZpc2NvbnRpLmMKQEAgLTI1Nyw3ICsy
NTcsNyBAQCBzdGF0aWMgaW50IHZpc2NvbnRpX2V0aF9kd21hY19wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBpbnQgdmlzY29udGlf
ZXRoX2R3bWFjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZv
aWQgdmlzY29udGlfZXRoX2R3bWFjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogewogCXN0cnVjdCBuZXRfZGV2aWNlICpuZGV2ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRl
dik7CiAJc3RydWN0IHN0bW1hY19wcml2ICpwcml2ID0gbmV0ZGV2X3ByaXYobmRldik7CkBAIC0y
NjcsOCArMjY3LDYgQEAgc3RhdGljIGludCB2aXNjb250aV9ldGhfZHdtYWNfcmVtb3ZlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJdmlzY29udGlfZXRoX2Nsb2NrX3JlbW92ZShwZGV2
KTsKIAogCXN0bW1hY19yZW1vdmVfY29uZmlnX2R0KHBkZXYsIHByaXYtPnBsYXQpOwotCi0JcmV0
dXJuIDA7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHZpc2NvbnRpX2V0
aF9kd21hY19tYXRjaFtdID0gewpAQCAtMjc5LDcgKzI3Nyw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFC
TEUob2YsIHZpc2NvbnRpX2V0aF9kd21hY19tYXRjaCk7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZv
cm1fZHJpdmVyIHZpc2NvbnRpX2V0aF9kd21hY19kcml2ZXIgPSB7CiAJLnByb2JlICA9IHZpc2Nv
bnRpX2V0aF9kd21hY19wcm9iZSwKLQkucmVtb3ZlID0gdmlzY29udGlfZXRoX2R3bWFjX3JlbW92
ZSwKKwkucmVtb3ZlX25ldyA9IHZpc2NvbnRpX2V0aF9kd21hY19yZW1vdmUsCiAJLmRyaXZlciA9
IHsKIAkJLm5hbWUgICAgICAgICAgID0gInZpc2NvbnRpLWV0aC1kd21hYyIsCiAJCS5vZl9tYXRj
aF90YWJsZSA9IHZpc2NvbnRpX2V0aF9kd21hY19tYXRjaCwKLS0gCjIuMzkuMgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
