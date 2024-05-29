Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9F28D3F6D
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2024 22:14:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8401C6C855;
	Wed, 29 May 2024 20:14:02 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51777C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 20:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eQFXKnSfwk440wscnRX9cECtvXQvJsH6al9gvAq5Rss=; b=qYza4Rbd8T0Qi9wO8nvW/LXuGl
 fDAszPm46VwyPttxInXsRB84FuTKZ9Iu+Oyhhedj3Q6B4bpxl6YVwP7egkoUC5DKplO6DK9Emvs88
 6CpNDvmyIv5mxDI5yfXOaxA1hA8JlC+QYtHNu4QRNIbVKTfrJNaAc1UjvJbUrCoVHcZUDngkKGqWh
 L19sqtn8cWjJOEmUWL/g2S854UIvlXsPGWaZOFrKc0sKNeoMURyrPTf7rhDG2I6pwy7jNvK4no9NR
 KEUo+RhIg3QkVYdFxUGSwogACot3hB2ijFK9CgE4014SnI23PFmVgPqcMYH/v2CTfRQz7IezsSE82
 eIUJgdgA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51848)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sCPg4-0006ct-13;
 Wed, 29 May 2024 21:13:40 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sCPg4-0004UO-PS; Wed, 29 May 2024 21:13:40 +0100
Date: Wed, 29 May 2024 21:13:40 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ZleMdFsmQzXGp1GM@shell.armlinux.org.uk>
References: <20231218071118.21879-1-quic_snehshah@quicinc.com>
 <4zbf5fmijxnajk7kygcjrcusf6tdnuzsqqboh23nr6f3rb3c4g@qkfofhq7jmv6>
 <8b80ab09-8444-4c3d-83b0-c7dbf5e58658@quicinc.com>
 <wvzhz4fmtheculsiag4t2pn2kaggyle2mzhvawbs4m5isvqjto@lmaonvq3c3e7>
 <8f94489d-5f0e-4166-a14e-4959098a5c80@quicinc.com>
 <ZlNi11AsdDpKM6AM@shell.armlinux.org.uk>
 <d246bd64-18b3-4002-bc71-eccd67bbd61f@quicinc.com>
 <67553944-5d3f-4641-a719-da84554c0a9f@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <67553944-5d3f-4641-a719-da84554c0a9f@lunn.ch>
Cc: Sneh Shah <quic_snehshah@quicinc.com>, kernel@quicinc.com,
 linux-kernel@vger.kernel.org, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac-qcom-ethqos:
 Add support for 2.5G SGMII
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

On Wed, May 29, 2024 at 04:28:16PM +0200, Andrew Lunn wrote:
> > Qualcomm ethernet HW supports 2.5G speed in overclocked SGMII mode.
> > we internally term it as OCSGMII.
> 
> So it still does SGMII inband signalling? Not 2500BaseX signalling? It
> is not actually compatible with 2500BaseX?
> 
> > End goal of these patches is to enable SGMII with 2.5G speed support.
> > The patch in these series enabled up SGMII with 2.5 for cases where we
> > don't have external phy. ( mac-to-mac connectivity)
> 
> So the other end needs to be an over clocked SGMII MAC, not 2500BaseX?
> 
> > The new patch posted extends this for the case when the MAC has an
> > external phy connected. ( hence we are advertising fr 2.5G speed by adding
> > 2500BASEX as supported interface in phylink)
> 
> And i assume it does not actually work against a true 2500BaseX
> device, because it is doing SGMII inband signalling?

I really hope the hardware isn't using any SGMII inband signalling
at 2.5G speeds. Other devices explicitly state that SGMII inband
signalling while operating the elevated 2.5G speed is *not* supported!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
