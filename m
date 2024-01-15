Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A6782DA5C
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jan 2024 14:42:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1C00C6B457;
	Mon, 15 Jan 2024 13:42:46 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67566C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jan 2024 13:42:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id DF34CB80B87;
 Mon, 15 Jan 2024 13:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E9FC433F1;
 Mon, 15 Jan 2024 13:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705326164;
 bh=B6AZ1EUyCAneRia2lXu32aM3w0CF1GNXsC7SMPqT/Fc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pcH3yYh8sqk+63egc0J/m2eQ915+IQPVC487lb7VKPtvGIxKGSO8O5kPFIiZMJb5O
 EVWNYctiCAnLx+kgkDyCZYrA95D3/XX5OquSgva/Nt3MyyUfEnj3z5+fZkJCQkJ7Y4
 JB9fnXL6fuLPMHvv80+2kfGXLjlXls3EgtZ5fq6nQEHS8lKwpQJ3PdsrFQjvaZT053
 9MGmV41J9i/ATJAQ/aQHoRx0qgWzVvQJUw8rFN5rfAuvaXyw5K30kTKQxJTQOmnBID
 zguURX04XKKI1vVYglaeCc4XSM6iJw2efZ1HTt+SlCeSMhWWqLGlr+JL9l2YWX/+4A
 kM+iBvi6fFBzQ==
Date: Mon, 15 Jan 2024 13:42:38 +0000
From: Simon Horman <horms@kernel.org>
To: Qiang Ma <maqianga@uniontech.com>
Message-ID: <20240115134238.GA430968@kernel.org>
References: <20240112021249.24598-1-maqianga@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240112021249.24598-1-maqianga@uniontech.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: ethtool: Fixed calltrace
 caused by unbalanced disable_irq_wake calls
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

+ Florian Fainelli <f.fainelli@gmail.com>

On Fri, Jan 12, 2024 at 10:12:49AM +0800, Qiang Ma wrote:
> We found the following dmesg calltrace when testing the GMAC NIC notebook:
> 
> [9.448656] ------------[ cut here ]------------
> [9.448658] Unbalanced IRQ 43 wake disable
> [9.448673] WARNING: CPU: 3 PID: 1083 at kernel/irq/manage.c:688 irq_set_irq_wake+0xe0/0x128
> [9.448717] CPU: 3 PID: 1083 Comm: ethtool Tainted: G           O      4.19 #1
> [9.448773]         ...
> [9.448774] Call Trace:
> [9.448781] [<9000000000209b5c>] show_stack+0x34/0x140
> [9.448788] [<9000000000d52700>] dump_stack+0x98/0xd0
> [9.448794] [<9000000000228610>] __warn+0xa8/0x120
> [9.448797] [<9000000000d2fb60>] report_bug+0x98/0x130
> [9.448800] [<900000000020a418>] do_bp+0x248/0x2f0
> [9.448805] [<90000000002035f4>] handle_bp_int+0x4c/0x78
> [9.448808] [<900000000029ea40>] irq_set_irq_wake+0xe0/0x128
> [9.448813] [<9000000000a96a7c>] stmmac_set_wol+0x134/0x150
> [9.448819] [<9000000000be6ed0>] dev_ethtool+0x1368/0x2440
> [9.448824] [<9000000000c08350>] dev_ioctl+0x1f8/0x3e0
> [9.448827] [<9000000000bb2a34>] sock_ioctl+0x2a4/0x450
> [9.448832] [<900000000046f044>] do_vfs_ioctl+0xa4/0x738
> [9.448834] [<900000000046f778>] ksys_ioctl+0xa0/0xe8
> [9.448837] [<900000000046f7d8>] sys_ioctl+0x18/0x28
> [9.448840] [<9000000000211ab4>] syscall_common+0x20/0x34
> [9.448842] ---[ end trace 40c18d9aec863c3e ]---
> 
> Multiple disable_irq_wake() calls will keep decreasing the IRQ
> wake_depth, When wake_depth is 0, calling disable_irq_wake() again,
> will report the above calltrace.
> 
> Due to the need to appear in pairs, we cannot call disable_irq_wake()
> without calling enable_irq_wake(). Fix this by making sure there are
> no unbalanced disable_irq_wake() calls.


Hi Qiang Ma,

This seems to be a fix, so I think it should be targeted at net:

	Subject: [PATCH net] ...

And have a fixes tag, perhaps:

	Fixes: 3172d3afa998 ("stmmac: support wake up irq from external sources (v3)")

I don't think there is a need to repost this patch because of the above,
but please keep it in mind for next time.

> Signed-off-by: Qiang Ma <maqianga@uniontech.com>

I see that the approach taken here is the same as that taken
by bcm_sysport_set_wol() to what seems to be a similar problem [1].
So the code change itself looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

[1] 61b423a8a0bd ("net: systemport: avoid unbalanced enable_irq_wake calls")
    https://git.kernel.org/torvalds/c/61b423a8a0bd

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h         |  1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 10 ++++++++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    |  1 +
>  3 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index cd7a9768de5f..b8c93b881a65 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -255,6 +255,7 @@ struct stmmac_priv {
>  	u32 msg_enable;
>  	int wolopts;
>  	int wol_irq;
> +	bool wol_irq_disabled;
>  	int clk_csr;
>  	struct timer_list eee_ctrl_timer;
>  	int lpi_irq;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index f628411ae4ae..9a4d9492a781 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -825,10 +825,16 @@ static int stmmac_set_wol(struct net_device *dev, struct ethtool_wolinfo *wol)
>  	if (wol->wolopts) {
>  		pr_info("stmmac: wakeup enable\n");
>  		device_set_wakeup_enable(priv->device, 1);
> -		enable_irq_wake(priv->wol_irq);
> +		/* Avoid unbalanced enable_irq_wake calls */
> +		if (priv->wol_irq_disabled)
> +			enable_irq_wake(priv->wol_irq);
> +		priv->wol_irq_disabled = false;
>  	} else {
>  		device_set_wakeup_enable(priv->device, 0);
> -		disable_irq_wake(priv->wol_irq);
> +		/* Avoid unbalanced disable_irq_wake calls */
> +		if (!priv->wol_irq_disabled)
> +			disable_irq_wake(priv->wol_irq);
> +		priv->wol_irq_disabled = true;
>  	}
>  
>  	mutex_lock(&priv->lock);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 37e64283f910..baa396621ed8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3565,6 +3565,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
>  	/* Request the Wake IRQ in case of another line
>  	 * is used for WoL
>  	 */
> +	priv->wol_irq_disabled = true;
>  	if (priv->wol_irq > 0 && priv->wol_irq != dev->irq) {
>  		int_name = priv->int_name_wol;
>  		sprintf(int_name, "%s:%s", dev->name, "wol");
> -- 
> 2.20.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
