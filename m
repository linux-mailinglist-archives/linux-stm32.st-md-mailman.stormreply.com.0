Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 989EDB96273
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Sep 2025 16:10:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA892C3089F;
	Tue, 23 Sep 2025 14:10:08 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7ED5C3089D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Sep 2025 14:10:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 09A05C01FB4;
 Tue, 23 Sep 2025 14:09:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0686760690;
 Tue, 23 Sep 2025 14:10:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id ABCC4102F190F; 
 Tue, 23 Sep 2025 16:09:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758636606; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=4DukHAljRLEAyr8m6U7o38VUfR/uV1WnyVeEUjrVjW8=;
 b=mmfI7w5e/fwO1dbJfiJiKTFlDB6GlSMiPyPvV6nfqszIXotRRsr+okXrUUyjKmjPkhKC3+
 RoVtHl9f9Ak9LRf/4iRwBY+ykJZRkgXIBLbXwYejGDdHv1/5HE/zBD2hDPv22jW9Gcmtxx
 wWM9/GxDOqyi5cb9s3Y31468ZB1Z5T5zy1mFKKWkOTd7gyq0IeHTY5I/eenH02wd91XYIS
 xGnaTwuBKX0PwhLAQA8tTdQ9Ouv63mePARKs6grtbizYG7z9xB/cvvIm0DRtAn4/FE4GIQ
 6KlL35wkYLyM8d9AU72fjBOwxEy5/4fPxLjJwEbiZVVEjxBNxGawI1O2g1LIIg==
Message-ID: <bf7f7637-dfcf-41fd-aff3-82a0ecac4db9@bootlin.com>
Date: Tue, 23 Sep 2025 19:39:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/6] net: stmmac: yet more
	cleanups
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Russell,

On 23/09/2025 16:55, Russell King (Oracle) wrote:
> Building on the previous cleanup series, this cleans up yet more stmmac
> code.
> 
> - Move stmmac_bus_clks_config() into stmmac_platform() which is where
>    its onlny user is.
> 
> - Move the xpcs Clause 73 test into stmmac_init_phy(), resulting in
>    simpler code in __stmmac_open().
> 
> - Move "can't attach PHY" error message into stmmac_init_phy().
> 
> We then start moving stuff out of __stmac_open() into stmmac_open()
> (and correspondingly __stmmac_release() into stmmac_release()) which
> is not necessary when re-initialising the interface on e.g. MTU change.
> 
> - Move initialisation of tx_lpi_timer
> - Move PHY attachment/detachment
> - Move PHY error message into stmmac_init_phy()
> 
> Finally, simplfy the paths in stmmac_init_phy().
> 
>   drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   1 -
>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 111 ++++++++-------------
>   .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  32 ++++++
>   3 files changed, 73 insertions(+), 71 deletions(-)
> 

For the series,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks for the cleanup,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
