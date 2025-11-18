Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29588C69AEC
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 14:48:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2EB1C628CF;
	Tue, 18 Nov 2025 13:48:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCA67C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 13:48:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2B6FC4E4175B;
 Tue, 18 Nov 2025 13:48:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id EED54606FE;
 Tue, 18 Nov 2025 13:48:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9846810371D09; Tue, 18 Nov 2025 14:48:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1763473734; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=GlBhdagIv79JVcL9in1O72ju+fMc1vc59Oegn0NObR8=;
 b=MiBKtNPN5r33In7hMNTY3A/YcFYzQQpH/KpcDU5sLR3FBaW4H00KnunhPUHpW4ANBNQfUI
 f3rzckotNXn+7FsPmMGoz+TU7uYakDV5l8MsZMe6yad58UecyXZnsjtCUNNcLUhxesg7P7
 iaYjoTdDlDK8TFLO73hdKhVzpxV0ajGcC57emAvuhZPgFf8yA7NrlthI2hcBeEk3UaMc10
 1j6094cRbYuzUzewCLngiy9EgVPtKXfkgxyZf+4h/pJYXMCXHf7h5AQvl6GUx46J3l/Kbp
 SRo3/bOR3pJH1rI5l0tGlDRhWGpv5MXdkkd+mXod+t1HI0dTUa0YvUkzr0MHEg==
Message-ID: <7f81c9f1-a061-4269-96cd-ecdaa6137c72@bootlin.com>
Date: Tue, 18 Nov 2025 14:48:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <E1vLJij-0000000ExKZ-3C9s@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vLJij-0000000ExKZ-3C9s@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: dwc-qos-eth:
 simplify switch() in dwc_eth_dwmac_config_dt()
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



On 18/11/2025 12:18, Russell King (Oracle) wrote:
> Simplify the the switch() statement in dwc_eth_dwmac_config_dt().
> Although this is not speed-critical, simplifying it can make it more
> readable. This also drastically improves the code emitted by the
> compiler.
> 
> On aarch64, with the original code, the compiler loads registers with
> every possible value, and then has a tree of test-and-branch statements
> to work out which register to store. With the simplified code, the
> compiler can load a register with '4' and shift it appropriately.
> 
> This shrinks the text size on aarch64 from 4289 bytes to 4153 bytes,
> a reduction of 3%.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 26 +++----------------
>  1 file changed, 3 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> index c7cd6497d42d..e6d5893c5905 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> @@ -84,29 +84,9 @@ static int dwc_eth_dwmac_config_dt(struct platform_device *pdev,
>  	device_property_read_u32(dev, "snps,burst-map", &burst_map);
>  
>  	/* converts burst-map bitmask to burst array */
> -	for (bit_index = 0; bit_index < 7; bit_index++) {
> -		if (burst_map & (1 << bit_index)) {
> -			switch (bit_index) {
> -			case 0:
> -			plat_dat->axi->axi_blen[a_index] = 4; break;
> -			case 1:
> -			plat_dat->axi->axi_blen[a_index] = 8; break;
> -			case 2:
> -			plat_dat->axi->axi_blen[a_index] = 16; break;
> -			case 3:
> -			plat_dat->axi->axi_blen[a_index] = 32; break;
> -			case 4:
> -			plat_dat->axi->axi_blen[a_index] = 64; break;
> -			case 5:
> -			plat_dat->axi->axi_blen[a_index] = 128; break;
> -			case 6:
> -			plat_dat->axi->axi_blen[a_index] = 256; break;
> -			default:
> -			break;
> -			}
> -			a_index++;
> -		}
> -	}
> +	for (bit_index = 0; bit_index < 7; bit_index++)
> +		if (burst_map & (1 << bit_index))
> +			plat_dat->axi->axi_blen[a_index++] = 4 << bit_index;
>  
>  	/* dwc-qos needs GMAC4, AAL, TSO and PMT */
>  	plat_dat->core_type = DWMAC_CORE_GMAC4;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
