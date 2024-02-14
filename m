Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD1B854570
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 10:34:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77567C71288;
	Wed, 14 Feb 2024 09:34:47 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61FBAC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 09:34:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf5-0005n0-7f; Wed, 14 Feb 2024 10:34:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1raBf2-000fG3-14; Wed, 14 Feb 2024 10:34:36 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1raBf1-004Y7l-35;
 Wed, 14 Feb 2024 10:34:35 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org
Date: Wed, 14 Feb 2024 10:32:45 +0100
Message-ID: <9ad2399e1a683a6344b12d7f70498393b8f8b9de.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1729;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=p17FPEGdt5iTjNuLV9ceuEp0unNUnbj7ddT/qbdQK6A=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIjSiFzVxGz5R9cEYI7bUJyRiPKUR9CFsjkaW
 i4NRo0cchuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyI0gAKCRCPgPtYfRL+
 Tt5yCACxBKnzZgWU3h2X0Pssz520fC4vS5n8IvUil7omtHL+QdVa1HqAdbHiMTefUpOE/lbprks
 9OXdbLyHyS+AP3rtkm9pf6NY9qiwCju+j8WxGHcuIE7pxjlGqG14SIelfDF1boJKg6l2ojCdehb
 zJ7IfYpisafyoF8FIChFk1gzc/ONNfnNtvM/6nXQff6eJCbBGCCJ6xr/cA8PIRekYefwuYn6TsR
 PAvFL1Eh8cnPZadlN2AadmF7XYfpkVIOMOAqbmwXXV8sR+LsV/JQiZaq6/aO4myzasrgrwTEZqF
 O3XYnL0Xd+toiysEZWSScpaBTuzdmy2sGr79orItPwV+hTkj
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 118/164] pwm: stm32-lp: Simplify code to
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
IGRpcmVjdGx5Cmluc3RlYWQgb2YgdXNpbmcgdGhlIHN0cnVjdCBzdG0zMl9wd21fbHAgKnByaXYg
anVzdCBvYnRhaW5lZCBmcm9tCml0LiBUaGlzIGFsc28gaGFzIHRoZSBhZHZhbnRhZ2Ugb2Ygbm90
IHVzaW5nIHN0cnVjdCBzdG0zMl9wd21fbHA6OmNoaXAKYW55IG1vcmUgd2hpY2ggd2lsbCBiZSBk
cm9wcGVkIHNvb24uCgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jIHwg
NiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMgYi9kcml2ZXJzL3B3bS9w
d20tc3RtMzItbHAuYwppbmRleCA0MzkwNjhmM2VjYTEuLmJiYWI2YmUzMTRhOCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMKKysrIGIvZHJpdmVycy9wd20vcHdtLXN0bTMy
LWxwLmMKQEAgLTYxLDcgKzYxLDcgQEAgc3RhdGljIGludCBzdG0zMl9wd21fbHBfYXBwbHkoc3Ry
dWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCWRvX2RpdihkaXYs
IE5TRUNfUEVSX1NFQyk7CiAJaWYgKCFkaXYpIHsKIAkJLyogQ2xvY2sgaXMgdG9vIHNsb3cgdG8g
YWNoaWV2ZSByZXF1ZXN0ZWQgcGVyaW9kLiAqLwotCQlkZXZfZGJnKHByaXYtPmNoaXAuZGV2LCAi
Q2FuJ3QgcmVhY2ggJWxsdSBuc1xuIiwgc3RhdGUtPnBlcmlvZCk7CisJCWRldl9kYmcoY2hpcC0+
ZGV2LCAiQ2FuJ3QgcmVhY2ggJWxsdSBuc1xuIiwgc3RhdGUtPnBlcmlvZCk7CiAJCXJldHVybiAt
RUlOVkFMOwogCX0KIApAQCAtNjksNyArNjksNyBAQCBzdGF0aWMgaW50IHN0bTMyX3B3bV9scF9h
cHBseShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20sCiAJd2hp
bGUgKGRpdiA+IFNUTTMyX0xQVElNX01BWF9BUlIpIHsKIAkJcHJlc2MrKzsKIAkJaWYgKCgxIDw8
IHByZXNjKSA+IFNUTTMyX0xQVElNX01BWF9QUkVTQ0FMRVIpIHsKLQkJCWRldl9lcnIocHJpdi0+
Y2hpcC5kZXYsICJtYXggcHJlc2NhbGVyIGV4Y2VlZGVkXG4iKTsKKwkJCWRldl9lcnIoY2hpcC0+
ZGV2LCAibWF4IHByZXNjYWxlciBleGNlZWRlZFxuIik7CiAJCQlyZXR1cm4gLUVJTlZBTDsKIAkJ
fQogCQlkaXYgPSBwcmQgPj4gcHJlc2M7CkBAIC0xMzAsNyArMTMwLDcgQEAgc3RhdGljIGludCBz
dG0zMl9wd21fbHBfYXBwbHkoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2Rldmlj
ZSAqcHdtLAogCQkJCSAgICAgICAodmFsICYgU1RNMzJfTFBUSU1fQ01QT0tfQVJST0spID09IFNU
TTMyX0xQVElNX0NNUE9LX0FSUk9LLAogCQkJCSAgICAgICAxMDAsIDEwMDApOwogCWlmIChyZXQp
IHsKLQkJZGV2X2Vycihwcml2LT5jaGlwLmRldiwgIkFSUi9DTVAgcmVnaXN0ZXJzIHdyaXRlIGlz
c3VlXG4iKTsKKwkJZGV2X2VycihjaGlwLT5kZXYsICJBUlIvQ01QIHJlZ2lzdGVycyB3cml0ZSBp
c3N1ZVxuIik7CiAJCWdvdG8gZXJyOwogCX0KIAlyZXQgPSByZWdtYXBfd3JpdGUocHJpdi0+cmVn
bWFwLCBTVE0zMl9MUFRJTV9JQ1IsCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
