Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B6139D6BB
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Jun 2021 10:06:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF972C58D7B;
	Mon,  7 Jun 2021 08:06:54 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DF0FC57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Jun 2021 08:06:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5849D6102A;
 Mon,  7 Jun 2021 08:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623053212;
 bh=xmIDJ297EbDzxkQF9obeTuoyIAjOCtz2+6Ofw+DrFXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sM2u+WyfdldAkzzqhNEq2wVbktPE9gknkrkYPnr8/LdjYaKYBXHFiOr+U8NylodnI
 dKCe3oCN2qVP2hFpiTEofcH0Pq0cCumErxKYvFsJMlgjmNMABEE2OdTPsV2zfG8KZA
 r5hy6REuclAD4YTFgHZlkFFt2VpdPNzwM6wsdtfajESdm8taI/7o37jA+65CEvmp8y
 Y3SfrV4VpNVsJttuF/Fu93gt+mfN10rkDCg+YM1BV5Jho1oqoDXosVqcXuQ8HBmBhR
 6+O4rcp61F7naUFa5GLuo6zPA7M0I7iKcn8mc/jVvLmTPOnFU7sAaFhRo+eFqHvdpZ
 hLfIiy8HB0bGg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1lqAHU-0004Ne-KD; Mon, 07 Jun 2021 10:06:45 +0200
Date: Mon, 7 Jun 2021 10:06:44 +0200
From: Johan Hovold <johan@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <YL3TlDqe4KSr3ICl@hovoldconsulting.com>
References: <20210517081826.1564698-1-yukuai3@huawei.com>
 <20210517081826.1564698-3-yukuai3@huawei.com>
 <YLRfZfnuxc0+n/LN@vkoul-mobl.Dlink>
 <b6c340de-b0b5-6aad-94c0-03f062575b63@huawei.com>
 <YLSk/i6GmYWGEa9E@vkoul-mobl.Dlink>
 <YLSqD+9nZIWJpn+r@hovoldconsulting.com>
 <YLi4VGwzrat8wJHP@vkoul-mobl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLi4VGwzrat8wJHP@vkoul-mobl>
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

On Thu, Jun 03, 2021 at 04:39:08PM +0530, Vinod Koul wrote:
> On 31-05-21, 11:19, Johan Hovold wrote:
> > On Mon, May 31, 2021 at 02:27:34PM +0530, Vinod Koul wrote:
> > > On 31-05-21, 14:11, yukuai (C) wrote:
> > > > On 2021/05/31 12:00, Vinod Koul wrote:
> > > > > On 17-05-21, 16:18, Yu Kuai wrote:
> > > > > > pm_runtime_get_sync will increment pm usage counter even it failed.
> > > > > > Forgetting to putting operation will result in reference leak here.
> > > > > > Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> > > > > > counter balanced.

> > > Yes the rumtime_pm is disabled on failure here and the count would have
> > > no consequence...
> > 
> > You should still balance the PM usage counter as it isn't reset for
> > example when reloading the driver.
> 
> Should I driver trust that on load PM usage counter is balanced and not
> to be reset..?

Not sure what you're asking here. But a driver should never leave the PM
usage counter unbalanced.

> > Using pm_runtime_resume_and_get() is one way of handling this, but
> > alternatively you could also move the error_pm label above the
> > pm_runtime_put() in the error path.
> 
> That would be a better way I think

Johan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
