Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7446296EA
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Nov 2022 12:14:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DF16C6504B;
	Tue, 15 Nov 2022 11:14:07 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D44D2C64104
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Nov 2022 11:14:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1outt9-0006Wo-F7; Tue, 15 Nov 2022 12:13:59 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1outt7-004Qgn-E5; Tue, 15 Nov 2022 12:13:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1outt7-00GmRi-6z; Tue, 15 Nov 2022 12:13:57 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 15 Nov 2022 12:13:46 +0100
Message-Id: <20221115111347.3705732-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115111347.3705732-1-u.kleine-koenig@pengutronix.de>
References: <20221115111347.3705732-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=iXmxqmw+3c/LhQoVXeLJZkQYjKkipArmZYpun72ed08=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjc3Rg6EF/v6toXb9ehA0tWaV+ggiioRELXaT1wl60
 t5MBC3GJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY3N0YAAKCRDB/BR4rcrsCbBfB/
 49WX5r7TXwnTAK9ZxI/61+6e2ptsbZE6O1cSNc2pO+06WYZclF7yUrG+XYeqvLEAhUHw17W0wFx3U7
 Lc3dtKRCF5SmnZ4X0waN4f9fCMWojCF27b9EgFEsxaKkeSVXOQcanCWnnSEHcHnE82SilGAQisvnCT
 kBL8rfCtml7jDZ+5QgYocnG28dqs/sZSjilDhoc1B54CG0BHsMvg/1i0M0qUX+ueHuuDq7Nc/Rlaia
 Q2e7gXjHBnskzeFBkJwWJBBuwn4s79FPqTQvyeMiHzLKhv+enXWrHSc/WRKvyyHESN2NcZbjaYJN8Q
 oiBkn/3q7a32A/09cWboo62RDUNMV6
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/5] pwm: stm32-lp: Use regmap_clear_bits and
	regmap_set_bits where applicable
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

Rm91bmQgdXNpbmcgY29jY2luZWxsZSBhbmQgdGhlIGZvbGxvd2luZyBzZW1hbnRpYyBwYXRjaDoK
CkBACmV4cHJlc3Npb24gbWFwLCByZWcsIGJpdHM7CkBACgotIHJlZ21hcF91cGRhdGVfYml0cyht
YXAsIHJlZywgYml0cywgYml0cykKKyByZWdtYXBfc2V0X2JpdHMobWFwLCByZWcsIGJpdHMpCgpA
QApleHByZXNzaW9uIG1hcCwgcmVnLCBiaXRzOwpAQAoKLSByZWdtYXBfdXBkYXRlX2JpdHMobWFw
LCByZWcsIGJpdHMsIDApCisgcmVnbWFwX2NsZWFyX2JpdHMobWFwLCByZWcsIGJpdHMpCgpTaWdu
ZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4
LmRlPgotLS0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jIHwgNSArKy0tLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3B3bS9wd20tc3RtMzItbHAuYyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jCmluZGV4
IDMxMTVhYmIzZjUyYS4uMjEyYmRjN2Q1MWVlIDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20t
c3RtMzItbHAuYworKysgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzItbHAuYwpAQCAtMTQwLDkgKzE0
MCw4IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX2xwX2FwcGx5KHN0cnVjdCBwd21fY2hpcCAqY2hp
cCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKIAogCWlmIChyZWVuYWJsZSkgewogCQkvKiBTdGFy
dCBMUCB0aW1lciBpbiBjb250aW51b3VzIG1vZGUgKi8KLQkJcmV0ID0gcmVnbWFwX3VwZGF0ZV9i
aXRzKHByaXYtPnJlZ21hcCwgU1RNMzJfTFBUSU1fQ1IsCi0JCQkJCSBTVE0zMl9MUFRJTV9DTlRT
VFJULAotCQkJCQkgU1RNMzJfTFBUSU1fQ05UU1RSVCk7CisJCXJldCA9IHJlZ21hcF9zZXRfYml0
cyhwcml2LT5yZWdtYXAsIFNUTTMyX0xQVElNX0NSLAorCQkJCSAgICAgIFNUTTMyX0xQVElNX0NO
VFNUUlQpOwogCQlpZiAocmV0KSB7CiAJCQlyZWdtYXBfd3JpdGUocHJpdi0+cmVnbWFwLCBTVE0z
Ml9MUFRJTV9DUiwgMCk7CiAJCQlnb3RvIGVycjsKLS0gCjIuMzguMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
