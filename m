Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A76A46539
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 16:43:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 430BFC7A832;
	Wed, 26 Feb 2025 15:43:42 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7DB7C7A831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 15:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a/Qb5wr4Rktc7tGiLjgQsav252MOo0XtSMwhk7qeqzs=; b=QudsgOBLA9IYJ3c1Izp+exRAYJ
 I6tGKvgOw4TgPpxeHoFVHf4MSl9ILu7W+9BjMZHD6rWe+ZyqrdbM6uZFpBUI5XCZ+irh8rJE0wyx6
 BWjjWJRHN7p+ZRePLH+aQnZAq6pvC8LgE3WdRL6pVN01ai14LVj8M3qpmBgvIeeO1twxc5/Z+slHJ
 kkivBkwv2WLg9kLWreuvHJ6zhSzamCKGFVRiAC9UZHNPEn4WGBod2FefrsfgHXEk2XaMcgL84Bu1Z
 YwWqkWFwZSnzxGFIDlwzLUBRXGQsNf4oNRFb2YAEkqoVl3SoHzvZN3nxQk0JbJOG87KUJtRuQGzOI
 H50kXAJw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40300)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1tnJZ1-0004ky-0z;
 Wed, 26 Feb 2025 15:43:11 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1tnJYx-0007Dk-1g;
 Wed, 26 Feb 2025 15:43:07 +0000
Date: Wed, 26 Feb 2025 15:43:07 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <Z782i67tlpj6d57m@shell.armlinux.org.uk>
References: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
 <20250226074837.1679988-5-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250226074837.1679988-5-yong.liang.choong@linux.intel.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v8 4/6] stmmac: intel: configure
 SerDes according to the interface mode
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

On Wed, Feb 26, 2025 at 03:48:35PM +0800, Choong Yong Liang wrote:
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 6d2aa77ea963..af22a11c2b8a 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -236,6 +236,10 @@ struct plat_stmmacenet_data {
>  	int (*serdes_powerup)(struct net_device *ndev, void *priv);
>  	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
>  	void (*speed_mode_2500)(struct net_device *ndev, void *priv);
> +	int (*mac_finish)(struct net_device *ndev,
> +			  void *priv,
> +			  unsigned int mode,
> +			  phy_interface_t interface);
>  	void (*ptp_clk_freq_config)(struct stmmac_priv *priv);
>  	int (*init)(struct platform_device *pdev, void *priv);
>  	void (*exit)(struct platform_device *pdev, void *priv);

This should be part of patch 5, and the order of patches 4 and 5
reversed.

The subject line should also be "net: stmmac: ..."

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
