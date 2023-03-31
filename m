Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 955116D264F
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 18:54:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48854C69069;
	Fri, 31 Mar 2023 16:54:38 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF430C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 16:54:36 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1piI0q-0007MO-3L; Fri, 31 Mar 2023 18:54:04 +0200
Message-ID: <24d12b0e-0a96-4027-988a-16b433572f68@pengutronix.de>
Date: Fri, 31 Mar 2023 18:53:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Shenwei Wang <shenwei.wang@nxp.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20230331163143.52506-1-shenwei.wang@nxp.com>
 <20230331163143.52506-2-shenwei.wang@nxp.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20230331163143.52506-2-shenwei.wang@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: imx@lists.linux.dev, Fabio Estevam <festevam@gmail.com>,
 Tan Tee Min <tee.min.tan@linux.intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wong Vee Khee <veekhee@apple.com>,
 Jose Abreu <joabreu@synopsys.com>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Revanth Kumar Uppala <ruppala@nvidia.com>
Subject: Re: [Linux-stm32] [PATCH v2 2/2] net: stmmac: dwmac-imx: use
 platform specific reset for imx93 SoCs
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

Hello Shenwei,

On 31.03.23 18:31, Shenwei Wang wrote:
> The patch addresses an issue with the reset logic on the i.MX93 SoC, which
> requires configuration of the correct interface speed under RMII mode to
> complete the reset. The patch implements a fix_soc_reset function and uses
> it specifically for the i.MX93 SoCs.

[...]

>  static int
>  imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struct device *dev)
>  {
> @@ -305,6 +327,9 @@ static int imx_dwmac_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_dwmac_init;
>  
> +	if (of_machine_is_compatible("fsl,imx93"))
> +		dwmac->plat_dat->fix_soc_reset = imx_dwmac_mx93_reset;

imx_dwmac_mx93_reset is accessing eqos registers in an eqos driver. I don't
see why you need to check against SoC compatible instead of device compatible
here.

My suggestion is to add fix_soc_reset to the struct imx_dwmac_ops associated
with "nxp,imx93-dwmac-eqos" compatible and use that to populate
plat_dat->fix_soc_reset unconditionally.

Thanks,
Ahmad


> +
>  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>  	if (ret)
>  		goto err_drv_probe;

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
