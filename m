Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6D168F368
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Feb 2023 17:40:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EF72C6A5E9;
	Wed,  8 Feb 2023 16:40:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66EEAC6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Feb 2023 16:40:21 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 36E231BF209;
 Wed,  8 Feb 2023 16:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1675874421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1zV1VFrWVhQ6vhXF/fCLwcz9IjHBuYzryMaqXBU05Vo=;
 b=bsr2kT8/fs5ycb41yzV5D54Na9MB0RfaRaz/6VBRiG9lnEj506WDX5EFWJbhJ9f9+cc+se
 2srr6LKvbSutYzurG4hnAQYFcFmaPaHNO6rikx9pRpXY2XUWqXiMpwjs/rtViOJzTFcQT6
 fSuuM3Mu67AGYUDEMsDt+vSQG9R7u27Msf4jnskpsYrVrHPWGbQJ1wv0eyK1brGcrBwxz8
 GoVuevDB6Ep2WV7zfFfJvtWZ+K0ONsjugPgnC//YBHlj9EcDmvqagdg/CITSnvNfHpjgEm
 Ey22ZDxQPP28DIXD11BR4m4IZLtAV8WneDCssRBhlFWDLBNk5QYmoEHr7miOYg==
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
Date: Wed,  8 Feb 2023 17:41:58 +0100
Message-Id: <20230208164203.378153-2-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230208164203.378153-1-clement.leger@bootlin.com>
References: <20230208164203.378153-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-renesas-soc@vger.kernel.org,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Milan Stevanovic <milan.stevanovic@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>, Jimmy Lalande <jimmy.lalande@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 1/6] net: pcs: rzn1-miic: add
	pcs_early_setup() function
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

V2hlbiB1c2luZyB0aGlzIFBDUyB3aXRoIHRoZSBzdG1tYWMgSVAsIGlmIHRoZSBwY3MgaXMgbm90
IGNvbmZpZ3VyZWQgYW5kCmVuYWJsZWQgYmVmb3JlIHNldHRpbmcgdXAgc3RtbWFjIGhhcmR3YXJl
LCBkcml2ZXIgc2V0dXAgd2lsbCBmYWlsIGR1ZSB0bwp0aGUgbGFjayBvZiBpbnB1dCBSR01JSSBS
WCBjbG9jay4gQWRkIHBjc19lYXJseV9zZXR1cCgpIGZ1bmN0aW9uIHdoaWNoCmFsbG93cyB0byBj
b25maWd1cmUgdGhlIE1JSUMgY29udmVydGVyIGJhc2VkIG9uIHRoZSAicGh5LW1vZGUiIHRoYXQg
aXMKZGVzY3JpYmVkIGluIHRoZSBkZXZpY2UtdHJlZS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50
IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9wY3Mv
cGNzLXJ6bjEtbWlpYy5jIHwgMTIgKysrKysrKysrKysrCiBpbmNsdWRlL2xpbnV4L3Bjcy1yem4x
LW1paWMuaCAgIHwgIDMgKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL25ldC9wY3MvcGNzLXJ6bjEtbWlpYy5jIGIvZHJpdmVycy9uZXQv
cGNzL3Bjcy1yem4xLW1paWMuYwppbmRleCBjMTQyNDExOWU4MjEuLmUyZWFmNzg5YzRkMiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9uZXQvcGNzL3Bjcy1yem4xLW1paWMuYworKysgYi9kcml2ZXJzL25l
dC9wY3MvcGNzLXJ6bjEtbWlpYy5jCkBAIC0yODgsNiArMjg4LDE4IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgcGh5bGlua19wY3Nfb3BzIG1paWNfcGh5bGlua19vcHMgPSB7CiAJLnBjc19saW5rX3Vw
ID0gbWlpY19saW5rX3VwLAogfTsKIAoraW50IG1paWNfZWFybHlfc2V0dXAoc3RydWN0IHBoeWxp
bmtfcGNzICpwY3MsIHN0cnVjdCBkZXZpY2UgKmRldikKK3sKKwlpbnQgaW50ZXJmYWNlOworCisJ
aW50ZXJmYWNlID0gZGV2aWNlX2dldF9waHlfbW9kZShkZXYpOworCWlmIChpbnRlcmZhY2UgPCAw
KQorCQlyZXR1cm4gaW50ZXJmYWNlOworCisJcmV0dXJuIG1paWNfY29uZmlnKHBjcywgMCwgaW50
ZXJmYWNlLCBOVUxMLCBmYWxzZSk7Cit9CitFWFBPUlRfU1lNQk9MKG1paWNfZWFybHlfc2V0dXAp
OworCiBzdHJ1Y3QgcGh5bGlua19wY3MgKm1paWNfY3JlYXRlKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IGRldmljZV9ub2RlICpucCkKIHsKIAlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
OwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wY3MtcnpuMS1taWljLmggYi9pbmNsdWRlL2xp
bnV4L3Bjcy1yem4xLW1paWMuaAppbmRleCA1NmQxMmIyMTM2NWQuLjg0ZDcxMzBiNGI3OCAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9saW51eC9wY3MtcnpuMS1taWljLmgKKysrIGIvaW5jbHVkZS9saW51
eC9wY3MtcnpuMS1taWljLmgKQEAgLTksOCArOSwxMSBAQAogI2RlZmluZSBfX0xJTlVYX1BDU19N
SUlDX0gKIAogc3RydWN0IHBoeWxpbms7CitzdHJ1Y3QgcGh5bGlua19wY3M7CiBzdHJ1Y3QgZGV2
aWNlX25vZGU7CiAKK2ludCBtaWljX2Vhcmx5X3NldHVwKHN0cnVjdCBwaHlsaW5rX3BjcyAqcGNz
LCBzdHJ1Y3QgZGV2aWNlICpkZXYpOworCiBzdHJ1Y3QgcGh5bGlua19wY3MgKm1paWNfY3JlYXRl
KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9ub2RlICpucCk7CiAKIHZvaWQgbWlp
Y19kZXN0cm95KHN0cnVjdCBwaHlsaW5rX3BjcyAqcGNzKTsKLS0gCjIuMzkuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
