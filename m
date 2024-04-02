Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3415895324
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Apr 2024 14:36:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A393AC6B47E;
	Tue,  2 Apr 2024 12:36:35 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C425C6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Apr 2024 12:36:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49495FF80D;
 Tue,  2 Apr 2024 12:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712061394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yjnkMvjoSKQM99Rq/QD1RS/YQciw7dznZZawKPOEQ6k=;
 b=cWL8yP95jqUKwoyOm+ruKIKEPlITLTJ1yaoBdMOPGcqtPTmkYms8WIAw+1iNicP05Nbfc6
 Zdt9nF/ngly5cICWwmPPeDO9/FkqaAiOGJmTSNnqHXggKGcYF2732p2YrJqgmM1jFTymac
 hNLZFtGIftfLFg+puyHnZpmlOYaDCDkUV+eUhHKfi7e7RuEf3VLyLZ3Ph1v9VvJb4xVuq0
 9JTHIckghor5WPk+QP42jsekuznfHitxImYWgAjDTQpEOAs1Jhbwn7H9srf3vt1AK8+vxx
 +7W6UKV8MI/k180ezK9uB+u9njsh2ayc5U3IWGciKHXHSCpRYG+v8KV6aHoDQA==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 02 Apr 2024 14:37:00 +0200
MIME-Version: 1.0
Message-Id: <20240402-rzn1-gmac1-v1-1-5be2b2894d8c@bootlin.com>
References: <20240402-rzn1-gmac1-v1-0-5be2b2894d8c@bootlin.com>
In-Reply-To: <20240402-rzn1-gmac1-v1-0-5be2b2894d8c@bootlin.com>
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
Subject: [Linux-stm32] [PATCH net-next 1/3] dt-bindings: net: renesas,
 rzn1-gmac: Document RZ/N1 GMAC support
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

RnJvbTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgoKVGhlIFJa
L04xIHNlcmllcyBvZiBNUFVzIGZlYXR1cmUgdXAgdG8gdHdvIEdpZ2FiaXQgRXRoZXJuZXQgY29u
dHJvbGxlcnMuClRoZXNlIGNvbnRyb2xsZXJzIGFyZSBiYXNlZCBvbiBTeW5vcHN5cyBJUHMuIFRo
ZXkgY2FuIGJlIGNvbm5lY3RlZCB0bwpSWi9OMSBSR01JSS9STUlJIGNvbnZlcnRlcnMuCgpBZGQg
YSBiaW5kaW5nIHRoYXQgZGVzY3JpYmVzIHRoZXNlIEdNQUMgZGV2aWNlcy4KClNpZ25lZC1vZmYt
Ynk6ICJDbMOpbWVudCBMw6lnZXIiIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgpbcmdhbnRv
aXM6IGNvbW1pdCBsb2ddClNpZ25lZC1vZmYtYnk6IFJvbWFpbiBHYW50b2lzIDxyb21haW4uZ2Fu
dG9pc0Bib290bGluLmNvbT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcmVuZXNh
cyxyem4xLWdtYWMueWFtbCB8IDY2ICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA2NiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sCm5ldyBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uYzZmNjFmYjFlNWIwCi0tLSAvZGV2L251bGwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEt
Z21hYy55YW1sCkBAIC0wLDAgKzEsNjYgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChH
UEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvbmV0L3JlbmVzYXMscnpuMS1nbWFjLnlhbWwjCiskc2No
ZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0
bGU6IFJlbmVzYXMgR01BQworCittYWludGFpbmVyczoKKyAgLSBSb21haW4gR2FudG9pcyA8cm9t
YWluLmdhbnRvaXNAYm9vdGxpbi5jb20+CisKK3NlbGVjdDoKKyAgcHJvcGVydGllczoKKyAgICBj
b21wYXRpYmxlOgorICAgICAgY29udGFpbnM6CisgICAgICAgIGVudW06CisgICAgICAgICAgLSBy
ZW5lc2FzLHI5YTA2ZzAzMi1nbWFjCisgICAgICAgICAgLSByZW5lc2FzLHJ6bjEtZ21hYworICBy
ZXF1aXJlZDoKKyAgICAtIGNvbXBhdGlibGUKKworYWxsT2Y6CisgIC0gJHJlZjogc25wcyxkd21h
Yy55YW1sIworCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGl0ZW1zOgorICAgICAg
LSBlbnVtOgorICAgICAgICAgIC0gcmVuZXNhcyxyOWEwNmcwMzItZ21hYworICAgICAgLSBjb25z
dDogcmVuZXNhcyxyem4xLWdtYWMKKyAgICAgIC0gY29uc3Q6IHNucHMsZHdtYWMKKworICBwY3Mt
aGFuZGxlOgorICAgIGRlc2NyaXB0aW9uOgorICAgICAgcGhhbmRsZSBwb2ludGluZyB0byBhIFBD
UyBzdWItbm9kZSBjb21wYXRpYmxlIHdpdGgKKyAgICAgIHJlbmVzYXMscnpuMS1taWljLnlhbWwj
CisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKwordW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBm
YWxzZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2Nr
L3I5YTA2ZzAzMi1zeXNjdHJsLmg+CisgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVw
dC1jb250cm9sbGVyL2FybS1naWMuaD4KKworICAgIGV0aGVybmV0QDQ0MDAwMDAwIHsKKyAgICAg
IGNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwNmcwMzItZ21hYyIsICJyZW5lc2FzLHJ6bjEtZ21h
YyIsICJzbnBzLGR3bWFjIjsKKyAgICAgIHJlZyA9IDwweDQ0MDAwMDAwIDB4MjAwMD47CisgICAg
ICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+OworICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJ
IDM0IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDM2
IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorICAgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDM1IElS
UV9UWVBFX0xFVkVMX0hJR0g+OworICAgICAgaW50ZXJydXB0LW5hbWVzID0gIm1hY2lycSIsICJl
dGhfd2FrZV9pcnEiLCAiZXRoX2xwaSI7CisgICAgICBjbG9jay1uYW1lcyA9ICJzdG1tYWNldGgi
OworICAgICAgY2xvY2tzID0gPCZzeXNjdHJsIFI5QTA2RzAzMl9IQ0xLX0dNQUMwPjsKKyAgICAg
IHNucHMsbXVsdGljYXN0LWZpbHRlci1iaW5zID0gPDI1Nj47CisgICAgICBzbnBzLHBlcmZlY3Qt
ZmlsdGVyLWVudHJpZXMgPSA8MTI4PjsKKyAgICAgIHR4LWZpZm8tZGVwdGggPSA8MjA0OD47Cisg
ICAgICByeC1maWZvLWRlcHRoID0gPDQwOTY+OworICAgICAgcGNzLWhhbmRsZSA9IDwmbWlpX2Nv
bnYxPjsKKyAgICAgIHBoeS1tb2RlID0gIm1paSI7CisgICAgfTsKKworLi4uCgotLSAKMi40NC4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
