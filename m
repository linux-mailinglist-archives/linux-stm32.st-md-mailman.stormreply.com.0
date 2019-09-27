Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A2EC0106
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Sep 2019 10:22:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1316DC36B0B;
	Fri, 27 Sep 2019 08:22:13 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 149C1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2019 08:22:12 +0000 (UTC)
Received: from localhost (unknown [65.39.69.237])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 8244314DEA15A;
 Fri, 27 Sep 2019 01:22:08 -0700 (PDT)
Date: Fri, 27 Sep 2019 10:22:06 +0200 (CEST)
Message-Id: <20190927.102206.1720435175604577653.davem@davemloft.net>
To: dan.carpenter@oracle.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190925110554.GQ3264@mwanda>
References: <20190925110554.GQ3264@mwanda>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 27 Sep 2019 01:22:10 -0700 (PDT)
Cc: mathieu@codeaurora.org, kernel-janitors@vger.kernel.org,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH net] net: ethernet: stmmac: Fix signedness
 bug in ipq806x_gmac_of_parse()
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

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2019 14:05:54 +0300

> The "gmac->phy_mode" variable is an enum and in this context GCC will
> treat it as an unsigned int so the error handling will never be
> triggered.
> 
> Fixes: b1c17215d718 ("stmmac: add ipq806x glue layer")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
