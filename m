Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 722938A4B3A
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Apr 2024 11:18:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28896C6DD67;
	Mon, 15 Apr 2024 09:18:14 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24C83C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Apr 2024 09:18:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8A17C0010;
 Mon, 15 Apr 2024 09:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1713172692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XCyAbQcIJcAICoi8a+KK/90MkHSJd2aPghAcGMKFRO8=;
 b=RtOVb3ibuLx7kX0gleJz/AaI4WC0MrYNt19MiAv9Ep5U0sIyGGHTDM0w2472b3HJahTAeK
 Wt85sfLE6dCh2XtacExjqDU03JLuXXd9LOJOaezseODPjN5Ady28tjyRYw5q3he7/+Jgri
 crONMjF1gCD9H3GbgRysmT5gpZCXwJl1zAa8H889SlA1oO5cOJTaZdZj7v1TboLyUYyo/2
 pXiJ6tHM3fnLFbsvJz+IdfxNmVySB+YGr0J83Kn170jyIs0P4CyasRMBebveXvEJjZJBzU
 MFNUTWIyoOwWklfX40Ad5J6cFR36oO74ft4vbI8r4p6WgXFkyj6irQ4+7aqfHQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 15 Apr 2024 11:18:45 +0200
MIME-Version: 1.0
Message-Id: <20240415-rzn1-gmac1-v3-5-ab12f2c4401d@bootlin.com>
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
Subject: [Linux-stm32] [PATCH net-next v3 5/5] ARM: dts: r9a06g032: describe
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
L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDZnMDMyLmR0c2kKaW5kZXggZmE2M2UxYWZjNGVmNC4uY2Fi
N2E2NDFmOTViYSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvcmVuZXNhcy9yOWEwNmcw
MzIuZHRzaQorKysgYi9hcmNoL2FybS9ib290L2R0cy9yZW5lc2FzL3I5YTA2ZzAzMi5kdHNpCkBA
IC0zMTYsNiArMzE2LDI1IEBAIGRtYTE6IGRtYS1jb250cm9sbGVyQDQwMTA1MDAwIHsKIAkJCWRh
dGEtd2lkdGggPSA8OD47CiAJCX07CiAKKwkJZ21hYzE6IGV0aGVybmV0QDQ0MDAwMDAwIHsKKwkJ
CWNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwNmcwMzItZ21hYyIsICJyZW5lc2FzLHJ6bjEtZ21h
YyIsICJzbnBzLGR3bWFjIjsKKwkJCXJlZyA9IDwweDQ0MDAwMDAwIDB4MjAwMD47CisJCQlpbnRl
cnJ1cHQtcGFyZW50ID0gPCZnaWM+OworCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM0IElSUV9U
WVBFX0xFVkVMX0hJR0g+LAorCQkJCSAgICAgPEdJQ19TUEkgMzYgSVJRX1RZUEVfTEVWRUxfSElH
SD4sCisJCQkJICAgICA8R0lDX1NQSSAzNSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCWludGVy
cnVwdC1uYW1lcyA9ICJtYWNpcnEiLCAiZXRoX3dha2VfaXJxIiwgImV0aF9scGkiOworCQkJY2xv
Y2tzID0gPCZzeXNjdHJsIFI5QTA2RzAzMl9IQ0xLX0dNQUMwPjsKKwkJCWNsb2NrLW5hbWVzID0g
InN0bW1hY2V0aCI7CisJCQlwb3dlci1kb21haW5zID0gPCZzeXNjdHJsPjsKKwkJCXNucHMsbXVs
dGljYXN0LWZpbHRlci1iaW5zID0gPDI1Nj47CisJCQlzbnBzLHBlcmZlY3QtZmlsdGVyLWVudHJp
ZXMgPSA8MTI4PjsKKwkJCXR4LWZpZm8tZGVwdGggPSA8MjA0OD47CisJCQlyeC1maWZvLWRlcHRo
ID0gPDQwOTY+OworCQkJcGNzLWhhbmRsZSA9IDwmbWlpX2NvbnYxPjsKKwkJCXN0YXR1cyA9ICJk
aXNhYmxlZCI7CisJCX07CisKIAkJZ21hYzI6IGV0aGVybmV0QDQ0MDAyMDAwIHsKIAkJCWNvbXBh
dGlibGUgPSAicmVuZXNhcyxyOWEwNmcwMzItZ21hYyIsICJyZW5lc2FzLHJ6bjEtZ21hYyIsICJz
bnBzLGR3bWFjIjsKIAkJCXJlZyA9IDwweDQ0MDAyMDAwIDB4MjAwMD47CgotLSAKMi40NC4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
