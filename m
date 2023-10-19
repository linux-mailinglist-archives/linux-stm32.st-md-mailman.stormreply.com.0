Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7117D0306
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Oct 2023 22:07:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A706C6C838;
	Thu, 19 Oct 2023 20:07:59 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4F12C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Oct 2023 20:07:58 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtZJ6-0000Aj-V6; Thu, 19 Oct 2023 22:07:48 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtZJ6-002rfy-4z; Thu, 19 Oct 2023 22:07:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtZJ5-001veL-Rn; Thu, 19 Oct 2023 22:07:47 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 19 Oct 2023 22:07:02 +0200
Message-ID: <20231019200658.1754190-10-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
References: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=uyweP2aIcsRVvk3AtSYYRpvNOEu9/0+LfIDkqZDP1tI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlMYxl8jmcvHhowW1afeBxXdq95JiaMVza0c+Hn
 nJbhQ/YMSWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTGMZQAKCRCPgPtYfRL+
 Tk2WB/92MjgFC+qqLG5grNnjGFrJqjVg5me4tFTahRFqRZSDJaGHMqHClECOa7DxekoL7PfjvG4
 hwbYWcM8YUlbwZ+6nkOAcyZ1Z4IU/SIZz7fZnuXbxOBft033flkVaqQk5brsw6CKQayzp73oXWx
 Z3dMmeW7HmOOWoypsnAoVt/OhfMdht/1zQZWAVeA16YHG5uXN96yWP1q4ZhZAqvqs2+J6E3mQW5
 c4TQ+HiglsyP2uvXrVNLFk0ZPPf/kAsGw5cwsvZ7WfvirG4NKPmnht8ZOni8oub1XIuI/10rNfX
 4qMOP2yhbxov/zxDBgaKfSi15UQuCZPG3RSXhIOEBxXH0g5x
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
Subject: [Linux-stm32] [PATCH 3/5] pwm: stm32: Use hweight32 in
	stm32_pwm_detect_channels
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

RnJvbTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KClVzZSBod2VpZ2h0
MzIoKSB0byBjb3VudCB0aGUgQ0N4RSBiaXRzIGluIHN0bTMyX3B3bV9kZXRlY3RfY2hhbm5lbHMo
KS4KU2luY2UgdGhlIHJldHVybiB2YWx1ZSBpcyBhc3NpZ25lZCB0byBjaGlwLm5wd20sIGNoYW5n
ZSBpdCB0byB1bnNpZ25lZAppbnQgYXMgd2VsbC4KClNpZ25lZC1vZmYtYnk6IFBoaWxpcHAgWmFi
ZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+ClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2
bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9wd20vcHdt
LXN0bTMyLmMgfCAxNyArKy0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXN0
bTMyLmMgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwppbmRleCAwMDlmOWMxYTVlY2EuLmNjNmNh
ZTA3YzAyYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKKysrIGIvZHJpdmVy
cy9wd20vcHdtLXN0bTMyLmMKQEAgLTU2MywxMCArNTYzLDkgQEAgc3RhdGljIHZvaWQgc3RtMzJf
cHdtX2RldGVjdF9jb21wbGVtZW50YXJ5KHN0cnVjdCBzdG0zMl9wd20gKnByaXYpCiAJcHJpdi0+
aGF2ZV9jb21wbGVtZW50YXJ5X291dHB1dCA9IChjY2VyICE9IDApOwogfQogCi1zdGF0aWMgaW50
IHN0bTMyX3B3bV9kZXRlY3RfY2hhbm5lbHMoc3RydWN0IHN0bTMyX3B3bSAqcHJpdikKK3N0YXRp
YyB1bnNpZ25lZCBpbnQgc3RtMzJfcHdtX2RldGVjdF9jaGFubmVscyhzdHJ1Y3Qgc3RtMzJfcHdt
ICpwcml2KQogewogCXUzMiBjY2VyOwotCWludCBucHdtID0gMDsKIAogCS8qCiAJICogSWYgY2hh
bm5lbHMgZW5hYmxlIGJpdHMgZG9uJ3QgZXhpc3Qgd3JpdGluZyAxIHdpbGwgaGF2ZSBubwpAQCAt
NTc2LDE5ICs1NzUsNyBAQCBzdGF0aWMgaW50IHN0bTMyX3B3bV9kZXRlY3RfY2hhbm5lbHMoc3Ry
dWN0IHN0bTMyX3B3bSAqcHJpdikKIAlyZWdtYXBfcmVhZChwcml2LT5yZWdtYXAsIFRJTV9DQ0VS
LCAmY2Nlcik7CiAJcmVnbWFwX2NsZWFyX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ0NFUiwgVElN
X0NDRVJfQ0NYRSk7CiAKLQlpZiAoY2NlciAmIFRJTV9DQ0VSX0NDMUUpCi0JCW5wd20rKzsKLQot
CWlmIChjY2VyICYgVElNX0NDRVJfQ0MyRSkKLQkJbnB3bSsrOwotCi0JaWYgKGNjZXIgJiBUSU1f
Q0NFUl9DQzNFKQotCQlucHdtKys7Ci0KLQlpZiAoY2NlciAmIFRJTV9DQ0VSX0NDNEUpCi0JCW5w
d20rKzsKLQotCXJldHVybiBucHdtOworCXJldHVybiBod2VpZ2h0MzIoY2NlciAmIFRJTV9DQ0VS
X0NDWEUpOwogfQogCiBzdGF0aWMgaW50IHN0bTMyX3B3bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQotLSAKMi40Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
