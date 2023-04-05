Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 442F56D7D08
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 14:57:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED3DEC6A610;
	Wed,  5 Apr 2023 12:57:31 +0000 (UTC)
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91EE6C6A606
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 12:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1680699450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mq/p4txhSsRLR5xVgrA62YXfgD49tU+mOTycAeKgsHg=;
 b=Mb98f9ufodGaozAOY4xYrOH4ki7sxYY/vAA0bNDznfkO1jY7oQ7vUoy9gBV18sQyg7Fqkp
 4iw1OtIZgkWKHd7enKxNHs2560FyoXBFO6izP6fR7+5aCxwEgm0s0Qni1/6h8kIbFM1q0N
 AxvQ9vdC4gf6sPGfRYLz7iOkrkLShI8=
Message-ID: <1e0e8e9fe44c27e844e7e918a985704e58da2c27.camel@crapouillou.net>
From: Paul Cercueil <paul@crapouillou.net>
To: Maxime Ripard <maxime@cerno.tech>, Aidan MacDonald
 <aidanmacdonald.0x0@gmail.com>
Date: Wed, 05 Apr 2023 14:57:26 +0200
In-Reply-To: <20230327192430.b2cp3yyrkzy4g4vw@penduick>
References: <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
 <20221104145946.orsyrhiqvypisl5j@houat>
 <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
 <20221107085417.xrsh6xy3ouwdkp4z@houat>
 <ucJ6KSBqdPTxfxUQqLUr9C9RGiQRnY1I@localhost>
 <20221109110045.j24vwkaq3s4yzoy3@houat>
 <06a293adc75990ed3e297b076fc38d8a.sboyd@kernel.org>
 <xpKMzGb1sOsucWMTlJIMzrT5KjLlZ7JP@localhost>
 <20230324111959.frjf4neopbs67ugd@houat>
 <rTJKpeLOBeu3eOLW5z3P5fEpcOJJLrGs@localhost>
 <20230327192430.b2cp3yyrkzy4g4vw@penduick>
MIME-Version: 1.0
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Max Filippov <jcmvbkbc@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-phy@lists.infradead.org, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Abel Vesa <abelvesa@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-mips@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-rtc@vger.kernel.org,
 linux-clk@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Daniel Vetter <daniel@ffwll.ch>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <david@lechnology.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v2 56/65] clk: ingenic: cgu: Switch to
	determine_rate
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

SGkgTWF4aW1lLAoKTGUgbHVuZGkgMjcgbWFycyAyMDIzIMOgIDIxOjI0ICswMjAwLCBNYXhpbWUg
UmlwYXJkIGEgw6ljcml0wqA6Cj4gT24gRnJpLCBNYXIgMjQsIDIwMjMgYXQgMDg6NTg6NDhQTSAr
MDAwMCwgQWlkYW4gTWFjRG9uYWxkIHdyb3RlOgo+ID4gPiA+IE15IHN1Z2dlc3Rpb246IGFkZCBh
IHBlci1jbG9jayBiaXRtYXAgdG8ga2VlcCB0cmFjayBvZiB3aGljaAo+ID4gPiA+IHBhcmVudHMK
PiA+ID4gPiBhcmUgYWxsb3dlZC4gQW55IG9wZXJhdGlvbiB0aGF0IHdvdWxkIHNlbGVjdCBhIHBh
cmVudCBjbG9jayBub3QKPiA+ID4gPiBvbiB0aGUKPiA+ID4gPiB3aGl0ZWxpc3Qgc2hvdWxkIGZh
aWwuIEF1dG9tYXRpYyByZXBhcmVudGluZyBzaG91bGQgb25seSBzZWxlY3QKPiA+ID4gPiBmcm9t
Cj4gPiA+ID4gY2xvY2tzIG9uIHRoZSB3aGl0ZWxpc3QuIEFuZCB3ZSBuZWVkIG5ldyBEVCBiaW5k
aW5ncyBmb3IKPiA+ID4gPiBjb250cm9sbGluZwo+ID4gPiA+IHRoZSB3aGl0ZWxpc3QsIGZvciBl
eGFtcGxlOgo+ID4gPiA+IAo+ID4gPiA+IMKgwqDCoCBjbG9jay1wYXJlbnRzLTAgPSA8JmNsazE+
LCA8JnBsbF9jPjsKPiA+ID4gPiDCoMKgwqAgY2xvY2stcGFyZW50cy0xID0gPCZjbGsyPiwgPCZw
bGxfYT4sIDwmcGxsX2I+Owo+ID4gPiA+IAo+ID4gPiA+IFRoaXMgbWVhbnMgdGhhdCBjbGsxIGNh
biBvbmx5IGhhdmUgcGxsX2MgYXMgYSBwYXJlbnQsIHdoaWxlCj4gPiA+ID4gY2xrMiBjYW4KPiA+
ID4gPiBoYXZlIHBsbF9hIG9yIHBsbF9iIGFzIHBhcmVudHMuIEJ5IGRlZmF1bHQgZXZlcnkgY2xv
Y2sgd2lsbCBiZQo+ID4gPiA+IGFibGUKPiA+ID4gPiB0byB1c2UgYW55IHBhcmVudCwgc28gYSBs
aXN0IGlzIG9ubHkgbmVlZGVkIGlmIHRoZSBtYWNoaW5lCj4gPiA+ID4gbmVlZHMgYQo+ID4gPiA+
IG1vcmUgcmVzdHJpY3RpdmUgcG9saWN5Lgo+ID4gPiA+IAo+ID4gPiA+IGFzc2lnbmVkLWNsb2Nr
LXBhcmVudHMgc2hvdWxkIGRpc2FibGUgYXV0b21hdGljIHJlcGFyZW50aW5nLAo+ID4gPiA+IGJ1
dCBhbGxvdwo+ID4gPiA+IGV4cGxpY2l0IGNsa19zZXRfcGFyZW50KCkuIFRoaXMgd2lsbCBhbGxv
dyBjbG9jayBkcml2ZXJzIHRvCj4gPiA+ID4gc3RhcnQgZG9pbmcKPiA+ID4gPiByZXBhcmVudGlu
ZyB3aXRob3V0IGJyZWFraW5nIG9sZCBEVHMuCj4gPiA+IAo+ID4gPiBJJ20gZ2VuZXJhbGx5IG5v
dCBhIGZhbiBvZiBwdXR0aW5nIGFsbCB0aGVzZSBwb2xpY2llcyBpbiB0aGUKPiA+ID4gZGV2aWNl
Cj4gPiA+IHRyZWUuIERvIHlvdSBoYXZlIGFuIGV4YW1wbGUgd2hlcmUgaXQgd291bGRuJ3QgYmUg
cG9zc2libGUgdG8gZG8KPiA+ID4gZXhhY3RseQo+ID4gPiB0aGlzIGZyb20gdGhlIGRyaXZlciBp
dHNlbGY/Cj4gPiAKPiA+IEknbSBjb25mdXNlZC4gV2hhdCdzIGltcGxpY2l0IGluIHRoZSBleGFt
cGxlIGlzIGNsazEgYW5kIGNsazIgbWlnaHQKPiA+IGhhdmUgKm90aGVyKiBwb3NzaWJsZSBjaG9p
Y2VzIG9mIHBhcmVudCBjbG9jayBhbmQgdGhlIGRldmljZSB0cmVlCj4gPiBpcwo+ID4gbGltaXRp
bmcgd2hhdCB0aGUgT1MgaXMgYWxsb3dlZCB0byBjaG9vc2UuCj4gPiAKPiA+IFdoeSB3b3VsZCB5
b3UgcHV0IHN1Y2ggYXJiaXRyYXJ5IGxpbWl0YXRpb25zIGludG8gdGhlIGRyaXZlcj8KPiAKPiBX
aHkgd291bGQgd2UgcHV0IHN1Y2ggYXJiaXRyYXJ5IGxpbWl0YXRpb25zIGluIHRoZSBmaXJtd2Fy
ZT8gQXMgdGhpcwo+IGVudGlyZSB0aHJlYWQgY2FuIGF0dGVzdCwgcGVvcGxlIGFyZSBhbHJlYWR5
IHVzaW5nIHRoZSBkZXZpY2UgdHJlZSB0bwo+IHdvcmsgYXJvdW5kIHRoZSBsaW1pdGF0aW9ucyBv
ZiB0aGUgTGludXggZHJpdmVyLCBvciByZWR1Y2UgdGhlCj4gZmVhdHVyZXMgb2YgTGludXggYmVj
YXVzZSB0aGV5IGNhbiByZWx5IG9uIHRoZSBkZXZpY2UgdHJlZS4gRWl0aGVyCj4gd2F5LCBpdCdz
IGxpbmtlZCB0byB0aGUgc3RhdGUgb2YgdGhlIExpbnV4IGRyaXZlciwgYW5kIGFueSBvdGhlciBP
Uwo+IG9yCj4gTGludXggdmVyc2lvbiBjb3VsZCB2ZXJ5IHdlbGwgaW1wbGVtZW50IHNvbWV0aGlu
ZyBtb3JlIGR5bmFtaWMuCgpQcm9iYWJseSBiZWNhdXNlIGlmIHdlIGhhdmUgdG8gY2hvb3NlIGJl
dHdlZW4gc2V0dGluZyBwb2xpY3kgaW4gdGhlCmtlcm5lbCBvciBpbiB0aGUgZmlybXdhcmUsIGl0
IGlzIGFyZ3VhYmx5IGJldHRlciB0byBzZXQgaXQgaW4gdGhlCmZpcm13YXJlLgoKRXNwZWNpYWxs
eSB3aGVuIHRhbGtpbmcgYWJvdXQgY2xvY2tzLCBhcyB0aGUgZmlybXdhcmUgaXMgYWxyZWFkeSB0
aGUKb25lIHByb2dyYW1taW5nIHRoZSBib290IGNsb2Nrcy4KCkNoZWVycywKLVBhdWwKCj4gPiBU
aGV5IHdvdWxkIGJlIGRpZmZlcmVudCBmcm9tIG1hY2hpbmUgdG8gbWFjaGluZSwgdW5sZXNzIHRo
ZSBjbG9jawo+ID4gdHJlZSBpcyBzbyBzaW1wbGUgdGhlcmUgaXMgb25seSAqb25lKiBtZWFuaW5n
ZnVsIHdheSB0byBjb25maWd1cmUKPiA+IGl0Lgo+IAo+IElmIHdlIGxvb2sgYXQgdGhlIGRldmlj
ZSB0cmVlcyB3ZSBoYXZlIGluLXRyZWUsIG1vc3Qgb2YgdGhlIHVzZXJzIG9mCj4gYXNzaWduZWQt
Y2xvY2tzIGFyZSB0aGUgc2FtZSBmcm9tIG9uZSBib2FyZCB0byBhbm90aGVyLgo+IAo+ID4gTW9z
dCBTb0NzIGFyZSBjb21wbGljYXRlZCBlbm91Z2ggdGhhdCB0aGVyZSB3aWxsIGJlIHRyYWRlb2Zm
cwo+ID4gZGVwZW5kaW5nIG9uIHdoYXQgcGVyaXBoZXJhbHMgeW91IGFyZSB1c2luZyAodHlwaWNh
bGx5IGEgc2luZ2xlCj4gPiBtYWNoaW5lIHdpbGwgbm90IHVzZSAqZXZlcnkqIHBlcmlwaGVyYWwg
ZGV2aWNlIHByb3ZpZGVkIGJ5IHRoZQo+ID4gU29DKS4KPiAKPiBXZSBhbHJlYWR5IGhhdmUgQVBJ
cyB0byBsb2NrIHBhcmVudHMgb3IgcmF0ZXMgb24gYSBnaXZlbiBjbG9jayBmcm9tCj4gdGhlIGNv
bnN1bWVyLiBJdCdzIGZhciBzdXBlcmlvciAoZmVhdHVyZS13aXNlKSB0aGFuIHdoYXQgdGhlIGRl
dmljZQo+IHRyZWUgd2lsbCBldmVyIG9mZmVyIGJlY2F1c2UgaXQncyBjb2RlLCBhbmQgaXQgZGVw
ZW5kcyBvbiB0aGUgdXNhZ2UKPiBhbHJlYWR5IHNpbmNlIGFuIHVudXNlZCBkcml2ZXIgd29uJ3Qg
cHJvYmUuCj4gCj4gTWF4aW1lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
