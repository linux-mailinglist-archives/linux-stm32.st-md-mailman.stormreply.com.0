Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAE784142F
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Jan 2024 21:24:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11D46C6B463;
	Mon, 29 Jan 2024 20:24:25 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA65AC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Jan 2024 20:24:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6E002CE1386;
 Mon, 29 Jan 2024 20:24:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB3DC433C7;
 Mon, 29 Jan 2024 20:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706559859;
 bh=rAnCgDX130n4Pu5xvGz9+ytgomDscbf8iqQYRZN9m/w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EnQ7uZ34Ob53zG2/8P4qFAZnQWAPouiVzki80qVjA3PDp+Kad4GQq8qJxCOT2sZG7
 lfO/tIzu4Xz+mxMVoOR8Cz2oZzLI6m0bWhNjxKoCXayZS1yREWDp8O0Y4De/BX17C0
 ybrbHX0tZk5IWnd7jUrgdWVbKLa9SJK5IStnOIh3Fba8Sqab6Sty1L2GQ1xqeKygSL
 YOinnmVlw9QitytUiQ6Q1MccwF2tPYhUncXmaTLjK8gZ4kfiYucbE32dfJBzX2bT9l
 1CsUmVX0nsSXgTZV2rN/uyeJR55C21tHp/yrQ8C6YR0uiPqBJjbkpjNabQ7dpv5GCM
 sTJn7jatBtHUA==
Date: Mon, 29 Jan 2024 12:24:18 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Message-ID: <20240129122418.173133d7@kernel.org>
In-Reply-To: <20240126192128.1210579-2-cristian.ciocaltea@collabora.com>
References: <20240126192128.1210579-1-cristian.ciocaltea@collabora.com>
 <20240126192128.1210579-2-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 kernel@collabora.com, Emil Renner Berthing <kernel@esmil.dk>,
 Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, Samin Guo <samin.guo@starfivetech.com>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [RESEND PATCH v4 1/2] dt-bindings: net: starfive,
 jh7110-dwmac: Add JH7100 SoC compatible
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

On Fri, 26 Jan 2024 21:21:25 +0200 Cristian Ciocaltea wrote:
> The Synopsys DesignWare MAC found on StarFive JH7100 SoC is mostly
> similar to the newer JH7110, but it requires only two interrupts and a
> single reset line, which is 'ahb' instead of the commonly used
> 'stmmaceth'.
> 
> Since the common binding 'snps,dwmac' allows selecting 'ahb' only in
> conjunction with 'stmmaceth', extend the logic to also permit exclusive
> usage of the 'ahb' reset name.  This ensures the following use cases are
> supported:
> 
>   JH7110: reset-names = "stmmaceth", "ahb";
>   JH7100: reset-names = "ahb";
>   other:  reset-names = "stmmaceth";
> 
> Also note the need to use a different dwmac fallback, as v5.20 applies
> to JH7110 only, while JH7100 relies on v3.7x.
> 
> Additionally, drop the reset description items from top-level binding as
> they are already provided by the included snps,dwmac schema.

Reposting review tag from:
https://lore.kernel.org/all/0a6f6dcb-18b0-48d5-8955-76bce0e1295d@linaro.org/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
