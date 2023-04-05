Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECB46D81DE
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 17:30:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BABFDC6A606;
	Wed,  5 Apr 2023 15:30:01 +0000 (UTC)
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7412C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 15:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1680708591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mjb6j+bIXE7b8JKh7kXdb3mAp/fvDvyUInzyZqABl7c=;
 b=KkyZeRD8zRr9DUPi8E+yaAiJ6llkrkavOcg1hU9CiniByzzr5DJTX0SyfBAelvEuN8MeEv
 jL7uDqd+LBP5S8A6OuKPnyJCiz26onUF85KEMt1FysxEno2QjGawIYOL+G+P8JgGTbkscL
 0Btl6oFLBPglYsRqL+QJzG3n9bKa4SU=
Message-ID: <84dea45aa0a46f531d38369a31d08420dc43dfe3.camel@crapouillou.net>
From: Paul Cercueil <paul@crapouillou.net>
To: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 05 Apr 2023 17:29:47 +0200
In-Reply-To: <g24dkwtsobslw6qdvs4vbcdmk2txrlrephm5zmlff2fusrxheo@mqxrprzctymk>
References: <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
 <20221107085417.xrsh6xy3ouwdkp4z@houat>
 <ucJ6KSBqdPTxfxUQqLUr9C9RGiQRnY1I@localhost>
 <20221109110045.j24vwkaq3s4yzoy3@houat>
 <06a293adc75990ed3e297b076fc38d8a.sboyd@kernel.org>
 <xpKMzGb1sOsucWMTlJIMzrT5KjLlZ7JP@localhost>
 <20230324111959.frjf4neopbs67ugd@houat>
 <rTJKpeLOBeu3eOLW5z3P5fEpcOJJLrGs@localhost>
 <20230327192430.b2cp3yyrkzy4g4vw@penduick>
 <1e0e8e9fe44c27e844e7e918a985704e58da2c27.camel@crapouillou.net>
 <g24dkwtsobslw6qdvs4vbcdmk2txrlrephm5zmlff2fusrxheo@mqxrprzctymk>
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
 Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
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

TGUgbWVyY3JlZGkgMDUgYXZyaWwgMjAyMyDDoCAxNjo1MCArMDIwMCwgTWF4aW1lIFJpcGFyZCBh
IMOpY3JpdMKgOgo+IE9uIFdlZCwgQXByIDA1LCAyMDIzIGF0IDAyOjU3OjI2UE0gKzAyMDAsIFBh
dWwgQ2VyY3VlaWwgd3JvdGU6Cj4gPiBMZSBsdW5kaSAyNyBtYXJzIDIwMjMgw6AgMjE6MjQgKzAy
MDAsIE1heGltZSBSaXBhcmQgYSDDqWNyaXTCoDoKPiA+ID4gT24gRnJpLCBNYXIgMjQsIDIwMjMg
YXQgMDg6NTg6NDhQTSArMDAwMCwgQWlkYW4gTWFjRG9uYWxkIHdyb3RlOgo+ID4gPiA+ID4gPiBN
eSBzdWdnZXN0aW9uOiBhZGQgYSBwZXItY2xvY2sgYml0bWFwIHRvIGtlZXAgdHJhY2sgb2YKPiA+
ID4gPiA+ID4gd2hpY2gKPiA+ID4gPiA+ID4gcGFyZW50cwo+ID4gPiA+ID4gPiBhcmUgYWxsb3dl
ZC4gQW55IG9wZXJhdGlvbiB0aGF0IHdvdWxkIHNlbGVjdCBhIHBhcmVudCBjbG9jawo+ID4gPiA+
ID4gPiBub3QKPiA+ID4gPiA+ID4gb24gdGhlCj4gPiA+ID4gPiA+IHdoaXRlbGlzdCBzaG91bGQg
ZmFpbC4gQXV0b21hdGljIHJlcGFyZW50aW5nIHNob3VsZCBvbmx5Cj4gPiA+ID4gPiA+IHNlbGVj
dAo+ID4gPiA+ID4gPiBmcm9tCj4gPiA+ID4gPiA+IGNsb2NrcyBvbiB0aGUgd2hpdGVsaXN0LiBB
bmQgd2UgbmVlZCBuZXcgRFQgYmluZGluZ3MgZm9yCj4gPiA+ID4gPiA+IGNvbnRyb2xsaW5nCj4g
PiA+ID4gPiA+IHRoZSB3aGl0ZWxpc3QsIGZvciBleGFtcGxlOgo+ID4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gwqDCoMKgIGNsb2NrLXBhcmVudHMtMCA9IDwmY2xrMT4sIDwmcGxsX2M+Owo+ID4gPiA+
ID4gPiDCoMKgwqAgY2xvY2stcGFyZW50cy0xID0gPCZjbGsyPiwgPCZwbGxfYT4sIDwmcGxsX2I+
Owo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gVGhpcyBtZWFucyB0aGF0IGNsazEgY2FuIG9ubHkg
aGF2ZSBwbGxfYyBhcyBhIHBhcmVudCwgd2hpbGUKPiA+ID4gPiA+ID4gY2xrMiBjYW4KPiA+ID4g
PiA+ID4gaGF2ZSBwbGxfYSBvciBwbGxfYiBhcyBwYXJlbnRzLiBCeSBkZWZhdWx0IGV2ZXJ5IGNs
b2NrIHdpbGwKPiA+ID4gPiA+ID4gYmUKPiA+ID4gPiA+ID4gYWJsZQo+ID4gPiA+ID4gPiB0byB1
c2UgYW55IHBhcmVudCwgc28gYSBsaXN0IGlzIG9ubHkgbmVlZGVkIGlmIHRoZSBtYWNoaW5lCj4g
PiA+ID4gPiA+IG5lZWRzIGEKPiA+ID4gPiA+ID4gbW9yZSByZXN0cmljdGl2ZSBwb2xpY3kuCj4g
PiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBhc3NpZ25lZC1jbG9jay1wYXJlbnRzIHNob3VsZCBkaXNh
YmxlIGF1dG9tYXRpYwo+ID4gPiA+ID4gPiByZXBhcmVudGluZywKPiA+ID4gPiA+ID4gYnV0IGFs
bG93Cj4gPiA+ID4gPiA+IGV4cGxpY2l0IGNsa19zZXRfcGFyZW50KCkuIFRoaXMgd2lsbCBhbGxv
dyBjbG9jayBkcml2ZXJzIHRvCj4gPiA+ID4gPiA+IHN0YXJ0IGRvaW5nCj4gPiA+ID4gPiA+IHJl
cGFyZW50aW5nIHdpdGhvdXQgYnJlYWtpbmcgb2xkIERUcy4KPiA+ID4gPiA+IAo+ID4gPiA+ID4g
SSdtIGdlbmVyYWxseSBub3QgYSBmYW4gb2YgcHV0dGluZyBhbGwgdGhlc2UgcG9saWNpZXMgaW4g
dGhlCj4gPiA+ID4gPiBkZXZpY2UKPiA+ID4gPiA+IHRyZWUuIERvIHlvdSBoYXZlIGFuIGV4YW1w
bGUgd2hlcmUgaXQgd291bGRuJ3QgYmUgcG9zc2libGUgdG8KPiA+ID4gPiA+IGRvCj4gPiA+ID4g
PiBleGFjdGx5Cj4gPiA+ID4gPiB0aGlzIGZyb20gdGhlIGRyaXZlciBpdHNlbGY/Cj4gPiA+ID4g
Cj4gPiA+ID4gSSdtIGNvbmZ1c2VkLiBXaGF0J3MgaW1wbGljaXQgaW4gdGhlIGV4YW1wbGUgaXMg
Y2xrMSBhbmQgY2xrMgo+ID4gPiA+IG1pZ2h0Cj4gPiA+ID4gaGF2ZSAqb3RoZXIqIHBvc3NpYmxl
IGNob2ljZXMgb2YgcGFyZW50IGNsb2NrIGFuZCB0aGUgZGV2aWNlCj4gPiA+ID4gdHJlZQo+ID4g
PiA+IGlzCj4gPiA+ID4gbGltaXRpbmcgd2hhdCB0aGUgT1MgaXMgYWxsb3dlZCB0byBjaG9vc2Uu
Cj4gPiA+ID4gCj4gPiA+ID4gV2h5IHdvdWxkIHlvdSBwdXQgc3VjaCBhcmJpdHJhcnkgbGltaXRh
dGlvbnMgaW50byB0aGUgZHJpdmVyPwo+ID4gPiAKPiA+ID4gV2h5IHdvdWxkIHdlIHB1dCBzdWNo
IGFyYml0cmFyeSBsaW1pdGF0aW9ucyBpbiB0aGUgZmlybXdhcmU/IEFzCj4gPiA+IHRoaXMKPiA+
ID4gZW50aXJlIHRocmVhZCBjYW4gYXR0ZXN0LCBwZW9wbGUgYXJlIGFscmVhZHkgdXNpbmcgdGhl
IGRldmljZQo+ID4gPiB0cmVlIHRvCj4gPiA+IHdvcmsgYXJvdW5kIHRoZSBsaW1pdGF0aW9ucyBv
ZiB0aGUgTGludXggZHJpdmVyLCBvciByZWR1Y2UgdGhlCj4gPiA+IGZlYXR1cmVzIG9mIExpbnV4
IGJlY2F1c2UgdGhleSBjYW4gcmVseSBvbiB0aGUgZGV2aWNlIHRyZWUuCj4gPiA+IEVpdGhlcgo+
ID4gPiB3YXksIGl0J3MgbGlua2VkIHRvIHRoZSBzdGF0ZSBvZiB0aGUgTGludXggZHJpdmVyLCBh
bmQgYW55IG90aGVyCj4gPiA+IE9TCj4gPiA+IG9yCj4gPiA+IExpbnV4IHZlcnNpb24gY291bGQg
dmVyeSB3ZWxsIGltcGxlbWVudCBzb21ldGhpbmcgbW9yZSBkeW5hbWljLgo+ID4gCj4gPiBQcm9i
YWJseSBiZWNhdXNlIGlmIHdlIGhhdmUgdG8gY2hvb3NlIGJldHdlZW4gc2V0dGluZyBwb2xpY3kg
aW4gdGhlCj4gPiBrZXJuZWwgb3IgaW4gdGhlIGZpcm13YXJlLCBpdCBpcyBhcmd1YWJseSBiZXR0
ZXIgdG8gc2V0IGl0IGluIHRoZQo+ID4gZmlybXdhcmUuCj4gCj4gSSBoYXZlIGEgdmVyeSBkaWZm
ZXJlbnQgdmlldyBvbiB0aGlzIEkgZ3Vlc3MuIEZpcm13YXJlIGlzIChtb3N0IG9mCj4gdGhlCj4g
dGltZSkgaGFyZCB0byB1cGRhdGUsIGFuZCB0aGUgcG9saWN5IGRlcGVuZCBvbiB0aGUgc3RhdGUg
b2Ygc3VwcG9ydAo+IG9mIGEKPiBnaXZlbiBPUyBzbyBpdCdzIGxpa2VseSB0byBldm9sdmUuIFRo
ZSBrZXJuZWwgaXMgdGhlIGJlc3QgcGxhY2UgdG8gbWUKPiB0bwo+IHB1dCB0aGF0IGtpbmQgb2Yg
cG9saWN5LiBXaHkgZG8geW91IHRoaW5rIGRpZmZlcmVudGx5PwoKQmVjYXVzZSB0aGUgY2xvY2tz
IGNvbmZpZ3VyYXRpb24gY2FuIGJlIGJvYXJkLXNwZWNpZmljLiBBbmQgeW91IGRvbid0CnJlYWxs
eSB3YW50IGJvYXJkLXNwZWNpZmljIHN0dWZmIGluIHRoZSBkcml2ZXIuCgpJZiB3ZSB0YWtlIHRo
ZSBJbmdlbmljIEpaNDc3MCBTb0MgYXMgZXhhbXBsZSwgb24gb25lIGJvYXJkIHdlIHBhcmVudApl
dmVyeXRoaW5nIHdlIGNhbiB0byB0aGUgUExMMSBjbG9jayBhbmQgc2V0IGl0IHRvIDQzMiBNSHog
KHRoZSBsZWFzdApjb21tb24gbXVsdGlwbGUpLiBUaGVuIHRoZSBQTEwwICh3aGljaCBkcml2ZXMg
dGhlIEREUiBhbmQgQ1BVIGNsb2NrcykKY2FuIGJlIHVwZGF0ZWQgdG8gb3ZlcmNsb2NrL3VuZGVy
Y2xvY2sgdGhlIENQVSBhbmQgUkFNLgoKU28gc2hvdWxkIHRoYXQgYmUgaGFyZGNvZGVkIGluIHRo
ZSBkcml2ZXI/IFdlbGwsIGZvciBhIGRpZmZlcmVudCBib2FyZCwKZm9yIHdoaWNoIG92ZXJjbG9j
ayBpcyBub3QgcmVhbGx5IG5lZWRlZCwgaXQncyBiZXR0ZXIgdG8gcGFyZW50CmV2ZXJ5dGhpbmcg
dG8gUExMMCBzbyB0aGF0IFBMTDEgY2FuIGJlIHNodXQgZG93biB0byBzYXZlIHBvd2VyLiBTbyB3
aGF0CnBvbGljeSBzaG91bGQgYmUgaGFyZGNvZGVkIGluIHRoZSBkcml2ZXI/Cgo+IAo+ID4gRXNw
ZWNpYWxseSB3aGVuIHRhbGtpbmcgYWJvdXQgY2xvY2tzLCBhcyB0aGUgZmlybXdhcmUgaXMgYWxy
ZWFkeQo+ID4gdGhlCj4gPiBvbmUgcHJvZ3JhbW1pbmcgdGhlIGJvb3QgY2xvY2tzLgo+IAo+IEkn
bSBub3Qgc3VyZSB3aGF0IHlvdXIgcG9pbnQgaXMgdGhlcmUuIEkgZG9uJ3QgdGhpbmsgSSBldmVy
IHNhdyBhCj4gZmlybXdhcmUgZ2V0dGluZyB0aGUgY2xvY2tzIHJpZ2h0IGZvciBldmVyeSBwb3Nz
aWJsZSBzY2VuYXJpbyBvbiBhCj4gZ2l2ZW4KPiBwbGF0Zm9ybS4gQW5kIGlmIGl0IHdhcyBpbmRl
ZWQgdGhlIGNhc2UsIHRoZW4gd2Ugd291bGRuJ3QgZXZlbiBhCj4ga2VybmVsCj4gZHJpdmVyLgoK
TXkgcG9pbnQgaXMgdGhhdCB0aGVyZSBpcyBhbHJlYWR5IHBvbGljeSBpbiBob3cgdGhlIGZpcm13
YXJlIHNldHMgdXAKdGhlIGhhcmR3YXJlOyBhbmQgbW9zdCBvZnRlbiB0aGFuIG5vdCwgdGhlIGtl
cm5lbCBkcml2ZXIgd29uJ3QgY2hhbmdlCnRoYXQgKGUuZy4geW91J3JlIHByb2JhYmx5IG5vdCBn
b2luZyB0byB0b3VjaCB0aGUgRERSIGNsb2NrKS4gSXQncwpiZXR0ZXIgdG8gaGF2ZSBhbGwgcG9s
aWN5IGluIHRoZSBmaXJtd2FyZSB0aGVuLCBpbnN0ZWFkIG9mIGhhdmluZyBzb21lCmluIHRoZSBm
aXJtd2FyZSwgYW5kIHNvbWUgaW4gdGhlIGtlcm5lbCBkcml2ZXIuCgpDaGVlcnMsCi1QYXVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
