Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12301A2AC77
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2025 16:31:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6880C78006;
	Thu,  6 Feb 2025 15:31:33 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B234C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2025 15:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cQ0FdpNgHOekWmP2VoCpsk8gYuzsChIxdkx5orIICcA=; b=wFMh7IIqWLcDH4ZdUBSwhGC7hT
 KAple1XmoomeYbrKzex41iFR/7byyI62Rmox1VtsvppXUxxDoq5L0fgJf4nGLPX9/4vdsjn81cIcy
 ySrNV3KlsBTXGKznowYajXxOw6ivDfvB8TRz26mgBQTYCmh24NqZ1evcB+M7LXHGj6vc6TS7LZwGt
 USN46/YhkZzAd1KiVjlJbJejwwc2xJVVdJyKafyppyyK0LukdKxmTHaXua2pWNERrsvpsyAy32jsO
 UE3XUNH74+8kogXNTDPyepANF3PN20DY4ymDPjhitqNQzodxxNaaVwWXJoWHEdlingxOKpluTEzZH
 vAXhaGEw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54766)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tg3py-0002c8-0a;
 Thu, 06 Feb 2025 15:30:42 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tg3pp-0003WN-2X;
 Thu, 06 Feb 2025 15:30:33 +0000
Date: Thu, 6 Feb 2025 15:30:33 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <Z6TVmdCZeWerAZKP@shell.armlinux.org.uk>
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
 <20250206131859.2960543-3-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250206131859.2960543-3-yong.liang.choong@linux.intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-stm32@st-md-mailman.stormreply.com,
 x86@kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mengyuan Lou <mengyuanlou@net-swift.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Borislav Petkov <bp@alien8.de>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v7 2/7] net: pcs: xpcs:
 re-initiate clause 37 Auto-negotiation
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

On Thu, Feb 06, 2025 at 09:18:54PM +0800, Choong Yong Liang wrote:
> The xpcs_switch_interface_mode function was introduced to handle
> interface switching.
> 
> According to the XPCS datasheet, a soft reset is required to initiate
> Clause 37 auto-negotiation when the XPCS switches interface modes.

Hmm. Given that description, taking it literally, claus 37
auto-negotiation is 1000BASE-X, not Cisco SGMII (which isn't an IEEE
802.3 standard.) Are you absolutely sure that this applies to Cisco
SGMII?

If the reset is required when switching to SGMII, should it be done
before or after configuring the XPCS for SGMII?

Also, if the reset is required, what happens if we're already using
SGMII, but AN has been disabled temporarily and is then re-enabled?
Is a reset required?

What about 1000BASE-X when AN is enabled or disabled and then switching
to SGMII?

> +static int xpcs_switch_to_aneg_c37_sgmii(const struct dw_xpcs_compat *compat,
> +					 struct dw_xpcs *xpcs,
> +					 unsigned int neg_mode)
> +{
> +	bool an_c37_enabled;
> +	int ret, mdio_ctrl;
> +
> +	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {
> +		mdio_ctrl = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_BMCR);
> +		if (mdio_ctrl < 0)
> +			return mdio_ctrl;
> +
> +		an_c37_enabled = mdio_ctrl & BMCR_ANENABLE;
> +		if (!an_c37_enabled) {

I don't think that we need "an_c37_enabled" here, I think simply:

		if (!(mdio_ctrl & BMCR_ANENABLE)) {

would be sufficient.

> +			//Perform soft reset to initiate C37 auto-negotiation
> +			ret = xpcs_soft_reset(xpcs, compat);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +	return 0;

I'm also wondering (as above) whether this soft reset needs to happen
_after_ xpcs_config_aneg_c37_sgmii() has done its work - this function
temporarily disables AN while it's doing its work.

I'm also wondering whether AN being disabled is really a deciding
factor (e.g. when switching from 1000BASE-X AN-enabled to SGMII, is a
reset required?)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
