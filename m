Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F47581F213
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Dec 2023 22:03:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6553AC6B47E;
	Wed, 27 Dec 2023 21:03:12 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F15D9C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Dec 2023 21:03:10 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rIb3M-0000le-3j; Wed, 27 Dec 2023 22:03:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rIb3H-001wEi-AR; Wed, 27 Dec 2023 22:02:56 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ukl@pengutronix.de>) id 1rIb3I-001ZVE-0o;
 Wed, 27 Dec 2023 22:02:56 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 27 Dec 2023 22:02:28 +0100
Message-ID: <cover.1703710628.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2241;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=TnloZYpKIYRmaOM4Vyp6tR8nMUztNxQOKpyjV0rpvQ4=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBljJDlF5RcQbsMo+jn9Hk4Fn0DGB3DTp1LZRoam
 4uXEKKoj2GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZYyQ5QAKCRCPgPtYfRL+
 TmefCACxCqozxo0GnqWmhu00tf7kElJNTysNznKKdidgf7fo9mcsJuA7Ck125Ja84llYdplJCvv
 Dsdgd+ignUqSSvOgP0rhHT1pxzc3t9CgKIvLUZMIwaiFUxnPuGs0iLILF0hhUoUb6JLwyAFJw/W
 pPtgJ/owxsaEcqXJEcIL+CMDaCWvE8mUTxuY4pmJCm6WMPBEM3f8affobB2FMtJ7qI2crJx7ojl
 xgvXdsuX9EtOecBbxd/N706v8sAbPO2cSehuoXojKHPV81zg+QhoTYPjdqW75nODS26hacjnboO
 xL/0decenMphAvdsq/GieTqJqbXlITNBQapQQbyLQwxG+KFY
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: [Linux-stm32] [PATCH 00/12] mailbox: Convert to platform remove
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

SGVsbG8sCgp0aGlzIHNlcmllcyBjb252ZXJ0cyBhbGwgcGxhdGZvcm0gZHJpdmVycyBiZWxvdyBk
cml2ZXJzL21haWxib3ggdGhhdAptYWtlIHVzZSBvZiAucmVtb3ZlKCkgdG8gdXNlIC5yZW1vdmVf
bmV3KCkgaW5zdGVhZC4KClNlZSBjb21taXQgNWM1YTc2ODBlNjdiICgicGxhdGZvcm06IFByb3Zp
ZGUgYSByZW1vdmUgY2FsbGJhY2sgdGhhdApyZXR1cm5zIG5vIHZhbHVlIikgZm9yIGFuIGV4dGVu
ZGVkIGV4cGxhbmF0aW9uIGFuZCB0aGUgZXZlbnR1YWwgZ29hbC4KVGhlIFRMO0RSOyBpcyB0byBt
YWtlIGl0IGhhcmRlciBmb3IgZHJpdmVyIGF1dGhvcnMgdG8gbGVhayByZXNvdXJjZXMKd2l0aG91
dCBub3RpY2luZy4gVGhlIGRyaXZlcnMgaGVyZSBnZXQgaXQgcmlnaHQgdGhvdWdoIGFuZCBzbyBj
YW4gYmUKY29udmVydGVkIHRyaXZpYWxseS4KClRoaXMgaXMgbWVyZ2Ugd2luZG93IG1hdGVyaWFs
LiBBbGwgcGF0Y2hlcyBhcmUgcGFpcndpc2UgaW5kZXBlbmRlbnQsIHNvCnRoZXkgY2FuIGJlIGFw
cGxpZWQgaW5kaXZpZHVhbGx5LgoKQmVzdCByZWdhcmRzClV3ZQoKVXdlIEtsZWluZS1Lw7ZuaWcg
KDEyKToKICBtYWlsYm94OiBiY20tZmxleHJtOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBj
YWxsYmFjayByZXR1cm5pbmcgdm9pZAogIG1haWxib3g6IGJjbS1wZGM6IENvbnZlcnQgdG8gcGxh
dGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgbWFpbGJveDogaW14OiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIG1haWxib3g6
IG1haWxib3gtdGVzdDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJu
aW5nIHZvaWQKICBtYWlsYm94OiBtdGstY21kcTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUg
Y2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBtYWlsYm94OiBvbWFwOiBDb252ZXJ0IHRvIHBsYXRm
b3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIG1haWxib3g6IHFjb20tYXBjcy1p
cGM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAg
bWFpbGJveDogcWNvbS1pcGNjOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayBy
ZXR1cm5pbmcgdm9pZAogIG1haWxib3g6IHN0bTMyLWlwY2M6IENvbnZlcnQgdG8gcGxhdGZvcm0g
cmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgbWFpbGJveDogc3VuNmktbXNnYm94OiBD
b252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIG1haWxi
b3g6IHRlZ3JhLWhzcDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJu
aW5nIHZvaWQKICBtYWlsYm94OiB6eW5xbXAtaXBpOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92
ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAoKIGRyaXZlcnMvbWFpbGJveC9iY20tZmxleHJtLW1h
aWxib3guYyAgICB8IDYgKystLS0tCiBkcml2ZXJzL21haWxib3gvYmNtLXBkYy1tYWlsYm94LmMg
ICAgICAgfCA1ICsrLS0tCiBkcml2ZXJzL21haWxib3gvaW14LW1haWxib3guYyAgICAgICAgICAg
fCA2ICsrLS0tLQogZHJpdmVycy9tYWlsYm94L21haWxib3gtdGVzdC5jICAgICAgICAgIHwgNiAr
Ky0tLS0KIGRyaXZlcnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMgICAgICB8IDUgKystLS0K
IGRyaXZlcnMvbWFpbGJveC9vbWFwLW1haWxib3guYyAgICAgICAgICB8IDYgKystLS0tCiBkcml2
ZXJzL21haWxib3gvcWNvbS1hcGNzLWlwYy1tYWlsYm94LmMgfCA2ICsrLS0tLQogZHJpdmVycy9t
YWlsYm94L3Fjb20taXBjYy5jICAgICAgICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvbWFpbGJv
eC9zdG0zMi1pcGNjLmMgICAgICAgICAgICB8IDYgKystLS0tCiBkcml2ZXJzL21haWxib3gvc3Vu
NmktbXNnYm94LmMgICAgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9tYWlsYm94L3RlZ3JhLWhz
cC5jICAgICAgICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvbWFpbGJveC96eW5xbXAtaXBpLW1h
aWxib3guYyAgICB8IDYgKystLS0tCiAxMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCsp
LCA0NiBkZWxldGlvbnMoLSkKCmJhc2UtY29tbWl0OiAzOTY3NmRmZTUyMzMxZGJhOTA5YzYxN2Yy
MTNmZGIyMTAxNWM4ZDEwCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
