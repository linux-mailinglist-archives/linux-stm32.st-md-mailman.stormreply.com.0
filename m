Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 525119C2E1C
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Nov 2024 16:18:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07F1AC6DD9D;
	Sat,  9 Nov 2024 15:18:04 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1AFBC6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Nov 2024 15:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731165479;
 bh=eLx0mv3l0t8dDseyOxotcA8WePZEOhSvmmm8Mnw0iNE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qJ8ZKYZxmmnZiHe56sAIWXftljzD5x88KjNm1b6nES+TogWK5noUiQlOYrahcvqXq
 Gau64MLdkhHL72g393CjhbW7MNNS92Orb+VVOqCCqQWloVsvOELuLE5nBzkoPzr2qj
 PyD7ocZ2CGbkiulK2TKgw7Ny3xwBcwW47DcXGpECHdri+0CJPMl7LCjlljMmhFvNEo
 zP58izllyVEQnKXl0mf4eKqCPAlhC/ROIvJJy2LkhHLfhHlGjR1VTmgioKQnW8y++W
 YQwPCNTOoN9yxWoMNipCtzM7nFDnBTCdUl1DDaqGBeAa/cK9fN2KMjXGsA/lWWRwHP
 8y4/ir22ssN5g==
Received: from [192.168.1.63] (pool-100-2-116-133.nycmny.fios.verizon.net
 [100.2.116.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C05117E3696;
 Sat,  9 Nov 2024 16:17:56 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Sat, 09 Nov 2024 10:16:32 -0500
MIME-Version: 1.0
Message-Id: <20241109-mediatek-mac-wol-noninverted-v2-1-0e264e213878@collabora.com>
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
Subject: [Linux-stm32] [PATCH v2 1/2] net: stmmac: dwmac-mediatek: Fix
 inverted handling of mediatek, mac-wol
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

VGhlIG1lZGlhdGVrLG1hYy13b2wgcHJvcGVydHkgaXMgYmVpbmcgaGFuZGxlZCBiYWNrd2FyZHMg
dG8gd2hhdCBpcwpkZXNjcmliZWQgaW4gdGhlIGJpbmRpbmc6IGl0IGN1cnJlbnRseSBlbmFibGVz
IFBIWSBXT0wgd2hlbiB0aGUgcHJvcGVydHkKaXMgcHJlc2VudCBhbmQgdmljZSB2ZXJzYS4gSW52
ZXJ0IHRoZSBkcml2ZXIgbG9naWMgc28gaXQgbWF0Y2hlcyB0aGUKYmluZGluZyBkZXNjcmlwdGlv
bi4KCkZpeGVzOiBmZDFkNjJkODBlYmMgKCJuZXQ6IHN0bW1hYzogcmVwbGFjZSB0aGUgdXNlX3Bo
eV93b2wgZmllbGQgd2l0aCBhIGZsYWciKQpTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBB
LiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Ci0tLQogZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbWVkaWF0ZWsuYyB8IDQgKystLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1tZWRpYXRlay5jIGIvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbWVkaWF0ZWsuYwppbmRleCBmOGNhODE2
NzU0MDdhZGU3ODZmMmI5YTM4YzYzNTExYTBiN2ZiNzA1Li5jOTYzNjgzMmE1NzBhMjExYTUzZjk0
ODBiMGE4YWVjNTY1MDkxOTlmIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1tZWRpYXRlay5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL2R3bWFjLW1lZGlhdGVrLmMKQEAgLTU4OSw5ICs1ODksOSBAQCBzdGF0aWMg
aW50IG1lZGlhdGVrX2R3bWFjX2NvbW1vbl9kYXRhKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYsCiAKIAlwbGF0LT5tYWNfaW50ZXJmYWNlID0gcHJpdl9wbGF0LT5waHlfbW9kZTsKIAlpZiAo
cHJpdl9wbGF0LT5tYWNfd29sKQotCQlwbGF0LT5mbGFncyB8PSBTVE1NQUNfRkxBR19VU0VfUEhZ
X1dPTDsKLQllbHNlCiAJCXBsYXQtPmZsYWdzICY9IH5TVE1NQUNfRkxBR19VU0VfUEhZX1dPTDsK
KwllbHNlCisJCXBsYXQtPmZsYWdzIHw9IFNUTU1BQ19GTEFHX1VTRV9QSFlfV09MOwogCXBsYXQt
PnJpd3Rfb2ZmID0gMTsKIAlwbGF0LT5tYXhtdHUgPSBFVEhfREFUQV9MRU47CiAJcGxhdC0+aG9z
dF9kbWFfd2lkdGggPSBwcml2X3BsYXQtPnZhcmlhbnQtPmRtYV9iaXRfbWFzazsKCi0tIAoyLjQ3
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
