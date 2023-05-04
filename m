Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 540916F73A9
	for <lists+linux-stm32@lfdr.de>; Thu,  4 May 2023 21:45:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECFFEC6A5EE;
	Thu,  4 May 2023 19:45:21 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97AFFC69073
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 May 2023 19:45:20 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1puet7-0007rT-Tw; Thu, 04 May 2023 21:45:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1puet7-0018GT-2O; Thu, 04 May 2023 21:45:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1puet6-001JiH-2c; Thu, 04 May 2023 21:45:12 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu,  4 May 2023 21:44:52 +0200
Message-Id: <20230504194453.1150368-18-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=9tubpyai1MB/op1/Q29LPA4MvfejBQFUuyYAIHIRXME=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkVAnQwcEJ78+sYNtDLU5hJpc67PNpuv+IhuLlV
 EoKBa1W/yOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFQJ0AAKCRCPgPtYfRL+
 TgLgB/98quk2KPNuo4vHNRohCZNRm15MpGX2eYc3IoP1bAOIp2xRVYzPsddMlqIEDbkNeaTCLty
 QEsEq4eWXV8q+ZYHavex1LoRpaCvx2Dror1cBFosEn68jlj8ck4hAeM5SAxU0aqZQTSd/poPC69
 zsUpiVKq1ju5pce/4kRn+sEnYObTt+sQbe5TnK0faLvdh9k+1y+4CGvX4viLNA0g3ncJGR6pA34
 z8QCh1RT81CXdhgcDjL19C1SVhGbnXoDPRl2Ph/RHfpmICFdOhddC/TaOyGvIfCsjFYWvs8HAGP
 mmyspGtp6BhXV4DPlguXhu0ZAs/fpvnM21L4YBxXfwMixdyE
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-remoteproc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 17/18] remoteproc: stm32: Convert to platform
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
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KClNpZ25lZC1vZmYtYnk6IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJp
dmVycy9yZW1vdGVwcm9jL3N0bTMyX3Jwcm9jLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Jl
bW90ZXByb2Mvc3RtMzJfcnByb2MuYyBiL2RyaXZlcnMvcmVtb3RlcHJvYy9zdG0zMl9ycHJvYy5j
CmluZGV4IDg3NDZjYmIxZjE2OC4uMTk3MTZlYzgyYWFlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Jl
bW90ZXByb2Mvc3RtMzJfcnByb2MuYworKysgYi9kcml2ZXJzL3JlbW90ZXByb2Mvc3RtMzJfcnBy
b2MuYwpAQCAtODY3LDcgKzg2Nyw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcnByb2NfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50
IHN0bTMyX3Jwcm9jX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGlj
IHZvaWQgc3RtMzJfcnByb2NfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7
CiAJc3RydWN0IHJwcm9jICpycHJvYyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCXN0
cnVjdCBzdG0zMl9ycHJvYyAqZGRhdGEgPSBycHJvYy0+cHJpdjsKQEAgLTg4NSw4ICs4ODUsNiBA
QCBzdGF0aWMgaW50IHN0bTMyX3Jwcm9jX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogCQlkZXZpY2VfaW5pdF93YWtldXAoZGV2LCBmYWxzZSk7CiAJfQogCXJwcm9jX2ZyZWUo
cnByb2MpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3Rt
MzJfcnByb2Nfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCkBAIC05MTYsNyArOTE0LDcgQEAg
c3RhdGljIFNJTVBMRV9ERVZfUE1fT1BTKHN0bTMyX3Jwcm9jX3BtX29wcywKIAogc3RhdGljIHN0
cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtMzJfcnByb2NfZHJpdmVyID0gewogCS5wcm9iZSA9IHN0
bTMyX3Jwcm9jX3Byb2JlLAotCS5yZW1vdmUgPSBzdG0zMl9ycHJvY19yZW1vdmUsCisJLnJlbW92
ZV9uZXcgPSBzdG0zMl9ycHJvY19yZW1vdmUsCiAJLmRyaXZlciA9IHsKIAkJLm5hbWUgPSAic3Rt
MzItcnByb2MiLAogCQkucG0gPSAmc3RtMzJfcnByb2NfcG1fb3BzLAotLSAKMi4zOS4yCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
