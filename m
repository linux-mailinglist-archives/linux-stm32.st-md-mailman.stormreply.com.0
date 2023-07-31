Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C785769D3C
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 18:55:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 177CAC6B46F;
	Mon, 31 Jul 2023 16:55:17 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA570C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Jul 2023 16:55:13 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQWAk-0006a4-1k; Mon, 31 Jul 2023 18:55:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQWAg-000AQb-7G; Mon, 31 Jul 2023 18:55:02 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qQWAf-009NYm-3Y; Mon, 31 Jul 2023 18:55:01 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thomas Bourgoin <thomas.bourgoin@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>
Date: Mon, 31 Jul 2023 18:54:56 +0200
Message-Id: <20230731165456.799784-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731165456.799784-1-u.kleine-koenig@pengutronix.de>
References: <20230731165456.799784-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=weXYsfSF7xFoniTuItnSSSLl15yxpaIv25+29WYAieU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkx+dc01wufPbTmMWiQXWAlti1lzx1ITCUGCOCk
 8fb57m4hmeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMfnXAAKCRCPgPtYfRL+
 Tqk7B/4qrncfgNDwVNAaX+W2udErsMXbzc+cVKDsdoeZsK8enbimuxgaQ9flTyvMS5dufmGAD88
 F5v+PB4tmbSzbdVghRhb4qfwaElxQrBTQhRbGUFKyc41a6gWqubUNgjnkEfbuhZlS5Ncl+kje5V
 3SseaZ2UL238lOPIFQg74Nj7cOLBgeXvkDb4nxAfG3BCM9F8kW+PGmjj/NanJRRLBL55iHcSbvd
 LDbHjXLld9W3lMMsQtPpSKmYfzOBbiXLTDdgnGrGYFoThHkUgJ1UNRvz53ut2gdsi2dztr42tqe
 8MeMVJN2N9ys6J5IkRPO4Gr3rP0z5M3VOei0Hrt7RcisCvE0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 3/3] crypto: stm32/hash - Convert to platform
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
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydApmcm9tIGVtaXR0aW5n
IGEgd2FybmluZykgYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3Mu
ClRvIGltcHJvdmUgaGVyZSB0aGVyZSBpcyBhIHF1ZXN0IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxs
YmFjayByZXR1cm4Kdm9pZC4gSW4gdGhlIGZpcnN0IHN0ZXAgb2YgdGhpcyBxdWVzdCBhbGwgZHJp
dmVycyBhcmUgY29udmVydGVkIHRvCi5yZW1vdmVfbmV3KCkgd2hpY2ggYWxyZWFkeSByZXR1cm5z
IHZvaWQuIEV2ZW50dWFsbHkgYWZ0ZXIgYWxsIGRyaXZlcnMKYXJlIGNvbnZlcnRlZCwgLnJlbW92
ZV9uZXcoKSBpcyByZW5hbWVkIHRvIC5yZW1vdmUoKS4KClRyaXZpYWxseSBjb252ZXJ0IHRoaXMg
ZHJpdmVyIGZyb20gYWx3YXlzIHJldHVybmluZyB6ZXJvIGluIHRoZSByZW1vdmUKY2FsbGJhY2sg
dG8gdGhlIHZvaWQgcmV0dXJuaW5nIHZhcmlhbnQuCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvY3J5
cHRvL3N0bTMyL3N0bTMyLWhhc2guYyB8IDYgKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3J5cHRvL3N0
bTMyL3N0bTMyLWhhc2guYyBiL2RyaXZlcnMvY3J5cHRvL3N0bTMyL3N0bTMyLWhhc2guYwppbmRl
eCBiMTAyNDMwMzU1ODQuLjY4YzUyZWVhYTZiMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9jcnlwdG8v
c3RtMzIvc3RtMzItaGFzaC5jCisrKyBiL2RyaXZlcnMvY3J5cHRvL3N0bTMyL3N0bTMyLWhhc2gu
YwpAQCAtMjExMiw3ICsyMTEyLDcgQEAgc3RhdGljIGludCBzdG0zMl9oYXNoX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBz
dG0zMl9oYXNoX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQorc3RhdGljIHZv
aWQgc3RtMzJfaGFzaF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlz
dHJ1Y3Qgc3RtMzJfaGFzaF9kZXYgKmhkZXYgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsK
IAlpbnQgcmV0OwpAQCAtMjEzNSw4ICsyMTM1LDYgQEAgc3RhdGljIGludCBzdG0zMl9oYXNoX3Jl
bW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCiAJaWYgKHJldCA+PSAwKQogCQlj
bGtfZGlzYWJsZV91bnByZXBhcmUoaGRldi0+Y2xrKTsKLQotCXJldHVybiAwOwogfQogCiAjaWZk
ZWYgQ09ORklHX1BNCkBAIC0yMTczLDcgKzIxNzEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRl
dl9wbV9vcHMgc3RtMzJfaGFzaF9wbV9vcHMgPSB7CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1f
ZHJpdmVyIHN0bTMyX2hhc2hfZHJpdmVyID0gewogCS5wcm9iZQkJPSBzdG0zMl9oYXNoX3Byb2Jl
LAotCS5yZW1vdmUJCT0gc3RtMzJfaGFzaF9yZW1vdmUsCisJLnJlbW92ZV9uZXcJPSBzdG0zMl9o
YXNoX3JlbW92ZSwKIAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUJPSAic3RtMzItaGFzaCIsCiAJCS5w
bSA9ICZzdG0zMl9oYXNoX3BtX29wcywKLS0gCjIuMzkuMgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
