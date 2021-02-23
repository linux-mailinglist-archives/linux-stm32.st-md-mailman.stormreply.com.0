Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7651B3237D9
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Feb 2021 08:24:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1736FC5718F;
	Wed, 24 Feb 2021 07:24:43 +0000 (UTC)
Received: from mo-csw.securemx.jp (mo-csw1115.securemx.jp [210.130.202.157])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0728EC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Feb 2021 23:12:04 +0000 (UTC)
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 11NNBZvb015639;
 Wed, 24 Feb 2021 08:11:35 +0900
X-Iguazu-Qid: 2wGqzdZmdWlkl6DMhf
X-Iguazu-QSIG: v=2; s=0; t=1614121895; q=2wGqzdZmdWlkl6DMhf;
 m=UNlr817M4TvvIjBZ8CwXvC0NvBivXhmHbbpNKdPAmwU=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
 by relay.securemx.jp (mx-mr1111) id 11NNBXDv000778
 (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 24 Feb 2021 08:11:34 +0900
Received: from enc01.toshiba.co.jp (enc01.toshiba.co.jp [106.186.93.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by imx2-a.toshiba.co.jp (Postfix) with ESMTPS id BA2AC100096;
 Wed, 24 Feb 2021 08:11:33 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
 by enc01.toshiba.co.jp  with ESMTP id 11NNBXDC009419;
 Wed, 24 Feb 2021 08:11:33 +0900
Date: Wed, 24 Feb 2021 08:11:20 +0900
From: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To: Wei Yongjun <weiyongjun1@huawei.com>
X-TSB-HOP: ON
Message-ID: <20210223231120.cwjwihml4zu2qnau@toshiba.co.jp>
References: <20210223104803.4047281-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210223104803.4047281-1-weiyongjun1@huawei.com>
X-Mailman-Approved-At: Wed, 24 Feb 2021 07:24:42 +0000
Cc: Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Fix missing spin_lock_init
 in visconti_eth_dwmac_probe()
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

Hi,

On Tue, Feb 23, 2021 at 10:48:03AM +0000, Wei Yongjun wrote:
> The driver allocates the spinlock but not initialize it.
> Use spin_lock_init() on it to initialize it correctly.
> 
> Fixes: b38dd98ff8d0 ("net: stmmac: Add Toshiba Visconti SoCs glue driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks for your fix.

Acked-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
> index b7a0c57dfbfb..d23be45a64e5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
> @@ -218,6 +218,7 @@ static int visconti_eth_dwmac_probe(struct platform_device *pdev)
>  		goto remove_config;
>  	}
>  
> +	spin_lock_init(&dwmac->lock);
>  	dwmac->reg = stmmac_res.addr;
>  	plat_dat->bsp_priv = dwmac;
>  	plat_dat->fix_mac_speed = visconti_eth_fix_mac_speed;
> 
>

Best regards,
  Nobuhiro
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
