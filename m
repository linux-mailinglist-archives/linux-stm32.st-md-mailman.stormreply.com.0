Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FF7C154E7
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Oct 2025 16:03:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65ECEC628D5;
	Tue, 28 Oct 2025 15:03:12 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC3E7C628D4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Oct 2025 15:03:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5B78F43E68;
 Tue, 28 Oct 2025 15:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A04DC4CEE7;
 Tue, 28 Oct 2025 15:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761663790;
 bh=Z36D+6ZhfHgGmJy7pQ7Lwnpln/Jx0aH9L4PEgSkS4cM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HzVMbkK/3Fgb9ijFlyUS4iB1uC23xI0ZWZkIdfJ6RogXnWbv2lzNYqJ5EZfVySMc1
 SB0DKWP4a80haIV3+eNxvAxMxegcgSl0pH0ouiVYimn7wLLo4q6cG1hg/MJLijGkLn
 J/keK8Jax3TsCJTpUdStSyMwztf2rGgq0UV3SFX22tlrT0wwT6SssPtzFnN7TjgRm/
 f99Wn7XzOr3SyxQrGBtScpV+ELzWNeWby/ogLFK9rqL5dN9qSPQUNE+lq8DpjDf0Pz
 RANtYBei63HupbcZg6lFxV1k15YxeDwEsuPfsutaROIVrcLbDZhBNSXtbGCHw5ZOlB
 t3v+G2BLEbK8A==
Date: Tue, 28 Oct 2025 15:03:05 +0000
From: Simon Horman <horms@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <aQDbKYMtgiQaGgHX@horms.kernel.org>
References: <e869999b-2d4b-4dc1-9890-c2d3d1e8d0f8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e869999b-2d4b-4dc1-9890-c2d3d1e8d0f8@gmail.com>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, David Miller <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 net-next] net: stmmac: mdio: fix
 incorrect phy address check
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

On Sat, Oct 25, 2025 at 08:35:47PM +0200, Heiner Kallweit wrote:
> max_addr is the max number of addresses, not the highest possible address,
> therefore check phydev->mdio.addr > max_addr isn't correct.
> To fix this change the semantics of max_addr, so that it represents
> the highest possible address. IMO this is also a little bit more intuitive
> wrt name max_addr.
> 
> Fixes: 4a107a0e8361 ("net: stmmac: mdio: use phy_find_first to simplify stmmac_mdio_register")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reported-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - improve subject

Thanks, this versions looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
