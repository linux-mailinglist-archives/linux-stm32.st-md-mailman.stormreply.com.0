Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA876BDB28
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 22:56:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27A8DC69053;
	Thu, 16 Mar 2023 21:56:27 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18C8FC6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 21:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LzJVT1YLVSxCwyYJDFQ7AijDbKEfkNXaVr/FyexpV4g=; b=ZPnkfwVee81qlCfWipMdH+IPb9
 Z851th9zA8IaRyynxVNRckhSEGJUp+5eoxxJwuTejp3zvJDBPglDUhkG/K+YJZNW2CrVQkBPMiRGK
 YeqQT6lSq92JCLyJgNI3DDa0g6zrnbCXQZg5gDA9Rdd5UKyZTcY+IsRd1AUGdAheV5YZFT8VwHMcA
 XDuu83i1XUCYctPW+ikU8WJuxBQkpebYTZwFwiMkvdf6iePrVGG5S0dcIp7KuDEcy1n/i0H/cNalf
 dcyl7V89zs2B0Wgz52bjCfwqAIV74xwPeMjUniqOKxjoU5Lcn3o5EGKZgDRKM13vV4v1TNInze0sq
 rIcKFnlQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59080)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1pcva2-0001Lk-Du; Thu, 16 Mar 2023 21:56:14 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1pcvZx-0002mv-Fu; Thu, 16 Mar 2023 21:56:09 +0000
Date: Thu, 16 Mar 2023 21:56:09 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <ZBOQecR6q5Xgr75F@shell.armlinux.org.uk>
References: <20230316205449.1659395-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230316205449.1659395-1-shenwei.wang@nxp.com>
X-Topics: 
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/1] net: stmmac: start PHY early in
	__stmmac_open
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

On Thu, Mar 16, 2023 at 03:54:49PM -0500, Shenwei Wang wrote:
> By initializing the PHY and establishing the link before setting the
> MAC relating configurations, this change ensures that the PHY is
> operational before the MAC logic starts relying on it. This can
> prevent synchronization errors and improve system stability.
> 
> This change especially applies to the RMII mode, where the PHY may drive
> the REF_CLK signal, which requires the PHY to be started and operational
> before the MAC logic initializes.
> 
> This change should not impact other modes of operation.

NAK. A patch similar to this has already been sent.

The problem with just moving this is that phylink can call the
mac_link_up() method *before* phylink_start() has returned - and as
this driver has not completed the setup, it doesn't expect the link
to come up at that point.

There are several issues with this driver wanting the PHY clock early,
and there have been two people working on addressing this previously,
proposing two different changes to phylink.

I sent them away to talk to each other and come back with a unified
solution. Shock horror, they never came back.

Now we seem to be starting again from the beginning.

stmmac folk really need to get a handle on this so reviewers are not
having to NAK similar patches time and time again, resulting in the
problem not being solved.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
