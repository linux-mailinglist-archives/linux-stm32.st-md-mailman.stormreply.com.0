Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C8E39544F
	for <lists+linux-stm32@lfdr.de>; Mon, 31 May 2021 06:04:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07D82C57B6B;
	Mon, 31 May 2021 04:04:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B14FC57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 May 2021 04:03:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1413E611EE;
 Mon, 31 May 2021 04:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622433835;
 bh=0xfMtsHewwb7fTSKcKv14cPltEk1ithOlhx+6gwiMWg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VM8YtfKyDimkBGOLI3jzbPADCGHY9togxkgw/t1OJMJA2/EzV9QKERn5fqR1/9ZBM
 2VkbAULuFn67dcinY8YvPt9aSTfOwCD3OMfAmdOdATsGgQmlDYz+DnSq86GNczjch/
 jHZF9i5WOPlctEss+1/B7yd+GY/zgo0728rj+KNPRryYFr+6z+gW8jExoB2Rzl/LTW
 vXnoMZEGyASpNtqOb/yP05BgodiXKKEb6VQ5ejhheI0ZgmzFsk/mWZPJPYFci2gPkE
 vM2QQI/dCeM0J0HcNECT+1muCQsp/Tg4DI3me/yqVGyYj14+P/A7yF1CBQ59BmTTWq
 knMP96zf2+otg==
Date: Mon, 31 May 2021 09:33:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Yu Kuai <yukuai3@huawei.com>
Message-ID: <YLRgKG04vRzXJVNG@vkoul-mobl.Dlink>
References: <20210517081826.1564698-1-yukuai3@huawei.com>
 <20210517081826.1564698-4-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210517081826.1564698-4-yukuai3@huawei.com>
Cc: michal.simek@xilinx.com, yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/3] dmaengine: zynqmp_dma: Fix PM
 reference leak in zynqmp_dma_alloc_chan_resourc()
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

On 17-05-21, 16:18, Yu Kuai wrote:
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> counter balanced.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
