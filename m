Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7298F629C6
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jul 2019 21:41:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEF0BC62C86
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jul 2019 19:41:29 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BE3CC62C84
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jul 2019 19:41:28 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 29EF5133E9BDB;
 Mon,  8 Jul 2019 12:41:26 -0700 (PDT)
Date: Mon, 08 Jul 2019 12:41:25 -0700 (PDT)
Message-Id: <20190708.124125.1938757647213542470.davem@davemloft.net>
To: Jose.Abreu@synopsys.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <36018491f47206728e04d67a9e6263635e64f721.1562588640.git.joabreu@synopsys.com>
References: <36018491f47206728e04d67a9e6263635e64f721.1562588640.git.joabreu@synopsys.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 08 Jul 2019 12:41:26 -0700 (PDT)
Cc: Joao.Pinto@synopsys.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, ben@decadent.org.uk,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Re-work the queue
 selection for TSO packets
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

From: Jose Abreu <Jose.Abreu@synopsys.com>
Date: Mon,  8 Jul 2019 14:26:28 +0200

> Ben Hutchings says:
> 	"This is the wrong place to change the queue mapping.
> 	stmmac_xmit() is called with a specific TX queue locked,
> 	and accessing a different TX queue results in a data race
> 	for all of that queue's state.
> 
> 	I think this commit should be reverted upstream and in all
> 	stable branches.  Instead, the driver should implement the
> 	ndo_select_queue operation and override the queue mapping there."
> 
> Fixes: c5acdbee22a1 ("net: stmmac: Send TSO packets always from Queue 0")
> Suggested-by: Ben Hutchings <ben@decadent.org.uk>
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>

Applied and queued up for -stable.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
