Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E49978260D3
	for <lists+linux-stm32@lfdr.de>; Sat,  6 Jan 2024 18:07:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87CBAC6B45B;
	Sat,  6 Jan 2024 17:07:20 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A075C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  6 Jan 2024 17:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=dPhfKVwequCMnYA34M18ravxgkggHOtfFd2lzVGsLBI=; b=QA7wa8jYyoMtu+bjotQg0Zsdsm
 IKilQpNxkJwQhZO8USBTx/egJpLnmfubJlWXjMK5ICvLiO8y4nEawNSVeT/O1LxJqEaUIHBMJDXMb
 MUEgkF3u55xxBtZweGb2ZnJ9OW/+1pW+n9fUj/+6fzFKJbiz+osQOH79C9OOgkXZ3LBs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rMA8V-004X2M-8v; Sat, 06 Jan 2024 18:07:03 +0100
Date: Sat, 6 Jan 2024 18:07:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Petr Tesarik <petr@tesarici.cz>
Message-ID: <878c4ac5-66fa-4ddc-95af-ad40fab11c9c@lunn.ch>
References: <20240105201642.30904-1-petr@tesarici.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240105201642.30904-1-petr@tesarici.cz>
Cc: open list <linux-kernel@vger.kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 stable@vger.kernel.org, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: fix ethtool per-queue
	statistics
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

On Fri, Jan 05, 2024 at 09:16:42PM +0100, Petr Tesarik wrote:
> Fix per-queue statistics for devices with more than one queue.
> 
> The output data pointer is currently reset in each loop iteration,
> effectively summing all queue statistics in the first four u64 values.
> 
> The summary values are not even labeled correctly. For example, if eth0 has
> 2 queues, ethtool -S eth0 shows:
> 
>      q0_tx_pkt_n: 374 (actually tx_pkt_n over all queues)
>      q0_tx_irq_n: 23  (actually tx_normal_irq_n over all queues)
>      q1_tx_pkt_n: 462 (actually rx_pkt_n over all queues)
>      q1_tx_irq_n: 446 (actually rx_normal_irq_n over all queues)
>      q0_rx_pkt_n: 0
>      q0_rx_irq_n: 0
>      q1_rx_pkt_n: 0
>      q1_rx_irq_n: 0
> 
> Fixes: 133466c3bbe1 ("net: stmmac: use per-queue 64 bit statistics where necessary")
> Cc: stable@vger.kernel.org
> Signed-off-by: Petr Tesarik <petr@tesarici.cz>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
