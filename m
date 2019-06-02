Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED65B324B1
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Jun 2019 22:01:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F77BC6F9B2
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Jun 2019 20:01:24 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0135BC6F9B0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Jun 2019 20:01:24 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 7B8EE1400F7B4;
 Sun,  2 Jun 2019 13:01:21 -0700 (PDT)
Date: Sun, 02 Jun 2019 13:01:18 -0700 (PDT)
Message-Id: <20190602.130118.1624703340305098863.davem@davemloft.net>
To: biao.huang@mediatek.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <1559209398-3607-2-git-send-email-biao.huang@mediatek.com>
References: <1559209398-3607-1-git-send-email-biao.huang@mediatek.com>
 <1559209398-3607-2-git-send-email-biao.huang@mediatek.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sun, 02 Jun 2019 13:01:22 -0700 (PDT)
Cc: andrew@lunn.ch, jianguo.zhang@mediatek.com, boon.leong.ong@intel.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, yt.shen@mediatek.com,
 joabreu@synopsys.com, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND,
 PATCH 1/4] net: stmmac: dwmac-mediatek: enable Ethernet power domain
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

From: Biao Huang <biao.huang@mediatek.com>
Date: Thu, 30 May 2019 17:43:15 +0800

> @@ -364,6 +371,15 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static int mediatek_dwmac_remove(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	ret = stmmac_pltfr_remove(pdev);
> +
> +	return ret;
> +}
> +
>  static const struct of_device_id mediatek_dwmac_match[] = {
>  	{ .compatible = "mediatek,mt2712-gmac",
>  	  .data = &mt2712_gmac_variant },
> @@ -374,7 +390,7 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
>  
>  static struct platform_driver mediatek_dwmac_driver = {
>  	.probe  = mediatek_dwmac_probe,
> -	.remove = stmmac_pltfr_remove,
> +	.remove = mediatek_dwmac_remove,
>  	.driver = {
>  		.name           = "dwmac-mediatek",
>  		.pm		= &stmmac_pltfr_pm_ops,

This half of your patch has no effect and seems completely unnecessary.

Please remove it.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
