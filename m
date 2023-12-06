Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92279806E4B
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Dec 2023 12:48:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5243EC6DD68;
	Wed,  6 Dec 2023 11:48:30 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C701BC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Dec 2023 11:48:28 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAqOA-0006ME-HH; Wed, 06 Dec 2023 12:48:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAqOA-00DwtR-3X; Wed, 06 Dec 2023 12:48:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rAqO9-00FQye-Qj; Wed, 06 Dec 2023 12:48:25 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Wed,  6 Dec 2023 12:43:47 +0100
Message-ID: <375190a81bd1521b90f27688feb43e6c9e9f7c98.1701860672.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1165;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=BiIJD0Tq83cq7moryfFH9gyYiLGEDBNRcTCtX9A+nHI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlcF6HLoP1OaHoexIr6EMIiiprrEBIQ/7P3If3p
 jiZkoVgDpuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZXBehwAKCRCPgPtYfRL+
 TqSZCACQ+blNnBR+8nc5bN8F4Hbhd3Dl2W9yuAMYZKirGF1OA0OXeZ6ldVkjaRGVDxJgGG60VWN
 8s2pDyXSEz2JORuvUNICjz27RufwdL+W232iVJeTfr/yXzX/FAo3MN6Sg34eIqNV4cSjnvMcdDk
 Y0OpLGZy5k2gm6iepgNcdlAZwPePfng7D4G0n8ogPPHRh3we92NOP89r/y+pIIOErY7hpjQp4Aq
 eiUI/V2bXDATfOvs9xtukU8q4QDiz/BueqCTVLroKe4/HK77zzNkSePReLc58gRcEFkBqFFQeFh
 EbwCCh9BUkUijkfu6i8FA9vzzwAtRWATrF0iUvcaGM6XU1dg
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, kernel@pengutronix.de,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 033/115] pwm: stm32: Make use of
	pwmchip_parent() macro
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

c3RydWN0IHB3bV9jaGlwOjpkZXYgaXMgYWJvdXQgdG8gY2hhbmdlLiBUbyBub3QgaGF2ZSB0byB0
b3VjaCB0aGlzCmRyaXZlciBpbiB0aGUgc2FtZSBjb21taXQgYXMgc3RydWN0IHB3bV9jaGlwOjpk
ZXYsIHVzZSB0aGUgbWFjcm8KcHJvdmlkZWQgZm9yIGV4YWN0bHkgdGhpcyBwdXJwb3NlLgoKU2ln
bmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25p
eC5kZT4KLS0tCiBkcml2ZXJzL3B3bS9wd20tc3RtMzIuYyB8IDQgKystLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3B3bS9wd20tc3RtMzIuYyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCmluZGV4IDVmMTBjYmE0
OTJlYy4uZDFkYzllM2NhMmExIDEwMDY0NAotLS0gYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwor
KysgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwpAQCAtOTQsNyArOTQsNyBAQCBzdGF0aWMgaW50
IHN0bTMyX3B3bV9yYXdfY2FwdHVyZShzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2LCBzdHJ1Y3QgcHdt
X2RldmljZSAqcHdtLAogCQkJCSB1bnNpZ25lZCBsb25nIHRtb19tcywgdTMyICpyYXdfcHJkLAog
CQkJCSB1MzIgKnJhd19kdHkpCiB7Ci0Jc3RydWN0IGRldmljZSAqcGFyZW50ID0gcHJpdi0+Y2hp
cC5kZXYtPnBhcmVudDsKKwlzdHJ1Y3QgZGV2aWNlICpwYXJlbnQgPSBwd21jaGlwX3BhcmVudCgm
cHJpdi0+Y2hpcCktPnBhcmVudDsKIAllbnVtIHN0bTMyX3RpbWVyc19kbWFzIGRtYV9pZDsKIAl1
MzIgY2NlbiwgY2NyOwogCWludCByZXQ7CkBAIC0xNzAsNyArMTcwLDcgQEAgc3RhdGljIGludCBz
dG0zMl9wd21fY2FwdHVyZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNl
ICpwd20sCiAKIAlyZXQgPSBjbGtfZW5hYmxlKHByaXYtPmNsayk7CiAJaWYgKHJldCkgewotCQlk
ZXZfZXJyKHByaXYtPmNoaXAuZGV2LCAiZmFpbGVkIHRvIGVuYWJsZSBjb3VudGVyIGNsb2NrXG4i
KTsKKwkJZGV2X2Vycihwd21jaGlwX3BhcmVudChjaGlwKSwgImZhaWxlZCB0byBlbmFibGUgY291
bnRlciBjbG9ja1xuIik7CiAJCWdvdG8gdW5sb2NrOwogCX0KIAotLSAKMi40Mi4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
