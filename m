Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EBF186784
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2020 10:10:32 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB77AC36B0B;
	Mon, 16 Mar 2020 09:10:31 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 640D4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2020 09:10:30 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id D89EA14706AC7;
 Mon, 16 Mar 2020 02:10:27 -0700 (PDT)
Date: Mon, 16 Mar 2020 02:10:27 -0700 (PDT)
Message-Id: <20200316.021027.1748414593839565698.davem@davemloft.net>
To: zhengdejin5@gmail.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200316023254.13201-1-zhengdejin5@gmail.com>
References: <20200316023254.13201-1-zhengdejin5@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 16 Mar 2020 02:10:28 -0700 (PDT)
Cc: andrew@lunn.ch, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/2] net: stmmac: Use
 readl_poll_timeout() to simplify the code
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

From: Dejin Zheng <zhengdejin5@gmail.com>
Date: Mon, 16 Mar 2020 10:32:52 +0800

> This patch sets just for replace the open-coded loop to the
> readl_poll_timeout() helper macro for simplify the code in
> stmmac driver.
> 
> v2 -> v3:
> 	- return whatever error code by readl_poll_timeout() returned.
> v1 -> v2:
> 	- no changed. I am a newbie and sent this patch a month
> 	  ago (February 6th). So far, I have not received any comments or
> 	  suggestion. I think it may be lost somewhere in the world, so
> 	  resend it.

Looks good, series applied, thank you.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
