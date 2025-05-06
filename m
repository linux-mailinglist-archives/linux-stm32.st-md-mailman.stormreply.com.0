Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E05CFAAD10F
	for <lists+linux-stm32@lfdr.de>; Wed,  7 May 2025 00:39:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91C9DC78F87;
	Tue,  6 May 2025 22:39:53 +0000 (UTC)
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 945ECC78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 22:39:52 +0000 (UTC)
Message-ID: <39753b36-adfd-4e00-beea-b58c1e5606e3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1746571191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MGtKCWxeeCvHWwIXpg+TiH0nAUubbBX52QN4JIdpmDA=;
 b=dBxvYUbGFjSvYPErgbn2TcYVIGRVNpmNzM/8TioVlNVuOPAa0Eoy6QGm+QMdUJI1S/c5Kk
 SH90tg7O5nhrD6XwUoh5Kwh5p7UVhNWbyid5ILzAO3KUTRUQVfpGfA+046gTFSNWjxZrFe
 YFaKCJiQNFIjmHFD29gIbGGiKmhAgZ0=
Date: Tue, 6 May 2025 18:39:43 -0400
MIME-Version: 1.0
To: Vladimir Oltean <vladimir.oltean@nxp.com>
References: <20250506215841.54rnxy3wqtlywxgb@skbuf>
 <20250415193323.2794214-1-sean.anderson@linux.dev>
 <20250415193323.2794214-1-sean.anderson@linux.dev>
 <20250415193323.2794214-6-sean.anderson@linux.dev>
 <20250415193323.2794214-6-sean.anderson@linux.dev>
 <20250506215841.54rnxy3wqtlywxgb@skbuf>
 <50e809ea-62a4-413d-af63-7900929c3247@linux.dev>
 <50e809ea-62a4-413d-af63-7900929c3247@linux.dev>
 <20250506221834.uw5ijjeyinehdm3x@skbuf>
 <d66ac48c-8fe3-4782-9b36-8506bb1da779@linux.dev>
 <20250506222928.fozoqcxuf7roxur5@skbuf>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250506222928.fozoqcxuf7roxur5@skbuf>
X-Migadu-Flow: FLOW_OUT
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Madalin Bucur <madalin.bucur@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "David S . Miller" <davem@davemloft.net>, Joyce Ooi <joyce.ooi@intel.com>,
 Russell King <linux@armlinux.org.uk>, Clark Wang <xiaoning.wang@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 Kory Maincent <kory.maincent@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com,
 Andrew Lunn <andrew+netdev@lunn.ch>,
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

On 5/6/25 18:29, Vladimir Oltean wrote:
> On Tue, May 06, 2025 at 06:20:32PM -0400, Sean Anderson wrote:
>> On 5/6/25 18:18, Vladimir Oltean wrote:
>> > On Tue, May 06, 2025 at 06:03:35PM -0400, Sean Anderson wrote:
>> >> On 5/6/25 17:58, Vladimir Oltean wrote:
>> >> > Hello Sean,
>> >> > 
>> >> > On Tue, Apr 15, 2025 at 03:33:17PM -0400, Sean Anderson wrote:
>> >> >> diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
>> >> >> index 23b40e9eacbb..bacba1dd52e2 100644
>> >> >> --- a/drivers/net/pcs/pcs-lynx.c
>> >> >> +++ b/drivers/net/pcs/pcs-lynx.c
>> >> >> @@ -1,11 +1,15 @@
>> >> >> -// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>> >> >> -/* Copyright 2020 NXP
>> >> >> +// SPDX-License-Identifier: GPL-2.0+
>> >> >> +/* Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
>> >> >> + * Copyright 2020 NXP
>> >> >>   * Lynx PCS MDIO helpers
>> >> >>   */
>> >> >>  
>> >> >> -MODULE_DESCRIPTION("NXP Lynx PCS phylink library");
>> >> >> -MODULE_LICENSE("Dual BSD/GPL");
>> >> >> +MODULE_DESCRIPTION("NXP Lynx PCS phylink driver");
>> >> >> +MODULE_LICENSE("GPL");
>> >> > 
>> >> > What's the idea with the license change for this code?
>> >> 
>> >> I would like to license my contributions under the GPL in order to
>> >> ensure that they remain free software.
>> >> 
>> >> --Sean
>> > 
>> > But in the process, you are relicensing code which is not yours.
>> > Do you have agreement from the copyright owners of this file that the
>> > license can be changed?
>> 
>> I'm not relicensing anything. It's already (GPL OR BSD-3-Clause). I'm
>> just choosing not to license my contributions under BSD-3-Clause.
>> 
>> --Sean
> 
> You will need to explain that better, because what I see is that the
> "BSD-3-Clause" portion of the license has disappeared and that applies
> file-wide, not just to your contribution.

But I also have the option to just use the GPL-2.0+ license. When you
have an SPDX like (GPL-2.0+ OR BSD-3-Clause) that means the authors gave
permission to relicense it as

- BSD-3-Clause
- GPL-2.0+
- GPL-2.0+ OR BSD-3-Clause
- GPL-2.0
- GPL-2.0 OR BSD-3-Clause
- GPL-3.0
- GPL-3.0 OR BSD-3-Clause
- GPL-4.0 (if it ever happens)

I want my contributions to remain free software, so I don't want to
allow someone to take the BSD-3-Clause option (without the GPL).

--Sean
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
