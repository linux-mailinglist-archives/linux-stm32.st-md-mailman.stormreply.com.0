Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 758A7C06234
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 14:00:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2036EC5F1D4;
	Fri, 24 Oct 2025 12:00:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 418C0C5F1CC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 12:00:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BCB9D48875;
 Fri, 24 Oct 2025 12:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551EAC4CEF1;
 Fri, 24 Oct 2025 12:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761307238;
 bh=mY0NKPFfmhr1T63HdffWMpcsFE4SlVTte2OxJPJe5q0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GA6beHVk0T7eqma9TD1yfynJIZUzmhZWrQSGs2EbMYvTG0m96tG7jC1m+Z5Ic+igt
 29PmR2o/pGmZVtNu9HPB6Ye8/TIOIVlUq69IzYMuAOnOYK+YS4b4MKqlqMf37byeTh
 etMlzJbKT4JMLQN/4UCOOX+FpomsE8Sqpyf5/b4hIbPph51zoQc7tJ72o/dNRKvuUw
 d4SEjXTs9sB6ct0+ynRY0O/vMa26IBbUAUzzdmrsOPm8v1+9mhjyA/b+/OCH1tPqeg
 4aASNTRFCdlPi6DdWTdbxv4LbxaaRnI51ukDWFbj5KzDebv7Yk8PxrpM437HHEbHCk
 jnt3Lz5egnOmw==
Message-ID: <b486bb52-7e95-44d3-ac65-1c28d4d0e40e@kernel.org>
Date: Fri, 24 Oct 2025 07:00:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>
References: <20251024-v6-12-topic-socfpga-agilex5-v5-0-4c4a51159eeb@pengutronix.de>
 <20251024-v6-12-topic-socfpga-agilex5-v5-6-4c4a51159eeb@pengutronix.de>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20251024-v6-12-topic-socfpga-agilex5-v5-6-4c4a51159eeb@pengutronix.de>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 06/10] arm64: dts: socfpga: agilex5:
 add dwxgmac compatible
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Steffen,

On 10/24/25 06:49, Steffen Trumtrar wrote:
> The gmac0/1/2 are also compatible to the more generic "snps,dwxgmac"
> compatible. The platform code checks this to decide if it is a GMAC or
> GMAC4 compatible IP core.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> index 4ccfebfd9d322..d0c139f03541e 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -536,7 +536,8 @@ qspi: spi@108d2000 {
>   
>   		gmac0: ethernet@10810000 {
>   			compatible = "altr,socfpga-stmmac-agilex5",
> -				     "snps,dwxgmac-2.10";
> +				     "snps,dwxgmac-2.10",
> +				     "snps,dwxgmac";
>   			reg = <0x10810000 0x3500>;
>   			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-names = "macirq";
> @@ -649,7 +650,8 @@ queue7 {
>   
>   		gmac1: ethernet@10820000 {
>   			compatible = "altr,socfpga-stmmac-agilex5",
> -				     "snps,dwxgmac-2.10";
> +				     "snps,dwxgmac-2.10",
> +				     "snps,dwxgmac";
>   			reg = <0x10820000 0x3500>;
>   			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-names = "macirq";
> @@ -762,7 +764,8 @@ queue7 {
>   
>   		gmac2: ethernet@10830000 {
>   			compatible = "altr,socfpga-stmmac-agilex5",
> -				     "snps,dwxgmac-2.10";
> +				     "snps,dwxgmac-2.10",
> +				     "snps,dwxgmac";
>   			reg = <0x10830000 0x3500>;
>   			interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
>   			interrupt-names = "macirq";
> 

I just sent a patch for this yesterday:

https://lore.kernel.org/all/20251023214012.283600-1-dinguyen@kernel.org/

I'll make sure to include you on future submissions.

I didn't add it to the bindings document though.

Dinh
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
