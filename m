Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC8B248864
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Aug 2020 16:57:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BC40C32E8F;
	Tue, 18 Aug 2020 14:57:40 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1BEEC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Aug 2020 14:52:05 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BWDQX4nRPz1qrff;
 Tue, 18 Aug 2020 16:51:58 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BWDQQ06Pkz1qw74;
 Tue, 18 Aug 2020 16:51:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id LWUO4G1BT4fj; Tue, 18 Aug 2020 16:51:56 +0200 (CEST)
X-Auth-Info: DCEnwxByMyNTdxZ9MycUEdurVz87EDooFxhcWPD98Flztj4THCgDTBIV33A3KT1v
Received: from igel.home (ppp-46-244-180-122.dynamic.mnet-online.de
 [46.244.180.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 18 Aug 2020 16:51:56 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 532362C28F0; Tue, 18 Aug 2020 16:51:56 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: YueHaibing <yuehaibing@huawei.com>
References: <20200818143952.50752-1-yuehaibing@huawei.com>
X-Yow: I'm also against BODY-SURFING!!
Date: Tue, 18 Aug 2020 16:51:56 +0200
In-Reply-To: <20200818143952.50752-1-yuehaibing@huawei.com>
 (yuehaibing@huawei.com's message of "Tue, 18 Aug 2020 22:39:52 +0800")
Message-ID: <87ft8katwz.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 18 Aug 2020 14:57:38 +0000
Cc: ajayg@nvidia.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Fix signedness bug in
 stmmac_probe_config_dt()
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

On Aug 18 2020, YueHaibing wrote:

> The "plat->phy_interface" variable is an enum and in this context GCC
> will treat it as an unsigned int so the error handling is never
> triggered.
>
> Fixes: b9f0b2f634c0 ("net: stmmac: platform: fix probe for ACPI devices")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index f32317fa75c8..b5b558b02e7d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -413,7 +413,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
>  	}
>  
>  	plat->phy_interface = device_get_phy_mode(&pdev->dev);
> -	if (plat->phy_interface < 0)
> +	if ((int)plat->phy_interface < 0)
>  		return ERR_PTR(plat->phy_interface);

I don't think the conversion to long when passed to ERR_PTR will produce
a negative value either (if long is wider than unsigned int).

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
