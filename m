Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 510A0827D3E
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jan 2024 04:08:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD44CC6DD73;
	Tue,  9 Jan 2024 03:08:43 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7707CC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jan 2024 03:08:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A943CB818D7;
 Tue,  9 Jan 2024 03:08:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5EC1C43390;
 Tue,  9 Jan 2024 03:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704769722;
 bh=X7kLVVcgvRdRs5HuITPBpohSYBsG52ZbQ+d0igx0eEI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cWF/8z7gvhelK5fSDl6ViLjJPYNYtDbFAc8ELim8A8FX7vyieyQNDAnNCvQG89/wX
 kX8dhcDPob67N9nBWsmfXToLZ6UZYrblaARW/qxu3cAaTe13iPiiD2BQ4M3EefPCCj
 X4mEFCRxdpGg67nJc7Oe8jRLaF2a4JGv9zjOBv7kVCMiHWaF2L19/nSvqqw79IJf+2
 KOQ4ff9CejwvUR85cmPF+m+lZH1ywGaNBOjAl1yLPGDBlslWTyEtac5CwAVNMLVvrB
 qNv31l+35GFN0t0yfNaVk9tGZYi37irlAC9d9goP8himHObfAf0o+LDuWKfHWvMCmH
 NeyatUY26gaiA==
Received: (nullmailer pid 2468474 invoked by uid 1000);
 Tue, 09 Jan 2024 03:08:40 -0000
Date: Mon, 8 Jan 2024 20:08:40 -0700
From: Rob Herring <robh@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Message-ID: <170476971804.2467890.1994452217560064962.robh@kernel.org>
References: <20231222101001.2541758-1-cristian.ciocaltea@collabora.com>
 <20231222101001.2541758-2-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231222101001.2541758-2-cristian.ciocaltea@collabora.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 kernel@collabora.com, Emil Renner Berthing <kernel@esmil.dk>,
 Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Samin Guo <samin.guo@starfivetech.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: net: starfive,
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


On Fri, 22 Dec 2023 12:09:59 +0200, Cristian Ciocaltea wrote:
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
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   | 11 +--
>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 72 +++++++++++++------
>  2 files changed, 57 insertions(+), 26 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
