Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 927838B0551
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Apr 2024 11:05:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 531F4C7128A;
	Wed, 24 Apr 2024 09:05:47 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C6FCC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Apr 2024 09:05:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 71F7120015;
 Wed, 24 Apr 2024 09:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1713949545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eXa4EdnQqRxUOEPvkBPgsUUIstZOOeI7Xe83F05iy1I=;
 b=Y0nLf11PnZo+TTNfH9m1AI10Yl+Jd72zlVvKBq/8npXtbJ28DAwGHyTISoZZqyZ/wvf52L
 mFVPXugyr8G2eh8JRo4bg6MstVtCGPWcTqRM+qq2oIIaVIiq66iNx0HdSCOTvnnXDobPx+
 0SJFjkLGcLnq4vMJevgAZUiN3NXnd3NkJ/sN3VQuL36czt2ouj3ew4bVBinFKy2fPEeGCY
 Q9jP9JMyhDX6zX0n4R+aBxUbu5CY+JB86gO8PP+ydP4PW7Wn5VeGkIfC0ArVGG7qAbpMqB
 e2xliDLAuAmZ4+zPiwN8v9AnmJgrYqLHB6WzotjNjlPMK+hVhKCRvef86iQbWA==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Wed, 24 Apr 2024 11:06:19 +0200
MIME-Version: 1.0
Message-Id: <20240424-rzn1-gmac1-v4-1-852a5f2ce0c0@bootlin.com>
References: <20240424-rzn1-gmac1-v4-0-852a5f2ce0c0@bootlin.com>
In-Reply-To: <20240424-rzn1-gmac1-v4-0-852a5f2ce0c0@bootlin.com>
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
Subject: [Linux-stm32] [PATCH net-next v4 1/5] dt-bindings: net: renesas,
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
