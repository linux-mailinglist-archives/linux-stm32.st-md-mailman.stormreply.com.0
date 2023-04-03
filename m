Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2426D3F3C
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 10:42:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F9A2C65E70;
	Mon,  3 Apr 2023 08:42:14 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9299BC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 08:42:12 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1pjFlE-0008IB-6R; Mon, 03 Apr 2023 10:41:56 +0200
Message-ID: <33b8501c-f617-3f66-91c4-02f9963e2a2f@pengutronix.de>
Date: Mon, 3 Apr 2023 10:41:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Clark Wang <xiaoning.wang@nxp.com>, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com
References: <20230403081717.2047939-1-xiaoning.wang@nxp.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20230403081717.2047939-1-xiaoning.wang@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: remove the limitation of
 adding vlan in promisc mode
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

Hello Clark,

On 03.04.23 10:17, Clark Wang wrote:
> When using brctl to add eqos to a bridge, it will frist set eqos to
> promisc mode and then set a VLAN for this bridge with a filer VID value
> of 1.
> 
> These two error returns limit the use of brctl, resulting in the
> inability of the bridge to be enabled on eqos. So remove them.
> 
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>

Please add a suitable Fixes: tag pointing at the commit introducing
the regression.

Thanks,
Ahmad

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> index 8c7a0b7c9952..64bbe15a699e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
> @@ -472,12 +472,6 @@ static int dwmac4_add_hw_vlan_rx_fltr(struct net_device *dev,
>  	if (vid > 4095)
>  		return -EINVAL;
>  
> -	if (hw->promisc) {
> -		netdev_err(dev,
> -			   "Adding VLAN in promisc mode not supported\n");
> -		return -EPERM;
> -	}
> -
>  	/* Single Rx VLAN Filter */
>  	if (hw->num_vlan == 1) {
>  		/* For single VLAN filter, VID 0 means VLAN promiscuous */
> @@ -527,12 +521,6 @@ static int dwmac4_del_hw_vlan_rx_fltr(struct net_device *dev,
>  {
>  	int i, ret = 0;
>  
> -	if (hw->promisc) {
> -		netdev_err(dev,
> -			   "Deleting VLAN in promisc mode not supported\n");
> -		return -EPERM;
> -	}
> -
>  	/* Single Rx VLAN Filter */
>  	if (hw->num_vlan == 1) {
>  		if ((hw->vlan_filter[0] & GMAC_VLAN_TAG_VID) == vid) {

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
