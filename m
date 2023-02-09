Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A00690C8F
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Feb 2023 16:14:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21C5EC6A5E9;
	Thu,  9 Feb 2023 15:14:17 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90EBAC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Feb 2023 15:14:15 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5DDF2100004;
 Thu,  9 Feb 2023 15:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1675955654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YVOvYQa9qOIWTUDpJqNiGlDU/+I5voPK1qjEvEaieaY=;
 b=Y7+wp6Xw0fNNsld9rdLaqiHWFAYyK3efTcjSVW0j0yaKHFk0EUmpSzre8SqIgEh+tj1fkn
 l/v9rbwzPUv6+Gxtgim0bKbjjnIh5RVRU1E8kJeg8f4wrieipoJ75fp8bn9vsB0yIDELL2
 I71Vqc9nU5nT1l+XCNJp9aWBhsSlqJLr6yyaLKQLP4YeA4TyfFZDuyQUuP9xCAjyJyRNyB
 j2Mn0YerZl36xgXbgHPKAgfbYO7BxvSyWfQ+z5aPbqIvHzV1LKOyQTAc0Xaxm+HUJzW/sw
 QXbzZYm/3yGpm1l7rz4cFRQotcY6+TuxU8VGDMH9HMXKFRXvngjvcvLMexvjrA==
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
Date: Thu,  9 Feb 2023 16:16:26 +0100
Message-Id: <20230209151632.275883-1-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.39.0
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
Subject: [Linux-stm32] [PATCH net-next v3 0/6] net: stmmac: add renesas,
	rzn1-gmac support
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

VGhlIHJ6bjEtZ21hYyBpbnN0YW5jZSBpcyBjb25uZWN0ZWQgdG8gYSBQQ1MgKE1JSUMpLiBJbiBv
cmRlciB0byB1c2UKdGhpcyBwY3MsIGFkZCBzdXBwb3J0IGluIHRoZSBzdHRtYWMgZHJpdmVyIHRv
IHNldCBhIGdlbmVyaWMgcGh5bGluayBwY3MKZGV2aWNlIGluc3RlYWQgb2YgdGhlIHhwY3Mgb25s
eS4gTW9yZW92ZXIsIGl0IGFkZHMgc3VwcG9ydCB0byBwcm92aWRlCmEgcGh5bGluayBwY3MgZGV2
aWNlIGZyb20gdGhlIHN0bW1hYyBwbGF0Zm9ybSBkYXRhIGFuZCB1c2UgaXQgd2l0aCB0aGUKZHJp
dmVyLiBJdCBhbHNvIGFkZHMgdGhlIGJpbmRpbmdzIGFuZCB0aGUgbmV3IHJ6bjEtZ21hYyBkcml2
ZXIgdGhhdApyZXRyaWV2ZSB0aGlzIHBjcyBmcm9tIHRoZSBkZXZpY2UtdHJlZS4KCi0tLQpWMzoK
IC0gU29ydCBvdXQgdGhlIGJpbmRpbmdzIGNvbXBhdGlibGUKClYyOgogLSBSZW1vdmUgcGF0Y2gg
dGhhdCBtb3ZlcyBwaHlsaW5rX3N0YXJ0KCkgZWFybGllciBpbiBpbml0CiAtIEFkZCBtaWljX2Vh
cmx5X3FzZXR1cCgpICB3aGljaCBhbGxvd3MgaW5pdGlhbGl6aW5nIHNvbWUgbWlpYyBwb3J0CiAg
IGVhcmxpZXIgdG8gcHJvdmlkZSBhIFJYIGNsb2NrIHRvIHN0bW1hYyBJUAogLSBDYWxsIG1paWNf
ZWFybHlfc2V0dXAoKSBpbiByem4xIHN0bW1hYyBkcml2ZXIKIC0gRml4IGJpbmRpbmdzCgpDbMOp
bWVudCBMw6lnZXIgKDYpOgogIG5ldDogcGNzOiByem4xLW1paWM6IGFkZCBwY3NfZWFybHlfc2V0
dXAoKSBmdW5jdGlvbgogIG5ldDogc3RtbWFjOiBhZGQgc3VwcG9ydCB0byB1c2UgYSBnZW5lcmlj
IHBoeWxpbmtfcGNzIGFzIFBDUwogIG5ldDogc3RtbWFjOiBhZGQgc3VwcG9ydCB0byBwcm92aWRl
IHBjcyBmcm9tIHBsYXRmb3JtIGRhdGEKICBkdC1iaW5kaW5nczogbmV0OiByZW5lc2FzLHJ6bjEt
Z21hYzogRG9jdW1lbnQgUlovTjEgR01BQyBzdXBwb3J0CiAgbmV0OiBzdG1tYWM6IGFkZCBzdXBw
b3J0IGZvciBSWi9OMSBHTUFDCiAgQVJNOiBkdHM6IHI5YTA2ZzAzMjogZGVzY3JpYmUgR01BQzEK
CiAuLi4vYmluZGluZ3MvbmV0L3JlbmVzYXMscnpuMS1nbWFjLnlhbWwgICAgICAgfCAgNjcgKysr
KysrKysrKwogYXJjaC9hcm0vYm9vdC9kdHMvcjlhMDZnMDMyLmR0c2kgICAgICAgICAgICAgIHwg
IDE4ICsrKwogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvS2NvbmZpZyAgIHwg
IDExICsrCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9NYWtlZmlsZSAgfCAg
IDEgKwogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvY29tbW9uLmggIHwgICAy
ICsKIC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcnpuMS5jICB8IDEyMCAr
KysrKysrKysrKysrKysrKysKIC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFj
X21haW4uYyB8ICAgOCArLQogLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNf
bWRpby5jIHwgICAxICsKIGRyaXZlcnMvbmV0L3Bjcy9wY3MtcnpuMS1taWljLmMgICAgICAgICAg
ICAgICB8ICAxMiArKwogaW5jbHVkZS9saW51eC9wY3MtcnpuMS1taWljLmggICAgICAgICAgICAg
ICAgIHwgICAzICsKIGluY2x1ZGUvbGludXgvc3RtbWFjLmggICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMSArCiAxMSBmaWxlcyBjaGFuZ2VkLCAyNDAgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbmV0L3JlbmVzYXMscnpuMS1nbWFjLnlhbWwKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yem4xLmMKCi0tIAoyLjM5LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
