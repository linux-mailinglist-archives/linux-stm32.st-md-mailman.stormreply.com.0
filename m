Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DA49FAD6E
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Dec 2024 12:07:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54781C78F67;
	Mon, 23 Dec 2024 11:07:01 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9193C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Dec 2024 11:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734952013;
 bh=uAlo+ULnWIqf2cgYUKQAKueI8CJurgRHKq0A+C/3s9Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=d2zfIiW8g5ELhktY/4rR2tCQf6VaZRSJfHPzLl5tE5D3Frym7FD3B29n7ZITHh7A+
 lTcXaAlCHlYtD2aQOCtBMln7AGGyYvDhKBzK9ziApJTulk043ash0OyhooayOU0wUD
 QzZEPMdMO7z9VywpZA6CEMiwvyYZI+HnHbXiXX9jp0eyBRfv/UoEzfi5OCnymIZCf7
 pYJM8gDAWJMJVdw7lSWauAv1yTjhVHtZ7eRDNrHLvVBHQTwJlyTVDET4qrupKU2pPl
 lLyig2oxxfyNccj+qfOvsvPcsPjDnujK7SKVWFHtgMzauLgX1VCqxFUZcuIPnuTKS5
 SyL7kwWKJXYog==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 07B7917E362C;
 Mon, 23 Dec 2024 12:06:51 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Andrew Halaney <ahalaney@redhat.com>, Simon Horman <horms@kernel.org>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
In-Reply-To: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
References: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
Message-Id: <173495201194.34262.3657458124783082964.b4-ty@collabora.com>
Date: Mon, 23 Dec 2024 12:06:51 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH v2 0/2] net: stmmac:
 dwmac-mediatek: Fix inverted logic for mediatek, mac-wol
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

T24gU2F0LCAwOSBOb3YgMjAyNCAxMDoxNjozMSAtMDUwMCwgTsOtY29sYXMgRi4gUi4gQS4gUHJh
ZG8gd3JvdGU6Cj4gVGhpcyBzZXJpZXMgZml4ZXMgdGhlIGludmVydGVkIGhhbmRsaW5nIG9mIHRo
ZSBtZWRpYXRlayxtYWMtd29sIERUCj4gcHJvcGVydHkuIFRoaXMgd2FzIGRvbmUgd2l0aCBiYWNr
d2FyZHMgY29tcGF0aWJpbGl0eSBpbiB2MSwgYnV0IGJhc2VkIG9uCj4gdGhlIGZlZWRiYWNrIHJl
Y2VpdmVkLCBhbGwgYm9hcmRzIHNob3VsZCBiZSB1c2luZyBNQUMgV09MLCBzbyBtYW55IG9mCj4g
dGhlbSB3ZXJlIGluY29ycmVjdGx5IGRlc2NyaWJlZCBhbmQgZGlkbid0IGhhdmUgd29ya2luZyBX
T0wgdGVzdGVkCj4gYW55d2F5LiBTbyBmb3IgdjIsIHRoZSBhcHByb2FjaCBpcyBzaW1wbGVyOiBq
dXN0IGZpeCB0aGUgZHJpdmVyIGhhbmRsaW5nCj4gYW5kIHVwZGF0ZSB0aGUgRFRzIHRvIGVuYWJs
ZSBNQUMgV09MIGV2ZXJ5d2hlcmUuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gdjYuMTMtbmV4dC9k
dHM2NCwgdGhhbmtzIQoKWzIvMl0gYXJtNjQ6IGR0czogbWVkaWF0ZWs6IFNldCBtZWRpYXRlayxt
YWMtd29sIG9uIERXTUFDIG5vZGUgZm9yIGFsbCBib2FyZHMKICAgICAgY29tbWl0OiBmOGEwMzI4
MzRhYmNlZWQ5ZGIzZjIwYTVlYjU2MDY0YjIxYzg0NjEzCgpDaGVlcnMsCkFuZ2VsbwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
