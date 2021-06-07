Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7310439D974
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Jun 2021 12:19:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 177E9C58D79;
	Mon,  7 Jun 2021 10:19:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77CE9C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Jun 2021 10:19:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 728CB6108C;
 Mon,  7 Jun 2021 10:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623061153;
 bh=VTXaUpTsvgBICiL2lKaVnHTXuZH2cZNa6FWeUX+IisE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RVVTU06jgeAsSo/v/fEAlG1xId7qFWDasaTznd2qQ64Uk30/NJbygYrmH4HWiWaou
 Nx9OEPtvZlVibiqfpvZU8qf2uIp7A/lSu+BaSGZHU0V1ky2KF3nK24EJix6mir/gkm
 M5OuKTah7QnercdV/DgyniAVxs5A+4BkYGy6BI/CtHTsdlcO9n5EnmH7Z87tsoTMHL
 QjpmLdSzV4/7F/ruljRn9IflXQA4J6+rfnM8SZwX2UZv5Uj2wd+PVTRAXd8uo8537i
 chhMxB+tdfdxIMdeh2+gRz7+jrcEIO+A8a6w1d9t7insDVjhZWJJ3HHSJDtS7G9f7Z
 GR8wQQl1SVUcQ==
Date: Mon, 7 Jun 2021 15:49:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Johan Hovold <johan@kernel.org>
Message-ID: <YL3ynd1KiJoe9y6+@vkoul-mobl>
References: <20210517081826.1564698-1-yukuai3@huawei.com>
 <20210517081826.1564698-3-yukuai3@huawei.com>
 <YLRfZfnuxc0+n/LN@vkoul-mobl.Dlink>
 <b6c340de-b0b5-6aad-94c0-03f062575b63@huawei.com>
 <YLSk/i6GmYWGEa9E@vkoul-mobl.Dlink>
 <YLSqD+9nZIWJpn+r@hovoldconsulting.com>
 <YLi4VGwzrat8wJHP@vkoul-mobl>
 <YL3TlDqe4KSr3ICl@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YL3TlDqe4KSr3ICl@hovoldconsulting.com>
Cc: yi.zhang@huawei.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, dmaengine@vger.kernel.org,
 "yukuai \(C\)" <yukuai3@huawei.com>, michal.simek@xilinx.com,
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

On 07-06-21, 10:06, Johan Hovold wrote:
> On Thu, Jun 03, 2021 at 04:39:08PM +0530, Vinod Koul wrote:
> > On 31-05-21, 11:19, Johan Hovold wrote:
> > > On Mon, May 31, 2021 at 02:27:34PM +0530, Vinod Koul wrote:
> > > > On 31-05-21, 14:11, yukuai (C) wrote:
> > > > > On 2021/05/31 12:00, Vinod Koul wrote:
> > > > > > On 17-05-21, 16:18, Yu Kuai wrote:
> > > > > > > pm_runtime_get_sync will increment pm usage counter even it failed.
> > > > > > > Forgetting to putting operation will result in reference leak here.
> > > > > > > Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> > > > > > > counter balanced.
> 
> > > > Yes the rumtime_pm is disabled on failure here and the count would have
> > > > no consequence...
> > > 
> > > You should still balance the PM usage counter as it isn't reset for
> > > example when reloading the driver.
> > 
> > Should I driver trust that on load PM usage counter is balanced and not
> > to be reset..?
> 
> Not sure what you're asking here. But a driver should never leave the PM
> usage counter unbalanced.

Thinking about again, yes we should safely assume the counter is
balanced when driver loads.. so unloading while balancing sounds better
behaviour

Thanks
-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
