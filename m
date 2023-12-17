Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2F4815FB9
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Dec 2023 15:30:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 422AAC6DD6E;
	Sun, 17 Dec 2023 14:30:22 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F1D7C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Dec 2023 14:30:21 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rEs9f-0006VJ-OC; Sun, 17 Dec 2023 15:30:07 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rEs9b-00GUh4-VU; Sun, 17 Dec 2023 15:30:03 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rEs9b-004hyq-J9; Sun, 17 Dec 2023 15:30:03 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 17 Dec 2023 15:29:26 +0100
Message-ID: <cover.1702822744.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2631;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=FyuyHaIj5jd4bPxOXQjJ+ozo7s7sihGMLWkkNmVGnME=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlfwXFp0yrTZyYp2KFK2fwTyu80UmXy69MORJAs
 wm48iAIgimJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZX8FxQAKCRCPgPtYfRL+
 TgNJB/9eFZpgOAoyZMQMzWGucpEqIvWX6W0eNcnXBmurNkaFQmk9v1UHmj1xyNFW24mvDrwXPRz
 PaBLdyRO1QyT7ZOOWdkxvvYU+/g6yBUmpw+P5lihn0tefw+vl6Ej1suMnbs2tMdJ0FTQYQZRyQL
 ZnZyl3AYPprWtaCsKyu9b4pRwdQGJ4KG1NnvRkE562N+Wg7eXkwU5ah9EQWW4t+Jcs6SgvZHMhp
 1quJkD1SA//uBFFZXLUV5UysntvLZwazuV3zLV81y6r02+H5X8Y3mcj7mX2qPf8Ubh9GWDrcybC
 h8kJTYL4+I5P2Hh+7xPkiTW8Rt32gZGaprL2X8zZ8V/x9QkC
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Tony Lindgren <tony@atomide.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 linux-samsung-soc@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Sumit Gupta <sumitg@nvidia.com>,
 Nick Alcock <nick.alcock@oracle.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pm@vger.kernel.org,
 Roger Quadros <rogerq@kernel.org>, linux-mediatek@lists.infradead.org,
 Markus Mayer <mmayer@broadcom.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 Yong Wu <yong.wu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Lukasz Luba <lukasz.luba@arm.com>
Subject: [Linux-stm32] [PATCH 00/15] memory: Convert to platform remove
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

SGVsbG8sCgp0aGlzIHNlcmllcyBjb252ZXJ0cyB0aGUgcGxhdGZvcm0gZHJpdmVycyBiZWxvdyBk
cml2ZXJzL21lbW9yeSB0byBtYWtlCnVzZSBvZiAucmVtb3ZlX25ldy4gU2VlIGNvbW1pdCA1YzVh
NzY4MGU2N2IgKCJwbGF0Zm9ybTogUHJvdmlkZSBhIHJlbW92ZQpjYWxsYmFjayB0aGF0IHJldHVy
bnMgbm8gdmFsdWUiKSBmb3IgYW4gZXh0ZW5kZWQgZXhwbGFuYXRpb24gYW5kIHRoZQpldmVudHVh
bCBnb2FsLiBUaGUgVEw7RFI7IGlzIHRvIG1ha2UgaXQgaGFyZGVyIGZvciBkcml2ZXIgYXV0aG9y
cyB0bwpsZWFrIHJlc291cmNlcyB3aXRob3V0IG5vdGljaW5nLgoKVGhpcyBpcyBtZXJnZSB3aW5k
b3cgbWF0ZXJpYWwuIEFsbCBwYXRjaGVzIGFyZSBwYWlyd2lzZSBpbmRlcGVuZGVudCBvZgplYWNo
IG90aGVyIHNvIHRoZXkgY2FuIGJlIGFwcGxpZWQgaW5kaXZpZHVhbGx5LiBTdGlsbCBpdCB3b3Vs
ZCBiZSBncmVhdAp0byBsZXQgdGhlbSBnbyBpbiBhbGwgdG9nZXRoZXIuCgpCZXN0IHJlZ2FyZHMK
VXdlCgpVd2UgS2xlaW5lLUvDtm5pZyAoMTUpOgogIG1lbW9yeTogYnJjbXN0Yl9kcGZlOiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIG1lbW9yeTog
YnJjbXN0Yl9tZW1jOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5p
bmcgdm9pZAogIG1lbW9yeTogZW1pZjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJh
Y2sgcmV0dXJuaW5nIHZvaWQKICBtZW1vcnk6IGZzbC1jb3JlbmV0LWNmOiBDb252ZXJ0IHRvIHBs
YXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIG1lbW9yeTogZnNsX2lmYzog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBtZW1v
cnk6IGp6NDc4MC1uZW1jOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1
cm5pbmcgdm9pZAogIG1lbW9yeTogbXRrLXNtaTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUg
Y2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBtZW1vcnk6IG9tYXAtZ3BtYzogQ29udmVydCB0byBw
bGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBtZW1vcnk6IHJlbmVzYXMt
cnBjLWlmOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9p
ZAogIG1lbW9yeTogZXh5bm9zNTQyMi1kbWM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNh
bGxiYWNrIHJldHVybmluZyB2b2lkCiAgbWVtb3J5OiBzdG0zMi1mbWMyLWViaTogQ29udmVydCB0
byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBtZW1vcnk6IHRlZ3Jh
MTg2LWVtYzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZv
aWQKICBtZW1vcnk6IHRlZ3JhMjEwLWVtYzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuaW5nIHZvaWQKICBtZW1vcnk6IHRpLWFlbWlmOiBDb252ZXJ0IHRvIHBsYXRm
b3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIG1lbW9yeTogdGktZW1pZi1wbTog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKCiBkcml2
ZXJzL21lbW9yeS9icmNtc3RiX2RwZmUuYyAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJz
L21lbW9yeS9icmNtc3RiX21lbWMuYyAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL21l
bW9yeS9lbWlmLmMgICAgICAgICAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL21lbW9y
eS9mc2wtY29yZW5ldC1jZi5jICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL21lbW9yeS9m
c2xfaWZjLmMgICAgICAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL21lbW9yeS9qejQ3
ODAtbmVtYy5jICAgICAgICAgICAgIHwgIDUgKystLS0KIGRyaXZlcnMvbWVtb3J5L210ay1zbWku
YyAgICAgICAgICAgICAgICAgfCAxMCArKysrLS0tLS0tCiBkcml2ZXJzL21lbW9yeS9vbWFwLWdw
bWMuYyAgICAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL21lbW9yeS9yZW5lc2FzLXJw
Yy1pZi5jICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL21lbW9yeS9zYW1zdW5nL2V4eW5v
czU0MjItZG1jLmMgIHwgIDYgKystLS0tCiBkcml2ZXJzL21lbW9yeS9zdG0zMi1mbWMyLWViaS5j
ICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTE4Ni1lbWMu
YyAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTIxMC1lbWMtY29y
ZS5jIHwgIDYgKystLS0tCiBkcml2ZXJzL21lbW9yeS90aS1hZW1pZi5jICAgICAgICAgICAgICAg
IHwgIDUgKystLS0KIGRyaXZlcnMvbWVtb3J5L3RpLWVtaWYtcG0uYyAgICAgICAgICAgICAgfCAg
NiArKy0tLS0KIDE1IGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDYwIGRlbGV0aW9u
cygtKQoKYmFzZS1jb21taXQ6IDE3Y2I4YTIwYmRlNjZhNTIwYTJjYTdhYWQxMDYzZTFjZTczODIy
NDAKLS0gCjIuNDIuMApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
