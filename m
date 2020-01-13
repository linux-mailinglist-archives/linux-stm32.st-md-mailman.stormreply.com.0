Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 199791394A8
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2020 16:20:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE212C36B0C;
	Mon, 13 Jan 2020 15:20:16 +0000 (UTC)
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82AB2C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 15:20:15 +0000 (UTC)
Received: (wp-smtpd smtp.wp.pl 25356 invoked from network);
 13 Jan 2020 16:20:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
 t=1578928814; bh=ckiIUgf+Tu5dz5bSkyhu+9/WG8U3ri+CC3Yzi1RogcU=;
 h=From:To:Cc:Subject;
 b=NeSFLFdiaaOtnduuiNXv0m3FxynzuH3vJW9Ys2S+vbRzGA0LVmL0946RrA6kxb4KH
 +VLCkHAyV57L9+KK16iXno0hhZnd//0dphpVH4rQMsgypOHg3029TTgu6CasCN+Hs3
 jcUW6qwhui9F5L0Bn2LzwrHrTHCsdDI4zJyAPdvI=
Received: from unknown (HELO cakuba) (kubakici@wp.pl@[172.58.35.234])
 (envelope-sender <kubakici@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
 for <Jose.Abreu@synopsys.com>; 13 Jan 2020 16:20:13 +0100
Date: Mon, 13 Jan 2020 07:19:46 -0800
From: Jakub Kicinski <kubakici@wp.pl>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20200113071946.1dbdecd1@cakuba>
In-Reply-To: <faaa377a5518be7357f897d02eb0e35b57912093.1578920366.git.Jose.Abreu@synopsys.com>
References: <cover.1578920366.git.Jose.Abreu@synopsys.com>
 <faaa377a5518be7357f897d02eb0e35b57912093.1578920366.git.Jose.Abreu@synopsys.com>
MIME-Version: 1.0
X-WP-MailID: e9542c228b230751ee00c2b6f941528f
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [gaNR]                               
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 6/8] net: stmmac: Add missing
 information in DebugFS capabilities file
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

On Mon, 13 Jan 2020 14:02:41 +0100, Jose Abreu wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index fcc1ffe0b11e..7c2645ee81b1 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4341,6 +4341,10 @@ static int stmmac_dma_cap_show(struct seq_file *seq, void *v)
>  		   priv->dma_cap.number_rx_queues);
>  	seq_printf(seq, "\tNumber of Additional TX queues: %d\n",
>  		   priv->dma_cap.number_tx_queues);
> +	seq_printf(seq, "\tCurrent number of TX queues: %d\n",
> +		   priv->plat->tx_queues_to_use);
> +	seq_printf(seq, "\tCurrent number of RX queues: %d\n",
> +		   priv->plat->rx_queues_to_use);

You should probably just implement ethtool get_channels. 
nack on this part.

>  	seq_printf(seq, "\tEnhanced descriptors: %s\n",
>  		   (priv->dma_cap.enh_desc) ? "Y" : "N");
>  	seq_printf(seq, "\tTX Fifo Size: %d\n", priv->dma_cap.tx_fifo_size);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
