Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C17ECDB788
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2019 21:31:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E181C36B0B;
	Thu, 17 Oct 2019 19:31:55 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20FBEC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2019 19:31:54 +0000 (UTC)
Received: from localhost (unknown
 [IPv6:2603:3023:50c:85e1:5314:1b70:2a53:887e])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 8CD2614049CCB;
 Thu, 17 Oct 2019 12:31:51 -0700 (PDT)
Date: Thu, 17 Oct 2019 15:31:50 -0400 (EDT)
Message-Id: <20191017.153150.1433354673381849692.davem@davemloft.net>
To: ben.dooks@codethink.co.uk
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191016082205.26899-1-ben.dooks@codethink.co.uk>
References: <20191016082205.26899-1-ben.dooks@codethink.co.uk>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 17 Oct 2019 12:31:52 -0700 (PDT)
Cc: linux-kernel@lists.codethink.co.uk, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix argument to
	stmmac_pcs_ctrl_ane()
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

From: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Date: Wed, 16 Oct 2019 09:22:05 +0100

> The stmmac_pcs_ctrl_ane() expects a register address as
> argument 1, but for some reason the mac_device_info is
> being passed.
> 
> Fix the warning (and possible bug) from sparse:
> 
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2613:17: warning: incorrect type in argument 1 (different address spaces)
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2613:17:    expected void [noderef] <asn:2> *ioaddr
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:2613:17:    got struct mac_device_info *hw
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Applied, thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
