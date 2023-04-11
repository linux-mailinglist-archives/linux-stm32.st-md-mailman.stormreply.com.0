Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF4D6DD7E9
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Apr 2023 12:28:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1AE3C65E4F;
	Tue, 11 Apr 2023 10:28:15 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA578C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 10:28:13 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id bl22so23054202oib.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 03:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681208892;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9k4ZTujQ4vL3rn+nuolFAvnH5smJoZ+VnOtxKctHstQ=;
 b=gG5N4+mMS8HEB+e6BYdCXNeoFMgAEdh+y0yvxJRZ/CQew3Q7E3JtOcMRepz7Ho/IEB
 AYbqbac4mziTin20ZswQvJjVv2GXLpc5oonCmwfoFiNBw4+ECrY4aSGj/rcfH6q6vYe2
 UM2BZ0PbylZA1f0hpFNHNDDjQFBUFRW0xhVsUYr5QBgm7oPHWwGW6kTj2jSqTCswxti3
 A43Ad7wTtakJqwthU3tVSRfYdaTL93dHnSDRvARqSighRkkizrM5Ex3IFdqNqXrscA3Y
 daImNctoszVuYEgE0VIHmFGsRKmVN2e7Og1N4mcKsfF24QMgcdZ/IzLIVwReDZ6cSbXz
 z2CQ==
X-Gm-Message-State: AAQBX9dxtt7fSNck8TSt+B0tVLJEfZKa7slbEDb1boJxvNgkPYoRo/bU
 DZKSvIdgQwX1fSbNeN0W5qtyVzq5if/jezWr
X-Google-Smtp-Source: AKy350ZTeA95unnbZ4SPUD3oxz5t2po7FhsgGZskuhD+vHjmXChgojnp+D0y2/mstm8pd5hoRoqMtA==
X-Received: by 2002:a05:6808:652:b0:387:64ee:eaca with SMTP id
 z18-20020a056808065200b0038764eeeacamr5986626oih.30.1681208892209; 
 Tue, 11 Apr 2023 03:28:12 -0700 (PDT)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com.
 [209.85.160.49]) by smtp.gmail.com with ESMTPSA id
 k124-20020aca3d82000000b0038bae910f7bsm3072730oia.1.2023.04.11.03.28.11
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 03:28:12 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-1841c57c221so11458661fac.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 03:28:11 -0700 (PDT)
X-Received: by 2002:a25:d74c:0:b0:b46:c5aa:86ef with SMTP id
 o73-20020a25d74c000000b00b46c5aa86efmr5126210ybg.12.1681208871324; Tue, 11
 Apr 2023 03:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-28-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-28-9a1358472d52@cerno.tech>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Apr 2023 12:27:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUEOP_3zjf8nwDyHvZVG-D0AsBjnr=esKzejMMcEiLSQ@mail.gmail.com>
Message-ID: <CAMuHMdXUEOP_3zjf8nwDyHvZVG-D0AsBjnr=esKzejMMcEiLSQ@mail.gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
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
 linux-mediatek@lists.infradead.org,
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
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
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

Q0MgR2FyZXRoLCBIZXJ2w6ksIE1pcXVlbCwgUmFscGgKCk9uIFR1ZSwgQXByIDQsIDIwMjMgYXQg
Mjo0NOKAr1BNIE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPiB3cm90ZToKPiBUaGUg
UmVuZXNhcyByOWEwNmcwMzIgYml0c2VsZWN0IGNsb2NrIGltcGxlbWVudHMgYSBtdXggd2l0aCBh
IHNldF9wYXJlbnQKPiBob29rLCBidXQgZG9lc24ndCBwcm92aWRlIGEgZGV0ZXJtaW5lX3JhdGUg
aW1wbGVtZW50YXRpb24uCj4KPiBUaGlzIGlzIGEgYml0IG9kZCwgc2luY2Ugc2V0X3BhcmVudCgp
IGlzIHRoZXJlIHRvLCBhcyBpdHMgbmFtZSBpbXBsaWVzLAo+IGNoYW5nZSB0aGUgcGFyZW50IG9m
IGEgY2xvY2suIEhvd2V2ZXIsIHRoZSBtb3N0IGxpa2VseSBjYW5kaWRhdGUgdG8KPiB0cmlnZ2Vy
IHRoYXQgcGFyZW50IGNoYW5nZSBpcyBhIGNhbGwgdG8gY2xrX3NldF9yYXRlKCksIHdpdGgKPiBk
ZXRlcm1pbmVfcmF0ZSgpIGZpZ3VyaW5nIG91dCB3aGljaCBwYXJlbnQgaXMgdGhlIGJlc3Qgc3Vp
dGVkIGZvciBhCj4gZ2l2ZW4gcmF0ZS4KPgo+IFRoZSBvdGhlciB0cmlnZ2VyIHdvdWxkIGJlIGEg
Y2FsbCB0byBjbGtfc2V0X3BhcmVudCgpLCBidXQgaXQncyBmYXIgbGVzcwo+IHVzZWQsIGFuZCBp
dCBkb2Vzbid0IGxvb2sgbGlrZSB0aGVyZSdzIGFueSBvYnZpb3VzIHVzZXIgZm9yIHRoYXQgY2xv
Y2suCj4KPiBTbywgdGhlIHNldF9wYXJlbnQgaG9vayBpcyBlZmZlY3RpdmVseSB1bnVzZWQsIHBv
c3NpYmx5IGJlY2F1c2Ugb2YgYW4KPiBvdmVyc2lnaHQuIEhvd2V2ZXIsIGl0IGNvdWxkIGFsc28g
YmUgYW4gZXhwbGljaXQgZGVjaXNpb24gYnkgdGhlCj4gb3JpZ2luYWwgYXV0aG9yIHRvIGF2b2lk
IGFueSByZXBhcmVudGluZyBidXQgdGhyb3VnaCBhbiBleHBsaWNpdCBjYWxsIHRvCj4gY2xrX3Nl
dF9wYXJlbnQoKS4KPgo+IFRoZSBsYXR0ZXIgY2FzZSB3b3VsZCBiZSBlcXVpdmFsZW50IHRvIHNl
dHRpbmcgdGhlIGZsYWcKPiBDTEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQsIHRvZ2V0aGVyIHdpdGgg
c2V0dGluZyBvdXIgZGV0ZXJtaW5lX3JhdGUgaG9vawo+IHRvIF9fY2xrX211eF9kZXRlcm1pbmVf
cmF0ZSgpLiBJbmRlZWQsIGlmIG5vIGRldGVybWluZV9yYXRlCj4gaW1wbGVtZW50YXRpb24gaXMg
cHJvdmlkZWQsIGNsa19yb3VuZF9yYXRlKCkgKHRocm91Z2gKPiBjbGtfY29yZV9yb3VuZF9yYXRl
X25vbG9jaygpKSB3aWxsIGNhbGwgaXRzZWxmIG9uIHRoZSBwYXJlbnQgaWYKPiBDTEtfU0VUX1JB
VEVfUEFSRU5UIGlzIHNldCwgYW5kIHdpbGwgbm90IGNoYW5nZSB0aGUgY2xvY2sgcmF0ZQo+IG90
aGVyd2lzZS4gX19jbGtfbXV4X2RldGVybWluZV9yYXRlKCkgaGFzIHRoZSBleGFjdCBzYW1lIGJl
aGF2aW9yIHdoZW4KPiBDTEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQgaXMgc2V0Lgo+Cj4gQW5kIGlm
IGl0IHdhcyBhbiBvdmVyc2lnaHQsIHRoZW4gd2UgYXJlIGF0IGxlYXN0IGV4cGxpY2l0IGFib3V0
IG91cgo+IGJlaGF2aW9yIG5vdyBhbmQgaXQgY2FuIGJlIGZ1cnRoZXIgcmVmaW5lZCBkb3duIHRo
ZSBsaW5lLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRl
Y2g+CgpMR1RNLCBzbwpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5l
c2FzQGdsaWRlci5iZT4KQnV0IEkgZG8gbm90IGhhdmUgdGhlIGhhcmR3YXJlLgoKPiAtLS0gYS9k
cml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA2ZzAzMi1jbG9ja3MuYwo+ICsrKyBiL2RyaXZlcnMvY2xr
L3JlbmVzYXMvcjlhMDZnMDMyLWNsb2Nrcy5jCj4gQEAgLTExMjEsNiArMTEyMSw3IEBAIHN0YXRp
YyBpbnQgcjlhMDZnMDMyX2Nsa19tdXhfc2V0X3BhcmVudChzdHJ1Y3QgY2xrX2h3ICpodywgdTgg
aW5kZXgpCj4gIH0KPgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19vcHMgY2xrX2JpdHNlbGVj
dF9vcHMgPSB7Cj4gKyAgICAgICAuZGV0ZXJtaW5lX3JhdGUgPSBfX2Nsa19tdXhfZGV0ZXJtaW5l
X3JhdGUsCj4gICAgICAgICAuZ2V0X3BhcmVudCA9IHI5YTA2ZzAzMl9jbGtfbXV4X2dldF9wYXJl
bnQsCj4gICAgICAgICAuc2V0X3BhcmVudCA9IHI5YTA2ZzAzMl9jbGtfbXV4X3NldF9wYXJlbnQs
Cj4gIH07Cj4gQEAgLTExNDUsNyArMTE0Niw3IEBAIHI5YTA2ZzAzMl9yZWdpc3Rlcl9iaXRzZWwo
c3RydWN0IHI5YTA2ZzAzMl9wcml2ICpjbG9ja3MsCj4KPiAgICAgICAgIGluaXQubmFtZSA9IGRl
c2MtPm5hbWU7Cj4gICAgICAgICBpbml0Lm9wcyA9ICZjbGtfYml0c2VsZWN0X29wczsKPiAtICAg
ICAgIGluaXQuZmxhZ3MgPSBDTEtfU0VUX1JBVEVfUEFSRU5UOwo+ICsgICAgICAgaW5pdC5mbGFn
cyA9IENMS19TRVRfUkFURV9QQVJFTlQgfCBDTEtfU0VUX1JBVEVfTk9fUkVQQVJFTlQ7Cj4gICAg
ICAgICBpbml0LnBhcmVudF9uYW1lcyA9IG5hbWVzOwo+ICAgICAgICAgaW5pdC5udW1fcGFyZW50
cyA9IDI7Cj4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2Vl
cnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9u
ZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25z
IHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4g
SSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29t
ZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51
cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
