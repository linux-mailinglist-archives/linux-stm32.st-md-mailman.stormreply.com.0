Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 446648A4B35
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Apr 2024 11:18:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1690C6C858;
	Mon, 15 Apr 2024 09:18:08 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CCE5C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 09:18:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B9EBC0006;
 Mon, 15 Apr 2024 09:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1713172688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A19k6baTLXSBQkEi4H/AzD3+Dk/DAyLFObqgM59V3T8=;
 b=bn5gMH51sneL9p2mZMc1UJHQDBfyjoK4ujFqgOSAyypGyUWDX5jNKy2QF8y1adtDvNqEM4
 tTCfYxHj3972CuIx5fMO0p6TXy2l11Hndq8YbNNCiiQAE8oe2tXz41i4/9Bef4Fu/ZH60o
 GSjkF+KEUzHqWZtFGywaP3dV7tI0YpmCP5M+iDsjyKs8t2PGQLcr2IZ5yEMIXqLloWX5t9
 Agxe8Y3qhI/W6L5QGViMt9atc2TxmTV97W5zdoJ0LLoxXWJElpQEoGS8j/wrZ7t9RRCEF9
 6CMBzl2do3ooVJhcmrokrAS00CuSANov5CsW3WLYKZTZHnON05cBctblTd16Ww==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 15 Apr 2024 11:18:41 +0200
MIME-Version: 1.0
Message-Id: <20240415-rzn1-gmac1-v3-1-ab12f2c4401d@bootlin.com>
References: <20240415-rzn1-gmac1-v3-0-ab12f2c4401d@bootlin.com>
In-Reply-To: <20240415-rzn1-gmac1-v3-0-ab12f2c4401d@bootlin.com>
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
Subject: [Linux-stm32] [PATCH net-next v3 1/5] dt-bindings: net: renesas,
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
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KW3JnYW50b2lz
OiBjb21taXQgbG9nXQpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4K
U2lnbmVkLW9mZi1ieTogUm9tYWluIEdhbnRvaXMgPHJvbWFpbi5nYW50b2lzQGJvb3RsaW4uY29t
PgotLS0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1s
IHwgNjYgKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDY2IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0
L3JlbmVzYXMscnpuMS1nbWFjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbmV0L3JlbmVzYXMscnpuMS1nbWFjLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMDAwMC4uZDlhOGQ1ODZlMjYwYwotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcmVuZXNhcyxyem4xLWdtYWMueWFtbApAQCAt
MCwwICsxLDY2IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9S
IEJTRC0yLUNsYXVzZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9zY2hlbWFzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sIworJHNjaGVtYTogaHR0cDovL2Rl
dmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBSZW5lc2FzIEdN
QUMKKworbWFpbnRhaW5lcnM6CisgIC0gUm9tYWluIEdhbnRvaXMgPHJvbWFpbi5nYW50b2lzQGJv
b3RsaW4uY29tPgorCitzZWxlY3Q6CisgIHByb3BlcnRpZXM6CisgICAgY29tcGF0aWJsZToKKyAg
ICAgIGNvbnRhaW5zOgorICAgICAgICBlbnVtOgorICAgICAgICAgIC0gcmVuZXNhcyxyOWEwNmcw
MzItZ21hYworICAgICAgICAgIC0gcmVuZXNhcyxyem4xLWdtYWMKKyAgcmVxdWlyZWQ6CisgICAg
LSBjb21wYXRpYmxlCisKK2FsbE9mOgorICAtICRyZWY6IHNucHMsZHdtYWMueWFtbCMKKworcHJv
cGVydGllczoKKyAgY29tcGF0aWJsZToKKyAgICBpdGVtczoKKyAgICAgIC0gZW51bToKKyAgICAg
ICAgICAtIHJlbmVzYXMscjlhMDZnMDMyLWdtYWMKKyAgICAgIC0gY29uc3Q6IHJlbmVzYXMscnpu
MS1nbWFjCisgICAgICAtIGNvbnN0OiBzbnBzLGR3bWFjCisKKyAgcGNzLWhhbmRsZToKKyAgICBk
ZXNjcmlwdGlvbjoKKyAgICAgIHBoYW5kbGUgcG9pbnRpbmcgdG8gYSBQQ1Mgc3ViLW5vZGUgY29t
cGF0aWJsZSB3aXRoCisgICAgICByZW5lc2FzLHJ6bjEtbWlpYy55YW1sIworCityZXF1aXJlZDoK
KyAgLSBjb21wYXRpYmxlCisKK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKKworZXhhbXBs
ZXM6CisgIC0gfAorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9yOWEwNmcwMzItc3lz
Y3RybC5oPgorICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9h
cm0tZ2ljLmg+CisKKyAgICBldGhlcm5ldEA0NDAwMDAwMCB7CisgICAgICBjb21wYXRpYmxlID0g
InJlbmVzYXMscjlhMDZnMDMyLWdtYWMiLCAicmVuZXNhcyxyem4xLWdtYWMiLCAic25wcyxkd21h
YyI7CisgICAgICByZWcgPSA8MHg0NDAwMDAwMCAweDIwMDA+OworICAgICAgaW50ZXJydXB0cyA9
IDxHSUNfU1BJIDM0IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorICAgICAgICAgICAgICAgICAgIDxH
SUNfU1BJIDM2IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorICAgICAgICAgICAgICAgICAgIDxHSUNf
U1BJIDM1IElSUV9UWVBFX0xFVkVMX0hJR0g+OworICAgICAgaW50ZXJydXB0LW5hbWVzID0gIm1h
Y2lycSIsICJldGhfd2FrZV9pcnEiLCAiZXRoX2xwaSI7CisgICAgICBjbG9jay1uYW1lcyA9ICJz
dG1tYWNldGgiOworICAgICAgY2xvY2tzID0gPCZzeXNjdHJsIFI5QTA2RzAzMl9IQ0xLX0dNQUMw
PjsKKyAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JnN5c2N0cmw+OworICAgICAgc25wcyxtdWx0aWNh
c3QtZmlsdGVyLWJpbnMgPSA8MjU2PjsKKyAgICAgIHNucHMscGVyZmVjdC1maWx0ZXItZW50cmll
cyA9IDwxMjg+OworICAgICAgdHgtZmlmby1kZXB0aCA9IDwyMDQ4PjsKKyAgICAgIHJ4LWZpZm8t
ZGVwdGggPSA8NDA5Nj47CisgICAgICBwY3MtaGFuZGxlID0gPCZtaWlfY29udjE+OworICAgICAg
cGh5LW1vZGUgPSAibWlpIjsKKyAgICB9OworCisuLi4KCi0tIAoyLjQ0LjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
