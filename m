Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C55C17C8C86
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Oct 2023 19:42:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DC14C6B442;
	Fri, 13 Oct 2023 17:42:46 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA49BC64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 17:42:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qrMBA-0004VF-BU; Fri, 13 Oct 2023 19:42:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qrMB7-001RgQ-76; Fri, 13 Oct 2023 19:42:25 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qrMB6-00FilQ-T7; Fri, 13 Oct 2023 19:42:24 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Fri, 13 Oct 2023 19:42:05 +0200
Message-ID: <20231013174204.1457085-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2024;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Jw1sN5icL+aTGXegL1KKLnEOKhic0UKDh73rtiw7rKU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlKYFskKTqtssqZIdgk+76YyHvwGsNASsaoY5Eb
 qXb+aYndMWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZSmBbAAKCRCPgPtYfRL+
 TnpUB/94Rb7ImJa1JHBMssTYaC01OTNC4YG3y0XfXKLaKUW9Zoch0nSYruPX9hsjmRDfcptFkku
 yI0lj61TABbNziRqdmBbOAcEsma/sTiWDKKFb+X1LPU7h8tmBgt2ZkzgrPpAyomodmKCk+GM4Nw
 kPEOFGvciGa55RE5Yzp/Hc8XL0P0I2LFsmMS/IrMOLBBSUytgEJ/Z4GlCJMeivTcguoCbtDbBwc
 gsL3JROcqSwc4TfNeVL0NwOS7GdfOc7SxDMdruSsCFX5lYnzgO9owMDS38QhzkXeqYVusGcnNoY
 j8xun9IT/ww179rPuZ6kPTCN3h3IGFJR9nBTmFFG3VYzga/n
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
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 00/11] pwm: Use DEFINE_SIMPLE_DEV_PM_OPS
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

SGVsbG8sCgp0aGUgb25seSBjaGFuZ2UgaGVyZSBjb21wYXJlZCB0byAoaW1wbGljaXQpIHYxIHNl
bnQgd2l0aCBNZXNzYWdlLUlkOgoyMDIzMTAxMDA3NTExMi43NTUxNzgtMS11LmtsZWluZS1rb2Vu
aWdAcGVuZ3V0cm9uaXguZGUgaXMgYSByZWJhc2Ugb24KVGhpZXJyeSdzIGN1cnJlbnQgZm9yLW5l
eHQgYnJhbmNoIGFuZCBJIGFkZGVkIHRoZSB0YWdzIEkgcmVjaWV2ZWQgb24gdGhlCnByZXZpb3Vz
IHN1Ym1pc3Npb24uCgpJbiB2MSBJIGRpZCBhIHNtYWxsIGltcHJvdmVtZW50IGZvciB0aGUgYnJj
bXN0YiBQV00gZHJpdmVyIGVuIHBhc3NhbnQsCndoaWNoIHdhcyBhbHJlYWR5IGRvbmUgYnkgRmxv
cmlhbiBpbiBhIHBhdGNoIHRoYXQgaXMgbm93IGNvbW1pdAphYWNiZDY1NDM2NjkgKCJwd206IGJy
Y21zdGI6IENoZWNrZWQgY2xrX3ByZXBhcmVfZW5hYmxlKCkgcmV0dXJuCnZhbHVlIikuIFNvIHRo
ZSBicmNtc3RiIHBhdGNoIGluIHRoaXMgc2VyaWVzIHNpbXBsaWZpZWQgdG8gYmUgc2ltaWxhciB0
bwp0aGUgb3RoZXIgcGF0Y2hlcyBoZXJlIGFuZCBzbyB0aGUgY29tbWl0IGxvZyBpbXByb3ZlbWVu
dCB0aGF0IEkgcHJvbWlzZWQKb24gSm9uYXRoYW4gQ2FtZXJvbidzIGZlZWRiYWNrIHdhcyBkcm9w
cGVkIGFnYWluLgoKQmVzdCByZWdhcmRzClV3ZQoKVXdlIEtsZWluZS1Lw7ZuaWcgKDExKToKICBw
d206IGF0bWVsLWhsY2RjOiBVc2UgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTIGZvciBQTSBmdW5j
dGlvbnMKICBwd206IGF0bWVsLXRjYjogVXNlIERFRklORV9TSU1QTEVfREVWX1BNX09QUyBmb3Ig
UE0gZnVuY3Rpb25zCiAgcHdtOiBiZXJsaW46IFVzZSBERUZJTkVfU0lNUExFX0RFVl9QTV9PUFMg
Zm9yIFBNIGZ1bmN0aW9ucwogIHB3bTogYnJjbXN0YjogVXNlIERFRklORV9TSU1QTEVfREVWX1BN
X09QUyBmb3IgUE0gZnVuY3Rpb25zCiAgcHdtOiBkd2M6IFVzZSBERUZJTkVfU0lNUExFX0RFVl9Q
TV9PUFMgZm9yIFBNIGZ1bmN0aW9ucwogIHB3bTogaW14LXRwbTogVXNlIERFRklORV9TSU1QTEVf
REVWX1BNX09QUyBmb3IgUE0gZnVuY3Rpb25zCiAgcHdtOiBzYW1zdW5nOiBVc2UgREVGSU5FX1NJ
TVBMRV9ERVZfUE1fT1BTIGZvciBQTSBmdW5jdGlvbnMKICBwd206IHN0bTMyLWxwOiBVc2UgREVG
SU5FX1NJTVBMRV9ERVZfUE1fT1BTIGZvciBQTSBmdW5jdGlvbnMKICBwd206IHN0bTMyOiBVc2Ug
REVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTIGZvciBQTSBmdW5jdGlvbnMKICBwd206IHRpZWNhcDog
VXNlIERFRklORV9TSU1QTEVfREVWX1BNX09QUyBmb3IgUE0gZnVuY3Rpb25zCiAgcHdtOiB0aWVo
cnB3bTogVXNlIERFRklORV9TSU1QTEVfREVWX1BNX09QUyBmb3IgUE0gZnVuY3Rpb25zCgogZHJp
dmVycy9wd20vcHdtLWF0bWVsLWhsY2RjLmMgfCAgOCArKystLS0tLQogZHJpdmVycy9wd20vcHdt
LWF0bWVsLXRjYi5jICAgfCAgOCArKystLS0tLQogZHJpdmVycy9wd20vcHdtLWJlcmxpbi5jICAg
ICAgfCAgOCArKystLS0tLQogZHJpdmVycy9wd20vcHdtLWJyY21zdGIuYyAgICAgfCAgOCArKyst
LS0tLQogZHJpdmVycy9wd20vcHdtLWR3Yy5jICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMv
cHdtL3B3bS1pbXgtdHBtLmMgICAgIHwgMTAgKysrKystLS0tLQogZHJpdmVycy9wd20vcHdtLXNh
bXN1bmcuYyAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jICAgIHwg
MTAgKysrKystLS0tLQogZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgICAgICAgfCAgOCArKysrLS0t
LQogZHJpdmVycy9wd20vcHdtLXRpZWNhcC5jICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvcHdt
L3B3bS10aWVocnB3bS5jICAgIHwgIDggKysrLS0tLS0KIDExIGZpbGVzIGNoYW5nZWQsIDM1IGlu
c2VydGlvbnMoKyksIDUxIGRlbGV0aW9ucygtKQoKCmJhc2UtY29tbWl0OiA0YmIzNmQxMjZjYjMx
NDdkNmJiZmQwMDI0MmE1Yjg0NmRhY2FkNTk1Ci0tIAoyLjQyLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
