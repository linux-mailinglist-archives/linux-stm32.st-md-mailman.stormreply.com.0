Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A5390041B
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2024 14:55:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E99EC78001;
	Fri,  7 Jun 2024 12:55:05 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43247C7129F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2024 12:55:03 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3FE458843A;
 Fri,  7 Jun 2024 14:55:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717764903;
 bh=P0S/4deZxZJMtdvuT/iptKgogzJiQ+NI/Cuim8aAx14=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qIudx6tlhV1mJzqBeYZgsgKF0cBsiZfsJWaaZp1q+f1Ld9EPcv+p+INR1aeq1RBJa
 dplIhKaAlyfG0vCnCYsHWZnMnA5KfseZzghJa4vtxHY1axDZufbv61KbeB4fpfRpBR
 wVE0IyYu/RFuTAOmDi2xX7eg8A8E5p54aGJn0N83YIOT/Tj3xuuwgoHbQeDVHQtlzq
 yFrc+3GkcVUicRUNfK2AhYcCmgkizEvLaXLAr1syNvjXqLUSDqjjelG+OXZAP68cLF
 iYX23iJURj0ozm9EP/BczYi1QlQpbAawemXqPk4vOtDQScDSCofgfCiIGVgM0C4PaD
 2FK8zbhmrrqFg==
Message-ID: <bcb7d95c-9ad3-4b10-b435-cec148aae061@denx.de>
Date: Fri, 7 Jun 2024 14:50:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Roullier <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20240607095754.265105-1-christophe.roullier@foss.st.com>
 <20240607095754.265105-13-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240607095754.265105-13-christophe.roullier@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 12/12] ARM: multi_v7_defconfig: Add
 MCP23S08 pinctrl support
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

On 6/7/24 11:57 AM, Christophe Roullier wrote:
> Enable MCP23S08 I/O expanders to manage Ethernet phy

PHY in capitals .

> reset in STM32MP135F-DK board.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>   arch/arm/configs/multi_v7_defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index 86bf057ac3663..9758f3d41ad70 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -469,6 +469,7 @@ CONFIG_SPI_XILINX=y
>   CONFIG_SPI_SPIDEV=y
>   CONFIG_SPMI=y
>   CONFIG_PINCTRL_AS3722=y
> +CONFIG_PINCTRL_MCP23S08=y
>   CONFIG_PINCTRL_MICROCHIP_SGPIO=y
>   CONFIG_PINCTRL_OCELOT=y
>   CONFIG_PINCTRL_PALMAS=y

Send this as separate patch, this can go in right away.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
