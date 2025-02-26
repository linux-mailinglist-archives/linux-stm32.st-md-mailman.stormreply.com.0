Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 638E6A4651D
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 16:40:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05DCDC7A832;
	Wed, 26 Feb 2025 15:40:56 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B12FC7A831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 15:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IlbIe310WlqxQlCzQsZku/DHMOFOicrxArfMuFNw1Gg=; b=Gr6mqL/5KT3mi2rXH+/NzlclrA
 Lf50svvp6oZ9jNNQ6De4ANjM/sZh5i35wXkvVdJa9o3ZfmLJZz3/DFBnDykr8rGv5KuQuwiV80Xop
 V34TZm6Dq09WG63RVEvT2AzKVwUxU9afefJjx+C1s2HAyXwsFN9acOg7fDEnucngr3I174nfaFaX3
 wIunBfhAx3BdnsUigzn5R95ayXmUE9XX74HhhJVY2XAeDQRJbKrxtqtuN3/HTnD2ZKTq5Gs1nXv/V
 mimnlMLCz7dFvfWNnvaFFyaiB4md/ZjoifI6z/ttueh3w5VhSYfBePvd2Mp4VWNar3ihhB7sPkw4D
 eWG3nE2Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53160)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tnJWJ-0004je-0q;
 Wed, 26 Feb 2025 15:40:23 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tnJWF-0007DP-0q;
 Wed, 26 Feb 2025 15:40:19 +0000
Date: Wed, 26 Feb 2025 15:40:19 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <Z78141ZNWEYDSi5l@shell.armlinux.org.uk>
References: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
 <20250226074837.1679988-3-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250226074837.1679988-3-yong.liang.choong@linux.intel.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v8 2/6] net: pcs: xpcs:
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

On Wed, Feb 26, 2025 at 03:48:33PM +0800, Choong Yong Liang wrote:
> diff --git a/drivers/net/pcs/pcs-xpcs-wx.c b/drivers/net/pcs/pcs-xpcs-wx.c
> index fc52f7aa5f59..f73ab04d09f0 100644
> --- a/drivers/net/pcs/pcs-xpcs-wx.c
> +++ b/drivers/net/pcs/pcs-xpcs-wx.c
> @@ -172,11 +172,9 @@ int txgbe_xpcs_switch_mode(struct dw_xpcs *xpcs, phy_interface_t interface)
>  		return 0;
>  	}
>  
> -	if (xpcs->interface == interface && !txgbe_xpcs_mode_quirk(xpcs))
> +	if (!txgbe_xpcs_mode_quirk(xpcs))
>  		return 0;
>  
> -	xpcs->interface = interface;
> -

...

> --- a/drivers/net/pcs/pcs-xpcs.c
> +++ b/drivers/net/pcs/pcs-xpcs.c
> @@ -602,12 +602,37 @@ static void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
>  		__set_bit(compat->interface, interfaces);
>  }
>  
> +static int xpcs_switch_interface_mode(struct dw_xpcs *xpcs,
> +				      phy_interface_t interface)
> +{
> +	int ret = 0;
> +
> +	if (xpcs->interface != interface) {
> +		if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID) {
> +			ret = txgbe_xpcs_switch_mode(xpcs, interface);
> +			if (ret)
> +				return ret;

The above modification changes the functionality.

In the old code, txgbe_xpcs_switch_mode() does its work when
xpcs->interface is not the same as interface OR txgbe_xpcs_mode_quirk()
is true.

Your replacement code calls txgbe_xpcs_switch_mode() when 
xpcs->interface is not the same as interface, *and* it can do its
work when txgbe_xpcs_mode_quirk() returns true.

So, e.g. when txgbe_xpcs_mode_quirk() returns false, but the interface
changes, txgbe_xpcs_mode_quirk() used to do its work, but as a result
if your changes, it becomes a no-op.

The point of txgbe_xpcs_mode_quirk() is to always do the work if it
returns true, even if the interface mode doesn't change.

Therefore, this patch is logically incorrect, and likely breaks TXGBE.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
