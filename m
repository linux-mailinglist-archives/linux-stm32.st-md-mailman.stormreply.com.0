Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 151427209CC
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Jun 2023 21:30:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98432C6B443;
	Fri,  2 Jun 2023 19:30:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1868EC04B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jun 2023 19:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685734244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OwNNGdYDZf92GvG8rg3zuoha9IBbY1PdYh3TMHXOPzE=;
 b=IExnCB1kLnSRaxb9u/NAA+SoJ6APBn9/n5E2jYCmsu+QzIyRw8HyQP17tah54VVP3T0b7t
 KuuKsVOv77ukUTn6WYIsA/6aeMBIhOvuKTcROk2oxFrG+O3hoYfGE0ZWxpwhYyX644oPfW
 IMpFoiGPzQI01a9TQcYR+fY7+X/4Rt0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-8VLis6sKNN23vp0t1jnfxw-1; Fri, 02 Jun 2023 15:30:40 -0400
X-MC-Unique: 8VLis6sKNN23vp0t1jnfxw-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-626187749a6so35666536d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jun 2023 12:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685734240; x=1688326240;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OwNNGdYDZf92GvG8rg3zuoha9IBbY1PdYh3TMHXOPzE=;
 b=GgZ3LQqj69c48ElyDi23cQiy5Cv48u7+aiubRreXrywJ2JjXPofOVmFLCubv3+EyKq
 SIdvmi9+ehPrEQO9wuOVL55hA2jhhMXBlWOcastvYZjOVn341jFxNzIew/F6ul3dCohE
 1MTU4uLMR3PGPqabcaETs1zGo4bqv/2Ec7V9oAnQVdu4n6kJxY7n57YZxep5h6qlDtlU
 GqnsIOGeCT1I6zHHmm3wz7t+yqbbxnKdHy5L/fh9dW70vyHuC7NI8fuwXtRLkrgez+Sy
 jqzM/efMXE8zHrqcQ/EWlfXojCY5F64X+7OJSIBl5s/ZdxTy98EpMJ7pGxlihkZ9Uc1T
 vncw==
X-Gm-Message-State: AC+VfDznCcm7tWbY7C4gYb78a0TimJHJRB4UrVM+GIGlokpm1GU8DZEe
 hovNCyAIJFowcAs3qsAX8qS1G47Bzd2QXHoeHDDyGdyamBNFRLBMT8ydaMg7UdC2Ck/+jhF/HAV
 XQG+xuM0VDW4EVYAAo6k1RvvYRnJo/L3UoXoLemmB
X-Received: by 2002:ad4:5dcb:0:b0:628:27e7:4b79 with SMTP id
 m11-20020ad45dcb000000b0062827e74b79mr10273199qvh.53.1685734240027; 
 Fri, 02 Jun 2023 12:30:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Sr1+6gRslmMppKGQB5JsMabr1hATI2A1kYnsC6FNyaT/CHbjgvLHB0iUsF4aDN4N317Kc6A==
X-Received: by 2002:ad4:5dcb:0:b0:628:27e7:4b79 with SMTP id
 m11-20020ad45dcb000000b0062827e74b79mr10273165qvh.53.1685734239754; 
 Fri, 02 Jun 2023 12:30:39 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::c])
 by smtp.gmail.com with ESMTPSA id
 jh20-20020a0562141fd400b0062613dd9a00sm1197177qvb.52.2023.06.02.12.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 12:30:39 -0700 (PDT)
Date: Fri, 2 Jun 2023 14:30:37 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <ceg2ztzk3lzowssoydxwdq5pe3w7bgfbdpgalds3gwn5r2l5xb@bqufsqrqwlid>
References: <20230602190455.3123018-1-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20230602190455.3123018-1-brgl@bgdev.pl>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Eric Dumazet <edumazet@google.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesse Brandeburg <jesse.brandeburg@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac-qcom-ethqos: fix a
 regression on EMAC < 3
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

On Fri, Jun 02, 2023 at 09:04:55PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We must not assign plat_dat->dwmac4_addrs unconditionally as for
> structures which don't set them, this will result in the core driver
> using zeroes everywhere and breaking the driver for older HW. On EMAC < 2
> the address should remain NULL.
> 
> Fixes: b68376191c69 ("net: stmmac: dwmac-qcom-ethqos: Add EMAC3 support")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

Thanks for the fix, sorry about that!

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 16a8c361283b..f07905f00f98 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -644,7 +644,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	plat_dat->fix_mac_speed = ethqos_fix_mac_speed;
>  	plat_dat->dump_debug_regs = rgmii_dump;
>  	plat_dat->has_gmac4 = 1;
> -	plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
> +	if (ethqos->has_emac3)
> +		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
>  	plat_dat->pmt = 1;
>  	plat_dat->tso_en = of_property_read_bool(np, "snps,tso");
>  	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
> -- 
> 2.39.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
