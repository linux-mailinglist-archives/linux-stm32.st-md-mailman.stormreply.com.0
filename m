Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE849754464
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jul 2023 23:45:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85C98C6B44F;
	Fri, 14 Jul 2023 21:45:33 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0C54C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jul 2023 21:45:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qKQbR-0004IW-Il; Fri, 14 Jul 2023 23:45:29 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qKQbP-00ER0X-JW; Fri, 14 Jul 2023 23:45:27 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qKQbO-004ugD-UR; Fri, 14 Jul 2023 23:45:26 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 14 Jul 2023 23:45:18 +0200
Message-Id: <20230714214519.2503468-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2206;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=/NLXX93dNegW8/RPV4eZsWEDxqUOClEE95P3xGBbnoQ=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhpSNB9/qR6tP29mU8sfOXsF5tjCXtvrcM1xxU792d99c3
 D6Nd6p0J6MxCwMjF4OsmCKLfeOaTKsqucjOtf8uwwxiZQKZwsDFKQATyT7M/lcuy1E8snLV60VP
 ky5NdlpRXXbm2LZ7+SVaxzxS9CaFfJss2pJ6feUJORs2tj/RHm4pf4S/K3S2TxI7LVi45s3nuXy
 dxZN8c/2i55VL64Xo9TFvlX7d6rg3rGnm3FkatR7tXvZx0hfDbf7r74wUepGY9oJ/oceLpzXJT3
 jiJiq9P+tn+Z2fo+g1o7KZbbad5dp7Qe+bNv016Z2tt5Bjj7yYcp7Pput8UqXrpez1GsWd8+qV3
 S58WH9p1xv9Q080HgZOiluc8GSuhOd6NfnN2epfF325bFaw5u3V5plZKwu1ttVU6t/584tLUHS6
 o8uqpdPqTONCVX+dnOVwtuuj5dcU+Q1r7EzKa7Skoix8AQ==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@pengutronix.de
Subject: [Linux-stm32] [PATCH 1/2] pwm: stmpe: Handle errors when disabling
	the signal
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

QmVmb3JlIHRoZSBwd20gZnJhbWV3b3JrIGltcGxlbWVudGVkYXRvbWljIHVwZGF0ZXMgKHdpdGgg
dGhlIC5hcHBseSgpCmNhbGxiYWNrKSB0aGUgLmRpc2FibGUoKSBjYWxsYmFjayByZXR1cm5lZCB2
b2lkLiBUaGlzIGlzIHN0aWxsIHZpc2libGUKaW4gdGhlIHN0bXBlIGRyaXZlciB3aGljaCBkcm9w
cyBlcnJvcnMgaW4gdGhlIGRpc2FibGUgcGF0aC4KCkltcHJvdmUgdGhlIGRyaXZlciB0byBmb3J3
YXJkIGZhaWx1cmVzIGluIHN0bXBlXzI0eHhfcHdtX2Rpc2FibGUoKSB0bwp0aGUgY2FsbGVyIG9m
IHB3bV9hcHBseV9zdGF0ZSgpLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUu
a2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tc3RtcGUu
YyB8IDE3ICsrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1zdG1wZS5jIGIv
ZHJpdmVycy9wd20vcHdtLXN0bXBlLmMKaW5kZXggNWQ0YTQ3NjJjZTBjLi5lMjA1NDA1YzQ4Mjgg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zdG1wZS5jCisrKyBiL2RyaXZlcnMvcHdtL3B3
bS1zdG1wZS5jCkBAIC02MSw4ICs2MSw4IEBAIHN0YXRpYyBpbnQgc3RtcGVfMjR4eF9wd21fZW5h
YmxlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkKIAlyZXR1
cm4gMDsKIH0KIAotc3RhdGljIHZvaWQgc3RtcGVfMjR4eF9wd21fZGlzYWJsZShzdHJ1Y3QgcHdt
X2NoaXAgKmNoaXAsCi0JCQkJICAgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkKK3N0YXRpYyBpbnQg
c3RtcGVfMjR4eF9wd21fZGlzYWJsZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsCisJCQkJICBzdHJ1
Y3QgcHdtX2RldmljZSAqcHdtKQogewogCXN0cnVjdCBzdG1wZV9wd20gKnN0bXBlX3B3bSA9IHRv
X3N0bXBlX3B3bShjaGlwKTsKIAl1OCB2YWx1ZTsKQEAgLTcyLDE3ICs3MiwxNiBAQCBzdGF0aWMg
dm9pZCBzdG1wZV8yNHh4X3B3bV9kaXNhYmxlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwKIAlpZiAo
cmV0IDwgMCkgewogCQlkZXZfZXJyKGNoaXAtPmRldiwgImVycm9yIHJlYWRpbmcgUFdNIyV1IGNv
bnRyb2xcbiIsCiAJCQlwd20tPmh3cHdtKTsKLQkJcmV0dXJuOworCQlyZXR1cm4gcmV0OwogCX0K
IAogCXZhbHVlID0gcmV0ICYgfkJJVChwd20tPmh3cHdtKTsKIAogCXJldCA9IHN0bXBlX3JlZ193
cml0ZShzdG1wZV9wd20tPnN0bXBlLCBTVE1QRTI0WFhfUFdNQ1MsIHZhbHVlKTsKLQlpZiAocmV0
KSB7CisJaWYgKHJldCkKIAkJZGV2X2VycihjaGlwLT5kZXYsICJlcnJvciB3cml0aW5nIFBXTSMl
dSBjb250cm9sXG4iLAogCQkJcHdtLT5od3B3bSk7Ci0JCXJldHVybjsKLQl9CisJcmV0dXJuIHJl
dDsKIH0KIAogLyogU1RNUEUgMjR4eCBQV00gaW5zdHJ1Y3Rpb25zICovCkBAIC0xMTEsNyArMTEw
LDkgQEAgc3RhdGljIGludCBzdG1wZV8yNHh4X3B3bV9jb25maWcoc3RydWN0IHB3bV9jaGlwICpj
aGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCiAJLyogTWFrZSBzdXJlIHdlIGFyZSBkaXNh
YmxlZCAqLwogCWlmIChwd21faXNfZW5hYmxlZChwd20pKSB7Ci0JCXN0bXBlXzI0eHhfcHdtX2Rp
c2FibGUoY2hpcCwgcHdtKTsKKwkJcmV0ID0gc3RtcGVfMjR4eF9wd21fZGlzYWJsZShjaGlwLCBw
d20pOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKIAl9IGVsc2UgewogCQkvKiBDb25uZWN0
IHRoZSBQV00gdG8gdGhlIHBpbiAqLwogCQlwaW4gPSBwd20tPmh3cHdtOwpAQCAtMjY5LDcgKzI3
MCw3IEBAIHN0YXRpYyBpbnQgc3RtcGVfMjR4eF9wd21fYXBwbHkoc3RydWN0IHB3bV9jaGlwICpj
aGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCiAJaWYgKCFzdGF0ZS0+ZW5hYmxlZCkgewog
CQlpZiAocHdtLT5zdGF0ZS5lbmFibGVkKQotCQkJc3RtcGVfMjR4eF9wd21fZGlzYWJsZShjaGlw
LCBwd20pOworCQkJcmV0dXJuIHN0bXBlXzI0eHhfcHdtX2Rpc2FibGUoY2hpcCwgcHdtKTsKIAog
CQlyZXR1cm4gMDsKIAl9CgpiYXNlLWNvbW1pdDogMDZjMmFmYjg2MmY5ZGE4ZGM1ZWZhNGI2MDc2
YTBlNDhjM2ZiYWFhNQotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
