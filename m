Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 706029C2E1E
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Nov 2024 16:18:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F52DC7801A;
	Sat,  9 Nov 2024 15:18:04 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C626CC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Nov 2024 15:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731165482;
 bh=VbPbfj2ctRAP7owi1u+FSVqiTAv43zAlTWjFAzykWdw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=AQuz4r6DCtf2noiphodcPsyMjNhCWHzC7OFaf3i0doW0h5QhpRcI6cL+Y2nx4lWqs
 Rvn14k7+Lw5R0yVAYo2ZGZ1QDIMwMZLxboBq7jtDCazRoUia85r/A1pm7T8tD+9uZ4
 /TCm9A4U26ctmSavimZ3TiEJ6rQLzfYZaBUtuR/CzSwG+NK6pMM0ZpHwcCXWcD5Hb6
 Tni2tec56rPYJSooYXTXc70jIAHKDXkeuAcLJEI4j/c92ztlQCIyR6kC4fH6OCkj6k
 gRbHHB+SGjVHxONCkO/rPiLLU6PkVD8mx5OzbKAMiVXIpEfgA66ZpRRBPIek4VQYXb
 Mp0cki2sj0JTA==
Received: from [192.168.1.63] (pool-100-2-116-133.nycmny.fios.verizon.net
 [100.2.116.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B06E717E36C6;
 Sat,  9 Nov 2024 16:17:59 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Sat, 09 Nov 2024 10:16:33 -0500
MIME-Version: 1.0
Message-Id: <20241109-mediatek-mac-wol-noninverted-v2-2-0e264e213878@collabora.com>
References: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
In-Reply-To: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Andrew Halaney <ahalaney@redhat.com>, Simon Horman <horms@kernel.org>
X-Mailer: b4 0.14.2
Cc: devicetree@vger.kernel.org,
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/2] arm64: dts: mediatek: Set mediatek,
 mac-wol on DWMAC node for all boards
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

RHVlIHRvIHRoZSBtZWRpYXRlayxtYWMtd29sIHByb3BlcnR5IHByZXZpb3VzbHkgYmVpbmcgaGFu
ZGxlZCBiYWNrd2FyZHMKYnkgdGhlIGR3bWFjLW1lZGlhdGVrIGRyaXZlciwgaXRzIHVzZSBpbiB0
aGUgRFRzIHNlZW1zIHRvIGhhdmUgYmVlbgppbmNvbnNpc3RlbnQuCgpOb3cgdGhhdCB0aGUgZHJp
dmVyIGhhcyBiZWVuIGZpeGVkLCBjb3JyZWN0IHRoaXMgZGVzY3JpcHRpb24uIEFsbCB0aGUKY3Vy
cmVudGx5IHVwc3RyZWFtIGJvYXJkcyBzdXBwb3J0IE1BQyBXT0wsIHNvIGFkZCB0aGUgbWVkaWF0
ZWssbWFjLXdvbApwcm9wZXJ0eSB0byB0aGUgbWlzc2luZyBvbmVzLgoKU2lnbmVkLW9mZi1ieTog
TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgotLS0KIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQyNzEyLWV2Yi5kdHMgICAgICAgICAgICAgICAg
ICAgfCAxICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTk1LWRlbW8uZHRzICAg
ICAgICAgICAgICAgICAgfCAxICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4Mzk1
LWtvbnRyb24tMy01LXNiYy1pMTIwMC5kdHMgfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDI3
MTItZXZiLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQyNzEyLWV2Yi5kdHMK
aW5kZXggYzg0YzQ3YzEzNTJmYmE0OWQyMTlmYjhhY2UxN2E3NDk1MzkyN2ZkYy4uMDQ0OTY4NmJk
MDZiYTE3YzU3OThhYWZkZmIzZmEwNzFmY2E3ZTJmMiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDI3MTItZXZiLmR0cworKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L21lZGlhdGVrL210MjcxMi1ldmIuZHRzCkBAIC0xMTUsNiArMTE1LDcgQEAgJmV0aCB7CiAJcGlu
Y3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgInNsZWVwIjsKIAlwaW5jdHJsLTAgPSA8JmV0aF9kZWZh
dWx0PjsKIAlwaW5jdHJsLTEgPSA8JmV0aF9zbGVlcD47CisJbWVkaWF0ZWssbWFjLXdvbDsKIAlz
dGF0dXMgPSAib2theSI7CiAKIAltZGlvIHsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvbXQ4MTk1LWRlbW8uZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDgxOTUtZGVtby5kdHMKaW5kZXggMzFkNDI0YjhmYzdjZWRlZjY1NDg5MzkyZWIyNzliN2Zk
MjE5NGE0YS4uYzEyNjg0ZThjNDQ5YjJkN2IzYjNhNzkwODY5MjViZmU1YWUwZDhmOCAxMDA2NDQK
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUtZGVtby5kdHMKKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUtZGVtby5kdHMKQEAgLTEwOSw2ICsx
MDksNyBAQCAmZXRoIHsKIAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAic2xlZXAiOwogCXBp
bmN0cmwtMCA9IDwmZXRoX2RlZmF1bHRfcGlucz47CiAJcGluY3RybC0xID0gPCZldGhfc2xlZXBf
cGlucz47CisJbWVkaWF0ZWssbWFjLXdvbDsKIAlzdGF0dXMgPSAib2theSI7CiAKIAltZGlvIHsK
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4Mzk1LWtvbnRyb24t
My01LXNiYy1pMTIwMC5kdHMgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODM5NS1r
b250cm9uLTMtNS1zYmMtaTEyMDAuZHRzCmluZGV4IGUyZTc1YjhmZjkxODgwNzExYzgyZjc4M2M3
Y2NiZWY0MTI4YjdhYjQuLjQ5ODViNjU5MjVhOWVkMTBhZDQ0YTZlNThiOTY1N2E5ZGQ0ODc1MWYg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4Mzk1LWtvbnRyb24t
My01LXNiYy1pMTIwMC5kdHMKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgz
OTUta29udHJvbi0zLTUtc2JjLWkxMjAwLmR0cwpAQCAtMjcxLDYgKzI3MSw3IEBAICZldGggewog
CXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJzbGVlcCI7CiAJcGluY3RybC0wID0gPCZldGhf
ZGVmYXVsdF9waW5zPjsKIAlwaW5jdHJsLTEgPSA8JmV0aF9zbGVlcF9waW5zPjsKKwltZWRpYXRl
ayxtYWMtd29sOwogCXN0YXR1cyA9ICJva2F5IjsKIAogCW1kaW8gewoKLS0gCjIuNDcuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
