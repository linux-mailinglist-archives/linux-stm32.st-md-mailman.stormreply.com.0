Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2454885BBF0
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Feb 2024 13:24:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1832C69067;
	Tue, 20 Feb 2024 12:24:11 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53D18C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 12:24:11 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2d228a132acso41466211fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 04:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708431850; x=1709036650;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7xVIgRYq2zX1M+4Lj3mROKuit32dmjgTDliMwakaDVo=;
 b=U5s1X8KVnuuoSXQ1Uu2QFb/bkOBijeIzpM0hLC4O+v6smHsM3ho38h+K4TcneRh9QU
 GWoWW3JQDmSF5BJS0ro/si7Vuf/xvzxzHX7P/3ehnSVKMueskcCDJhByKoylj1QfviPD
 utcjYKXjLqbXdIAjQiTw3uq+7TkcN9bU+wv52DDNHom5b9cMYTCThiOzagJ5Za28KVlE
 Wyn8xSBw8H5MwA45tPw6h5C+Pje9C+6f8yIUUeaRWkuUkp7WC5K4+wnqZVPJwI/svaDd
 ADk8F1Gh22CAG2TkZ7FJbie6XOHv4xFUxxHHgVvp+ccBM19Pmv3bsjTOFqAgpo1U0iB2
 WPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708431850; x=1709036650;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7xVIgRYq2zX1M+4Lj3mROKuit32dmjgTDliMwakaDVo=;
 b=wavJJGPAtneZxF62/srMLBvpOMsucES/OvLaAyU4gW7KtSPvREK8vqA5YYyelHgE/U
 xzxgyiPYkwwCWwog50uv15dydAf7GVT4rrucZw6NjYEWV+0corsMwrzwr5RfnxZ97K9x
 /jg2geM5T26jhYnABOSRXzV8sEzEhqHSFfQCQixQLukoiJoKPHQDcrnXMgBIIGyNvPrC
 3JOoicbo0Fd2KAT9HXVCy7OW970q0i//LFxplaGkz8w65wikntfld4hDhWXamCYb1M3y
 Z6dWrnzh283VsK5r7XOMJSFgUsX3Z3cLnttP1KbX2QYz+FHOEz9hBEVgruTnGbt8VNQd
 mktg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkrAGwH9oZRI2ZZvCDq/rvkfKqnl0YwBiVcwoNttIZHo5fDuC0EEqxvHOmtyAPOgON9eWQhc96QXHeCpVsBmUu3x387146f+5rqewwLKhqFdLRjNLfIMmM
X-Gm-Message-State: AOJu0YzCXTHi+VQgipkG3ZthIYoGXJE60vJfLIXSTJeDjMM7SqvCerl1
 Bw8p/3YeOerRuoIokXZu36ms+2Njels22XgzckPU4PwoiLK2Z4P0
X-Google-Smtp-Source: AGHT+IH0+M4gsIzfcGOa2EqDm7y/fIdjp0DpuJYVAj/0Y6VXOddx4unexLgLZwBdJo/LhWVn7WTRog==
X-Received: by 2002:a2e:97d7:0:b0:2d2:3085:c3ad with SMTP id
 m23-20020a2e97d7000000b002d23085c3admr5097897ljj.31.1708431850166; 
 Tue, 20 Feb 2024 04:24:10 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 n22-20020a2e86d6000000b002d0acb57c89sm1468992ljj.64.2024.02.20.04.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 04:24:09 -0800 (PST)
Date: Tue, 20 Feb 2024 15:24:06 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>
Message-ID: <sz3jfyimap4thkhxg76nrv6m2lyk5rwnsve5xxghqt7e5uo6lg@wkxcwsdhp44v>
References: <20240220-stmmac_stats-v2-1-0a78863bec70@axis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240220-stmmac_stats-v2-1-0a78863bec70@axis.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, kernel@axis.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: mmc_core: Drop interrupt
 registers from stats
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

Hi Jesper

On Tue, Feb 20, 2024 at 01:00:22PM +0100, Jesper Nilsson wrote:
> The MMC IPC interrupt status and interrupt mask registers are
> of little use as Ethernet statistics, but incrementing counters
> based on the current interrupt and interrupt mask registers
> makes them actively misleading.
> 
> For example, if the interrupt mask is set to 0x08420842,
> the current code will increment by that amount each iteration,
> leading to the following sequence of nonsense:
> 
> mmc_rx_ipc_intr_mask: 969816526
> mmc_rx_ipc_intr_mask: 1108361744
> 
> These registers have been included in the Ethernet statistics
> since the first version of MMC back in 2011 (commit 1c901a46d57).
> That commit also mentions the MMC interrupts as
> "something to add later (if actually useful)".
> 
> If the registers are actually useful, they should probably
> be part of the Ethernet register dump instead of statistics,
> but for now, drop the counters for mmc_rx_ipc_intr and
> mmc_rx_ipc_intr_mask completely.
> 
> Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>

Thank you very much! Definitely:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

One more statistics-related clean-up you may find useful:

net: stmmac: mmc: Discard double Rx CRC errors counter read
    
DW XGMAC MMC Rx CRC errors counter is read twice in a row. It's redundant
to do so, because unlikely the counter has changed since the first read
much while up to date statistics can be retrieved on the next MMC-read
operation. In that matter Rx CRC errors counter is no different from the
other counters, which are read just once in the same callback. So most
likely the second Rx CRC errors counter read has been added by mistake.
Let's discard it then.
    
Fixes: b6cdf09f51c2 ("net: stmmac: xgmac: Implement MMC counters")

diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
index 8597c6abae8d..759a83100f11 100644
--- a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
@@ -467,8 +467,6 @@ static void dwxgmac_mmc_read(void __iomem *mmcaddr, struct stmmac_counters *mmc)
                             &mmc->mmc_rx_multicastframe_g);
        dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_CRC_ERR,
                             &mmc->mmc_rx_crc_error);
-       dwxgmac_read_mmc_reg(mmcaddr, MMC_XGMAC_RX_CRC_ERR,
-                            &mmc->mmc_rx_crc_error);
        mmc->mmc_rx_run_error += readl(mmcaddr + MMC_XGMAC_RX_RUNT_ERR);
        mmc->mmc_rx_jabber_error += readl(mmcaddr + MMC_XGMAC_RX_JABBER_ERR);
        mmc->mmc_rx_undersize_g += readl(mmcaddr + MMC_XGMAC_RX_UNDER);

-Serge(y)

> ---
> Changes in v2:
> - Drop the misleading registers completely
> - Link to v1: https://lore.kernel.org/r/20240216-stmmac_stats-v1-1-7065fa4613f8@axis.com
> ---
>  drivers/net/ethernet/stmicro/stmmac/mmc.h            | 3 ---
>  drivers/net/ethernet/stmicro/stmmac/mmc_core.c       | 3 ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 2 --
>  3 files changed, 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc.h b/drivers/net/ethernet/stmicro/stmmac/mmc.h
> index a0c05925883e..8cfba817491b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/mmc.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/mmc.h
> @@ -78,9 +78,6 @@ struct stmmac_counters {
>  	unsigned int mmc_rx_fifo_overflow;
>  	unsigned int mmc_rx_vlan_frames_gb;
>  	unsigned int mmc_rx_watchdog_error;
> -	/* IPC */
> -	unsigned int mmc_rx_ipc_intr_mask;
> -	unsigned int mmc_rx_ipc_intr;
>  	/* IPv4 */
>  	unsigned int mmc_rx_ipv4_gd;
>  	unsigned int mmc_rx_ipv4_hderr;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
> index 6a7c1d325c46..ab3b7770f62d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
> @@ -279,9 +279,6 @@ static void dwmac_mmc_read(void __iomem *mmcaddr, struct stmmac_counters *mmc)
>  	mmc->mmc_rx_fifo_overflow += readl(mmcaddr + MMC_RX_FIFO_OVERFLOW);
>  	mmc->mmc_rx_vlan_frames_gb += readl(mmcaddr + MMC_RX_VLAN_FRAMES_GB);
>  	mmc->mmc_rx_watchdog_error += readl(mmcaddr + MMC_RX_WATCHDOG_ERROR);
> -	/* IPC */
> -	mmc->mmc_rx_ipc_intr_mask += readl(mmcaddr + MMC_RX_IPC_INTR_MASK);
> -	mmc->mmc_rx_ipc_intr += readl(mmcaddr + MMC_RX_IPC_INTR);
>  	/* IPv4 */
>  	mmc->mmc_rx_ipv4_gd += readl(mmcaddr + MMC_RX_IPV4_GD);
>  	mmc->mmc_rx_ipv4_hderr += readl(mmcaddr + MMC_RX_IPV4_HDERR);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index f628411ae4ae..28accdc98282 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -236,8 +236,6 @@ static const struct stmmac_stats stmmac_mmc[] = {
>  	STMMAC_MMC_STAT(mmc_rx_fifo_overflow),
>  	STMMAC_MMC_STAT(mmc_rx_vlan_frames_gb),
>  	STMMAC_MMC_STAT(mmc_rx_watchdog_error),
> -	STMMAC_MMC_STAT(mmc_rx_ipc_intr_mask),
> -	STMMAC_MMC_STAT(mmc_rx_ipc_intr),
>  	STMMAC_MMC_STAT(mmc_rx_ipv4_gd),
>  	STMMAC_MMC_STAT(mmc_rx_ipv4_hderr),
>  	STMMAC_MMC_STAT(mmc_rx_ipv4_nopay),
> 
> ---
> base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
> change-id: 20240216-stmmac_stats-e3561d460d0e
> 
> Best regards,
> -- 
> 
> /^JN - Jesper Nilsson
> -- 
>                Jesper Nilsson -- jesper.nilsson@axis.com
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
