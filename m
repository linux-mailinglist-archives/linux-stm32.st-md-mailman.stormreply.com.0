Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F757F2F78
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Nov 2023 14:52:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0213C6B47F;
	Tue, 21 Nov 2023 13:52:09 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF03EC6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Nov 2023 13:52:08 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5RAc-0006Nn-4V; Tue, 21 Nov 2023 14:52:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5RAZ-00Ab20-Im; Tue, 21 Nov 2023 14:52:03 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5RAZ-004xgz-9g; Tue, 21 Nov 2023 14:52:03 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 21 Nov 2023 14:50:32 +0100
Message-ID: <20231121134901.208535-91-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2448;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=9B7qqzhgfjxbe1H5uS6z3zQNzl3U1yIC6YrSepVecLc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlXLWv+rF2TO83TDSJ2CfHci7IsQAcjoNFuQ7Rp
 vdocCUBBGCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVy1rwAKCRCPgPtYfRL+
 TtZBCACgv2MrNeViSq1OXJkuk9JJ2nnExD93h/BY+cSIZyqMcWsr9xab3H+Iyroepr2BEJJIxzw
 weacrB0KOz7MAsKbU7WfjqZs2FgWA28rints+RIL1KFQYHzFHrfKUOCRH7mMqKmCkX4v+hoVO58
 +UQU8ICb2/nvIjuQ8lEKnO4cS14RQA3sZqg9pmVnZKlnMYizPd1YCcQtW9yXZXts3o3UElDjQlq
 h2GzQr1k0Go5WPjXjvK0IOfLhn6FsSkLPojAMkO8RsEf20WHmwKjJ68LfIIIq8ssp5vsYPCqtX5
 i2Dzrge19/rx2qrN8r3gTYvl17D/G235qtYr8RVjuT62hKNy
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 090/108] pwm: stmpe: Make use of
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

VGhpcyBwcmVwYXJlcyB0aGUgcHdtLXN0bXBlIGRyaXZlciB0byBmdXJ0aGVyIGNoYW5nZXMgb2Yg
dGhlIHB3bSBjb3JlCm91dGxpbmVkIGluIHRoZSBjb21taXQgaW50cm9kdWNpbmcgZGV2bV9wd21j
aGlwX2FsbG9jKCkuIFRoZXJlIGlzIG5vCmludGVuZGVkIHNlbWFudGljYWwgY2hhbmdlIGFuZCB0
aGUgZHJpdmVyIHNob3VsZCBiZWhhdmUgYXMgYmVmb3JlLgoKU2lnbmVkLW9mZi1ieTogVXdlIEts
ZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJz
L3B3bS9wd20tc3RtcGUuYyB8IDM4ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXN0bXBlLmMgYi9kcml2ZXJzL3B3bS9wd20tc3Rt
cGUuYwppbmRleCA0OTI0OTRiNzNhODcuLmRjOWM3YjY5YWI1NCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9wd20vcHdtLXN0bXBlLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXN0bXBlLmMKQEAgLTI3LDEz
ICsyNywxMiBAQAogCiBzdHJ1Y3Qgc3RtcGVfcHdtIHsKIAlzdHJ1Y3Qgc3RtcGUgKnN0bXBlOwot
CXN0cnVjdCBwd21fY2hpcCBjaGlwOwogCXU4IGxhc3RfZHV0eTsKIH07CiAKIHN0YXRpYyBpbmxp
bmUgc3RydWN0IHN0bXBlX3B3bSAqdG9fc3RtcGVfcHdtKHN0cnVjdCBwd21fY2hpcCAqY2hpcCkK
IHsKLQlyZXR1cm4gY29udGFpbmVyX29mKGNoaXAsIHN0cnVjdCBzdG1wZV9wd20sIGNoaXApOwor
CXJldHVybiBwd21jaGlwX3ByaXYoY2hpcCk7CiB9CiAKIHN0YXRpYyBpbnQgc3RtcGVfMjR4eF9w
d21fZW5hYmxlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkK
QEAgLTI5MiwzMyArMjkxLDM2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHdtX29wcyBzdG1wZV8y
NHh4X3B3bV9vcHMgPSB7CiBzdGF0aWMgaW50IF9faW5pdCBzdG1wZV9wd21fcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qgc3RtcGUgKnN0bXBlID0gZGV2X2dl
dF9kcnZkYXRhKHBkZXYtPmRldi5wYXJlbnQpOworCXN0cnVjdCBwd21fY2hpcCAqY2hpcDsKIAlz
dHJ1Y3Qgc3RtcGVfcHdtICpzdG1wZV9wd207CiAJaW50IHJldDsKIAotCXN0bXBlX3B3bSA9IGRl
dm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnN0bXBlX3B3bSksIEdGUF9LRVJORUwpOwot
CWlmICghc3RtcGVfcHdtKQotCQlyZXR1cm4gLUVOT01FTTsKKwlzd2l0Y2ggKHN0bXBlLT5wYXJ0
bnVtKSB7CisJY2FzZSBTVE1QRTI0MDE6CisJY2FzZSBTVE1QRTI0MDM6CisJCWJyZWFrOworCWNh
c2UgU1RNUEUxNjAxOgorCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCAtRUlOVkFM
LAorCQkJCSAgICAgIlNUTVBFMTYwMSBub3QgeWV0IHN1cHBvcnRlZFxuIik7CisJZGVmYXVsdDoK
KwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgLUVJTlZBTCwKKwkJCQkgICAgICJV
bmtub3duIFNUTVBFIFBXTVxuIik7CisJfQorCisJY2hpcCA9IGRldm1fcHdtY2hpcF9hbGxvYygm
cGRldi0+ZGV2LCAzLCBzaXplb2YoKnN0bXBlX3B3bSkpOworCWlmIChJU19FUlIoY2hpcCkpCisJ
CXJldHVybiBQVFJfRVJSKGNoaXApOworCXN0bXBlX3B3bSA9IHRvX3N0bXBlX3B3bShjaGlwKTsK
IAogCXN0bXBlX3B3bS0+c3RtcGUgPSBzdG1wZTsKLQlzdG1wZV9wd20tPmNoaXAuZGV2ID0gJnBk
ZXYtPmRldjsKIAotCWlmIChzdG1wZS0+cGFydG51bSA9PSBTVE1QRTI0MDEgfHwgc3RtcGUtPnBh
cnRudW0gPT0gU1RNUEUyNDAzKSB7Ci0JCXN0bXBlX3B3bS0+Y2hpcC5vcHMgPSAmc3RtcGVfMjR4
eF9wd21fb3BzOwotCQlzdG1wZV9wd20tPmNoaXAubnB3bSA9IDM7Ci0JfSBlbHNlIHsKLQkJaWYg
KHN0bXBlLT5wYXJ0bnVtID09IFNUTVBFMTYwMSkKLQkJCWRldl9lcnIoJnBkZXYtPmRldiwgIlNU
TVBFMTYwMSBub3QgeWV0IHN1cHBvcnRlZFxuIik7Ci0JCWVsc2UKLQkJCWRldl9lcnIoJnBkZXYt
PmRldiwgIlVua25vd24gU1RNUEUgUFdNXG4iKTsKLQotCQlyZXR1cm4gLUVOT0RFVjsKLQl9CisJ
Y2hpcC0+b3BzID0gJnN0bXBlXzI0eHhfcHdtX29wczsKIAogCXJldCA9IHN0bXBlX2VuYWJsZShz
dG1wZSwgU1RNUEVfQkxPQ0tfUFdNKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JcmV0
ID0gcHdtY2hpcF9hZGQoJnN0bXBlX3B3bS0+Y2hpcCk7CisJcmV0ID0gcHdtY2hpcF9hZGQoY2hp
cCk7CiAJaWYgKHJldCkgewogCQlzdG1wZV9kaXNhYmxlKHN0bXBlLCBTVE1QRV9CTE9DS19QV00p
OwogCQlyZXR1cm4gcmV0OwotLSAKMi40Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
