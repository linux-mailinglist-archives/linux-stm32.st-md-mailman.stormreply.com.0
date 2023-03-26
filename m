Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3056C9552
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Mar 2023 16:33:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A818C6A5FA;
	Sun, 26 Mar 2023 14:33:07 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08449C6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Mar 2023 14:33:06 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pgRQL-00006X-KL; Sun, 26 Mar 2023 16:32:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pgRQI-006reW-RP; Sun, 26 Mar 2023 16:32:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pgRQI-0088Yh-0m; Sun, 26 Mar 2023 16:32:42 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Sun, 26 Mar 2023 16:31:43 +0200
Message-Id: <20230326143224.572654-79-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1826;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Hf03W6FCnuJBdvXuTFOZXNHudlzADbBrZKtBOEpjYlM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkIFbhWjaNCRTr78svok4/G/qcUfXFkbJZeABAx
 T+Yc7umm8eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCBW4QAKCRCPgPtYfRL+
 TnPRB/9CMzAkMtzX9t2MUc+yuKmxmHlomkr7f1IZZ919Gdvmp3sWBbFKhor+nE/SbadRaj46216
 mFmKZG0eYEnHfvWK/Pvqbj/E5urzyoFTywinaXnKS9jDLFlyz6zSvYosKqQEQNZNzkENDc/MWgp
 IlT3G5+SvbtX0gNJJ1/fqpZ3lbJWdTHbJ6sk0LIo5o08FNPoQtM8A4UL/aAm81R5Jkl15iyxDeR
 C0KQE1Dox+swebOdqRUvBar9uRN1Ir4smQEDZhz3fK3xjom0HLGFOF3MWyhGtn2gAKtpKmuc7Za
 mVzNVmXqG5ZifvWHKntrUJivwDcj7NUQfGk7fF/gVClnMl94
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 076/117] media: dma2d: Convert to platform
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
dmVycy9tZWRpYS9wbGF0Zm9ybS9zdC9zdG0zMi9kbWEyZC9kbWEyZC5jIHwgNiArKy0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdC9zdG0zMi9kbWEyZC9kbWEyZC5jIGIvZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9zdC9zdG0zMi9kbWEyZC9kbWEyZC5jCmluZGV4IDk3MDZhYTQxYjVk
Mi4uYmU1NmQyYjVmYWU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3N0L3N0
bTMyL2RtYTJkL2RtYTJkLmMKKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9zdC9zdG0zMi9k
bWEyZC9kbWEyZC5jCkBAIC02OTYsNyArNjk2LDcgQEAgc3RhdGljIGludCBkbWEyZF9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBp
bnQgZG1hMmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9p
ZCBkbWEyZF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qg
ZG1hMmRfZGV2ICpkZXYgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIApAQCAtNzA3LDgg
KzcwNyw2IEBAIHN0YXRpYyBpbnQgZG1hMmRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiAJdmIyX2RtYV9jb250aWdfY2xlYXJfbWF4X3NlZ19zaXplKCZwZGV2LT5kZXYpOwog
CWNsa191bnByZXBhcmUoZGV2LT5nYXRlKTsKIAljbGtfcHV0KGRldi0+Z2F0ZSk7Ci0KLQlyZXR1
cm4gMDsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc3RtMzJfZG1hMmRf
bWF0Y2hbXSA9IHsKQEAgLTcyMiw3ICs3MjAsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBz
dG0zMl9kbWEyZF9tYXRjaCk7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGRtYTJk
X3BkcnYgPSB7CiAJLnByb2JlCQk9IGRtYTJkX3Byb2JlLAotCS5yZW1vdmUJCT0gZG1hMmRfcmVt
b3ZlLAorCS5yZW1vdmVfbmV3CT0gZG1hMmRfcmVtb3ZlLAogCS5kcml2ZXIJCT0gewogCQkubmFt
ZSA9IERNQTJEX05BTUUsCiAJCS5vZl9tYXRjaF90YWJsZSA9IHN0bTMyX2RtYTJkX21hdGNoLAot
LSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
