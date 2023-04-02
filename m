Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 041796D3853
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Apr 2023 16:31:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 875AEC65E56;
	Sun,  2 Apr 2023 14:31:01 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53C3AC0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Apr 2023 14:31:00 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1piyjH-0002tj-6Y; Sun, 02 Apr 2023 16:30:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1piyjE-008TQe-69; Sun, 02 Apr 2023 16:30:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1piyjD-009zBY-Du; Sun, 02 Apr 2023 16:30:43 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Sun,  2 Apr 2023 16:30:19 +0200
Message-Id: <20230402143025.2524443-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
References: <20230402143025.2524443-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1980;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=iCZltnHIgn5VzrpA6UpCQ5r32RaCL6Op4sTXZpqLYvE=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKZFznhhVmSoqSW6+4ktWuucmBmh21c5mEVuhR
 T/av4eup86JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCmRcwAKCRCPgPtYfRL+
 Ts+SCACjAPaMhCz5qPB+M7W0JQDyVtFWB98/AIp0a/oNOPod8nh6OqrZyVz/E7aH8R/cey0hEQO
 6ty2NFIDS11f7EnMso3ZPKjmDncBCQAAivFwwvjAGOu9Lc/Sj7EFvhG3GLzaniMwUJB0Rlmg9Zc
 CfLoIkktfHp3Oye1z6UCtDsKkd1ilx8b93s6JNa2/H+zfQHh9BkHfptivF8CTZnAfWfft3qITaz
 rs7C5YCCrVIuGByNEgzOOpbHQJaWantu7A27NRGoGY7Z7aCo1tbTqn0eTo+jB1bjCAtnpbanmkS
 2hb7GCTAyIiAK9znuznYt4/i/j/a899mEOMpT/QbCncmeOCV
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 05/11] net: stmmac:
	dwmac-dwc-qos-eth: Convert to platform remove callback
	returning void
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
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtZHdjLXFvcy1ldGguYyB8IDYg
KystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWR3
Yy1xb3MtZXRoLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1k
d2MtcW9zLWV0aC5jCmluZGV4IDE4YWNmN2RkNzRlNS4uOWY4ODUzMGM1ZThjIDEwMDY0NAotLS0g
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1kd2MtcW9zLWV0aC5j
CisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWR3Yy1xb3Mt
ZXRoLmMKQEAgLTQ2NCw3ICs0NjQsNyBAQCBzdGF0aWMgaW50IGR3Y19ldGhfZHdtYWNfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMg
aW50IGR3Y19ldGhfZHdtYWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitz
dGF0aWMgdm9pZCBkd2NfZXRoX2R3bWFjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogewogCXN0cnVjdCBuZXRfZGV2aWNlICpuZGV2ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEo
cGRldik7CiAJc3RydWN0IHN0bW1hY19wcml2ICpwcml2ID0gbmV0ZGV2X3ByaXYobmRldik7CkBA
IC00NzcsOCArNDc3LDYgQEAgc3RhdGljIGludCBkd2NfZXRoX2R3bWFjX3JlbW92ZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWRhdGEtPnJlbW92ZShwZGV2KTsKIAogCXN0bW1hY19y
ZW1vdmVfY29uZmlnX2R0KHBkZXYsIHByaXYtPnBsYXQpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR3Y19ldGhfZHdtYWNfbWF0Y2hbXSA9IHsK
QEAgLTQ5MCw3ICs0ODgsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBkd2NfZXRoX2R3bWFj
X21hdGNoKTsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgZHdjX2V0aF9kd21hY19k
cml2ZXIgPSB7CiAJLnByb2JlICA9IGR3Y19ldGhfZHdtYWNfcHJvYmUsCi0JLnJlbW92ZSA9IGR3
Y19ldGhfZHdtYWNfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gZHdjX2V0aF9kd21hY19yZW1vdmUs
CiAJLmRyaXZlciA9IHsKIAkJLm5hbWUgICAgICAgICAgID0gImR3Yy1ldGgtZHdtYWMiLAogCQku
cG0gICAgICAgICAgICAgPSAmc3RtbWFjX3BsdGZyX3BtX29wcywKLS0gCjIuMzkuMgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
