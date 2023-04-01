Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 505C86D328E
	for <lists+linux-stm32@lfdr.de>; Sat,  1 Apr 2023 18:20:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B409C6A5F6;
	Sat,  1 Apr 2023 16:20:07 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 125FDC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  1 Apr 2023 16:20:06 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pidxO-0000HA-E2; Sat, 01 Apr 2023 18:19:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pidxM-008GT4-N4; Sat, 01 Apr 2023 18:19:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pidxL-009khy-Mn; Sat, 01 Apr 2023 18:19:55 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jack Wang <jinpu.wang@ionos.com>
Date: Sat,  1 Apr 2023 18:19:34 +0200
Message-Id: <20230401161938.2503204-46-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=AEOfFfpg8jnamUficc+JbatV7+ft2JVAarvqxLIvw2c=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFlQYs1o0K6QqS7EEqapqX9nS62hboypZ4nf4
 48fJjzJYDyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZUAAKCRCPgPtYfRL+
 ThSrB/9r9Cg7UBQvFzPFrqICftflvmP1LawosdzFYl0KYvNmgvXQNCfcc1lYm206AYw6g9u/RZm
 PTw9ugnrMAvf9E8vDSRj9bTIG4ebb4w0kImvQgJOfv9VUKGmFETqUC3tBtvenGRt/9hmPxaUlmn
 xm0fR0IE+A2GT7JCh8TJmWYA6qiyTxUtW/QV7076WXcixvAffoE+u3CdFBpUH5ubfWFYKRl9V9I
 /OvaTYpY0+xvVvMqIylLWTmjuTKH7uhDic8Q6twEKy+ucYS4Doo6R+iY8zZOeZBPTWPfjVzYuzP
 Tt/hpkDNogojwR6qsfh5+RbvrACEJD6ittMOm+p4oG9Exytw
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 45/49] mtd: rawnand: stm32_fmc2: Convert to
	platform remove callback returning void
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
dmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgfCA2ICsrLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3
L3N0bTMyX2ZtYzJfbmFuZC5jCmluZGV4IDVkNjI3MDQ4YzQyMC4uZTNkMDlkZDU5NjNiIDEwMDY0
NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYworKysgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwpAQCAtMjAyMSw3ICsyMDIxLDcgQEAg
c3RhdGljIGludCBzdG0zMl9mbWMyX25mY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBpbnQgc3RtMzJfZm1jMl9uZmNfcmVtb3Zl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBzdG0zMl9mbWMyX25m
Y19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qgc3RtMzJf
Zm1jMl9uZmMgKm5mYyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwogCXN0cnVjdCBzdG0z
Ml9mbWMyX25hbmQgKm5hbmQgPSAmbmZjLT5uYW5kOwpAQCAtMjA0NSw4ICsyMDQ1LDYgQEAgc3Rh
dGljIGludCBzdG0zMl9mbWMyX25mY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKIAljbGtfZGlzYWJsZV91bnByZXBhcmUobmZjLT5jbGspOwogCiAJc3RtMzJfZm1jMl9uZmNf
d3BfZW5hYmxlKG5hbmQpOwotCi0JcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgX19tYXliZV91
bnVzZWQgc3RtMzJfZm1jMl9uZmNfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCkBAIC0yMTAz
LDcgKzIxMDEsNyBAQCBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBzdG0zMl9mbWMyX25mY19tYXRj
aCk7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHN0bTMyX2ZtYzJfbmZjX2RyaXZl
ciA9IHsKIAkucHJvYmUJPSBzdG0zMl9mbWMyX25mY19wcm9iZSwKLQkucmVtb3ZlCT0gc3RtMzJf
Zm1jMl9uZmNfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gc3RtMzJfZm1jMl9uZmNfcmVtb3ZlLAog
CS5kcml2ZXIJPSB7CiAJCS5uYW1lID0gInN0bTMyX2ZtYzJfbmZjIiwKIAkJLm9mX21hdGNoX3Rh
YmxlID0gc3RtMzJfZm1jMl9uZmNfbWF0Y2gsCi0tIAoyLjM5LjIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
