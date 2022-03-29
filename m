Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7544EB2B9
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 19:33:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBB53C5EC6B;
	Tue, 29 Mar 2022 17:33:35 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFBA7C5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 17:33:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 26350B816FE;
 Tue, 29 Mar 2022 17:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C62C2BBE4;
 Tue, 29 Mar 2022 17:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648575212;
 bh=ImLZ7XYxLjoICwbUH/PGLevWhdjBi7z3FcW2zXFX7As=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J1V62gRYOch4F0yLlbgyUFLr6jdpkJPQwAr/s77QZ97iUxIMZ6l6lsIUwSOCItZ7X
 bHkE+vGYsAHLEgGQ653AwiJTIvABNWRGTy0xuUbNqTrdmju6ZxlItK3W3HNsnk+hpu
 nF9BoeMtE1PSIW/pdF04mpPDxrhT1hAm+FEazkyjUwjMGnqOLoOM/DaSTQBfrAPK0T
 zQ66Xfq8SujJVGdsaw5BDW3Eji87gcOodHF80jAhDs+XwLsi1DBztMVjyFGA+VB3Dg
 B0dLhBS9r+uv1DYIS0GeMxGYrwy5DBeDM2cOgPk0rtS0poi/z46W/I48qOxH2FqoKf
 QZ+RfzzJ4BSBA==
Date: Tue, 29 Mar 2022 23:03:22 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Yann Gautier <yann.gautier@foss.st.com>, ulf.hansson@linaro.org
Message-ID: <20220329173322.GC58120@thinkpad>
References: <20220304135134.47827-1-yann.gautier@foss.st.com>
 <20220304135134.47827-2-yann.gautier@foss.st.com>
 <CACRpkdYQz+-im3n-r0_8RKL7so2bHS=aZobty4BbzixmPzms-Q@mail.gmail.com>
 <0bc53018-fce4-4104-fa47-6e60d2367d69@foss.st.com>
 <20220329153114.GA58120@thinkpad>
 <71b10ce2-7b87-14d5-c8e4-3a4598c889e0@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71b10ce2-7b87-14d5-c8e4-3a4598c889e0@foss.st.com>
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, devicetree@vger.kernel.org,
 Marek Vasut <marex@denx.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Grzegorz Szymaszek <gszymaszek@short.pl>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@dh-electronics.com,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: mmc: mmci: add a
 property to disable DMA LLI
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

On Tue, Mar 29, 2022 at 06:00:26PM +0200, Yann Gautier wrote:
> On 3/29/22 17:31, Manivannan Sadhasivam wrote:
> > On Tue, Mar 15, 2022 at 09:26:01AM +0100, Yann Gautier wrote:
> > > On 3/14/22 23:43, Linus Walleij wrote:
> > > > "On Fri, Mar 4, 2022 at 2:52 PM Yann Gautier <yann.gautier@foss.st.com> wrote:
> > > > 
> > > > > On STMicroelectronics variant of PL18x, the DMA Linked Lists are supported
> > > > > starting from revision v2 of the peripheral. But it has limitations,
> > > > > as all the buffers should be aligned on block size (except the last one).
> > > > > But this cannot be guaranteed with SDIO. We should then have a property
> > > > > to disable the support of LLI.
> > > > > 
> > > > > Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> > > > 
> > > > Actually I think this is present also on the ux500 variants. See:
> > > > commit 2253ed4b36dc876d1598c4dab5587e537ec68c34
> > > > "mmc: mmci: Support any block sizes for ux500v2 and qcom variant"
> > > > 
> > > > Spot the variant data "dma_power_of_2".
> > > > 
> > > > So whatever property you add
> > > > to the variant data (not in the device tree please) should
> > > > be added to the ux500 variants as well, it will *VERY* likely
> > > > have a problem with LLI elements not being a power of 2
> > > > as it is the ancestor of later STMicro variants.
> > > > 
> > > > It might actually be the reason for some annoying WiFi error
> > > > messages I have seen :/
> > > > 
> > > > Yours,
> > > > Linus Walleij
> > > 
> > > Hi Linus,
> > > 
> > > The STM32 variant uses an internal DMA, and the DMA functions are in its
> > > dedicated file. So I was planning to do the same as what is done in
> > > meson-gx-mmc.c: using a bounce buffer to copy from/to in case DMA
> > > constraints are not fulfilled. Not sure it can help for Ux500.
> > > 
> 
> Hi Mani,
> 
> > 
> > Irrelevant to this patch: May I know why the internal DMA cannot be represented
> > as a dmaengine driver? We started seeing these internal DMA implementations in
> > the other subsystems as well with pointers towards MMC core [1].
> 
> As for Prabhakar's answer, the IDMA here is inside our IP, and not used in
> any other IP. So I'm not sure it is really relevant to move that to another
> dmaengine driver.
> 

Okay, I think this justification makes sense. I was worried of DMA IPs that get
sandwiched into many peripherals like the one on Renesas platforms. It turned
out that each subsystem has to add internal DMA support for it :/

Ulf, your thoughts?

Thanks,
Mani

> > 
> > Thanks,
> > Mani
> 
> Best regards,
> Yann
> 
> > 
> > [1] https://lore.kernel.org/all/CA+V-a8tfUgvzPyMe_FHuz=8mmC6dPHP7E=e+nCzOey04vCcAkg@mail.gmail.com/
> > 
> > > Ulf, before I send my new series (although it is not ready yet), would you
> > > be OK with the bounce buffer idea?
> > > 
> > > 
> > > Best regards,
> > > Yann
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
