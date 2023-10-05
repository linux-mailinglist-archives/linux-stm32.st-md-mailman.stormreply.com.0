Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3675C7B9B15
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Oct 2023 08:28:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF1DAC6C832;
	Thu,  5 Oct 2023 06:28:31 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DAD0C6C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Oct 2023 06:28:30 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1qoHqG-0000ah-LH; Thu, 05 Oct 2023 08:28:12 +0200
Message-ID: <7f3f0f83-8288-bea4-48a0-38786b18edc4@pengutronix.de>
Date: Thu, 5 Oct 2023 08:28:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Shenwei Wang <shenwei.wang@nxp.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20231004195442.414766-1-shenwei.wang@nxp.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20231004195442.414766-1-shenwei.wang@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mario Castaneda <mario.ignacio.castaneda.lopez@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac-imx: request high
 frequency mode
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

On 04.10.23 21:54, Shenwei Wang wrote:
> Some i.MX SoCs like the i.mx8mq support adjusting the frequency of the
> DDR, AHB, and AXI buses based on system loading. If the dwmac interface
> in the driver does not request a HIGH frequency, it can significantly
> degrade performance when the system switches to a lower frequency to
> conserve power.
> 
> For example, on an i.MX8MQ EVK board, the throughput dropped to around
> 100Mbit/s on a 1Gbit connection:
> 
>     [ ID] Interval           Transfer     Bitrate
>     [  5]   0.00-10.00  sec   117 MBytes  97.9 Mbits/sec
> 
> However, throughput can return to expected levels after its driver requests
> the high frequency mode. Requesting high frequency in the dwmac driver is
> essential to maintain full throughput when the i.MX SoC adjusts bus speeds
> for power savings.
> 
> Signed-off-by: Mario Castaneda <mario.ignacio.castaneda.lopez@nxp.com>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> Tested-by: Mario Castaneda <mario.ignacio.castaneda.lopez@nxp.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> index 8f730ada71f91..ba6ae0465ecaa 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> @@ -6,6 +6,7 @@
>   *
>   */
>  
> +#include <linux/busfreq-imx.h>
>  #include <linux/clk.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/kernel.h>
> @@ -152,7 +153,9 @@ static int imx_dwmac_clks_config(void *priv, bool enabled)
>  			clk_disable_unprepare(dwmac->clk_mem);
>  			return ret;
>  		}
> +		request_bus_freq(BUS_FREQ_HIGH);

I don't find request_bus_freq in linux-next (next-20231005). AFAIK, it was only ever
suggested as RFC and never went beyond that as a reimplmeentation on top of devfreq
was requested instead of the i.MX-specific API used in the vendor fork.

Did you observe this performance pregression with mainline?

Cheers,
Ahmad


>  	} else {
> +		release_bus_freq(BUS_FREQ_HIGH);
>  		clk_disable_unprepare(dwmac->clk_tx);
>  		clk_disable_unprepare(dwmac->clk_mem);
>  	}

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
