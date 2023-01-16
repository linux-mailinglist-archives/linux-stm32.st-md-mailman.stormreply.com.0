Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6164066BFF2
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jan 2023 14:38:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0353EC6904A;
	Mon, 16 Jan 2023 13:38:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA83CC65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jan 2023 10:37:34 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2BAD51BF20D;
 Mon, 16 Jan 2023 10:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1673865454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=otK04t6Fq+0COownezUclLPHt9Yq8LgEt2fdJEWCBeY=;
 b=SgVpIa9+7N5kErKew4ZANdCP3OgDdChVG7HEXYslpXSzH7kvthC+fDHeFxhnov9U3/LWVX
 VjRKdfUkztdgeLWQV1qbhW2EjzVSlFpO8oSVajOsieEF5LJzu54hu5F81H9DiiyJF7NXv0
 wusfQa+cj2Gy/i3aL23RJ+Zv0wh4sjwGsaBGQec3wlbJNGwMlq8kPckzFNJi2DRSbVixKU
 LzcPKzCgm5A74SLyL/SVLgE5+cDHuffnhAYISWss/MI41KnD23sfO3JYTXtgxzKCk+YoIG
 Z1EEoADo6NCN6Ok1TK6/zLEBuVeLaGIXzAJkzXKCE6IYT0o35UVIu/nQVDb6UQ==
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
Date: Mon, 16 Jan 2023 11:39:23 +0100
Message-Id: <20230116103926.276869-4-clement.leger@bootlin.com>
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
Subject: [Linux-stm32] [PATCH net-next 3/6] net: stmmac: start phylink
	before setting up hardware
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

VGhlIHN0bW1hYyBvbiB0aGUgUmVuZXNhcyBSWi9OMSBwbGF0Zm9ybSBpcyBjb25uZWN0ZWQgdG8g
dGhlIFBDUyB3aGljaAptdXN0IGJlIGNvbmZpZ3VyZWQgdG8gcHJvdmlkZSBhIGNvcnJlY3QgUkdN
SUkgUlggY2xvY2sgdG8gdGhlIHN0bW1hYyBJUC4KV2l0aG91dCB0aGUgUlggY2xvY2ssIHRoZSBk
cml2ZXIgd2lsbCBmYWlsIHRvIGluaXRpYWxpemUgdGhlIGhhcmR3YXJlCihtb3JlIHNwZWNpZmlj
YWxseSwgdGhlIGRyaXZlciB3aWxsIHJlcG9ydCBpdCBmYWlscyB0byByZXNldCBETUEpLiBJbgpv
cmRlciB0byBmaXggdGhhdCwgc3RhcnQgcGh5bGluayBtZWNhbmlzbSBiZWZvcmUgc2V0dGluZyB1
cCBoYXJkd2FyZS4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdl
ckBib290bGluLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9z
dG1tYWNfbWFpbi5jIHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNy
by9zdG1tYWMvc3RtbWFjX21haW4uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL3N0bW1hY19tYWluLmMKaW5kZXggZjIyNDdiOGNmMGEzLi44OGM5NDEwMDM4NTUgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMK
KysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwpA
QCAtMzgxOCw2ICszODE4LDEyIEBAIHN0YXRpYyBpbnQgX19zdG1tYWNfb3BlbihzdHJ1Y3QgbmV0
X2RldmljZSAqZGV2LAogCQl9CiAJfQogCisJLyogV2UgbmVlZCB0byBzZXR1cCB0aGUgcGh5ICYg
UENTIGJlZm9yZSBhY2Nlc3NpbmcgdGhlIHN0bW1hYyByZWdpc3RlcnMKKwkgKiBiZWNhdXNlIGlu
IHNvbWUgY2FzZXMgKFJaL04xKSwgaWYgdGhlIHN0bW1hYyBJUCBpcyBub3QgY2xvY2tlZCBieSB0
aGUKKwkgKiBQQ1MsIGhhcmR3YXJlIGluaXQgd2lsbCBmYWlsIGJlY2F1c2UgaXQgbGFja3MgYSBS
R01JSSBSWCBjbG9jay4KKwkgKi8KKwlwaHlsaW5rX3N0YXJ0KHByaXYtPnBoeWxpbmspOworCiAJ
cmV0ID0gc3RtbWFjX2h3X3NldHVwKGRldiwgdHJ1ZSk7CiAJaWYgKHJldCA8IDApIHsKIAkJbmV0
ZGV2X2Vycihwcml2LT5kZXYsICIlczogSHcgc2V0dXAgZmFpbGVkXG4iLCBfX2Z1bmNfXyk7CkBA
IC0zODI2LDcgKzM4MzIsNiBAQCBzdGF0aWMgaW50IF9fc3RtbWFjX29wZW4oc3RydWN0IG5ldF9k
ZXZpY2UgKmRldiwKIAogCXN0bW1hY19pbml0X2NvYWxlc2NlKHByaXYpOwogCi0JcGh5bGlua19z
dGFydChwcml2LT5waHlsaW5rKTsKIAkvKiBXZSBtYXkgaGF2ZSBjYWxsZWQgcGh5bGlua19zcGVl
ZF9kb3duIGJlZm9yZSAqLwogCXBoeWxpbmtfc3BlZWRfdXAocHJpdi0+cGh5bGluayk7CiAKLS0g
CjIuMzkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
