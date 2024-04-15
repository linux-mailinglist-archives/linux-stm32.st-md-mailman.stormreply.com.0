Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB658A4B34
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Apr 2024 11:18:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5D3CC6B444;
	Mon, 15 Apr 2024 09:18:08 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55163C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 09:18:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46EBCC000D;
 Mon, 15 Apr 2024 09:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1713172687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eCigKqN4ZXuHAYp92YPMCsXR7qfiMRuuveYHe/CK+2c=;
 b=OQ8hiKdqSSbmmEj6NjpkJX7Vn0on02LMlhLvbW3F4WfEAQTJWElox9WK50sPGuWsIWTyWG
 rqYg+aS5sy4EQgcRiOEPn/VI7rCl/fVImaCeF5MuMFIxHGBEjmYlqKq6Y9LAJHfSOdaEtA
 KCkKEoJbs2nnij2JoGRgAyDIDUff4qkk1PfQi4sWjWqLXqKetM8dCFrDKj91RksZNc/he+
 bj8akanG+yTuO/syaLY0DFlUGo60m++6H7IiaM6Z3E9YzsRX52DZjx0e3RmruVLn37d08A
 F/6ySdW4/ubj1ypWs9yv5XqInqzANk0oUKQbpZBg8jMvXjm6QdZePGbkKMm3PA==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 15 Apr 2024 11:18:40 +0200
Message-Id: <20240415-rzn1-gmac1-v3-0-ab12f2c4401d@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPHwHGYC/22NQQ6DIBQFr2L+ujSIWKGr3qPpQvGjJBUaIMTWe
 PcSVjXpcvIy8zYI6A0GuFYbeEwmGGczNKcK1NzbCYkZMwOjjFNOGfEfW5Np6VVNLqJVWnSyGSl
 CFl4etVlL7A4WI7G4RnjkZTYhOv8uL6ku+79gqgkl7YBsYELyUajb4Fx8GntWbimhxH5leZBZl
 jupet5qplUnj/K+71/j/dum7QAAAA==
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: devicetree@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 0/5] net: stmmac: Add support for
 RZN1 GMAC devices
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

SGVsbG8gZXZlcnlvbmUsCgpUaGlzIGlzIHZlcnNpb24gdGhyZWUgb2YgbXkgc2VyaWVzIHRoYXQg
YWRkcyBzdXBwb3J0IGZvciBhIEdpZ2FiaXQgRXRoZXJuZXQKY29udHJvbGxlciBmZWF0dXJlZCBp
biB0aGUgUmVuZXNhcyByOWEwNmcwMzIgU29DLCBvZiB0aGUgUlovTjEgZmFtaWx5LiBUaGlzCkdN
QUMgZGV2aWNlIGlzIGJhc2VkIG9uIGEgU3lub3BzeXMgSVAgYW5kIGlzIGNvbXBhdGlibGUgd2l0
aCB0aGUgc3RtbWFjIGRyaXZlci4KCk15IGZvcm1lciBjb2xsZWFndWUgQ2zDqW1lbnQgTMOpZ2Vy
IG9yaWdpbmFsbHkgc2VudCBhIHNlcmllcyBmb3IgdGhpcyBkcml2ZXIsCmJ1dCBhbiBpc3N1ZSBp
biBicmluZ2luZyB1cCB0aGUgUENTIGNsb2NrIGhhZCBibG9ja2VkIHRoZSB1cHN0cmVhbWluZwpw
cm9jZXNzLiBUaGlzIGlzc3VlIGhhcyBzaW5jZSBiZWVuIHJlc29sdmVkIGJ5IHRoZSBmb2xsb3dp
bmcgc2VyaWVzOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwMzI2LXJ4Y19idWdm
aXgtdjYtMC0yNGE3NGU1Yzc2MWZAYm9vdGxpbi5jb20vCgpUaGlzIHNlcmllcyBjb25zaXN0cyBv
ZiBhIGRldmljZXRyZWUgYmluZGluZyBkZXNjcmliaW5nIHRoZSBSWk4xIEdNQUMKY29udHJvbGxl
ciBJUCwgYSBub2RlIGZvciB0aGUgR01BQzEgZGV2aWNlIGluIHRoZSByOWEwNmcwMzIgU29DIGRl
dmljZQp0cmVlLCBhbmQgdGhlIEdNQUMgZHJpdmVyIGl0c2VsZiB3aGljaCBpcyBhIGdsdWUgbGF5
ZXIgaW4gc3RtbWFjLgoKVGhlcmUgYXJlIGFsc28gdHdvIHBhdGNoZXMgYnkgUnVzc2VsbCB0aGF0
IGltcHJvdmUgcGNzIGluaXRpYWxpemF0aW9uIGhhbmRsaW5nCmluIHN0bW1hYy4KCkJlc3QgUmVn
YXJkcywKClJvbWFpbiBHYW50b2lzCgotLS0KQ2hhbmdlcyBpbiB2MzoKLSBGaXhlZCBhIHR5cG8g
aW4gdGhlIHNvY2ZwZ2EgcGF0Y2gKLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjQwNDA5LXJ6bjEtZ21hYzEtdjItMC03OWNhNDVmMmZjNzlAYm9vdGxpbi5jb20KCkNo
YW5nZXMgaW4gdjI6Ci0gQWRkIHBjc19pbml0L2V4aXQgY2FsbGJhY2tzIGluIHN0bW1hYyB0byBz
b2x2ZSByYWNlIGNvbmRpdGlvbgotIFVzZSBwY3NfaW5pdC9leGl0IGNhbGxiYWNrcyBpbiBkd21h
Y19zb2NmcGdhIGdsdWUgbGF5ZXIKLSBNaXNjZWxsYW5lb3VzIGRldmljZSB0cmVlIGJpbmRpbmcg
Y29ycmVjdGlvbnMKLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQw
NDAyLXJ6bjEtZ21hYzEtdjEtMC01YmUyYjI4OTRkOGNAYm9vdGxpbi5jb20KCi0tLQpDbMOpbWVu
dCBMw6lnZXIgKDMpOgogICAgICBkdC1iaW5kaW5nczogbmV0OiByZW5lc2FzLHJ6bjEtZ21hYzog
RG9jdW1lbnQgUlovTjEgR01BQyBzdXBwb3J0CiAgICAgIG5ldDogc3RtbWFjOiBhZGQgc3VwcG9y
dCBmb3IgUlovTjEgR01BQwogICAgICBBUk06IGR0czogcjlhMDZnMDMyOiBkZXNjcmliZSBHTUFD
MQoKUnVzc2VsbCBLaW5nIChPcmFjbGUpICgyKToKICAgICAgbmV0OiBzdG1tYWM6IGludHJvZHVj
ZSBwY3NfaW5pdC9wY3NfZXhpdCBzdG1tYWMgb3BlcmF0aW9ucwogICAgICBuZXQ6IHN0bW1hYzog
ZHdtYWMtc29jZnBnYTogdXNlIHBjc19pbml0L3Bjc19leGl0CgogLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbmV0L3JlbmVzYXMscnpuMS1nbWFjLnlhbWwgfCAgNjYgKysrKysrKysrKysrKwogTUFJ
TlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKysK
IGFyY2gvYXJtL2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDZnMDMyLmR0c2kgICAgICAgICAgIHwgIDE5
ICsrKysKIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL0tjb25maWcgICAgICAg
IHwgIDEyICsrKwogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvTWFrZWZpbGUg
ICAgICAgfCAgIDEgKwogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMt
cnpuMS5jICAgfCAgODggKysrKysrKysrKysrKysrKysKIC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvZHdtYWMtc29jZnBnYS5jICAgIHwgMTA5ICsrKysrKysrKysrLS0tLS0tLS0tLQog
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyAgfCAgMTQg
KysrCiBpbmNsdWRlL2xpbnV4L3N0bW1hYy5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgMiArCiA5IGZpbGVzIGNoYW5nZWQsIDI2MyBpbnNlcnRpb25zKCspLCA1NCBkZWxldGlvbnMo
LSkKLS0tCmJhc2UtY29tbWl0OiBmMWUxOTdhNjY1YzIxNDhlYmMyNWZlMDljNTM2ODllNjBhZmVh
MTk1CmNoYW5nZS1pZDogMjAyNDA0MDItcnpuMS1nbWFjMS02ODVjZjg3OTNkMGUKCkJlc3QgcmVn
YXJkcywKLS0gClJvbWFpbiBHYW50b2lzIDxyb21haW4uZ2FudG9pc0Bib290bGluLmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
