Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC887B9A29
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Oct 2023 05:09:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5CBDC6C832;
	Thu,  5 Oct 2023 03:09:53 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50667C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Oct 2023 03:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=POQt14miUY9FOD6uKlKlWtDFJK8h+2insygX+sUhCuM=; b=I3bUDcNvyhEtxetKZCLrB79lEj
 ZV9GKL34uhMhAuaP9oR1YyeRkedZAQIlvg/pH3OkTtkAcIqpcFWrncI3ndxoFjiG3DR1slC8cImio
 U9zDn0lk4Km2cM8MB+lv2wTQdHjh+Vboi1MBCUONMqhR/qtGproDIUwTmK9V1P+g/UCs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qoEjy-008IHz-4u; Thu, 05 Oct 2023 05:09:30 +0200
Date: Thu, 5 Oct 2023 05:09:30 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <164e5e28-6a56-480f-81dd-8a31ee7e5285@lunn.ch>
References: <20231004195442.414766-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231004195442.414766-1-shenwei.wang@nxp.com>
Cc: imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Mario Castaneda <mario.ignacio.castaneda.lopez@nxp.com>,
 Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac-imx: request high
	frequency mode
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

On Wed, Oct 04, 2023 at 02:54:42PM -0500, Shenwei Wang wrote:
> Some i.MX SoCs like the i.mx8mq support adjusting the frequency of the
> DDR, AHB, and AXI buses based on system loading. If the dwmac interface
> in the driver does not request a HIGH frequency, it can significantly
> degrade performance when the system switches to a lower frequency to
> conserve power.
> 
> For example, on an i.MX8MQ EVK board, the throughput dropped to around
> 100Mbit/s on a 1Gbit connection:
> 
>     [ ID] Interval           Transfer     Bitrate
>     [  5]   0.00-10.00  sec   117 MBytes  97.9 Mbits/sec
> 
> However, throughput can return to expected levels after its driver requests
> the high frequency mode. Requesting high frequency in the dwmac driver is
> essential to maintain full throughput when the i.MX SoC adjusts bus speeds
> for power savings.

Isn't this going to cause a power regression? I expect there are
applications which expect this behaviour and are happy with
100Mbps. And you are going to change it so their battery goes flatter
faster, or they need to run their fan more often. So maybe you need a
DT property to always forcing high speed.

And as Florian pointed out, maybe you should look at the negotiated
speed, and if you have a 10 or 100Mbps link, the MAC does not need
high frequency, so why not allow it to be low and safe some power.

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
