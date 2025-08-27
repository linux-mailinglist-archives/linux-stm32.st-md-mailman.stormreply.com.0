Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C476B37AC8
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Aug 2025 08:51:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A319DC349C5;
	Wed, 27 Aug 2025 06:51:30 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A268C349C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Aug 2025 06:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=6n/bITa6vrmP6YxQjYpYAvl0pURUaNYm8xkK9JCAWa8=; b=noD4En545Nt/MdX0PP6isfTCIm
 nzzsDKAnZVdX0JQAaI/cY0hmmj4qQ34OFnMnfj7gzvR749DUPsZVAeEENOUrNf8dKgsSdc1dL40yU
 +d0TrjSv0RRgNY4vGdZsMDDw25760fIzo77/LhnS574eAc0b5k+ORFfbAiN0RQPdenFMW+P8Z1X9w
 5GFOcifgnTV1kJ/hZzz9Wlnp5vsuXy09PlBO/bUJw83SEhZ8NgZ7fQnv+H1Wb5sUceVheNheVV1RY
 MjHOsf+fHlCaRlT+ByUybYdRFVjjL0KSbnpcQBFbT7Qz3xhL8DPpssadKJbxiZpdtux/aYJKbb+4B
 VxCNnEnw==;
Received: from [213.244.170.152] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1ur9ze-0005xU-Cd; Wed, 27 Aug 2025 08:50:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 27 Aug 2025 08:50:49 +0200
Message-ID: <9063025.MhkbZ0Pkbq@phil>
In-Reply-To: <20250825-byeword-update-v3-1-947b841cdb29@collabora.com>
References: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
 <20250825-byeword-update-v3-1-947b841cdb29@collabora.com>
MIME-Version: 1.0
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] Re: [PATCH v3 01/20] bitmap: introduce
	hardware-specific bitfield operations
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

QW0gTW9udGFnLCAyNS4gQXVndXN0IDIwMjUsIDEwOjI4OjIxIE1pdHRlbGV1cm9ww6Rpc2NoZSBT
b21tZXJ6ZWl0IHNjaHJpZWIgTmljb2xhcyBGcmF0dGFyb2xpOgo+IEhhcmR3YXJlIG9mIHZhcmlv
dXMgdmVuZG9ycywgYnV0IHZlcnkgbm90YWJseSBSb2NrY2hpcCwgb2Z0ZW4gdXNlcwo+IDMyLWJp
dCByZWdpc3RlcnMgd2hlcmUgdGhlIHVwcGVyIDE2LWJpdCBoYWxmIG9mIHRoZSByZWdpc3RlciBp
cyBhCj4gd3JpdGUtZW5hYmxlIG1hc2sgZm9yIHRoZSBsb3dlciBoYWxmLgo+IAo+IFRoaXMgdHlw
ZSBvZiBoYXJkd2FyZSBzZXR1cCBhbGxvd3MgZm9yIG1vcmUgZ3JhbnVsYXIgY29uY3VycmVudCBy
ZWdpc3Rlcgo+IHdyaXRlIGFjY2Vzcy4KPiAKPiBPdmVyIHRoZSB5ZWFycywgbWFueSBkcml2ZXJz
IGhhdmUgaGFuZC1yb2xsZWQgdGhlaXIgb3duIHZlcnNpb24gb2YgdGhpcwo+IG1hY3JvLCB1c3Vh
bGx5IHdpdGhvdXQgYW55IGNoZWNrcywgb2Z0ZW4gY2FsbGVkIHNvbWV0aGluZyBsaWtlCj4gSElX
T1JEX1VQREFURSBvciBGSUVMRF9QUkVQX0hJV09SRCwgY29tbW9ubHkgd2l0aCBzbGlnaHRseSBk
aWZmZXJlbnQKPiBzZW1hbnRpY3MgYmV0d2VlbiB0aGVtLgo+IAo+IENsZWFybHkgdGhlcmUgaXMg
YSBkZW1hbmQgZm9yIHN1Y2ggYSBtYWNybywgYW5kIHRodXMgdGhlIGRlbWFuZCBzaG91bGQKPiBi
ZSBzYXRpc2ZpZWQgaW4gYSBjb21tb24gaGVhZGVyIGZpbGUuIEFzIHRoaXMgaXMgYSBjb252ZW50
aW9uIHRoYXQgc3BhbnMKPiBhY3Jvc3MgbXVsdGlwbGUgdmVuZG9ycywgYW5kIHNpbWlsYXIgY29u
dmVudGlvbnMgbWF5IGFsc28gaGF2ZQo+IGNyb3NzLXZlbmRvciBhZG9wdGlvbiwgaXQncyBiZXN0
IGlmIGl0IGxpdmVzIGluIGEgdmVuZG9yLWFnbm9zdGljIGhlYWRlcgo+IGZpbGUgdGhhdCBjYW4g
YmUgZXhwYW5kZWQgb3ZlciB0aW1lLgo+IAo+IEFkZCBod19iaXRmaWVsZC5oIHdpdGggdHdvIG1h
Y3JvczogRklFTERfUFJFUF9XTTE2LCBhbmQKPiBGSUVMRF9QUkVQX1dNMTZfQ09OU1QuIFRoZSBs
YXR0ZXIgaXMgYSB2ZXJzaW9uIHRoYXQgY2FuIGJlIHVzZWQgaW4KPiBpbml0aWFsaXplcnMsIGxp
a2UgRklFTERfUFJFUF9DT05TVC4KPiAKPiBTdWdnZXN0ZWQtYnk6IFl1cnkgTm9yb3YgW05WSURJ
QV0gPHl1cnkubm9yb3ZAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE5pY29sYXMgRnJhdHRh
cm9saSA8bmljb2xhcy5mcmF0dGFyb2xpQGNvbGxhYm9yYS5jb20+CgpBY2tlZC1ieTogSGVpa28g
U3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
