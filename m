Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C24741157F5
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Dec 2019 20:50:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2198FC36B0B;
	Fri,  6 Dec 2019 19:50:55 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BECBAC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2019 19:50:53 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id D9CA01511E7DD;
 Fri,  6 Dec 2019 11:50:50 -0800 (PST)
Date: Fri, 06 Dec 2019 11:50:50 -0800 (PST)
Message-Id: <20191206.115050.2225203369041453711.davem@davemloft.net>
To: neidhard.kim@lge.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191206114000.27283-1-neidhard.kim@lge.com>
References: <20191206114000.27283-1-neidhard.kim@lge.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 06 Dec 2019 11:50:51 -0800 (PST)
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: reset Tx desc base address
 before restarting Tx
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

From: Jongsung Kim <neidhard.kim@lge.com>
Date: Fri,  6 Dec 2019 20:40:00 +0900

> Refer to the databook of DesignWare Cores Ethernet MAC Universal:
> 
> 6.2.1.5 Register 4 (Transmit Descriptor List Address Register
> 
> If this register is not changed when the ST bit is set to 0, then
> the DMA takes the descriptor address where it was stopped earlier.
> 
> The stmmac_tx_err() does zero indices to Tx descriptors, but does
> not reset HW current Tx descriptor address. To fix inconsistency,
> the base address of the Tx descriptors should be rewritten before
> restarting Tx.
> 
> Signed-off-by: Jongsung Kim <neidhard.kim@lge.com>

Applied.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
