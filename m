Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEB99B42E3
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2024 08:13:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7DDAC71287;
	Tue, 29 Oct 2024 07:13:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A33D5C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 07:13:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D3CEC5C402B;
 Tue, 29 Oct 2024 07:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFBFC4CECD;
 Tue, 29 Oct 2024 07:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730186024;
 bh=yZacnLzwlmMaPMgCQVc6Cs2tFUW+rgsYqgTbJRGZhDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TL+Et39/oJkVZmxXRlBodyw+QeDCk90Ru9GXqsC/xpE7MVBpuY+PMpG9PzSBo1Hd4
 EOX0DUAVQLaPlWzjdih9SCrNDmIdPIEEzPdHTHgop5Y/Ph7fMv5YJnAbDiRTtcL8WC
 7rUEO2X/zMYuDueryjDhWYjFclRxCx+QUUlyjHyGcIo+ViuHQZZORr8b7ZMKysZ65/
 aEeBErGoi/NhPwpJPTD0a7ZVPezKt4R4eilcO+qbNAzblgQDi9tKHPI/Y2pM6UpiTl
 0mcIG6XlpW/yyFMOGTJyMZV+r1mbN7tVEMn/P6wMjlyPnRxdeA8ZzICum+/SlfGDWz
 XcKZfURViRwsQ==
Date: Tue, 29 Oct 2024 08:13:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Message-ID: <xanb4j56u2rjwpkyj5gwh6y6t36gpvawph62jw72ksh7jximhr@cjwlp7wsxgp6>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-14-03618f10e3e2@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-14-03618f10e3e2@oss.nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, NXP S32 Linux Team <s32@nxp.com>,
 Emil Renner Berthing <kernel@esmil.dk>, imx@lists.linux.dev,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v4 14/16] net: stmmac: dwmac-s32: add
 basic NXP S32G/S32R glue driver
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

On Mon, Oct 28, 2024 at 09:24:56PM +0100, Jan Petrous (OSS) wrote:
> +	plat->init = s32_gmac_init;
> +	plat->exit = s32_gmac_exit;
> +	plat->fix_mac_speed = s32_fix_mac_speed;
> +
> +	plat->bsp_priv = gmac;
> +
> +	return stmmac_pltfr_probe(pdev, plat, &res);
> +}
> +
> +static const struct of_device_id s32_dwmac_match[] = {
> +	{ .compatible = "nxp,s32g2-dwmac" },
> +	{ .compatible = "nxp,s32g3-dwmac" },
> +	{ .compatible = "nxp,s32r-dwmac" },

Why do you need three same entries?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
