Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6288A8CE920
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2024 19:17:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FD6DC6DD6D;
	Fri, 24 May 2024 17:17:19 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D4CFC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2024 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jDJOw7qJRLZUYuFrG/b6JHqnGqkFYvG+B4foAsiNrJo=; b=F6jCRNkAeaJkq2NUhcMJI0Mmka
 6ymkvq7KaMgUxlqdMrPHvCgwQbuX3qBAHgfuC2ScVX2mkemN945BudExvuVVhWuWdrIxmpLaMiqXe
 oWuaXmAv2dsyv1Q08+qM0lyDDBSk34O6uwYbPfm5Sf0SRwowLqFP0uEwk34BBijCMyt2CO+Uk0law
 URCdsGGRpB7gnCgw1NMiaIpVlfI2dVUwVjOG/FD8u0sUPeBzlkTA1Jvt+wl/YroFxasYFpTYMbdkI
 DiZFTx1bl/USay0EF3xZsGBEVxmNH6bEXsusW5f6lG1nFHoMp3Nawb5g8XHzPg4PWqNT+Lofr42BU
 HQEUA2fQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46940)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1sAYXK-0005kG-2h;
 Fri, 24 May 2024 18:16:58 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1sAYXL-00087f-7V; Fri, 24 May 2024 18:16:59 +0100
Date: Fri, 24 May 2024 18:16:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ZlDLixcieBBoWc1y@shell.armlinux.org.uk>
References: <20240524130653.30666-1-quic_snehshah@quicinc.com>
 <20240524130653.30666-3-quic_snehshah@quicinc.com>
 <a7317809-77a1-4884-83d8-2271ceea2c81@lunn.ch>
 <ZlDKrS0EhHgQPHAo@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZlDKrS0EhHgQPHAo@shell.armlinux.org.uk>
Cc: Sneh Shah <quic_snehshah@quicinc.com>, kernel@quicinc.com,
 linux-kernel@vger.kernel.org, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac:
 dwmac-qcom-ethqos: Enable support for 2500BASEX
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

On Fri, May 24, 2024 at 06:13:17PM +0100, Russell King (Oracle) wrote:
> Note that this checks for !STMMAC_FLAG_HAS_INTEGRATED_PCS, so this isn't
> going to be used by this code which is conditional on this flag being
> set.
> 
> In any case, I posted a patch set 12 days ago, which has remained

Oops, forgot the link to the patch series:

https://lore.kernel.org/r/ZkDuJAx7atDXjf5m@shell.armlinux.org.uk

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
