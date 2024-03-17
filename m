Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D9887E086
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Mar 2024 22:52:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E247EC6DD93;
	Sun, 17 Mar 2024 21:52:38 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93D09C6DD68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Mar 2024 21:52:36 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rlyQk-0002kp-4u; Sun, 17 Mar 2024 22:52:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rlyQj-006xGw-EU; Sun, 17 Mar 2024 22:52:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rlyQj-007fo7-1A;
 Sun, 17 Mar 2024 22:52:33 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sun, 17 Mar 2024 22:52:16 +0100
Message-ID: <498a44b313a6c0a84ccddd03cd67aadaaaf7daf2.1710711976.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710711976.git.u.kleine-koenig@pengutronix.de>
References: <cover.1710711976.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1940;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=+gWyc/Xr/gKt2ssnUmtJ3znJ8evskyjFlYjxtuQFMak=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl92YUyRkkcP0unmpy4kqNjkBTg3KN6NxlE50gB
 egGrTLT8IWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZfdmFAAKCRCPgPtYfRL+
 TpFGB/9urgmvkMV9IFZToy3OTLf3mepNXYqCUGpkeRpS9GWqA3c/yZqMGEorYh4Y7C1udikWjCw
 VYV3KAvGRAF9i56fRD5kpGDDoF9AeZh2ikZjCw2Ge3rnAxNQPxRzZ6WuXN0rl5qXUdC0Vvh1yDj
 CP5/EYj/9NL4Bgqpi9s5UeziZCpjOpJLcJjxk6momz1zko18AR8IUWkrVSgWts5AuhfOO1lJlQJ
 4YaXMlS/aFLJfJPQjNmrYsUH/iJ2CGcZFTlLAm3nBD8BZDbM/eO/g/1k9hOJhSkHw521KlXvN6v
 iEBTzrPLRdX4xyfWlO/+G7V3w4b+DvI23bfK7DGzD4RMXiYE
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/3] pwm: stm32: Calculate prescaler with a
	division instead of a loop
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

SW5zdGVhZCBvZiBsb29waW5nIG92ZXIgaW5jcmVhc2luZyB2YWx1ZXMgZm9yIHRoZSBwcmVzY2Fs
ZXIgYW5kIHRlc3RpbmcKaWYgaXQncyBiaWcgZW5vdWdoLCBjYWxjdWxhdGUgdGhlIHZhbHVlIHVz
aW5nIGEgc2luZ2xlIGRpdmlzaW9uLgoKU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcg
PHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tc3Rt
MzIuYyB8IDI5ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTcgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
d20vcHdtLXN0bTMyLmMgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwppbmRleCBiMjBkNDM0MDhl
NjEuLmEyZjIzMWQxM2E5ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKKysr
IGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKQEAgLTMxMSwyOCArMzExLDMzIEBAIHN0YXRpYyBp
bnQgc3RtMzJfcHdtX2NhcHR1cmUoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2Rl
dmljZSAqcHdtLAogc3RhdGljIGludCBzdG0zMl9wd21fY29uZmlnKHN0cnVjdCBzdG0zMl9wd20g
KnByaXYsIHVuc2lnbmVkIGludCBjaCwKIAkJCSAgICB1NjQgZHV0eV9ucywgdTY0IHBlcmlvZF9u
cykKIHsKLQl1bnNpZ25lZCBsb25nIGxvbmcgcHJkLCBkaXYsIGR0eTsKLQl1bnNpZ25lZCBpbnQg
cHJlc2NhbGVyID0gMDsKKwl1bnNpZ25lZCBsb25nIGxvbmcgcHJkLCBkdHk7CisJdW5zaWduZWQg
bG9uZyBsb25nIHByZXNjYWxlcjsKIAl1MzIgY2NtciwgbWFzaywgc2hpZnQ7CiAKIAkvKgogCSAq
IC5wcm9iZSgpIGFzc2VydGVkIHRoYXQgY2xrX2dldF9yYXRlKCkgaXMgbm90IGJpZ2dlciB0aGFu
IDEgR0h6LCBzbwotCSAqIHRoaXMgd29uJ3Qgb3ZlcmZsb3cuCisJICogdGhlIGNhbGN1bGF0aW9u
cyBoZXJlIHdvbid0IG92ZXJmbG93LgorCSAqIEZpcnN0IHdlIG5lZWQgdG8gZmluZCB0aGUgbWlu
aW1hbCB2YWx1ZSBmb3IgcHJlc2NhbGVyIHN1Y2ggdGhhdAorCSAqCisJICogICAgICAgIHBlcmlv
ZF9ucyAqIGNsa3JhdGUKKwkgKiAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCSAq
ICAgTlNFQ19QRVJfU0VDICogKHByZXNjYWxlciArIDEpCisJICoKKwkgKiBpc24ndCBiaWdnZXIg
dGhhbiBtYXhfYXJyLgogCSAqLwotCWRpdiA9IG11bF91NjRfdTY0X2Rpdl91NjQocGVyaW9kX25z
LCBjbGtfZ2V0X3JhdGUocHJpdi0+Y2xrKSwKLQkJCQkgIE5TRUNfUEVSX1NFQyk7CiAKLQl3aGls
ZSAoZGl2ID4gcHJpdi0+bWF4X2FycikgewotCQlwcmVzY2FsZXIrKzsKLQkJZGl2ID0gcHJkOwot
CQlkb19kaXYoZGl2LCBwcmVzY2FsZXIgKyAxKTsKLQl9Ci0KLQlwcmQgPSBkaXY7CisJcHJlc2Nh
bGVyID0gbXVsX3U2NF91NjRfZGl2X3U2NChwZXJpb2RfbnMsIGNsa19nZXRfcmF0ZShwcml2LT5j
bGspLAorCQkJCQkodTY0KU5TRUNfUEVSX1NFQyAqIHByaXYtPm1heF9hcnIpOworCWlmIChwcmVz
Y2FsZXIgPiAwKQorCQlwcmVzY2FsZXIgLT0gMTsKIAogCWlmIChwcmVzY2FsZXIgPiBNQVhfVElN
X1BTQykKIAkJcmV0dXJuIC1FSU5WQUw7CiAKKwlwcmQgPSBtdWxfdTY0X3U2NF9kaXZfdTY0KHBl
cmlvZF9ucywgY2xrX2dldF9yYXRlKHByaXYtPmNsayksCisJCQkJICAodTY0KU5TRUNfUEVSX1NF
QyAqIChwcmVzY2FsZXIgKyAxKSk7CisKIAkvKgogCSAqIEFsbCBjaGFubmVscyBzaGFyZSB0aGUg
c2FtZSBwcmVzY2FsZXIgYW5kIGNvdW50ZXIgc28gd2hlbiB0d28KIAkgKiBjaGFubmVscyBhcmUg
YWN0aXZlIGF0IHRoZSBzYW1lIHRpbWUgd2UgY2FuJ3QgY2hhbmdlIHRoZW0KLS0gCjIuNDMuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
