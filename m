Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF0466BFF3
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jan 2023 14:38:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 169BDC69054;
	Mon, 16 Jan 2023 13:38:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAE6EC65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jan 2023 10:37:38 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B73DD1BF205;
 Mon, 16 Jan 2023 10:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1673865458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8IX0izh2qofZ81a22loEnqRs/JS0gZcUvR46cRLlzA4=;
 b=Ul2TaPHJ72dnl9AUb/svtGLqKtHwaC9hu+8cfbE58IJMFk7P8p2Q9ki/B2PYcCI//1fC8h
 YDr6I12YRfabH7sEZ1OR2zVo53NdyddkAJ7KNl4ayzug5fkZhmGyfwX/SrfU88U7OpvbsI
 0hR2D4PO0H451Edzvtl3jkoSGAddyX4dGf8sAKdE8S9041RvxxSHgaENf1hr2i1K5I9nIo
 a7o232pHJVjebRULTZ2+/ugoExFg1wDHnWH57wNBvBe9FWGx2bEf7SRRfiQ4P7JgE6Xym9
 PfP34jYmx+zlNodo9OcpcjO4XPDoQp7k76+ik2h8i7nBQbvRdMmPLvOZ/SH2xg==
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Wong Vee Khee <veekhee@apple.com>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Tan Tee Min <tee.min.tan@linux.intel.com>
Date: Mon, 16 Jan 2023 11:39:24 +0100
Message-Id: <20230116103926.276869-5-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116103926.276869-1-clement.leger@bootlin.com>
References: <20230116103926.276869-1-clement.leger@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Jan 2023 13:38:20 +0000
Cc: devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-renesas-soc@vger.kernel.org,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>, Jimmy Lalande <jimmy.lalande@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/6] dt-bindings: net: renesas,
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

QWRkICJyZW5lc2FzLHJ6bjEtZ21hYyIgYmluZGluZyBkb2N1bWVudGlvbiB3aGljaCBpcyBjb21w
YXRpYmxlIHdoaWNoCiJzbnBzLGR3bWFjIiBjb21wYXRpYmxlIGRyaXZlciBidXQgdXNlcyBhIGN1
c3RvbSBQQ1MgdG8gY29tbXVuaWNhdGUKd2l0aCB0aGUgcGh5LgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgotLS0KIC4uLi9iaW5kaW5n
cy9uZXQvcmVuZXNhcyxyem4xLWdtYWMueWFtbCAgICAgICB8IDcxICsrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55
YW1sCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9y
ZW5lc2FzLHJ6bjEtZ21hYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMC4uZWZmYjlhMzEyODMyCi0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sCkBAIC0wLDAg
KzEsNzEgQEAKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNE
LTItQ2xhdXNlKQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3Nj
aGVtYXMvbmV0L3JlbmVzYXMscnpuMS1nbWFjLnlhbWwjCiskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKKwordGl0bGU6IFJlbmVzYXMgR01BQzEg
RGV2aWNlIFRyZWUgQmluZGluZ3MKKworbWFpbnRhaW5lcnM6CisgIC0gQ2zDqW1lbnQgTMOpZ2Vy
IDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgorCitzZWxlY3Q6CisgIHByb3BlcnRpZXM6Cisg
ICAgY29tcGF0aWJsZToKKyAgICAgIGNvbnRhaW5zOgorICAgICAgICBlbnVtOgorICAgICAgICAg
IC0gcmVuZXNhcyxyOWEwNmcwMzItZ21hYworICAgICAgICAgIC0gcmVuZXNhcyxyem4xLWdtYWMK
KyAgcmVxdWlyZWQ6CisgICAgLSBjb21wYXRpYmxlCisKK2FsbE9mOgorICAtICRyZWY6ICJzbnBz
LGR3bWFjLnlhbWwjIgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgorICAgIGFkZGl0aW9u
YWxJdGVtczogdHJ1ZQorICAgIG1heEl0ZW1zOiAzCisgICAgaXRlbXM6CisgICAgICAtIGVudW06
CisgICAgICAgICAgLSByZW5lc2FzLHI5YTA2ZzAzMi1nbWFjCisgICAgICAgICAgLSByZW5lc2Fz
LHJ6bjEtZ21hYworICAgIGNvbnRhaW5zOgorICAgICAgZW51bToKKyAgICAgICAgLSBzbnBzLGR3
bWFjCisKKyAgcGNzLWhhbmRsZToKKyAgICBkZXNjcmlwdGlvbjoKKyAgICAgIHBoYW5kbGUgcG9p
bnRpbmcgdG8gYSBQQ1Mgc3ViLW5vZGUgY29tcGF0aWJsZSB3aXRoCisgICAgICByZW5lc2FzLHJ6
bjEtbWlpYy55YW1sIworICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25z
L3BoYW5kbGUKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJsZQorCit1bmV2YWx1YXRlZFByb3Bl
cnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAgICAjaW5jbHVkZSA8ZHQtYmluZGlu
Z3MvY2xvY2svcjlhMDZnMDMyLXN5c2N0cmwuaD4KKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3Mv
aW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgorCisgICAgZXRoZXJuZXRANDQwMDAwMDAg
eworICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJ6bjEtZ21hYyI7CisgICAgICByZWcgPSA8
MHg0NDAwMDAwMCAweDIwMDA+OworICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmZ2ljPjsKKyAg
ICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAzNCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKyAgICAg
ICAgICAgICA8R0lDX1NQSSAzNiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKyAgICAgICAgICAgICA8
R0lDX1NQSSAzNSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKyAgICAgIGludGVycnVwdC1uYW1lcyA9
ICJtYWNpcnEiLCAiZXRoX3dha2VfaXJxIiwgImV0aF9scGkiOworICAgICAgY2xvY2stbmFtZXMg
PSAic3RtbWFjZXRoIjsKKyAgICAgIGNsb2NrcyA9IDwmc3lzY3RybCBSOUEwNkcwMzJfSENMS19H
TUFDMD47CisgICAgICBzbnBzLG11bHRpY2FzdC1maWx0ZXItYmlucyA9IDwyNTY+OworICAgICAg
c25wcyxwZXJmZWN0LWZpbHRlci1lbnRyaWVzID0gPDEyOD47CisgICAgICB0eC1maWZvLWRlcHRo
ID0gPDIwNDg+OworICAgICAgcngtZmlmby1kZXB0aCA9IDw0MDk2PjsKKyAgICAgIHBjcy1oYW5k
bGUgPSA8Jm1paV9jb252MT47CisgICAgICBwaHktbW9kZSA9ICJtaWkiOworICAgIH07CisKKy4u
LgotLSAKMi4zOS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
