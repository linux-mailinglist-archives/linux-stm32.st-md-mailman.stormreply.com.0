Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3971828B3
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2020 07:04:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3A83C36B0E;
	Thu, 12 Mar 2020 06:04:07 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E1BEC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2020 06:04:05 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id A3A6C14CCCAE8;
 Wed, 11 Mar 2020 23:04:02 -0700 (PDT)
Date: Wed, 11 Mar 2020 23:04:02 -0700 (PDT)
Message-Id: <20200311.230402.1496009558967017193.davem@davemloft.net>
To: mklntf@gmail.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200306163848.5910-1-mklntf@gmail.com>
References: <20200306163848.5910-1-mklntf@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 11 Mar 2020 23:04:03 -0700 (PDT)
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: platform: Fix misleading
 interrupt error msg
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

From: Markus Fuchs <mklntf@gmail.com>
Date: Fri,  6 Mar 2020 17:38:48 +0100

> Not every stmmac based platform makes use of the eth_wake_irq or eth_lpi
> interrupts. Use the platform_get_irq_byname_optional variant for these
> interrupts, so no error message is displayed, if they can't be found.
> Rather print an information to hint something might be wrong to assist
> debugging on platforms which use these interrupts.
> 
> Signed-off-by: Markus Fuchs <mklntf@gmail.com>

What do you mean the error message is misleading right now?

It isn't printing anything out at the moment in this situation.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
