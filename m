Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A22A320BA27
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jun 2020 22:21:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4959DC36B0C;
	Fri, 26 Jun 2020 20:21:07 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35A5FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2020 20:21:05 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id ACEC9127320BC;
 Fri, 26 Jun 2020 13:21:02 -0700 (PDT)
Date: Fri, 26 Jun 2020 13:21:01 -0700 (PDT)
Message-Id: <20200626.132101.413123758768311075.davem@davemloft.net>
To: jbx6244@gmail.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200626120527.10562-1-jbx6244@gmail.com>
References: <20200626120527.10562-1-jbx6244@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 26 Jun 2020 13:21:03 -0700 (PDT)
Cc: heiko@sntech.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] net: stmmac: change Kconfig menu
 entry to STMMAC/DWMAC
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

From: Johan Jonker <jbx6244@gmail.com>
Date: Fri, 26 Jun 2020 14:05:26 +0200

> When a Rockchip user wants to enable support for
> the ethernet controller one has to search for
> something with STMicroelectronics.
> Change the Kconfig menu entry to STMMAC/DWMAC,
> so that it better reflects the options it enables.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

I'm not OK with this.  It's called internally stmmac
beause it's based upon an ST Microelectronics chipset.

This is what happens when we have several sub drivers
based upon a top-level common chipset "library".

The problem you have is that just knowing the driver
doesn't tell you the dependencies, but that's a larger
scope generic problem that needs a high level solution
rather then something we should be hacking around with
name adjustments here and there.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
