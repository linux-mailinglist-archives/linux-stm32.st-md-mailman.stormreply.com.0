Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMmsNASYqmmIUAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 10:01:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BF621D8FC
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 10:01:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67A55C8F271;
	Fri,  6 Mar 2026 09:01:51 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99B28C8F270
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2026 09:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZgDBXmEnVujJM8vulMEVYeA6ICqdKuQICuLq3YHevSE=; b=ahlOo+mh3t8qpxKXMd1PjHafv8
 37m8cqehiUO9Z7eeLymK0NQLXS2kg/oIzYDJb/+pa/1UWGRgWbVrqrzTls5cEEWCNlrHOHM8cTYwQ
 a5II4e0BX4jwm8RucqWkof7Cty24hFJL9ulS8FjKmCsGQN7FbTvSSZfsOuq6UAfECxPkKZRk/aJ/8
 XbyLQLvyn0r0SFGP1co3x79I6CK5a2c/lL3xzvApaImX44AhUkUNRDimQ0ixXKyiyVJXayzafi+LL
 2RQjiZdzN9d1XCKWHlaN+a9mSDe44Xinj4sdhoXz2tXjO0f+CtHT4Jrefqs2ytwtMX/ozvm4Z6pWd
 3Y7Uo/bQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47666)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vyR40-000000000jm-29aw;
 Fri, 06 Mar 2026 09:01:40 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vyR3w-000000001IO-41FR; Fri, 06 Mar 2026 09:01:36 +0000
Date: Fri, 6 Mar 2026 09:01:36 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aaqX8IxLzZ7jGM4r@shell.armlinux.org.uk>
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
 <E1vy6A9-0000000Btwp-0lxY@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vy6A9-0000000Btwp-0lxY@rmk-PC.armlinux.org.uk>
Cc: Paolo Abeni <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 3/8] net: stmmac: mdio:
 simplify MDC clock divisor lookup
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
X-Rspamd-Queue-Id: B8BF621D8FC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:pabeni@redhat.com,m:samuel@sholland.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:wens@kernel.org,m:linux-sunxi@lists.linux.dev,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.626];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,armlinux.org.uk:url,armlinux.org.uk:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 10:42:37AM +0000, Russell King (Oracle) wrote:
> As each lookup now iterates over each table in the same way, simplfy
> the code to select the table, and then walk that table.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 29 +++++++------------
>  1 file changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index 6292911fb54b..c9f0b8b601d2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -535,6 +535,7 @@ static const struct stmmac_clk_rate stmmac_xgmac_csr_to_mdc[] = {
>   */
>  static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
>  {
> +	const struct stmmac_clk_rate *rates;
>  	unsigned long clk_rate;
>  	u32 value = ~0;
>  	int i;
> @@ -548,25 +549,17 @@ static u32 stmmac_clk_csr_set(struct stmmac_priv *priv)
>  	 * the frequency of clk_csr_i. So we do not change the default
>  	 * divider.
>  	 */
> -	for (i = 0; stmmac_std_csr_to_mdc[i].rate; i++)
> -		if (clk_rate > stmmac_std_csr_to_mdc[i].rate)
> -			break;
> -	if (stmmac_std_csr_to_mdc[i].cr != (u8)~0)
> -		value = stmmac_std_csr_to_mdc[i].cr;
> -
> -	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I) {
> -		for (i = 0; stmmac_sun8i_csr_to_mdc[i].rate; i++)
> -			if (clk_rate > stmmac_sun8i_csr_to_mdc[i].rate)
> -				break;
> -		value = stmmac_sun8i_csr_to_mdc[i].cr;
> -	}
> +	rates = stmmac_std_csr_to_mdc;
> +	if (priv->plat->flags & STMMAC_FLAG_HAS_SUN8I)
> +		rates = stmmac_sun8i_csr_to_mdc;
> +	if (priv->plat->core_type == DWMAC_CORE_XGMAC)
> +		rates = stmmac_xgmac_csr_to_mdc;
>  
> -	if (priv->plat->core_type == DWMAC_CORE_XGMAC) {
> -		for (i = 0; stmmac_xgmac_csr_to_mdc[i].rate; i++)
> -			if (clk_rate > stmmac_xgmac_csr_to_mdc[i].rate)
> -				break;
> -		value = stmmac_xgmac_csr_to_mdc[i].cr;
> -	}
> +	for (i = 0; rates[i].rate; i++)
> +		if (clk_rate > rates[i].rate)
> +			break;
> +	if (rates[i].cr != (u8)~0)
> +		value = rates[i].cr;

Looking at the AI review, it seems to me that the AI review is
incorrect.

With reference to the full original code which can be seen in:
https://patchwork.kernel.org/project/netdevbpf/patch/E1vy69y-0000000Btwd-3oq7@rmk-PC.armlinux.org.uk/

If we look at the original code, then we can see that the intention
is that if clk_rate is smaller than the last real entry for the
sun8i and xgmac cases, the value should end up as zero - and this is
exactly what the new code does. So, the behaviour is preserved, even
though AI thinks it isn't.

AI seems to think that reaching the last entry for sun8i and xgmac
means we have an invalid rate. That is where AI is going wrong -
that is an incorrect "assumption".

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
