Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEFF6BDCC2
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Mar 2023 00:18:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9540C69067;
	Thu, 16 Mar 2023 23:18:17 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14CDAC6904C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 23:18:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C18C96215E;
 Thu, 16 Mar 2023 23:18:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9C1C433D2;
 Thu, 16 Mar 2023 23:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679008694;
 bh=OYxBo4djlS61XYzgafFcijG0gwXMYYjumjcr57f8sII=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rWb1M0TbcYdWvys6U7qm+pWzcbxM7BHmg+3uLg8AfqIyld4olOVBoV7jkl+r81Jqj
 f+RYlS2hnjRsQhaxz9CTN25s8fDp/fsMetItOKM8tj+8I64oI3bgs+2g/8CpvLHz+V
 i2QtxX2WI2LbSernJmYN7v8czmwcu+VELH30cD2EWMDSt/cjjLxP45bEUVDsqO/mDC
 pW7SpbAbEmFGp9EuTGd4JfmBm1fU7ZDOWfsyPg6pBOfMYFUwqgP4vtvlG7jrH97Xej
 IlUUblIFivZyHGgsbp2ciNDZtBzbljRkS8veHt81beTxQIGhLQQ5NZykN4zVwtay8L
 rvOAS06RYJB+Q==
Date: Thu, 16 Mar 2023 16:18:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20230316161811.64d14cb3@kernel.org>
In-Reply-To: <ZBOfuSBifFO7O/xQ@shell.armlinux.org.uk>
References: <20230313165620.128463-1-ahalaney@redhat.com>
 <20230313165620.128463-9-ahalaney@redhat.com>
 <20230313173904.3d611e83@kernel.org>
 <20230316183609.a3ymuku2cmhpyrpc@halaney-x13s>
 <20230316115234.393bca5d@kernel.org>
 <ZBOfuSBifFO7O/xQ@shell.armlinux.org.uk>
MIME-Version: 1.0
X-Topics: 
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, veekhee@apple.com,
 hisunil@quicinc.com, joabreu@synopsys.com, agross@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org,
 Andrew Halaney <ahalaney@redhat.com>, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next 08/11] net: stmmac: Add EMAC3
	variant of dwmac4
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

On Thu, 16 Mar 2023 23:01:13 +0000 Russell King (Oracle) wrote:
> What I would say is be careful with that - make sure "struct bla" is
> specific to the interface being called and not generic.
> 
> I had that mistake with struct phylink_state... and there is an
> endless stream of people who don't seem to bother reading the
> documentation, who blindly access whatever members of that they
> damn well please because it suits them, even when either they
> shouldn't be writing to them, or when phylink doesn't guarantee
> their contents, they read them.

Right, gotta take it case by case. I really like structs for
const capabilities of the driver / device, which need to be
communicated to the core.

> As a result, I'm now of the opinion that using a struct to pass
> arguments is in principle a bad idea.
> 
> There's other reasons why it's a bad idea. Many ABIs are capable of
> passing arguments to functions via processor registers. As soon as
> one uses a struct, they typically end up being written to memory.
> Not only does that potentially cause cache line churn, it also
> means that there could be more slow memory accesses that have to be
> made at some point, potentially making other accesses slow.
> 
> So, all in all, I'm really not a fan of the struct approach for
> all the reasons above.

Also true, one has to be careful on the fast paths. There are cases
where similar set of arguments is passed multiple functions down.
Making the code hard to follow and extend. But you're right, structs
will be slower for the most part.

For stmmac I figured it can only help. The driver is touched my very
many people, it has layers and confusions...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
