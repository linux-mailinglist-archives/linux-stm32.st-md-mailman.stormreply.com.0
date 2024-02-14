Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4430D85456B
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 10:34:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DACB2C035BB;
	Wed, 14 Feb 2024 09:34:45 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E648EC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 09:34:43 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf5-0005ik-3n; Wed, 14 Feb 2024 10:34:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf1-000fFi-8S; Wed, 14 Feb 2024 10:34:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1raBf1-004Y7R-0a;
 Wed, 14 Feb 2024 10:34:35 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org
Date: Wed, 14 Feb 2024 10:32:40 +0100
Message-ID: <54ace92a3c02d22f15a79c7ecf00c29f28386a33.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=bZTsW8lAwjzlND0LcwKPlCEPg8gdCtmlWf6i463Sq1k=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIjN2bCo4elWQTi51iNbI+Kc+Jt2OcDstTYJh
 EROUhArW/6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyIzQAKCRCPgPtYfRL+
 TtuFB/0VadLMWhIrTIg38YKPDtgTBx6Tn4VV33yfCIaelHzLHNHL6Cu3b76q6dbMT+sXHYNaOL9
 IxrLgjvVR51f+/yumbGQesuyBlJ4wqZknMLGmdSiHcLlrKsprfrovyVcD8Ckf861FWYmNf8p+4D
 3e+RNxtmM/3fAs+1dQxqyMi6tlUxJtt7ozjR/7GLp7+tpv4XD0cbxT9tUuHvV2zf+sObWcmV8jA
 vriK8BShqzzJs2zZW4LSq8wxMvh4b3VOhaSMsKUfI8HU+R3Pskjvw8Hz3cjPhxaw8PCJ2AHQV+S
 pPS1nsPMXGiwJ/EOgR2rLGzZvmKsRsQCFNKPjUqAIYFOj3Fh
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 113/164] pwm: stm32: Simplify code to
	determine the pwmchip's parent device
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

VGhlcmUgaXMgYWxyZWFkeSBhIHBvaW50ZXIgdG8gdGhlIHB3bWNoaXAsIG1ha2UgdXNlIG9mIGl0
IGRpcmVjdGx5Cmluc3RlYWQgb2YgdXNpbmcgdGhlIHN0cnVjdCBzdG0zMl9wd20gKnByaXYganVz
dCBvYnRhaW5lZCBmcm9tIGl0LiBUaGlzCmFsc28gaGFzIHRoZSBhZHZhbnRhZ2Ugb2Ygbm90IHVz
aW5nIHN0cnVjdCBzdG0zMl9wd206OmNoaXAgYW55IG1vcmUKd2hpY2ggd2lsbCBiZSBkcm9wcGVk
IHNvb24uCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmln
QHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwppbmRleCA1
ZjEwY2JhNDkyZWMuLjIwMjExNGMwMGFkMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLXN0
bTMyLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKQEAgLTE3MCw3ICsxNzAsNyBAQCBz
dGF0aWMgaW50IHN0bTMyX3B3bV9jYXB0dXJlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0
IHB3bV9kZXZpY2UgKnB3bSwKIAogCXJldCA9IGNsa19lbmFibGUocHJpdi0+Y2xrKTsKIAlpZiAo
cmV0KSB7Ci0JCWRldl9lcnIocHJpdi0+Y2hpcC5kZXYsICJmYWlsZWQgdG8gZW5hYmxlIGNvdW50
ZXIgY2xvY2tcbiIpOworCQlkZXZfZXJyKGNoaXAtPmRldiwgImZhaWxlZCB0byBlbmFibGUgY291
bnRlciBjbG9ja1xuIik7CiAJCWdvdG8gdW5sb2NrOwogCX0KIAotLSAKMi40My4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
