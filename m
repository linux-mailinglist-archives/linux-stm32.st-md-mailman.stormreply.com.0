Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 597A5C00E6
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Sep 2019 10:15:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8B55C36B0B;
	Fri, 27 Sep 2019 08:15:55 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26BCDC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2019 08:15:54 +0000 (UTC)
Received: from localhost (unknown [65.39.69.237])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 4698914D0875D;
 Fri, 27 Sep 2019 01:15:50 -0700 (PDT)
Date: Fri, 27 Sep 2019 10:15:48 +0200 (CEST)
Message-Id: <20190927.101548.1428184970448877652.davem@davemloft.net>
To: dan.carpenter@oracle.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190925105822.GH3264@mwanda>
References: <20190925105822.GH3264@mwanda>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 27 Sep 2019 01:15:52 -0700 (PDT)
Cc: martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 kernel-janitors@vger.kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac-meson8b: Fix
 signedness bug in probe
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
Date: Wed, 25 Sep 2019 13:58:22 +0300

> The "dwmac->phy_mode" is an enum and in this context GCC treats it as
> an unsigned int so the error handling is never triggered.
> 
> Fixes: 566e82516253 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
