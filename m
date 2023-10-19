Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CFB7D0308
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Oct 2023 22:08:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B13E1C6C83E;
	Thu, 19 Oct 2023 20:08:07 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB5F8C6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Oct 2023 20:08:06 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtZJ6-0000Ag-V6; Thu, 19 Oct 2023 22:07:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtZJ5-002rfs-Jv; Thu, 19 Oct 2023 22:07:47 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtZJ5-001ve3-AL; Thu, 19 Oct 2023 22:07:47 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 19 Oct 2023 22:07:00 +0200
Message-ID: <20231019200658.1754190-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
References: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1768;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=XJO2ggFWysOn0g4wuN+uvCKU8+S2R3VmfphxGItb/Jo=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlMYxjGVnCbg0gnva3opb6gZdeiT1Ots7MkwFf4
 acaYa6X76aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTGMYwAKCRCPgPtYfRL+
 Tp3NB/0eTOzkcQ5HvaeR4sNjFj4/tyNZ2XaSKgaGZDhGXGsPvIm40b/R/RBUVGETXKfZb3/ojf7
 phq2p79AeVXuiyYbXEC03lDjBqGWn9bK0FzawYBRiiQvDYJnddPN/bs4+dmbdwzTSoSr36qZnWD
 bo8hfhA0uqdfacHt0XHJ7gNmmlfHIMftD9WYEA1DuMyR/WIKCFlPicla3N7XTotNwyHNZt5AGJe
 PEVp3EY3Mr5sTMzRAbCbgjb1LeREooFYGNGhOQaVj9/u5P6FunyH+RDTgvPuVsErjNBJuKphwI7
 rLAIFSz/8H12vhu8paiknEmseAFnk+CwqYwrSO3vXJuTlVLK
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
Subject: [Linux-stm32] [PATCH 1/5] pwm: stm32: Replace write_ccrx with
	regmap_write
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

RnJvbTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KClRoZSBUSU1fQ0NS
MS4uLjQgcmVnaXN0ZXJzIGFyZSBjb25zZWN1dGl2ZSwgc28gcmVwbGFjZSB0aGUgc3dpdGNoCmNh
c2Ugd2l0aCBhIHNpbXBsZSBjYWxjdWxhdGlvbi4gU2luY2UgY2ggaXMga25vd24gdG8gYmUgaW4g
dGhlIDAuLi4zCnJhbmdlIChpdCBpcyBzZXQgdG8gaHdwd20gPCBucHdtIDw9IDQpLCBkcm9wIHRo
ZSB1bm5lY2Vzc2FyeSBlcnJvcgpoYW5kbGluZy4gVGhlIHJldHVybiB2YWx1ZSB3YXMgbm90IGNo
ZWNrZWQgYW55d2F5LiBXaGF0IHJlbWFpbnMgZG9lcwpub3Qgd2FycmFudCBrZWVwaW5nIHRoZSB3
cml0ZV9jY3J4KCkgZnVuY3Rpb24gYXJvdW5kLCBzbyBpbnN0ZWFkIGNhbGwKcmVnbWFwX3dyaXRl
KCkgZGlyZWN0bHkgYXQgdGhlIHNpbmd1bGFyIGNhbGwgc2l0ZS4KClNpZ25lZC1vZmYtYnk6IFBo
aWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+ClNpZ25lZC1vZmYtYnk6IFV3ZSBL
bGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVy
cy9wd20vcHdtLXN0bTMyLmMgfCAxNyArLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3B3
bS9wd20tc3RtMzIuYyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCmluZGV4IDMzMDNhNzU0ZWEw
Mi4uNWU0ODU4NGUzYmQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYworKysg
Yi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwpAQCAtNTIsMjEgKzUyLDYgQEAgc3RhdGljIHUzMiBh
Y3RpdmVfY2hhbm5lbHMoc3RydWN0IHN0bTMyX3B3bSAqZGV2KQogCXJldHVybiBjY2VyICYgVElN
X0NDRVJfQ0NYRTsKIH0KIAotc3RhdGljIGludCB3cml0ZV9jY3J4KHN0cnVjdCBzdG0zMl9wd20g
KmRldiwgaW50IGNoLCB1MzIgdmFsdWUpCi17Ci0Jc3dpdGNoIChjaCkgewotCWNhc2UgMDoKLQkJ
cmV0dXJuIHJlZ21hcF93cml0ZShkZXYtPnJlZ21hcCwgVElNX0NDUjEsIHZhbHVlKTsKLQljYXNl
IDE6Ci0JCXJldHVybiByZWdtYXBfd3JpdGUoZGV2LT5yZWdtYXAsIFRJTV9DQ1IyLCB2YWx1ZSk7
Ci0JY2FzZSAyOgotCQlyZXR1cm4gcmVnbWFwX3dyaXRlKGRldi0+cmVnbWFwLCBUSU1fQ0NSMywg
dmFsdWUpOwotCWNhc2UgMzoKLQkJcmV0dXJuIHJlZ21hcF93cml0ZShkZXYtPnJlZ21hcCwgVElN
X0NDUjQsIHZhbHVlKTsKLQl9Ci0JcmV0dXJuIC1FSU5WQUw7Ci19Ci0KICNkZWZpbmUgVElNX0ND
RVJfQ0MxMlAgKFRJTV9DQ0VSX0NDMVAgfCBUSU1fQ0NFUl9DQzJQKQogI2RlZmluZSBUSU1fQ0NF
Ul9DQzEyRSAoVElNX0NDRVJfQ0MxRSB8IFRJTV9DQ0VSX0NDMkUpCiAjZGVmaW5lIFRJTV9DQ0VS
X0NDMzRQIChUSU1fQ0NFUl9DQzNQIHwgVElNX0NDRVJfQ0M0UCkKQEAgLTM2OSw3ICszNTQsNyBA
QCBzdGF0aWMgaW50IHN0bTMyX3B3bV9jb25maWcoc3RydWN0IHN0bTMyX3B3bSAqcHJpdiwgaW50
IGNoLAogCWR0eSA9IHByZCAqIGR1dHlfbnM7CiAJZG9fZGl2KGR0eSwgcGVyaW9kX25zKTsKIAot
CXdyaXRlX2NjcngocHJpdiwgY2gsIGR0eSk7CisJcmVnbWFwX3dyaXRlKHByaXYtPnJlZ21hcCwg
VElNX0NDUjEgKyA0ICogY2gsIGR0eSk7CiAKIAkvKiBDb25maWd1cmUgb3V0cHV0IG1vZGUgKi8K
IAlzaGlmdCA9IChjaCAmIDB4MSkgKiBDQ01SX0NIQU5ORUxfU0hJRlQ7Ci0tIAoyLjQyLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
