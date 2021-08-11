Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D053E9393
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Aug 2021 16:21:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 570A9C5A4CD;
	Wed, 11 Aug 2021 14:21:31 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEA9CC5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Aug 2021 14:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=hKc2VUZOlUn7+9qhTayubrmJeEFnKYw+IpcOlyGgPPk=; b=PbyC/yxQGYgnOdQZDAa0h8cp6m
 Qlzmv+ahlLg98NOGhtKsPTjc5n4pywyf0RD2mgvwWFJpCpJOwSLsu/y58jWtQNZO5bTSbHSy3cQS3
 4PsgXxyKHPz9IbUkdqdRUBChsNzWnr6T2OhDC2hLQDR7n57+YaDf/GW9w/bBFFq6NEbY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1mDp6G-00H7vb-PU; Wed, 11 Aug 2021 16:20:56 +0200
Date: Wed, 11 Aug 2021 16:20:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <YRPcyHTc2FJeEoqk@lunn.ch>
References: <20210809102229.933748-1-vee.khee.wong@linux.intel.com>
 <20210809102229.933748-2-vee.khee.wong@linux.intel.com>
 <YREvDRkiuScyN8Ws@lunn.ch> <20210810235529.GB30818@linux.intel.com>
 <f2a1f135-b77a-403d-5d2e-c497efc99df7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f2a1f135-b77a-403d-5d2e-c497efc99df7@gmail.com>
Cc: Wong Vee Khee <vee.khee.wong@linux.intel.com>, linux-kernel@vger.kernel.org,
 Voon Weifeng <weifeng.voon@intel.com>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: pcs: xpcs: enable skip
	xPCS soft reset
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

> > BIOS does configured the SerDes. The problem here is that all the
> > configurations done by BIOS are being reset at xpcs_create().
> > 
> > We would want user of the pcs-xpcs module (stmmac, sja1105) to have
> > control whether or not we need to perform to the soft reset in the
> > xpcs_create() call.
> 
> I understood Andrew's response as suggesting to introduce the ability for
> xpcs_create() to make a BIOS call which would configure the SerDes after
> xpcs_soft_reset().

Yes. Exactly. That is what ACPI is for, so we should use it for this.

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
