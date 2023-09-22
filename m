Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3B67AB21A
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Sep 2023 14:28:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F9F6C6A5EF;
	Fri, 22 Sep 2023 12:28:40 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8E92C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 12:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=/hHJSVVNBq+Q25kH/Q3wHbSMiRa2RSWRIm+2U1rOzjk=; b=RGnfJOeunzJN6IjLYEZrXxcAL/
 fpuqpfDgH6Qj5AGs24gad1FLT/whsUz9i+WsoI2JuCWqvJREJGjVEjZGDNHJYKJ6ciBPPNTd/I/0+
 Zj7N6VWu/XuVFoJ4TnxeWgPsNcLEZE4uTMKvr56eStvdFil+9r9xQ7pQu1x1FCDurx1c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qjfGQ-007CHP-5B; Fri, 22 Sep 2023 14:28:06 +0200
Date: Fri, 22 Sep 2023 14:28:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Message-ID: <13bc074d-30c2-4bbf-8b4c-82f561c844b0@lunn.ch>
References: <20230922111247.497-1-ansuelsmth@gmail.com>
 <20230922111247.497-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230922111247.497-3-ansuelsmth@gmail.com>
Cc: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>,
 Jiri Pirko <jiri@resnulli.us>, Simon Horman <horms@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Hangbin Liu <liuhangbin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Raju Rangoju <rajur@chelsio.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH 3/3] net: stmmac: increase TX
 coalesce timer to 5ms
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

On Fri, Sep 22, 2023 at 01:12:47PM +0200, Christian Marangi wrote:
> Commit 8fce33317023 ("net: stmmac: Rework coalesce timer and fix
> multi-queue races") decreased the TX coalesce timer from 40ms to 1ms.
> 
> This caused some performance regression on some target (regression was
> reported at least on ipq806x) in the order of 600mbps dropping from
> gigabit handling to only 200mbps.
> 
> The problem was identified in the TX timer getting armed too much time.
> While this was fixed and improved in another commit, performance can be
> improved even further by increasing the timer delay a bit moving from
> 1ms to 5ms.
> 
> The value is a good balance between battery saving by prevending too
> much interrupt to be generated and permitting good performance for
> internet oriented devices.

ethtool has a settings you can use for this:

      ethtool -C|--coalesce devname [adaptive-rx on|off] [adaptive-tx on|off]
              [rx-usecs N] [rx-frames N] [rx-usecs-irq N] [rx-frames-irq N]
              [tx-usecs N] [tx-frames N] [tx-usecs-irq N] [tx-frames-irq N]
              [stats-block-usecs N] [pkt-rate-low N] [rx-usecs-low N]
              [rx-frames-low N] [tx-usecs-low N] [tx-frames-low N]
              [pkt-rate-high N] [rx-usecs-high N] [rx-frames-high N]
              [tx-usecs-high N] [tx-frames-high N] [sample-interval N]
              [cqe-mode-rx on|off] [cqe-mode-tx on|off] [tx-aggr-max-bytes N]
              [tx-aggr-max-frames N] [tx-aggr-time-usecs N]

If this is not implemented, i suggest you add support for it.

Changing the default might cause regressions. Say there is a VoIP
application which wants this low latency? It would be safer to allow
user space to configure it as wanted.

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
