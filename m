Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 626649AC8C6
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2024 13:20:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D0D8C71287;
	Wed, 23 Oct 2024 11:20:19 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C0B9C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 11:20:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DD2E9A44D55;
 Wed, 23 Oct 2024 11:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F02C4CEC6;
 Wed, 23 Oct 2024 11:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729682410;
 bh=tc4l2Y6qujgXL1mb4ojYmiIMvOzve59JJSCmIJ+XW+Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UbUWV9CsjLgcLVxkjj6MbHCxwwkjEhim+kIbovtrZEWf/RUGeALso976xhda5BPbo
 9YxD+w5Fna8Y+/5of3YUc1eIASxnc+etA5geexLSOPIK5ITCDu0H0+oB+EMtal+vQ/
 OB5D4b9Sh5CCjtvjTw3e3KnPLScTdIq3bJp29i0lEopFZ1Ex9ZzacapD0+jRc6ESBH
 sx5wK3pIdOKTy6/QD6TTf/SHNWwlyWUHC/XMaDT0Oyg9qVmlDCcQKxMnuSM+ZlZY6v
 JskejtRimt+PMwEaUACIpfRke6ImGPuddUW9CB7oEkzGbqOI5bmO9vr6b37UvKt/5p
 atpLNMYG0qDQQ==
Date: Wed, 23 Oct 2024 12:20:05 +0100
From: Simon Horman <horms@kernel.org>
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Message-ID: <20241023112005.GN402847@kernel.org>
References: <20241021054849.1801838-1-leyfoon.tan@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241021054849.1801838-1-leyfoon.tan@starfivetech.com>
Cc: lftan.linux@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next,
 v1 0/3] net: stmmac: dwmac4: Fixes bugs in dwmac4
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

+ Andrew, Giuseppe, Maxime, linux-arm-kernel, linux-stm32

On Mon, Oct 21, 2024 at 01:48:45PM +0800, Ley Foon Tan wrote:
> This patch series fixes the bugs in the dwmac4 drivers.
> 
> Based on the feedback in [1], split the patch series into net and net-next,
> and resubmit these three patches to net-next.
> 
> [1] https://patchwork.kernel.org/project/netdevbpf/cover/20241016031832.3701260-1-leyfoon.tan@starfivetech.com/
> 
> Ley Foon Tan (3):
>   net: stmmac: dwmac4: Fix MTL_OP_MODE_RTC mask and shift macros
>   net: stmmac: dwmac4: Fix the MTL_OP_MODE_*_MASK operation
>   net: stmmac: dwmac4: Receive Watchdog Timeout is not in abnormal
>     interrupt summary
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac4.h     | 4 ++--
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.c | 4 ++--
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c | 6 ++++--
>  3 files changed, 8 insertions(+), 6 deletions(-)

Hi Ley Foon Tan,

Thanks for the updates.

A few more points on process. Sorry for not pointing these out earlier.

* Please base the CC list on the output of get_maintainers.pl FILE.patch.
  b4 can help with this.

* Please do not include Fixes tags in patches for net-next
  (while please do for patches for net).

  If you wish to cite a patch you can use the following form,
  which may be line-wrapped, in the commit message (above the
  Signed-off-and other tags).

    Some text describing things that relate to
    commit 48863ce5940f ("stmmac: add DMA support for GMAC 4.xx")

    Signed-off-by: ...

* Please include some informative text in the cover letter.
  It will form part of git history. E.g.:

  - [PATCH net-next 0/3] net: sysctl: allow dump_cpumask to handle higher numbers of CPUs
    https://lore.kernel.org/all/20241017152422.487406-1-atenart@kernel.org/

  Which became:

  - Merge branch 'net-sysctl-allow-dump_cpumask-to-handle-higher-numbers-of-cpus'
    https://git.kernel.org/netdev/net-next/c/94fa523e20c3

More information on process for Networking patches can be found here:
https://docs.kernel.org/process/maintainer-netdev.html

-- 
pw-bot: changes-requested
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
