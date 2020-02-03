Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D001512AD
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Feb 2020 00:04:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99939C36B0C;
	Mon,  3 Feb 2020 23:04:59 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B499C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2020 23:04:57 +0000 (UTC)
Received: from cakuba.hsd1.ca.comcast.net (unknown [199.201.64.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 45CC120674;
 Mon,  3 Feb 2020 23:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580771095;
 bh=vzyez2WIfsTNn3tKO6gcRBw5UeiKLIVBY41eTtjUVsU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2FueImXvEyyZitLXHJBvvGyOWtS4YDUn5n2hYwUS03ovEeuXiU8uhlsqj97bmJb1N
 Aw4bDeZ1I3S75w0P0LlcqpMUno7HDbfCwM/pBNSjEQt9TKySfagHSIhZ1No+5sBY/f
 LMPTPgEBH9w8kRhXgNkoX7K7Ij/wUzPKbW5ysSS4=
Date: Mon, 3 Feb 2020 15:04:54 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Message-ID: <20200203150454.2938960b@cakuba.hsd1.ca.comcast.net>
In-Reply-To: <20200201020124.5989-1-nicoleotsuka@gmail.com>
References: <20200201020124.5989-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Delete txtimer in suspend()
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

On Fri, 31 Jan 2020 18:01:24 -0800, Nicolin Chen wrote:
> When running v5.5 with a rootfs on NFS, memory abort may happen in
> the system resume stage:
>  Unable to handle kernel paging request at virtual address dead00000000012a
>  [dead00000000012a] address between user and kernel address ranges
>  pc : run_timer_softirq+0x334/0x3d8
>  lr : run_timer_softirq+0x244/0x3d8
>  x1 : ffff800011cafe80 x0 : dead000000000122
>  Call trace:
>   run_timer_softirq+0x334/0x3d8
>   efi_header_end+0x114/0x234
>   irq_exit+0xd0/0xd8
>   __handle_domain_irq+0x60/0xb0
>   gic_handle_irq+0x58/0xa8
>   el1_irq+0xb8/0x180
>   arch_cpu_idle+0x10/0x18
>   do_idle+0x1d8/0x2b0
>   cpu_startup_entry+0x24/0x40
>   secondary_start_kernel+0x1b4/0x208
>  Code: f9000693 a9400660 f9000020 b4000040 (f9000401)
>  ---[ end trace bb83ceeb4c482071 ]---
>  Kernel panic - not syncing: Fatal exception in interrupt
>  SMP: stopping secondary CPUs
>  SMP: failed to stop secondary CPUs 2-3
>  Kernel Offset: disabled
>  CPU features: 0x00002,2300aa30
>  Memory Limit: none
>  ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---
> 
> It's found that stmmac_xmit() and stmmac_resume() sometimes might
> run concurrently, possibly resulting in a race condition between
> mod_timer() and setup_timer(), being called by stmmac_xmit() and
> stmmac_resume() respectively.
> 
> Since the resume() runs setup_timer() every time, it'd be safer to
> have del_timer_sync() in the suspend() as the counterpart.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>

Applied, and queued for stable, thank you!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
