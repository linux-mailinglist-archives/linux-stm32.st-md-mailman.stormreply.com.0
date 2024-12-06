Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 339989E8C34
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Dec 2024 08:33:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C06D4C78021;
	Mon,  9 Dec 2024 07:33:28 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22FADC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Dec 2024 09:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1733478432; x=1765014432;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NyqUxD4+oNCtW8qXiH/xVm64iV6vut41ehuQt6eTnzQ=;
 b=Uc3dmYYEO5FL1h9HheBq0vRvJSsdgg6dDOgUacB8INdcGubTFUs2cEsv
 OsFW/pxaEOqpYXc2+6IIAwUjJhFZyVw9+biHW1f97x/8LndMU5GQiK8rA
 ++/8/Bk9E2QY1wRggFWAXNVHjlY2/4Xd1kWOi/iUvTNQUXHCnQihlw1Zx
 IQEtOAXR2L6vblzgMZAAFn7owyFLbfHt7qgT1TGMdMIlMGzXrfCdl8K5a
 95AoBfIQbGPjPtr5bm/RCM3eWYqY+ykxglka3aqo4qtIIYoqw2cD22JRH
 KCCZNqVEntd0d9VhQ4dhwzWbmSAvHHms2eSkPStHLNyld9OLNoNf1u5Cj w==;
X-CSE-ConnectionGUID: pTa19jmpRCeKQo/pb8i0zg==
X-CSE-MsgGUID: twfRaRnqSvecierGvL/pdQ==
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="202666736"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Dec 2024 02:47:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 6 Dec 2024 02:47:04 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 6 Dec 2024 02:46:57 -0700
Message-ID: <43ec4b5e-9ccb-412f-a2c7-cac5f8bc2bbd@microchip.com>
Date: Fri, 6 Dec 2024 10:47:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr-FR
To: <jan.petrous@oss.nxp.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, Richard Cochran
 <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Emil
 Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Iyappan Subramanian
 <iyappan@os.amperecomputing.com>, Keyur Chudgar
 <keyur@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Andrew Lunn <andrew+netdev@lunn.ch>
References: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
 <20241205-upstream_s32cc_gmac-v8-10-ec1d180df815@oss.nxp.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20241205-upstream_s32cc_gmac-v8-10-ec1d180df815@oss.nxp.com>
X-Mailman-Approved-At: Mon, 09 Dec 2024 07:33:27 +0000
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, fancer.lancer@gmail.com, 0x1207@gmail.com,
 "Russell King
 \(Oracle\)" <rmk+kernel@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v8 10/15] net: macb: Use helper
	rgmii_clock
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

On 05/12/2024 at 17:43, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Utilize a new helper function rgmii_clock().
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

If needed:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks, best regards,
   Nicolas

> ---
>   drivers/net/ethernet/cadence/macb_main.c | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index daa416fb1724..640f500f989d 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -530,19 +530,9 @@ static void macb_set_tx_clk(struct macb *bp, int speed)
>          if (bp->phy_interface == PHY_INTERFACE_MODE_MII)
>                  return;
> 
> -       switch (speed) {
> -       case SPEED_10:
> -               rate = 2500000;
> -               break;
> -       case SPEED_100:
> -               rate = 25000000;
> -               break;
> -       case SPEED_1000:
> -               rate = 125000000;
> -               break;
> -       default:
> +       rate = rgmii_clock(speed);
> +       if (rate < 0)
>                  return;
> -       }
> 
>          rate_rounded = clk_round_rate(bp->tx_clk, rate);
>          if (rate_rounded < 0)
> 
> --
> 2.47.0
> 
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
