Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 019FF85AAFF
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 19:32:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7E03C6B45E;
	Mon, 19 Feb 2024 18:32:48 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6332FC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 18:32:47 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-511ac32fe38so7056116e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 10:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708367566; x=1708972366;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yQmnFQAFKA09Z157wegtMc6k6Apxcc2vInoqwQQtLPM=;
 b=NPDet90UDx4J2uc0hWsCru/7eRMsh3XOuI5wXYAQSASKq1QK0IlivY8Pw6hPxjnPTn
 +xjNE3N8GCuf12PLMeJS+VbvDP6m32aeoW6a9bf/Lt2IPsIo/XK25ajI10SMyjCFV18G
 0kyxaCCQE6S90w0WxW6byDATzyYeW/FBPJXnHMjLFTv4LOxIsk1kVCsMqGdANzqeixC1
 rikc87YcpiWd0gKzo9bBsTSslU1gyPALSvEpHeq6RF3P1JP4p+LdzU7EBKd18Sa4bOfY
 V8lEzRpTyeOf8OJ1bbbGTZ3q602ST6vgfonlw6BK6txU0B3TwECjN00e0pIjy26yZ3vr
 skEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708367566; x=1708972366;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yQmnFQAFKA09Z157wegtMc6k6Apxcc2vInoqwQQtLPM=;
 b=WVlwJasjxYHA+I+P8okzA0iCCJuag3d2qNQb79HemWeH7gKU3JA+tamJZKNu2bPlfi
 wFJsJsHXjD2+X1Um/skn821/bDGLc7HttOv03/zDJUfuLtRkc8x7FuHZC4sGnwOjLzMv
 YltRp0vNSH7ZAI5rYmMjhBR1wxJHz7EaXe1rTQiS6zwmGKww6zYmCOsgLVVOnVknhHOE
 Uav475Aniv9PiqjRLxmLkR8XxUiuCnUc79bq73wsLjjOBoC0z/a1nc+xOg334Frl23Sg
 cktptzeIoWobnQexPzWnTPhv64q1YjgD9hCGoTH0Y7f4S+6uAcFVAtt+OY6/if18RtRj
 RViQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnxSqCtybY+f1HcefXmAd7IHTwsyVdYp0pmX1EzJomrWtMhCf+t6ROOLtPOk1lmrmqEdtwirQXIQjORg5zUlMSJescNRNK+iFXfkBdkr1V+o5qMK8LgbaR
X-Gm-Message-State: AOJu0YyTSAdEmADt4msP32rCZAjZatL7Vl97he74pIce7vUh+4bzUaE0
 eWLeGgvSPmiO/fZAJOSZck2DnnbBMLKTbrXTwrHdYnctbrsIGZB2
X-Google-Smtp-Source: AGHT+IECKkeoUmhv41g+UvxvTA6mP8LU7x576Bj2xMF5yqj4MUnSM2YoGVzChUo5R6uJ/18ng8WRFQ==
X-Received: by 2002:a05:6512:3f08:b0:512:b087:4de0 with SMTP id
 y8-20020a0565123f0800b00512b0874de0mr3768185lfa.57.1708367566156; 
 Mon, 19 Feb 2024 10:32:46 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a19ae1a000000b00512b9147a7esm324479lfc.83.2024.02.19.10.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 10:32:45 -0800 (PST)
Date: Mon, 19 Feb 2024 21:32:43 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Message-ID: <xne2i6jwqaptsrd2hjdahxbscysgtj7iabqendyjb75fnrjc5z@js7n7qngtzym>
References: <20240219-stmmac-axi-config-v3-0-fca7f046e6ee@nvidia.com>
 <20240219-stmmac-axi-config-v3-3-fca7f046e6ee@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240219-stmmac-axi-config-v3-3-fca7f046e6ee@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-tegra@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Configure
 AXI on Tegra234 MGBE
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

On Mon, Feb 19, 2024 at 05:46:06PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Allow the device to use bursts and increase the maximum number of
> outstanding requests to improve performance. Measurements show an
> increase in throughput of around 5x on a 1 Gbps link.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
> index bab57d1675df..b6bfa48f279d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
> @@ -199,6 +199,12 @@ static void mgbe_uphy_lane_bringup_serdes_down(struct net_device *ndev, void *mg
>  	writel(value, mgbe->xpcs + XPCS_WRAP_UPHY_RX_CONTROL);
>  }
>  
> +static const struct stmmac_axi tegra234_mgbe_axi = {
> +	.axi_wr_osr_lmt = 63,
> +	.axi_rd_osr_lmt = 63,
> +	.axi_blen = { 256, },
> +};
> +
>  static int tegra_mgbe_probe(struct platform_device *pdev)
>  {
>  	struct plat_stmmacenet_data *plat;
> @@ -284,6 +290,9 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
>  	if (err < 0)
>  		goto disable_clks;
>  
> +	/* setup default AXI configuration */
> +	res.axi = &tegra234_mgbe_axi;
> +
>  	plat = devm_stmmac_probe_config_dt(pdev, &res);
>  	if (IS_ERR(plat)) {
>  		err = PTR_ERR(plat);

Let's get back to the v2 discussion:

On Mon Feb 5, 2024 at 1:44 AM CET, Serge Semin wrote:
> The entire series can be converted to just a few lines of change:
>     plat = devm_stmmac_probe_config_dt(pdev, res.mac);
>     if (IS_ERR(plat)) {
>             err = PTR_ERR(plat);
>             goto disable_clks;
>     }
> +
> +   if (IS_ERR_OR_NULL(plat->axi)) {
> +           plat->axi = devm_kzalloc(&pdev->dev, sizeof(*axi), GFP_KERNEL);
> +           if (!plat->axi) {
> +                   ret = -ENOMEM;
> +                   goto disable_clks;
> +           }
> +   } /* else memset plat->axi with zeros if you wish */
> +
> +   plat->axi->axi_wr_osr_lmt = 63;
> +   plat->axi->axi_rd_osr_lmt = 63;
> +   plat->axi->axi_blen[0] = 256;
>  
>     plat->has_xgmac = 1;
>     plat->flags |= STMMAC_FLAG_TSO_EN;
>     plat->pmt = 1;
>
> Please don't overcomplicate the already overcomplicated driver with a
> functionality which can be reached by the default one. In this case
> the easiest way is to let the generic code work and then
> override/replace/fix/etc the retrieved values. Thus there won't be
> need in adding the redundant functionality and keep the generic
> DT-platform code a bit simpler to read.

You responded with:

On Tue, Feb 13, 2024 at 04:51:34PM +0100, Thierry Reding wrote:
> I'm not sure I understand how this is overcomplicating things. The code
> is pretty much unchanged, except that the AXI configuration can now have
> driver-specified defaults before the DT is parsed. Perhaps I need to add
> comments to make that a bit clearer?
> 
> While your version is certainly simpler it has the drawback that it no
> longer allows the platform defaults to be overridden in device tree. I
> would prefer if the defaults can be derived from the compatible string
> but if need be for those defaults to still be overridable from device
> tree.

Currently available functionality is easier to read and understand: by
default the data is retrieved from the DT, if no AXI DT-node found you
can allocate/create your own AXI-configs, if there is AXI DT-node you
can fix it up in whatever way your wish. Thus the default behavior is
straightforward. You on the contrary suggest to add an additional
field to the resources structure which would need to be merged in with
the data retrieved from DT. It makes the stmmac_axi_setup() method and
the entire logic more complex and thus harder to comprehend. The
driver is already overwhelmed with flags and private/platform data
fixing the code here and there (see plat_stmmacenet_data, it's a
madness). So please justify in more details why do you need one more
complexity added instead of:
1. overriding the AXI-configs retrieved from DT,
2. updating DT on your platform
?

-Serge(y)

> 
> -- 
> 2.43.2
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
