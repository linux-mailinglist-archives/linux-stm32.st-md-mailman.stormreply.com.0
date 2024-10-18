Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3509A3999
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2024 11:13:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6040C78038;
	Fri, 18 Oct 2024 09:13:32 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98E5DC78037
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 09:13:25 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43159555f29so2307625e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 02:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729242805; x=1729847605;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8tIONkOU5igwAxCn5UCajWfFUel0FYfEBCQ6gdqF4Io=;
 b=XqsnVoIJtQiYbpbjcmd6rELcI4pokks45FqPr2XTMEzU7HYcS1gMWCokL58acAH5MQ
 kEpxNoBW5WXnQZgsGgNmdiZ5YrOocHhmCqFZZNYi2MuhfZC7SDqZY6sAvwVNt/D6DhYv
 4cOiUEjAspBIvvHVKjckcg+rw33vjkiLrq63eZXyCvh98kO8HHENg9BMZ+xnOLDdruE7
 daJkm8gvmqmML21x3DTei+xbLJQ88uvKf6ziI/Ynj/fJPwh3LxULoAkzQe7fThjjYmo2
 GArPm6gnqtMYNBNxjbdCK1l5dmECigJt/EwK0ppKSf/7ivslq8pDKIy1KDpZKxfDRpiE
 RvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729242805; x=1729847605;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8tIONkOU5igwAxCn5UCajWfFUel0FYfEBCQ6gdqF4Io=;
 b=DsBQxocqTKOpfrs3ZfuZU1e/TyUBH3nswcC63GMS+AieHlukR0R0XRbj55dEsNc//4
 jnEju+OJ+NhpSi+jx9A3pRuBjecIi+JpL7b9JoPwvHbQTm7C3VMs8WoWDKHUkYU0mw/i
 Sbv1IkZSlnZfo9GjzcRY3viW+RMtmSIgEaRNNI58rdm6rMjHGyDFFkrwMuqZ+qB83MoX
 zckCgGKbCsWtrZ2xVuHaBHO0FX9X3G0/hZFRDmIukel6lk9imrs608VhUGhMid2E5mXq
 GTgXvr73TaSe28wacG9zL8Kc0dQnbjRZzB5qfm6b8kG+5JY0WXJVxjfpCpHfU7bwidqp
 t4Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvnHFVLahk1EO+nYU5Ww96F88H+BpDU4MWq/UJx0k1zzLDA86X2w+hX/64qJzCMkqyLyE3iRLXgiC4vA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzmNUgwYEYLiFjfIixN14ZZOKxC+4Lher1OT7+csq8VspXrlWfR
 4NAZ21EMuqII7bBg2ao1HH1ZMmuBDtS1Ezo2C/ROiiKfXN0RjEoo
X-Google-Smtp-Source: AGHT+IHs8ZRNnUB0mkW6u0KW5Jl1JQyFwugKrrmDLohyc9r6cBPtRmLmpi4K7SO+2fw+W3rbF75b2g==
X-Received: by 2002:a05:600c:3b9b:b0:42c:ba83:3f08 with SMTP id
 5b1f17b1804b1-431616236d2mr5834455e9.2.1729242804722; 
 Fri, 18 Oct 2024 02:13:24 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431606d622esm21740095e9.45.2024.10.18.02.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 02:13:24 -0700 (PDT)
Date: Fri, 18 Oct 2024 12:13:21 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241018091321.gfsdx7qzl4yoixgb@skbuf>
References: <cover.1729233020.git.0x1207@gmail.com>
 <1776606b2eda8430077551ca117b035f987b5b70.1729233020.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1776606b2eda8430077551ca117b035f987b5b70.1729233020.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 7/8] net: stmmac: xgmac:
	Complete FPE support
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

On Fri, Oct 18, 2024 at 02:39:13PM +0800, Furong Xu wrote:
> Implement the necessary stmmac_fpe_ops function callbacks for xgmac.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> index dfe911b3f486..c90ed7c1279d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
> @@ -373,6 +373,78 @@ static void dwxgmac3_fpe_configure(void __iomem *ioaddr,
>  			     &dwxgmac3_fpe_info);
>  }
>  
> +static int dwxgmac3_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
> +{
> +	return common_fpe_irq_status(ioaddr + XGMAC_MAC_FPE_CTRL_STS, dev);
> +}
> +
> +static void dwxgmac3_fpe_send_mpacket(void __iomem *ioaddr,
> +				      struct stmmac_fpe_cfg *cfg,
> +				      enum stmmac_mpacket_type type)
> +{
> +	common_fpe_send_mpacket(ioaddr + XGMAC_MAC_FPE_CTRL_STS, cfg, type);
> +}
> +
> +static int dwxgmac3_fpe_get_add_frag_size(const void __iomem *ioaddr)
> +{
> +	return FIELD_GET(FPE_MTL_ADD_FRAG_SZ,
> +			 readl(ioaddr + XGMAC_MTL_FPE_CTRL_STS));
> +}
> +
> +static void dwxgmac3_fpe_set_add_frag_size(void __iomem *ioaddr,
> +					   u32 add_frag_size)
> +{
> +	u32 value;
> +
> +	value = readl(ioaddr + XGMAC_MTL_FPE_CTRL_STS);
> +	writel(u32_replace_bits(value, add_frag_size, FPE_MTL_ADD_FRAG_SZ),
> +	       ioaddr + XGMAC_MTL_FPE_CTRL_STS);
> +}
> +
> +static int dwxgmac3_fpe_map_preemption_class(struct net_device *ndev,
> +					     struct netlink_ext_ack *extack,
> +					     u32 pclass)
> +{
> +	u32 val, offset, count, preemptible_txqs = 0;
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +	u32 num_tc = ndev->num_tc;
> +
> +	if (!num_tc) {
> +		/* Restore default TC:Queue mapping */
> +		for (u32 i = 0; i < priv->plat->tx_queues_to_use; i++) {
> +			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
> +			writel(u32_replace_bits(val, i, XGMAC_Q2TCMAP),
> +			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
> +		}
> +	}
> +
> +	/* Synopsys Databook:
> +	 * "All Queues within a traffic class are selected in a round robin
> +	 * fashion (when packets are available) when the traffic class is
> +	 * selected by the scheduler for packet transmission. This is true for
> +	 * any of the scheduling algorithms."
> +	 */
> +	for (u32 tc = 0; tc < num_tc; tc++) {
> +		count = ndev->tc_to_txq[tc].count;
> +		offset = ndev->tc_to_txq[tc].offset;
> +
> +		if (pclass & BIT(tc))
> +			preemptible_txqs |= GENMASK(offset + count - 1, offset);
> +
> +		for (u32 i = 0; i < count; i++) {
> +			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
> +			writel(u32_replace_bits(val, tc, XGMAC_Q2TCMAP),
> +			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
> +		}
> +	}
> +
> +	val = readl(priv->ioaddr + XGMAC_MTL_FPE_CTRL_STS);
> +	writel(u32_replace_bits(val, preemptible_txqs, FPE_MTL_PREEMPTION_CLASS),
> +	       priv->ioaddr + XGMAC_MTL_FPE_CTRL_STS);
> +
> +	return 0;
> +}
> +
>  const struct stmmac_fpe_ops dwmac5_fpe_ops = {
>  	.fpe_configure = dwmac5_fpe_configure,
>  	.fpe_send_mpacket = dwmac5_fpe_send_mpacket,
> @@ -384,4 +456,9 @@ const struct stmmac_fpe_ops dwmac5_fpe_ops = {
>  
>  const struct stmmac_fpe_ops dwxgmac_fpe_ops = {
>  	.fpe_configure = dwxgmac3_fpe_configure,
> +	.fpe_send_mpacket = dwxgmac3_fpe_send_mpacket,
> +	.fpe_irq_status = dwxgmac3_fpe_irq_status,
> +	.fpe_get_add_frag_size = dwxgmac3_fpe_get_add_frag_size,
> +	.fpe_set_add_frag_size = dwxgmac3_fpe_set_add_frag_size,
> +	.fpe_map_preemption_class = dwxgmac3_fpe_map_preemption_class,
>  };

This is much better in terms of visibility into the change.

Though I cannot stop thinking that this implementation design:

stmmac_fpe_configure()
-> stmmac_do_void_callback()
   -> fpe_ops->fpe_configure()
      /                    \
     /                      \
    v                        v
dwmac5_fpe_configure   dwxgmac3_fpe_configure
     \                      /
      \                    /
       v                  v
       common_fpe_configure()

is, pardon the expression, stuffy.

If you aren't very opposed to the idea of having struct stmmac_fpe_ops
contain a mix of function pointers and integer constants, I would
suggest removing:

	.fpe_configure()
	.fpe_send_mpacket()
	.fpe_irq_status()
	.fpe_get_add_frag_size()
	.fpe_set_add_frag_size()

and just keeping a single function pointer, .fpe_map_preemption_class(),
inside stmmac_fpe_ops. Only that is sufficiently different to warrant a
completely separate implementation. Then move all current struct
stmmac_fpe_configure_info to struct stmmac_fpe_ops, and reimplement
stmmac_fpe_configure() directly like common_fpe_configure(),
stmmac_fpe_send_mpacket() directly like common_fpe_send_mpacket(), etc etc.
This lets us avoid the antipattern of calling a function pointer (hidden
by an opaque macro) from common code, only to gather some parameters to
call again a common implementation.

I know this is a preposterous and heretic thing to suggest, but a person
who isn't knee-deep in stmmac has a very hard time locating himself in
space due to the unnecessarily complex layering. If that isn't something
that is important, feel free to ignore.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
