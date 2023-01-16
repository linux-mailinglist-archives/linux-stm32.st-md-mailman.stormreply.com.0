Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CD666BFF5
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jan 2023 14:38:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D252C6905B;
	Mon, 16 Jan 2023 13:38:23 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2C79C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jan 2023 10:37:46 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4B56B1BF20A;
 Mon, 16 Jan 2023 10:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1673865466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F2K1Mbt7RBxJUSeZsp99AVJE/j6M83BKYvRqSEdsUyg=;
 b=ni7gaZF5HJZx+zkg5hiab2MC4kcDWihpD1NqI/ROpWizbGwpqSuutcJbaIdPkKju4uRGTc
 QtdMCtRZ8dQwLXymoATD6m7+pNnp/rh4nK0rQ0fTQ+h2a1GRwuV6Ei1lGIcx7NtXbLrpEk
 C9BWYltQoN7cldemrj8von0/dWmEdLaBIMIUuMmh5Cy1T8/2fRXf7Lqdsl2poLePkRQpOL
 M8bRTJsIfAle8Pl4pWCEsvdYTp0uW1FtYLvIlcBYeq1eYQ3NcXrp8DQUyLFzK6SZZ2K3gA
 WFPBFse00b0UW+40eRLCS7YC3hWrybqNXT+4xYzrjKX93TqEDIBajvG6vOs4nQ==
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
Date: Mon, 16 Jan 2023 11:39:26 +0100
Message-Id: <20230116103926.276869-7-clement.leger@bootlin.com>
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
Subject: [Linux-stm32] [PATCH net-next 6/6] ARM: dts: r9a06g032: describe
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

UlovTjEgU29DIGluY2x1ZGVzIHR3byBNQUMgbmFtZWQgR01BQ3ggdGhhdCBhcmUgY29tcGF0aWJs
ZSB3aXRoIHRoZQoic25wcyxkd21hYyIgZHJpdmVyLiBHTUFDMSBpcyBjb25uZWN0ZWQgZGlyZWN0
bHkgdG8gdGhlIE1JSSBjb252ZXJ0ZXIKcG9ydCAxLiBTaW5jZSB0aGlzIE1JSSBjb252ZXJ0ZXIg
aXMgcmVwcmVzZW50ZWQgdXNpbmcgYSBQQ1MgZHJpdmVyLCBpdAp1c2VzIHRoZSByZW5lc2FzIHNw
ZWNpZmljIGNvbXBhdGlibGUgZHJpdmVyIHdoaWNoIHVzZXMgdGhpcyBQQ1MuCgpTaWduZWQtb2Zm
LWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Ci0tLQogYXJj
aC9hcm0vYm9vdC9kdHMvcjlhMDZnMDMyLmR0c2kgfCAxOCArKysrKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9v
dC9kdHMvcjlhMDZnMDMyLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9yOWEwNmcwMzIuZHRzaQpp
bmRleCA0MWUxOWMwOTg2Y2UuLmJhMzJlNDQyOWIwMSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9v
dC9kdHMvcjlhMDZnMDMyLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcjlhMDZnMDMyLmR0
c2kKQEAgLTMwNCw2ICszMDQsMjQgQEAgZG1hMTogZG1hLWNvbnRyb2xsZXJANDAxMDUwMDAgewog
CQkJZGF0YS13aWR0aCA9IDw4PjsKIAkJfTsKIAorCQlnbWFjMTogZXRoZXJuZXRANDQwMDAwMDAg
eworCQkJY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA2ZzAzMi1nbWFjIiwgInJlbmVzYXMscnpu
MS1nbWFjIiwgInNucHMsZHdtYWMiOworCQkJcmVnID0gPDB4NDQwMDAwMDAgMHgyMDAwPjsKKwkJ
CWludGVycnVwdC1wYXJlbnQgPSA8JmdpYz47CisJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzQg
SVJRX1RZUEVfTEVWRUxfSElHSD4sCisJCQkJICAgICA8R0lDX1NQSSAzNiBJUlFfVFlQRV9MRVZF
TF9ISUdIPiwKKwkJCQkgICAgIDxHSUNfU1BJIDM1IElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQkJ
aW50ZXJydXB0LW5hbWVzID0gIm1hY2lycSIsICJldGhfd2FrZV9pcnEiLCAiZXRoX2xwaSI7CisJ
CQljbG9jay1uYW1lcyA9ICJzdG1tYWNldGgiOworCQkJY2xvY2tzID0gPCZzeXNjdHJsIFI5QTA2
RzAzMl9IQ0xLX0dNQUMwPjsKKwkJCXNucHMsbXVsdGljYXN0LWZpbHRlci1iaW5zID0gPDI1Nj47
CisJCQlzbnBzLHBlcmZlY3QtZmlsdGVyLWVudHJpZXMgPSA8MTI4PjsKKwkJCXR4LWZpZm8tZGVw
dGggPSA8MjA0OD47CisJCQlyeC1maWZvLWRlcHRoID0gPDQwOTY+OworCQkJcGNzLWhhbmRsZSA9
IDwmbWlpX2NvbnYxPjsKKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCX07CisKIAkJZ21hYzI6
IGV0aGVybmV0QDQ0MDAyMDAwIHsKIAkJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwNmcwMzIt
Z21hYyIsICJyZW5lc2FzLHJ6bjEtZ21hYyIsICJzbnBzLGR3bWFjIjsKIAkJCXJlZyA9IDwweDQ0
MDAyMDAwIDB4MjAwMD47Ci0tIAoyLjM5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
