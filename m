Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90320B37C95
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Aug 2025 09:58:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 547BCC3F958;
	Wed, 27 Aug 2025 07:58:34 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D44B8C3F957
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Aug 2025 07:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=uJQ6mSMA7ygeA5oFmyppBb4E1ANB4bt0CH+tDHmNVhk=; b=wx3V3gZxVatzbagZOgxagDXMFS
 DbqD+upnRWY4VW0FHtPO/Ndv+DXLpODD94PrK/9DLjH8vLBGEQ3OLMT/aUxW6ZqLmjqOwg1fxqwox
 vjq06D2iO4V/KKRRgEVqhUMfuZMhlWKgZwrvAL+8D9VC6XyhW3OxzYtz5kMWvK3+YkiKP17ZKoAN1
 PsU3gG2oT3sat8dFVC5XO7K7upNYFqUzfRPGrWQ5yhelFaccH7Bvp49FQAWHq3CHwUYVgTZkUjkGG
 +Plafk3ayemfPfDEvLfUCRGu5WAwmPASOTC1Yn6OUQirf5YAacGQsQfmRs3mo0NXYTjXfS98Lf962
 +1H2LB/g==;
Received: from [213.244.170.152] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1urB2j-0003FB-Nv; Wed, 27 Aug 2025 09:58:05 +0200
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
Date: Wed, 27 Aug 2025 09:58:04 +0200
Message-ID: <5730130.X9hSmTKtgW@phil>
In-Reply-To: <20250825-byeword-update-v3-17-947b841cdb29@collabora.com>
References: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
 <20250825-byeword-update-v3-17-947b841cdb29@collabora.com>
MIME-Version: 1.0
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] Re: [PATCH v3 17/20] PCI: dw-rockchip: Switch to
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

QW0gTW9udGFnLCAyNS4gQXVndXN0IDIwMjUsIDEwOjI4OjM3IE1pdHRlbGV1cm9ww6Rpc2NoZSBT
b21tZXJ6ZWl0IHNjaHJpZWIgTmljb2xhcyBGcmF0dGFyb2xpOgo+IFRoZSBlcmEgb2YgaGFuZC1y
b2xsZWQgSElXT1JEX1VQREFURSBtYWNyb3MgaXMgb3Zlci4KPiAKPiBMaWtlIG1hbnkgb3RoZXIg
Um9ja2NoaXAgZHJpdmVycywgcGNpZS1kdy1yb2NrY2hpcCBicmluZ3Mgd2l0aCBpdCBpdHMKPiB2
ZXJ5IG93biBmbGF2b3VyIG9mIEhJV09SRF9VUERBVEUuIEl0J3Mgb2NjYXNpb25hbGx5IHVzZWQg
d2l0aG91dCBhCj4gY29uc3RhbnQgbWFzaywgd2hpY2ggY29tcGxpY2F0ZXMgbWF0dGVycy4gSElX
T1JEX1VQREFURV9CSVQgaXMgYQo+IGNvbmZ1c2luZ2x5IG5hbWVkIGFkZGl0aW9uLCBhcyBpdCBk
b2Vzbid0IHVwZGF0ZSB0aGUgYml0LCBpdCBhY3R1YWxseQo+IHNldHMgYWxsIGJpdHMgaW4gdGhl
IHZhbHVlIHRvIDEuIEhJV09SRF9ESVNBQkxFX0JJVCBpcyBzaW1pbGFybHkKPiBjb25mdXNpbmc7
IGl0IGRpc2FibGVzIHNldmVyYWwgYml0cyBhdCBvbmNlIGJ5IHVzaW5nIHRoZSB2YWx1ZSBhcyBh
IG1hc2sKPiBhbmQgdGhlIGludmVyc2Ugb2YgdmFsdWUgYXMgdGhlIHZhbHVlLCBhbmQgdGhlICJk
aXNhYmxpbmcgb25seSB0aGVzZSIKPiBlZmZlY3QgY29tZXMgZnJvbSB0aGUgaGFyZHdhcmUgYWN0
dWFsbHkgdXNpbmcgdGhlIG1hc2suIFRoZSBtb3JlIG9idmlvdXMKPiBhcHByb2FjaCB3b3VsZCd2
ZSBiZWVuIEhJV09SRF9VUERBVEUodmFsLCAwKSBpbiBteSBvcGluaW9uLgo+IAo+IFRoaXMgaXMg
cGFydCBvZiB0aGUgbW90aXZhdGlvbiB3aHkgdGhpcyBwYXRjaCB1c2VzIGh3X2JpdGZpZWxkLmgn
cwo+IEZJRUxEX1BSRVBfV00xNiBpbnN0ZWFkLCB3aGVyZSBwb3NzaWJsZS4gRklFTERfUFJFUF9X
TTE2IHJlcXVpcmVzIGEKPiBjb25zdGFudCBiaXQgbWFzaywgd2hpY2ggaXNuJ3QgcG9zc2libGUg
d2hlcmUgdGhlIGlycSBudW1iZXIgaXMgdXNlZCB0bwo+IGdlbmVyYXRlIGEgYml0IG1hc2suIEZv
ciB0aGF0IHB1cnBvc2UsIHdlIHJlcGxhY2UgaXQgd2l0aCBhIG1vcmUgcm9idXN0Cj4gbWFjcm8g
dGhhbiB3aGF0IHdhcyB0aGVyZSBidXQgdGhhdCBzaG91bGQgYWxzbyBicmluZyBjbG9zZSB0byB6
ZXJvCj4gcnVudGltZSBvdmVyaGVhZDogd2UgYWN0dWFsbHkgbWFzayB0aGUgSVJRIG51bWJlciB0
byBtYWtlIHN1cmUgd2UncmUgbm90Cj4gd3JpdGluZyBnYXJiYWdlLgo+IAo+IEZvciB0aGUgcmVt
YWluaW5nIGJpdHMsIHRoZXJlIGFsc28gYXJlIHNvbWUgY2F2ZWF0cy4gRm9yIHN0YXJ0ZXJzLCB0
aGUKPiBQQ0lFX0NMSUVOVF9FTkFCTEVfTFRTU00gYW5kIFBDSUVfQ0xJRU5UX0RJU0FCTEVfTFRT
U00gd2VyZSBuYW1lZCBpbiBhCj4gbWFubmVyIHRoYXQgaXNuJ3QgcXVpdGUgdHJ1dGhmdWwgdG8g
d2hhdCB0aGV5IGRvLiBUaGVpciBtb2RpZmljYXRpb24KPiBhY3R1YWxseSBzcGFucyBub3QganVz
dCB0aGUgTFRTU00gYml0IGJ1dCBhbHNvIGFub3RoZXIgYml0LCBmbGlwcGluZwo+IG9ubHkgdGhl
IExUU1NNIG9uZSwgYnV0IGtlZXBpbmcgdGhlIG90aGVyICh3aGljaCBhY2NvcmRpbmcgdG8gdGhl
IFRSTQo+IGhhcyBhIHJlc2V0IHZhbHVlIG9mIDApIGFsd2F5cyBlbmFibGVkLiBUaGlzIG90aGVy
IGJpdCBpcyByZXNlcnZlZCBhcyBvZgo+IHRoZSBJUCB2ZXJzaW9uIFJLMzU4OCB1c2VzIGF0IGxl
YXN0LCBhbmQgSSBoYXZlIG15IGRvdWJ0cyBhcyB0byB3aGV0aGVyCj4gaXQgd2FzIG1lYW50IHRv
IGJlIHNldCwgYW5kIHdoZXRoZXIgaXQgd2FzIG1lYW50IHRvIGJlIHNldCBpbiB0aGF0IGNvZGUK
PiBwYXRoLiBFaXRoZXIgd2F5LCBpdCdzIGNvbmZ1c2luZy4KPiAKPiBSZXBsYWNlIGl0IHdpdGgg
anVzdCB3cml0aW5nIGVpdGhlciAxIG9yIDAgdG8gdGhlIExUU1NNIGJpdCwgdXNpbmcgdGhlCj4g
bmV3IEZJRUxEX1BSRVBfV00xNiBtYWNybyBmcm9tIGh3X2JpdGZpZWxkLmgsIHdoaWNoIGdyYW50
cyB1cyB0aGUKPiBiZW5lZml0IG9mIGJldHRlciBjb21waWxlLXRpbWUgZXJyb3IgY2hlY2tpbmcu
Cj4gCj4gVGhlIGNoYW5nZSBvZiBubyBsb25nZXIgc2V0dGluZyB0aGUgcmVzZXJ2ZWQgYml0IGRv
ZXNuJ3QgYXBwZWFyIHRvCj4gY2hhbmdlIHRoZSBiZWhhdmlvdXIgb24gUkszNTY4IGluIFJDIG1v
ZGUsIHdoZXJlIGl0J3Mgbm90IG1hcmtlZCBhcwo+IHJlc2VydmVkLgo+IAo+IFBDSUVfQ0xJRU5U
X1JDX01PREUvUENJRV9DTElFTlRfRVBfTU9ERSB3YXMgYW5vdGhlciBmaWVsZCB0aGF0IHdhc24n
dAo+IHN1cGVyIGNsZWFyIG9uIHdoYXQgdGhlIGJpdCBmaWVsZCBtb2RpZmljYXRpb24gYWN0dWFs
bHkgaXMuIEFzIGZhciBhcyBJCj4gY2FuIHRlbGwsIHN3aXRjaGluZyB0byBSQyBtb2RlIGRvZXNu
J3QgYWN0dWFsbHkgd3JpdGUgdGhlIGNvcnJlY3QgdmFsdWUKPiB0byB0aGUgZmllbGQgaWYgYW55
IG9mIGl0cyBiaXRzIGhhdmUgYmVlbiBzZXQgcHJldmlvdXNseSwgYXMgaXQgb25seQo+IHVwZGF0
ZXMgb25lIGJpdCBvZiBhIDQgYml0IGZpZWxkLgo+IAo+IFJlcGxhY2UgaXQgYnkgYWN0dWFsbHkg
d3JpdGluZyB0aGUgZnVsbCB2YWx1ZXMgdG8gdGhlIGZpZWxkLCB1c2luZyB0aGUKPiBuZXcgRklF
TERfUFJFUF9XTTE2IG1hY3JvLCB3aGljaCBncmFudHMgdXMgdGhlIGJlbmVmaXQgb2YgYmV0dGVy
Cj4gY29tcGlsZS10aW1lIGVycm9yIGNoZWNraW5nLgo+IAo+IFRoaXMgcGF0Y2ggd2FzIHRlc3Rl
ZCBvbiBSSzM1ODggKFBDSWUzIHg0IGNvbnRyb2xsZXIpLCBSSzM1NzYgKFBDSWUyIHgxCj4gY29u
dHJvbGxlcikgYW5kIFJLMzU2OCAoUENJZSB4MiBjb250cm9sbGVyKSwgYWxsIGluIFJDIG1vZGUu
Cj4gCj4gQWNrZWQtYnk6IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogTmljb2xhcyBGcmF0dGFyb2xpIDxuaWNvbGFzLmZyYXR0YXJvbGlAY29sbGFi
b3JhLmNvbT4KClJldmlld2VkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
