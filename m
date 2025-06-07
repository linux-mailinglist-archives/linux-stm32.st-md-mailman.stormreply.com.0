Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72128AD0E7F
	for <lists+linux-stm32@lfdr.de>; Sat,  7 Jun 2025 18:21:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 189D6C36B2B;
	Sat,  7 Jun 2025 16:21:19 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 038C8C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  7 Jun 2025 16:21:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9BEE25C5950;
 Sat,  7 Jun 2025 16:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD844C4CEE4;
 Sat,  7 Jun 2025 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749313275;
 bh=oiI/UBIp22xDHCckuTpupPI1ZnNEyqHPaX1KMdJp0rE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PZBiEfQqujGjVpyqz8adTEM705B7KVMUfSgJlzeViiwwh4N+aqa5a/Z44MmIE5W/c
 wu1MduHg0/1b7KSea1myrHVzzyPHQ5ZSySxT0Qf7fDH8lfLwlKEpXpPrGtHEud1EPO
 guAcoYvH5Fa/yuDMFv9ek+dAsNZdp/xrS6YSf2cdWM64frwnZ6DBmIINsbfaCLKVKt
 qO33LH1aLdDgTMg/RzSXy+nOWBfZidZqCmunLrDXxD2Q5ldmLYD7Py7kpBWjRJ1ggg
 2KXkk44C1BfY2FX0FFQRfUiDcpdyI9wL3kt7G7wiAGoRKnS+0wr+dI0SqwWpLHlp3e
 6clzCiH8rFyug==
Date: Sat, 7 Jun 2025 17:21:10 +0100
From: Simon Horman <horms@kernel.org>
To: Bartlomiej Dziag <bartlomiejdziag@gmail.com>
Message-ID: <20250607162110.GB197663@horms.kernel.org>
References: <20250606102100.12576-1-bartlomiejdziag@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250606102100.12576-1-bartlomiejdziag@gmail.com>
Cc: Wojciech Drewek <wojciech.drewek@intel.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Change the busy-wait loops
	timing
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

On Fri, Jun 06, 2025 at 12:19:49PM +0200, Bartlomiej Dziag wrote:
> After writing a new value to the PTP_TAR or PTP_STSUR registers,
> the driver waits for the addend/adjust operations to complete.
> Sometimes, the first check operation fails, resulting in
> a 10 milliseconds busy-loop before performing the next check.
> Since updating the registers takes much less than 10 milliseconds,
> the kernel gets stuck unnecessarily. This may increase the CPU usage.
> Fix that with changing the busy-loop interval to 5 microseconds.
> The registers will be checked more often.

Hi Bartlomiej,

I am curious.

Does it always take much less than 10ms, or is that usually so.
If it is the former, then do we need to wait for in the order of
10000 x 5us = 50ms before giving up?

> 
> Signed-off-by: Bartlomiej Dziag <bartlomiejdziag@gmail.com>

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
