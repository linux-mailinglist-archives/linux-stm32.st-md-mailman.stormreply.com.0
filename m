Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B411C81CFE9
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 23:51:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78C10C6B477;
	Fri, 22 Dec 2023 22:51:32 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A418C6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 22:51:31 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rGoMN-0005ZT-6G; Fri, 22 Dec 2023 23:51:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rGoMJ-000qus-6T; Fri, 22 Dec 2023 23:51:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rGoMK-000Ff0-0a;
 Fri, 22 Dec 2023 23:51:12 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Date: Fri, 22 Dec 2023 23:50:31 +0100
Message-ID: <cover.1703284359.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2268;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=v7ypKlogWSytD7lf1SVbYFZwVbn6mIgx5yAUcapzsz0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlhhK27tJuAJCvbukbs16KJeuc3ApgCd8jJ8GTK
 l8H4WsKneuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZYYStgAKCRCPgPtYfRL+
 TkK3CACh/9LhWoUb7uG4ZFk74M/1Wv7x80WVfz/wC3medJ17C55KyYQ/zbGzeV3ZqDEs8dkKGRr
 H1kdYdtDzZ6UbfeMGe77IfZiVoG3qmk1nV6i/EAugMPQlwLXhUXnFV3TORzeXtLyW57YO1slDs8
 TnBRPg9ewko76aj9/nV+RSjsNZqjULCDuEEuTM/l9BowT+eLuFEINuiXBqBKjpSuSlbjXq0xWdF
 MWtK8hBR+9mWftaTGWNXGJjhfYw+MuIgj67jPhies0kQdC4wzpgDeZMG9Oh7fZhhVUVRoBol+cn
 xAN1YXJwjax3mT9f8wCFhZ8G61WtWZe8UShwnwTp48ztg9Ik
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, kernel@pengutronix.de,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com,
 Fabio Estevam <festevam@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [Linux-stm32] [PATCH 00/13] irqchip: Convert to platform remove
	callback returning void
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

dGhpcyBzZXJpZXMgY29udmVydHMgYWxsIGRyaXZlcnMgYmVsb3cgZHJpdmVycy9pcnFjaGlwIHRv
IHVzZQoucmVtb3ZlX25ldygpLiBTZWUgY29tbWl0IDVjNWE3NjgwZTY3YiAoInBsYXRmb3JtOiBQ
cm92aWRlIGEgcmVtb3ZlCmNhbGxiYWNrIHRoYXQgcmV0dXJucyBubyB2YWx1ZSIpIGZvciBhbiBl
eHRlbmRlZCBleHBsYW5hdGlvbiBhbmQgdGhlCmV2ZW50dWFsIGdvYWwuIFRoZSBUTDtEUjsgaXMg
dG8gbWFrZSBpdCBoYXJkZXIgZm9yIGRyaXZlciBhdXRob3JzIHRvCmxlYWsgcmVzb3VyY2VzLgoK
VGhlIGRyaXZlcnMgdG91Y2hlZCBoZXJlIGFyZSBhbGwgZmluZSB0aG91Z2ggYW5kIGRvbid0IHJl
dHVybiBlYXJseSBpbgoucmVtb3ZlKCkuIFNvIGFsbCBjb252ZXJzaW9ucyBpbiB0aGlzIHNlcmll
cyBhcmUgdHJpdmlhbC4KCkJlc3QgcmVnYXJkcwpVd2UKClV3ZSBLbGVpbmUtS8O2bmlnICgxMyk6
CiAgaXJxY2hpcC9pbWdwZGM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJl
dHVybmluZyB2b2lkCiAgaXJxY2hpcC9pbXgtaW50bXV4OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJl
bW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIGlycWNoaXAvaW14LWlycXN0ZWVyOiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIGlycWNoaXAv
a2V5c3RvbmU6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2
b2lkCiAgaXJxY2hpcC9scy1zY2ZnLW1zaTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuaW5nIHZvaWQKICBpcnFjaGlwL21hZGVyYTogQ29udmVydCB0byBwbGF0Zm9y
bSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBpcnFjaGlwL212ZWJ1LXBpYzogQ29u
dmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBpcnFjaGlw
L3BydXNzLWludGM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmlu
ZyB2b2lkCiAgaXJxY2hpcC9yZW5lc2FzLWludGMtaXJxcGluOiBDb252ZXJ0IHRvIHBsYXRmb3Jt
IHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIGlycWNoaXAvcmVuZXNhcy1pcnFjOiBD
b252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIGlycWNo
aXAvcmVuZXNhcy1yemExOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1
cm5pbmcgdm9pZAogIGlycWNoaXAvc3RtMzItZXh0aTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1v
dmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBpcnFjaGlwL3RzNDgwMDogQ29udmVydCB0byBw
bGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKCiBkcml2ZXJzL2lycWNoaXAv
aXJxLWltZ3BkYy5jICAgICAgICAgICAgICB8IDUgKystLS0KIGRyaXZlcnMvaXJxY2hpcC9pcnEt
aW14LWludG11eC5jICAgICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvaXJxY2hpcC9pcnEtaW14
LWlycXN0ZWVyLmMgICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvaXJxY2hpcC9pcnEta2V5c3Rv
bmUuYyAgICAgICAgICAgIHwgNSArKy0tLQogZHJpdmVycy9pcnFjaGlwL2lycS1scy1zY2ZnLW1z
aS5jICAgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9pcnFjaGlwL2lycS1tYWRlcmEuYyAgICAg
ICAgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9pcnFjaGlwL2lycS1tdmVidS1waWMuYyAgICAg
ICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9pcnFjaGlwL2lycS1wcnVzcy1pbnRjLmMgICAgICAg
ICAgfCA2ICsrLS0tLQogZHJpdmVycy9pcnFjaGlwL2lycS1yZW5lc2FzLWludGMtaXJxcGluLmMg
fCA1ICsrLS0tCiBkcml2ZXJzL2lycWNoaXAvaXJxLXJlbmVzYXMtaXJxYy5jICAgICAgICB8IDUg
KystLS0KIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmVuZXNhcy1yemExLmMgICAgICAgIHwgNSArKy0t
LQogZHJpdmVycy9pcnFjaGlwL2lycS1zdG0zMi1leHRpLmMgICAgICAgICAgfCA1ICsrLS0tCiBk
cml2ZXJzL2lycWNoaXAvaXJxLXRzNDgwMC5jICAgICAgICAgICAgICB8IDYgKystLS0tCiAxMyBm
aWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCA0NiBkZWxldGlvbnMoLSkKCmJhc2UtY29t
bWl0OiAzOTY3NmRmZTUyMzMxZGJhOTA5YzYxN2YyMTNmZGIyMTAxNWM4ZDEwCi0tIAoyLjQyLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
