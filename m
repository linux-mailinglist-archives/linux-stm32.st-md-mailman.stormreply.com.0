Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E315E9B15A0
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Oct 2024 08:57:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D347C78018;
	Sat, 26 Oct 2024 06:57:03 +0000 (UTC)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFA04C78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Oct 2024 06:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com; 
 s=formenos;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hBuPIS6+ZQ7QZigY7In18BLl6WbtmuNuTaKGdqh3q9A=; b=ITmC0Ex5SrggdQaW6YOKb7Ora3
 p065txEO3fe8zaxUEzB5syDVDlbkMR897dUbcChSfZQOwwy4906+9/FfcphK60ZHtIuQV8Q3bR63c
 l0F2gn65gYMhLtcg/PkyJK58jMWKzqIsPPosDFrvf3Ohg/ckfoSSwTlssTxBKO6n7V7Oe8O3xdzLb
 Hb3CsvfKC+05bCSherBbM7MuEM/z5oSndRf29XPga+Jx/4O9XMt40PLWLNHvk/7ZhlMZnjAY4Hhq5
 XPWZR4yTfg/BtcYeGinVgh64SBE8rspzFSqw1tn7WQyfZfXDzuWAifFiNCAfjpCIjSDlXifM0jrTk
 qACFhdxA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
 id 1t4aj1-00CFy1-0p; Sat, 26 Oct 2024 14:56:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Sat, 26 Oct 2024 14:56:39 +0800
Date: Sat, 26 Oct 2024 14:56:39 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <ZxySp0kkUinBPhjD@gondor.apana.org.au>
References: <20241016-rng-mp25-v2-v4-0-5dca590cb092@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241016-rng-mp25-v2-v4-0-5dca590cb092@foss.st.com>
Cc: marex@denx.de, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olivia Mackall <olivia@selenic.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 0/4] Add support for stm32mp25x RNG
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

On Wed, Oct 16, 2024 at 10:04:17AM +0200, Gatien Chevallier wrote:
> This patchset adds support for the Random Number
> Generator(RNG) present on the stm32mp25x platforms.
> On these platforms, the clock management and the RNG
> parameters are different.
> 
> While there, update the RNG max clock frequency on
> stm32mp15 platforms according to the latest specs.
> 
> Tested on the stm32mp257f-ev1 platform with a deep
> power sequence with rngtest before/after the sequence with
> satisfying results.
> 
> Same was done on stm32mp135f-dk to make sure no regression was added.
> 
> On stm32mp157c-dk2, I didn't perform a power sequence but the rngtest
> results were satisfying.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> Changes in v4:
> - Changed the restrictions on clock names per compatible
> - Link to v3: https://lore.kernel.org/r/20241015-rng-mp25-v2-v3-0-87630d73e5eb@foss.st.com
> 
> Changes in v3:
> - Add restriction on clock-names some compatibles
> - Use clk_bulk APIs in the RNG driver to avoid manually handling clocks.
> - Link to v2: https://lore.kernel.org/r/20241011-rng-mp25-v2-v2-0-76fd6170280c@foss.st.com
> 
> Changes in V2:
> 	-Fixes in bindings
> 	-Removed MP25 RNG example
> 	-Renamed RNG clocks for mp25 to "core" and "bus"
> 
> ---
> Gatien Chevallier (4):
>       dt-bindings: rng: add st,stm32mp25-rng support
>       hwrng: stm32 - implement support for STM32MP25x platforms
>       hwrng: stm32 - update STM32MP15 RNG max clock frequency
>       arm64: dts: st: add RNG node on stm32mp251
> 
>  .../devicetree/bindings/rng/st,stm32-rng.yaml      | 28 +++++++-
>  arch/arm64/boot/dts/st/stm32mp251.dtsi             | 10 +++
>  drivers/char/hw_random/stm32-rng.c                 | 76 ++++++++++++++++------
>  3 files changed, 94 insertions(+), 20 deletions(-)
> ---
> base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
> change-id: 20241011-rng-mp25-v2-b6460ef11e1f
> 
> Best regards,
> -- 
> Gatien Chevallier <gatien.chevallier@foss.st.com>

Patches 1-3 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
