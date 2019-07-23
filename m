Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AF971FA0
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jul 2019 20:51:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48B09C551CE;
	Tue, 23 Jul 2019 18:51:17 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2593CC551BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jul 2019 18:51:15 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 8B47C153B91FF;
 Tue, 23 Jul 2019 11:51:12 -0700 (PDT)
Date: Tue, 23 Jul 2019 11:51:12 -0700 (PDT)
Message-Id: <20190723.115112.1824255524103179323.davem@davemloft.net>
To: jonathanh@nvidia.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <8756d681-e167-fe4a-c6f0-47ae2dcbb100@nvidia.com>
References: <BYAPR12MB32692AF2BA127C5DA5B74804D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <6c769226-bdd9-6fe0-b96b-5a0d800fed24@arm.com>
 <8756d681-e167-fe4a-c6f0-47ae2dcbb100@nvidia.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 23 Jul 2019 11:51:13 -0700 (PDT)
Cc: Jose.Abreu@synopsys.com, Joao.Pinto@synopsys.com, maxime.ripard@bootlin.com,
 netdev@vger.kernel.org, ilias.apalodimas@linaro.org,
 linux-kernel@vger.kernel.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 linux-tegra@vger.kernel.org, peppe.cavallaro@st.com, robin.murphy@arm.com,
 linux-stm32@st-md-mailman.stormreply.com, lists@bofh.nu
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Introducing
 support for Page Pool
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

From: Jon Hunter <jonathanh@nvidia.com>
Date: Tue, 23 Jul 2019 13:09:00 +0100

> Setting "iommu.passthrough=1" works for me. However, I am not sure where
> to go from here, so any ideas you have would be great.

Then definitely we are accessing outside of a valid IOMMU mapping due
to the page pool support changes.

Such a problem should be spotted with swiommu enabled with debugging.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
