Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E31479DBC7
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Sep 2023 00:21:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED46DC6B475;
	Tue, 12 Sep 2023 22:21:17 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5E1EC6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 22:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J0yxfTWymB169xV/I/6SashaKoLIMch1mt00vHpWz7I=; b=G5AEZG1C4dGZYDR9EdV0zvXIEO
 OjzevHR9Nsj07ek/oNgYe2EMcfsXQcfjUGlcJziU4VgFtaPpXzsrPVKr9Ssz5K2dIawaqwrPFAMET
 ISMii6Cr7jc1duPf51ciyzTHGYFWmhOVEXrXfPvQar6L8rdcAqVRAI6lM9UkLoaIvO+1hJWrmu/FQ
 uHsHONrGPRatPXwRUqm33YTBWiJDS17ehqihLqqLE7crTKO1/nWcouR6lNPKsWxZnRPTqVxMcgRIm
 AUPgu3vOiXts2VEEqAyVTJgnadzL635iW+7M4R7cZUhDFFtmw7cFYYqiAXbaxP0W/QSBBO4LsjXSx
 pxU0de+g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53678)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qgBkh-0001hY-0c;
 Tue, 12 Sep 2023 23:20:59 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qgBkd-00035r-8O; Tue, 12 Sep 2023 23:20:55 +0100
Date: Tue, 12 Sep 2023 23:20:55 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <horms@kernel.org>
Message-ID: <ZQDkR/YX2HPMKiF5@shell.armlinux.org.uk>
References: <ZP8yEFWn0Ml3ALWq@shell.armlinux.org.uk>
 <E1qfiqd-007TPL-7K@rmk-PC.armlinux.org.uk>
 <20230912145227.GE401982@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230912145227.GE401982@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Samin Guo <samin.guo@starfivetech.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alexei Starovoitov <ast@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, bpf@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 1/6] net: stmmac: add platform
	library
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

On Tue, Sep 12, 2023 at 04:52:27PM +0200, Simon Horman wrote:
> On Mon, Sep 11, 2023 at 04:29:11PM +0100, Russell King (Oracle) wrote:
> > +	default:
> > +		return -ENOTSUPP;
> 
> Checkpatch seems to think that EOPNOTSUPP would be more appropriate
> as "ENOTSUPP is not a SUSV4 error code".

It needs to be an error code that clk_set_rate() below isn't going to
return - because if clk_set_rate() does return it, then the users are
going to end up issuing an incorrect error message to the user. I
suspect clk_set_rate() could quite legitimately return -EOPNOTSUPP
or -EINVAL.

Sadly, the CCF implementation of clk_set_rate() doesn't detail what
errors it could return, but it looks like -EBUSY, -EINVAL, or something
from pm_runtime_resume_and_get().

Interestingly, while looking at this, pm_runtime_resume_and_get() can
return '1' if e.g. rpm is disabled and the device is active. It looks
to me like CCF treats that as an error in multiple locations.

> > +	}
> > +
> > +	return clk_set_rate(tx_clk, rate);
> > +}
> > +EXPORT_SYMBOL_GPL(dwmac_set_tx_clk_gmii);

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
