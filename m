Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMA6NsFQnmlIUgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 02:30:41 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8910518ECF3
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 02:30:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DCF9C8F289;
	Wed, 25 Feb 2026 01:30:41 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FE75C87ECA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 01:30:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2D39D43B5F;
 Wed, 25 Feb 2026 01:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A24D8C116D0;
 Wed, 25 Feb 2026 01:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771983039;
 bh=FeIjheyt5MmH5rpuQ0+djNBSvwaQ02Enb/aIau7gkDY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kODmGJYar3MTni9jjDWPzYHy/PytDnxrowEmORjHxlxhQX/6T3MC745La6yA0Efwm
 2hXIruanyX6gNfpv+m+E19IgDs+utybH8SBL1Td3Gf2FO85RSU8dXYLvEYapKfNphW
 Ozs9GzQDHy3SEdVOK1zWyX+3y/Lps46l+/y5aTMk9qW73zgpKHL81L35218usFnkEU
 HOq2WNma3wYglNyaT+cxQ8QX463M4UZ1gNeOR3u1E5myGyXhmQ1fp3z4Q+YKhMOnAO
 ctesddf4Lp+wDaY1KRGXVOXF1Eifm1lUVypxwBi+f1fb/f6k0rV5hKuqNWITmyV629
 WuK9HN8JKxI9w==
Date: Tue, 24 Feb 2026 17:30:37 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20260224173037.7871e5ac@kernel.org>
In-Reply-To: <E1vuU3X-0000000Ae9G-1Er8@rmk-PC.armlinux.org.uk>
References: <E1vuU3X-0000000Ae9G-1Er8@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: fix
	.ndo_fix_features()
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.835];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 8910518ECF3
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 11:24:51 +0000 Russell King (Oracle) wrote:
> netdev features documentation requires that .ndo_fix_features() is
> stateless: it shouldn't modify driver state. Yet, stmmac_fix_features()
> does exactly that, changing whether GSO frames are processed by the
> driver.
> 
> Move this code to stmmac_set_features() instead, which is the correct
> place for it. We don't need to check whether TSO is supported; this
> is already handled via the setup of netdev->hw_features, and we are
> guaranteed that if netdev->hw_features indicates that a feature is
> not supported, .ndo_set_features() won't be called with it set.

No lies detected, but is this enough? The whole TSO enablement 
looks quite wobbly (as you mentioned in another email IIRC). 

Only stmmac_hw_setup() actually calls stmmac_enable_tso(). 
And stmmac_set_features() does not call stmmac_hw_setup().

IDK what the cost of having TSO enabled is for this IP, it's 
entirely possible that there is no cost. So maybe we should set
the TSO feature in features but not in hw_features which will
make it "fixed" to be always enabled? And not bother with handling 
the changes?

> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 82375d34ad57..a2a0985e8c37 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6105,14 +6105,6 @@ static netdev_features_t stmmac_fix_features(struct net_device *dev,
>  	if (priv->plat->bugged_jumbo && (dev->mtu > ETH_DATA_LEN))
>  		features &= ~NETIF_F_CSUM_MASK;
>  
> -	/* Disable tso if asked by ethtool */
> -	if ((priv->plat->flags & STMMAC_FLAG_TSO_EN) && (priv->dma_cap.tsoen)) {
> -		if (features & NETIF_F_TSO)
> -			priv->tso = true;
> -		else
> -			priv->tso = false;
> -	}
> -
>  	return features;
>  }
>  
> @@ -6144,6 +6136,8 @@ static int stmmac_set_features(struct net_device *netdev,
>  	else
>  		priv->hw->hw_vlan_en = false;
>  
> +	priv->tso = !!(features & NETIF_F_TSO);

extra nit, I think you're inserting this in the middle of a section of
code handling vlan config.

>  	phylink_rx_clk_stop_block(priv->phylink);
>  	stmmac_set_hw_vlan_mode(priv, priv->hw);
>  	phylink_rx_clk_stop_unblock(priv->phylink);
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
