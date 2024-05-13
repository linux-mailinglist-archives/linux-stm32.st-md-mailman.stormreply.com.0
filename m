Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C168C3BE1
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2024 09:24:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2675BC6DD6B;
	Mon, 13 May 2024 07:24:47 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CC3BC6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 07:24:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 788902000E;
 Mon, 13 May 2024 07:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715585078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l7briKDXZUlZ4ihbmAD3jDG5eaCQTlrkO60KlQj+9HM=;
 b=WeTqcEJHjwKOo8R4WSwTL75V2yKbee+HmaMtjc9Qrbdypb4OlgWPrQ2L1tphQFmJfaDuY4
 U77LGD5+uZpbOWD5LEYbJ+7ohVE8oHiT2P9GDdXDsO70PSw6uBsXnevw6UC8Kmol64/tfy
 QBMj2bJ1nRLOTe/251p6SuJN5o8+VHKOlT6qqQtYgU8O2VZANhet2BTl4uOWuk6qbwxJa0
 R8E0GzqYGJSNIaYsocVF/apwxDeVFQNN6kEIXrGL5P4jcMeSFyvOk5qnct9ESux7jGLWiE
 JrzsKTT3RCXirlekxdV4s9kHjMRVERA64vlBDxedHvnwqqM96Nk1O8LY46gf9Q==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 13 May 2024 09:25:11 +0200
Message-Id: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFjAQWYC/23QQW7DIBAF0KtErEsFw4Chq96jygLwkCA1UNmWl
 TTy3Yu8qV13Ofp6/0vzZCMNmUb2dnqygeY85lra0b2cWLz6ciGe+3YzEIACBfDhu0h+ufkoubE
 6Jts51QtiDXwNlPJ9LftghSZe6D6xc0uueZzq8FhXZrnm/xXOkguuA0EA67C38T3UOn3m8hrrb
 S2aYYvdDkPDnYsedYIUO3fEaoOl3mHVsA8SEkREIfsjxg0G3GFs2GrwbTiSiOKI9QYrscO6YQP
 JaG8xobRHbH6xlntsGg5GOYRASuGfhy3L8gMDbkTA4QEAAA==
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
Subject: [Linux-stm32] [PATCH net-next v7 0/7] net: stmmac: Add support for
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

SGVsbG8gZXZlcnlvbmUsCgpUaGlzIGlzIHZlcnNpb24gc2V2ZW4gb2YgbXkgc2VyaWVzIHRoYXQg
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
YXJkcywKClJvbWFpbiBHYW50b2lzCgotLS0KQ2hhbmdlcyBpbiB2NzoKLSBGaXhlZCBwb3RlbnRp
YWwgdW5pbml0aWFsaXplZCB1c2UgaW4gc3RtbWFjX3Bjc19zZXR1cCgpCi0gTGluayB0byB2Njog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDUxMC1yem4xLWdtYWMxLXY2LTAtYjYzOTQy
YmUzMzRjQGJvb3RsaW4uY29tCgpDaGFuZ2VzIGluIHY2OgotIENoYW5nZWQgc3RtbWFjX3Bjc19j
bGVhbigpIHByb3RvdHlwZSB0byBtYXRjaCBzdG1tYWNfcGNzX3NldHVwKCkKLSBMaW5rIHRvIHY1
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNDMwLXJ6bjEtZ21hYzEtdjUtMC02MmY2
NWE4NGY0MThAYm9vdGxpbi5jb20KCkNoYW5nZXMgaW4gdjU6Ci0gUmVmYWN0b3JlZCB0aGUgc3Rt
bWFjX3hwY3Nfc2V0dXAoKSBmdW5jdGlvbiB0byBncm91cCB0b2dldGhlciBYUENTIGFuZCBQQ1MK
ICBzZXR1cCBsb2dpYy4KLSBBZGRlZCBhIHN0bW1hY19wY3NfY2xlYW4oKSBmdW5jdGlvbiBhcyBh
IGNvdW50ZXJwYXJ0IHRvIHN0bW1hY19wY3Nfc2V0dXAoKQotIExpbmsgdG8gdjQ6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyNDA0MjQtcnpuMS1nbWFjMS12NC0wLTg1MmE1ZjJjZTBjMEBi
b290bGluLmNvbQoKQ2hhbmdlcyBpbiB2NDoKLSBSZW1vdmVkIHRoZSBzZWNvbmQgcGFyYW1ldGVy
cyBvZiB0aGUgbmV3IHBjc19pbml0L2V4aXQoKSBjYWxsYmFja3MKLSBSZW1vdmVkIHVubmVjZXNz
YXJ5IGludGVycnVwdC1wYXJlbnQgcmVmZXJlbmNlIGluIGdtYWMxIGRldmljZSBub2RlCi0gTGlu
ayB0byB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDQxNS1yem4xLWdtYWMxLXYz
LTAtYWIxMmYyYzQ0MDFkQGJvb3RsaW4uY29tCgpDaGFuZ2VzIGluIHYzOgotIEZpeGVkIGEgdHlw
byBpbiB0aGUgc29jZnBnYSBwYXRjaAotIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyNDA0MDktcnpuMS1nbWFjMS12Mi0wLTc5Y2E0NWYyZmM3OUBib290bGluLmNvbQoK
Q2hhbmdlcyBpbiB2MjoKLSBBZGQgcGNzX2luaXQvZXhpdCBjYWxsYmFja3MgaW4gc3RtbWFjIHRv
IHNvbHZlIHJhY2UgY29uZGl0aW9uCi0gVXNlIHBjc19pbml0L2V4aXQgY2FsbGJhY2tzIGluIGR3
bWFjX3NvY2ZwZ2EgZ2x1ZSBsYXllcgotIE1pc2NlbGxhbmVvdXMgZGV2aWNlIHRyZWUgYmluZGlu
ZyBjb3JyZWN0aW9ucwotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAy
NDA0MDItcnpuMS1nbWFjMS12MS0wLTViZTJiMjg5NGQ4Y0Bib290bGluLmNvbQoKLS0tCkNsw6lt
ZW50IEzDqWdlciAoMyk6CiAgICAgIGR0LWJpbmRpbmdzOiBuZXQ6IHJlbmVzYXMscnpuMS1nbWFj
OiBEb2N1bWVudCBSWi9OMSBHTUFDIHN1cHBvcnQKICAgICAgbmV0OiBzdG1tYWM6IGFkZCBzdXBw
b3J0IGZvciBSWi9OMSBHTUFDCiAgICAgIEFSTTogZHRzOiByOWEwNmcwMzI6IGRlc2NyaWJlIEdN
QUMxCgpSdXNzZWxsIEtpbmcgKE9yYWNsZSkgKDIpOgogICAgICBuZXQ6IHN0bW1hYzogaW50cm9k
dWNlIHBjc19pbml0L3Bjc19leGl0IHN0bW1hYyBvcGVyYXRpb25zCiAgICAgIG5ldDogc3RtbWFj
OiBkd21hYy1zb2NmcGdhOiB1c2UgcGNzX2luaXQvcGNzX2V4aXQKClNlcmdlIFNlbWluICgyKToK
ICAgICAgbmV0OiBzdG1tYWM6IEFkZCBkZWRpY2F0ZWQgWFBDUyBjbGVhbnVwIG1ldGhvZAogICAg
ICBuZXQ6IHN0bW1hYzogTWFrZSBzdG1tYWNfeHBjc19zZXR1cCgpIGdlbmVyaWMgdG8gYWxsIFBD
UyBkZXZpY2VzCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3JlbmVzYXMscnpuMS1nbWFj
LnlhbWwgfCAgNjYgKysrKysrKysrKysrKwogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKysKIGFyY2gvYXJtL2Jvb3QvZHRzL3JlbmVzYXMv
cjlhMDZnMDMyLmR0c2kgICAgICAgICAgIHwgIDE4ICsrKysKIGRyaXZlcnMvbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL0tjb25maWcgICAgICAgIHwgIDEyICsrKwogZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvTWFrZWZpbGUgICAgICAgfCAgIDEgKwogZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcnpuMS5jICAgfCAgODYgKysrKysrKysrKysr
KysrKysKIC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc29jZnBnYS5jICAg
IHwgMTA3ICsrKysrKysrKystLS0tLS0tLS0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvc3RtbWFjLmggICAgICAgfCAgIDMgKy0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgIHwgIDE0ICstLQogZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21kaW8uYyAgfCAgNTIgKysrKysrKy0tLQogaW5jbHVk
ZS9saW51eC9zdG1tYWMuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogMTEg
ZmlsZXMgY2hhbmdlZCwgMjkwIGluc2VydGlvbnMoKyksIDc3IGRlbGV0aW9ucygtKQotLS0KYmFz
ZS1jb21taXQ6IGNkZGQyZGM2MzkwYjkwZTYyY2VjMjc2ODQyNGQxZDkwZjZkMDQxNjEKY2hhbmdl
LWlkOiAyMDI0MDQwMi1yem4xLWdtYWMxLTY4NWNmODc5M2QwZQoKQmVzdCByZWdhcmRzLAotLSAK
Um9tYWluIEdhbnRvaXMgPHJvbWFpbi5nYW50b2lzQGJvb3RsaW4uY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
