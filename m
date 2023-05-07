Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D65896F99C4
	for <lists+linux-stm32@lfdr.de>; Sun,  7 May 2023 18:26:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A031C6A5F7;
	Sun,  7 May 2023 16:26:58 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36BE4C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 May 2023 16:26:56 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDc-0002Hp-6J; Sun, 07 May 2023 18:26:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDb-001nEc-C5; Sun, 07 May 2023 18:26:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pvhDa-002AiN-KO; Sun, 07 May 2023 18:26:38 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sun,  7 May 2023 18:26:05 +0200
Message-Id: <20230507162616.1368908-43-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2934;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=VBjQWjzqZ0JTQET5hvmN/Q6/iuJELmv5j/ynukd6X4A=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkV9EUK4Twf4RYXDa6P3NRl5LAxP6p01blYfQj+
 sfuV37RNpuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFfRFAAKCRCPgPtYfRL+
 Tn5BCACZXxqbkSEj64X4IO9Jl4UE5Fwcqo46zCGQPooOmtsJPnvHOMD2vrTWcdt89WbWa7HPyGW
 p68wJigwr8LgliEAG8bFBav809Ur+2IYDYVpkPTywsKw5waM0XrYaMLY2F1vodQugTwLttTS5Q9
 NaXjOLbW5Hwxl7bjMEUkL79vmwX9GFQino3lvHJbJTNuRGj1Eir7GJWRvzNUJKyA3EmXZirKoS4
 wQ47mFT617Y0LGi9fBYVJ7mRBGqo58eItCT6BRznJjnP6K88oRjUBE5Mzq8oNPv3DRhGwj+L5jF
 9UwZ78x5QLVJ/VyxkuH6gcIlEVoNR80JhOcG5RX5cfRr76aW
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Subject: [Linux-stm32] [PATCH 42/53] drm/stm: Convert to platform remove
	callback returning void
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
cnQgdGhlIHN0bSBkcm0gZHJpdmVycyBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUK
cmVtb3ZlIGNhbGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50LgoKU2lnbmVkLW9m
Zi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vc3RtL2Rydi5jICAgICAgICAgICAgIHwgNiArKy0tLS0KIGRy
aXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMgfCA2ICsrLS0tLQogMiBmaWxlcyBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3N0bS9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHJ2LmMKaW5kZXgg
NTA0MTBiZDk5ZGZlLi5iZTkxYjM3NWE0ZDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9z
dG0vZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9kcnYuYwpAQCAtMjEzLDcgKzIxMyw3
IEBAIHN0YXRpYyBpbnQgc3RtX2RybV9wbGF0Zm9ybV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBpbnQgc3RtX2RybV9wbGF0Zm9y
bV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIHN0bV9k
cm1fcGxhdGZvcm1fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3Ry
dWN0IGRybV9kZXZpY2UgKmRkZXYgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIApAQCAt
MjIyLDggKzIyMiw2IEBAIHN0YXRpYyBpbnQgc3RtX2RybV9wbGF0Zm9ybV9yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlkcm1fZGV2X3VucmVnaXN0ZXIoZGRldik7CiAJZHJ2
X3VubG9hZChkZGV2KTsKIAlkcm1fZGV2X3B1dChkZGV2KTsKLQotCXJldHVybiAwOwogfQogCiBz
dGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBkcnZfZHRfaWRzW10gPSB7CkBAIC0yMzQs
NyArMjMyLDcgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgZHJ2X2R0X2lkcyk7CiAKIHN0YXRp
YyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bV9kcm1fcGxhdGZvcm1fZHJpdmVyID0gewogCS5w
cm9iZSA9IHN0bV9kcm1fcGxhdGZvcm1fcHJvYmUsCi0JLnJlbW92ZSA9IHN0bV9kcm1fcGxhdGZv
cm1fcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gc3RtX2RybV9wbGF0Zm9ybV9yZW1vdmUsCiAJLmRy
aXZlciA9IHsKIAkJLm5hbWUgPSAic3RtMzItZGlzcGxheSIsCiAJCS5vZl9tYXRjaF90YWJsZSA9
IGRydl9kdF9pZHMsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNp
LXN0bS5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYwppbmRleCA4OTg5
N2Q1ZjVjNzIuLmE3YzM0OTQwNGE3YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9k
d19taXBpX2RzaS1zdG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0
bS5jCkBAIC01MzcsMTUgKzUzNywxMyBAQCBzdGF0aWMgaW50IGR3X21pcGlfZHNpX3N0bV9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRp
YyBpbnQgZHdfbWlwaV9kc2lfc3RtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQorc3RhdGljIHZvaWQgZHdfbWlwaV9kc2lfc3RtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQogewogCXN0cnVjdCBkd19taXBpX2RzaV9zdG0gKmRzaSA9IHBsYXRmb3JtX2dl
dF9kcnZkYXRhKHBkZXYpOwogCiAJZHdfbWlwaV9kc2lfcmVtb3ZlKGRzaS0+ZHNpKTsKIAljbGtf
ZGlzYWJsZV91bnByZXBhcmUoZHNpLT5wbGxyZWZfY2xrKTsKIAlyZWd1bGF0b3JfZGlzYWJsZShk
c2ktPnZkZF9zdXBwbHkpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgX19tYXliZV91
bnVzZWQgZHdfbWlwaV9kc2lfc3RtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQpAQCAtNTkw
LDcgKzU4OCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBkd19taXBpX2RzaV9z
dG1fcG1fb3BzID0gewogCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBkd19taXBpX2Rz
aV9zdG1fZHJpdmVyID0gewogCS5wcm9iZQkJPSBkd19taXBpX2RzaV9zdG1fcHJvYmUsCi0JLnJl
bW92ZQkJPSBkd19taXBpX2RzaV9zdG1fcmVtb3ZlLAorCS5yZW1vdmVfbmV3CT0gZHdfbWlwaV9k
c2lfc3RtX3JlbW92ZSwKIAkuZHJpdmVyCQk9IHsKIAkJLm9mX21hdGNoX3RhYmxlID0gZHdfbWlw
aV9kc2lfc3RtX2R0X2lkcywKIAkJLm5hbWUJPSAic3RtMzItZGlzcGxheS1kc2kiLAotLSAKMi4z
OS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
