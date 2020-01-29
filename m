Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A80114C8FD
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2020 11:51:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47FA8C36B0B;
	Wed, 29 Jan 2020 10:51:39 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C94DCC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 10:51:37 +0000 (UTC)
Received: from localhost (unknown [IPv6:2001:982:756:1:57a7:3bfd:5e85:defb])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id A09B015C045A5;
 Wed, 29 Jan 2020 02:51:33 -0800 (PST)
Date: Wed, 29 Jan 2020 11:51:31 +0100 (CET)
Message-Id: <20200129.115131.1101786807458791369.davem@davemloft.net>
To: christophe.roullier@st.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200128083942.17823-1-christophe.roullier@st.com>
References: <20200128083942.17823-1-christophe.roullier@st.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 29 Jan 2020 02:51:35 -0800 (PST)
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/1] net: ethernet: stmmac: simplify phy
 modes management for stm32
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

From: Christophe Roullier <christophe.roullier@st.com>
Date: Tue, 28 Jan 2020 09:39:42 +0100

> No new feature, just to simplify stm32 part to be easier to use.
> Add by default all Ethernet clocks in DT, and activate or not in function
> of phy mode, clock frequency, if property "st,ext-phyclk" is set or not.
> Keep backward compatibility
> -----------------------------------------------------------------------
> |PHY_MODE | Normal | PHY wo crystal|   PHY wo crystal   |  No 125Mhz  |
> |         |        |      25MHz    |        50MHz       |  from PHY   |
> -----------------------------------------------------------------------
> |  MII    |	 -    |     eth-ck    |       n/a          |	    n/a  |
> |         |        | st,ext-phyclk |                    |             |
> -----------------------------------------------------------------------
> |  GMII   |	 -    |     eth-ck    |       n/a          |	    n/a  |
> |         |        | st,ext-phyclk |                    |             |
> -----------------------------------------------------------------------
> | RGMII   |	 -    |     eth-ck    |       n/a          |      eth-ck  |
> |         |        | st,ext-phyclk |                    |st,eth-clk-sel|
> |         |        |               |                    |       or     |
> |         |        |               |                    | st,ext-phyclk|
> ------------------------------------------------------------------------
> | RMII    |	 -    |     eth-ck    |      eth-ck        |	     n/a  |
> |         |        | st,ext-phyclk | st,eth-ref-clk-sel |              |
> |         |        |               | or st,ext-phyclk   |              |
> ------------------------------------------------------------------------
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>

If anything, this is more of a cleanup, and therefore only appropriate for
net-next when it opens back up.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
