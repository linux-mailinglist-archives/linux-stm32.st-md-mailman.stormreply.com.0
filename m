Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8DE61FFEA
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Nov 2022 21:57:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12870C65041;
	Mon,  7 Nov 2022 20:57:22 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A5C8C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Nov 2022 20:57:21 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id y16so17975710wrt.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Nov 2022 12:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
 :subject:cc:to:from:references:from:to:cc:subject:date:message-id
 :reply-to; bh=xNuIDh9+z0CfhmCPEaKB/O13kWB7hEyf2+U7jlAoSUM=;
 b=PMUoELhE6AnXK+iNbgb6rPTOJPEKsFgBujXqxbWpgwA5fYf4gBdL2QEZ7s38On6Pdv
 tEvNrpWkJH7345NtNVL6P6neZYoOwCet4Y628+aQE5juJnavU3qBi7KlO1rk5DAUAUOq
 438HwMs8JiemVJnEaCYxBD3fJBcnKF+Ec4ElTT2rACGgYIzmW6zjKAQjhVEt1OoUDQVI
 vKeu2GP4yAVneediojKblkMb81j+Ywo5HajTIEQtgDumphUC4m8/Zrw4Q3MU5M1r0ziT
 8aiG4DnxTEwp4bvltkVyz/XtyJfkf0wefxRxSHxi02sFECEhyFppC6IqlBS76u0z4eLR
 9SRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:in-reply-to
 :subject:cc:to:from:references:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xNuIDh9+z0CfhmCPEaKB/O13kWB7hEyf2+U7jlAoSUM=;
 b=a8al2hi68rlGqRTZKQxhnhcNYCRYR9PG5VqZWuBviVSEHLpiBgQK0kUCFYvgOY3jFo
 LdaylnuyAn8aeEysMF2BOpMkXZDp/qypF7ILkFPUzPQkJqGKxoyFYqSb84TNbg+1UXXY
 XaoayUWgJCqox391dYvrh6uccP2RjXJJB12EKJ7KGwA089ImYn4YO0NLRkCy7bDassrg
 rwrqH/XtraXyriJpmNIH1rM7wjZZFoAPshrP9MQBxSlejdQj/NxEzepQhLmefqZnvIPj
 VKi4z/pwCVR9n7UHoM+kO+DE7vR0VnoDHHyDcwvPPfLYzTKxNHDWy4y1XSV12SSjUjpr
 Iyzw==
X-Gm-Message-State: ACrzQf2IIRAQWyJP/i7mz1InsNvisivcNLDwqmjT0+fUYDIW0oQQkc98
 EOVy5IpBEO4xBA1iWV90INM=
X-Google-Smtp-Source: AMsMyM68KhRfPQSDi8CFA78pakjxRAM3L6JCB7fc1yr/DnXKn9yQG4njsjQsXjAXYrNXUB9CMb72nw==
X-Received: by 2002:a5d:4ec1:0:b0:22e:435c:1e0f with SMTP id
 s1-20020a5d4ec1000000b0022e435c1e0fmr633954wrv.200.1667854640408; 
 Mon, 07 Nov 2022 12:57:20 -0800 (PST)
Received: from localhost (188.28.3.103.threembb.co.uk. [188.28.3.103])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a7bca41000000b003c6c3fb3cf6sm9173176wml.18.2022.11.07.12.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 12:57:19 -0800 (PST)
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-56-f6736dec138e@cerno.tech>
 <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
 <20221104145946.orsyrhiqvypisl5j@houat>
 <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
 <20221107085417.xrsh6xy3ouwdkp4z@houat>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
In-reply-to: <20221107085417.xrsh6xy3ouwdkp4z@houat>
Date: Mon, 07 Nov 2022 20:57:22 +0000
Message-ID: <ucJ6KSBqdPTxfxUQqLUr9C9RGiQRnY1I@localhost>
MIME-Version: 1.0
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
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
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
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

Ck1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPiB3cml0ZXM6Cgo+IEhpLAo+Cj4gT24g
RnJpLCBOb3YgMDQsIDIwMjIgYXQgMDU6MzU6MjlQTSArMDAwMCwgQWlkYW4gTWFjRG9uYWxkIHdy
b3RlOgo+Pgo+PiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4gd3JpdGVzOgo+Pgo+
PiA+IEhpIFBhdWwsCj4+ID4KPj4gPiBPbiBGcmksIE5vdiAwNCwgMjAyMiBhdCAwMjozMToyMFBN
ICswMDAwLCBQYXVsIENlcmN1ZWlsIHdyb3RlOgo+PiA+PiBMZSB2ZW4uIDQgbm92LiAyMDIyIMOg
IDE0OjE4OjEzICswMTAwLCBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8udGVjaD4gYQo+PiA+
PiDDqWNyaXQgOgo+PiA+PiA+IFRoZSBJbmdlbmljIENHVSBjbG9ja3MgaW1wbGVtZW50cyBhIG11
eCB3aXRoIGEgc2V0X3BhcmVudCBob29rLCBidXQKPj4gPj4gPiBkb2Vzbid0IHByb3ZpZGUgYSBk
ZXRlcm1pbmVfcmF0ZSBpbXBsZW1lbnRhdGlvbi4KPj4gPj4gPgo+PiA+PiA+IFRoaXMgaXMgYSBi
aXQgb2RkLCBzaW5jZSBzZXRfcGFyZW50KCkgaXMgdGhlcmUgdG8sIGFzIGl0cyBuYW1lIGltcGxp
ZXMsCj4+ID4+ID4gY2hhbmdlIHRoZSBwYXJlbnQgb2YgYSBjbG9jay4gSG93ZXZlciwgdGhlIG1v
c3QgbGlrZWx5IGNhbmRpZGF0ZSB0bwo+PiA+PiA+IHRyaWdnZXIgdGhhdCBwYXJlbnQgY2hhbmdl
IGlzIGEgY2FsbCB0byBjbGtfc2V0X3JhdGUoKSwgd2l0aAo+PiA+PiA+IGRldGVybWluZV9yYXRl
KCkgZmlndXJpbmcgb3V0IHdoaWNoIHBhcmVudCBpcyB0aGUgYmVzdCBzdWl0ZWQgZm9yIGEKPj4g
Pj4gPiBnaXZlbiByYXRlLgo+PiA+PiA+Cj4+ID4+ID4gVGhlIG90aGVyIHRyaWdnZXIgd291bGQg
YmUgYSBjYWxsIHRvIGNsa19zZXRfcGFyZW50KCksIGJ1dCBpdCdzIGZhciBsZXNzCj4+ID4+ID4g
dXNlZCwgYW5kIGl0IGRvZXNuJ3QgbG9vayBsaWtlIHRoZXJlJ3MgYW55IG9idmlvdXMgdXNlciBm
b3IgdGhhdCBjbG9jay4KPj4gPj4gPgo+PiA+PiA+IFNvLCB0aGUgc2V0X3BhcmVudCBob29rIGlz
IGVmZmVjdGl2ZWx5IHVudXNlZCwgcG9zc2libHkgYmVjYXVzZSBvZiBhbgo+PiA+PiA+IG92ZXJz
aWdodC4gSG93ZXZlciwgaXQgY291bGQgYWxzbyBiZSBhbiBleHBsaWNpdCBkZWNpc2lvbiBieSB0
aGUKPj4gPj4gPiBvcmlnaW5hbCBhdXRob3IgdG8gYXZvaWQgYW55IHJlcGFyZW50aW5nIGJ1dCB0
aHJvdWdoIGFuIGV4cGxpY2l0IGNhbGwgdG8KPj4gPj4gPiBjbGtfc2V0X3BhcmVudCgpLgo+PiA+
PiA+Cj4+ID4+ID4gVGhlIGRyaXZlciBkb2VzIGltcGxlbWVudCByb3VuZF9yYXRlKCkgdGhvdWdo
LCB3aGljaCBtZWFucyB0aGF0IHdlIGNhbgo+PiA+PiA+IGNoYW5nZSB0aGUgcmF0ZSBvZiB0aGUg
Y2xvY2ssIGJ1dCB3ZSB3aWxsIG5ldmVyIGdldCB0byBjaGFuZ2UgdGhlCj4+ID4+ID4gcGFyZW50
Lgo+PiA+PiA+Cj4+ID4+ID4gSG93ZXZlciwgSXQncyBoYXJkIHRvIHRlbGwgd2hldGhlciBpdCdz
IGJlZW4gZG9uZSBvbiBwdXJwb3NlIG9yIG5vdC4KPj4gPj4gPgo+PiA+PiA+IFNpbmNlIHdlJ2xs
IHN0YXJ0IG1hbmRhdGluZyBhIGRldGVybWluZV9yYXRlKCkgaW1wbGVtZW50YXRpb24sIGxldCdz
Cj4+ID4+ID4gY29udmVydCB0aGUgcm91bmRfcmF0ZSgpIGltcGxlbWVudGF0aW9uIHRvIGEgZGV0
ZXJtaW5lX3JhdGUoKSwgd2hpY2gKPj4gPj4gPiB3aWxsIGFsc28gbWFrZSB0aGUgY3VycmVudCBi
ZWhhdmlvciBleHBsaWNpdC4gQW5kIGlmIGl0IHdhcyBhbgo+PiA+PiA+IG92ZXJzaWdodCwgdGhl
IGNsb2NrIGJlaGF2aW91ciBjYW4gYmUgYWRqdXN0ZWQgbGF0ZXIgb24uCj4+ID4+Cj4+ID4+IFNv
IGl0J3MgcGFydGx5IG9uIHB1cnBvc2UsIHBhcnRseSBiZWNhdXNlIEkgZGlkbid0IGtub3cgYWJv
dXQKPj4gPj4gLmRldGVybWluZV9yYXRlLgo+PiA+Pgo+PiA+PiBUaGVyZSdzIG5vdGhpbmcgb2Rk
IGFib3V0IGhhdmluZyBhIGxvbmVseSAuc2V0X3BhcmVudCBjYWxsYmFjazsgaW4gbXkgY2FzZQo+
PiA+PiB0aGUgY2xvY2tzIGFyZSBwYXJlbnRlZCBmcm9tIHRoZSBkZXZpY2UgdHJlZS4KPj4gPj4K
Pj4gPj4gSGF2aW5nIHRoZSBjbG9ja3MgZHJpdmVyIHRyaWdnZXIgYSBwYXJlbnQgY2hhbmdlIHdo
ZW4gcmVxdWVzdGluZyBhIHJhdGUKPj4gPj4gY2hhbmdlIHNvdW5kcyB2ZXJ5IGRhbmdlcm91cywg
SU1ITy4gTXkgTU1DIGNvbnRyb2xsZXIgY2FuIGJlIHBhcmVudGVkIHRvIHRoZQo+PiA+PiBleHRl
cm5hbCA0OCBNSHogb3NjaWxsYXRvciwgYW5kIGlmIHRoZSBjYXJkIHJlcXVlc3RzIDUwIE1Ieiwg
aXQgY291bGQgc3dpdGNoCj4+ID4+IHRvIG9uZSBvZiB0aGUgUExMcy4gVGhhdCB3b3JrcyBhcyBs
b25nIGFzIHRoZSBQTExzIGRvbid0IGNoYW5nZSByYXRlLCBidXQgaWYKPj4gPj4gb25lIGlzIGNv
bmZpZ3VyZWQgYXMgZHJpdmluZyB0aGUgQ1BVIGNsb2NrLCBpdCBiZWNvbWVzIG1lc3N5Lgo+PiA+
PiBUaGUgdGhpbmcgaXMsIHRoZSBjbG9ja3MgZHJpdmVyIGhhcyBubyB3YXkgdG8ga25vdyB3aGV0
aGVyIG9yIG5vdCBpdCBpcwo+PiA+PiAic2FmZSIgdG8gdXNlIGEgZGVzaWduYXRlZCBwYXJlbnQu
Cj4+ID4+Cj4+ID4+IEZvciB0aGF0IHJlYXNvbiwgaW4gcHJhY3RpY2UsIEkgbmV2ZXIgYWN0dWFs
bHkgd2FudCB0byBoYXZlIGEgY2xvY2sKPj4gPj4gcmUtcGFyZW50ZWQgLSBpdCdzIGFsbW9zdCBh
bHdheXMgYSBiYWQgaWRlYSB2cy4gc3RpY2tpbmcgdG8gdGhlIHBhcmVudCBjbG9jawo+PiA+PiBj
b25maWd1cmVkIGluIHRoZSBEVFMuCj4+ID4KPj4gPiBZZWFoLCBhbmQgdGhpcyBpcyB0b3RhbGx5
IGZpbmUuIEJ1dCB3ZSBuZWVkIHRvIGJlIGV4cGxpY2l0IGFib3V0IGl0LiBUaGUKPj4gPiBkZXRl
cm1pbmVfcmF0ZSBpbXBsZW1lbnRhdGlvbiBJIGRpZCBpbiBhbGwgdGhlIHBhdGNoZXMgaXMgYW4g
ZXhhY3QKPj4gPiBlcXVpdmFsZW50IHRvIHRoZSByb3VuZF9yYXRlIG9uZSBpZiB0aGVyZSB3YXMg
b25lLiBXZSB3aWxsIG5ldmVyIGFzayB0bwo+PiA+IGNoYW5nZSB0aGUgcGFyZW50Lgo+PiA+Cj4+
ID4gR2l2ZW4gd2hhdCB5b3UganVzdCBzYWlkLCBJIHdvdWxkIHN1Z2dlc3QgdG8gc2V0IHRoZQo+
PiA+IENMS19TRVRfUkFURV9OT19SRVBBUkVOVCBmbGFnIGFzIHdlbGwuCj4+Cj4+IElkZWFsbHkg
dGhlcmUgc2hvdWxkIGJlIGEgd2F5IGZvciBkcml2ZXJzIGFuZCB0aGUgZGV2aWNlIHRyZWUgdG8K
Pj4gc2F5LCAiY2xvY2sgWCBtdXN0IGJlIGRyaXZlbiBieSBjbG9jayBZIiwgYnV0IHRoZSBjbG9j
ayBmcmFtZXdvcmsKPj4gd291bGQgYmUgYWxsb3dlZCB0byByZS1wYXJlbnQgY2xvY2tzIGZyZWVs
eSBhcyBsb25nIGFzIGl0IGRvZXNuJ3QKPj4gdmlvbGF0ZSBhbnkgRFQgb3IgZHJpdmVyIGNvbnN0
cmFpbnRzLgo+Cj4gSSdtIG5vdCByZWFsbHkgc3VyZSB3aGF0IHlvdSBtZWFuIHRoZXJlLCBzb3Jy
eS4gSXNuJ3QgaXQgd2hhdAo+IGFzc2lnbmVkLWNsb2NrLXBhcmVudHMvY2xrX3NldF9wYXJlbnQo
KSBhdCBwcm9iZSwgcGx1cyBhIGRldGVybWluZV9yYXRlCj4gaW1wbGVtZW50YXRpb24gdGhhdCB3
b3VsZCBhZmZlY3QgYmVzdF9wYXJlbnRfaHcgd291bGQgYWxyZWFkeSBwcm92aWRlPwoKQXNzaWdu
aW5nIHRoZSBwYXJlbnQgY2xvY2sgaW4gdGhlIERUIHdvcmtzIG9uY2UsIGF0IGJvb3QsIGJ1dCBn
b2luZyBvZmYKd2hhdCB5b3Ugd3JvdGUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBpZiB0aGUgY2xv
Y2sgZHJpdmVyIGhhcyBhCi5kZXRlcm1pbmVfcmF0ZSgpIGltcGxlbWVudGF0aW9uIHRoYXQgKmNh
biogcmVwYXJlbnQgY2xvY2tzIHRoZW4gaXQKcHJvYmFibHkgKndpbGwqIHJlcGFyZW50IHRoZW0s
IGFuZCB0aGUgRFQgYXNzaWdubWVudCB3aWxsIGJlIGxvc3QuCgpXaGF0IEknbSBzdWdnZXN0aW5n
IGlzIGEgcnVudGltZSBjb25zdHJhaW50IHRoYXQgdGhlIGNsb2NrIHN1YnN5c3RlbQp3b3VsZCBl
bmZvcmNlLCBhbmQgYWN0aXZlbHkgcHJldmVudCBkcml2ZXJzIGZyb20gY2hhbmdpbmcgdGhlIHBh
cmVudC4KRWl0aGVyIGV4cGxpY2l0bHkgd2l0aCBjbGtfc2V0X3BhcmVudCgpIG9yIGR1ZSB0byAu
ZGV0ZXJtaW5lX3JhdGUoKS4KClRoYXQgd2F5IHlvdSBjb3VsZCB3cml0ZSBhIC5kZXRlcm1pbmVf
cmF0ZSgpIGltcGxlbWVudGF0aW9uIHRoYXQgKmNhbioKc2VsZWN0IGEgYmV0dGVyIHBhcmVudCwg
YnV0IGlmIHRoZSBEVCBhcHBsaWVzIGEgY29uc3RyYWludCB0byBmaXggdGhlCmNsb2NrIHRvIGEg
cGFydGljdWxhciBwYXJlbnQsIHRoZSBjbG9jayBzdWJzeXN0ZW0gd2lsbCBmb3JjZSB0aGF0IHBh
cmVudAp0byBiZSB1c2VkIHNvIHlvdSBjYW4gYmUgc3VyZSB0aGUgY2xvY2sgaXMgbmV2ZXIgcmVw
YXJlbnRlZCBieSBhY2NpZGVudC4KCj4+IFRoYXQgd2F5IGFsbG93aW5nIHJlcGFyZW50aW5nIGRv
ZXNuJ3QgbmVlZCB0byBiZSBhbiBhbGwtb3Itbm90aGluZwo+PiB0aGluZywgYW5kIGl0IGRvZXNu
J3QgbmVlZCB0byBiZSBkZWNpZGVkIGF0IHRoZSBjbG9jayBkcml2ZXIgbGV2ZWwKPj4gd2l0aCBz
cGVjaWFsIGZsYWdzLgo+Cj4gTGlrZSBJIHNhaWQsIHRoZSBkZWZhdWx0IGltcGxlbWVudGF0aW9u
IGlzIGFscmVhZHkgd29ya2luZyB0byB3aGF0IHlvdQo+IHN1Z2dlc3RlZCBpZiBJIHVuZGVyc3Rv
b2QgcHJvcGVybHkuIEhvd2V2ZXIsIHRoaXMgaGFzIG5ldmVyIGJlZW4gdGVzdGVkCj4gZm9yIGFu
eSBvZiB0aGUgZHJpdmVycyBpbiB0aGF0IHNlcmllcyBzbyBJIGRvbid0IHdhbnQgdG8gaW50cm9k
dWNlIChhbmQKPiBkZWJ1ZyA7KSkgcmVncmVzc2lvbnMgaW4gYWxsIHRob3NlIGRyaXZlcnMgdGhh
dCB3ZXJlIG5vdCBzZXR0aW5nIGFueQo+IGNvbnN0cmFpbnQgYnV0IG5ldmVyIGFjdHVhbGx5IHRl
c3RlZCB0aGVpciByZXBhcmVudGluZyBjb2RlLgo+Cj4gU28gdGhhdCBzZXJpZXMgaXMgc3RyaWN0
bHkgZXF1aXZhbGVudCB0byB3aGF0IHlvdSBoYWQgYmVmb3JlLCBpdCdzIGp1c3QKPiBleHBsaWNp
dCBub3cuCj4KPiBJZiB5b3UgZmluZCB0aGF0IHNvbWUgb3RoZXIgZGVjaXNpb24gbWFrZSBzZW5z
ZSBmb3IgeW91ciBkcml2ZXIgaW4KPiBwYXJ0aWN1bGFyIGNhc2VzLCBmZWVsIGZyZWUgdG8gY2hh
bmdlIGl0LiBJIGJhcmVseSBrbm93IG1vc3Qgb2YgdGhlc2UKPiBwbGF0Zm9ybXMsIHNvIEkgd29u
J3QgYmUgYWJsZSB0byBtYWtlIHRoYXQgZGVjaXNpb24gKGFuZCB0ZXN0IGl0KQo+IHVuZm9ydHVu
YXRlbHkuCj4KPiBNYXhpbWUKClRoYXQncyBPSywgSSBkaWRuJ3QgcmV2aWV3IHRoZSBwYXRjaCwg
SSdtIGp1c3QgbWFraW5nIGEgZ2VuZXJhbApzdWdnZXN0aW9uLiA6KQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
