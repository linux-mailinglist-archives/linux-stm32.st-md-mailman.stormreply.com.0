Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D37277FBF4B
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Nov 2023 17:37:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84E14C6B46B;
	Tue, 28 Nov 2023 16:37:48 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75C58C6B469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Nov 2023 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=rFUp8aL5AaK6GjDSBIX/cd7crb+WCO19wYlvW6clkBE=; b=ohfKZwKNKJ4S2OyweVT6DzxqDw
 J8E8HPPRFTOGE+wwx7vHBjhIlLoEmeGXtfXhSGW5YiDO8+mjVG5ix3NBrEGxbJ4v9otJy3095sWPU
 JFPFcfvjO9VqMaJeh3fyJPw4EVBtxnfoa/fovwnz1+uwH5aZruCTruSH5NdAbfl1oG2A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1r815W-001TUQ-TO; Tue, 28 Nov 2023 17:37:30 +0100
Date: Tue, 28 Nov 2023 17:37:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <50d318fd-a82c-4756-a349-682b867c0b8b@lunn.ch>
References: <20231128094538.228039-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128094538.228039-1-maxime.chevallier@bootlin.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Simon Horman <horms@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, alexis.lothore@bootlin.com,
 thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac-socfpga: Don't
 access SGMII adapter when not available
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

On Tue, Nov 28, 2023 at 10:45:37AM +0100, Maxime Chevallier wrote:
> The SGMII adapter isn't present on all dwmac-socfpga implementations.
> Make sure we don't try to configure it if we don't have this adapter.

If it does not exist, why even try to call socfpga_sgmii_config()?

It seems like this test needs moving up the call stack. socfpga_gen5_set_phy_mode():

	if (phymode == PHY_INTERFACE_MODE_SGMII)
		if (dwmac->sgmii_adapter_base)
			socfpga_sgmii_config(dwmac, true);
		else
			return -EINVAL;
			
Same in socfpga_gen10_set_phy_mode()?

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
