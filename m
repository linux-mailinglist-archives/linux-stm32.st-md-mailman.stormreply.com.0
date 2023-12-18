Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C168177BA
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Dec 2023 17:42:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEB1CC6DD70;
	Mon, 18 Dec 2023 16:42:00 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC0F5C6DD6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Dec 2023 16:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=050EqGmVCVUNmEMi4n09ihXv28lZpEFwZCiQLfcsttA=; b=qme3P9fJPXSo+DXDdDUMS5iZsK
 nqWHie2/Fpb1X00Bf+9009jmjkLFAWlXCt5v0QRUzCUXE9B4aK8yFdYTKvGsX9DsxLoEpcuaW7ctl
 +KqYMVh98MsgNopKqzPaC8CXC62GMhewOZJsCPK22m3CSB3nD+YBp5ihEV8uqaR6QMQo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rFGgS-003GXN-7B; Mon, 18 Dec 2023 17:41:36 +0100
Date: Mon, 18 Dec 2023 17:41:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <f4166144-4874-4b10-96f8-fc3e03f94904@lunn.ch>
References: <20231218162326.173127-1-romain.gantois@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231218162326.173127-1-romain.gantois@bootlin.com>
Cc: Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 0/1] Prevent DSA tags from breaking COE
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

On Mon, Dec 18, 2023 at 05:23:22PM +0100, Romain Gantois wrote:
> Hello everyone,
> 
> This is a bugfix for an issue that was recently brought up in two
> reports:
> 
> https://lore.kernel.org/netdev/c57283ed-6b9b-b0e6-ee12-5655c1c54495@bootlin.com/
> https://lore.kernel.org/netdev/e5c6c75f-2dfa-4e50-a1fb-6bf4cdb617c2@electromag.com.au/
> 
> The Checksum Offloading Engine of some stmmac cores (e.g. DWMAC1000)
> computes an incorrect checksum when presented with DSA-tagged packets. This
> causes all TCP/UDP transfers to break when the stmmac device is connected
> to the CPU port of a DSA switch.

Probably a dumb question.... Does this COE also perform checksum
validation on receive? Is it also getting confused by the DSA header?

You must of tested receive, so it works somehow, but i just wounder if
something needs to be done to be on the safe side?

	  Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
