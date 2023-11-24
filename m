Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E3F7F6B9C
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Nov 2023 06:13:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD339C6B47C;
	Fri, 24 Nov 2023 05:13:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2108BC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Nov 2023 05:13:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BCEFC616AC;
 Fri, 24 Nov 2023 05:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889F5C433C8;
 Fri, 24 Nov 2023 05:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700802808;
 bh=hagFZGT8Lu9FB4is0l4tvlmYdCQ6vvVTipY5bbk8lgQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=awxRRuS00+ASnIfcDh6qu9/zntoouhOmUlG8lbDMGf+h3bFc4FdiphfxdYWMajLQO
 uiLqRNq0V5b9kJTzEt0jV5nPzCITn6P6f3nl3Xudjs/+2cdAjk6OozbBUuCYYnoba2
 mHTaLRM/Oa28ExhuvRTv4epvw3cbpjnm0NbFQtRpo9OjKY1i/XoSRWi0VvUSgFTcvu
 L2pgvNvZzhTX5c6rRzALPq+nL2XjLsXtUZjSmV9USUEAv+uxBBATvBEhr6/yp9admC
 hVndkmygF3O/o+rQhiCVC6cznDOXVALoQ24hPCdwuVK74NjSh1KLOKxypcM2UU8xLV
 LifT6/+GnRsQA==
Date: Fri, 24 Nov 2023 10:43:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <ZWAw85nx/T0xC+Vk@matsya>
References: <20231124050818.1221-1-quic_snehshah@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231124050818.1221-1-quic_snehshah@quicinc.com>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: update Rx clk divider
	for 10M SGMII
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

On 24-11-23, 10:38, Sneh Shah wrote:
> SGMII 10MBPS mode needs RX clock divider to avoid drops in Rx.
> Update configure SGMII function with rx clk divider programming.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
