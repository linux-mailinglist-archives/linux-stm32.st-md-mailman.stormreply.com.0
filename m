Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A328693230
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Feb 2023 17:01:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA600C6A5EF;
	Sat, 11 Feb 2023 16:01:58 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3551AC6A5ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Feb 2023 16:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=uPWPHGh/DKXTjcXqPsRg9u1rp49sHTIC/on9dgjtZf4=; b=A3z/Psq82Hq8B+mBU4Az+Azq0R
 h7A/Pf5UL00qc5zv+BXxCKWoPjVpbWQZeR1jtTer+NA8Sws4ENsu6LkINl/1t4jvPkKezTvsKBxbX
 vTGWheU/mDQIjXC0Yva6xvpFr/hdidU9uf9QGy3qgCYXmDSUwNyRtks//Gkmtu3Xhccc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1pQsJl-004i09-Tx; Sat, 11 Feb 2023 17:01:37 +0100
Date: Sat, 11 Feb 2023 17:01:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Message-ID: <Y+e74UIV/Td91lKB@lunn.ch>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-8-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230211031821.976408-8-cristian.ciocaltea@collabora.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Yanhong Wang <yanhong.wang@starfivetech.com>, Lee Jones <lee@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 07/12] dt-bindings: net: Add StarFive
	JH7100 SoC
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

> +  starfive,gtxclk-dlychain:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: GTX clock delay chain setting

Please could you add more details to this. Is this controlling the
RGMII delays? 0ns or 2ns?

> +    gmac: ethernet@10020000 {
> +      compatible = "starfive,jh7100-dwmac", "snps,dwmac";
> +      reg = <0x0 0x10020000 0x0 0x10000>;
> +      clocks = <&clkgen JH7100_CLK_GMAC_ROOT_DIV>,
> +               <&clkgen JH7100_CLK_GMAC_AHB>,
> +               <&clkgen JH7100_CLK_GMAC_PTP_REF>,
> +               <&clkgen JH7100_CLK_GMAC_GTX>,
> +               <&clkgen JH7100_CLK_GMAC_TX_INV>;
> +      clock-names = "stmmaceth", "pclk", "ptp_ref", "gtxc", "tx";
> +      resets = <&rstgen JH7100_RSTN_GMAC_AHB>;
> +      reset-names = "ahb";
> +      interrupts = <6>, <7>;
> +      interrupt-names = "macirq", "eth_wake_irq";
> +      max-frame-size = <9000>;
> +      phy-mode = "rgmii-txid";

This is unusual. Does your board have a really long RX clock line to
insert the 2ns delay needed on the RX side?

       Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
