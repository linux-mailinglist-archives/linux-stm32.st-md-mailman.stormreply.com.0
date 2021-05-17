Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1975382A51
	for <lists+linux-stm32@lfdr.de>; Mon, 17 May 2021 12:55:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58E2BC57B75;
	Mon, 17 May 2021 10:55:07 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C92BC57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 May 2021 10:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/jXKRvEAGHf4XcoVw2En2iOfrxY4eQ22yvfNze/jORc=; b=lqRFR80I/wSPtHYniW1bDyEUf
 cUrsWt0HhhyqUWfhPPBnUvFm8Eki/Z25W8/fBog//DEmgWyVPtEDcT2EQJDBjAE99yRG8uZONXwC1
 xo153AxgP/6c7ejMd2dWgtsbEDTG1DGQTxUvc+26zHmsRR6MJmz/yknSly84bMdz8RLxOVpXc5utZ
 beYdwnC6JwOs8ZrZnz1VIXQPQ8kNflGlZqImlC7vcQeOj0v5P47JGRbNqpSJc6PKKiUv8u/tiRdof
 k954LYDr6WpuIg0fBhub1a8aXk8Yo+WZTSPxFXo75chhgvUx02SKd1/9BR5vHNWBF0khhIZnrI/Zd
 tK0xR2UMw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44096)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1liatI-0002KM-FV; Mon, 17 May 2021 11:54:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1liatE-0006st-Fw; Mon, 17 May 2021 11:54:24 +0100
Date: Mon, 17 May 2021 11:54:24 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Message-ID: <20210517105424.GP12395@shell.armlinux.org.uk>
References: <20210517094332.24976-1-michael.wei.hong.sit@intel.com>
 <20210517094332.24976-3-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210517094332.24976-3-michael.wei.hong.sit@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jose.Abreu@synopsys.com, andrew@lunn.ch, vee.khee.wong@linux.intel.com,
 linux-kernel@vger.kernel.org, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, tee.min.tan@intel.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, boon.leong.ong@intel.com, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: Add callbacks
 for DWC xpcs Energy Efficient Ethernet
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

On Mon, May 17, 2021 at 05:43:32PM +0800, Michael Sit Wei Hong wrote:
> Link xpcs callback functions for MAC to configure the xpcs EEE feature.
> 
> The clk_eee frequency is used to calculate the MULT_FACT_100NS. This is
> to adjust the clock tic closer to 100ns.
> 
> Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>

What is the initial state of the EEE configuration before the first
call to stmmac_ethtool_op_set_eee()? Does it reflect the default EEE
settings?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
