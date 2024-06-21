Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4170D9118EA
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 05:12:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E10DEC7128D;
	Fri, 21 Jun 2024 03:12:50 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02042CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 03:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=WO33cNTPn9NUUeGGOkVxo3S92qWrXCg9qOPXQk9jSr0=; b=PbsVJysujVOHC+yOLzuwpAi3ei
 kTz4cujpB9sVSjqxrx9NKMH9EhttayUvRNN0/ZRe7iIFVr+iBK61p3IsPS1G1DsTohPGqWuk3re4a
 YfJhVyLlnH0ufsUZvlfJmzTfE+cdg1GcHdq2eSmNoTJixDxcDUxXHmYdkH2Bus/2KlKs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sKUhP-000cmD-QD; Fri, 21 Jun 2024 05:12:27 +0200
Date: Fri, 21 Jun 2024 05:12:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <788c2744-e1c0-4338-9b86-9119d31841f1@lunn.ch>
References: <20240620085200.583709-1-0x1207@gmail.com>
 <e3yzigcfbbkowias54nijvejc36hbcvfgjgbodycka3kfoqqek@46gktho2hwwt>
 <20240621102627.000060d6@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240621102627.000060d6@gmail.com>
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: xgmac: increase
 length limit of descriptor ring
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

> Heavy incoming traffic on some heavy load system, the max 1024 limit defined
> by DMA_MAX_RX_SIZE in drivers/net/ethernet/stmicro/stmmac/common.h is too
> few to achieve high throughput for XGMAC.
> With this patch, ethtool can set a new length than 1024

Please include some benchmark results to show the improvement.

But at some point, more buffers don't help you. If you are
consistently overloaded, you will still overflow the buffers.  So you
might want to look at where is the bottleneck and how do you
prioritise processing packets over whatever else is loading the
system.

Maybe this would help, if the bus is the problem:

https://www.spinics.net/lists/netdev/msg1006370.html

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
