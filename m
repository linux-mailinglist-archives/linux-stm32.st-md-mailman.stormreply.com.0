Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B9B7AFCF
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Jul 2019 19:26:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F03FC35E01;
	Tue, 30 Jul 2019 17:26:42 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EEE9C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Jul 2019 17:26:41 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 40E811265965D;
 Tue, 30 Jul 2019 10:26:39 -0700 (PDT)
Date: Tue, 30 Jul 2019 10:26:38 -0700 (PDT)
Message-Id: <20190730.102638.2201830580799063447.davem@davemloft.net>
To: Jose.Abreu@synopsys.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <3601e3ae4357d48b3294f42781d0f19095d1b00e.1564479382.git.joabreu@synopsys.com>
References: <3601e3ae4357d48b3294f42781d0f19095d1b00e.1564479382.git.joabreu@synopsys.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 30 Jul 2019 10:26:39 -0700 (PDT)
Cc: Joao.Pinto@synopsys.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Sync RX Buffer upon
	allocation
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
Date: Tue, 30 Jul 2019 15:57:16 +0200

> With recent changes that introduced support for Page Pool in stmmac, Jon
> reported that NFS boot was no longer working on an ARM64 based platform
> that had the IP behind an IOMMU.
> 
> As Page Pool API does not guarantee DMA syncing because of the use of
> DMA_ATTR_SKIP_CPU_SYNC flag, we have to explicit sync the whole buffer upon
> re-allocation because we are always re-using same pages.
> 
> In fact, ARM64 code invalidates the DMA area upon two situations [1]:
> 	- sync_single_for_cpu(): Invalidates if direction != DMA_TO_DEVICE
> 	- sync_single_for_device(): Invalidates if direction == DMA_FROM_DEVICE
> 
> So, as we must invalidate both the current RX buffer and the newly allocated
> buffer we propose this fix.
> 
> [1] arch/arm64/mm/cache.S
> 
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Fixes: 2af6106ae949 ("net: stmmac: Introducing support for Page Pool")
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>

Applied.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
