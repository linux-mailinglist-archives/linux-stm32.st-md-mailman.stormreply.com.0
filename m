Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B5C6B721E
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 10:10:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6FACC6904C;
	Mon, 13 Mar 2023 09:10:05 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BAFFC65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 09:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1678698604; x=1710234604;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YivqxS+zeFWZMfPdu5ClCSUPNAcBM+7zK7hLm2cpsW4=;
 b=wasYGmVA8DAT5dH9FRnB78xElFLooUZ/cO2mjOdXKoSX/7ujyfxE4+Zr
 qZNTp/ZSLWu5tu/vpdNqzmvPqngBwmHHxh6JDhVlahf/gQqd5d0CMo2Vh
 82+moKhh5n1HpjT1Dn29DzNOBF6xVMytydht/Q20kUWhRTn74z+qyJqUK
 H5d7NNcdzXtvTgH28LgLFKcBL7ao206UQXTSllqhHTPnBP0cqW4HP4sHP
 plD6d+PEJLVnaq2vKUzdyKgV1yyhK+AcJp2+70gcucu1+9qHV7UGNan1w
 3l6uIWvP+oveHCaw2LKbZ5xGc70cRt7GGyQM1vnSGqruS8VFXMQTgpVx1 A==;
X-IronPort-AV: E=Sophos;i="5.98,256,1673938800"; d="scan'208";a="205062965"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Mar 2023 02:10:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 02:09:47 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 13 Mar 2023 02:09:40 -0700
Message-ID: <21d44d0b-05c0-1912-15de-a5c74d3ff4c6@microchip.com>
Date: Mon, 13 Mar 2023 10:09:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Wei Fang <wei.fang@nxp.com>, Shenwei Wang
 <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team
 <linux-imx@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, "Giuseppe
 Cavallaro" <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Grygorii Strashko
 <grygorii.strashko@ti.com>, Francois Romieu <romieu@fr.zoreil.com>, "Michal
 Simek" <michal.simek@xilinx.com>, Zhao Qiang <qiang.zhao@nxp.com>, Kalle Valo
 <kvalo@kernel.org>, Samuel Mendoza-Jonas <sam@mendozajonas.com>
References: <20230310144718.1544169-1-robh@kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230310144718.1544169-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-can@vger.kernel.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: Use of_property_read_bool() for
	boolean properties
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

On 10/03/2023 at 15:47, Rob Herring wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to to of_property_read_bool().
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   drivers/net/can/cc770/cc770_platform.c          | 12 ++++++------
>   drivers/net/ethernet/cadence/macb_main.c        |  2 +-

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

>   drivers/net/ethernet/davicom/dm9000.c           |  4 ++--

[..]

> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -4990,7 +4990,7 @@ static int macb_probe(struct platform_device *pdev)
>                  bp->jumbo_max_len = macb_config->jumbo_max_len;
> 
>          bp->wol = 0;
> -       if (of_get_property(np, "magic-packet", NULL))
> +       if (of_property_read_bool(np, "magic-packet"))
>                  bp->wol |= MACB_WOL_HAS_MAGIC_PACKET;
>          device_set_wakeup_capable(&pdev->dev, bp->wol & MACB_WOL_HAS_MAGIC_PACKET);

[..]

-- 
Nicolas Ferre

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
