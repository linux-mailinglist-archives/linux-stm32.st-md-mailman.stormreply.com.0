Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4078C1F0E
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2024 09:37:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9963C6907A;
	Fri, 10 May 2024 07:37:39 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1858C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2024 07:37:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A471F240002;
 Fri, 10 May 2024 07:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715326652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eXa4EdnQqRxUOEPvkBPgsUUIstZOOeI7Xe83F05iy1I=;
 b=LqDnZnJbZthewQjg+2uUE69ksHn0nPImSO221PykvOnTnEr3tDzquCTqZdo0iJNyu/O0CO
 G6XibLEpECB1Na8bSsLpvRgya6UsYQDaLVPYMdemnB8BmQCd1M66WdSzP0tV0xS0trq6Tc
 9jI1wDf2Bj9z6yhVSELCJWvb50w+Irs+LV8agz5mV2b90y2keTd36lt1zjcNTjZRRitZAM
 L2E8xRuQ3T566BBQ7b6RTd0fo0FlgbYMKQsS8uQFgXtINuyEWiIg18/QXb4iNfNgyr91FV
 c1olN3qAwCiI0LcJ/0icwy4T3chG6V1zNg6vCVKratkF6kz96/JtVFlgrr/ZEg==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Fri, 10 May 2024 09:38:08 +0200
MIME-Version: 1.0
Message-Id: <20240510-rzn1-gmac1-v6-1-b63942be334c@bootlin.com>
References: <20240510-rzn1-gmac1-v6-0-b63942be334c@bootlin.com>
In-Reply-To: <20240510-rzn1-gmac1-v6-0-b63942be334c@bootlin.com>
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 1/7] dt-bindings: net: renesas,
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
UmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+
ClNpZ25lZC1vZmYtYnk6IFJvbWFpbiBHYW50b2lzIDxyb21haW4uZ2FudG9pc0Bib290bGluLmNv
bT4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcmVuZXNhcyxyem4xLWdtYWMueWFt
bCB8IDY2ICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2NiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25l
dC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAwMDAuLmQ5YThkNTg2ZTI2MGMKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3JlbmVzYXMscnpuMS1nbWFjLnlhbWwKQEAg
LTAsMCArMSw2NiBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBP
UiBCU0QtMi1DbGF1c2UpCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy9uZXQvcmVuZXNhcyxyem4xLWdtYWMueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogUmVuZXNhcyBH
TUFDCisKK21haW50YWluZXJzOgorICAtIFJvbWFpbiBHYW50b2lzIDxyb21haW4uZ2FudG9pc0Bi
b290bGluLmNvbT4KKworc2VsZWN0OgorICBwcm9wZXJ0aWVzOgorICAgIGNvbXBhdGlibGU6Cisg
ICAgICBjb250YWluczoKKyAgICAgICAgZW51bToKKyAgICAgICAgICAtIHJlbmVzYXMscjlhMDZn
MDMyLWdtYWMKKyAgICAgICAgICAtIHJlbmVzYXMscnpuMS1nbWFjCisgIHJlcXVpcmVkOgorICAg
IC0gY29tcGF0aWJsZQorCithbGxPZjoKKyAgLSAkcmVmOiBzbnBzLGR3bWFjLnlhbWwjCisKK3By
b3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgaXRlbXM6CisgICAgICAtIGVudW06CisgICAg
ICAgICAgLSByZW5lc2FzLHI5YTA2ZzAzMi1nbWFjCisgICAgICAtIGNvbnN0OiByZW5lc2FzLHJ6
bjEtZ21hYworICAgICAgLSBjb25zdDogc25wcyxkd21hYworCisgIHBjcy1oYW5kbGU6CisgICAg
ZGVzY3JpcHRpb246CisgICAgICBwaGFuZGxlIHBvaW50aW5nIHRvIGEgUENTIHN1Yi1ub2RlIGNv
bXBhdGlibGUgd2l0aAorICAgICAgcmVuZXNhcyxyem4xLW1paWMueWFtbCMKKworcmVxdWlyZWQ6
CisgIC0gY29tcGF0aWJsZQorCit1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1w
bGVzOgorICAtIHwKKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svcjlhMDZnMDMyLXN5
c2N0cmwuaD4KKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIv
YXJtLWdpYy5oPgorCisgICAgZXRoZXJuZXRANDQwMDAwMDAgeworICAgICAgY29tcGF0aWJsZSA9
ICJyZW5lc2FzLHI5YTA2ZzAzMi1nbWFjIiwgInJlbmVzYXMscnpuMS1nbWFjIiwgInNucHMsZHdt
YWMiOworICAgICAgcmVnID0gPDB4NDQwMDAwMDAgMHgyMDAwPjsKKyAgICAgIGludGVycnVwdHMg
PSA8R0lDX1NQSSAzNCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKyAgICAgICAgICAgICAgICAgICA8
R0lDX1NQSSAzNiBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKKyAgICAgICAgICAgICAgICAgICA8R0lD
X1NQSSAzNSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKyAgICAgIGludGVycnVwdC1uYW1lcyA9ICJt
YWNpcnEiLCAiZXRoX3dha2VfaXJxIiwgImV0aF9scGkiOworICAgICAgY2xvY2stbmFtZXMgPSAi
c3RtbWFjZXRoIjsKKyAgICAgIGNsb2NrcyA9IDwmc3lzY3RybCBSOUEwNkcwMzJfSENMS19HTUFD
MD47CisgICAgICBwb3dlci1kb21haW5zID0gPCZzeXNjdHJsPjsKKyAgICAgIHNucHMsbXVsdGlj
YXN0LWZpbHRlci1iaW5zID0gPDI1Nj47CisgICAgICBzbnBzLHBlcmZlY3QtZmlsdGVyLWVudHJp
ZXMgPSA8MTI4PjsKKyAgICAgIHR4LWZpZm8tZGVwdGggPSA8MjA0OD47CisgICAgICByeC1maWZv
LWRlcHRoID0gPDQwOTY+OworICAgICAgcGNzLWhhbmRsZSA9IDwmbWlpX2NvbnYxPjsKKyAgICAg
IHBoeS1tb2RlID0gIm1paSI7CisgICAgfTsKKworLi4uCgotLSAKMi40NC4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
