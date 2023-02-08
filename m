Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B732568F36D
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Feb 2023 17:40:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83156C6A5E9;
	Wed,  8 Feb 2023 16:40:34 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3E54C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Feb 2023 16:40:33 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B9A171BF204;
 Wed,  8 Feb 2023 16:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1675874433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKxN1115PkUVgT67V9DJBTOcN72KLe5GaWw0cltqBAA=;
 b=KxrU9bOQAeIWYzdEKz/zSbCBf2B4HsYw4cySr7Jm7jjp4hCZox/kIrG9V6Nq4E0GTbwJFx
 SPXBdGbIvtGGB1oLJXq1M6LVAkj2J1J7jt6p1kSul1J2dVhBcsCYsIROYCmf/Sm+1uflK6
 HFOjb0F/FdQQydqXE0jxIxNAm+SgantNmo1j0eB2wCz4q7YKUf9wrXJrirUCnOz4HW9v0x
 S8KvrcTDLJjF9dCUZNqrIFGsnxHEWc/KjfkZtGkxWD330qa3hNPBboGQs7F0wgABOjRYpn
 EvswDf6MjyqKPPuyQQtMdPkWRjDuJmYckPciShaCbqWhb4HWuGTCYfzcp4XRhA==
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
Date: Wed,  8 Feb 2023 17:42:01 +0100
Message-Id: <20230208164203.378153-5-clement.leger@bootlin.com>
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
Subject: [Linux-stm32] [PATCH net-next v2 4/6] dt-bindings: net: renesas,
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
MDAwMDAwMDAwMDAuLjk0NGZkMGQ5N2Q3OQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRp
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
ICAtIHJlbmVzYXMscjlhMDZnMDMyLWdtYWMKKyAgICAgICAgICAtIHJlbmVzYXMscnpuMS1nbWFj
CisgICAgICAgICAgLSBzbnBzLGR3bWFjCisKKyAgcGNzLWhhbmRsZToKKyAgICBkZXNjcmlwdGlv
bjoKKyAgICAgIHBoYW5kbGUgcG9pbnRpbmcgdG8gYSBQQ1Mgc3ViLW5vZGUgY29tcGF0aWJsZSB3
aXRoCisgICAgICByZW5lc2FzLHJ6bjEtbWlpYy55YW1sIworICAgICRyZWY6IC9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUKKworcmVxdWlyZWQ6CisgIC0gY29tcGF0aWJs
ZQorCit1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAtIHwKKyAg
ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svcjlhMDZnMDMyLXN5c2N0cmwuaD4KKyAgICAj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgorCisg
ICAgZXRoZXJuZXRANDQwMDAwMDAgeworICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJ6bjEt
Z21hYyI7CisgICAgICByZWcgPSA8MHg0NDAwMDAwMCAweDIwMDA+OworICAgICAgaW50ZXJydXB0
LXBhcmVudCA9IDwmZ2ljPjsKKyAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAzNCBJUlFfVFlQ
RV9MRVZFTF9ISUdIPiwKKyAgICAgICAgICAgICA8R0lDX1NQSSAzNiBJUlFfVFlQRV9MRVZFTF9I
SUdIPiwKKyAgICAgICAgICAgICA8R0lDX1NQSSAzNSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKyAg
ICAgIGludGVycnVwdC1uYW1lcyA9ICJtYWNpcnEiLCAiZXRoX3dha2VfaXJxIiwgImV0aF9scGki
OworICAgICAgY2xvY2stbmFtZXMgPSAic3RtbWFjZXRoIjsKKyAgICAgIGNsb2NrcyA9IDwmc3lz
Y3RybCBSOUEwNkcwMzJfSENMS19HTUFDMD47CisgICAgICBzbnBzLG11bHRpY2FzdC1maWx0ZXIt
YmlucyA9IDwyNTY+OworICAgICAgc25wcyxwZXJmZWN0LWZpbHRlci1lbnRyaWVzID0gPDEyOD47
CisgICAgICB0eC1maWZvLWRlcHRoID0gPDIwNDg+OworICAgICAgcngtZmlmby1kZXB0aCA9IDw0
MDk2PjsKKyAgICAgIHBjcy1oYW5kbGUgPSA8Jm1paV9jb252MT47CisgICAgICBwaHktbW9kZSA9
ICJtaWkiOworICAgIH07CisKKy4uLgotLSAKMi4zOS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
