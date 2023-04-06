Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7356DA958
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Apr 2023 09:22:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFEC3C6B44B;
	Fri,  7 Apr 2023 07:22:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D133C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 15:21:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D7C211C0A;
 Thu,  6 Apr 2023 08:22:08 -0700 (PDT)
Received: from [10.2.7.51] (stinger.cambridge.arm.com [10.2.7.51])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADE653F762;
 Thu,  6 Apr 2023 08:21:17 -0700 (PDT)
Message-ID: <a54a4ea0-f9f5-6869-9629-747c3889a1de@arm.com>
Date: Thu, 6 Apr 2023 16:21:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-36-9a1358472d52@cerno.tech>
From: Pawel Moll <pawel.moll@arm.com>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-36-9a1358472d52@cerno.tech>
X-Mailman-Approved-At: Fri, 07 Apr 2023 07:22:33 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-phy@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
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
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jaroslav Kysela <perex@perex.cz>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH v3 36/65] clk: versatile: sp810: Add a
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

T24gMDQvMDQvMjAyMyAxMToxMSwgTWF4aW1lIFJpcGFyZCB3cm90ZToKPiBUaGUgVmVyc2F0aWxl
IHNwODEwICJ0aW1lcmNsa2VuIiBjbG9jayBpbXBsZW1lbnRzIGEgbXV4IHdpdGggYQo+IHNldF9w
YXJlbnQgaG9vaywgYnV0IGRvZXNuJ3QgcHJvdmlkZSBhIGRldGVybWluZV9yYXRlIGltcGxlbWVu
dGF0aW9uLgo+IAo+IFRoaXMgaXMgYSBiaXQgb2RkLCBzaW5jZSBzZXRfcGFyZW50KCkgaXMgdGhl
cmUgdG8sIGFzIGl0cyBuYW1lIGltcGxpZXMsCj4gY2hhbmdlIHRoZSBwYXJlbnQgb2YgYSBjbG9j
ay4gCgpFeHBsYW5hdGlvbiBvZiB0aGlzIG15c3RlcnkgaXMgcHJldHR5IHNpbXBsZSAtIHRoZSBv
cmlnaW5hbCBwYXRjaDoKCgljb21taXQgNmU5NzNkMmM0Mzg1MDJkY2Y5NTZlNzYzMDUyNThiYTdk
MWM3ZDFkMwoJQXV0aG9yOiBQYXdlbCBNb2xsIDxwYXdlbC5tb2xsQGFybS5jb20+CglEYXRlOiAg
IFRodSBBcHIgMTggMTg6MjM6MjIgMjAxMyArMDEwMAoKCSAgICBjbGs6IHZleHByZXNzOiBBZGQg
c2VwYXJhdGUgU1A4MTAgZHJpdmVyCgpwcmVkYXRlcyBpbnRyb2R1Y3Rpb24gb2YgZGV0ZXJtaW5l
X3JhdGUgdG8gY2xrX29wcy4uLgoKCWNvbW1pdCA3MTQ3MmMwYzA2Y2Y5YTNkMTU0MDc2MmVhMjA1
NjU0YzU4NGUzYmM0CglBdXRob3I6IEphbWVzIEhvZ2FuIDxqaG9nYW5Aa2VybmVsLm9yZz4KCURh
dGU6ICAgTW9uIEp1bCAyOSAxMjoyNTowMCAyMDEzICswMTAwCgoJICAgIGNsazogYWRkIHN1cHBv
cnQgZm9yIGNsb2NrIHJlcGFyZW50IG9uIHNldF9yYXRlCgphbmQgY2xlYXJseSBubyBvbmUgKHRo
ZSBhdXRob3IgaW5jbHVkZWQgOy0pIGJvdGhlcmVkIHRvIGhhdmUgYW5vdGhlcgpsb29rIGF0IHRo
aXMgc2lkZSBvZiB0aGUgZHJpdmVyLgoKPiBBbmQgaWYgaXQgd2FzIGFuIG92ZXJzaWdodCwgdGhl
biB3ZSBhcmUgYXQgbGVhc3QgZXhwbGljaXQgYWJvdXQgb3VyCj4gYmVoYXZpb3Igbm93IGFuZCBp
dCBjYW4gYmUgZnVydGhlciByZWZpbmVkIGRvd24gdGhlIGxpbmUuCgpJdCdzIGJlZW4gb25lIGhl
bGwgb2YgYSBtZW1vcnkgbGFuZSB0cmlwLCBidXQgbXkgcmVjb2xsZWN0aW9uIHN1Z2dlc3QKdGhh
dCB0aGUgbWFpbiBnb2FsIG9mIHRoZSBkcml2ZXIgd2FzIHNpbXBseSBpbml0aWFsaXNhdGlvbiBv
ZiB0aGUgbXV4CnRvIHNlbGVjdCB0aGUgMU1IeiBwYXJlbnQsIGJlY2F1c2UgdGhlIG90aGVyIG9w
dGlvbiAtIDMya0h6IC0ganVzdApkaWRuJ3QgbWFrZSBhbnkgc2Vuc2Ugd2hhdHNvZXZlci4gQW5k
IHRoYXQgd291bGQgYmUgdGhlIGNhc2Ugb24gZXZlcnkKc2luZ2xlIHBsYXRmb3JtIHVzaW5nIFNQ
ODEwIEkga25vdyAob3IgYXQgbGVhc3Q6IGtuZXcpLCBzbyBpdCdzIHNlZW1zCnRvIG1lIHRoYXQg
bWFraW5nIHRoZSBzdGF0ZSBwZXJtYW5lbnQsIGFzIHlvdSdyZSBzdWdnZXN0aW5nIChvciBJCnRo
aW5rIHlvdSdyZSBzdWdnZXN0aW5nPykgaXQncyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8uCgpUaGFu
a3MhCgpQYXdlxYIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
