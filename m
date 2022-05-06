Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2B451DA52
	for <lists+linux-stm32@lfdr.de>; Fri,  6 May 2022 16:15:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19810C628AB;
	Fri,  6 May 2022 14:15:50 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ECF68C5E2CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 May 2022 14:15:48 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nmykE-0000Ai-1W; Fri, 06 May 2022 16:15:46 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nmykD-000ivN-BC; Fri, 06 May 2022 16:15:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nmykB-007yBe-9K; Fri, 06 May 2022 16:15:43 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri,  6 May 2022 16:15:35 +0200
Message-Id: <20220506141535.133179-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583; h=from:subject;
 bh=FAOBqMIoOdc95FM7wSI4U3A+BzZmPhK2DrzIajwueWo=;
 b=owGbwMvMwMV48I9IxdpTbzgZT6slMSSV6rYET/zZLTgh+1mLVJaAoM15iW7H5Bfcf3XqirZKzmjI
 +uvcyWjMwsDIxSArpshSV6QlNkFizX+7kiXcMINYmUCmMHBxCsBENm3lYOi6qXG9QX/OX70XWTyPZ5
 x2q5+RnC4VcHZpeZhmYaNahuO7qAWCn03Ddflr0p+uXRzvHtBg42u9d+W0clYDtx0bfHse/NecFZz2
 W+hu30abJcHH0xUVdU2k53fePM91rb0joc5wYvqfdeoOO3viXi2RyNq/wMZV4vOdI8vVp8fHNl2fsz
 5Ug01Uzre79gTv8aILxhs+WG4+J9pqJHN8Wr0BQ1Pad6balw+fSa57XvCy+F2R6Km7f7hf9kmFZapq
 P31xvL20y7XIX9Zi6ZSiDQtrZ05oalw5JS0o8J3aJxHNmfwaXxYd27z61Fy1rVbza6I8d5d3m2+US9
 y+q1Y2yWNjRIpbeLPlztbAXQ+0AA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@pengutronix.de
Subject: [Linux-stm32] [PATCH] pwm: stmpe: Implement .apply() callback
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

VG8gZXZlbnR1YWxseSBnZXQgcmlkIG9mIGFsbCBsZWdhY3kgZHJpdmVycyBjb252ZXJ0IHRoaXMg
ZHJpdmVyIHRvIHRoZQptb2Rlcm4gd29ybGQgaW1wbGVtZW50aW5nIC5hcHBseSgpLgpUaGlzIGp1
c3QgcHVzaGVkIGEgdmFyaWFudCBvZiBwd21fYXBwbHlfbGVnYWN5KCkgaW50byB0aGUgZHJpdmVy
IHRoYXQgd2FzCnNsaWdodGx5IHNpbXBsaWZpZWQgYmVjYXVzZSB0aGUgZHJpdmVyIGRvZXNuJ3Qg
cHJvdmlkZSBhIC5zZXRfcG9sYXJpdHkoKQpjYWxsYmFjay4KClNpZ25lZC1vZmYtYnk6IFV3ZSBL
bGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVy
cy9wd20vcHdtLXN0bXBlLmMgfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQogMSBm
aWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9wd20vcHdtLXN0bXBlLmMgYi9kcml2ZXJzL3B3bS9wd20tc3RtcGUuYwppbmRl
eCBjNDMzNmQzYmFjZTMuLjVkNGE0NzYyY2UwYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdt
LXN0bXBlLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXN0bXBlLmMKQEAgLTI1OSwxMCArMjU5LDMz
IEBAIHN0YXRpYyBpbnQgc3RtcGVfMjR4eF9wd21fY29uZmlnKHN0cnVjdCBwd21fY2hpcCAqY2hp
cCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBz
dG1wZV8yNHh4X3B3bV9hcHBseShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2
aWNlICpwd20sCisJCQkJY29uc3Qgc3RydWN0IHB3bV9zdGF0ZSAqc3RhdGUpCit7CisJaW50IGVy
cjsKKworCWlmIChzdGF0ZS0+cG9sYXJpdHkgIT0gUFdNX1BPTEFSSVRZX05PUk1BTCkKKwkJcmV0
dXJuIC1FSU5WQUw7CisKKwlpZiAoIXN0YXRlLT5lbmFibGVkKSB7CisJCWlmIChwd20tPnN0YXRl
LmVuYWJsZWQpCisJCQlzdG1wZV8yNHh4X3B3bV9kaXNhYmxlKGNoaXAsIHB3bSk7CisKKwkJcmV0
dXJuIDA7CisJfQorCisJZXJyID0gc3RtcGVfMjR4eF9wd21fY29uZmlnKHB3bS0+Y2hpcCwgcHdt
LCBzdGF0ZS0+ZHV0eV9jeWNsZSwgc3RhdGUtPnBlcmlvZCk7CisJaWYgKGVycikKKwkJcmV0dXJu
IGVycjsKKworCWlmICghcHdtLT5zdGF0ZS5lbmFibGVkKQorCQllcnIgPSBzdG1wZV8yNHh4X3B3
bV9lbmFibGUoY2hpcCwgcHdtKTsKKworCXJldHVybiBlcnI7Cit9CisKIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgcHdtX29wcyBzdG1wZV8yNHh4X3B3bV9vcHMgPSB7Ci0JLmNvbmZpZyA9IHN0bXBlXzI0
eHhfcHdtX2NvbmZpZywKLQkuZW5hYmxlID0gc3RtcGVfMjR4eF9wd21fZW5hYmxlLAotCS5kaXNh
YmxlID0gc3RtcGVfMjR4eF9wd21fZGlzYWJsZSwKKwkuYXBwbHkgPSBzdG1wZV8yNHh4X3B3bV9h
cHBseSwKIAkub3duZXIgPSBUSElTX01PRFVMRSwKIH07CiAKCmJhc2UtY29tbWl0OiAyYmY4ZWUw
ZmFhOTg4YjVjZWMzNTAzZWJmMmY5NzBhMGU4NGQyNGVlCi0tIAoyLjM1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
