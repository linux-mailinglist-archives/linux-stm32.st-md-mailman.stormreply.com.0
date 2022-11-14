Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A6462789F
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Nov 2022 10:05:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDE56C6504A;
	Mon, 14 Nov 2022 09:05:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8C6FC035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Nov 2022 09:05:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0AC7E60F67;
 Mon, 14 Nov 2022 09:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA65C433C1;
 Mon, 14 Nov 2022 09:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668416750;
 bh=D7WS1/Iq9HsSGiJfZeeNpWeUbfN2wCTKHRwR1waF5b8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gu23KWX+hkd2VrW8L8cgRL+RvzQoNmHr4ZHYqyx7b9ggw62j+4gl+srj7mMWbYEWO
 eMq9AeoWeTXuHN/JCWdPJOC4s9/SfymP7ivydCT3Rc5lzvj0XxUfCGvOXg+FUovve3
 mBjFDbEU8fbv5pZjeBcZG4yoTG+UTWC2w0hMhrdGaf5jiuivlIjmg6M0icdu4BayDd
 QORZ6I5Y6XZL3p7KDrZaQgns3WiyBQD5S5uJ7AJ3isJBuf/JmKGDVf410NdJ4z5Krb
 lm/rhmS+2/v3szQ2Sg6geE8bZDNcFgYVQt+IzZj3PeuYYzaH8viYNnTeheDKRc95zq
 VsYSZrpR3L72Q==
Date: Mon, 14 Nov 2022 09:05:34 +0000
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <Y3IE3ta8hLLUcu7H@google.com>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
 <CAPDyKFoycVedCJMy0=UK+q5SiPQHqje_8bSN-gdkpBa6KhFfkg@mail.gmail.com>
 <CACRpkdYOj8uozJZO4MV-_OAKeOsQHhoEM=PyynVuNY-JkpgTOw@mail.gmail.com>
 <CAPDyKFr6VeF3s47JfzJ9urtMsEem+GiBtHeU=_S8jNaz-D+qnw@mail.gmail.com>
 <CACRpkdb8uYfs6w99FVjD_t6nZgDhPUx=yB1j=CmpHTHAM2QGQw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdb8uYfs6w99FVjD_t6nZgDhPUx=yB1j=CmpHTHAM2QGQw@mail.gmail.com>
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
 linux-sunxi@lists.linux.dev, linux-rtc@vger.kernel.org,
 linux-clk@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Daniel Vetter <daniel@ffwll.ch>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Stephen Boyd <sboyd@kernel.org>,
 patches@opensource.cirrus.com, Peter De Schrijver <pdeschrijver@nvidia.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <david@lechnology.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v2 35/65] clk: ux500: sysctrl: Add a
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

T24gRnJpLCAxMSBOb3YgMjAyMiwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gT24gVGh1LCBOb3Yg
MTAsIDIwMjIgYXQgMjowNSBQTSBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4g
d3JvdGU6Cj4gPiBPbiBUaHUsIDEwIE5vdiAyMDIyIGF0IDEyOjM5LCBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBUaHUsIE5vdiAx
MCwgMjAyMiBhdCAxMjoyOSBQTSBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4g
d3JvdGU6Cj4gPiA+ID4gT24gRnJpLCA0IE5vdiAyMDIyIGF0IDE0OjMyLCBNYXhpbWUgUmlwYXJk
IDxtYXhpbWVAY2Vybm8udGVjaD4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhlIFVYNTAw
IHN5c2N0cmwgInNldF9wYXJlbnQiIGNsb2NrcyBpbXBsZW1lbnQgYSBtdXggd2l0aCBhIHNldF9w
YXJlbnQKPiA+ID4gPiA+IGhvb2ssIGJ1dCBkb2Vzbid0IHByb3ZpZGUgYSBkZXRlcm1pbmVfcmF0
ZSBpbXBsZW1lbnRhdGlvbi4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIGlzIGEgYml0IG9kZCwg
c2luY2Ugc2V0X3BhcmVudCgpIGlzIHRoZXJlIHRvLCBhcyBpdHMgbmFtZSBpbXBsaWVzLAo+ID4g
PiA+ID4gY2hhbmdlIHRoZSBwYXJlbnQgb2YgYSBjbG9jay4gSG93ZXZlciwgdGhlIG1vc3QgbGlr
ZWx5IGNhbmRpZGF0ZSB0bwo+ID4gPiA+ID4gdHJpZ2dlciB0aGF0IHBhcmVudCBjaGFuZ2UgaXMg
YSBjYWxsIHRvIGNsa19zZXRfcmF0ZSgpLCB3aXRoCj4gPiA+ID4gPiBkZXRlcm1pbmVfcmF0ZSgp
IGZpZ3VyaW5nIG91dCB3aGljaCBwYXJlbnQgaXMgdGhlIGJlc3Qgc3VpdGVkIGZvciBhCj4gPiA+
ID4gPiBnaXZlbiByYXRlLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSBvdGhlciB0cmlnZ2VyIHdv
dWxkIGJlIGEgY2FsbCB0byBjbGtfc2V0X3BhcmVudCgpLCBidXQgaXQncyBmYXIgbGVzcwo+ID4g
PiA+ID4gdXNlZCwgYW5kIGl0IGRvZXNuJ3QgbG9vayBsaWtlIHRoZXJlJ3MgYW55IG9idmlvdXMg
dXNlciBmb3IgdGhhdCBjbG9jay4KPiA+ID4gPgo+ID4gPiA+IElmIEkgcmVjYWxsIGNvcnJlY3Rs
eSwgdGhhdCBpcyB0aGUgdXNlIGNhc2Ugd2UgZGlkIHRhcmdldCBmb3IgdGhlc2UKPiA+ID4gPiB0
eXBlcyBvZiBjbG9ja3MuIFNlZSBzb3VuZC9zb2MvdXg1MDAvdXg1MDBfYWI4NXh4LmMsIGZvciBl
eGFtcGxlLgo+ID4gPgo+ID4gPiBIbSBJIGFtIHRyeWluZyB0byBnZXQgdGhhdCBkcml2ZXIgdG8g
d29yayAuLi4gZnJvbSB0aW1lIHRvIHRpbWUuCj4gPiA+IEl0J3MganVzdCB0aGF0IEFMU0EgU29D
IERUIGhhcyBjaGFuZ2VkIHRvIG11Y2ggdGhhdCBpdCB0dXJucyBvdXQKPiA+ID4gaW50byBhIGNv
bXBsZXRlIHJld3JpdGUgOi8KPiA+ID4KPiA+ID4gU28gaW4gc291bmQvc29jL3V4NTAwL21vcDUw
MF9hYjg1MDAuYwo+ID4gPiBJIHNlZSB0aGlzOgo+ID4gPgo+ID4gPiAgICAgICAgIHN0YXR1cyA9
IGNsa19zZXRfcGFyZW50KGRydmRhdGEtPmNsa19wdHJfaW50Y2xrLCBjbGtfcHRyKTsKPiA+ID4g
ICAgICAgICBpZiAoc3RhdHVzKQo+ID4gPiAoLi4uKQo+ID4gPgo+ID4gPiBhbmQgdGhlcmUgaXMg
ZWxhYm9yYXRlIGNvZGUgdG8gc3dpdGNoIGJldHdlZW4gIlNZU0NMSyIgYW5kCj4gPiA+ICJVTFBD
TEsiICh1bHRhLWxvdyBwb3dlciBjbG9jaykuIEp1c3QgbGlrZSB5b3Ugc2F5Li4uIGhvd2V2ZXIK
PiA+ID4gYSBjbG9jayBuYW1lZCBTWVNDTEsgb3IgVUxQQ0xLIGRvZXMgbm90IGFwcGVhciBpbiB0
aGUKPiA+ID4gY29kZSBpbiBkcml2ZXJzL2Nsay91eDUwMCBvciBhbnkgRFQgYmluZGluZ3Mgc28u
Li4gaXQgc2VlbXMgdG8KPiA+ID4gYmUgbm9uLXdvcmtpbmcgZm9yIHRoZSB0aW1lIGJlaW5nLgo+
ID4KPiA+IEl0J3MgZGVmaW5pdGVseSBub3Qgd29ya2luZywgYnV0IHRoZSBjb3JyZXNwb25kaW5n
IGNsb2NrcyAoInVscGNsayIsCj4gPiAiaW50Y2xrIiwgImF1ZGlvY2xrIiwgZXRjKSBhcmUgYmVp
bmcgcmVnaXN0ZXJlZCBpbiBhYjg1MDBfcmVnX2Nsa3MoKS4KPiA+Cj4gPiBXaGF0IHNlZW1zIHRv
IGJlIG1pc3NpbmcgaXMgYSBEVCBjb252ZXJzaW9uIGZvciB0aGVzZSBjbG9ja3MsIHNvIHRoZXkK
PiA+IGNhbiBiZSBjb25zdW1lZCBwcm9wZXJseS4gUmlnaHQ/Cj4gCj4gWWVwcyB0aGF0IGFuZCBh
IGZldyBtb3JlIHRoaW5ncywgSSBoYXZlIGEgc2NyYXRjaCByZXdyaXRlIGhlcmU6Cj4gaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbGludXN3L2xpbnV4LXN0
ZXJpY3Nzb24uZ2l0L2xvZy8/aD11eDUwMC1hdWRpby1yZXdyaXRlCj4gCj4gSSByZW1lbWJlciBM
ZWUgc2FpZCBoZSBoYWQgYXVkaW8gd29ya2luZyB3aXRoIHRoZSBtYWlubGluZSBrZXJuZWwKPiBv
biBTbm93YmFsbCBhdCBvbmUgcG9pbnQsIHVuZm9ydHVuYXRlbHkgSSB0aGluayB0aGF0IHdhcyBi
ZWZvcmUgd2UKPiBzdGFydGVkIHdpdGggdGhlIERUIGNvbnZlcnNpb25zIGFuZCB0aGVuIHdlIHBy
b2JhYmx5IGJyb2tlIGl0LgoKVGhhdCB3YXMgYWxzbyAxMDAgeWVhcnMgYWdvLiA6KQoKQnV0IHll
cywgaXQgdXNlZCB0byB3b3JrIGF0IG9uZSBwb2ludC4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaW
r10KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
