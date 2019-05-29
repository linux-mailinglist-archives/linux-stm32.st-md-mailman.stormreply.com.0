Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B112E750
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2019 23:19:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2825BC28E2F
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2019 21:19:22 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91A3FC28E2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2019 21:19:20 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 5E3FE136DF6FB;
 Wed, 29 May 2019 14:19:18 -0700 (PDT)
Date: Wed, 29 May 2019 14:19:15 -0700 (PDT)
Message-Id: <20190529.141915.945026439348535112.davem@davemloft.net>
To: yuehaibing@huawei.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190528091040.20288-1-yuehaibing@huawei.com>
References: <20190528091040.20288-1-yuehaibing@huawei.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Wed, 29 May 2019 14:19:18 -0700 (PDT)
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Fix build error
 without CONFIG_INET
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

From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 28 May 2019 17:10:40 +0800

> Fix gcc build error while CONFIG_INET is not set
> 
> drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.o: In function `__stmmac_test_loopback':
> stmmac_selftests.c:(.text+0x8ec): undefined reference to `ip_send_check'
> stmmac_selftests.c:(.text+0xacc): undefined reference to `udp4_hwcsum'
> 
> Add CONFIG_INET dependency to fix this.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
