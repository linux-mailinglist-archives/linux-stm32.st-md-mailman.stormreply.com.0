Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EB5B53036
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 13:24:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8898DC349C1;
	Thu, 11 Sep 2025 11:24:51 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE5B0C36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 11:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/iiP702baNdF+7Fw90ZvkFyuCYDheIf65+pVTaTUlsA=; b=QTOeBr6pyNDGlNdDVNt7lCTzyh
 g1dav/hh6qKd22BJ+t2SEZIRquQFlpQViYzZYbhqTZQjhJ3+JI0lthowRf1yqGnFOvyiPCJeEE9s2
 NUrHAOlWBpujYTAb/HWL2D3xz36aozHDGZfh/uP9zT762yC3XDknQ0YrHirjhDR7PSYf+RxxCaDnv
 /XzTZbZrJVC0zzH3A3gcqSeq+/9gI+a4kUxuKyM8iGC5jf0JOCBsH/bTEzQ7zVutN3XsNOc/kIjx7
 rhdSJHA9JD61AmSzXHFZ30OSNpnWUNpBaYTP18egfpoSLwblCRrWKOnUK4dg7doidyHyKrnz+dPah
 KiOedZQg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41542)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1uwfPr-000000002xD-2SXY;
 Thu, 11 Sep 2025 12:24:39 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1uwfPn-000000002JV-3y45; Thu, 11 Sep 2025 12:24:35 +0100
Date: Thu, 11 Sep 2025 12:24:35 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: rohan.g.thomas@altera.com
Message-ID: <aMKxc6AuEiWplhcV@shell.armlinux.org.uk>
References: <20250911-qbv-fixes-v1-0-e81e9597cf1f@altera.com>
 <20250911-qbv-fixes-v1-1-e81e9597cf1f@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250911-qbv-fixes-v1-1-e81e9597cf1f@altera.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Rohan G Thomas <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/2] net: stmmac: est: Fix GCL bounds
	checks
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

On Thu, Sep 11, 2025 at 04:22:59PM +0800, Rohan G Thomas via B4 Relay wrote:
> @@ -1012,7 +1012,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  		s64 delta_ns = qopt->entries[i].interval;
>  		u32 gates = qopt->entries[i].gate_mask;
>  
> -		if (delta_ns > GENMASK(wid, 0))
> +		if (delta_ns >= BIT(wid))

While I agree this makes it look better, you don't change the version
below, which makes the code inconsistent. I also don't see anything
wrong with the original comparison.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
