Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08522835682
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Jan 2024 16:51:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 982ECC6B457;
	Sun, 21 Jan 2024 15:51:31 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9CC1C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Jan 2024 15:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=oQG4nHZXopQxzqSol4cwnGcgn3VgAtdNUYmrjVuxWfE=; b=gFfv8cCnZ6CMIr6F5ugXpN8Clw
 zx9Qh7kD7jkeJFfdlJu0flHDEqrqHw661qdrZdDEK8QVSgfledgmDer/kSHHQWJ6Wb8T64SWFje4+
 hPvZMBJX69a1i+oMghbrSt8Rgnscl9OrTbOkttD81MvVx4ia4cErLy60BqIFWF316Ats=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rRa6Q-005exL-RX; Sun, 21 Jan 2024 16:51:18 +0100
Date: Sun, 21 Jan 2024 16:51:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ziyang Huang <hzyitc@outlook.com>
Message-ID: <830a2717-c7f5-4bec-83b2-be14ba59337d@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Cc: mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH 0/8] ipq5018: enable ethernet support
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

On Sun, Jan 21, 2024 at 08:40:39PM +0800, Ziyang Huang wrote:
> Enable ethernet support for IPQ5018.
> 
> Praveenkumar I (1):
>   clk: qcom: support for duplicate freq in RCG2 freq table
> 
> Ziyang Huang (7):
>   net: phy: Introduce Qualcomm IPQ5018 internal PHY driver
>   phy: Introduce Qualcomm ethernet uniphy driver
>   net: stmmac: Introduce Qualcomm IPQ50xx DWMAC driver
>   clk: qcom: gcc-ipq5018: correct gcc_gmac0_sys_clk reg
>   net: mdio: ipq4019: support reset control
>   arm64: dts: qcom: ipq5018: enable ethernet support
>   arm64: dts: qcom: ipq5018-rdp432-c2: enable ethernet support

Hi Ziyang

You failed to Cc: a number of Maintainers here. e.g for the PHY and
MDIO patches i would of expected the PHY and maintainers to be Cc:ed.

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
