Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E47762FE7
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 10:32:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19E1DC6A61A;
	Wed, 26 Jul 2023 08:32:18 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F368DC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 08:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=DVKYdVDWQpK5ELmAAq7qfDDuRr67/RTt9VHAA/B+NYk=; b=zIYZlmI+20RfYNSNHiAdSUsa1W
 NxTqQLz1VrJIBJelddkipCtPBanAzQ9rvnuw9DG/g5nwJtgjedaPtCDd1xBY4MjeGrjPmc7jZuMZm
 rNuikip9Wmb/RgyCErHyn0XMc/oe/X+9DUVJNQDnZPvQVu8kXNLH+IY0Vfu4rx6t+DME=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1qOZw8-002L2e-JT; Wed, 26 Jul 2023 10:32:00 +0200
Date: Wed, 26 Jul 2023 10:32:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <93ffd7a5-2479-4726-b26a-aab10ac09d14@lunn.ch>
References: <20230725194931.1989102-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230725194931.1989102-1-shenwei.wang@nxp.com>
Cc: imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Frank Li <frank.li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-imx: pause the TXC
	clock in fixed-link
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

On Tue, Jul 25, 2023 at 02:49:31PM -0500, Shenwei Wang wrote:
> When using a fixed-link setup, certain devices like the SJA1105 require a
> small pause in the TXC clock line to enable their internal tunable
> delay line (TDL).

The SJA1105 has the problem, so i would expect it to be involved in
the solution. Otherwise, how is this going to work for other MAC
drivers?

Maybe you need to expose a common clock framework clock for the TXC
clock line, which the SJA1105 can disable/enable? That then makes it
clear what other MAC drivers need to do.

      Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
