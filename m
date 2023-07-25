Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A3B7622CA
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jul 2023 21:59:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E602C6A61A;
	Tue, 25 Jul 2023 19:59:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9CF1C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 19:59:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78622618CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 19:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5A5C433CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 19:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690315168;
 bh=jVkGbzOh79AEXIeMVY1s/WgLpPOOReQVmsy9pu11HgA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DEhjBsvrOOkcqhVPMF0ywdTWs8Z08Oh+MPV+DI+LuayXmNg5RPsI+06xanIZr41yf
 RulCXs3D/yfE4rW3H0mBUoYYTTekXk7UtuQu/6tPx6E6UGYoVUP//DcKZnKvYdCY7m
 LDadwlsN3uiJtuz+P/1vbQiCRFS8xJEgzz56R89YkZUyoeWUBmxW/L2f1uTVJKWxhx
 MVlyTrNJ7H+fq//crmAaDyeNM5a++sk5fr1a2lcBtBfETk2FHDfcwxa9aH2EpzoAPn
 zp5i4YLu+nwwjALW0PlPIJnHz+Xa+AmKS5YFoc6mujZXB0gvA8UxLyWev/HbE7XmpG
 j6X5adm3rh5Kg==
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-4fbf09a9139so9364209e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 12:59:28 -0700 (PDT)
X-Gm-Message-State: ABy/qLbwCGp1NM/EpIotJrZRmgS9fMLFLatrAUXwcdnINizc3NjQ9io5
 uNZ06zs4zf72QpM6qHOlfcJUyyzFEzvIi6yOCQ==
X-Google-Smtp-Source: APBJJlFwGjXaJCJydGIeGV4iVYCIq6ysqPH1CxKSwb/h2lZDdMtrrV65McGRvNB57SLo+rUN/j76IhUhQXfq96gAGDg=
X-Received: by 2002:a2e:8786:0:b0:2b6:dd26:c02a with SMTP id
 n6-20020a2e8786000000b002b6dd26c02amr8693672lji.14.1690315146580; Tue, 25 Jul
 2023 12:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230724212222.809909-1-robh@kernel.org>
 <ZMAD25Yp6gCNq+wH@corigine.com>
In-Reply-To: <ZMAD25Yp6gCNq+wH@corigine.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 25 Jul 2023 13:58:54 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+UYF79tUWvHh=5AfrERJPvFRaV4vh1mnbYn_nNjOQTcw@mail.gmail.com>
Message-ID: <CAL_Jsq+UYF79tUWvHh=5AfrERJPvFRaV4vh1mnbYn_nNjOQTcw@mail.gmail.com>
To: Simon Horman <simon.horman@corigine.com>
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 A ndrew Lunn <andrew@lunn.ch>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Sean Anderson <sean.anderson@seco.com>, Kevin Hilman <khilman@baylibre.com>,
 Madalin Bucur <madalin.bucur@nxp.com>, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-omap@vger.kernel.org,
 Alex Elder <elder@kernel.org>, Douglas Miller <dougmill@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-wpan@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Chris Snook <chris.snook@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Stefan Schmidt <stefan@datenfreihafen.org>,
 Yisen Zhuang <yisen.zhuang@huawei.com>,
 Steve Glendinning <steve.glendinning@shawell.net>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Mirko Lindner <mlindner@marvell.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, UNGLinuxDriver@microchip.com,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>,
 Taras Chorny i <taras.chornyi@plvision.eu>,
 Emil Renner Berthing <kernel@esmil.dk>, Andreas Larsson <andreas@gaisler.com>,
 linux-tegra@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Fabio Estevam <festevam@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Shenwei Wang <shenwei.wang@nxp.com>,
 Samin Guo <samin.guo@starfivetech.com>, Francois Romieu <romieu@fr.zoreil.com>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, John Crispin <john@phrozen.org>,
 Salil Mehta <salil.mehta@huawei.com>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Timur Tabi <timur@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Alexander Aring <alex.aring@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Russell King <linux@armlinux.org.uk>, Clark Wang <xiaoning.wang@nxp.com>,
 Alex Elder <elder@linaro.org>, Jakub Kicinski <kuba@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>, Wei Fang <wei.fang@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Marcin Wojtas <mw@semihalf.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Li Yang <leoyang.li@nxp.com>, Stephen Hemminger <stephen@networkplumber.org>,
 Vinod Koul <vkoul@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH v2] net: Explicitly include correct DT
	includes
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

T24gVHVlLCBKdWwgMjUsIDIwMjMgYXQgMTE6MTjigK9BTSBTaW1vbiBIb3JtYW4gPHNpbW9uLmhv
cm1hbkBjb3JpZ2luZS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMjQsIDIwMjMgYXQgMDM6
MjI6MTZQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4KPiAuLi4KPgo+ID4gIDkwIGZpbGVz
IGNoYW5nZWQsIDg4IGluc2VydGlvbnMoKyksIDkyIGRlbGV0aW9ucygtKQo+Cj4gSGkgUm9iLAo+
Cj4gSSBzdXBwb3NlIHRoYXQgaXQncyByZWFzb25hYmxlIHRvIHRha2UgdGhpcyBwYXRjaCB0aHJv
dWdoIG5ldGRldi4KPiBCdXQgaXQgZG9lcyBoYXZlIGEgcHJldHR5IHdpZGUgc3VyZmFjZSwgYW5k
IG5ldGRldiBtb3ZlcyBhIGxvdC4KPgo+IEFzIGl0IHN0YW5kcyB0aGUgcGF0Y2ggZG9lc24ndCBh
cHBseSBkdWUgdG8gYSBjb25mbGljdAo+IGluIGR3bWFjLXFjb20tZXRocW9zLmMKCkl0IGRpZCB5
ZXN0ZXJkYXkuLi4gQW55d2F5cywgbG9va3MgbGlrZSAwLWRheSBkZWNpZGVkIHRvIGZpbmQgc29t
ZXRoaW5nIGVsc2UuCgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
