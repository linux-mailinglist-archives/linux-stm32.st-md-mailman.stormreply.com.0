Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E00F67D3E42
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Oct 2023 19:47:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6FD7C6C841;
	Mon, 23 Oct 2023 17:47:08 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13BE9C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Oct 2023 17:47:07 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1quz0p-0001MC-OB; Mon, 23 Oct 2023 19:46:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1quz0n-003lPS-G2; Mon, 23 Oct 2023 19:46:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1quz0n-004VCf-67; Mon, 23 Oct 2023 19:46:45 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 23 Oct 2023 19:46:17 +0200
Message-ID: <20231023174616.2282067-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1861;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=tgJTzh0/TB6FKMDbGnTB8E71HMJ4FWAbQpaUcMf/MkY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlNrFoWv/a/+umj+TsDnjVM+cbkmM/5oElj2Xbx
 sBR6y/N63aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTaxaAAKCRCPgPtYfRL+
 ThC3CACH0tTuzBm5pKlTbQ1PnRQHVRu56R4oM3xe+zes4kU2Uu81vu6PIFBDpDd/qF6U32ngZRl
 QNJc+UZtBryi3hTqGLyP/tw4KnCQ7lT8tOIj+YRXNyO8XYlFhjVn9qzVLMe4LmX4lUVfKvNMjBn
 iiudzptDqz/zYjkxjmJyCrgQ+bKDrNK0kZoYW/vAanlrrRYtu0lBYVj312hY30FoLCriP/V6hr1
 idb6H71aA0AidvWI5atKwzDQqfCwa7ZRU9LpzbNsD9oHzwNFyeM2au0vMG+wy6K8Wo+I7LhxsaY
 tGL5Y9dszUjdduw9+qxSa3l7TP/yyGJX85tv8H9sbxxbaTVt
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
Subject: [Linux-stm32] [PATCH v3 00/11] pwm: Use DEFINE_SIMPLE_DEV_PM_OPS
	for PM functions
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

SGVsbG8sCgp0aGlzIHYzIHdhcyBuZWNlc3NhcnkgYmVjYXVzZSBzb21lIGxpbmVzIGluIHRoZSBj
b21taXQgbG9nIG9mIGEgc3Vic2V0Cm9mIHRoZXNlIHBhdGNoZXMgd2VyZSBlYXRlbi4gSSB0aGlu
ayB0aGF0IGhhcHBlbmQgZHVyaW5nIHJlYmFzZSAtaSB3aGVyZQpnaXQgZHJvcHMgbGluZXMgc3Rh
cnRpbmcgd2l0aCAjIGR1cmluZyBnaXQtY29tbWl0LiBnaXQtYW0gaXNuJ3QgYWZmZWN0ZWQgYnkK
dGhpcyAiZmVhdHVyZSIsIHNvIGFwcGxpY2F0aW9uIHNob3VsZCB3b3JrIGZpbmUuIFN0aWxsIGNo
ZWNraW5nIHRoZXNlCmxpbmVzIG1ha2UgaXQgaW50byB0aGUgZ2l0IGNvbW1pdCBpcyBhIGdvb2Qg
aWRlYSBJIHRoaW5rLgoKT3RoZXIgdGhhbiB0aGUgZmV3IGFkZGl0aW9uYWwgbGluZXMgaW4gdGhl
IGNvbW1pdCBsb2dzLCBvbmUgUmV2aWV3ZWQtYnk6CmlzIGFkZGVkIGFuZCB0aGUgc2VyaWVzIGlz
IG90aGVyd2lzZSB1bmNoYW5nZWQuCgpCZXN0IHJlZ2FyZHMKVXdlCgpVd2UgS2xlaW5lLUvDtm5p
ZyAoMTEpOgogIHB3bTogYXRtZWwtaGxjZGM6IFVzZSBERUZJTkVfU0lNUExFX0RFVl9QTV9PUFMg
Zm9yIFBNIGZ1bmN0aW9ucwogIHB3bTogYXRtZWwtdGNiOiBVc2UgREVGSU5FX1NJTVBMRV9ERVZf
UE1fT1BTIGZvciBQTSBmdW5jdGlvbnMKICBwd206IGJlcmxpbjogVXNlIERFRklORV9TSU1QTEVf
REVWX1BNX09QUyBmb3IgUE0gZnVuY3Rpb25zCiAgcHdtOiBicmNtc3RiOiBVc2UgREVGSU5FX1NJ
TVBMRV9ERVZfUE1fT1BTIGZvciBQTSBmdW5jdGlvbnMKICBwd206IGR3YzogVXNlIERFRklORV9T
SU1QTEVfREVWX1BNX09QUyBmb3IgUE0gZnVuY3Rpb25zCiAgcHdtOiBpbXgtdHBtOiBVc2UgREVG
SU5FX1NJTVBMRV9ERVZfUE1fT1BTIGZvciBQTSBmdW5jdGlvbnMKICBwd206IHNhbXN1bmc6IFVz
ZSBERUZJTkVfU0lNUExFX0RFVl9QTV9PUFMgZm9yIFBNIGZ1bmN0aW9ucwogIHB3bTogc3RtMzIt
bHA6IFVzZSBERUZJTkVfU0lNUExFX0RFVl9QTV9PUFMgZm9yIFBNIGZ1bmN0aW9ucwogIHB3bTog
c3RtMzI6IFVzZSBERUZJTkVfU0lNUExFX0RFVl9QTV9PUFMgZm9yIFBNIGZ1bmN0aW9ucwogIHB3
bTogdGllY2FwOiBVc2UgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTIGZvciBQTSBmdW5jdGlvbnMK
ICBwd206IHRpZWhycHdtOiBVc2UgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTIGZvciBQTSBmdW5j
dGlvbnMKCiBkcml2ZXJzL3B3bS9wd20tYXRtZWwtaGxjZGMuYyB8ICA4ICsrKy0tLS0tCiBkcml2
ZXJzL3B3bS9wd20tYXRtZWwtdGNiLmMgICB8ICA4ICsrKy0tLS0tCiBkcml2ZXJzL3B3bS9wd20t
YmVybGluLmMgICAgICB8ICA4ICsrKy0tLS0tCiBkcml2ZXJzL3B3bS9wd20tYnJjbXN0Yi5jICAg
ICB8ICA4ICsrKy0tLS0tCiBkcml2ZXJzL3B3bS9wd20tZHdjLmMgICAgICAgICB8ICA2ICsrLS0t
LQogZHJpdmVycy9wd20vcHdtLWlteC10cG0uYyAgICAgfCAxMCArKysrKy0tLS0tCiBkcml2ZXJz
L3B3bS9wd20tc2Ftc3VuZy5jICAgICB8ICA2ICsrLS0tLQogZHJpdmVycy9wd20vcHdtLXN0bTMy
LWxwLmMgICAgfCAxMCArKysrKy0tLS0tCiBkcml2ZXJzL3B3bS9wd20tc3RtMzIuYyAgICAgICB8
ICA4ICsrKystLS0tCiBkcml2ZXJzL3B3bS9wd20tdGllY2FwLmMgICAgICB8ICA2ICsrLS0tLQog
ZHJpdmVycy9wd20vcHdtLXRpZWhycHdtLmMgICAgfCAgOCArKystLS0tLQogMTEgZmlsZXMgY2hh
bmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgNTEgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IDRi
YjM2ZDEyNmNiMzE0N2Q2YmJmZDAwMjQyYTViODQ2ZGFjYWQ1OTUKLS0gCjIuNDIuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
