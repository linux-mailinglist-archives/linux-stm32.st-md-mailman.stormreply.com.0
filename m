Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDE148EA61
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jan 2022 14:09:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5919CC5F1F4;
	Fri, 14 Jan 2022 13:09:36 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FB83C5E2AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jan 2022 13:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=YnTWFx/yPuQ1VJBPYKlDARZ46we08KrqVjJlbdgCYJc=; b=Sw/ckGTBxXX43aAOM1HZp2w+Ez
 c0haMM5HFuJ3YE9bAx+QhnWH2u7ueis4Pt8sdrZT6uzVuKm9Pp8mrpqpkM3vtD6NxUHs9/tBm2TS3
 nsFL9ZEpMXQrH2XWnBRp+S0b6KT8yhYVBVpOFWyQysliV5Dk/NjnbnYx1JCh9nqlElug=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1n8MKI-001Pd9-Rk; Fri, 14 Jan 2022 14:09:06 +0100
Date: Fri, 14 Jan 2022 14:09:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Message-ID: <YeF18mxKuO4/4G0V@lunn.ch>
References: <20220114040755.1314349-1-kai.heng.feng@canonical.com>
 <20220114040755.1314349-2-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220114040755.1314349-2-kai.heng.feng@canonical.com>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 Russell King <linux@armlinux.org.uk>, joabreu@synopsys.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 peppe.cavallaro@st.com, Ivan Bornyakov <i.bornyakov@metrotek.ru>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 2/2] stmmac: intel: Honor phy LED set by
 system firmware on a Dell hardware
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

On Fri, Jan 14, 2022 at 12:07:54PM +0800, Kai-Heng Feng wrote:
> BIOS on Dell Edge Gateway 3200 already makes its own phy LED setting, so
> instead of setting another value, keep it untouched and restore the saved
> value on system resume.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 16 +++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  2 +
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |  4 ++
>  drivers/net/phy/marvell.c                     | 58 ++++++++++++-------
>  include/linux/marvell_phy.h                   |  1 +
>  5 files changed, 61 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> index 8e8778cfbbadd..f8a2879e0264a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> @@ -857,6 +857,16 @@ static const struct dmi_system_id quark_pci_dmi[] = {
>  	{}
>  };
>  
> +static const struct dmi_system_id use_preset_led[] = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell EMC"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Edge Gateway 3200"),
> +		},
> +	},
> +	{}
> +};

This is a PHY property. Why is the MAC involved?

Please also think about how to make this generic, so any ACPI based
system can use it, with any PHY.

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
