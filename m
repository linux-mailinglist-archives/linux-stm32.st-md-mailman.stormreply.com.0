Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E05DA9D2EAA
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 20:18:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C259C78F9B;
	Tue, 19 Nov 2024 19:18:23 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19E40C78F9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 19:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=2X4+40w6EI+JnEcsSnqxwoW536xienx35hbqOEEbSFU=; b=NhQRvIb4fNLj4T14/RjuJxrS8k
 LpRulsEWgF3DuGI8R/XphFLccOJK1Rhpde/15j3e1vabb4f3UFcMVJxpxWstW0HaWSGcRQqEE4jn9
 XKGzlquHd6CzJvI9bO2L/hpOTdDj2hj6Mpc4MBxdDg2gHocUKqliC/PlSe8LoteBJTMA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tDTjc-00Ds82-9R; Tue, 19 Nov 2024 20:18:00 +0100
Date: Tue, 19 Nov 2024 20:18:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Parker Newman <parker@finest.io>
Message-ID: <f00bccd3-62d5-46a9-b448-051894267c7a@lunn.ch>
References: <cover.1731685185.git.pnewman@connecttech.com>
 <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
 <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
 <20241115135940.5f898781.parker@finest.io>
 <bb52bdc1-df2e-493d-a58f-df3143715150@lunn.ch>
 <20241118084400.35f4697a.parker@finest.io>
 <984a8471-7e49-4549-9d8a-48e1a29950f6@lunn.ch>
 <20241119131336.371af397.parker@finest.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241119131336.371af397.parker@finest.io>
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

> I think there is some confusion here. I will try to summarize:
> - Ihe iommu is supported by the Tegra SOC.
> - The way the mgbe driver is written the iommu DT property is REQUIRED.

If it is required, please also include a patch to
nvidia,tegra234-mgbe.yaml and make iommus required.

> - "iommus" is a SOC DT property and is defined in tegra234.dtsi.
> - The mgbe device tree nodes in tegra234.dtsi DO have the iommus property.
> - There are no device tree changes required to to make this patch work.
> - This patch works fine with existing device trees.
> 
> I will add the fallback however in case there is changes made to the iommu
> subsystem in the future.

I would suggest you make iommus a required property and run the tests
over the existing .dts files.

I looked at the history of tegra234.dtsi. The ethernet nodes were
added in:

610cdf3186bc604961bf04851e300deefd318038
Author: Thierry Reding <treding@nvidia.com>
Date:   Thu Jul 7 09:48:15 2022 +0200

    arm64: tegra: Add MGBE nodes on Tegra234

and the iommus property is present. So the requires is safe.

Please expand the commit message. It is clear from all the questions
and backwards and forwards, it does not provide enough details.

I just have one open issue. The code has been like this for over 2
years. Why has it only now started crashing?

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
