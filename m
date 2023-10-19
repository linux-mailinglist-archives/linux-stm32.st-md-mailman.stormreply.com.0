Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B04127D02FE
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Oct 2023 22:07:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FB5EC6C838;
	Thu, 19 Oct 2023 20:07:53 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACA6DC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Oct 2023 20:07:51 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtZJ7-0000Bd-8J; Thu, 19 Oct 2023 22:07:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtZJ6-002rg4-RO; Thu, 19 Oct 2023 22:07:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtZJ6-001veT-I0; Thu, 19 Oct 2023 22:07:48 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 19 Oct 2023 22:07:04 +0200
Message-ID: <20231019200658.1754190-12-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
References: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=WvXDNthRYYY+rxaLHuzNpUXyl/hU4Ew/1JV88Z5oCuQ=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhlTDngzbO2sdlbKje6JKXSKKw/xPvCubItBbH8P/58UVq
 a+TPzR0MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjARdR0OhtmvilU+nr2s2aUT
 aNz4P2RZ+hZTA8v8WZG5DVIn5pim7Q2drbVg7/UbKcL5phekTgf9EWf+u1honmszx4yHGfylfOf
 NeATCc68qOxw/lGAcHdXwuvxoCGvsxUUnJmTUJ/gmvf8aobk67bx4/71Z2w/lvfcMYJ5naXPrNu
 8M+fx5QtZv1rm4hRuz5PQV3uZttToxWyk9cJWB71PPsmjGrPCeOWsKsk5IX2S4WHZLuu2nSbPnM
 Znpl3uaWH3Wam9K68iNXpespFYbM+3c9vLO1gBz42vL97lWtPv5zN3EMPNE+NprHZmR+9/fPr0x
 65vRx73fNq/b3/DiMm+Nkiqf0aFLUWoqN7xP9C2bZb4eAA==
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
Subject: [Linux-stm32] [PATCH 5/5] pwm: stm32: Fix enable count for clk in
	.probe()
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

RnJvbTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KCk1ha2UgdGhlIGRy
aXZlciB0YWtlIG92ZXIgaGFyZHdhcmUgc3RhdGUgd2l0aG91dCBkaXNhYmxpbmcgaW4gLnByb2Jl
KCkKYW5kIGVuYWJsZSB0aGUgY2xvY2sgZm9yIGVhY2ggZW5hYmxlZCBjaGFubmVsLgoKU2lnbmVk
LW9mZi1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KW3VrbGVpbmVr
OiBzcGxpdCBvZmYgZnJvbSBhIHBhdGNoIHRoYXQgYWxzbyBpbXBsZW1lbnRlZCAuZ2V0X3N0YXRl
KCldClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVu
Z3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgfCAxOCArKysrKysrKysr
KysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jIGIvZHJpdmVycy9wd20vcHdt
LXN0bTMyLmMKaW5kZXggNjgyMzk1NjdhNTY0Li45N2EyYzNjMDliNjkgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvcHdtL3B3bS1zdG0zMi5jCisrKyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCkBAIC02
MDUsMTcgKzYwNSwyMSBAQCBzdGF0aWMgdm9pZCBzdG0zMl9wd21fZGV0ZWN0X2NvbXBsZW1lbnRh
cnkoc3RydWN0IHN0bTMyX3B3bSAqcHJpdikKIAlwcml2LT5oYXZlX2NvbXBsZW1lbnRhcnlfb3V0
cHV0ID0gKGNjZXIgIT0gMCk7CiB9CiAKLXN0YXRpYyB1bnNpZ25lZCBpbnQgc3RtMzJfcHdtX2Rl
dGVjdF9jaGFubmVscyhzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2KQorc3RhdGljIHVuc2lnbmVkIGlu
dCBzdG0zMl9wd21fZGV0ZWN0X2NoYW5uZWxzKHN0cnVjdCBzdG0zMl9wd20gKnByaXYsCisJCQkJ
CSAgICAgIHVuc2lnbmVkIGludCAqbnVtX2VuYWJsZWQpCiB7Ci0JdTMyIGNjZXI7CisJdTMyIGNj
ZXIsIGNjZXJfYmFja3VwOwogCiAJLyoKIAkgKiBJZiBjaGFubmVscyBlbmFibGUgYml0cyBkb24n
dCBleGlzdCB3cml0aW5nIDEgd2lsbCBoYXZlIG5vCiAJICogZWZmZWN0IHNvIHdlIGNhbiBkZXRl
Y3QgYW5kIGNvdW50IHRoZW0uCiAJICovCisJcmVnbWFwX3JlYWQocHJpdi0+cmVnbWFwLCBUSU1f
Q0NFUiwgJmNjZXJfYmFja3VwKTsKIAlyZWdtYXBfc2V0X2JpdHMocHJpdi0+cmVnbWFwLCBUSU1f
Q0NFUiwgVElNX0NDRVJfQ0NYRSk7CiAJcmVnbWFwX3JlYWQocHJpdi0+cmVnbWFwLCBUSU1fQ0NF
UiwgJmNjZXIpOwotCXJlZ21hcF9jbGVhcl9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NDRVIsIFRJ
TV9DQ0VSX0NDWEUpOworCXJlZ21hcF93cml0ZShwcml2LT5yZWdtYXAsIFRJTV9DQ0VSLCBjY2Vy
X2JhY2t1cCk7CisKKwkqbnVtX2VuYWJsZWQgPSBod2VpZ2h0MzIoY2Nlcl9iYWNrdXAgJiBUSU1f
Q0NFUl9DQ1hFKTsKIAogCXJldHVybiBod2VpZ2h0MzIoY2NlciAmIFRJTV9DQ0VSX0NDWEUpOwog
fQpAQCAtNjI2LDYgKzYzMCw4IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc3RydWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+b2Zf
bm9kZTsKIAlzdHJ1Y3Qgc3RtMzJfdGltZXJzICpkZGF0YSA9IGRldl9nZXRfZHJ2ZGF0YShwZGV2
LT5kZXYucGFyZW50KTsKIAlzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2OworCXVuc2lnbmVkIGludCBu
dW1fZW5hYmxlZDsKKwl1bnNpZ25lZCBpbnQgaTsKIAlpbnQgcmV0OwogCiAJcHJpdiA9IGRldm1f
a3phbGxvYyhkZXYsIHNpemVvZigqcHJpdiksIEdGUF9LRVJORUwpOwpAQCAtNjQ4LDcgKzY1NCwx
MSBAQCBzdGF0aWMgaW50IHN0bTMyX3B3bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQogCiAJcHJpdi0+Y2hpcC5kZXYgPSBkZXY7CiAJcHJpdi0+Y2hpcC5vcHMgPSAmc3RtMzJw
d21fb3BzOwotCXByaXYtPmNoaXAubnB3bSA9IHN0bTMyX3B3bV9kZXRlY3RfY2hhbm5lbHMocHJp
dik7CisJcHJpdi0+Y2hpcC5ucHdtID0gc3RtMzJfcHdtX2RldGVjdF9jaGFubmVscyhwcml2LCAm
bnVtX2VuYWJsZWQpOworCisJLyogSW5pdGlhbGl6ZSBjbG9jayByZWZjb3VudCB0byBudW1iZXIg
b2YgZW5hYmxlZCBQV00gY2hhbm5lbHMuICovCisJZm9yIChpID0gMDsgaSA8IG51bV9lbmFibGVk
OyBpKyspCisJCWNsa19lbmFibGUocHJpdi0+Y2xrKTsKIAogCXJldCA9IGRldm1fcHdtY2hpcF9h
ZGQoZGV2LCAmcHJpdi0+Y2hpcCk7CiAJaWYgKHJldCA8IDApCi0tIAoyLjQyLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
