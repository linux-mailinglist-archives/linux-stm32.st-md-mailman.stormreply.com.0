Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A6D690C9E
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Feb 2023 16:14:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C056C6A5EA;
	Thu,  9 Feb 2023 15:14:39 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F54FC6A5E8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Feb 2023 15:14:37 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7EA5B100007;
 Thu,  9 Feb 2023 15:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1675955677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X7Dq5Vuw70IMYBxuGqhVbtfZLGm2k1JDXLT0ynX7Rjw=;
 b=mCCntR8cNEAStDQTa0eLIT/RdzS7lxYKX3xPNrHucJC5WPpQlcHGH8FA//fbglxPp9mkv1
 RTz82qrL/JpN+5i5okbrVmODyAPGFNQHuMXNG3030Rmho3EIaEcvnQmvJBhGAvHBuwk3SP
 f+1CDiAClbKKIzClGYtcaqar5A6uYJ6WPIesIiLgBO4ghwGSzRxrM0Nweln1QijiFqLinO
 Kot5Z/dvJ/TPyCGpd/IuxWHXcJvnEzAUTMaue5Tdpr2mkJtN6ti6yVSeQ4e/xlARqizuY4
 S78B6ek1VkELWYQmxoRkhltUEuqEIU9JMvrJH8gkgoAYczlhexT5ZfPNgPneFA==
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
Date: Thu,  9 Feb 2023 16:16:30 +0100
Message-Id: <20230209151632.275883-5-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209151632.275883-1-clement.leger@bootlin.com>
References: <20230209151632.275883-1-clement.leger@bootlin.com>
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
Subject: [Linux-stm32] [PATCH net-next v3 4/6] dt-bindings: net: renesas,
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

QWRkICJyZW5lc2FzLHJ6bjEtZ21hYyIgYmluZGluZyBkb2N1bWVudGF0aW9uIHdoaWNoIGlzIGNv
bXBhdGlibGUgd2l0aAoic25wcyxkd21hYyIgY29tcGF0aWJsZSBkcml2ZXIgYnV0IHVzZXMgYSBj
dXN0b20gUENTIHRvIGNvbW11bmljYXRlCndpdGggdGhlIHBoeS4KClNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KLS0tCiAuLi4vYmluZGlu
Z3MvbmV0L3JlbmVzYXMscnpuMS1nbWFjLnlhbWwgICAgICAgfCA2NyArKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcmVuZXNhcyxyem4xLWdtYWMu
eWFtbAoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQv
cmVuZXNhcyxyem4xLWdtYWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9uZXQvcmVuZXNhcyxyem4xLWdtYWMueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwMDAuLjAyOWNlNzU4YTI5YwotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvcmVuZXNhcyxyem4xLWdtYWMueWFtbApAQCAtMCww
ICsxLDY3IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJT
RC0yLUNsYXVzZSkKKyVZQU1MIDEuMgorLS0tCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sIworJHNjaGVtYTogaHR0cDovL2Rldmlj
ZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBSZW5lc2FzIEdNQUMK
KworbWFpbnRhaW5lcnM6CisgIC0gQ2zDqW1lbnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3Rs
aW4uY29tPgorCitzZWxlY3Q6CisgIHByb3BlcnRpZXM6CisgICAgY29tcGF0aWJsZToKKyAgICAg
IGNvbnRhaW5zOgorICAgICAgICBlbnVtOgorICAgICAgICAgIC0gcmVuZXNhcyxyOWEwNmcwMzIt
Z21hYworICAgICAgICAgIC0gcmVuZXNhcyxyem4xLWdtYWMKKyAgcmVxdWlyZWQ6CisgICAgLSBj
b21wYXRpYmxlCisKK2FsbE9mOgorICAtICRyZWY6IHNucHMsZHdtYWMueWFtbCMKKworcHJvcGVy
dGllczoKKyAgY29tcGF0aWJsZToKKyAgICBpdGVtczoKKyAgICAgIC0gZW51bToKKyAgICAgICAg
ICAtIHJlbmVzYXMscjlhMDZnMDMyLWdtYWMKKyAgICAgIC0gY29uc3Q6IHJlbmVzYXMscnpuMS1n
bWFjCisgICAgICAtIGNvbnN0OiBzbnBzLGR3bWFjCisKKyAgcGNzLWhhbmRsZToKKyAgICBkZXNj
cmlwdGlvbjoKKyAgICAgIHBoYW5kbGUgcG9pbnRpbmcgdG8gYSBQQ1Mgc3ViLW5vZGUgY29tcGF0
aWJsZSB3aXRoCisgICAgICByZW5lc2FzLHJ6bjEtbWlpYy55YW1sIworICAgICRyZWY6IC9zY2hl
bWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUKKworcmVxdWlyZWQ6CisgIC0gY29t
cGF0aWJsZQorCit1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAt
IHwKKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svcjlhMDZnMDMyLXN5c2N0cmwuaD4K
KyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5o
PgorCisgICAgZXRoZXJuZXRANDQwMDAwMDAgeworICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2Fz
LHI5YTA2ZzAzMi1nbWFjIiwgInJlbmVzYXMscnpuMS1nbWFjIiwgInNucHMsZHdtYWMiOworICAg
ICAgcmVnID0gPDB4NDQwMDAwMDAgMHgyMDAwPjsKKyAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8
JmdpYz47CisgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMzQgSVJRX1RZUEVfTEVWRUxfSElH
SD4sCisgICAgICAgICAgICAgPEdJQ19TUEkgMzYgSVJRX1RZUEVfTEVWRUxfSElHSD4sCisgICAg
ICAgICAgICAgPEdJQ19TUEkgMzUgSVJRX1RZUEVfTEVWRUxfSElHSD47CisgICAgICBpbnRlcnJ1
cHQtbmFtZXMgPSAibWFjaXJxIiwgImV0aF93YWtlX2lycSIsICJldGhfbHBpIjsKKyAgICAgIGNs
b2NrLW5hbWVzID0gInN0bW1hY2V0aCI7CisgICAgICBjbG9ja3MgPSA8JnN5c2N0cmwgUjlBMDZH
MDMyX0hDTEtfR01BQzA+OworICAgICAgc25wcyxtdWx0aWNhc3QtZmlsdGVyLWJpbnMgPSA8MjU2
PjsKKyAgICAgIHNucHMscGVyZmVjdC1maWx0ZXItZW50cmllcyA9IDwxMjg+OworICAgICAgdHgt
Zmlmby1kZXB0aCA9IDwyMDQ4PjsKKyAgICAgIHJ4LWZpZm8tZGVwdGggPSA8NDA5Nj47CisgICAg
ICBwY3MtaGFuZGxlID0gPCZtaWlfY29udjE+OworICAgICAgcGh5LW1vZGUgPSAibWlpIjsKKyAg
ICB9OworCisuLi4KLS0gCjIuMzkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
