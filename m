Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAE08FD9E3
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jun 2024 00:35:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD357C712A3;
	Wed,  5 Jun 2024 22:35:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AAE1C712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jun 2024 22:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717626921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mGUvRIHxApb4W4k3Z2IjsSgeORI+ALPTCJ3tmFHzmQI=;
 b=d0+Tvmh0iAte9E0yiWUQnJLOdVfJ31n+E32qaRKtQaLeLDxli3wb7GVPerkGcJT1lrhpSh
 3vve5teyq7kVyUeM+V0BTCUH1daPzWWJ9XfOAnbW7nb/rfvWEg8k95G0ZH0xRdj/WXVZzE
 ZICUrO3NQqA/gRXatYJYcUTx9dCtW68=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-h2X0RkBFP8ewvyX1dlq31Q-1; Wed, 05 Jun 2024 18:35:19 -0400
X-MC-Unique: h2X0RkBFP8ewvyX1dlq31Q-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3d2009d9308so191924b6e.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Jun 2024 15:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717626919; x=1718231719;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mGUvRIHxApb4W4k3Z2IjsSgeORI+ALPTCJ3tmFHzmQI=;
 b=aLOhWqgLxBCSpo/kHKbyJGeVauam/10iUmiQJQ24sQ+vjKWt8HQ4dV00yW0hUnjwt/
 sMFk227jk7Jd0KT2TSNbV+Peno/6aRlYUHKqbS3aTJOrRvcdp1yTakO3Urs0i2JMplKB
 e74+1Xg0FHyyusqi2+xaC0K0S+PbZJvKlUY9tivRo4SVlVQlICYFx1qsGZGiIwWog43A
 5L2DJCnvbxVhXCQOeIH/zOukcwENt+wZeeFxolNwZK/tIYNRE63j/7x1s7kuTa1yDSXT
 Xpjc3mwCNeJ8DW4ulFzWT0HV7JoQSiF/du+Mcf7vIkohCtpKOuUaVZnFa7CpWMc3CJNc
 oHCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyKfvRQK+DtDg6Bc6epyAPzt5MyIQidfuzHgziyEi2pPL5ORtP9uJo/xKPx0tW9YqzXxR/oHsTBlOmOagnB5GdhKJu0EgSAFUjlLRf0AV3TSD0C2ouXpsk
X-Gm-Message-State: AOJu0YwZqoKcEY5DysN8jx7X5MdZReQeeIhFdcgdWq716ckcx5h0vqbr
 v/Sqk6yynmvacZ6NWcT1JrxzlsVd9X/ICiJwcQBLSPOA1fnNvDoMGfuU2aGmeLEn05egHhyE/xA
 OWGZA4CWmqzthCjm0tXdm8mqT/Qo4AgdWhRDez13s5EAmt1g89m4g+KUjapKReRpxR4EE13TIQS
 cxMg==
X-Received: by 2002:aca:f1a:0:b0:3d2:fd:46a9 with SMTP id
 5614622812f47-3d20439f559mr3914040b6e.26.1717626918632; 
 Wed, 05 Jun 2024 15:35:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7G/2i5SBo9M6yr0du5HTVWy62F2XVqLU5iWUxlymBQzsfQz6969lnHJgAcHnb5+/Qf42EDw==
X-Received: by 2002:aca:f1a:0:b0:3d2:fd:46a9 with SMTP id
 5614622812f47-3d20439f559mr3914029b6e.26.1717626918188; 
 Wed, 05 Jun 2024 15:35:18 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4403895d7f4sm441041cf.19.2024.06.05.15.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 15:35:17 -0700 (PDT)
Date: Wed, 5 Jun 2024 17:35:15 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>,
 Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <zzevmhmwxrhs5yfv5srvcjxrue2d7wu7vjqmmoyd5mp6kgur54@jvmuv7bxxhqt>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
 <E1sD0P5-00EzC6-Me@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1sD0P5-00EzC6-Me@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next v2 5/8] net: stmmac: dwmac4:
 convert sgmii/rgmii "pcs" to phylink
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

On Fri, May 31, 2024 at 12:26:35PM GMT, Russell King (Oracle) wrote:
> Convert dwmac4 sgmii/rgmii "pcs" implementation to use a phylink_pcs
> so we can eventually get rid of the exceptional paths that conflict
> with phylink.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 102 ++++++++++++------
>  1 file changed, 72 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> index dbd9f93b2460..cb99cb69c52b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> @@ -14,6 +14,7 @@
>  #include <linux/slab.h>
>  #include <linux/ethtool.h>
>  #include <linux/io.h>
> +#include <linux/phylink.h>
>  #include "stmmac.h"
>  #include "stmmac_pcs.h"
>  #include "dwmac4.h"
> @@ -758,42 +759,76 @@ static void dwmac4_ctrl_ane(void __iomem *ioaddr, bool ane, bool srgmi_ral,
>  	dwmac_ctrl_ane(ioaddr, GMAC_PCS_BASE, ane, srgmi_ral, loopback);
>  }
>  
> -static void dwmac4_get_adv_lp(void __iomem *ioaddr, struct rgmii_adv *adv)
> +static int dwmac4_mii_pcs_validate(struct phylink_pcs *pcs,
> +				   unsigned long *supported,
> +				   const struct phylink_link_state *state)
>  {
> -	dwmac_get_adv_lp(ioaddr, GMAC_PCS_BASE, adv);
> +	/* Only support in-band */
> +	if (!test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, state->advertising))
> +		return -EINVAL;
> +
> +	return 0;
>  }
>  
> -/* RGMII or SMII interface */
> -static void dwmac4_phystatus(void __iomem *ioaddr, struct stmmac_extra_stats *x)
> +static int dwmac4_mii_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
> +				 phy_interface_t interface,
> +				 const unsigned long *advertising,
> +				 bool permit_pause_to_mac)
>  {
> +	struct mac_device_info *hw = phylink_pcs_to_mac_dev_info(pcs);
> +
> +	return dwmac_pcs_config(hw, neg_mode, interface, advertising,
> +				GMAC_PCS_BASE);
> +}
> +
> +static void dwmac4_mii_pcs_get_state(struct phylink_pcs *pcs,
> +				     struct phylink_link_state *state)
> +{
> +	struct mac_device_info *hw = phylink_pcs_to_mac_dev_info(pcs);
> +	unsigned int clk_spd;
>  	u32 status;
>  
> -	status = readl(ioaddr + GMAC_PHYIF_CONTROL_STATUS);
> -	x->irq_rgmii_n++;
> +	status = readl(hw->pcsr + GMAC_PHYIF_CONTROL_STATUS);
> +
> +	state->link = !!(status & GMAC_PHYIF_CTRLSTATUS_LNKSTS);
> +	if (!state->link)
> +		return;
>  
> -	/* Check the link status */
> -	if (status & GMAC_PHYIF_CTRLSTATUS_LNKSTS) {
> -		int speed_value;
> +	clk_spd = FIELD_GET(GMAC_PHYIF_CTRLSTATUS_SPEED, status);
> +	if (clk_spd == GMAC_PHYIF_CTRLSTATUS_SPEED_125)
> +		state->speed = SPEED_1000;
> +	else if (clk_spd == GMAC_PHYIF_CTRLSTATUS_SPEED_25)
> +		state->speed = SPEED_100;
> +	else if (clk_spd == GMAC_PHYIF_CTRLSTATUS_SPEED_2_5)
> +		state->speed = SPEED_10;
> +
> +	/* FIXME: Is this even correct?
> +	 * GMAC_PHYIF_CTRLSTATUS_TC = BIT(0)
> +	 * GMAC_PHYIF_CTRLSTATUS_LNKMOD = BIT(16)
> +	 * GMAC_PHYIF_CTRLSTATUS_LNKMOD_MASK = 1
> +	 *
> +	 * The result is, we test bit 0 for the duplex setting.
> +	 */
> +	state->duplex = status & GMAC_PHYIF_CTRLSTATUS_LNKMOD_MASK ?
> +			DUPLEX_FULL : DUPLEX_HALF;

My gut feeling is that this is/was wrong, and the LNKMOD_MASK expects you've
shifted / got the field out etc...

Sneh, Abhishek, can you confirm this for us? I'd appreciate it.

I need to run for the evening soon, but tested taking sa8775p-ride,
making it have managed = "in-band-status", and remove the
HAS_INTEGRATED_PCS stuff... and then all of a sudden the link acts as if
its half duplex (but works otherwise I think? need to test more
throughly):

    [   11.458385] qcom-ethqos 23040000.ethernet end0: Link is Up - 1Gbps/Half - flow control rx/tx

So I think it is probably wrong, and if I understand
correctly most of the special treatment for the qualcomm driver can be
dropped? I know it was mentioned that all the 2.5 Gpbs stuff is a
Qualcomm addition (and that you're chasing down some answers with the
hardware team), but hopefully you can confirm the register's bitfields
for us here!


>  
> -		x->pcs_link = 1;
> +	dwmac_pcs_get_state(hw, state, GMAC_PCS_BASE);
> +}
>  
> -		speed_value = ((status & GMAC_PHYIF_CTRLSTATUS_SPEED) >>
> -			       GMAC_PHYIF_CTRLSTATUS_SPEED_SHIFT);
> -		if (speed_value == GMAC_PHYIF_CTRLSTATUS_SPEED_125)
> -			x->pcs_speed = SPEED_1000;
> -		else if (speed_value == GMAC_PHYIF_CTRLSTATUS_SPEED_25)
> -			x->pcs_speed = SPEED_100;
> -		else
> -			x->pcs_speed = SPEED_10;
> +static const struct phylink_pcs_ops dwmac4_mii_pcs_ops = {
> +	.pcs_validate = dwmac4_mii_pcs_validate,
> +	.pcs_config = dwmac4_mii_pcs_config,
> +	.pcs_get_state = dwmac4_mii_pcs_get_state,
> +};
>  
> -		x->pcs_duplex = (status & GMAC_PHYIF_CTRLSTATUS_LNKMOD_MASK);
> +static struct phylink_pcs *
> +dwmac4_phylink_select_pcs(struct stmmac_priv *priv, phy_interface_t interface)
> +{
> +	if (priv->hw->pcs & STMMAC_PCS_RGMII ||
> +	    priv->hw->pcs & STMMAC_PCS_SGMII)
> +		return &priv->hw->mac_pcs;
>  
> -		pr_info("Link is Up - %d/%s\n", (int)x->pcs_speed,
> -			x->pcs_duplex ? "Full" : "Half");
> -	} else {
> -		x->pcs_link = 0;
> -		pr_info("Link is Down\n");
> -	}
> +	return NULL;
>  }
>  
>  static int dwmac4_irq_mtl_status(struct stmmac_priv *priv,
> @@ -867,8 +902,12 @@ static int dwmac4_irq_status(struct mac_device_info *hw,
>  	}
>  
>  	dwmac_pcs_isr(ioaddr, GMAC_PCS_BASE, intr_status, x);
> -	if (intr_status & PCS_RGSMIIIS_IRQ)
> -		dwmac4_phystatus(ioaddr, x);
> +	if (intr_status & PCS_RGSMIIIS_IRQ) {
> +		/* TODO Dummy-read to clear the IRQ status */
> +		readl(ioaddr + GMAC_PHYIF_CONTROL_STATUS);
> +		phylink_pcs_change(&hw->mac_pcs, false);

I'll just highlight it here, but same question as the dwmac1000 change.
We can discuss that question there, and if anything changes apply it
here too. It is probably fine and I'm fussing over nothing.

> +		x->irq_rgmii_n++;
> +	}
>  
>  	return ret;
>  }
> @@ -1186,6 +1225,7 @@ static void dwmac4_set_hw_vlan_mode(struct mac_device_info *hw)
>  const struct stmmac_ops dwmac4_ops = {
>  	.core_init = dwmac4_core_init,
>  	.update_caps = dwmac4_update_caps,
> +	.phylink_select_pcs = dwmac4_phylink_select_pcs,
>  	.set_mac = stmmac_set_mac,
>  	.rx_ipc = dwmac4_rx_ipc_enable,
>  	.rx_queue_enable = dwmac4_rx_queue_enable,
> @@ -1210,7 +1250,6 @@ const struct stmmac_ops dwmac4_ops = {
>  	.set_eee_timer = dwmac4_set_eee_timer,
>  	.set_eee_pls = dwmac4_set_eee_pls,
>  	.pcs_ctrl_ane = dwmac4_ctrl_ane,
> -	.pcs_get_adv_lp = dwmac4_get_adv_lp,
>  	.debug = dwmac4_debug,
>  	.set_filter = dwmac4_set_filter,
>  	.set_mac_loopback = dwmac4_set_mac_loopback,
> @@ -1230,6 +1269,7 @@ const struct stmmac_ops dwmac4_ops = {
>  const struct stmmac_ops dwmac410_ops = {
>  	.core_init = dwmac4_core_init,
>  	.update_caps = dwmac4_update_caps,
> +	.phylink_select_pcs = dwmac4_phylink_select_pcs,
>  	.set_mac = stmmac_dwmac4_set_mac,
>  	.rx_ipc = dwmac4_rx_ipc_enable,
>  	.rx_queue_enable = dwmac4_rx_queue_enable,
> @@ -1254,7 +1294,6 @@ const struct stmmac_ops dwmac410_ops = {
>  	.set_eee_timer = dwmac4_set_eee_timer,
>  	.set_eee_pls = dwmac4_set_eee_pls,
>  	.pcs_ctrl_ane = dwmac4_ctrl_ane,
> -	.pcs_get_adv_lp = dwmac4_get_adv_lp,
>  	.debug = dwmac4_debug,
>  	.set_filter = dwmac4_set_filter,
>  	.flex_pps_config = dwmac5_flex_pps_config,
> @@ -1278,6 +1317,7 @@ const struct stmmac_ops dwmac410_ops = {
>  const struct stmmac_ops dwmac510_ops = {
>  	.core_init = dwmac4_core_init,
>  	.update_caps = dwmac4_update_caps,
> +	.phylink_select_pcs = dwmac4_phylink_select_pcs,
>  	.set_mac = stmmac_dwmac4_set_mac,
>  	.rx_ipc = dwmac4_rx_ipc_enable,
>  	.rx_queue_enable = dwmac4_rx_queue_enable,
> @@ -1302,7 +1342,6 @@ const struct stmmac_ops dwmac510_ops = {
>  	.set_eee_timer = dwmac4_set_eee_timer,
>  	.set_eee_pls = dwmac4_set_eee_pls,
>  	.pcs_ctrl_ane = dwmac4_ctrl_ane,
> -	.pcs_get_adv_lp = dwmac4_get_adv_lp,
>  	.debug = dwmac4_debug,
>  	.set_filter = dwmac4_set_filter,
>  	.safety_feat_config = dwmac5_safety_feat_config,
> @@ -1391,5 +1430,8 @@ int dwmac4_setup(struct stmmac_priv *priv)
>  	mac->mii.clk_csr_mask = GENMASK(11, 8);
>  	mac->num_vlan = dwmac4_get_num_vlan(priv->ioaddr);
>  
> +	mac->mac_pcs.ops = &dwmac4_mii_pcs_ops;
> +	mac->mac_pcs.neg_mode = true;
> +
>  	return 0;
>  }
> -- 
> 2.30.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
