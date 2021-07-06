Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B30BE3BCADF
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jul 2021 12:49:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61303C57B53;
	Tue,  6 Jul 2021 10:49:58 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61B7BC57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jul 2021 10:49:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 932BE619C3;
 Tue,  6 Jul 2021 10:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625568594;
 bh=bPKQG7VMSSD0/w80TXY6qN1X/ZiWRyDZ2D5tRURQYPk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tA6MLSx4ezUqNV9nz99ni3dC//5IdrSKEZx+qd9oK7btksPTPA9/u8z8D40imzky8
 U87OblPdTzumM4K/2ZIrpZ2z8HKk0KPws6PuFQ5a6qRnIjHI6cNSLIm6U3/ri1Pl/j
 HCjGcaFq6qY6QEHfRJAAorpg2KWXydeaQ26Qs4G9QCpXmFvh8a0mf+XtQdmBb7yK5r
 DI4KyalVQT43VwBWA9i/EgJijoyoBxs1h0O3H4ybEbCI/bssHcKt1HykaTS0R3vwWo
 U4Lgu2Hx7nPUrFdKoBOw692vEXKEJKOugPzAAoQEjVzY2JEZFNhRzDPGoVgEA0i/9Q
 7vuyU6jH6P6OA==
Date: Tue, 6 Jul 2021 16:19:50 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <YOQ1TufSjoXDJBBj@matsya>
References: <20210517081826.1564698-1-yukuai3@huawei.com>
 <20210517081826.1564698-3-yukuai3@huawei.com>
 <YLRfZfnuxc0+n/LN@vkoul-mobl.Dlink>
 <b6c340de-b0b5-6aad-94c0-03f062575b63@huawei.com>
 <YLSk/i6GmYWGEa9E@vkoul-mobl.Dlink>
 <YLSqD+9nZIWJpn+r@hovoldconsulting.com>
 <YLi4VGwzrat8wJHP@vkoul-mobl>
 <YL3TlDqe4KSr3ICl@hovoldconsulting.com>
 <YL3ynd1KiJoe9y6+@vkoul-mobl>
 <c8fcdaa1-f053-47aa-2dad-521b8f34b8d1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8fcdaa1-f053-47aa-2dad-521b8f34b8d1@huawei.com>
Cc: yi.zhang@huawei.com, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, michal.simek@xilinx.com,
 mcoquelin.stm32@gmail.com, dmaengine@vger.kernel.org,
 Johan Hovold <johan@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] dmaengine: usb-dmac: Fix PM reference
 leak in usb_dmac_probe()
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

On 05-07-21, 16:41, yukuai (C) wrote:
> Hi, Vinod
> 
> Are you still intrested in accepting this patch?

- Please do not top post

- yes, pls rebase and resend

> On 2021/06/07 18:19, Vinod Koul wrote:
> > On 07-06-21, 10:06, Johan Hovold wrote:
> > > On Thu, Jun 03, 2021 at 04:39:08PM +0530, Vinod Koul wrote:
> > > > On 31-05-21, 11:19, Johan Hovold wrote:
> > > > > On Mon, May 31, 2021 at 02:27:34PM +0530, Vinod Koul wrote:
> > > > > > On 31-05-21, 14:11, yukuai (C) wrote:
> > > > > > > On 2021/05/31 12:00, Vinod Koul wrote:
> > > > > > > > On 17-05-21, 16:18, Yu Kuai wrote:
> > > > > > > > > pm_runtime_get_sync will increment pm usage counter even it failed.
> > > > > > > > > Forgetting to putting operation will result in reference leak here.
> > > > > > > > > Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> > > > > > > > > counter balanced.
> > > 
> > > > > > Yes the rumtime_pm is disabled on failure here and the count would have
> > > > > > no consequence...
> > > > > 
> > > > > You should still balance the PM usage counter as it isn't reset for
> > > > > example when reloading the driver.
> > > > 
> > > > Should I driver trust that on load PM usage counter is balanced and not
> > > > to be reset..?
> > > 
> > > Not sure what you're asking here. But a driver should never leave the PM
> > > usage counter unbalanced.
> > 
> > Thinking about again, yes we should safely assume the counter is
> > balanced when driver loads.. so unloading while balancing sounds better
> > behaviour
> > 
> > Thanks
> > 

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
