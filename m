Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EA67D09EB
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Oct 2023 09:56:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6660C6C831;
	Fri, 20 Oct 2023 07:56:47 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21DC9C6B44D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Oct 2023 07:56:47 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtkN7-0003gL-4A; Fri, 20 Oct 2023 09:56:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtkN5-002yWN-8V; Fri, 20 Oct 2023 09:56:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtkN4-002OKg-Ty; Fri, 20 Oct 2023 09:56:38 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
Date: Fri, 20 Oct 2023 09:56:00 +0200
Message-ID: <20231020075521.2121571-82-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
References: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2434;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ZSdL5qT5fdKkW9Pe3nwuWzBPi3/kxcjn33Eoon/bjiY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlMjKVcsA+sPV86Y9njfUYUKL2nE/mN1rlIOD2i
 PhmFZ870pCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTIylQAKCRCPgPtYfRL+
 TplEB/47NfS/xSFI1GP3PNeDNFXa2FAvxzpE7r6IO4SOZETJVdSmjn4CeyG+yIXfoAqN6qnnnE1
 yrQJkFRUoy+O24ytc7I+Hz3ViZnQ+9znfTExxA6boeskmTSuQuJ92EKVv8coIHWFqJ0XzpVQ87B
 rO/KDO/EpWY8OqWQpVWa97GQNoAixLjM9+FrUwhjDsgykpJFwUkWeS/BkACG/bVkAf8uZs19Ya+
 2NWMcwVTR9v/qep5rhn5Pylt5dwTt1lXag5uBe+/rH16Rb7rT/WUYpNskHBVxg6AEtrUcmMJeWz
 pjqcSYZCOkC9gX2BhqKtgigQWPfFLsx062Kweb/Kph/hZpfz
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-crypto@vger.kernel.org,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 38/42] crypto: stm32/crc32 - Convert to
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
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVGhlIGRyaXZlciBhZGFw
dGVkIGhlcmUgc3VmZmVyZWQgZnJvbSB0aGlzIHdyb25nIGFzc3VtcHRpb24gYW5kIGhhZCBhbgpl
cnJvciBwYXRocyByZXN1bHRpbmcgaW4gcmVzb3VyY2UgbGVha3MuCgpJZiBwbV9ydW50aW1lX2dl
dCgpIGZhaWxzLCB0aGUgb3RoZXIgcmVzb3VyY2VzIGhlbGQgYnkgdGhlIGRldmljZSBtdXN0CnN0
aWxsIGJlIGZyZWVkLiBPbmx5IGNsa19kaXNhYmxlKCkgc2hvdWxkIGJlIHNraXBwZWQgYXMgdGhl
CnBtX3J1bnRpbWVfZ2V0KCkgZmFpbGVkIHRvIGNhbGwgY2xrX2VuYWJsZSgpLgoKQWZ0ZXIgdGhp
cyBjaGFuZ2UgdGhlIHJlbW92ZSBmdW5jdGlvbiByZXR1cm5zIHplcm8gdW5jb25kaXRpb25hbGx5
IGFuZApjYW4gdHJpdmlhbGx5IGJlIGNvbnZlcnRlZCB0byB0aGUgcHJvdG90eXBlIHJlcXVpcmVk
IGZvciAucmVtb3ZlX25ldygpLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUu
a2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL2NyeXB0by9zdG0zMi9z
dG0zMi1jcmMzMi5jIHwgMTUgKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2NyeXB0by9z
dG0zMi9zdG0zMi1jcmMzMi5jIGIvZHJpdmVycy9jcnlwdG8vc3RtMzIvc3RtMzItY3JjMzIuYwpp
bmRleCA5MGE5MjBlN2Y2NjQuLjVkMTA2N2M4Y2IwZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9jcnlw
dG8vc3RtMzIvc3RtMzItY3JjMzIuYworKysgYi9kcml2ZXJzL2NyeXB0by9zdG0zMi9zdG0zMi1j
cmMzMi5jCkBAIC0zNzksMTYgKzM3OSwxMSBAQCBzdGF0aWMgaW50IHN0bTMyX2NyY19wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50
IHN0bTMyX2NyY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2
b2lkIHN0bTMyX2NyY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlz
dHJ1Y3Qgc3RtMzJfY3JjICpjcmMgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKIAlpbnQg
cmV0ID0gcG1fcnVudGltZV9nZXRfc3luYyhjcmMtPmRldik7CiAKLQlpZiAocmV0IDwgMCkgewot
CQlwbV9ydW50aW1lX3B1dF9ub2lkbGUoY3JjLT5kZXYpOwotCQlyZXR1cm4gcmV0OwotCX0KLQog
CXNwaW5fbG9jaygmY3JjX2xpc3QubG9jayk7CiAJbGlzdF9kZWwoJmNyYy0+bGlzdCk7CiAJc3Bp
bl91bmxvY2soJmNyY19saXN0LmxvY2spOwpAQCAtNDAxLDkgKzM5Niw5IEBAIHN0YXRpYyBpbnQg
c3RtMzJfY3JjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXBtX3J1bnRp
bWVfZGlzYWJsZShjcmMtPmRldik7CiAJcG1fcnVudGltZV9wdXRfbm9pZGxlKGNyYy0+ZGV2KTsK
IAotCWNsa19kaXNhYmxlX3VucHJlcGFyZShjcmMtPmNsayk7Ci0KLQlyZXR1cm4gMDsKKwlpZiAo
cmV0ID49IDApCisJCWNsa19kaXNhYmxlKGNyYy0+Y2xrKTsKKwljbGtfdW5wcmVwYXJlKGNyYy0+
Y2xrKTsKIH0KIAogc3RhdGljIGludCBfX21heWJlX3VudXNlZCBzdG0zMl9jcmNfc3VzcGVuZChz
dHJ1Y3QgZGV2aWNlICpkZXYpCkBAIC00NzIsNyArNDY3LDcgQEAgTU9EVUxFX0RFVklDRV9UQUJM
RShvZiwgc3RtMzJfZHRfaWRzKTsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3Rt
MzJfY3JjX2RyaXZlciA9IHsKIAkucHJvYmUgID0gc3RtMzJfY3JjX3Byb2JlLAotCS5yZW1vdmUg
PSBzdG0zMl9jcmNfcmVtb3ZlLAorCS5yZW1vdmVfbmV3ID0gc3RtMzJfY3JjX3JlbW92ZSwKIAku
ZHJpdmVyID0gewogCQkubmFtZSAgICAgICAgICAgPSBEUklWRVJfTkFNRSwKIAkJLnBtCQk9ICZz
dG0zMl9jcmNfcG1fb3BzLAotLSAKMi40Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
