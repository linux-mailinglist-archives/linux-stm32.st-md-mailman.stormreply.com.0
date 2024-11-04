Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 794ED9BBAED
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:03:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B692C71287;
	Mon,  4 Nov 2024 17:03:03 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF136C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Nov 2024 17:02:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F00EE60005;
 Mon,  4 Nov 2024 17:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730739775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=oI5s8asFDWE8LgW78P2vcd6xNJ1YtBMsqU066l+ZeeQ=;
 b=L1WCxFcACUgATE0tjjEcTfaN33vuYwaz+WIrUnD5/83xyUJMVJiiyB7T/3nRmy9hOVxJ9B
 hVo1p8HAmVCdN6DRXx/EDJ1s9G+aTazR3Us24cKKrUsndash/oD28BRxLPslTIBglFL78p
 pk/Pr4sBRU07vYMX8orosVcWpBCfowNfyeLVrN88s6Mk39d2ka/lDkNQDWvYnodP2JlTIu
 IN4c+TMmuAH0Lr/tUzdrCwKdJVA0zFfnTojebSCnxGYi01DT/k0+TyRBtzokMkRZW0WZjt
 u+138GZMj6GP4WFGAdN3NqkdSZPDzgkUYErLjFsa8TWfu33HC8w8T/fGbP6KIA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Date: Mon,  4 Nov 2024 18:02:40 +0100
Message-ID: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/9] Support external snapshots on
	dwmac1000
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

SGksCgpUaGlzIHNlcmllcyBpcyBhbm90aGVyIHRha2Ugb24gdGhlIHBlcnZpb3VzIHdvcmsgWzFd
IGRvbmUgYnkKQWxleGlzIExvdGhvcsOpLCB0aGF0IGZpeGVzIHRoZSBzdXBwb3J0IGZvciBleHRl
cm5hbCBzbmFwc2hvdHMKdGltZXN0YW1waW5nIGluIEdNQUMzLWJhc2VkIGRldmljZXMuCgpEZXRh
aWxzIG9uIHdoeSB0aGlzIGlzIG5lZWRlZCBhcmUgbWVudGlvbm5lZCBvbiB0aGUgY292ZXIgWzJd
IGZyb20gVjEuCgpUaGlzIFYyIGFkZHJlc3NlcyBtdWx0aXBsZSBpc3N1ZXMgZm91bmQgaW4gVjEg
OgoKIC0gVGhlIFBUUF9UQ1IgcmVnaXN0ZXIgaXMgY29uZmlndXJlZCBmcm9tIG11bHRpcGxlIHBs
YWNlcywgYXMgcmVwb3J0ZWQKICAgYnkgQWxleGlzLCBzbyB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB0
aGF0IHRoZSBleHR0cyBjb25maWd1cmF0aW9uCiAgIGRvZXNuJ3QgaW50ZXJmZXJlIHdpdGggdGhl
IGh3dHN0YW1wIGNvbmZpZ3VyYXRpb24uCgogLSBUaGUgaW50ZXJydXB0IG1hbmFnZW1lbnQgaW4g
VjEgd2FzIGluY29tcGxldGUsIGFzIHRoZSBpbnRlcnJ1cHQKICAgd2Fzbid0IGNvcnJlY3RseSBh
Y2tlZC4KCiAtIFRoaXMgc2VyaWVzIGFsc28gbWFrZXMgc28gdGhhdCB3ZSBvbmx5IGVuYWJsZSB0
aGUgZXh0dHMgaW50ZXJydXB0CiAgIHdoZW4gbmVjZXNzYXJ5LgoKWzFdOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9uZXRkZXYvMjAyMzA2MTYxMDA0MDkuMTY0NTgzLTEtYWxleGlzLmxvdGhvcmVA
Ym9vdGxpbi5jb20vClsyXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjQxMDI5
MTE1NDE5LjExNjAyMDEtMS1tYXhpbWUuY2hldmFsbGllckBib290bGluLmNvbS8KClRoYW5rcyBB
bGV4aXMgZm9yIGxheWluZyB0aGUgZ3JvdW5kd29yayBmb3IgdGhpcywKCkJlc3QgcmVnYXJkcywK
Ck1heGltZQoKTGluayB0byBWMTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjQx
MDI5MTE1NDE5LjExNjAyMDEtMS1tYXhpbWUuY2hldmFsbGllckBib290bGluLmNvbS8KCk1heGlt
ZSBDaGV2YWxsaWVyICg5KToKICBuZXQ6IHN0bW1hYzogRG9uJ3QgbW9kaWZ5IHRoZSBnbG9iYWwg
cHRwIG9wcyBkaXJlY3RseQogIG5ldDogc3RtbWFjOiBVc2UgcGVyLWh3IHB0cCBjbG9jayBvcHMK
ICBuZXQ6IHN0bW1hYzogT25seSB1cGRhdGUgdGhlIGF1dG8tZGlzY292ZXJlZCBQVFAgY2xvY2sg
ZmVhdHVyZXMKICBuZXQ6IHN0bW1hYzogSW50cm9kdWNlIGR3bWFjMTAwMCBwdHBfY2xvY2tfaW5m
byBhbmQgb3BlcmF0aW9ucwogIG5ldDogc3RtbWFjOiBJbnRyb2R1Y2UgZHdtYWMxMDAwIHRpbWVz
dGFtcGluZyBvcGVyYXRpb25zCiAgbmV0OiBzdG1tYWM6IEVuYWJsZSB0aW1lc3RhbXBpbmcgaW50
ZXJydXB0IG9uIGR3bWFjMTAwMAogIG5ldDogc3RtbWFjOiBEb24ndCBpbmNsdWRlIGR3bWFjNCBk
ZWZpbml0aW9ucyBpbiBzdG1tYWNfcHRwCiAgbmV0OiBzdG1tYWM6IENvbmZpZ3VyZSBvbmx5IHRo
ZSByZWxldmFudCBiaXRzIGZvciB0aW1lc3RhbXBpbmcgc2V0dXAKICBuZXQ6IHN0bW1hYzogZHdt
YWNfc29jZnBnYTogVGhpcyBwbGF0Zm9ybSBoYXMgR01BQwoKIGRyaXZlcnMvbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL2NvbW1vbi5oICB8ICAgNCArCiAuLi4vZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvZHdtYWMtc29jZnBnYS5jICAgfCAgIDEgKwogLi4uL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9kd21hYzEwMDAuaCAgIHwgIDEyICsrKwogLi4uL2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL2R3bWFjMTAwMF9jb3JlLmMgIHwgMTAxICsrKysrKysrKysrKysrKysrKwogZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvaHdpZi5jICAgIHwgIDE1ICsrLQogLi4uL2V0aGVy
bmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19od3RzdGFtcC5jIHwgIDI2ICsrKystCiAuLi4vbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19wdHAuYyAgfCAgMzggKysrKystLQogLi4u
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfcHRwLmggIHwgIDEwICsrCiA4IGZp
bGVzIGNoYW5nZWQsIDE5NiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCi0tIAoyLjQ3
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
