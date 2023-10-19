Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E1B7D02FF
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Oct 2023 22:07:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71485C6C83F;
	Thu, 19 Oct 2023 20:07:53 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7E75C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Oct 2023 20:07:51 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtZJ6-0000Ah-V6; Thu, 19 Oct 2023 22:07:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtZJ5-002rfv-T9; Thu, 19 Oct 2023 22:07:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtZJ5-001veH-JX; Thu, 19 Oct 2023 22:07:47 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 19 Oct 2023 22:07:01 +0200
Message-ID: <20231019200658.1754190-9-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
References: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=7f75PVVxVopmOVTh1aUDtvsneuXS9AhU8k3+zgRBTe8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlMYxkxM0GUmvVtAQdmfgUDj+XP46m8mONLLbLs
 Ddk9JypUF2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTGMZAAKCRCPgPtYfRL+
 TvvaCACj+8dG+4/zQL/4OubeWWXtiHBVpDUgr/dabE71cYW38ec1vTqrm3gzR/z49xvFozkyJ6G
 EDixygJzPs7KQilRIbXtm3xmlV02wg57bHmp+nCL8mMRCmGPAKlSpYljLOrPNibDG9O0eCsmLm5
 m2vKbon4Jd1dL+NbvlNIpTZsymf6z5a5mDtS1ILWrPjViTxznqVYqutA5FfcYczFUYlmCQ/raVb
 66VPiKdCwio/rXsJgvcBzVJvboF9SroW5Pq8o0Fl/SX9QrKiVfsBuMs/nJHBsD3erp5YSa/ur5n
 HpEZPmAKp9sET6F1TmtiV+G79bw03xKOcHQyKBB1uahjOoug
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/5] pwm: stm32: Make ch parameter unsigned
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

RnJvbTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KClRoZSBjaGFubmVs
IHBhcmFtZXRlciBpcyBvbmx5IGV2ZXIgc2V0IHRvIHB3bS0+aHdwd20uCk1ha2UgaXQgdW5zaWdu
ZWQgaW50IGFzIHdlbGwuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBl
bmd1dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5jIHwgOCAr
KysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYyBiL2RyaXZlcnMvcHdtL3B3bS1z
dG0zMi5jCmluZGV4IDVlNDg1ODRlM2JkNC4uMDA5ZjljMWE1ZWNhIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3B3bS9wd20tc3RtMzIuYworKysgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwpAQCAtMzA4
LDcgKzMwOCw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX2NhcHR1cmUoc3RydWN0IHB3bV9jaGlw
ICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRp
YyBpbnQgc3RtMzJfcHdtX2NvbmZpZyhzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2LCBpbnQgY2gsCitz
dGF0aWMgaW50IHN0bTMyX3B3bV9jb25maWcoc3RydWN0IHN0bTMyX3B3bSAqcHJpdiwgdW5zaWdu
ZWQgaW50IGNoLAogCQkJICAgIGludCBkdXR5X25zLCBpbnQgcGVyaW9kX25zKQogewogCXVuc2ln
bmVkIGxvbmcgbG9uZyBwcmQsIGRpdiwgZHR5OwpAQCAtMzcxLDcgKzM3MSw3IEBAIHN0YXRpYyBp
bnQgc3RtMzJfcHdtX2NvbmZpZyhzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2LCBpbnQgY2gsCiAJcmV0
dXJuIDA7CiB9CiAKLXN0YXRpYyBpbnQgc3RtMzJfcHdtX3NldF9wb2xhcml0eShzdHJ1Y3Qgc3Rt
MzJfcHdtICpwcml2LCBpbnQgY2gsCitzdGF0aWMgaW50IHN0bTMyX3B3bV9zZXRfcG9sYXJpdHko
c3RydWN0IHN0bTMyX3B3bSAqcHJpdiwgdW5zaWduZWQgaW50IGNoLAogCQkJCSAgZW51bSBwd21f
cG9sYXJpdHkgcG9sYXJpdHkpCiB7CiAJdTMyIG1hc2s7CkBAIC0zODYsNyArMzg2LDcgQEAgc3Rh
dGljIGludCBzdG0zMl9wd21fc2V0X3BvbGFyaXR5KHN0cnVjdCBzdG0zMl9wd20gKnByaXYsIGlu
dCBjaCwKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCBzdG0zMl9wd21fZW5hYmxlKHN0cnVj
dCBzdG0zMl9wd20gKnByaXYsIGludCBjaCkKK3N0YXRpYyBpbnQgc3RtMzJfcHdtX2VuYWJsZShz
dHJ1Y3Qgc3RtMzJfcHdtICpwcml2LCB1bnNpZ25lZCBpbnQgY2gpCiB7CiAJdTMyIG1hc2s7CiAJ
aW50IHJldDsKQEAgLTQxMSw3ICs0MTEsNyBAQCBzdGF0aWMgaW50IHN0bTMyX3B3bV9lbmFibGUo
c3RydWN0IHN0bTMyX3B3bSAqcHJpdiwgaW50IGNoKQogCXJldHVybiAwOwogfQogCi1zdGF0aWMg
dm9pZCBzdG0zMl9wd21fZGlzYWJsZShzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2LCBpbnQgY2gpCitz
dGF0aWMgdm9pZCBzdG0zMl9wd21fZGlzYWJsZShzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2LCB1bnNp
Z25lZCBpbnQgY2gpCiB7CiAJdTMyIG1hc2s7CiAKLS0gCjIuNDIuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
