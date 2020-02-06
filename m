Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 138BA15450E
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2020 14:38:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B56BDC36B0B;
	Thu,  6 Feb 2020 13:38:00 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA3ADC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2020 13:37:58 +0000 (UTC)
Received: from localhost (unknown [IPv6:2001:982:756:1:57a7:3bfd:5e85:defb])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 2B0AB14CCCAD3;
 Thu,  6 Feb 2020 05:37:54 -0800 (PST)
Date: Thu, 06 Feb 2020 14:37:53 +0100 (CET)
Message-Id: <20200206.143753.1516354381077365451.davem@davemloft.net>
To: vkoul@kernel.org
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200206133554.GO2618@vkoul-mobl>
References: <20200206132147.22874-1-zhengdejin5@gmail.com>
 <20200206133554.GO2618@vkoul-mobl>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 06 Feb 2020 05:37:56 -0800 (PST)
Cc: zhengdejin5@gmail.com, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix a possible endless loop
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

From: Vinod Koul <vkoul@kernel.org>
Date: Thu, 6 Feb 2020 19:05:54 +0530

> On 06-02-20, 21:21, Dejin Zheng wrote:
>> It forgot to reduce the value of the variable retry in a while loop
>> in the ethqos_configure() function. It may cause an endless loop and
>> without timeout.
> 
> Thanks for the fix.
> 
> Acked-by: Vinod Koul <vkoul@kernel.org>
> 
> We should add:
> Fixes: a7c30e62d4b8 ("net: stmmac: Add driver for Qualcomm ethqos")
> 
> Also, I think this should be CCed stable

Networking patches do not CC: stable, I queued them up myself manually.

Please read the netdev FAQ under Documentation/ for details.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
