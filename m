Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D33C2854573
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 10:34:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B7C7C71287;
	Wed, 14 Feb 2024 09:34:50 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 532A1C6DD69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 09:34:47 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf5-0005mH-Id; Wed, 14 Feb 2024 10:34:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf1-000fFz-TE; Wed, 14 Feb 2024 10:34:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1raBf1-004Y7h-2c;
 Wed, 14 Feb 2024 10:34:35 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org
Date: Wed, 14 Feb 2024 10:32:44 +0100
Message-ID: <59e5dfff2b878cc8590e286572672e4f10e35380.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2070;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=T/U7wQnCa/nBPtaaTnKA2tY72R4dDiZtK4LWdIBSJd4=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIjRsLdl8HTUa9tf6qIs+zvnxTpj//AqG0X++
 ldOrCB7T1eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyI0QAKCRCPgPtYfRL+
 Tu6/B/477D5/A7oJB9f/BCRHZQWbXLL6oXepDfsU47gcf24GXzWckRUa2n8Rqdd/N4URAzUpcng
 QoWNKG5EiIW/stnDW/Fr9WxNS+3kZw4quDzkWcw+aosSTnstAtrM8uI1gQdxfEy6aWOuhuQnS0S
 X1xBRUp9v2dVbkizu0+a0AAOrbtrVgh2rMLKXiDWhTYbKz6xHdZnlnNf3HLdCXkpxK96WQWJeJ/
 ozDH2tVMAE52haznrJX5TZ6pbjP/ScQoKzLEl2AjJfNXu6U7ma8ohFQa2H/l9Eu0mjDCN3jpiV1
 eOORhbGtaT96LiRrSk8FkgoUtiZWGOArvSlrqsow37mhdCpm
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 117/164] pwm: stm32: Make use of
	devm_pwmchip_alloc() function
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

VGhpcyBwcmVwYXJlcyB0aGUgcHdtLXN0bTMyIGRyaXZlciB0byBmdXJ0aGVyIGNoYW5nZXMgb2Yg
dGhlIHB3bSBjb3JlCm91dGxpbmVkIGluIHRoZSBjb21taXQgaW50cm9kdWNpbmcgZGV2bV9wd21j
aGlwX2FsbG9jKCkuIFRoZXJlIGlzIG5vCmludGVuZGVkIHNlbWFudGljYWwgY2hhbmdlIGFuZCB0
aGUgZHJpdmVyIHNob3VsZCBiZWhhdmUgYXMgYmVmb3JlLgoKU2lnbmVkLW9mZi1ieTogVXdlIEts
ZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJz
L3B3bS9wd20tc3RtMzIuYyB8IDE3ICsrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
OCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdt
L3B3bS1zdG0zMi5jIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKaW5kZXggMTQ0MGI3MDZlZTU3
Li4wYzAyOGQxN2MwNzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCisrKyBi
L2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCkBAIC0yNyw3ICsyNyw2IEBAIHN0cnVjdCBzdG0zMl9i
cmVha2lucHV0IHsKIH07CiAKIHN0cnVjdCBzdG0zMl9wd20gewotCXN0cnVjdCBwd21fY2hpcCBj
aGlwOwogCXN0cnVjdCBtdXRleCBsb2NrOyAvKiBwcm90ZWN0IHB3bSBjb25maWcvZW5hYmxlICov
CiAJc3RydWN0IGNsayAqY2xrOwogCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsKQEAgLTQwLDcgKzM5
LDcgQEAgc3RydWN0IHN0bTMyX3B3bSB7CiAKIHN0YXRpYyBpbmxpbmUgc3RydWN0IHN0bTMyX3B3
bSAqdG9fc3RtMzJfcHdtX2RldihzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApCiB7Ci0JcmV0dXJuIGNv
bnRhaW5lcl9vZihjaGlwLCBzdHJ1Y3Qgc3RtMzJfcHdtLCBjaGlwKTsKKwlyZXR1cm4gcHdtY2hp
cF9nZXRfZHJ2ZGF0YShjaGlwKTsKIH0KIAogc3RhdGljIHUzMiBhY3RpdmVfY2hhbm5lbHMoc3Ry
dWN0IHN0bTMyX3B3bSAqZGV2KQpAQCAtNjMyLDE0ICs2MzEsMTYgQEAgc3RhdGljIGludCBzdG0z
Ml9wd21fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1Y3Qgc3RtMzJf
dGltZXJzICpkZGF0YSA9IGRldl9nZXRfZHJ2ZGF0YShwZGV2LT5kZXYucGFyZW50KTsKIAlzdHJ1
Y3QgcHdtX2NoaXAgKmNoaXA7CiAJc3RydWN0IHN0bTMyX3B3bSAqcHJpdjsKLQl1bnNpZ25lZCBp
bnQgbnVtX2VuYWJsZWQ7CisJdW5zaWduZWQgaW50IG5wd20sIG51bV9lbmFibGVkOwogCXVuc2ln
bmVkIGludCBpOwogCWludCByZXQ7CiAKLQlwcml2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9m
KCpwcml2KSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKCFwcml2KQotCQlyZXR1cm4gLUVOT01FTTsKLQlj
aGlwID0gJnByaXYtPmNoaXA7CisJbnB3bSA9IHN0bTMyX3B3bV9kZXRlY3RfY2hhbm5lbHMoZGRh
dGEtPnJlZ21hcCwgJm51bV9lbmFibGVkKTsKKworCWNoaXAgPSBkZXZtX3B3bWNoaXBfYWxsb2Mo
ZGV2LCBucHdtLCBzaXplb2YoKnByaXYpKTsKKwlpZiAoSVNfRVJSKGNoaXApKQorCQlyZXR1cm4g
UFRSX0VSUihjaGlwKTsKKwlwcml2ID0gdG9fc3RtMzJfcHdtX2RldihjaGlwKTsKIAogCW11dGV4
X2luaXQoJnByaXYtPmxvY2spOwogCXByaXYtPnJlZ21hcCA9IGRkYXRhLT5yZWdtYXA7CkBAIC02
NTUsOSArNjU2LDcgQEAgc3RhdGljIGludCBzdG0zMl9wd21fcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIAogCXN0bTMyX3B3bV9kZXRlY3RfY29tcGxlbWVudGFyeShwcml2KTsK
IAotCWNoaXAtPmRldiA9IGRldjsKIAljaGlwLT5vcHMgPSAmc3RtMzJwd21fb3BzOwotCWNoaXAt
Pm5wd20gPSBzdG0zMl9wd21fZGV0ZWN0X2NoYW5uZWxzKGRkYXRhLT5yZWdtYXAsICZudW1fZW5h
YmxlZCk7CiAKIAkvKiBJbml0aWFsaXplIGNsb2NrIHJlZmNvdW50IHRvIG51bWJlciBvZiBlbmFi
bGVkIFBXTSBjaGFubmVscy4gKi8KIAlmb3IgKGkgPSAwOyBpIDwgbnVtX2VuYWJsZWQ7IGkrKykK
LS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
