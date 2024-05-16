Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A228C761B
	for <lists+linux-stm32@lfdr.de>; Thu, 16 May 2024 14:23:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C568EC6C83A;
	Thu, 16 May 2024 12:23:15 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3AC6C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2024 12:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=17qpjYbzklDpeN+YSOUwARueA/UNvwjrGY4gKlNC5dE=; b=DufbBNmQt2ByDUKFL2nLJEOyCO
 EKpvCZHk2g5cL5wbPaYrf/2rZZTZgXORzFBLNLT6Wy2E6Yk0zVSaQdFvQhwRFunVK9ugicqHe/WQN
 p92zW0tIEAVVBiOSlA99e7ZNEJotdLU9Uk/WZT3v3Ax+B/UXcpxqzndaPTiRf/RoOvkA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1s7a8M-00FVje-Td; Thu, 16 May 2024 14:22:54 +0200
Date: Thu, 16 May 2024 14:22:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Message-ID: <4b17d7e4-c135-4d91-8565-9a8b2c6341d2@lunn.ch>
References: <20240426125707.585269-1-christophe.roullier@foss.st.com>
 <20240426125707.585269-11-christophe.roullier@foss.st.com>
 <43024130-dcd6-4175-b958-4401edfb5fd8@denx.de>
 <8bf3be27-3222-422d-bfff-ff67271981d8@foss.st.com>
 <9c1d80eb-03e7-4d39-b516-cbcae0d50e4a@denx.de>
 <5544e11b-25a8-4465-a7cc-f1e9b1d0f0cc@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5544e11b-25a8-4465-a7cc-f1e9b1d0f0cc@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Jose Abreu <joabreu@synopsys.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 10/11] ARM: dts: stm32: add ethernet1
 and ethernet2 for STM32MP135F-DK board
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

> > I suspect it might make sense to add this WoL part separately from the
> > actual ethernet DT nodes, so ethernet could land and the WoL
> > functionality can be added when it is ready ?
> 
> If at the end we want to have this Wol from PHY then I agree we need to
> wait. We could push a WoL from MAC for this node before optee driver patches
> merge but not sure it makes sens.

In general, it is better if the PHY does WoL, since the MAC can then
be powered down. MAC WoL should only be used when the PHY does not
support the requested WoL configuration, but the MAC can. And
sometimes you need to spread it over both the PHY and the MAC.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
