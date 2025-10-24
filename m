Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C77C061CF
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 13:55:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C269C5F1CF;
	Fri, 24 Oct 2025 11:55:08 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEBD5C5F1CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 11:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=O7sz382GaRqq3wu0Mxvr8plc3nTGBMiwWUf7iSRaaA0=; b=tyrwNe5q8BXOnmVhVyoJPU6tQa
 vX8n8bXOqehCN8Yj0LthHBHK5/4Ux+zbp+/mkEsEkWlnkfR/W7fKiwJE11xTZEXRAafM7ySZ3mx5U
 f77+iNjvI/DYM/OqBaGn2T1eN5UA+PY/fjlc1Osko0XUZPVE+GPUSXOdA5Zl1uFF38Oo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1vCGNj-00BzU4-0u; Fri, 24 Oct 2025 13:54:55 +0200
Date: Fri, 24 Oct 2025 13:54:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <915a9b64-1d75-4f32-a3f5-17f88fb2fbd7@lunn.ch>
References: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
 <E1vBrlB-0000000BMPs-1eS9@rmk-PC.armlinux.org.uk>
 <81d5c1f2-e912-40de-a870-290b0cf054b3@lunn.ch>
 <aPteqZ57fWULRfNy@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aPteqZ57fWULRfNy@shell.armlinux.org.uk>
Cc: netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 2/8] net: stmmac: simplify
	stmmac_get_version()
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

> Hi Andrew,
> 
> It seems I had a typo "verison" which should've been "version" in this
> patch, which carried through patches 3 and 4. Are you happy for me to
> retain your r-b with this typo fixed please?

Sure.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
