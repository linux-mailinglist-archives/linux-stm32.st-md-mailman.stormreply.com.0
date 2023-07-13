Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 687797527B8
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jul 2023 17:51:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C409C6B45D;
	Thu, 13 Jul 2023 15:51:55 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0BB2C6B45C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jul 2023 15:51:54 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJybd-0004il-9k; Thu, 13 Jul 2023 17:51:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJybc-00E9KB-3U; Thu, 13 Jul 2023 17:51:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJybb-004abh-9x; Thu, 13 Jul 2023 17:51:47 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 13 Jul 2023 17:51:42 +0200
Message-Id: <20230713155142.2454010-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713155142.2454010-1-u.kleine-koenig@pengutronix.de>
References: <20230713155142.2454010-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1342;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=apBYvwQ8Xvzmv3dzNjz7fDsp+SOzPk4mArfRVsDwhU4=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBksB2N6DlpaPS3SS+ZcmJGhd7ysiMqTSeyyJ1Bz
 QLQ8bm6PziJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZLAdjQAKCRCPgPtYfRL+
 ToSCCACIrNWk/VA/bapZ39Eum/kzghluzIhE1Hp/a+FHN+p+xuW/rhzoCj4lqogYH3CsFcYjpI3
 JkaS7z03qMv9ZLkhG0GsDXK48Tplvb13b4KzwSqzb6bF/6gvXVJrdfRzDt257jbzFyycOzYnfx4
 XRUv2ldHOV/PtP/Ttop/BTJH3wYwZ5GMBXl6Pkzri2BopKXmskPLFSgXjxx34gF0ZZ2jy4dfxAl
 DZN10tJi9KYMZB7Cu6fwAT9rKexws5wUwv8Qgnsi0fhnoN9XBcEMugdrvzGbUGNvPJIBKqSw4hA
 SuaSiYzwxZSPVGI2P2pIonDMzEU3A5veySG+hQbyg0rIZ2eG
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] pwm: stm32: Simplify using
	devm_pwmchip_add()
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

VGhpcyBhbGxvd3MgdG8gZHJvcCB0aGUgcGxhdGZvcm1fZHJpdmVyJ3MgcmVtb3ZlIGZ1bmN0aW9u
LgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5n
dXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tc3RtMzIuYyB8IDEwICstLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCmlu
ZGV4IDY4Nzk2N2QzMjY1Zi4uM2Q2YmU3NzQ5ZTIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9w
d20tc3RtMzIuYworKysgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwpAQCAtNjM3LDcgKzYzNyw3
IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiAJcHJpdi0+Y2hpcC5vcHMgPSAmc3RtMzJwd21fb3BzOwogCXByaXYtPmNoaXAubnB3bSA9
IHN0bTMyX3B3bV9kZXRlY3RfY2hhbm5lbHMocHJpdik7CiAKLQlyZXQgPSBwd21jaGlwX2FkZCgm
cHJpdi0+Y2hpcCk7CisJcmV0ID0gZGV2bV9wd21jaGlwX2FkZChkZXYsICZwcml2LT5jaGlwKTsK
IAlpZiAocmV0IDwgMCkKIAkJcmV0dXJuIHJldDsKIApAQCAtNjQ2LDEzICs2NDYsNiBAQCBzdGF0
aWMgaW50IHN0bTMyX3B3bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJl
dHVybiAwOwogfQogCi1zdGF0aWMgdm9pZCBzdG0zMl9wd21fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCi17Ci0Jc3RydWN0IHN0bTMyX3B3bSAqcHJpdiA9IHBsYXRmb3JtX2dl
dF9kcnZkYXRhKHBkZXYpOwotCi0JcHdtY2hpcF9yZW1vdmUoJnByaXYtPmNoaXApOwotfQotCiBz
dGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHN0bTMyX3B3bV9zdXNwZW5kKHN0cnVjdCBkZXZpY2Ug
KmRldikKIHsKIAlzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7
CkBAIC02OTcsNyArNjkwLDYgQEAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgc3RtMzJfcHdtX29m
X21hdGNoKTsKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc3RtMzJfcHdtX2RyaXZl
ciA9IHsKIAkucHJvYmUJPSBzdG0zMl9wd21fcHJvYmUsCi0JLnJlbW92ZV9uZXcgPSBzdG0zMl9w
d21fcmVtb3ZlLAogCS5kcml2ZXIJPSB7CiAJCS5uYW1lID0gInN0bTMyLXB3bSIsCiAJCS5vZl9t
YXRjaF90YWJsZSA9IHN0bTMyX3B3bV9vZl9tYXRjaCwKLS0gCjIuMzkuMgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
