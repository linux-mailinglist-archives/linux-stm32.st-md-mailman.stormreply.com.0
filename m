Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AB68B6BA7
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Apr 2024 09:29:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77892C71296;
	Tue, 30 Apr 2024 07:29:17 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF544C7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Apr 2024 07:29:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4ABAC240006;
 Tue, 30 Apr 2024 07:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1714462153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NzNqKTpVWMnrcgcJVGgyUqBdfYphefuKpHkJ0PXLDgQ=;
 b=CN3T8ALqDDUwQIHWdmnwbu3w3cBGhFiAQoFYmgkkKp2oTWvbq+mhAmBUGZk01NF1VCjA+1
 ioZwzqpZZhj16mWwLfSDLz8mIuYOgmGYedI6gfJOj1lVbjZ0Oy05xSF5Dp4JvlBFx6cff7
 fOqIuApRSaGeilWB4ncdRG4Wh684KPIJwLhM98+zfSx7dbIEjVwRVFFX3jAlqKmNImx7wQ
 y8wdQilSlU2nd7KxDYydTtxPevbLWFA9VkHrbZ/MRHJEZqgWrfXd5mpzY5r8uXmZnGHDXb
 ndvFNdrtZKve1FkpZX9N/juVjL2DgNUHkKkGvFX0JyMtQSU1yl8ZQsUnPY1A7A==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 30 Apr 2024 09:29:47 +0200
MIME-Version: 1.0
Message-Id: <20240430-rzn1-gmac1-v5-7-62f65a84f418@bootlin.com>
References: <20240430-rzn1-gmac1-v5-0-62f65a84f418@bootlin.com>
In-Reply-To: <20240430-rzn1-gmac1-v5-0-62f65a84f418@bootlin.com>
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
Subject: [Linux-stm32] [PATCH net-next v5 7/7] ARM: dts: r9a06g032: describe
	GMAC1
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

RnJvbTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgoKVGhlIHI5
YTA2ZzAzMiBTb0Mgb2YgdGhlIFJaL04xIGZhbWlseSBmZWF0dXJlcyB0d28gR01BQyBkZXZpY2Vz
IG5hbWVkCkdNQUMxLzIsIHRoYXQgYXJlIGJhc2VkIG9uIFN5bm9wc3lzIGNvcmVzLiBHTUFDMSBp
cyBjb25uZWN0ZWQgdG8gYQpSR01JSS9STUlJIGNvbnZlcnRlciB0aGF0IGlzIGFscmVhZHkgZGVz
Y3JpYmVkIGluIHRoaXMgZGV2aWNlIHRyZWUuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6ln
ZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+CltyZ2FudG9pczogY29tbWl0IGxvZ10KUmV2
aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+ClNp
Z25lZC1vZmYtYnk6IFJvbWFpbiBHYW50b2lzIDxyb21haW4uZ2FudG9pc0Bib290bGluLmNvbT4K
LS0tCiBhcmNoL2FybS9ib290L2R0cy9yZW5lc2FzL3I5YTA2ZzAzMi5kdHNpIHwgMTggKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDZnMDMyLmR0c2kgYi9hcmNoL2FybS9i
b290L2R0cy9yZW5lc2FzL3I5YTA2ZzAzMi5kdHNpCmluZGV4IGZhNjNlMWFmYzRlZjQuLjU3Yzcz
MGY0MzQ0MmUgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDZnMDMy
LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcmVuZXNhcy9yOWEwNmcwMzIuZHRzaQpAQCAt
MzE2LDYgKzMxNiwyNCBAQCBkbWExOiBkbWEtY29udHJvbGxlckA0MDEwNTAwMCB7CiAJCQlkYXRh
LXdpZHRoID0gPDg+OwogCQl9OwogCisJCWdtYWMxOiBldGhlcm5ldEA0NDAwMDAwMCB7CisJCQlj
b21wYXRpYmxlID0gInJlbmVzYXMscjlhMDZnMDMyLWdtYWMiLCAicmVuZXNhcyxyem4xLWdtYWMi
LCAic25wcyxkd21hYyI7CisJCQlyZWcgPSA8MHg0NDAwMDAwMCAweDIwMDA+OworCQkJaW50ZXJy
dXB0cyA9IDxHSUNfU1BJIDM0IElSUV9UWVBFX0xFVkVMX0hJR0g+LAorCQkJCSAgICAgPEdJQ19T
UEkgMzYgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJICAgICA8R0lDX1NQSSAzNSBJUlFfVFlQ
RV9MRVZFTF9ISUdIPjsKKwkJCWludGVycnVwdC1uYW1lcyA9ICJtYWNpcnEiLCAiZXRoX3dha2Vf
aXJxIiwgImV0aF9scGkiOworCQkJY2xvY2tzID0gPCZzeXNjdHJsIFI5QTA2RzAzMl9IQ0xLX0dN
QUMwPjsKKwkJCWNsb2NrLW5hbWVzID0gInN0bW1hY2V0aCI7CisJCQlwb3dlci1kb21haW5zID0g
PCZzeXNjdHJsPjsKKwkJCXNucHMsbXVsdGljYXN0LWZpbHRlci1iaW5zID0gPDI1Nj47CisJCQlz
bnBzLHBlcmZlY3QtZmlsdGVyLWVudHJpZXMgPSA8MTI4PjsKKwkJCXR4LWZpZm8tZGVwdGggPSA8
MjA0OD47CisJCQlyeC1maWZvLWRlcHRoID0gPDQwOTY+OworCQkJcGNzLWhhbmRsZSA9IDwmbWlp
X2NvbnYxPjsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCX07CisKIAkJZ21hYzI6IGV0aGVy
bmV0QDQ0MDAyMDAwIHsKIAkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwNmcwMzItZ21hYyIs
ICJyZW5lc2FzLHJ6bjEtZ21hYyIsICJzbnBzLGR3bWFjIjsKIAkJCXJlZyA9IDwweDQ0MDAyMDAw
IDB4MjAwMD47CgotLSAKMi40NC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
