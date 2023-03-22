Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 542FD6C4076
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Mar 2023 03:40:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3395C65043;
	Wed, 22 Mar 2023 02:40:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EA52C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Mar 2023 02:40:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB19A61EEF;
 Wed, 22 Mar 2023 02:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76A3C433D2;
 Wed, 22 Mar 2023 02:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679452851;
 bh=79dMe7RsL9m8pXI5ORMx795he2zXkKmcbbpL+80vMiA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z3UXnnuKedblvn/nRQfhBeuDKLUTEt0aMd/m/ImG+mVm9ivGKl8i1BP4ka4+jJgVe
 W/kt+4V5ixJhH12L4DIbpz3YxnSR7m6/ncJybF4AL/7Ss9VPilMUoWhFT+sGsFcIN6
 FSa+iB295LWnPVfEhWVVHj7dkMW9DKZADVgVGj5l6fe5ECTUWn98SSNYRQmytgKvnM
 AzhvN9/G2jR/DDWTrBSViGw+uQa2HYUJpPkwabe05pcROAV5tVD3uPZDUePzuZLryP
 dpA2aPhCAWfClyELnIP6v0rRXhQcaGHzEm5n5kIWDThzJMd02piaIclj6g7D0dV/tr
 TXR8cMR9BcCzw==
Date: Tue, 21 Mar 2023 19:44:02 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Andrew Halaney <ahalaney@redhat.com>
Message-ID: <20230322024402.l6awwelwdzxydmam@ripper>
References: <20230320221617.236323-1-ahalaney@redhat.com>
 <20230320202802.4e7dc54c@kernel.org>
 <20230321184435.5pqkjp4adgn6cpxy@halaney-x13s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230321184435.5pqkjp4adgn6cpxy@halaney-x13s>
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com,
 agross@kernel.org, Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com,
 andrey.konovalov@linaro.org, ncai@quicinc.com, devicetree@vger.kernel.org,
 bhupesh.sharma@linaro.org, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, bmasney@redhat.com, mohammad.athari.ismail@intel.com,
 robh+dt@kernel.org, ruppala@nvidia.com, jsuraj@qti.qualcomm.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
 echanude@redhat.com, mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/12] Add EMAC3 support for
	sa8540p-ride
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

On Tue, Mar 21, 2023 at 01:44:35PM -0500, Andrew Halaney wrote:
> On Mon, Mar 20, 2023 at 08:28:02PM -0700, Jakub Kicinski wrote:
> > On Mon, 20 Mar 2023 17:16:05 -0500 Andrew Halaney wrote:
> > > This is a forward port / upstream refactor of code delivered
> > > downstream by Qualcomm over at [0] to enable the DWMAC5 based
> > > implementation called EMAC3 on the sa8540p-ride dev board.
> > > 
> > > From what I can tell with the board schematic in hand,
> > > as well as the code delivered, the main changes needed are:
> > > 
> > >     1. A new address space layout for /dwmac5/EMAC3 MTL/DMA regs
> > >     2. A new programming sequence required for the EMAC3 base platforms
> > > 
> > > This series makes those adaptations as well as other housekeeping items
> > > such as converting dt-bindings to yaml, adding clock descriptions, etc.
> > > 
> > > [0] https://git.codelinaro.org/clo/la/kernel/ark-5.14/-/commit/510235ad02d7f0df478146fb00d7a4ba74821b17
> > > 
> > > v1: https://lore.kernel.org/netdev/20230313165620.128463-1-ahalaney@redhat.com/
> > 
> > At a glance 1-4,8-12 need to go via networking, 5 via clock tree,
> > and 6,7 via ARM/Qualcomm.
> > 
> > AFAICT there are no strong (compile) dependencies so we can each merge
> > our chunk and they will meet in Linus's tree? If so please repost just
> > the networking stuff for net-next, and the other bits to respective
> > trees, as separate series.
> > 
> 
> That makes sense to me, thanks for the advice.
> 
> The only note is that 5 (the clk patch) is depended on by 6/7 to
> compile (they use the header value in 5)... So I'll keep those together!
> 

Sounds good to me!

Regards,
Bjorn

> So all in all it will be the dt-binding changes + stmmac changes in one
> series for networking, and the clock + devicetree changes via
> ARM/Qualcomm if I am following properly.
> 
> I'll go that route for v3 and link here (just to make finding the split
> easier) unless someone objects (got some time as I need to refactor
> based on series feedback)!
> 
> Thanks,
> Andrew
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
