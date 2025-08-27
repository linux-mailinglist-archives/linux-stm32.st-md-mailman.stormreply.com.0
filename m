Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FECB37CEA
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Aug 2025 10:07:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DA15C3FADA;
	Wed, 27 Aug 2025 08:07:11 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E39DFC3FAD9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Aug 2025 08:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=nHn0/2tcQ6NKxDIG6MXiOpQl/j8R5Yoanaeftq4zEbE=; b=lpvZbN1vFE1catKAjtPmzOO25D
 zQe3EYADcLN+u+VAb4HEmMxBKY5SafJaDYo/N6TNMFuP2oZom+6QyC/AcQGjJZbELGVRCEqd3EteB
 Fb13EBgEXMvzyuuYrFYrMfeYHRByJKSbUcvu3E66udd77HpJJotr8ch5V7KlYoSDEMMaTt98Gcnvd
 Wa3nuIX7IzNZjVImMGkSlLN4d6L623lauFYlOX5VWScp13JJTS9jUan+msw/NJB5G0gmicI7Kd3F9
 PhjF5C7+pBOZ2eafUWP7tC5PQRvDdbAh3Cp2DSoY0CmCakj8e/QkSktaIWTntJgsOAU9qJ6LDboUR
 m1ZKL4hQ==;
Received: from [213.244.170.152] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1urBB2-0000Hv-Tf; Wed, 27 Aug 2025 10:06:40 +0200
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
Date: Wed, 27 Aug 2025 10:06:39 +0200
Message-ID: <5154190.bB369e8A3T@phil>
In-Reply-To: <20250825-byeword-update-v3-19-947b841cdb29@collabora.com>
References: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
 <20250825-byeword-update-v3-19-947b841cdb29@collabora.com>
MIME-Version: 1.0
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 19/20] clk: sp7021: switch to
	FIELD_PREP_WM16 macro
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

QW0gTW9udGFnLCAyNS4gQXVndXN0IDIwMjUsIDEwOjI4OjM5IE1pdHRlbGV1cm9ww6Rpc2NoZSBT
b21tZXJ6ZWl0IHNjaHJpZWIgTmljb2xhcyBGcmF0dGFyb2xpOgo+IFRoZSBzcDcwMjEgY2xvY2sg
ZHJpdmVyIGhhcyBpdHMgb3duIHNoaWZ0ZWQgaGlnaCB3b3JkIG1hc2sgbWFjcm8sCj4gc2ltaWxh
ciB0byB0aGUgb25lcyBtYW55IFJvY2tjaGlwIGRyaXZlcnMgaGF2ZS4KPiAKPiBSZW1vdmUgaXQs
IGFuZCByZXBsYWNlIGluc3RhbmNlcyBvZiBpdCB3aXRoIGh3X2JpdGZpZWxkLmgncwo+IEZJRUxE
X1BSRVBfV00xNiBtYWNybywgd2hpY2ggZG9lcyB0aGUgc2FtZSB0aGluZyBleGNlcHQgaW4gYSBj
b21tb24KPiBtYWNybyB0aGF0IGFsc28gZG9lcyBjb21waWxlLXRpbWUgZXJyb3IgY2hlY2tpbmcu
Cj4gCj4gVGhpcyB3YXMgY29tcGlsZS10ZXN0ZWQgd2l0aCAzMi1iaXQgQVJNIHdpdGggQ2xhbmcs
IG5vIHJ1bnRpbWUgdGVzdHMKPiB3ZXJlIHBlcmZvcm1lZCBhcyBJIGxhY2sgdGhlIGhhcmR3YXJl
LiBIb3dldmVyLCBJIHZlcmlmaWVkIHRoYXQgZml4Cj4gY29tbWl0IDVjNjY3ZDVhNWEzZSAoImNs
azogc3A3MDIxOiBBZGp1c3Qgd2lkdGggb2YgX20gaW4gSFdNX0ZJRUxEX1BSRVAoKSIpCj4gaXMg
bm90IHJlZ3Jlc3NlZC4gTm8gd2FybmluZyBpcyBwcm9kdWNlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBOaWNvbGFzIEZyYXR0YXJvbGkgPG5pY29sYXMuZnJhdHRhcm9saUBjb2xsYWJvcmEuY29tPgoK
V2hpbGUgSSBoYXZlIG5vIGNvbm5lY3Rpb24gd2l0aCB0aGF0IHNwZWNpZmljIHBpZWNlIG9mIGhh
cmR3YXJlLAp0aGUgY2hhbmdlIGl0c2VsZiBsb29rcyBjb3JyZWN0LCBzbwoKUmV2aWV3ZWQtYnk6
IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
