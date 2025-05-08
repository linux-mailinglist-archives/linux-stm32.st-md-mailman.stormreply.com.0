Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6656AAFFBD
	for <lists+linux-stm32@lfdr.de>; Thu,  8 May 2025 17:57:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 642C4C7A821;
	Thu,  8 May 2025 15:57:56 +0000 (UTC)
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com
 [91.218.175.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48B47C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 May 2025 15:57:55 +0000 (UTC)
Message-ID: <b4b662cc-7b56-4e96-b3d1-7d19e2663cb1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1746719874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oCf3z7hOXG7UGs2boSQYoGffK4tgAQHTQeG/mcAB+UQ=;
 b=lJPdaR3Fu+V9MjBKhXVqjM5ARaeWWWBzH7gr12dEMCD3CyGBvWqwd2190MaRx7p69jMmIS
 me9Q+Sv/63NVqHv5s6kUGxzTe24eHPO6Fi/A8TEbUJ//ht6I79MVTUFYi9LC30wv9H4eY/
 baAF+k0hlVlEkJfa+yDCdl8n+4ngxXg=
Date: Thu, 8 May 2025 11:57:46 -0400
MIME-Version: 1.0
To: Andrew Lunn <andrew@lunn.ch>
References: <20250415193323.2794214-1-sean.anderson@linux.dev>
 <20250415193323.2794214-6-sean.anderson@linux.dev>
 <20250415193323.2794214-6-sean.anderson@linux.dev>
 <20250506215841.54rnxy3wqtlywxgb@skbuf>
 <50e809ea-62a4-413d-af63-7900929c3247@linux.dev>
 <50e809ea-62a4-413d-af63-7900929c3247@linux.dev>
 <20250506221834.uw5ijjeyinehdm3x@skbuf>
 <d66ac48c-8fe3-4782-9b36-8506bb1da779@linux.dev>
 <20250506222928.fozoqcxuf7roxur5@skbuf>
 <39753b36-adfd-4e00-beea-b58c1e5606e3@linux.dev>
 <90b2af4e-6c6e-41b9-be5b-ead443cd85b2@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <90b2af4e-6c6e-41b9-be5b-ead443cd85b2@lunn.ch>
X-Migadu-Flow: FLOW_OUT
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>,
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

Hi Andrew,

On 5/6/25 20:19, Andrew Lunn wrote:
>> > You will need to explain that better, because what I see is that the
>> > "BSD-3-Clause" portion of the license has disappeared and that applies
>> > file-wide, not just to your contribution.
>> 
>> But I also have the option to just use the GPL-2.0+ license. When you
>> have an SPDX like (GPL-2.0+ OR BSD-3-Clause) that means the authors gave
>> permission to relicense it as
>> 
>> - BSD-3-Clause
>> - GPL-2.0+
>> - GPL-2.0+ OR BSD-3-Clause
>> - GPL-2.0
>> - GPL-2.0 OR BSD-3-Clause
>> - GPL-3.0
>> - GPL-3.0 OR BSD-3-Clause
>> - GPL-4.0 (if it ever happens)
>> 
>> I want my contributions to remain free software, so I don't want to
>> allow someone to take the BSD-3-Clause option (without the GPL).
> 
> Please can you give us a summary of the licenses of this file over its
> complete history. Maybe it started out as GPL, and somebody wanted
> their parts to be under BSD, and so added the BSD parts?

This is the original license added in commit 0da4c3d393e4 ("net: phy:
add Lynx PCS module").

--Sean
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
