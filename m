Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 749A9AAD1BD
	for <lists+linux-stm32@lfdr.de>; Wed,  7 May 2025 01:57:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11B94C78F8C;
	Tue,  6 May 2025 23:57:17 +0000 (UTC)
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6653EC78F8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 23:57:16 +0000 (UTC)
Received: from local
 by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.98.2) (envelope-from <daniel@makrotopia.org>)
 id 1uCS3l-000000004RO-19ao; Tue, 06 May 2025 23:56:44 +0000
Date: Wed, 7 May 2025 00:56:38 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Message-ID: <aBqhtl3m03J6pw3V@makrotopia.org>
References: <20250415193323.2794214-6-sean.anderson@linux.dev>
 <20250506215841.54rnxy3wqtlywxgb@skbuf>
 <20250415193323.2794214-1-sean.anderson@linux.dev>
 <20250415193323.2794214-1-sean.anderson@linux.dev>
 <20250415193323.2794214-6-sean.anderson@linux.dev>
 <20250415193323.2794214-6-sean.anderson@linux.dev>
 <20250506215841.54rnxy3wqtlywxgb@skbuf>
 <50e809ea-62a4-413d-af63-7900929c3247@linux.dev>
 <50e809ea-62a4-413d-af63-7900929c3247@linux.dev>
 <20250506221834.uw5ijjeyinehdm3x@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250506221834.uw5ijjeyinehdm3x@skbuf>
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Madalin Bucur <madalin.bucur@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "David S . Miller" <davem@davemloft.net>, Joyce Ooi <joyce.ooi@intel.com>,
 Russell King <linux@armlinux.org.uk>, Clark Wang <xiaoning.wang@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 imx@lists.linux.dev, Kory Maincent <kory.maincent@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, upstream@airoha.com,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [net-next PATCH v3 05/11] net: pcs: lynx: Convert
 to an MDIO driver
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

On Wed, May 07, 2025 at 01:18:34AM +0300, Vladimir Oltean wrote:
> On Tue, May 06, 2025 at 06:03:35PM -0400, Sean Anderson wrote:
> > On 5/6/25 17:58, Vladimir Oltean wrote:
> > > Hello Sean,
> > > 
> > > On Tue, Apr 15, 2025 at 03:33:17PM -0400, Sean Anderson wrote:
> > >> diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
> > >> index 23b40e9eacbb..bacba1dd52e2 100644
> > >> --- a/drivers/net/pcs/pcs-lynx.c
> > >> +++ b/drivers/net/pcs/pcs-lynx.c
> > >> @@ -1,11 +1,15 @@
> > >> -// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> > >> -/* Copyright 2020 NXP
> > >> +// SPDX-License-Identifier: GPL-2.0+
> > >> +/* Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
> > >> + * Copyright 2020 NXP
> > >>   * Lynx PCS MDIO helpers
> > >>   */
> > >>  
> > >> -MODULE_DESCRIPTION("NXP Lynx PCS phylink library");
> > >> -MODULE_LICENSE("Dual BSD/GPL");
> > >> +MODULE_DESCRIPTION("NXP Lynx PCS phylink driver");
> > >> +MODULE_LICENSE("GPL");
> > > 
> > > What's the idea with the license change for this code?
> > 
> > I would like to license my contributions under the GPL in order to
> > ensure that they remain free software.
> > 
> > --Sean
> 
> But in the process, you are relicensing code which is not yours.
> Do you have agreement from the copyright owners of this file that the
> license can be changed?
> 

I think there is a misunderstanding here.

Of course the licence for the file remains dual BSD-3-Clause and GPL-2.0+ up
to the change Sean wants to contribute. However, as he only permits GPL-2.0+
the file after applying the change would then only be covered by GPL-2.0+ and
no longer by BSD-3-Clause. Legally speaking there is no need to ask any of the
previous authors for permission because they already agreed on having the
code under GPL-2.0+ **OR** BSD-3-Clause, which means that everyone is free
to distribute it under GPL-2.0+ (which is already the case when distributing
it along with the Linux Kernel, obviously). Only netdev maintainers need to
agree to drop the BSD-3-Clause licence **from future versions including his
changes**, and there are obviously reasons for and against that.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
