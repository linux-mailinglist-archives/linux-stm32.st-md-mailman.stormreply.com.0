Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B907F2F4A
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Nov 2023 14:51:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5FC6C6B479;
	Tue, 21 Nov 2023 13:51:53 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20049C6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Nov 2023 13:51:53 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5RAM-0005LZ-Tw; Tue, 21 Nov 2023 14:51:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5RAM-00AayA-GY; Tue, 21 Nov 2023 14:51:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r5RAM-004xcV-7Q; Tue, 21 Nov 2023 14:51:50 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 21 Nov 2023 14:49:30 +0100
Message-ID: <20231121134901.208535-29-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
In-Reply-To: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1165;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=BiIJD0Tq83cq7moryfFH9gyYiLGEDBNRcTCtX9A+nHI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlXLVrKamzo059IDn9Bz0ICE63cZQkJbSdbJPvs
 yBcg3j/30iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVy1awAKCRCPgPtYfRL+
 TjAJB/sEKV1EpNt9BVuq0M74NChKDcJS2AD2S0xSI1tKjbP1mG4RXX4a/x0f2OAC98RQ/B9/t6+
 SrJa35PDIU+CLPk9fM73iS5OWNh/n6eeSmfUWg5sXB9wRvd9/zQIAakFnao8+54TifdA3MR/cPn
 fr49yQRRaoZ/4wR/obNsm/ii9HugQAlF+bYCupfX/8twL7JlxwjqD5Tvt4bv2Pbq4g/AcnrRDkM
 k82OiQ5OHnSprFH7RsvWJ39i4bVkseGunwBZ1SS4SHQNeZ+bPe2E+lYsasR9d5LSvFQB4WmXKlK
 /adoKsinmhoLebc7UPNEGfAoGw+9oogo9nKobXdC27bXNERK
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 028/108] pwm: stm32: Make use of
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
