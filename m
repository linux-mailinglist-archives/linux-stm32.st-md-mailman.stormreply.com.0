Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF74A6D7D4C
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 15:04:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 814EEC6A614;
	Wed,  5 Apr 2023 13:04:11 +0000 (UTC)
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 091BFC6A606
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 13:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1680699848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YkbuvCGQOWFY1W5hX/uG2RveqynQ+85wv2M8PGFZ7vc=;
 b=3mEi9sd14RtSilWugED3F/f1NHSVZz/2xsgSbVUMYtohN4iyRWPQuN/0cj7BtjXjYQTI9X
 a6aEynlck8IN4/RYN4tKNy+VG1wAYjPHKb2w1UKNamaQkeW8Ds6o9+R3WX/pE03V9N6Ndu
 0nvl10itS1x2Cw7b1X3xuVSiT51gMLU=
Message-ID: <3c1c42baf7d764bf6429b470f534fd9ec46ddedd.camel@crapouillou.net>
From: Paul Cercueil <paul@crapouillou.net>
To: Maxime Ripard <maxime@cerno.tech>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Andreas
 =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Manivannan Sadhasivam
 <mani@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@microchip.com>, Max Filippov <jcmvbkbc@gmail.com>, Charles
 Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>,  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, David Lechner <david@lechnology.com>, Sekhar
 Nori <nsekhar@ti.com>, Abel Vesa <abelvesa@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Dinh Nguyen <dinguyen@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry
 Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij
 <linus.walleij@linaro.org>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>
Date: Wed, 05 Apr 2023 15:04:05 +0200
In-Reply-To: <20221018-clk-range-checks-fixes-v3-56-9a1358472d52@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-56-9a1358472d52@cerno.tech>
MIME-Version: 1.0
Cc: linux-rtc@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v3 56/65] clk: ingenic: cgu: Switch to
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

SGkgTWF4aW1lLAoKTGUgbWFyZGkgMDQgYXZyaWwgMjAyMyDDoCAxMjoxMSArMDIwMCwgTWF4aW1l
IFJpcGFyZCBhIMOpY3JpdMKgOgo+IFRoZSBJbmdlbmljIENHVSBjbG9ja3MgaW1wbGVtZW50cyBh
IG11eCB3aXRoIGEgc2V0X3BhcmVudCBob29rLCBidXQKPiBkb2Vzbid0IHByb3ZpZGUgYSBkZXRl
cm1pbmVfcmF0ZSBpbXBsZW1lbnRhdGlvbi4KPiAKPiBUaGlzIGlzIGEgYml0IG9kZCwgc2luY2Ug
c2V0X3BhcmVudCgpIGlzIHRoZXJlIHRvLCBhcyBpdHMgbmFtZQo+IGltcGxpZXMsCj4gY2hhbmdl
IHRoZSBwYXJlbnQgb2YgYSBjbG9jay4gSG93ZXZlciwgdGhlIG1vc3QgbGlrZWx5IGNhbmRpZGF0
ZSB0bwo+IHRyaWdnZXIgdGhhdCBwYXJlbnQgY2hhbmdlIGlzIGEgY2FsbCB0byBjbGtfc2V0X3Jh
dGUoKSwgd2l0aAo+IGRldGVybWluZV9yYXRlKCkgZmlndXJpbmcgb3V0IHdoaWNoIHBhcmVudCBp
cyB0aGUgYmVzdCBzdWl0ZWQgZm9yIGEKPiBnaXZlbiByYXRlLgo+IAo+IFRoZSBvdGhlciB0cmln
Z2VyIHdvdWxkIGJlIGEgY2FsbCB0byBjbGtfc2V0X3BhcmVudCgpLCBidXQgaXQncyBmYXIKPiBs
ZXNzCj4gdXNlZCwgYW5kIGl0IGRvZXNuJ3QgbG9vayBsaWtlIHRoZXJlJ3MgYW55IG9idmlvdXMg
dXNlciBmb3IgdGhhdAo+IGNsb2NrLgo+IAo+IFNvLCB0aGUgc2V0X3BhcmVudCBob29rIGlzIGVm
ZmVjdGl2ZWx5IHVudXNlZCwgcG9zc2libHkgYmVjYXVzZSBvZiBhbgo+IG92ZXJzaWdodC4gSG93
ZXZlciwgaXQgY291bGQgYWxzbyBiZSBhbiBleHBsaWNpdCBkZWNpc2lvbiBieSB0aGUKPiBvcmln
aW5hbCBhdXRob3IgdG8gYXZvaWQgYW55IHJlcGFyZW50aW5nIGJ1dCB0aHJvdWdoIGFuIGV4cGxp
Y2l0IGNhbGwKPiB0bwo+IGNsa19zZXRfcGFyZW50KCkuCgpBcyBJIHNhaWQgaW4gdGhlIHYyIChJ
SVJDKSwgY2xrX3NldF9wYXJlbnQoKSBpcyB1c2VkIHdoZW4gcmUtcGFyZW50aW5nCmZyb20gdGhl
IGRldmljZSB0cmVlLgoKPiAKPiBUaGUgZHJpdmVyIGRvZXMgaW1wbGVtZW50IHJvdW5kX3JhdGUo
KSB0aG91Z2gsIHdoaWNoIG1lYW5zIHRoYXQgd2UKPiBjYW4KPiBjaGFuZ2UgdGhlIHJhdGUgb2Yg
dGhlIGNsb2NrLCBidXQgd2Ugd2lsbCBuZXZlciBnZXQgdG8gY2hhbmdlIHRoZQo+IHBhcmVudC4K
PiAKPiBIb3dldmVyLCBJdCdzIGhhcmQgdG8gdGVsbCB3aGV0aGVyIGl0J3MgYmVlbiBkb25lIG9u
IHB1cnBvc2Ugb3Igbm90Lgo+IAo+IFNpbmNlIHdlJ2xsIHN0YXJ0IG1hbmRhdGluZyBhIGRldGVy
bWluZV9yYXRlKCkgaW1wbGVtZW50YXRpb24sIGxldCdzCj4gY29udmVydCB0aGUgcm91bmRfcmF0
ZSgpIGltcGxlbWVudGF0aW9uIHRvIGEgZGV0ZXJtaW5lX3JhdGUoKSwgd2hpY2gKPiB3aWxsIGFs
c28gbWFrZSB0aGUgY3VycmVudCBiZWhhdmlvciBleHBsaWNpdC4gQW5kIGlmIGl0IHdhcyBhbgo+
IG92ZXJzaWdodCwgdGhlIGNsb2NrIGJlaGF2aW91ciBjYW4gYmUgYWRqdXN0ZWQgbGF0ZXIgb24u
CgpTbyBqdXN0IHRvIGJlIHN1cmUsIHRoaXMgcGF0Y2ggd29uJ3QgbWFrZSBjbGtfc2V0X3JhdGUo
KSBhdXRvbWF0aWNhbGx5CnN3aXRjaCBwYXJlbnRzLCByaWdodD8KCkFsbG93aW5nIGF1dG9tYXRp
YyByZS1wYXJlbnRpbmcgc291bmRzIGxpa2UgYSBodWdlIGNhbiBvZiB3b3Jtcy4uLgoKQ2hlZXJz
LAotUGF1bAoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWVAY2Vybm8u
dGVjaD4KPiAtLS0KPiDCoGRyaXZlcnMvY2xrL2luZ2VuaWMvY2d1LmMgfCAxNSArKysrKysrKy0t
LS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2luZ2VuaWMvY2d1LmMgYi9kcml2ZXJzL2Ns
ay9pbmdlbmljL2NndS5jCj4gaW5kZXggMWY3YmEzMGY1YTFiLi4wYzljODM0NGFkMTEgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9jbGsvaW5nZW5pYy9jZ3UuYwo+ICsrKyBiL2RyaXZlcnMvY2xrL2lu
Z2VuaWMvY2d1LmMKPiBAQCAtNDkxLDIyICs0OTEsMjMgQEAgaW5nZW5pY19jbGtfY2FsY19kaXYo
c3RydWN0IGNsa19odyAqaHcsCj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiBkaXY7Cj4gwqB9Cj4g
wqAKPiAtc3RhdGljIGxvbmcKPiAtaW5nZW5pY19jbGtfcm91bmRfcmF0ZShzdHJ1Y3QgY2xrX2h3
ICpodywgdW5zaWduZWQgbG9uZyByZXFfcmF0ZSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgKnBhcmVudF9yYXRlKQo+ICtzdGF0aWMg
aW50IGluZ2VuaWNfY2xrX2RldGVybWluZV9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LAo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc3RydWN0IGNsa19yYXRlX3JlcXVlc3QgKnJlcSkKPiDCoHsKPiDCoMKgwqDC
oMKgwqDCoMKgc3RydWN0IGluZ2VuaWNfY2xrICppbmdlbmljX2NsayA9IHRvX2luZ2VuaWNfY2xr
KGh3KTsKPiDCoMKgwqDCoMKgwqDCoMKgY29uc3Qgc3RydWN0IGluZ2VuaWNfY2d1X2Nsa19pbmZv
ICpjbGtfaW5mbyA9Cj4gdG9fY2xrX2luZm8oaW5nZW5pY19jbGspOwo+IMKgwqDCoMKgwqDCoMKg
wqB1bnNpZ25lZCBpbnQgZGl2ID0gMTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoY2xrX2lu
Zm8tPnR5cGUgJiBDR1VfQ0xLX0RJVikKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ZGl2ID0gaW5nZW5pY19jbGtfY2FsY19kaXYoaHcsIGNsa19pbmZvLAo+ICpwYXJlbnRfcmF0ZSwg
cmVxX3JhdGUpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkaXYgPSBpbmdlbmlj
X2Nsa19jYWxjX2RpdihodywgY2xrX2luZm8sIHJlcS0KPiA+YmVzdF9wYXJlbnRfcmF0ZSwKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXEtPnJhdGUpOwo+IMKgwqDCoMKgwqDCoMKgwqBl
bHNlIGlmIChjbGtfaW5mby0+dHlwZSAmIENHVV9DTEtfRklYRElWKQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgZGl2ID0gY2xrX2luZm8tPmZpeGRpdi5kaXY7Cj4gwqDCoMKgwqDC
oMKgwqDCoGVsc2UgaWYgKGNsa19od19jYW5fc2V0X3JhdGVfcGFyZW50KGh3KSkKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKnBhcmVudF9yYXRlID0gcmVxX3JhdGU7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlcS0+YmVzdF9wYXJlbnRfcmF0ZSA9IHJlcS0+cmF0
ZTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoHJldHVybiBESVZfUk9VTkRfVVAoKnBhcmVudF9yYXRl
LCBkaXYpOwo+ICvCoMKgwqDCoMKgwqDCoHJlcS0+cmF0ZSA9IERJVl9ST1VORF9VUChyZXEtPmJl
c3RfcGFyZW50X3JhdGUsIGRpdik7Cj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIDA7Cj4gwqB9Cj4g
wqAKPiDCoHN0YXRpYyBpbmxpbmUgaW50IGluZ2VuaWNfY2xrX2NoZWNrX3N0YWJsZShzdHJ1Y3Qg
aW5nZW5pY19jZ3UgKmNndSwKPiBAQCAtNjI2LDcgKzYyNyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgY2xrX29wcyBpbmdlbmljX2Nsa19vcHMgPSB7Cj4gwqDCoMKgwqDCoMKgwqDCoC5zZXRfcGFy
ZW50ID0gaW5nZW5pY19jbGtfc2V0X3BhcmVudCwKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqAucmVj
YWxjX3JhdGUgPSBpbmdlbmljX2Nsa19yZWNhbGNfcmF0ZSwKPiAtwqDCoMKgwqDCoMKgwqAucm91
bmRfcmF0ZSA9IGluZ2VuaWNfY2xrX3JvdW5kX3JhdGUsCj4gK8KgwqDCoMKgwqDCoMKgLmRldGVy
bWluZV9yYXRlID0gaW5nZW5pY19jbGtfZGV0ZXJtaW5lX3JhdGUsCj4gwqDCoMKgwqDCoMKgwqDC
oC5zZXRfcmF0ZSA9IGluZ2VuaWNfY2xrX3NldF9yYXRlLAo+IMKgCj4gwqDCoMKgwqDCoMKgwqDC
oC5lbmFibGUgPSBpbmdlbmljX2Nsa19lbmFibGUsCj4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
