Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFD887CF81
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Mar 2024 15:54:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D721C6DD69;
	Fri, 15 Mar 2024 14:54:53 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD4F1C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Mar 2024 14:54:51 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rl8xM-0000Km-Lm; Fri, 15 Mar 2024 15:54:48 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rl8xL-006WVk-0w; Fri, 15 Mar 2024 15:54:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rl8xK-006kDD-31;
 Fri, 15 Mar 2024 15:54:46 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org
Date: Fri, 15 Mar 2024 15:54:43 +0100
Message-ID: <20240315145443.982807-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1283;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=5xtuVME2bEVprkiCGWUVejqQHtDlCZ5J0Kbg7qpVECI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl9GEzzgJmj7PhAFoXRTzvOnXpgcBkQwROOyhaP
 BADzsJi3pmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZfRhMwAKCRCPgPtYfRL+
 TmseCACAhdodC9zN62s3ZYGZYsReg94sGAqphWAr91MEB1mhmweD5B+kNl9HicbTmVf8mFz1sLu
 UcX1/Kzy7qtPM+upx/WHNpIJCHDyxTUau5354qEa5g8qBRmJ5RFNsGhbpIY0J8WtJxYQY5bAeDQ
 08R1lTvei0MH1U+jJQivfo+lDmp8vrJDA/QXVFW2sdnuFyqkY8ohs5BqDu14mAf0feHx+OypEgk
 mnOFbBPir2F+cfIPYqolPNpkC0AZox2k6xftgjXQb7ifT4iRq1IpZqnsYz5Rw2rp5qbZX6e3n/d
 9peF0jWsYkonm3KizXWLp9HclCw7jVe8BFKa/5u4S90VIadH
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] pwm: stm32: Add error messages in .probe()'s
	error paths
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

R2l2aW5nIGFuIGluZGljYXRpb24gYWJvdXQgdGhlIHByb2JsZW0gaWYgcHJvYmluZyBhIGRldmlj
ZSBmYWlscyBpcyBhCm5pY2UgbW92ZS4gRG8gdGhhdCBmb3IgdGhlIHN0bTMyIHB3bSBkcml2ZXIu
CgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1
dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5jIHwgOSArKysrKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwppbmRl
eCAwYzAyOGQxN2MwNzUuLmZmZTU3MmI3NjE3NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdt
LXN0bTMyLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKQEAgLTY0OCwxMSArNjQ4LDEz
IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiAJcHJpdi0+bWF4X2FyciA9IGRkYXRhLT5tYXhfYXJyOwogCiAJaWYgKCFwcml2LT5yZWdt
YXAgfHwgIXByaXYtPmNsaykKLQkJcmV0dXJuIC1FSU5WQUw7CisJCXJldHVybiBkZXZfZXJyX3By
b2JlKGRldiwgLUVJTlZBTCwgIkZhaWxlZCB0byBnZXQgJXNcbiIsCisJCQkJICAgICBwcml2LT5y
ZWdtYXAgPyAiY2xrIiA6ICJyZWdtYXAiKTsKIAogCXJldCA9IHN0bTMyX3B3bV9wcm9iZV9icmVh
a2lucHV0cyhwcml2LCBucCk7CiAJaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKKwkJcmV0dXJuIGRl
dl9lcnJfcHJvYmUoZGV2LCByZXQsCisJCQkJICAgICAiRmFpbGVkIHRvIGNvbmZpZ3VyZSBicmVh
a2lucHV0c1xuIik7CiAKIAlzdG0zMl9wd21fZGV0ZWN0X2NvbXBsZW1lbnRhcnkocHJpdik7CiAK
QEAgLTY2NCw3ICs2NjYsOCBAQCBzdGF0aWMgaW50IHN0bTMyX3B3bV9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogCiAJcmV0ID0gZGV2bV9wd21jaGlwX2FkZChkZXYsIGNoaXAp
OwogCWlmIChyZXQgPCAwKQotCQlyZXR1cm4gcmV0OworCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShk
ZXYsIHJldCwKKwkJCQkgICAgICJGYWlsZWQgdG8gcmVnaXN0ZXIgcHdtY2hpcFxuIik7CiAKIAlw
bGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBjaGlwKTsKIAoKYmFzZS1jb21taXQ6IGRkNmM2ZDU3
YWI2MWQ0OTZmNmZmN2Q2Y2EzODYxMTA2MmFmMTQyYTEKLS0gCjIuNDMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
