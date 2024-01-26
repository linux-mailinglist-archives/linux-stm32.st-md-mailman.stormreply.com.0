Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D66383D972
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jan 2024 12:36:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26718C6B444;
	Fri, 26 Jan 2024 11:36:34 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45BA5C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jan 2024 11:36:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DADACCE360B;
 Fri, 26 Jan 2024 11:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4925C433C7;
 Fri, 26 Jan 2024 11:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706268985;
 bh=MNtqVm1/B/1/sVEpU0SsXkiKk5FooQFfoTy30vK4zrA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qdowly5MS/3ADclX5TbgeYvwRnT90hQWeb11ZjD7CP8AH+G5QNw6YJjCjciT14S+L
 2Pmv+hA7g2P73agkA7fIhUbzEVimRSPypo32xg5CUic55kP0PLwNf8p93OQWDG1M3H
 lm3NqurNAJyZYk+abKnDS3ycfBRhP7BHtD52LT0vvOiYxVbaL7DGuli7IyYLUCU+vs
 c00DxEbltuqfgSDbcu9a0jOFIpq9Om92a4IOJ/NVIjo8smpBjQT1SNWrz2KK877Zm5
 oLXvqs7FQE9USrjakMbU3kDLHFbb1toIcpLIf5tDYG2SzZtJtu1q+qVI4HQjQhg0ZO
 o/3F1HLF5+4vw==
Date: Fri, 26 Jan 2024 11:36:19 +0000
From: Simon Horman <horms@kernel.org>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <20240126113619.GA401354@kernel.org>
References: <20240124092215.14678-1-quic_snehshah@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240124092215.14678-1-quic_snehshah@quicinc.com>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3] net: stmmac:
 dwmac-qcom-ethqos: Add support for 2.5G SGMII
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

On Wed, Jan 24, 2024 at 02:52:15PM +0530, Sneh Shah wrote:
> Serdes phy needs to operate at 2500 mode for 2.5G speed and 1000
> mode for 1G/100M/10M speed.
> Added changes to configure serdes phy and mac based on link speed.
> Changing serdes phy speed involves multiple register writes for
> serdes block. To avoid redundant write opertions only update serdes
> phy when new speed is different.
> 
> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>

Hi,

unfortunately this patch does not seem to apply to current net-next.
Please rebase and repost.

-- 
pw-bot: changes-requested
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
