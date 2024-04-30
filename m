Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 995F08B6BA0
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2024 09:29:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F505C71298;
	Tue, 30 Apr 2024 07:29:13 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DCEDC71294
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2024 07:29:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 267F4240005;
 Tue, 30 Apr 2024 07:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1714462144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fQD1CJTNwkZwiLmvdXIT1s+F6Ra4eUNZk70fwrI5wTU=;
 b=IjzVdc4PuCxZ+uSFw5LswCv0DEOq/AyAdyVaqT4ZupNdm6A6jlGx9Gq0D08uKlR2kn9Kgy
 fZ83fXhMV08UcaKRPWPmHDaDgeb7Aok7KTMXVGD0L7s3yIoqY4wG3K+59xvRoPxjQ5Rzfb
 887jjJH7gROIDxb1YplcAuyWmyh4Q6ZTQFrIoxneGxCXkg++0eMAnxG2EL76eq+SiDMbz2
 4JqdCkOlgFHSyJUGuLdlLoFNk8hfEdTfiSf/7ORVMZeqEvs3BBZ+YrxRHtFYUSIzx5buwc
 K0a74n9zsjVFwxJ9eTY+rQ+YjD60BECTq7wjhAVB5DXmkKXMe7Cu2+nd5r3A/g==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 30 Apr 2024 09:29:40 +0200
Message-Id: <20240430-rzn1-gmac1-v5-0-62f65a84f418@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOWdMGYC/23NzW7DIBAE4FeJOJcK1ksNPfU9ohzwenGQGoiwZ
 eVHfvcin2y5x9Hom3mLkUvkUXyf3qLwHMeYUw3m4yTo6tPAMvY1C1CAChXI8kpaDjdPWn5ZQ8G
 2rukViwruhUN8rGNnkXiSiR+TuNTmGscpl+f6Muu1/29w1lJJ0zF0YB32ln66nKffmD4p39ahG
 bbY7TBU3DryaAIEat0RNxuszQ43FftOQwBCVLo/YtxgwB3Giq0BX4+JFak9XpblD8vZmUpnAQA
 A
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
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>, 
 Serge Semin <fancer.lancer@gmail.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: devicetree@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v5 0/7] net: stmmac: Add support for
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

SGVsbG8gZXZlcnlvbmUsCgpUaGlzIGlzIHZlcnNpb24gZml2ZSBvZiBteSBzZXJpZXMgdGhhdCBh
ZGRzIHN1cHBvcnQgZm9yIGEgR2lnYWJpdCBFdGhlcm5ldApjb250cm9sbGVyIGZlYXR1cmVkIGlu
IHRoZSBSZW5lc2FzIHI5YTA2ZzAzMiBTb0MsIG9mIHRoZSBSWi9OMSBmYW1pbHkuIFRoaXMKR01B
QyBkZXZpY2UgaXMgYmFzZWQgb24gYSBTeW5vcHN5cyBJUCBhbmQgaXMgY29tcGF0aWJsZSB3aXRo
IHRoZSBzdG1tYWMgZHJpdmVyLgoKTXkgZm9ybWVyIGNvbGxlYWd1ZSBDbMOpbWVudCBMw6lnZXIg
b3JpZ2luYWxseSBzZW50IGEgc2VyaWVzIGZvciB0aGlzIGRyaXZlciwKYnV0IGFuIGlzc3VlIGlu
IGJyaW5naW5nIHVwIHRoZSBQQ1MgY2xvY2sgaGFkIGJsb2NrZWQgdGhlIHVwc3RyZWFtaW5nCnBy
b2Nlc3MuIFRoaXMgaXNzdWUgaGFzIHNpbmNlIGJlZW4gcmVzb2x2ZWQgYnkgdGhlIGZvbGxvd2lu
ZyBzZXJpZXM6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDAzMjYtcnhjX2J1Z2Zp
eC12Ni0wLTI0YTc0ZTVjNzYxZkBib290bGluLmNvbS8KClRoaXMgc2VyaWVzIGNvbnNpc3RzIG9m
IGEgZGV2aWNldHJlZSBiaW5kaW5nIGRlc2NyaWJpbmcgdGhlIFJaTjEgR01BQwpjb250cm9sbGVy
IElQLCBhIG5vZGUgZm9yIHRoZSBHTUFDMSBkZXZpY2UgaW4gdGhlIHI5YTA2ZzAzMiBTb0MgZGV2
aWNlCnRyZWUsIGFuZCB0aGUgR01BQyBkcml2ZXIgaXRzZWxmIHdoaWNoIGlzIGEgZ2x1ZSBsYXll
ciBpbiBzdG1tYWMuCgpUaGVyZSBhcmUgYWxzbyB0d28gcGF0Y2hlcyBieSBSdXNzZWxsIHRoYXQg
aW1wcm92ZSBwY3MgaW5pdGlhbGl6YXRpb24gaGFuZGxpbmcKaW4gc3RtbWFjLgoKQmVzdCBSZWdh
cmRzLAoKUm9tYWluIEdhbnRvaXMKCi0tLQpDaGFuZ2VzIGluIHY1OgotIFJlZmFjdG9yZWQgdGhl
IHN0bW1hY194cGNzX3NldHVwKCkgZnVuY3Rpb24gdG8gZ3JvdXAgdG9nZXRoZXIgWFBDUyBhbmQg
UENTCiAgc2V0dXAgbG9naWMuCi0gQWRkZWQgYSBzdG1tYWNfcGNzX2NsZWFuKCkgZnVuY3Rpb24g
YXMgYSBjb3VudGVycGFydCB0byBzdG1tYWNfcGNzX3NldHVwKCkKLSBMaW5rIHRvIHY0OiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNDI0LXJ6bjEtZ21hYzEtdjQtMC04NTJhNWYyY2Uw
YzBAYm9vdGxpbi5jb20KCkNoYW5nZXMgaW4gdjQ6Ci0gUmVtb3ZlZCB0aGUgc2Vjb25kIHBhcmFt
ZXRlcnMgb2YgdGhlIG5ldyBwY3NfaW5pdC9leGl0KCkgY2FsbGJhY2tzCi0gUmVtb3ZlZCB1bm5l
Y2Vzc2FyeSBpbnRlcnJ1cHQtcGFyZW50IHJlZmVyZW5jZSBpbiBnbWFjMSBkZXZpY2Ugbm9kZQot
IExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA0MTUtcnpuMS1nbWFj
MS12My0wLWFiMTJmMmM0NDAxZEBib290bGluLmNvbQoKQ2hhbmdlcyBpbiB2MzoKLSBGaXhlZCBh
IHR5cG8gaW4gdGhlIHNvY2ZwZ2EgcGF0Y2gKLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yLzIwMjQwNDA5LXJ6bjEtZ21hYzEtdjItMC03OWNhNDVmMmZjNzlAYm9vdGxpbi5j
b20KCkNoYW5nZXMgaW4gdjI6Ci0gQWRkIHBjc19pbml0L2V4aXQgY2FsbGJhY2tzIGluIHN0bW1h
YyB0byBzb2x2ZSByYWNlIGNvbmRpdGlvbgotIFVzZSBwY3NfaW5pdC9leGl0IGNhbGxiYWNrcyBp
biBkd21hY19zb2NmcGdhIGdsdWUgbGF5ZXIKLSBNaXNjZWxsYW5lb3VzIGRldmljZSB0cmVlIGJp
bmRpbmcgY29ycmVjdGlvbnMKLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjQwNDAyLXJ6bjEtZ21hYzEtdjEtMC01YmUyYjI4OTRkOGNAYm9vdGxpbi5jb20KCi0tLQpD
bMOpbWVudCBMw6lnZXIgKDMpOgogICAgICBkdC1iaW5kaW5nczogbmV0OiByZW5lc2FzLHJ6bjEt
Z21hYzogRG9jdW1lbnQgUlovTjEgR01BQyBzdXBwb3J0CiAgICAgIG5ldDogc3RtbWFjOiBhZGQg
c3VwcG9ydCBmb3IgUlovTjEgR01BQwogICAgICBBUk06IGR0czogcjlhMDZnMDMyOiBkZXNjcmli
ZSBHTUFDMQoKUnVzc2VsbCBLaW5nIChPcmFjbGUpICgyKToKICAgICAgbmV0OiBzdG1tYWM6IGlu
dHJvZHVjZSBwY3NfaW5pdC9wY3NfZXhpdCBzdG1tYWMgb3BlcmF0aW9ucwogICAgICBuZXQ6IHN0
bW1hYzogZHdtYWMtc29jZnBnYTogdXNlIHBjc19pbml0L3Bjc19leGl0CgpTZXJnZSBTZW1pbiAo
Mik6CiAgICAgIG5ldDogc3RtbWFjOiBBZGQgZGVkaWNhdGVkIFhQQ1MgY2xlYW51cCBtZXRob2QK
ICAgICAgbmV0OiBzdG1tYWM6IE1ha2Ugc3RtbWFjX3hwY3Nfc2V0dXAoKSBnZW5lcmljIHRvIGFs
bCBQQ1MgZGV2aWNlcwoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEt
Z21hYy55YW1sIHwgIDY2ICsrKysrKysrKysrKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICsrCiBhcmNoL2FybS9ib290L2R0cy9yZW5l
c2FzL3I5YTA2ZzAzMi5kdHNpICAgICAgICAgICB8ICAxOCArKysrCiBkcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9LY29uZmlnICAgICAgICB8ICAxMiArKysKIGRyaXZlcnMvbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL01ha2VmaWxlICAgICAgIHwgICAxICsKIGRyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJ6bjEuYyAgIHwgIDg2ICsrKysrKysr
KysrKysrKysrCiAuLi4vbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXNvY2ZwZ2Eu
YyAgICB8IDEwNyArKysrKysrKysrLS0tLS0tLS0tLS0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL3N0bW1hYy5oICAgICAgIHwgICAzICstCiBkcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jICB8ICAxNCArLS0KIGRyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tZGlvLmMgIHwgIDQ4ICsrKysrKy0tLQogaW5j
bHVkZS9saW51eC9zdG1tYWMuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwog
MTEgZmlsZXMgY2hhbmdlZCwgMjg3IGluc2VydGlvbnMoKyksIDc2IGRlbGV0aW9ucygtKQotLS0K
YmFzZS1jb21taXQ6IGRkMTk0MWY4MDFiYzk1OGQyZWUxM2Y1YmU4YjM4ZGI2YjAzNGI4MDYKY2hh
bmdlLWlkOiAyMDI0MDQwMi1yem4xLWdtYWMxLTY4NWNmODc5M2QwZQoKQmVzdCByZWdhcmRzLAot
LSAKUm9tYWluIEdhbnRvaXMgPHJvbWFpbi5nYW50b2lzQGJvb3RsaW4uY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
