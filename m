Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5CFB37BA8
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Aug 2025 09:28:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4BB7C3F957;
	Wed, 27 Aug 2025 07:28:13 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51B5FC3F956
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Aug 2025 07:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=EZOJWExa5qLVEsPq3j8HydiA2WaZ9eh1caYD7hcSf6o=; b=KerKK3pP0fv1hWcFkf5UpwwS+n
 DyQX+x1U4BG5PeUL9KWfsYEO6fuQjo/YxabrfldV/H3A2mt8I4eYKIuyAC4eO0xkUkBGwK0VGv585
 VfJseMvGcO2e0TjLYtji/No56lZU93TOZXLeXSjv8Y++0qW918oMas8lhpPQD0C6XgSVBfexzDiNc
 l6T0oulWEpXVtAplOBjGdeI/zsh+6p/65C4UrnexkWP8Mc8GzNrDa8PD1xre5axw3aDFwjsQA9Y+7
 /KGjGCtsHQtDf3+4RYdeIMp8KrYdqiy6Qj4EC3hgFn8uTgVZLt3JaBYS1DsW9MKByBNdqENelR31X
 kzLC0Vuw==;
Received: from [213.244.170.152] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1urAXL-0000X5-Vt; Wed, 27 Aug 2025 09:25:40 +0200
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
Date: Wed, 27 Aug 2025 09:25:38 +0200
Message-ID: <5502100.jE0xQCEvom@phil>
In-Reply-To: <20250825-byeword-update-v3-9-947b841cdb29@collabora.com>
References: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
 <20250825-byeword-update-v3-9-947b841cdb29@collabora.com>
MIME-Version: 1.0
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] Re: [PATCH v3 09/20] phy: rockchip-samsung-dcphy:
 switch to FIELD_PREP_WM16 macro
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

QW0gTW9udGFnLCAyNS4gQXVndXN0IDIwMjUsIDEwOjI4OjI5IE1pdHRlbGV1cm9ww6Rpc2NoZSBT
b21tZXJ6ZWl0IHNjaHJpZWIgTmljb2xhcyBGcmF0dGFyb2xpOgo+IFRoZSBlcmEgb2YgaGFuZC1y
b2xsZWQgSElXT1JEX1VQREFURSBtYWNyb3MgaXMgb3ZlciwgYXQgbGVhc3QgZm9yIHRob3NlCj4g
ZHJpdmVycyB0aGF0IHVzZSBjb25zdGFudCBtYXNrcy4KPiAKPiBwaHktcm9ja2NoaXAtc2Ftc3Vu
Zy1kY3BoeSBpcyBhY3R1YWxseSBhbiBleGVtcGxhcnkgZXhhbXBsZSwgd2hlcmUgdGhlCj4gc2lt
aWxhcml0aWVzIHRvIEZJRUxEX1BSRVAgd2VyZSBzcG90dGVkIGFuZCB0aGUgZHJpdmVyIGxvY2Fs
IG1hY3JvIGhhcwo+IHRoZSBzYW1lIHNlbWFudGljcyBhcyB0aGUgbmV3IEZJRUxEX1BSRVBfV00x
NiBod19iaXRmaWVsZC5oIG1hY3JvLgo+IAo+IFN0aWxsLCBnZXQgcmlkIG9mIEZJRUxEX1BSRVBf
SElXT1JEIG5vdyB0aGF0IGEgc2hhcmVkIGltcGxlbWVudGF0aW9uCj4gZXhpc3RzLCByZXBsYWNp
bmcgdGhlIHR3byBpbnN0YW5jZXMgb2YgaXQgd2l0aCBGSUVMRF9QUkVQX1dNMTYuIFRoaXMKPiBn
aXZlcyB1cyBzbGlnaHRseSBiZXR0ZXIgZXJyb3IgY2hlY2tpbmc7IHRoZSB2YWx1ZSBpcyBub3cg
Y2hlY2tlZCB0byBmaXQKPiBpbiAxNiBiaXRzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE5pY29sYXMg
RnJhdHRhcm9saSA8bmljb2xhcy5mcmF0dGFyb2xpQGNvbGxhYm9yYS5jb20+CgpSZXZpZXdlZC1i
eTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
