Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CB174BDDC
	for <lists+linux-stm32@lfdr.de>; Sat,  8 Jul 2023 16:34:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69C99C6B45F;
	Sat,  8 Jul 2023 14:34:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E49ABC6B45D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Jul 2023 14:34:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ABF5960CF7;
 Sat,  8 Jul 2023 14:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F600C433C8;
 Sat,  8 Jul 2023 14:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688826883;
 bh=7jMPJJXe6YudyGoC/69GZ6MFHuwLHFpgrY1Zr/jDDW8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MEC4LxZcvVtS1h3J0pFwK0rp7E/9enrurNn+WbSP7VTMWcnhk5C9eKygp29zVl1Ai
 NP2TnK4TlNHG83UIUKuIzhD8mMNuPnNsyxhadAvWxCjoNoTZ04Gm4ZDweTBomWWV3X
 qVRAYJ7kWUg8/Ek/dqrwpeNuAHjaRuj4jqLjNQewvrQbSt2rVIuFU9lXX49jyHsWtB
 u9M6V4hzXTdw6O+BatMafrJscQ4QFqM5llJuELYSNz60JeL+BHLob2XFM5+NvzCLwe
 8LkXZFL4GzXnl+BXMUiOidWs6w8duL3JiGcLQv9k12HWhOuNvz2aLDPNBlKk/Hs/Jm
 h7VxQZ5GylzrA==
Date: Sat, 8 Jul 2023 15:34:35 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20230708153435.6da5fee5@jic23-huawei>
In-Reply-To: <20230704095808.33780-1-frank.li@vivo.com>
References: <20230704095808.33780-1-frank.li@vivo.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] iio: adc: stm32-adc: Use
 devm_platform_get_and_ioremap_resource()
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

On Tue,  4 Jul 2023 17:58:08 +0800
Yangtao Li <frank.li@vivo.com> wrote:

> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
Applied.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/stm32-adc-core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index 48f02dcc81c1..99062a0ba1d9 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -723,8 +723,7 @@ static int stm32_adc_probe(struct platform_device *pdev)
>  	priv->nb_adc_max = priv->cfg->num_adcs;
>  	spin_lock_init(&priv->common.lock);
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv->common.base = devm_ioremap_resource(&pdev->dev, res);
> +	priv->common.base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>  	if (IS_ERR(priv->common.base))
>  		return PTR_ERR(priv->common.base);
>  	priv->common.phys_base = res->start;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
