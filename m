Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 798DA6230D9
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Nov 2022 17:59:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 239A2C6504E;
	Wed,  9 Nov 2022 16:59:37 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6CCE5C5F1ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Nov 2022 16:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=JyqzWiwPZfcvvZni8B+6LuoQxAl6mxqRVFKIRB4evYw=; b=XCZfr5gYSakAuB33bcK/AaWnAP
 ilf0qpLSv5aDrz4rmJidxHx30jKKdet5IiSHM1oBn9B2vhmedbVo4D1LR3VSmfX42Wd41hx5y2HxF
 xZfo++vNAJZZ8jKJFZq1xUfq2CsJlO1Umqy1OUPbhKtPExq+s2865l9sGgwwwITP4p1Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1osoPh-001vqB-6F; Wed, 09 Nov 2022 17:58:57 +0100
Date: Wed, 9 Nov 2022 17:58:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@linux.intel.com>
Message-ID: <Y2vcUWFTdWG0D2GI@lunn.ch>
References: <20221109024329.15805-1-noor.azura.ahmad.tarmizi@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221109024329.15805-1-noor.azura.ahmad.tarmizi@linux.intel.com>
Cc: Muhammad Husaini Zulkifli <muhammad.husaini.zulkifli@intel.com>,
 linux-kernel@vger.kernel.org, Voon Weifeng <weifeng.voon@intel.com>,
 netdev@vger.kernel.org, Tan Tee Min <tee.min.tan@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: add check for
 supported link mode before mode change
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

On Wed, Nov 09, 2022 at 10:43:29AM +0800, Noor Azura Ahmad Tarmizi wrote:
> From: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
> 
> Currently, change for unsupported speed and duplex are sent to the phy,
> rendering the link to unknown speed (link state down).

Something does not seem correct. See:

https://elixir.bootlin.com/linux/v6.1-rc4/source/drivers/net/phy/phy.c#L816

	/* We make sure that we don't pass unsupported values in to the PHY */
	linkmode_and(advertising, advertising, phydev->supported);

Do you somehow have phydev->supported set wrong?

   Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
