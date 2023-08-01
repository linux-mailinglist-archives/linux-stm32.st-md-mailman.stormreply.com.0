Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B4B76BE35
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Aug 2023 21:58:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42BB7C6A5F2;
	Tue,  1 Aug 2023 19:58:34 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B55CCC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Aug 2023 19:58:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 44ECB616D1;
 Tue,  1 Aug 2023 19:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7976AC433C7;
 Tue,  1 Aug 2023 19:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690919910;
 bh=79BwIOnM6SioCje3neXfEamXafGIUojs9GGzwDzIaT8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WaG0UuuiBslQIwwDoxSGmwylSNwUwUH7DIQ7eAy76ZMwNQxm6uzQTZe+DpR8IvAQD
 AR9sF34c6pu020pThaegFYojP886SrOpKscmfRnTNlEgNYWd06/PU127Un7orzG1/E
 9rUKbhIJY4SvTChDop2NC6sJMRkZgC9FxkLKSBCJ5AX8gdvgUcXJEF/V5ZaRjvw4ws
 g4igCCOm2Ui3wG63wvnwlKi2DoXv7gVow1xbUTW25ecmVHjRgzWHzoVjMTgMGAYnGS
 yrqItcGmOO8B2dQEyoty0KKnJhLztUcShDR3TUA3S9ggYOAW7cy5RY8WUi7dlpa5+q
 jNZZJhtmtcNHQ==
Date: Tue, 1 Aug 2023 12:58:28 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <20230801125828.209c5e88@kernel.org>
In-Reply-To: <AS8PR04MB9176FC45B9663B5BF964F58A890AA@AS8PR04MB9176.eurprd04.prod.outlook.com>
References: <20230731161929.2341584-1-shenwei.wang@nxp.com>
 <20230731161929.2341584-2-shenwei.wang@nxp.com>
 <20230801-portside-prepaid-513f1f39f245-mkl@pengutronix.de>
 <AS8PR04MB9176FC45B9663B5BF964F58A890AA@AS8PR04MB9176.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Simon Horman <simon.horman@corigine.com>, Eric Dumazet <edumazet@google.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Wong Vee Khee <veekhee@apple.com>,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 dl-linux-imx <linux-imx@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [EXT] Re: [PATCH v3 net 1/2] net: stmmac: add new
 mode parameter for fix_mac_speed
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, 1 Aug 2023 18:43:52 +0000 Shenwei Wang wrote:
> Subject: RE: [EXT] Re: [PATCH v3 net 1/2] net: stmmac: add new mode parameter  for fix_mac_speed

Looks like new platform enablement, the correct tree to target this 
at is net-next (i.e. [PATCH net-next]).

> > -----Original Message-----
> > From: Marc Kleine-Budde <mkl@pengutronix.de>
> > Sent: Tuesday, August 1, 2023 1:37 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Russell King <linux@armlinux.org.uk>; David S. Miller
> > <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub
> > Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Maxime
> > Coquelin <mcoquelin.stm32@gmail.com>; Shawn Guo <shawnguo@kernel.org>;
> > Sascha Hauer <s.hauer@pengutronix.de>; Neil Armstrong
> > <neil.armstrong@linaro.org>; Kevin Hilman <khilman@baylibre.com>; Vinod
> > Koul <vkoul@kernel.org>; Chen-Yu Tsai <wens@csie.org>; Jernej Skrabec
> > <jernej.skrabec@gmail.com>; Samuel Holland <samuel@sholland.org>; Jose
> > Abreu <joabreu@synopsys.com>; imx@lists.linux.dev; Simon Horman
> > <simon.horman@corigine.com>; Alexandre Torgue
> > <alexandre.torgue@foss.st.com>; Giuseppe Cavallaro
> > <peppe.cavallaro@st.com>; Nobuhiro Iwamatsu
> > <nobuhiro1.iwamatsu@toshiba.co.jp>; Fabio Estevam <festevam@gmail.com>;
> > linux-stm32@st-md-mailman.stormreply.com; Jerome Brunet
> > <jbrunet@baylibre.com>; Bartosz Golaszewski
> > <bartosz.golaszewski@linaro.org>; Wong Vee Khee <veekhee@apple.com>; dl-
> > linux-imx <linux-imx@nxp.com>; Andrew Halaney <ahalaney@redhat.com>;
> > Bhupesh Sharma <bhupesh.sharma@linaro.org>; Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com>; Revanth Kumar Uppala
> > <ruppala@nvidia.com>; Jochen Henneberg <jh@henneberg-systemdesign.com>;
> > linux-amlogic@lists.infradead.org; linux-arm-kernel@lists.infradead.org;
> > netdev@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel
> > Team <kernel@pengutronix.de>
> > Subject: [EXT] Re: [PATCH v3 net 1/2] net: stmmac: add new mode parameter
> > for fix_mac_speed

Why is this quote included? Please get a sane email client.

> > On 31.07.2023 11:19:28, Shenwei Wang wrote:  
> > > A mode parameter has been added to the callback function of
> > > fix_mac_speed to indicate the physical layer type.
> > >
> > > The mode can be one the following:
> > > 	MLO_AN_PHY	- Conventional PHY
> > > 	MLO_AN_FIXED	- Fixed-link mode
> > > 	MLO_AN_INBAND	- In-band protocol
> > >
> > > Also use short version of 'uint' to replace the 'unsigned int' in the
> > > function definitions.  
> > 
> > There are not many users of 'uint' in the kernel and it's not used in the stmmac
> > driver so far. From my point of view I would not introduce it and stick to the
> > standard 'unsigned int'.
> 
> Using 'uint' makes the code look cleaner because adding one extra
> parameter may cause some function declarations to span multiple
> lines.  This change keeps function declarations compact on a single
> line.

Marc is right. Just do it.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
