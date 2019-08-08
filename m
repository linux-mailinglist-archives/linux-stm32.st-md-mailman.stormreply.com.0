Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB7F86312
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Aug 2019 15:26:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0076FC35E01;
	Thu,  8 Aug 2019 13:26:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D09E8C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Aug 2019 13:26:11 +0000 (UTC)
Received: from localhost (unknown [122.178.245.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B37412171F;
 Thu,  8 Aug 2019 13:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565270770;
 bh=xOthRltc9QPDcvSfY6/4aGUZsvl14aXcUqTn5d6Zb0c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wdhiSMgEUzklpKCVFzekiTPw8B+at3lhPkMlMq4SDMz7bagefPWO/3Q+YcDzoHCPg
 vY90keJnw2raAF5MHo3hox17C8WLQGi9gvALi+W9RX1r1qYdChpA4QJ93ZTn9d6Kam
 koHNlTvuUSrcY+0LQUue/knLXIFACQjNVu0A19FU=
Date: Thu, 8 Aug 2019 18:54:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <20190808132456.GA12733@vkoul-mobl.Dlink>
References: <20190729020849.17971-1-baijiaju1990@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729020849.17971-1-baijiaju1990@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 dmaengine@vger.kernel.org, dan.j.williams@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dma: stm32-mdma: Fix a possible
 null-pointer dereference in stm32_mdma_irq_handler()
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

On 29-07-19, 10:08, Jia-Ju Bai wrote:
> In stm32_mdma_irq_handler(), chan is checked on line 1368.
> When chan is NULL, it is still used on line 1369:
>     dev_err(chan2dev(chan), "MDMA channel not initialized\n");
> 
> Thus, a possible null-pointer dereference may occur.
> 
> To fix this bug, "dev_dbg(mdma2dev(dmadev), ...)" is used instead.

Applied after changing subsystem name in patch title to dmaengine: ...,
Also while fixing it helps to add Fixes tag, have added

Thanks
-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
