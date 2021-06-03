Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D484A39A1D7
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jun 2021 15:09:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E90DC57B69;
	Thu,  3 Jun 2021 13:09:11 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1A8AC57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jun 2021 13:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r7TIsj5V04l+D0UamQD44FQeHlZLEN6F8u/qHhY6riI=; b=yxDe0/P5D+/Atr8y4AhzMh0vw
 rcySwE2wWFoZtdo8Dzeo9LpdCqblSj4HIJ4PRZYMbeFG+aoQjs/9UnnF+jdZ6BQrVcAoftXQt4sLf
 BCAKSsOz7z7QN/xv/1kswt+2Eg/EJnKNYO+RAtxDw7AGIxEUCC0X6PV9W0jphZvH1iUBy7dF/wsNO
 V1e2KjgL6qj2Knj1hNq6EUdMw1gjI/3pZEDeaS3E3ADhCwlk5jaqC7F0ue9QmVRQkXShHI4wWvQjW
 s6Tzp40DuYVrPpfolHfSDio1DeaHeMLfzWJYwSjahV+hqx58zASAJR7zSa70/b3+9fovhhm/RjwKY
 8qLonrQxg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44672)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1lon5j-0002nA-6s; Thu, 03 Jun 2021 14:08:55 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1lon5f-00027a-7e; Thu, 03 Jun 2021 14:08:51 +0100
Date: Thu, 3 Jun 2021 14:08:51 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Message-ID: <20210603130851.GS30436@shell.armlinux.org.uk>
References: <20210603115032.2470-1-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210603115032.2470-1-michael.wei.hong.sit@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jose.Abreu@synopsys.com, andrew@lunn.ch, vee.khee.wong@linux.intel.com,
 linux-kernel@vger.kernel.org, weifeng.voon@intel.com, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, tee.min.tan@intel.com, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, boon.leong.ong@intel.com, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [RESEND PATCH net-next v4 0/3] Enable 2.5Gbps
	speed for stmmac
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

Hi,

On Thu, Jun 03, 2021 at 07:50:29PM +0800, Michael Sit Wei Hong wrote:
> Intel mGbE supports 2.5Gbps link speed by overclocking the clock rate
> by 2.5 times to support 2.5Gbps link speed. In this mode, the serdes/PHY
> operates at a serial baud rate of 3.125 Gbps and the PCS data path and
> GMII interface of the MAC operate at 312.5 MHz instead of 125 MHz.
> This is configured in the BIOS during boot up. The kernel driver is not able
> access to modify the clock rate for 1Gbps/2.5G mode on the fly. The way to
> determine the current 1G/2.5G mode is by reading a dedicated adhoc
> register through mdio bus.

How does this interact with Vladimir's "Convert xpcs to phylink_pcs_ops"
series? Is there an inter-dependency between these, or a preferred order
that they should be applied?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
