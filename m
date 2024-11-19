Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4209D1CCE
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 01:50:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4532AC78F8D;
	Tue, 19 Nov 2024 00:50:42 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EE4FC78F8C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 00:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=/zdxN2vOlsEF33q9U+oiEdloUgcORSZgWWNMJG2WpeU=; b=gdJAWpZktRAlIE8dOIH3n2I7AI
 Hb84rSn0XKZd3SBkyAz4px0n7Ue0Z6EvSKneVjlhDoHp5BiQTiyJIpNk18dfGtwFKxHDBjkpPDQuG
 tW0kuUzTUGD02z+HiUBGReDEioYavOGrcsrVmOE2wGImuWefDqqAiZhsPG0vfGWj36MY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tDCRe-00Diud-Hx; Tue, 19 Nov 2024 01:50:18 +0100
Date: Tue, 19 Nov 2024 01:50:18 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Parker Newman <parker@finest.io>
Message-ID: <984a8471-7e49-4549-9d8a-48e1a29950f6@lunn.ch>
References: <cover.1731685185.git.pnewman@connecttech.com>
 <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
 <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
 <20241115135940.5f898781.parker@finest.io>
 <bb52bdc1-df2e-493d-a58f-df3143715150@lunn.ch>
 <20241118084400.35f4697a.parker@finest.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241118084400.35f4697a.parker@finest.io>
Cc: Parker Newman <pnewman@connecttech.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jonathan Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read
 iommu stream id from device tree
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

> This is not a new dt property, the "iommus" property is an existing property
> that is parsed by the Nvidia implementation of the arm-smmu driver.
> 
> Here is a snippet from the device tree:
> 
> smmu_niso0: iommu@12000000 {
>         compatible = "nvidia,tegra234-smmu", "nvidia,smmu-500";
> ...
> }
> 
> /* MGBE0 */
> ethernet@6800000 {
> 	compatible = "nvidia,tegra234-mgbe";
> ...
> 	iommus = <&smmu_niso0 TEGRA234_SID_MGBE>;
> ...
> }
> 
> /* MGBE1 */
> ethernet@6900000 {
> 	compatible = "nvidia,tegra234-mgbe";
> ...
> 	iommus = <&smmu_niso0 TEGRA234_SID_MGBE_VF1>;
> ...
> }

What i was meaning does the nvidia,tegra234-mgbe binding allow iommus?
I just checked, yes it does.

> If the iommus property is missing completely from the MGBE's device tree node it
> causes secure read/write errors which spam the kernel log and can cause crashes.
> 
> I can add the fallback in V2 with a warning if that is preferred.

The fact it crashed makes me think it is optional. Any existing users
must work, otherwise it would crash, and then be debugged. I guess you
are pushing the usage further, and so have come across this condition.

Is the iommus a SoC property, or a board property? If it is a SoC
property, could you review all the SoC .dtsi files and fix up any
which are missing the property?

Adding a warning is O.K, but ideally the missing property should be
added first.

The merge window is open now, so patches will need to wait two weeks.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
