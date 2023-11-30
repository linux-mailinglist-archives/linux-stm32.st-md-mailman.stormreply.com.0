Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D687FF828
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Nov 2023 18:26:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1872CC6B475;
	Thu, 30 Nov 2023 17:26:22 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACDE5C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 17:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=8uE72B/ZbsCd2fU3mnrHk7yTs0g881UEt43C00CniGU=; b=tCGiikmXA1Toh2xAc4IbKCLf23
 UU8yrlZ7y2ehr8c63qU+z3aBbCS+vKCCKn5pG23ZCFb6gk/utmM3MD64mtt9c+xZNnuI+jbn0d62g
 i3cJVrgHAMFwgDhwJf6CGxi1i9/XjHsGsXyjIH50HhMJCNaxn0h4RKPWHaPDMyeVTFEk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1r8knl-001giW-Mj; Thu, 30 Nov 2023 18:26:13 +0100
Date: Thu, 30 Nov 2023 18:26:13 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Tomer Maimon <tmaimon77@gmail.com>
Message-ID: <25d0c091-3dce-4d62-a112-c82106809c65@lunn.ch>
References: <20231121151733.2015384-1-tmaimon77@gmail.com>
 <20231121151733.2015384-3-tmaimon77@gmail.com>
 <6aeb28f5-04c2-4723-9da2-d168025c307c@lunn.ch>
 <CAP6Zq1j0kyrg+uxkXH-HYqHz0Z4NwWRUGzprius=BPC9+WfKFQ@mail.gmail.com>
 <9ad42fef-b210-496a-aafc-eb2a7416c4df@lunn.ch>
 <CAP6Zq1jw9uLP_FQGR8=p3Y2NTP6XcNtzkJQ0dm3+xVNE1SpsVg@mail.gmail.com>
 <CAP6Zq1ijfMSPjk1vPwDM2B+r_vAH3DShhSu_jr8xJyUkTQY89w@mail.gmail.com>
 <a551aefa-777d-4fd3-b1a5-086dc3e62646@lunn.ch>
 <CAP6Zq1jVO5y3ySeGNE5-=XWV6Djay5MhGxXCZb9y91q=EA71Vg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP6Zq1jVO5y3ySeGNE5-=XWV6Djay5MhGxXCZb9y91q=EA71Vg@mail.gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjaminfair@google.com, davem@davemloft.net, avifishman70@gmail.com,
 venture@google.com, openbmc@lists.ozlabs.org, robh+dt@kernel.org,
 tali.perry1@gmail.com, mcoquelin.stm32@gmail.com, edumazet@google.com,
 joabreu@synopsys.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org,
 peppe.cavallaro@st.com, j.neuschaefer@gmx.net, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 2/2] net: stmmac: Add NPCM support
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

> I will check with the xpcs maintainer how can we add indirect access
> to the xpcs module.

https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c#L449

It creates a regmap for the memory range. On top of that it creates an
MDIO bus. You can then access the PCS in the normal way.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
