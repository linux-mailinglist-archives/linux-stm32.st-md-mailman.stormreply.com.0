Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA7D246F4
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 06:39:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74146C5C7CD
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2019 04:39:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF59EC5C7CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 04:39:38 +0000 (UTC)
Received: from localhost (unknown [106.201.107.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9148421743;
 Tue, 21 May 2019 04:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558413577;
 bh=H7+dKgf9U1QiGInh5iVvhafZtmO+M7kgnQMPzeqYjo0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KeQBu1tCKZLQG+03G9UbFYtHR9NW57lVMYWf7MPGLME2MSubFvEPCE14TsGk1cspd
 UGbdrXn/HEK1itT+UUVcGh51pJ9CQTO1Po6yIQ023X1hX8fVV4TgjPlB1mw5rCY31s
 hiUQ5/0VdmXfoL2hngULJKfmlbitS2/7OvEhCrQs=
Date: Tue, 21 May 2019 10:09:33 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20190521043933.GO15118@vkoul-mobl>
References: <1557215681-18541-1-git-send-email-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557215681-18541-1-git-send-email-amelie.delaunay@st.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-dma: Fix redundant call
 to platform_get_irq
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

On 07-05-19, 09:54, Amelie Delaunay wrote:
> Commit c6504be53972 ("dmaengine: stm32-dma: Fix unsigned variable compared
> with zero") duplicated the call to platform_get_irq.
> So remove the first call to platform_get_irq.

Applied, thanks

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
