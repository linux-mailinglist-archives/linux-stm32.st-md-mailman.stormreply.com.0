Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF56684D107
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 19:19:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CAD2C6B476;
	Wed,  7 Feb 2024 18:19:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A830C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 18:19:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A2BA961978;
 Wed,  7 Feb 2024 18:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F479C43390;
 Wed,  7 Feb 2024 18:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707329976;
 bh=yzqZkWmurf1d3vXbpPSRq3flg3TmxvLtRnfELAdKB7g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kEGhdQDJzavIhJvxC2C52ffr/UE9SoJ9mSUpiZCNmq1JypOn2mgZ6hiueF8bHxcmz
 JPeRnosDHGyBRAaDNn/KALE4+xNTlFO7Uwq10pSMRCdC1PakuguEDBP7qR2Mab/dTy
 aLaAesbZaSjSnMezz+7Pjja6d1pGC7TqHrOsOu+zrDFcXJS8LRhccozlrWXUSCkbdb
 9nCjFktQAC3cyrJW74mDt5pmRpu3SuaKL4rAAzo81ZlKJ9O40lGgwyqUrsLwLgAjBf
 UU540HAIc1fpuPXdzChWcQOMrX2XMquNc120ZiWSrUYi0WsGdIu6zg1PFuTHgS5uuv
 zhj1lqaBMdeWw==
Date: Wed, 7 Feb 2024 10:19:34 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Message-ID: <20240207101934.6c0ab20b@kernel.org>
In-Reply-To: <578b6a6e-83df-4113-9c1f-cdd7aa65f65e@quicinc.com>
References: <20240207001036.1333450-1-quic_abchauha@quicinc.com>
 <578b6a6e-83df-4113-9c1f-cdd7aa65f65e@quicinc.com>
MIME-Version: 1.0
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 kernel@quicinc.com, Jose Abreu <joabreu@synopsys.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>, Andy Gross <agross@kernel.org>,
 Prasad Sodagudi <psodagud@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: dwmac-qcom-ethqos: Enable
 TBS on all queues but 0
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

On Wed, 7 Feb 2024 09:26:05 -0800 Jeff Johnson wrote:
> > This is similar to the patch raised by NXP <3b12ec8f618e>
> > <"net: stmmac: dwmac-imx: set TSO/TBS TX queues default settings">  
> 
> note that there is a standard way to refer to a prior patch, in your case:
> 3b12ec8f618e ("net: stmmac: dwmac-imx: set TSO/TBS TX queues default
> settings")

Yes, please fix.

> (note this format is defined in the context of the Fixes tag at
> <https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes>)

A fixes tag would be great. But we can't point at 3b12ec8f618e, right?
Can someone explain what the user-visible problem is?
TBS cannot be used? Device reinit is require to enable it?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
