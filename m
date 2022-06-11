Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A53ED547510
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Jun 2022 15:58:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B162C5F1F1;
	Sat, 11 Jun 2022 13:58:09 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 043DAC5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jun 2022 13:58:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7C141B816AD;
 Sat, 11 Jun 2022 13:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FBCC34116;
 Sat, 11 Jun 2022 13:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654955886;
 bh=nbFGh7icD9NslwLu6nhPgTSnek+SfmmZhWf7P+5Ny8A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UmWdJYYOx2uNSGz9CgyVRZf7Iz8aVNIzGSC+5v8ilWDX/MiVq9rr2PzYv+k3kImhk
 Dg5bxisg5HqmdOnOt0QDuNZzApXfOV3p8J8lXL2QeCV9gRUr0WYP6WuoiC2yG/ZiKO
 xAJyZy93UG7Fy8bPXIowGrSbP/94Q6I6rKv0j4m2XyeThYt9nLnZnVNt2IgdcBbOs9
 KCQ8Bt5th2zh1s0z3uYp3ec3Aq8Nwj4nkJVqhdZn64UEwVhx2n0FhfXD4fQT/JL3VF
 OYtYVjzewS2i7BQdTpjtQwQZFDuPtaXZxyLIvSzdC8hFjiN/x/20m2kW+u9Cl8U94A
 rMLdoTWEooFcg==
Date: Sat, 11 Jun 2022 15:07:04 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>
Message-ID: <20220611150704.483ccccd@jic23-huawei>
In-Reply-To: <a67d3d01824db6376c2f15949021db4f2b6173cb.camel@gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
 <20220610084545.547700-7-nuno.sa@analog.com>
 <CAHp75VcU-oV4is_y9=oaOx2ugvTEOy53h2wvbd3-Z9_gv5Y=zA@mail.gmail.com>
 <a67d3d01824db6376c2f15949021db4f2b6173cb.camel@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio <linux-iio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nancy Yuen <yuenn@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Gross <agross@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Zhang Rui <rui.zhang@intel.com>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gwendal Grignou <gwendal@chromium.org>, Tali Perry <tali.perry1@gmail.com>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Thara Gopinath <thara.gopinath@linaro.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH 06/34] iio: adc: ingenic-adc: explicitly
 add proper header files
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

T24gRnJpLCAxMCBKdW4gMjAyMiAyMTo0OToyMiArMDIwMApOdW5vIFPDoSA8bm9uYW1lLm51bm9A
Z21haWwuY29tPiB3cm90ZToKCj4gT24gRnJpLCAyMDIyLTA2LTEwIGF0IDE2OjQ1ICswMjAwLCBB
bmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gPiBPbiBGcmksIEp1biAxMCwgMjAyMiBhdCAxMDo0NiBB
TSBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPiB3cm90ZTogIAo+ID4gPiAKPiA+ID4gRG8g
bm90IHRydXN0IHRoZSBmYWN0IHRoYXQgaWlvLmggaW5jbHVkZXMgb2YuaCB3aGljaCBpbiB0dXJu
Cj4gPiA+IGluY2x1ZGVzCj4gPiA+IGFsbCB0aGUgaGVhZGVycyB3ZSBhcmUgcmVseWluZyBvbi4K
PiA+ID4gCj4gPiA+IFRoZSB1bHRpbWF0ZSBnb2FsIGlzIHRvIGFjdHVhbGx5IGRyb3Agb2YuaCBm
cm9tIGlpby5oLiAgCj4gPiAKPiA+IC4uLgo+ID4gICAKPiA+ID4gwqAjaW5jbHVkZSA8bGludXgv
bW9kX2RldmljZXRhYmxlLmg+Cj4gPiA+IMKgI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+Cj4gPiA+
IMKgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ID4gPiArI2luY2x1ZGUgPGxp
bnV4L3Byb3BlcnR5Lmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvb2YuaD4gIAo+ID4gCj4gPiBP
cmRlcmluZyAoZnJvbSB0aGUgY29udGV4dCBJIGRvbid0IHNlZSBpdCdzIG1lc3NlZCB1cCBhbHJl
YWR5KQo+ID4gICAKPiAKPiBXaWxsIGRvdWJsZSBjaGVjayBvbiB2Mi4uLgoKRml4ZWQgdXAgd2hp
bHN0IGFwcGx5aW5nLi4uCgo+IAo+IC0gTnVubyBTw6EKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
