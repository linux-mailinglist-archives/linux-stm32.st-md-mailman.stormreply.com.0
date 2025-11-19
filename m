Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1792C70E57
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Nov 2025 20:51:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 698F7C36B30;
	Wed, 19 Nov 2025 19:51:55 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F4E1C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 19:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=Dg+ZfMlkkva2YqCScrw1/cbaetvEkaxgzLwIQZgnGh4=; b=F6pln4dJ+YqiJig6hY3QPemhNm
 tATG9SMWl+R1km6OTNq4RfvHlZtEwuQT9ulsgU0GvI49LLfrH3XtwI2O4tXKZ6HsT4/apTp3Hic6L
 HTEmW2NCTyFaoZHUley8+ZUMgcsLyTtHwyInPy532n1gMnU3NWGz9UldZ3vU8g91c3bI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1vLoDP-00EXnU-35; Wed, 19 Nov 2025 20:51:43 +0100
Date: Wed, 19 Nov 2025 20:51:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <c73c4683-6bc4-42e9-9f5b-9b5bcd2f0aa6@lunn.ch>
References: <20251119153526.13780-1-jszhang@kernel.org>
 <aR3snSb1YUFh9Dwp@shell.armlinux.org.uk> <aR3p4NBK-AnCGK6a@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aR3p4NBK-AnCGK6a@xhacker>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 resend] net: stmmac: add support for
	dwmac 5.20
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

On Thu, Nov 20, 2025 at 12:01:36AM +0800, Jisheng Zhang wrote:
> On Wed, Nov 19, 2025 at 04:13:17PM +0000, Russell King (Oracle) wrote:
> > On Wed, Nov 19, 2025 at 11:35:26PM +0800, Jisheng Zhang wrote:
> > > The dwmac 5.20 IP can be found on some synaptics SoCs. 
> > > 
> > > The binding doc has been already upstreamed by
> > > commit 13f9351180aa ("dt-bindings: net: snps,dwmac: Add dwmac-5.20
> > > version")
> > > 
> > > So we just need to add a compatibility flag in dwmac generic driver.
> > 
> > Do we _need_ to add it to the generic driver? Do the platforms that are
> > using this really not need any additional code to support them?
> > 
> > Looking at all the DT that mention dwmac-5.20 in their compatible
> > strings, that is always after other compatibles that point to other
> > platform specific drivers.
> > 
> > So, can you point to a platform that doesn't have its own platform
> > glue, and would be functional when using the dwmac-generic driver?
> 
> Synatpics platforms use the dwmac-generic driver, it's enough now.
> But we haven't upstreamed related platforms, but will do soon.

Please make this patch part of the patchset when you upstream the
platforms. We prefer to only add things which have users.

    Andrew

---
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
