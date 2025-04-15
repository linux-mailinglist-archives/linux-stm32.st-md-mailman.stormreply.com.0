Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C81A890D2
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 02:43:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B4ACC78F7B;
	Tue, 15 Apr 2025 00:43:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C23BC78F75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 00:43:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D7C8961127;
 Tue, 15 Apr 2025 00:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51250C4CEE2;
 Tue, 15 Apr 2025 00:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744677823;
 bh=4ae4V/iCsu7Dm/UVFu21GxYfPTorOCXdVBpV9LrqHHk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yt3PGILq/RNZhYPUlG+8q/pUOPhjI1fV/t/Xmev9/0Pk6iLyytypHcMQmAXS9RkfT
 pqD29Icaa4wo3UDg8Rw3Sl6W9s3tJCv9U51Vv9oLXSm9jfsROpODvS8ywTxbTUswB5
 YrvHrqXg2Rb9ToqcEz5XJ/XwNxTPNBKItGNzAVgDObSVSFKlf0/aAWBatzGrRSbvGY
 Ip9WcR3s72Y0xF4h/xUaVZ4d8Z8QQYphlNqRxPU5bkStf3MUp6ChYJ/vesgIWXuWVb
 /yCW+eerjUeHPHINLfAdHAoCn0zjQLKt0k/JNjR4iUJpDgWXlEOrcw3XQyMUGJHamJ
 bwBb60QHiHlhg==
Date: Mon, 14 Apr 2025 17:43:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250414174342.67fe4b1d@kernel.org>
In-Reply-To: <E1u3XG6-000EJg-V8@rmk-PC.armlinux.org.uk>
References: <Z/ozvMMoWGH9o6on@shell.armlinux.org.uk>
 <E1u3XG6-000EJg-V8@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: call
 phylink_start() and phylink_stop() in XDP functions
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

On Sat, 12 Apr 2025 10:34:42 +0100 Russell King (Oracle) wrote:
> Phylink does not permit drivers to mess with the netif carrier, as
> this will de-synchronise phylink with the MAC driver. Moreover,
> setting and clearing the TE and RE bits via stmmac_mac_set() in this
> path is also wrong as the link may not be up.
> 
> Replace the netif_carrier_on(), netif_carrier_off() and
> stmmac_mac_set() calls with the appropriate phylink_start() and
> phylink_stop() calls, thereby allowing phylink to manage the netif
> carrier and TE/RE bits through the .mac_link_up() and .mac_link_down()
> methods.
> 
> Note that RE should only be set after the DMA is ready to avoid the
> receive FIFO between the MAC and DMA blocks overflowing, so
> phylink_start() needs to be placed after DMA has been started.

IIUC this will case a link loss when XDP is installed, if not disregard
the reset of the email.

Any idea why it's necessary to mess with the link for XDP changes?
Is there no way to discard all the traffic and let the queues go
idle without dropping the link?

I think we should mention in the commit message that the side effect is
link loss on XDP on / off. I don't know of any other driver which would
need this, stmmac is a real gift..
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
