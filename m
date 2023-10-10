Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A137BF4CF
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Oct 2023 09:51:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED8E1C6B442;
	Tue, 10 Oct 2023 07:51:35 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39F34C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 07:51:35 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qq7WS-00085v-Dq; Tue, 10 Oct 2023 09:51:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qq7WO-000big-7a; Tue, 10 Oct 2023 09:51:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qq7WN-00CvmQ-Tt; Tue, 10 Oct 2023 09:51:15 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Tue, 10 Oct 2023 09:51:01 +0200
Message-Id: <20231010075112.755178-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=A8HP9dusodcVd01/oywSk7GyIKXIzSNIx/3Y74BCkPc=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlJQJcnufZamylMhsh8sHRAmnhUy5NU96BFuv1Y
 +e804696reJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSUCXAAKCRCPgPtYfRL+
 Tjh6CACMY4DrmuQjpMLEcju7BTHj+1LkPQrPGzvdAqhyOjGVgG6nn1jcf2VaamQObZChkefRgLs
 oGITc8kXXHSZrBoDCl/3UmmLnAvW5k3tjbcea5fGxJiYwtHMEHeNP8QN3KvDPJfHdaSBXRSjFxG
 qeSWUlbgXAxCXPOs+4g2lYNASWm34COaFAlVOM6+RVayhDGxrwp1VpVzb3FoaFsKxd23l6ro6F7
 rfSbpRLt9/8ksOGpw8hOrWkkX+yr4FYnGFjHigSeTR3+Pa4R/8DYRXBsd7tiaO4TtfGaE1juULa
 wGYbs9wy/RogDPwlSXCYddDhVrgS0MNXIWr8BbqF6xiyXxC3
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-samsung-soc@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/11] pwm: Use DEFINE_SIMPLE_DEV_PM_OPS for
	PM functions
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

SGVsbG8sCgpGbG9yaWFuIGFkZGVkIHBtIHN1cHBvcnQgdG8gdGhlIHB3bS1iY20yODM1IGRyaXZl
clsxXS4gVGhpcyBtYWRlIG1lCmNoZWNrIHdoYXQgaXMgdGhlICJtb2Rlcm4iIHdheSB0byBhZGQg
cG0gc3VwcG9ydC4gVGhpcyBzZXJpZXMgbW9kZXJuaXplcwp0aGUgb3RoZXIgcHdtIGRyaXZlcnMg
d2l0aCB0aGUgdGhpbmdzIEkgbGVhcm5lZC4KCkJlc3QgcmVnYXJkcwpVd2UKClsxXSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1wd20vMjAyMzEwMDkyMDQyMjYuMzIyNDUyMS0xLWZsb3Jp
YW4uZmFpbmVsbGlAYnJvYWRjb20uY29tCgpVd2UgS2xlaW5lLUvDtm5pZyAoMTEpOgogIHB3bTog
YXRtZWwtaGxjZGM6IFVzZSBERUZJTkVfU0lNUExFX0RFVl9QTV9PUFMgZm9yIFBNIGZ1bmN0aW9u
cwogIHB3bTogYXRtZWwtdGNiOiBVc2UgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTIGZvciBQTSBm
dW5jdGlvbnMKICBwd206IGJlcmxpbjogVXNlIERFRklORV9TSU1QTEVfREVWX1BNX09QUyBmb3Ig
UE0gZnVuY3Rpb25zCiAgcHdtOiBicmNtc3RiOiBVc2UgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BT
IGZvciBQTSBmdW5jdGlvbnMKICBwd206IGR3YzogVXNlIERFRklORV9TSU1QTEVfREVWX1BNX09Q
UyBmb3IgUE0gZnVuY3Rpb25zCiAgcHdtOiBpbXgtdHBtOiBVc2UgREVGSU5FX1NJTVBMRV9ERVZf
UE1fT1BTIGZvciBQTSBmdW5jdGlvbnMKICBwd206IHNhbXN1bmc6IFVzZSBERUZJTkVfU0lNUExF
X0RFVl9QTV9PUFMgZm9yIFBNIGZ1bmN0aW9ucwogIHB3bTogc3RtMzItbHA6IFVzZSBERUZJTkVf
U0lNUExFX0RFVl9QTV9PUFMgZm9yIFBNIGZ1bmN0aW9ucwogIHB3bTogc3RtMzI6IFVzZSBERUZJ
TkVfU0lNUExFX0RFVl9QTV9PUFMgZm9yIFBNIGZ1bmN0aW9ucwogIHB3bTogdGllY2FwOiBVc2Ug
REVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTIGZvciBQTSBmdW5jdGlvbnMKICBwd206IHRpZWhycHdt
OiBVc2UgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTIGZvciBQTSBmdW5jdGlvbnMKCiBkcml2ZXJz
L3B3bS9wd20tYXRtZWwtaGxjZGMuYyB8ICA4ICsrKy0tLS0tCiBkcml2ZXJzL3B3bS9wd20tYXRt
ZWwtdGNiLmMgICB8ICA4ICsrKy0tLS0tCiBkcml2ZXJzL3B3bS9wd20tYmVybGluLmMgICAgICB8
ICA4ICsrKy0tLS0tCiBkcml2ZXJzL3B3bS9wd20tYnJjbXN0Yi5jICAgICB8IDEyICsrKystLS0t
LS0tLQogZHJpdmVycy9wd20vcHdtLWR3Yy5jICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMv
cHdtL3B3bS1pbXgtdHBtLmMgICAgIHwgMTAgKysrKystLS0tLQogZHJpdmVycy9wd20vcHdtLXNh
bXN1bmcuYyAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jICAgIHwg
MTAgKysrKystLS0tLQogZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgICAgICAgfCAgOCArKysrLS0t
LQogZHJpdmVycy9wd20vcHdtLXRpZWNhcC5jICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvcHdt
L3B3bS10aWVocnB3bS5jICAgIHwgIDggKysrLS0tLS0KIDExIGZpbGVzIGNoYW5nZWQsIDM2IGlu
c2VydGlvbnMoKyksIDU0IGRlbGV0aW9ucygtKQoKYmFzZS1jb21taXQ6IDBiYjgwZWNjMzNhOGZi
NWE2ODIyMzY0NDNjMWU3NDBkNWM5MTdkMWQKLS0gCjIuNDAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
