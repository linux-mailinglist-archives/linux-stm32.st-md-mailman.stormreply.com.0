Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D84C0C4DA
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 09:30:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87806C6046E;
	Mon, 27 Oct 2025 08:30:02 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9236C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 18 Oct 2025 00:06:02 +0000 (UTC)
Received: from localhost (unknown [116.232.147.23])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: dlan)
 by smtp.gentoo.org (Postfix) with ESMTPSA id C82DD341FD5;
 Sat, 18 Oct 2025 00:05:58 +0000 (UTC)
Date: Sat, 18 Oct 2025 08:05:48 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Message-ID: <20251018000548-GYA1481334@gentoo.org>
References: <20251017011802.523140-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017011802.523140-1-inochiama@gmail.com>
X-Mailman-Approved-At: Mon, 27 Oct 2025 08:30:01 +0000
Cc: linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>,
 sophgo@lists.linux.dev, Vivian Wang <wangruikang@iscas.ac.cn>,
 Chen Wang <unicorn_wang@outlook.com>, Longbin Li <looong.bin@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Han Gao <rabenda.cn@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Yao Zi <ziyao@disroot.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-sophgo: Add phy
	interface filter
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

Hi Inochi,

On 09:18 Fri 17 Oct     , Inochi Amaoto wrote:
> As the SG2042 has an internal rx delay, the delay should be remove
                                                     s/remove/removed/
> when init the mac, otherwise the phy will be misconfigurated.
s/init/initialize/
> 
> Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Tested-by: Han Gao <rabenda.cn@gmail.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 25 ++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> index 3b7947a7a7ba..b2dee1399eb0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> @@ -7,6 +7,7 @@
> 
>  #include <linux/clk.h>
>  #include <linux/module.h>
> +#include <linux/property.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
> 
> @@ -29,8 +30,23 @@ static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
>  	return 0;
>  }
> 
> +static int sophgo_sg2042_set_mode(struct plat_stmmacenet_data *plat_dat)
> +{
> +	switch (plat_dat->phy_interface) {
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII_TXID;
> +		return 0;
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  static int sophgo_dwmac_probe(struct platform_device *pdev)
>  {
> +	int (*plat_set_mode)(struct plat_stmmacenet_data *plat_dat);
>  	struct plat_stmmacenet_data *plat_dat;
>  	struct stmmac_resources stmmac_res;
>  	struct device *dev = &pdev->dev;
> @@ -50,11 +66,18 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
> 
> +	plat_set_mode = device_get_match_data(&pdev->dev);
> +	if (plat_set_mode) {
> +		ret = plat_set_mode(plat_dat);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
>  }
> 
>  static const struct of_device_id sophgo_dwmac_match[] = {
> -	{ .compatible = "sophgo,sg2042-dwmac" },
> +	{ .compatible = "sophgo,sg2042-dwmac", .data = sophgo_sg2042_set_mode },
I'd personally prefer to introduce a flag for this, it would be more readable and
maintainable, something like
struct sophgo_dwmac_compitable_data {
	bool has_internal_rx_delay;
}

then.
	if (data->has_internal_rx_delay)
		sophgo_sg2042_set_mode(..)


>  	{ .compatible = "sophgo,sg2044-dwmac" },
>  	{ /* sentinel */ }
>  };
> --
> 2.51.0
> 

-- 
Yixun Lan (dlan)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
