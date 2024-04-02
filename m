Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D28D1895323
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Apr 2024 14:36:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98958C6B46B;
	Tue,  2 Apr 2024 12:36:34 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A624C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Apr 2024 12:36:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CE393FF810;
 Tue,  2 Apr 2024 12:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712061393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vbMj3lx6/AbEHxFwUiXuMUpd+hrzcJ437vem59DVMVE=;
 b=Qr4KMBLUPrDOshUpxPGyYmIyAe9REwoFnf81l5s5Cd1aYPEMEXbC+uiezz1MyirfLQTVf3
 vCk0KCQ83dECqHCONREOe8nt1qvvH4vmMBj7yYMsIe7amQhH3LBNeq+VwyF2t+Yt4LrpSj
 V5vKw5RCsHmSEy32P22ST58gflprLoHFN+LZh2F0HX+uo77UllaXMsWX1pRysGV4358GzU
 z0bbqwEWWRV8WmNZHf5/8CKhDVj+ptKpibvGH26mixv3g2EHfNQanpfrmUGznMmf6m/k0B
 kqUWlviZzGnsI4Ers/NzAvje4jkr3bzhahVCwMA+f57PclaNazf5H7XCkIOJyQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 02 Apr 2024 14:36:59 +0200
Message-Id: <20240402-rzn1-gmac1-v1-0-5be2b2894d8c@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOz7C2YC/x3MPQqAMAxA4atIZgNt/fcq4iBtqhmM0oqI4t0tj
 t/w3gORAlOEPnsg0MmRN0nQeQZ2mWQmZJcMRplSlcpguEXjvE5WY91W1rdNVzhFkII9kOfrnw0
 gdKDQdcD4vh9T22SNZgAAAA==
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: Add support for
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

SGVsbG8gZXZlcnlvbmUsCgpUaGlzIGlzIHZlcnNpb24gb25lIG9mIG15IHNlcmllcyB0aGF0IGFk
ZHMgc3VwcG9ydCBmb3IgYSBHaWdhYml0IEV0aGVybmV0CmNvbnRyb2xsZXIgZmVhdHVyZWQgaW4g
dGhlIFJlbmVzYXMgcjlhMDZnMDMyIFNvQywgb2YgdGhlIFJaL04xIGZhbWlseS4gVGhpcwpHTUFD
IGRldmljZSBpcyBiYXNlZCBvbiBhIFN5bm9wc3lzIElQIGFuZCBpcyBjb21wYXRpYmxlIHdpdGgg
dGhlIHN0bW1hYyBkcml2ZXIuCgpNeSBmb3JtZXIgY29sbGVhZ3VlIENsw6ltZW50IEzDqWdlciBv
cmlnaW5hbGx5IHNlbnQgYSBzZXJpZXMgZm9yIHRoaXMgZHJpdmVyLApidXQgYW4gaXNzdWUgaW4g
YnJpbmdpbmcgdXAgdGhlIFBDUyBjbG9jayBoYWQgYmxvY2tlZCB0aGUgdXBzdHJlYW1pbmcKcHJv
Y2Vzcy4gVGhpcyBpc3N1ZSBoYXMgc2luY2UgYmVlbiByZXNvbHZlZCBieSB0aGUgZm9sbG93aW5n
IHNlcmllczoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDMyNi1yeGNfYnVnZml4
LXY2LTAtMjRhNzRlNWM3NjFmQGJvb3RsaW4uY29tLwoKVGhpcyBzZXJpZXMgY29uc2lzdHMgb2Yg
YSBkZXZpY2V0cmVlIGJpbmRpbmcgZGVzY3JpYmluZyB0aGUgUlpOMSBHTUFDCmNvbnRyb2xsZXIg
SVAsIGEgbm9kZSBmb3IgdGhlIEdNQUMxIGRldmljZSBpbiB0aGUgcjlhMDZnMDMyIFNvQyBkZXZp
Y2UKdHJlZSwgYW5kIHRoZSBHTUFDIGRyaXZlciBpdHNlbGYgd2hpY2ggaXMgYSBnbHVlIGxheWVy
IGluIHN0bW1hYy4KCkJlc3QgUmVnYXJkcywKClJvbWFpbiBHYW50b2lzCgotLS0KQ2zDqW1lbnQg
TMOpZ2VyICgzKToKICAgICAgZHQtYmluZGluZ3M6IG5ldDogcmVuZXNhcyxyem4xLWdtYWM6IERv
Y3VtZW50IFJaL04xIEdNQUMgc3VwcG9ydAogICAgICBuZXQ6IHN0bW1hYzogYWRkIHN1cHBvcnQg
Zm9yIFJaL04xIEdNQUMKICAgICAgQVJNOiBkdHM6IHI5YTA2ZzAzMjogZGVzY3JpYmUgR01BQzEK
CiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcmVuZXNhcyxyem4xLWdtYWMueWFtbCB8IDY2
ICsrKysrKysrKysrKysrKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDYgKysKIGFyY2gvYXJtL2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDZnMDMy
LmR0c2kgICAgICAgICAgIHwgMTkgKysrKysKIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8v
c3RtbWFjL0tjb25maWcgICAgICAgIHwgMTIgKysrCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9NYWtlZmlsZSAgICAgICB8ICAxICsKIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL2R3bWFjLXJ6bjEuYyAgIHwgODcgKysrKysrKysrKysrKysrKysrKysrKwog
NiBmaWxlcyBjaGFuZ2VkLCAxOTEgaW5zZXJ0aW9ucygrKQotLS0KYmFzZS1jb21taXQ6IDVmYzY4
MzIwYzFmYjNjN2Q0NTZkZGNhZTBiNDc1NzMyNmEwNDNlNmYKY2hhbmdlLWlkOiAyMDI0MDQwMi1y
em4xLWdtYWMxLTY4NWNmODc5M2QwZQoKQmVzdCByZWdhcmRzLAotLSAKUm9tYWluIEdhbnRvaXMg
PHJvbWFpbi5nYW50b2lzQGJvb3RsaW4uY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
