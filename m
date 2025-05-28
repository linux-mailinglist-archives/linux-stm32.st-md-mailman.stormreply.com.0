Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8C2AC6BB6
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 16:32:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17E04C36B36;
	Wed, 28 May 2025 14:32:50 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA024C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 14:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U+FDShjpx6kGEUB2/dQKTjU6xdyCNeX5trpYm619UV4=; b=0g0dZYmb7qFGfQ6Gt46nLap1SM
 L54LEYGcitbtYKGtm9Fz/qwyr1CXW4N6f2R0fuO8qrUfCyopQMDIvPocpm79WXDEZ6nYQVga+Dxli
 tsnaCIBD9NDb0B3YXnWZ5FFmDWioIi3kERl1fFLstxdirVcevQWSL3slMVX/xcjm6J5fzLvljyKX6
 DuK4Lq/+Zgs3yg0vnTiIurv7ny7d2x+Y9Ynr+4A6DwvY/9aZcbAAWJkLUC6TfjccvbKpNqTSjRuog
 bu18UN9MXxuWyUJKrjjFyQjmJRpewfpkHUvev73LP6t2aRCste0h1QQmVmxs7Gwy0RQL8nQ5uYkcl
 GCfODJSw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38612)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1uKHpN-0000Ns-0k;
 Wed, 28 May 2025 15:32:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1uKHpF-0002UB-2v;
 Wed, 28 May 2025 15:32:13 +0100
Date: Wed, 28 May 2025 15:32:13 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: weishangjuan@eswincomputing.com
Message-ID: <aDcebRguDnM7sqVk@shell.armlinux.org.uk>
References: <20250528041455.878-1-weishangjuan@eswincomputing.com>
 <20250528041634.912-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250528041634.912-1-weishangjuan@eswincomputing.com>
Cc: vladimir.oltean@nxp.com, edumazet@google.com, jszhang@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 ningyu@eswincomputing.com, 0x1207@gmail.com, lizhi2@eswincomputing.com,
 kuba@kernel.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, jan.petrous@oss.nxp.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, yong.liang.choong@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 boon.khai.ng@altera.com, p.zabel@pengutronix.de, inochiama@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32]
 =?iso-8859-1?q?=5BPATCH_v2_2/2=5D_ethernet=3A=A0esw?=
 =?iso-8859-1?q?in=3A=A0Add=A0eic7700=A0ethernet=A0driver?=
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

On Wed, May 28, 2025 at 12:16:25PM +0800, weishangjuan@eswincomputing.com wrote:
> +static struct clk *dwc_eth_find_clk(struct plat_stmmacenet_data *plat_dat,
> +				    const char *name)
> +{
> +	for (int i = 0; i < plat_dat->num_clks; i++)
> +		if (strcmp(plat_dat->clks[i].id, name) == 0)
> +			return plat_dat->clks[i].clk;
> +
> +	return NULL;
> +}

Okay, I think this driver is mindless copying of dwmac-dwc-qos-eth.c
between 24th February and 9th April 2025. I can say this because I added
this function to that driver and later removed it.

Looking at the rest of the code, I doubt this even does anything useful
(hence "mindless copying") as you're not fetching any clocks into this
array, and plat_dat->num_clks will be zero here. Thus, this will return
NULL. Therefore, you haven't thought about whether you need this or not,
but have just copied dwmac-dwc-qos-eth.c and then modified it until it
works for you.

You haven't acknowledged where you derived this code from - you've cut
the header of your source file out, and basically are claiming it to be
all your own work. I know this is rubbish for the reason I've stated
above. This is quite simply plagiarism. I am not impressed.

Thus I will end the review here, and simply state that this is not
acceptable.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
