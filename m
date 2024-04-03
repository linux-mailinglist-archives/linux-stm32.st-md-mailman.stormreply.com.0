Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC56897615
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Apr 2024 19:15:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26BD3C69067;
	Wed,  3 Apr 2024 17:15:30 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6C99C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Apr 2024 17:15:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0E412CE2B08;
 Wed,  3 Apr 2024 17:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E04CC43399;
 Wed,  3 Apr 2024 17:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712164525;
 bh=LU4Fr44tzUgk3hAyzANG0d2RG8nR6qdxsxdjqxB5zO4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Crn2Bypvo3Kv0F/G3kczzQFESKl58l7QIP+KlF5HW2ukxnJddUqfeWcVj2sibhi6r
 Wd4pAC48+U3CzabQU/ScGSwvstLaVOAenqS+JANq9rVVusFqiX8CZsZz9Yu7IQE06P
 dN61bJcHFau91VNy3QNbrlcU5t2RpnRl22f2UaWjMoMqKUuTPMNOxL8vgYtFaj4Qah
 mD+UlGcjt9JtvGnhOe6FDnxJK10I1bP/zZQOPKLhLrIaWjD8/L1yWpxm7e33T26IV5
 /FPvSBI+GIFCJPeP6n2EDA5WlPj8vgjmsy0twk/tcWyBo6Vr6TY9o1opeuGt+O40yd
 SRup2Djue5aSg==
Date: Wed, 3 Apr 2024 12:15:23 -0500
From: Rob Herring <robh@kernel.org>
To: Tan Chun Hau <chunhau.tan@starfivetech.com>
Message-ID: <171216452060.4016592.7318363130745016894.robh@kernel.org>
References: <20240403100549.78719-1-chunhau.tan@starfivetech.com>
 <20240403100549.78719-2-chunhau.tan@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403100549.78719-2-chunhau.tan@starfivetech.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jee Heng Sia <jeeheng.sia@starfivetech.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v6 1/1] dt-bindings: net: starfive,
 jh7110-dwmac: Add StarFive JH8100 support
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


On Wed, 03 Apr 2024 03:05:49 -0700, Tan Chun Hau wrote:
> Add StarFive JH8100 dwmac support.
> The JH8100 dwmac shares the same driver code as the JH7110 dwmac
> and has only one reset signal.
> 
> Please refer to below:
> 
>   JH8100: reset-names = "stmmaceth";
>   JH7110: reset-names = "stmmaceth", "ahb";
>   JH7100: reset-names = "ahb";
> 
> Example usage of JH8100 in the device tree:
> 
> gmac0: ethernet@16030000 {
>         compatible = "starfive,jh8100-dwmac",
>                      "starfive,jh7110-dwmac",
>                      "snps,dwmac-5.20";
>         ...
> };
> 
> Signed-off-by: Tan Chun Hau <chunhau.tan@starfivetech.com>
> ---
>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 28 +++++++++++++++----
>  1 file changed, 23 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
