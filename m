Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLieIE2Qx2nFZAUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Mar 2026 09:24:45 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8D634DCF4
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Mar 2026 09:24:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E2CBC8F289;
	Sat, 28 Mar 2026 08:24:44 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7339CC8F280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 08:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dBGUIi2ACXBs5dBa+ZwVmMxZ7q4HBlEgRbUeEupBh9U=; b=zeXZhzLgUiuIiTK8dL2wHfYuQ4
 twJPvaZEpu/cCswIQPutnepzFsLq/3cT2sqneczANqSdaUDxO5BFOnB/I3hzp9oNxr4MaknA4Zlfb
 dtWGiOscalNfC8nNPuMZAjjQ0eyPEFGHd9JEf5R0ots+a6iC6NgO8ItOb2glUMYkMImzwsMfwBrz8
 ufb/8adgE1SGKZzcG7g0+ePe66kPFxRCipXUr+arTfB5b/x/wl/uoWAbshn5t8m6aTW1O26/kkGc+
 YzyJMdLESbM1u3d1qt9sDv5eXys6OufyDAxI1xRX7XSqibcdRcPWOFCiOR5Hr0/QJm+9dT8LHqMOt
 /5lhlXFA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60066)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w6OyF-0000000073T-0W0n;
 Sat, 28 Mar 2026 08:24:39 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w6OyD-000000000WK-1f02; Sat, 28 Mar 2026 08:24:37 +0000
Date: Sat, 28 Mar 2026 08:24:37 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aceQRSc5o4D-HHmq@shell.armlinux.org.uk>
References: <acZQaDeCoib5S5UA@shell.armlinux.org.uk>
 <E1w63fl-0000000E3Vb-3JkY@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1w63fl-0000000E3Vb-3JkY@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: simplify
 GSO/TSO test in stmmac_xmit()
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.786];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,armlinux.org.uk:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 1B8D634DCF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 09:40:09AM +0000, Russell King (Oracle) wrote:
> The test in stmmac_xmit() to see whether we should pass the skbuff to
> stmmac_tso_xmit() is more complex than it needs to be. This test can
> be simplified by storing the mask of GSO types that we will pass, and
> setting it according to the enabled features.
> 
> Note that "tso" is a mis-nomer since commit b776620651a1 ("net:
> stmmac: Implement UDP Segmentation Offload"). Also note that this
> commit controls both via the TSO feature. We preserve this behaviour
> in this commit.
> 
> Also, this commit unconditionally accessed skb_shinfo(skb)->gso_type
> for all frames, even when skb_is_gso() was false. This access is
> eliminated.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

AI review of this patch regurgitates Jakub's point that was discussed.

> @@ -3700,7 +3700,7 @@ static int stmmac_hw_setup(struct net_device *dev)
>  	stmmac_set_rings_length(priv);
>  
>  	/* Enable TSO */
> -	if (priv->tso) {
> +	if (priv->gso_enabled_types) {
>  		for (chan = 0; chan < tx_cnt; chan++) {
>  			struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[chan];
>  

...

> @@ -7828,7 +7834,7 @@ static int __stmmac_dvr_probe(struct device *device,
>  		ndev->hw_features |= NETIF_F_TSO | NETIF_F_TSO6;
>  		if (priv->plat->core_type == DWMAC_CORE_GMAC4)
>  			ndev->hw_features |= NETIF_F_GSO_UDP_L4;
> -		priv->tso = true;
> +		stmmac_set_gso_types(priv, true);

Clearly, the issue it is regurgitating has been there for a long time
and isn't a new issue introduced by this patch.

AI needs to stop doing this, because it is encouraging multiple changes
in a single patch, which is against the normal kernel process.

As already pointed out, there are multiple issues with stmmac TSO
support, particularly with glue drivers that enable TSO on some
queues/channels and not others, since netdev core TSO support is
global across all channels.

So, won't the AI response in this patch - it's just another pre-
existing issue that needs fixing in a separate patch.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
