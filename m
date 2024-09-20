Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D580297D9B0
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Sep 2024 20:59:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 604B2C6C855;
	Fri, 20 Sep 2024 18:59:33 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5033AC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Sep 2024 18:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=aq3hCAqKsqk4dMRfVd5WIszunX0ClwtWKv8KPQdJx30=; b=edG+lfwzgYaBb2yEM992evL1tr
 Wdk1FraHVV6RM+/McKATu7lVruBDrXhDGkg5dzShuC85MDM3moW+gljXi8Cz9ggXTmqM8ANIDIpQF
 On2LkcfkWtMaeazkF23S1loKBPNa2dZY1sHVZa1ThGO4UD+PArpLZKgYNeJkQuhAcduY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sriqE-007wdS-2z; Fri, 20 Sep 2024 20:58:54 +0200
Date: Fri, 20 Sep 2024 20:58:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <e2ca8af5-dfca-4d3e-998c-b90d302ea61b@lunn.ch>
References: <20240918193452.417115-1-shenwei.wang@nxp.com>
 <2ca9a20c-59a9-4b95-bfe1-5729e2361d70@lunn.ch>
 <PAXPR04MB91856DCDAB12C39631542E33896C2@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PAXPR04MB91856DCDAB12C39631542E33896C2@PAXPR04MB9185.eurprd04.prod.outlook.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Chuah Kim Tatt <kim.tatt.chuah@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, dl-linux-imx <linux-imx@nxp.com>,
 "horms@kernel.org" <horms@kernel.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 net] net: stmmac: dwmac4: extend
 timeout for VLAN Tag register busy bit check
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

> > Could there be other registers which suffer from the same problem?
> > 
> 
> So far I think it only impact the VLAN status register because those bits are driven by another clock instead of CSR clock.
> Based on current observations, it appears that this issue primarily affects the VLAN status register. The reason for this 
> is that the bits in the VLAN status register are driven by a clock source distinct from the CSR clock.

Thanks for the explanation.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
