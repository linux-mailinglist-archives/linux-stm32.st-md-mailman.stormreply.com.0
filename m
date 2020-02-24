Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D8A16B5D1
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2020 00:39:27 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B284FC36B0B;
	Mon, 24 Feb 2020 23:39:27 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBB0FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2020 23:39:25 +0000 (UTC)
Received: from localhost (unknown [50.226.181.18])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 44E5B12543268;
 Mon, 24 Feb 2020 15:39:24 -0800 (PST)
Date: Mon, 24 Feb 2020 15:39:23 -0800 (PST)
Message-Id: <20200224.153923.1536313085486969964.davem@davemloft.net>
To: a.fatoum@pengutronix.de
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200224172956.28744-2-a.fatoum@pengutronix.de>
References: <20200224172956.28744-1-a.fatoum@pengutronix.de>
 <20200224172956.28744-2-a.fatoum@pengutronix.de>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 24 Feb 2020 15:39:24 -0800 (PST)
Cc: mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, joabreu@synopsys.com, kernel@pengutronix.de,
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] net: ethernet: stmmac: don't warn
 about missing optional wakeup IRQ
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

From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 24 Feb 2020 18:29:55 +0100

> The "stm32_pwr_wakeup" is optional per the binding and the driver
> handles its absence gracefully. Request it with
> platform_get_irq_byname_optional, so its absence doesn't needlessly
> clutter the log.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Applied.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
