Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 553D9A11582
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 00:35:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12D31C78032;
	Tue, 14 Jan 2025 23:35:53 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E90FCC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 23:35:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 05CDFA41B9B;
 Tue, 14 Jan 2025 23:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEEF7C4CEDD;
 Tue, 14 Jan 2025 23:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736897744;
 bh=mAGMGtQrfQ3/Drlhgn5zGpK+PDYQqfFjj696cQz6oLc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LuMe8JFsedYcMeGaVXORNDg142CfYmNisZhtpqwVCaDZpjyHVd/hXlD/qXvosjt8I
 A/POYMUWNOMF8A6PZ2mQ4RofXjmzJMKcVB79uodPNCzRZaVJA8fiyr2ll3BZ/4IG7s
 KWAioX7Zj4HiHYTBKMOL5fz1c5swL5Vp1qad4HzDmQzlszZZ6rg9bBHqZDU0Nai7+S
 KSwyb2dFL1xQv9w78LBlSTP+dxZlyvM7xUu7ERqFcwUXujEJJCq7kn2iw4ByCVOQNn
 /CHuc6vQhTEleOA6ddE2V+QDmJN9DnL4YwlxMLHkoWVvOcl/PtRh4JTTjD5ICYGV33
 1eIaBKz8ypkWQ==
Date: Tue, 14 Jan 2025 15:35:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <20250114153542.29d10a04@kernel.org>
In-Reply-To: <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
 <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 edumazet@google.com, schung@nuvoton.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
 ychuang3@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Joey Lu <a0987203069@gmail.com>, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v7 3/3] net: stmmac:
 dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
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

On Tue, 14 Jan 2025 02:49:31 +0100 Paul Menzel wrote:
> > +MODULE_AUTHOR("Joey Lu <yclu4@nuvoton.com>");  
> 
> Maybe Nuvoton can set up a generic address?

FWIW we prefer people to mailing lists in netdev.
Humans tend to have more of a sense of responsibility 
than corporations :S
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
