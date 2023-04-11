Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 942696DDBB9
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Apr 2023 15:09:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43365C65E4F;
	Tue, 11 Apr 2023 13:09:47 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 638B2C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 13:09:46 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8667320007;
 Tue, 11 Apr 2023 13:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1681218585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zj1JtAKrv3GVkrzExsf9B7vpxAMSpGNgfjgQje0eTak=;
 b=oNG2Rb7etLGd3op/Iz2fmq0xokA2awaHaTUwmpMIqfWRcdiVNffJhH1OiD/NJa8U8VhbyA
 yF9MXtYH8Fxz3M+cAq/7V/oq1xoDx4mXB50I/MCViACuf5Xj/3sm+jiFSUhQyd/GFiKSU+
 MvbhXoQ5xcQFvUgIZ6glZLEM1HPSvT3ZkSE8cIw3GiRKuf3ey7u+ch+9vo/URZlNg8hBkX
 sdQ/9ZojYLUArwz1K4ERP3d5/cBFRF6/83yyqSdXppNVR0gRdgwuMipAeMDZ8IGKN7s335
 n6r/K2t/A0PaaBtBH3FUkAWJV3CrDikEbkeZlUHa/BD6XrUBmGFFsgVYyetBaQ==
Date: Tue, 11 Apr 2023 15:09:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20230411150930.4fb22d7e@xps-13>
In-Reply-To: <CAMuHMdXUEOP_3zjf8nwDyHvZVG-D0AsBjnr=esKzejMMcEiLSQ@mail.gmail.com>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-28-9a1358472d52@cerno.tech>
 <CAMuHMdXUEOP_3zjf8nwDyHvZVG-D0AsBjnr=esKzejMMcEiLSQ@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 Abel Vesa <abelvesa@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-rtc@vger.kernel.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 David Lechner <david@lechnology.com>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jaroslav Kysela <perex@perex.cz>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
 Ralph Siemsen <ralph.siemsen@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 patches@opensource.cirrus.com, Peter De Schrijver <pdeschrijver@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v3 28/65] clk: renesas: r9a06g032: Add a
 determine_rate hook
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

SGkgR2VlcnQgJiBNYXhpbWUsCgpnZWVydEBsaW51eC1tNjhrLm9yZyB3cm90ZSBvbiBUdWUsIDEx
IEFwciAyMDIzIDEyOjI3OjM4ICswMjAwOgoKPiBDQyBHYXJldGgsIEhlcnbDqSwgTWlxdWVsLCBS
YWxwaAo+IAo+IE9uIFR1ZSwgQXByIDQsIDIwMjMgYXQgMjo0NOKAr1BNIE1heGltZSBSaXBhcmQg
PG1heGltZUBjZXJuby50ZWNoPiB3cm90ZToKPiA+IFRoZSBSZW5lc2FzIHI5YTA2ZzAzMiBiaXRz
ZWxlY3QgY2xvY2sgaW1wbGVtZW50cyBhIG11eCB3aXRoIGEgc2V0X3BhcmVudAo+ID4gaG9vaywg
YnV0IGRvZXNuJ3QgcHJvdmlkZSBhIGRldGVybWluZV9yYXRlIGltcGxlbWVudGF0aW9uLgo+ID4K
PiA+IFRoaXMgaXMgYSBiaXQgb2RkLCBzaW5jZSBzZXRfcGFyZW50KCkgaXMgdGhlcmUgdG8sIGFz
IGl0cyBuYW1lIGltcGxpZXMsCj4gPiBjaGFuZ2UgdGhlIHBhcmVudCBvZiBhIGNsb2NrLiBIb3dl
dmVyLCB0aGUgbW9zdCBsaWtlbHkgY2FuZGlkYXRlIHRvCj4gPiB0cmlnZ2VyIHRoYXQgcGFyZW50
IGNoYW5nZSBpcyBhIGNhbGwgdG8gY2xrX3NldF9yYXRlKCksIHdpdGgKPiA+IGRldGVybWluZV9y
YXRlKCkgZmlndXJpbmcgb3V0IHdoaWNoIHBhcmVudCBpcyB0aGUgYmVzdCBzdWl0ZWQgZm9yIGEK
PiA+IGdpdmVuIHJhdGUuCj4gPgo+ID4gVGhlIG90aGVyIHRyaWdnZXIgd291bGQgYmUgYSBjYWxs
IHRvIGNsa19zZXRfcGFyZW50KCksIGJ1dCBpdCdzIGZhciBsZXNzCj4gPiB1c2VkLCBhbmQgaXQg
ZG9lc24ndCBsb29rIGxpa2UgdGhlcmUncyBhbnkgb2J2aW91cyB1c2VyIGZvciB0aGF0IGNsb2Nr
Lgo+ID4KPiA+IFNvLCB0aGUgc2V0X3BhcmVudCBob29rIGlzIGVmZmVjdGl2ZWx5IHVudXNlZCwg
cG9zc2libHkgYmVjYXVzZSBvZiBhbgo+ID4gb3ZlcnNpZ2h0LiBIb3dldmVyLCBpdCBjb3VsZCBh
bHNvIGJlIGFuIGV4cGxpY2l0IGRlY2lzaW9uIGJ5IHRoZQo+ID4gb3JpZ2luYWwgYXV0aG9yIHRv
IGF2b2lkIGFueSByZXBhcmVudGluZyBidXQgdGhyb3VnaCBhbiBleHBsaWNpdCBjYWxsIHRvCj4g
PiBjbGtfc2V0X3BhcmVudCgpLgo+ID4KPiA+IFRoZSBsYXR0ZXIgY2FzZSB3b3VsZCBiZSBlcXVp
dmFsZW50IHRvIHNldHRpbmcgdGhlIGZsYWcKPiA+IENMS19TRVRfUkFURV9OT19SRVBBUkVOVCwg
dG9nZXRoZXIgd2l0aCBzZXR0aW5nIG91ciBkZXRlcm1pbmVfcmF0ZSBob29rCj4gPiB0byBfX2Ns
a19tdXhfZGV0ZXJtaW5lX3JhdGUoKS4gSW5kZWVkLCBpZiBubyBkZXRlcm1pbmVfcmF0ZQo+ID4g
aW1wbGVtZW50YXRpb24gaXMgcHJvdmlkZWQsIGNsa19yb3VuZF9yYXRlKCkgKHRocm91Z2gKPiA+
IGNsa19jb3JlX3JvdW5kX3JhdGVfbm9sb2NrKCkpIHdpbGwgY2FsbCBpdHNlbGYgb24gdGhlIHBh
cmVudCBpZgo+ID4gQ0xLX1NFVF9SQVRFX1BBUkVOVCBpcyBzZXQsIGFuZCB3aWxsIG5vdCBjaGFu
Z2UgdGhlIGNsb2NrIHJhdGUKPiA+IG90aGVyd2lzZS4gX19jbGtfbXV4X2RldGVybWluZV9yYXRl
KCkgaGFzIHRoZSBleGFjdCBzYW1lIGJlaGF2aW9yIHdoZW4KPiA+IENMS19TRVRfUkFURV9OT19S
RVBBUkVOVCBpcyBzZXQuCj4gPgo+ID4gQW5kIGlmIGl0IHdhcyBhbiBvdmVyc2lnaHQsIHRoZW4g
d2UgYXJlIGF0IGxlYXN0IGV4cGxpY2l0IGFib3V0IG91cgo+ID4gYmVoYXZpb3Igbm93IGFuZCBp
dCBjYW4gYmUgZnVydGhlciByZWZpbmVkIGRvd24gdGhlIGxpbmUuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+ICAKPiAKPiBMR1RNLCBzbwo+
IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJl
PgoKSSBzZWFyY2hlZCBmb3IgJ3Bvc3NpYmxlIGNhbGxlcnMnLCBJIGRpZG4ndCBmaW5kIGFueSBw
bGFjZXMKd2hlcmUgdGhpcyB3b3VsZCBiZSB1c2VkIG9uIHRoZSBjb25zdW1lciBzaWRlLiBIb3dl
dmVyLCBkb3duc3RyZWFtLAp0aGVyZSBpcyBhIHJ6bjEtY2xvY2stYml0c2VsZWN0LmMgY2xvY2sg
ZHJpdmVyIHdoaWNoIHN0YXRlczoKCisgKiBUaGlzIGNsb2NrIHByb3ZpZGVyIGhhbmRsZXMgdGhl
IGNhc2Ugb2YgdGhlIFJaTjEgd2hlcmUgeW91IGhhdmUgcGVyaXBoZXJhbHMKKyAqIHRoYXQgaGF2
ZSB0d28gcG90ZW50aWFsIGNsb2NrIHNvdXJjZSBhbmQgdHdvIGdhdGVzLCBvbmUgZm9yIGVhY2gg
b2YgdGhlCisgKiBjbG9jayBzb3VyY2UgLSB0aGUgdXNlZCBjbG9jayBzb3VyY2UgKGZvciBhbGwg
c3ViIGNsb2NrcykgaXMgc2VsZWN0ZWQgYnkgYQorICogc2luZ2xlIGJpdC4KKyAqIFRoYXQgc2lu
Z2xlIGJpdCBhZmZlY3RzIGFsbCBzdWItY2xvY2tzLCBhbmQgdGhlcmVmb3JlIG5lZWRzIHRvIGNo
YW5nZSB0aGUKKyAqIGFjdGl2ZSBnYXRlIChhbmQgdHVybiB0aGUgb3RoZXJzIG9mZikgYW5kIGZv
cmNlIGEgcmVjYWxjdWxhdGlvbiBvZiB0aGUgcmF0ZXMuCgpJIGRvbid0IGtub3cgaG93IG11Y2gg
b2YgdGhpcyBmaWxlIGhhcyBiZWVuIHVwc3RyZWFtZWQgKHVuZGVyIGEKZGlmZmVyZW50IGZvcm0p
IGJ1dCB0aGlzIG1pZ2h0IHZlcnkgd2VsbCBiZSByZWxhdGVkIHRvIHRoZSBmYWN0IHRoYXQKcmVw
YXJlbnRpbmcgaW4gc29tZSBjYXNlcyB3b3VsZCBiZSBhIG1ham9yIGlzc3VlIGFuZCB0aHVzIG5l
ZWRzIHRvIGJlCmF2b2lkZWQgdW5sZXNzIGRvbmUgb24gcHVycG9zZSAoZ3Vlc3Npbmc/KS4KCk1h
eWJlIFJhbHBoIGNhbiBjb21tZW50LCBidXQgZm9yIHdoYXQgSSB1bmRlcnN0YW5kLAoKUmV2aWV3
ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cgo+IEJ1dCBJ
IGRvIG5vdCBoYXZlIHRoZSBoYXJkd2FyZS4KPiAKPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVz
YXMvcjlhMDZnMDMyLWNsb2Nrcy5jCj4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA2
ZzAzMi1jbG9ja3MuYwo+ID4gQEAgLTExMjEsNiArMTEyMSw3IEBAIHN0YXRpYyBpbnQgcjlhMDZn
MDMyX2Nsa19tdXhfc2V0X3BhcmVudChzdHJ1Y3QgY2xrX2h3ICpodywgdTggaW5kZXgpCj4gPiAg
fQo+ID4KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19vcHMgY2xrX2JpdHNlbGVjdF9vcHMg
PSB7Cj4gPiArICAgICAgIC5kZXRlcm1pbmVfcmF0ZSA9IF9fY2xrX211eF9kZXRlcm1pbmVfcmF0
ZSwKPiA+ICAgICAgICAgLmdldF9wYXJlbnQgPSByOWEwNmcwMzJfY2xrX211eF9nZXRfcGFyZW50
LAo+ID4gICAgICAgICAuc2V0X3BhcmVudCA9IHI5YTA2ZzAzMl9jbGtfbXV4X3NldF9wYXJlbnQs
Cj4gPiAgfTsKPiA+IEBAIC0xMTQ1LDcgKzExNDYsNyBAQCByOWEwNmcwMzJfcmVnaXN0ZXJfYml0
c2VsKHN0cnVjdCByOWEwNmcwMzJfcHJpdiAqY2xvY2tzLAo+ID4KPiA+ICAgICAgICAgaW5pdC5u
YW1lID0gZGVzYy0+bmFtZTsKPiA+ICAgICAgICAgaW5pdC5vcHMgPSAmY2xrX2JpdHNlbGVjdF9v
cHM7Cj4gPiAtICAgICAgIGluaXQuZmxhZ3MgPSBDTEtfU0VUX1JBVEVfUEFSRU5UOwo+ID4gKyAg
ICAgICBpbml0LmZsYWdzID0gQ0xLX1NFVF9SQVRFX1BBUkVOVCB8IENMS19TRVRfUkFURV9OT19S
RVBBUkVOVDsKPiA+ICAgICAgICAgaW5pdC5wYXJlbnRfbmFtZXMgPSBuYW1lczsKPiA+ICAgICAg
ICAgaW5pdC5udW1fcGFyZW50cyA9IDI7Cj4gPiAgCj4gCj4gR3J7b2V0amUsZWV0aW5nfXMsCj4g
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKPiAKClRoYW5rcywKTWlxdcOobApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
