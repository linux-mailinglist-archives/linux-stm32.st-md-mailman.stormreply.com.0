Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CED49BE193
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2024 10:03:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 133F4C78038;
	Wed,  6 Nov 2024 09:03:43 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2DE2C78021
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2024 09:03:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79A17C000A;
 Wed,  6 Nov 2024 09:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1730883815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=weAShtrkUjDQdfMxGlmfAtR3B6mS0OXtPZsSWC+b/z4=;
 b=ldkTn1WoOO9SvTFEUWcjuPQCtXxvyw7jTELOwmzgwIdIz66jwYiqHFVPL2tex2nHynBJUk
 nufYR2gX8SJ5mL0WfDURhYbIRWUCCW0u28jEUZ7pwoJ0G3Rb7E63oS8k0uxz3H3vqiNEgE
 uxzE9lkzJ1LvoiZNlqqTmBtD99o6T/5TtXKBeS+Y2fe9hc+CAbkJccXVkKxQl+QO6ecdn5
 lW6wEUVnxZyvC98yDVn9/WuwHn/puJxD23ikNPCN99dlfmGWuDxK/mLcpmAa3Y07Szl09v
 idOND9U472puCw6guVr0XxQcvbu6zloJqyxqTTujTlvv3ECNw8eXY6QEzt4lQg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Date: Wed,  6 Nov 2024 10:03:21 +0100
Message-ID: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 0/9] Support external snapshots on
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

SGksCgpUaGlzIFYzIGlzIGp1c3QgYSByZWJhc2UgYSBWMiBvbiB0b3Agb2YgbmV0LW5leHQgdG8g
YWRkcmVzcyBzb21lIG1pbm9yCmNvbmZsaWN0cy4gTm8gY2hhbmdlcyB3ZXJlIG1hZGUuCgpUaGlz
IHNlcmllcyBpcyBhbm90aGVyIHRha2Ugb24gdGhlIHBlcnZpb3VzIHdvcmsgWzFdIGRvbmUgYnkK
QWxleGlzIExvdGhvcsOpLCB0aGF0IGZpeGVzIHRoZSBzdXBwb3J0IGZvciBleHRlcm5hbCBzbmFw
c2hvdHMKdGltZXN0YW1waW5nIGluIEdNQUMzLWJhc2VkIGRldmljZXMuCgpEZXRhaWxzIG9uIHdo
eSB0aGlzIGlzIG5lZWRlZCBhcmUgbWVudGlvbm5lZCBvbiB0aGUgY292ZXIgWzJdIGZyb20gVjEu
CgpUaGlzIFYyIGFkZHJlc3NlcyBtdWx0aXBsZSBpc3N1ZXMgZm91bmQgaW4gVjEgOgoKIC0gVGhl
IFBUUF9UQ1IgcmVnaXN0ZXIgaXMgY29uZmlndXJlZCBmcm9tIG11bHRpcGxlIHBsYWNlcywgYXMg
cmVwb3J0ZWQKICAgYnkgQWxleGlzLCBzbyB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBl
eHR0cyBjb25maWd1cmF0aW9uCiAgIGRvZXNuJ3QgaW50ZXJmZXJlIHdpdGggdGhlIGh3dHN0YW1w
IGNvbmZpZ3VyYXRpb24uCgogLSBUaGUgaW50ZXJydXB0IG1hbmFnZW1lbnQgaW4gVjEgd2FzIGlu
Y29tcGxldGUsIGFzIHRoZSBpbnRlcnJ1cHQKICAgd2Fzbid0IGNvcnJlY3RseSBhY2tlZC4KCiAt
IFRoaXMgc2VyaWVzIGFsc28gbWFrZXMgc28gdGhhdCB3ZSBvbmx5IGVuYWJsZSB0aGUgZXh0dHMg
aW50ZXJydXB0CiAgIHdoZW4gbmVjZXNzYXJ5LgoKWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9uZXRkZXYvMjAyMzA2MTYxMDA0MDkuMTY0NTgzLTEtYWxleGlzLmxvdGhvcmVAYm9vdGxpbi5j
b20vClsyXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjQxMDI5MTE1NDE5LjEx
NjAyMDEtMS1tYXhpbWUuY2hldmFsbGllckBib290bGluLmNvbS8KClRoYW5rcyBBbGV4aXMgZm9y
IGxheWluZyB0aGUgZ3JvdW5kd29yayBmb3IgdGhpcywKCkJlc3QgcmVnYXJkcywKCk1heGltZQoK
TGluayB0byBWMTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjQxMDI5MTE1NDE5
LjExNjAyMDEtMS1tYXhpbWUuY2hldmFsbGllckBib290bGluLmNvbS8KTGluayB0byBWMjogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjQxMTA0MTcwMjUxLjIyMDIyNzAtMS1tYXhp
bWUuY2hldmFsbGllckBib290bGluLmNvbS8KCk1heGltZSBDaGV2YWxsaWVyICg5KToKICBuZXQ6
IHN0bW1hYzogRG9uJ3QgbW9kaWZ5IHRoZSBnbG9iYWwgcHRwIG9wcyBkaXJlY3RseQogIG5ldDog
c3RtbWFjOiBVc2UgcGVyLWh3IHB0cCBjbG9jayBvcHMKICBuZXQ6IHN0bW1hYzogT25seSB1cGRh
dGUgdGhlIGF1dG8tZGlzY292ZXJlZCBQVFAgY2xvY2sgZmVhdHVyZXMKICBuZXQ6IHN0bW1hYzog
SW50cm9kdWNlIGR3bWFjMTAwMCBwdHBfY2xvY2tfaW5mbyBhbmQgb3BlcmF0aW9ucwogIG5ldDog
c3RtbWFjOiBJbnRyb2R1Y2UgZHdtYWMxMDAwIHRpbWVzdGFtcGluZyBvcGVyYXRpb25zCiAgbmV0
OiBzdG1tYWM6IEVuYWJsZSB0aW1lc3RhbXBpbmcgaW50ZXJydXB0IG9uIGR3bWFjMTAwMAogIG5l
dDogc3RtbWFjOiBEb24ndCBpbmNsdWRlIGR3bWFjNCBkZWZpbml0aW9ucyBpbiBzdG1tYWNfcHRw
CiAgbmV0OiBzdG1tYWM6IENvbmZpZ3VyZSBvbmx5IHRoZSByZWxldmFudCBiaXRzIGZvciB0aW1l
c3RhbXBpbmcgc2V0dXAKICBuZXQ6IHN0bW1hYzogZHdtYWNfc29jZnBnYTogVGhpcyBwbGF0Zm9y
bSBoYXMgR01BQwoKIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2NvbW1vbi5o
ICB8ICAgNCArCiAuLi4vZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc29jZnBnYS5jICAg
fCAgIDEgKwogLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYzEwMDAuaCAgIHwg
IDEyICsrKwogLi4uL2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjMTAwMF9jb3JlLmMgIHwg
MTAxICsrKysrKysrKysrKysrKysrKwogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvaHdpZi5jICAgIHwgIDE1ICsrLQogLi4uL2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1h
Y19od3RzdGFtcC5jIHwgIDI2ICsrKystCiAuLi4vbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L3N0bW1hY19wdHAuYyAgfCAgMzggKysrKystLQogLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9zdG1tYWNfcHRwLmggIHwgIDEwICsrCiA4IGZpbGVzIGNoYW5nZWQsIDE5NiBpbnNlcnRp
b25zKCspLCAxMSBkZWxldGlvbnMoLSkKCi0tIAoyLjQ3LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
