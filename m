Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A640F6DD51A
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Apr 2023 10:20:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53306C62EFE;
	Tue, 11 Apr 2023 08:20:47 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0D42C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 08:20:45 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 86501C000B;
 Tue, 11 Apr 2023 08:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1681201245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5dxn4NJiE3B4l0ky6etbuCAHmNrCsdSn8aiPhVJqzK0=;
 b=ZsU8dYwTOc46TPHSbq5p16/9AQmMS/uUngPw/Ep3ffxRbxNAvDSBCBvcAy2pJthLsUo170
 Rj2p9Mc9u19gW1370eOx7JvIAabcDATJDumAn+o4DLCQe7iYje0L16LYJobe4Ma8iY4S2M
 hVT2XlKE7FDCpaVqWTtgFMG9mm77zh0cU7Io21vdLB2MKPq3F4zr/E7ECZswWoUCh/54s9
 LxOZOxezaGsD/cMwwjzDu8L5qQzOGwesAiCNFf9eRpldZFKNpdmxXMmy52npYKIeX+l3mz
 4g3Xo/1Q9fGa3R74wYDYHo17n1DEYEktLz9cH0XxSNGHCrcLqbBdY32P+qBBmQ==
Date: Tue, 11 Apr 2023 10:20:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20230411102025.6b2fdc9e@xps-13>
In-Reply-To: <20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
 <20230407101043.299f5e22@xps-13>
 <20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Valentin Korenblit <vkorenblit@sequans.com>, Lucas Stach <dev@lynxeye.de>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>, Stefan Agner <stefan@agner.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, Liang Yang <liang.yang@amlogic.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Han Xu <han.xu@nxp.com>,
 Chuanhong Guo <gch981213@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Heiko Stuebner <heiko@sntech.de>,
 Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Miaoqian Lin <linmq006@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Jack Wang <jinpu.wang@ionos.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-sunxi@lists.linux.dev,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
 Roger Quadros <rogerq@kernel.org>, Wang Weiyang <wangweiyang2@huawei.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
 Richard Weinberger <richard@nod.at>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-oxnas@groups.io,
 Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH] mtd: nand: Convert to platform remove
 callback returning void
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

SGkgVXdlLAoKdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlIHdyb3RlIG9uIFNhdCwgOCBB
cHIgMjAyMyAyMDo1MzozMiArMDIwMDoKCj4gVGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBw
bGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMKPiBtYW55IGRyaXZlciBh
dXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9zc2libGUgdG8gZG8gZXJyb3IgaGFuZGxpbmcg
YnkKPiByZXR1cm5pbmcgYW4gZXJyb3IgY29kZS4gSG93ZXZlciB0aGUgdmFsdWUgcmV0dXJuZWQg
aXMgKG1vc3RseSkgaWdub3JlZAo+IGFuZCB0aGlzIHR5cGljYWxseSByZXN1bHRzIGluIHJlc291
cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYQo+IHF1ZXN0IHRvIG1ha2UgdGhl
IHJlbW92ZSBjYWxsYmFjayByZXR1cm4gdm9pZC4gSW4gdGhlIGZpcnN0IHN0ZXAgb2YgdGhpcwo+
IHF1ZXN0IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXcoKSB3aGljaCBh
bHJlYWR5IHJldHVybnMKPiB2b2lkLgo+IAo+IFRyaXZpYWxseSBjb252ZXJ0IHRoaXMgZHJpdmVy
IGZyb20gYWx3YXlzIHJldHVybmluZyB6ZXJvIGluIHRoZSByZW1vdmUKPiBjYWxsYmFjayB0byB0
aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KPiAKPiBBY2tlZC1ieTogTmljb2xhcyBGZXJyZSA8
bmljb2xhcy5mZXJyZUBtaWNyb2NoaXAuY29tPgo+IFJldmlld2VkLWJ5OiBQYXVsIENlcmN1ZWls
IDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1E
YXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPgo+IEFja2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3Rpbmds
IDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+IFJldmlld2VkLWJ5OiBNYXJ0
aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgo+IEFj
a2VkLWJ5OiBSb2dlciBRdWFkcm9zIDxyb2dlcnFAa2VybmVsLm9yZz4KPiBSZXZpZXdlZC1ieTog
R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KPiBSZXZpZXdlZC1i
eTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KPiBBY2tlZC1ieTogSmVybmVqIFNr
cmFiZWMgPGplcm5lai5za3JhYmVjQGdtYWlsLmNvbT4KPiBBY2tlZC1ieTogVGhpZXJyeSBSZWRp
bmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5p
ZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+IAo+IEhleSBNaXF1ZWws
Cj4gCj4gT24gRnJpLCBBcHIgMDcsIDIwMjMgYXQgMTA6MTA6NDNBTSArMDIwMCwgTWlxdWVsIFJh
eW5hbCB3cm90ZToKPiA+IEkndmUgbG9va2VkIGF0IHRoZSBkaWZmZXJlbnQgcGF0Y2hlcywgdGhl
eSBsb29rIGdvb2QgdG8gbWUgYnV0IGFzIHRoZXkKPiA+IGFyZSBhbGwgdHJpdmlhbCBhbmQgZXhh
Y3RseSBpZGVudGljYWwsIHdvdWxkIHlvdSBtaW5kIHNlbmRpbmcgdGhpcwo+ID4gYWdhaW4gYWxs
IHNxdWFzaGVkIGluIGEgc2luZ2xlIHBhdGNoPyBBIHN1YnN5c3RlbS13aWRlIGNvbnZlcnNpb24g
c2VlbXMKPiA+IGFwcHJvcHJpYXRlLiBJbiBhbGwgY2FzZXMgSSBwbGFuIHRvIHRha2UgdGhpcyBm
b3IgdGhlIG5leHQgbWVyZ2UKPiA+IHdpbmRvdy4gIAo+IAo+IEkgc2xpZ2h0bHkgcHJlZmVyIHRo
ZW0gc2VwYXJhdGVseSwgYmVjYXVzZSBJIGxpa2Ugc21hbGwgcGF0Y2hlcyBhbmQKPiBiZWNhdXNl
IHRoZSBBY2tzIGFuZCBSZXZpZXdzIG9ubHkgYXBwbHkgdG8gdGhlIGluZGl2aWR1YWwgZHJpdmVy
cy4KPiBCdXQgSSBkb24ndCBtaW5kIHNlcmlvdXNseSwgc28gaGVyZSBjb21lcyB0aGUgc2VyaWVz
IHNxdWFzaGVkIGludG8gb25lLgoKRm9yIGFueSBub24gdHJpdmlhbCBjaGFuZ2UsIEkgd291bGQg
ZGVmaW5pdGVseSBkbyB0aGF0IGFzIHdlbGwuCgpUaGUgdGhpbmcgaXMsIGJ5IGNvbGxlY3Rpbmcg
dGhlIHRhZ3Mgd2l0aCBiNCwgeW91IGxvc3QgYWxsIHRoZSBBY2tzIGFuZApSZXZpZXdzIHRhcmdl
dHMsIHdoaWxlIHdlIGNvdWxkIHByZXZlbnQgdGhpcywgc2VlIGJlbG93LgoKPiBXaGlsZSBnb2lu
ZyB0aHJvdWdoIHRoZSBjaGFuZ2VkLCBwcm9iYWJseSB0aGUgczNjMjR4eCBkcml2ZXIgKHdoaWNo
Cj4gaXNuJ3QgZXhhY3RseSBpZGVudGljYWwgdG8gdGhlIG90aGVyIGNoYW5nZXMpIGNvdWxkIGJl
bmVmaXQgZnJvbSBhbgo+IGFkZGl0aW9uYWwgY2hhbmdlIHRocm93aW5nIG91dCB0aGUgZWFybHkg
ZXhpdCAod2hpY2gtLS1JIGd1ZXNzLS0tY2Fubm90Cj4gYmUgaGl0KS4KClllcywgSSBiZWxpZXZl
IHRoZSAnaW5mbyA9PSBOVUxMJyBjb25kaXRpb24gaXMgdXNlbGVzcywgZmVlbCBmcmVlIHRvCmRy
b3AgaXQgaW4gYSBzZWNvbmQgcGF0Y2ggaWYgeW91IHdpc2guCgo+IEJUVywgSSBjb25zdHJ1Y3Rl
ZCB0aGUgbGlzdHMgb2YgYWNrcy9yZXZpZXdzIG15c2VsZiBhbmQgZm91bmQgdGhlIHNhbWUKPiBz
ZXQuIEhvd2V2ZXIgYjQgd2FpbGVkIGFib3V0IGVhY2ggcGF0Y2ggY2xhaW1pbmc6Cj4gCj4gCSAg
ICDinJcgQkFEU0lHOiBES0lNL2luZnJhZGVhZC5vcmcKCk5vIGlkZWEgd2hhdCB0aGlzIG1lYW5z
LCBhbnkgcG9pbnRlcj8KCj4gQW5kIGl0IGRpZG4ndCBsaWtlIHlvdSBwcm9kdWNpbmcgdGhlIHRh
Z3MsIHNheWluZzoKPiAKPiAJTk9URTogc29tZSB0cmFpbGVycyBpZ25vcmVkIGR1ZSB0byBmcm9t
L2VtYWlsIG1pc21hdGNoZXM6Cj4gCSAgICAhIFRyYWlsZXI6IEFja2VkLWJ5OiBSb2dlciBRdWFk
cm9zIDxyb2dlcnFAa2VybmVsLm9yZz4KPiAJICAgICBNc2cgRnJvbTogTWlxdWVsIFJheW5hbCA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiAJICAgIFsuLi5dCgpXZWxsLCB5ZXMsIEkgZG9u
J3QgZXhwZWN0IGI0IHRvIHJlYWQgcGxhaW4gZW5nbGlzaCB3aGVuIEkgc2F5ICJJCmNvbGxlY3Rl
ZCB0aGVtIGZvciB5b3UiIF5eIEJ1dCBhdCBsZWFzdCBteSBsaXN0IGhhZCBhICcjIDxhcmVhPicg
c3VmZml4CmZvciBlYWNoIG9mIHRoZSBBY2tlZCBhbmQgUmV2aWV3ZWQgY2hhbmdlcywgd2hpY2gg
aXMgbm93IG1pc3NpbmcuIEkKZG9uJ3Qga25vdyAgaG93IHVzZWZ1bCB0aGV5IGFjdHVhbGx5IGFy
ZSwgYnV0IGl0IHNlZW1zIHRvIG1lIHRoYXQgdGhlCmluZm9ybWF0aW9uIHdhcyBsb3N0IGJldHdl
ZW4gdjEgYW5kIHYyPwoKVGhhbmtzLApNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
