Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1088233E1
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jan 2024 18:52:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D2CDC6B476;
	Wed,  3 Jan 2024 17:52:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B862BC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jan 2024 17:52:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 44FC061573;
 Wed,  3 Jan 2024 17:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F28C433C7;
 Wed,  3 Jan 2024 17:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704304368;
 bh=v4FnOT3+qS+6Q7aq9Kz0FybsYzgazhhzJUuxOz3LL5o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ss1HqxdB559XH1OG9QLVj/IntPizmprsqe5d39xYMFi3kgKSf8ikKu+PU1OoAdEbC
 09ROyfaV0IBSVIVRh+zPpMSXn9cSHMCnaDKERo4QQ5yGB7g7vDeILdN54UdpTlZvEz
 IS83nvKlHKuda0I02T2FC4ivDUptwZKcGwN9fI6TaRoSWZcIjQWUd+yLUXp1HVh6Lp
 S0zDHARvH4ADrFs0GeusmL1Iy7vnOcUbdy4mayvsouv6SUeSEH3R2RpE4a6FdKoEGr
 Azy0x16uqMnaLhH/KscabZPnNybpqKdr9l0QDPQlILyGaeTpTOy5VsIOcmH0yrA/vo
 KQwWeXS7ZcKtQ==
Date: Wed, 3 Jan 2024 17:52:42 +0000
From: Simon Horman <horms@kernel.org>
To: Sneh Shah <quic_snehshah@quicinc.com>
Message-ID: <20240103175242.GC31813@kernel.org>
References: <20231226083432.24920-1-quic_snehshah@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231226083432.24920-1-quic_snehshah@quicinc.com>
Cc: kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: Fix ethool link
 settings ops for integrated PCS
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

On Tue, Dec 26, 2023 at 02:04:32PM +0530, Sneh Shah wrote:
> Currently get/set_link_ksettings ethtool ops are dependent on PCS.
> When  PCS is integrated, it will not have separate link config.
> Bypass configuring and checking PCS for integrated PCS.
> 
> Fixes: ("aa571b6275fb net: stmmac: add new switch to struct plat_stmmacenet_data")

Nit: a correct format for the line above is:

Fixes: aa571b6275fb ("net: stmmac: add new switch to struct plat_stmmacenet_data")

> Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride
> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
