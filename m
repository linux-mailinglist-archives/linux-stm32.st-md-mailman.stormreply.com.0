Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAFFB05BE6
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 15:25:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FEB6C349C0;
	Tue, 15 Jul 2025 13:25:00 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8495C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=wNlaWSamDFSq/Jqem+yHh7sXr1BP0uqXoeYgV7dAIAg=; b=OmnU90SQmj6FYkOolhCcdTrR+o
 zyKw9OqcgK/AZU1z3tng3XVyXdC1fDwNb+2EEM8PxBntc/ZLiklywaoyGmU9kQaxlXj1jwqgpBwhV
 lbJjDSe9EZHrgwWZOeYbUOev4o86kKFn606iI4J8s5+mvllfv+fqaX+qMUL3ZVVv9osE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ubfeM-001a9h-W6; Tue, 15 Jul 2025 15:24:50 +0200
Date: Tue, 15 Jul 2025 15:24:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Message-ID: <b38cad0b-c2b1-44fc-847c-140066a12652@lunn.ch>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-1-c34092a88a72@altera.com>
 <bef4d761-8909-4f90-8822-8c344291cb93@lunn.ch>
 <21a0e265-6b2c-4bcb-b0ac-5fd47503f909@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21a0e265-6b2c-4bcb-b0ac-5fd47503f909@altera.com>
Cc: linux-kernel@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: xgmac: Disable
 RX FIFO Overflow interrupts
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

> > What is the reset default? Would it make sense to explicitly disable
> > it, rather than never enable it? What does 8a7cb245cf28 do?
> 
> The RX FIFO Overflow interrupt is disabled by default on reset. Commit
> 8a7cb245cf28 also avoids enabling the interrupt rather than disabling
> it. This commit mirrors the same thing for the XGMAC IP.

So same as 8a7cb245cf28 is good.

When you resubmit with the correct Subject: please add Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
