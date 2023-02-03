Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF813688EEF
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Feb 2023 06:24:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 835E5C6904E;
	Fri,  3 Feb 2023 05:24:43 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A6C2C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Feb 2023 05:24:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E67A7B80966;
 Fri,  3 Feb 2023 05:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7FFBC433D2;
 Fri,  3 Feb 2023 05:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675401880;
 bh=xXuXX/4dXghFD9OuRNy9yclf9Tgd8hQw+zZIPTdTdxw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LC+H23DawUteZ0zmGUmwaUJnUbqf3sFlyJ5fMm0dk8HlAkBLCoTfWdVZtU05gVIap
 Pac6w7xDvg1WAOIkV/49ZpMPuPRuPrONuoiih+ssj/icnHk389ctRC+b55L7ANZUwB
 qVmgNllrdRkNG88gfxSHbvMTnpkiUAJm01muRHzj3ic4HY8T/iOMUpVG/VcEymedrJ
 8B03pgYind9b86TfY9dxX9vK6EsdDIsH15bTSenOGTBT7CXXKnh5ExtAIYNeViYu/E
 sU5BWMaTTbOb0O9mbAg/l2s5i8iIBy3okWR+8JKr+q2+Hzwkurf7u4duMtgPkp6GA9
 odai2NZ4RDX/g==
Date: Thu, 2 Feb 2023 21:24:38 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Clark Wang <xiaoning.wang@nxp.com>
Message-ID: <20230202212438.18ebcc38@kernel.org>
In-Reply-To: <20230202081559.3553637-1-xiaoning.wang@nxp.com>
References: <20230202081559.3553637-1-xiaoning.wang@nxp.com>
MIME-Version: 1.0
Cc: andrew@lunn.ch, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 edumazet@google.com, joabreu@synopsys.com, linux-imx@nxp.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH V3 1/2] net: phylink: add a function to
 resume phy alone to fix resume issue with WoL enabled
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

On Thu,  2 Feb 2023 16:15:59 +0800 Clark Wang wrote:
> Issue we met:
> On some platforms, mac cannot work after resumed from the suspend with WoL
> enabled.
> 
> The cause of the issue:
> 1. phylink_resolve() is in a workqueue which will not be executed immediately.
>    This is the call sequence:
>        phylink_resolve()->phylink_link_up()->pl->mac_ops->mac_link_up()
>    For stmmac driver, mac_link_up() will set the correct speed/duplex...
>    values which are from link_state.
> 2. In stmmac_resume(), it will call stmmac_hw_setup() after called the
>    phylink_resume(), because mac need phy rx_clk to do the reset.
>    stmmac_core_init() is called in function stmmac_hw_setup(), which will
>    reset the mac and set the speed/duplex... to default value.
> Conclusion: Because phylink_resolve() cannot determine when it is called, it
>             cannot be guaranteed to be called after stmmac_core_init().
> 	    Once stmmac_core_init() is called after phylink_resolve(),
> 	    the mac will be misconfigured and cannot be used.
> 
> In order to avoid this problem, add a function called phylink_phy_resume()
> to resume phy separately. This eliminates the need to call phylink_resume()
> before stmmac_hw_setup().
> 
> Add another judgement before called phy_start() in phylink_start(). This way
> phy_start() will not be called multiple times when resumes. At the same time,
> it may not affect other drivers that do not use phylink_phy_resume().
> 
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>

Patch 2/2 never made it to the list. You'll need to repost.
While I have you - some minor nit picks:

> +/**
> + * phylink_phy_resume() - resume phy alone
> + * @pl: a pointer to a &struct phylink returned from phylink_create()
> + *
> + * In the MAC driver using phylink, if the MAC needs the clock of the phy

You use MAC in capital letters buy phy in lower case, be consistent.

> + * when it resumes, can call this function to resume the phy separately.

missing "it" ? Otherwise the sentence is missing a subject.

> + * Then proceed to MAC resume operations.
> + */
> +void phylink_phy_resume(struct phylink *pl)
> +{
> +	ASSERT_RTNL();
> +
> +	if (!test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)
> +	    && pl->phydev) {

&& goes at the end of the line, not start

> +		phy_start(pl->phydev);
> +		pl->mac_resume_phy_separately = true;
> +	}
> +
> +}
> +EXPORT_SYMBOL_GPL(phylink_phy_resume);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
