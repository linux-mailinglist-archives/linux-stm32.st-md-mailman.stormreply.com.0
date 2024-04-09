Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3971289D54E
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 11:21:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0D2FC71295;
	Tue,  9 Apr 2024 09:21:17 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7FD1C7128B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Apr 2024 09:21:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 731251BF206;
 Tue,  9 Apr 2024 09:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1712654476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MxX4gGO1cf6dYcz+BOp+BvU3IyOz8Kkdye9gsRIK7QY=;
 b=EvT9N+/+7ILUTywV2Nhw36YQ3yVnZcKQtU+7IS1lfhBz9fkx+/3MDQMX4/pK2jTmgTVrDg
 FiITDLcJ5oqh/5pTYCa8DWKnjiDMzVpqegyrFpycEFLB+g4gO2o6cCLtYaRGs+8LnS+tfs
 pMY99Vqa19fRXQvaMcUd//WHRf7/KVR2gjR9EC7SoJKdA+gWNIj3fF8XgmcLXGju0wHBQk
 yG3A4ZOAiZnrJDYeoKxxCCN36UWRUXw4P0uvrPR0XAt2pvMibDGVjAMK4Xc+kllcTgpc3e
 OBfiMB31z2NBmFdwdfL9BSa1ZPZJ49o7b199aZN4s4ewu9KYXDa63rnY06Ip6w==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 09 Apr 2024 11:21:48 +0200
MIME-Version: 1.0
Message-Id: <20240409-rzn1-gmac1-v2-5-79ca45f2fc79@bootlin.com>
References: <20240409-rzn1-gmac1-v2-0-79ca45f2fc79@bootlin.com>
In-Reply-To: <20240409-rzn1-gmac1-v2-0-79ca45f2fc79@bootlin.com>
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
Subject: [Linux-stm32] [PATCH net-next v2 5/5] ARM: dts: r9a06g032: describe
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
Y3JpYmVkIGluIHRoaXMgZGV2aWNlIHRyZWUuCgpTaWduZWQtb2ZmLWJ5OiAiQ2zDqW1lbnQgTMOp
Z2VyIiA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KW3JnYW50b2lzOiBjb21taXQgbG9nXQpT
aWduZWQtb2ZmLWJ5OiBSb21haW4gR2FudG9pcyA8cm9tYWluLmdhbnRvaXNAYm9vdGxpbi5jb20+
Ci0tLQogYXJjaC9hcm0vYm9vdC9kdHMvcmVuZXNhcy9yOWEwNmcwMzIuZHRzaSB8IDE5ICsrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvcmVuZXNhcy9yOWEwNmcwMzIuZHRzaSBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDZnMDMyLmR0c2kKaW5kZXggZmE2M2UxYWZjNGVmLi5jYWI3
YTY0MWY5NWIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDZnMDMy
LmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcmVuZXNhcy9yOWEwNmcwMzIuZHRzaQpAQCAt
MzE2LDYgKzMxNiwyNSBAQCBkbWExOiBkbWEtY29udHJvbGxlckA0MDEwNTAwMCB7CiAJCQlkYXRh
LXdpZHRoID0gPDg+OwogCQl9OwogCisJCWdtYWMxOiBldGhlcm5ldEA0NDAwMDAwMCB7CisJCQlj
b21wYXRpYmxlID0gInJlbmVzYXMscjlhMDZnMDMyLWdtYWMiLCAicmVuZXNhcyxyem4xLWdtYWMi
LCAic25wcyxkd21hYyI7CisJCQlyZWcgPSA8MHg0NDAwMDAwMCAweDIwMDA+OworCQkJaW50ZXJy
dXB0LXBhcmVudCA9IDwmZ2ljPjsKKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAzNCBJUlFfVFlQ
RV9MRVZFTF9ISUdIPiwKKwkJCQkgICAgIDxHSUNfU1BJIDM2IElSUV9UWVBFX0xFVkVMX0hJR0g+
LAorCQkJCSAgICAgPEdJQ19TUEkgMzUgSVJRX1RZUEVfTEVWRUxfSElHSD47CisJCQlpbnRlcnJ1
cHQtbmFtZXMgPSAibWFjaXJxIiwgImV0aF93YWtlX2lycSIsICJldGhfbHBpIjsKKwkJCWNsb2Nr
cyA9IDwmc3lzY3RybCBSOUEwNkcwMzJfSENMS19HTUFDMD47CisJCQljbG9jay1uYW1lcyA9ICJz
dG1tYWNldGgiOworCQkJcG93ZXItZG9tYWlucyA9IDwmc3lzY3RybD47CisJCQlzbnBzLG11bHRp
Y2FzdC1maWx0ZXItYmlucyA9IDwyNTY+OworCQkJc25wcyxwZXJmZWN0LWZpbHRlci1lbnRyaWVz
ID0gPDEyOD47CisJCQl0eC1maWZvLWRlcHRoID0gPDIwNDg+OworCQkJcngtZmlmby1kZXB0aCA9
IDw0MDk2PjsKKwkJCXBjcy1oYW5kbGUgPSA8Jm1paV9jb252MT47CisJCQlzdGF0dXMgPSAiZGlz
YWJsZWQiOworCQl9OworCiAJCWdtYWMyOiBldGhlcm5ldEA0NDAwMjAwMCB7CiAJCQljb21wYXRp
YmxlID0gInJlbmVzYXMscjlhMDZnMDMyLWdtYWMiLCAicmVuZXNhcyxyem4xLWdtYWMiLCAic25w
cyxkd21hYyI7CiAJCQlyZWcgPSA8MHg0NDAwMjAwMCAweDIwMDA+OwoKLS0gCjIuNDQuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
