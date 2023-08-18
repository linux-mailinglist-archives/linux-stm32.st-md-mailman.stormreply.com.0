Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B44D781048
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 18:25:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09BEBC6B461;
	Fri, 18 Aug 2023 16:25:25 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02A25C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 16:25:22 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-4fe21e7f3d1so1622761e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 09:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692375922; x=1692980722;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=G8pEiMFERjLgVh4C9AUlgVVF/u9ST2sS9FY068sp55M=;
 b=FprSxqxmAgSGctTLQ28PwyU5HnddBxkUcfvSL95K4ZhhU1gqy2dwN+G6F/1E3tV5/d
 spD0XxDeF6i75U5RD/9vNC2bpwikfuivVB0ej4qHJaCrsmKcmGmL1vREhUEExLZLBp20
 CYJoZ6hfW5cihsut2AYrThepT8/JJ1MI6ij4NeXFP2J1RKqTRjiR97UWj9rXOaq4FeFU
 mzcW1F5w7dLB3D2L0DWFT26Vz6UVm0r/gH3gUWXGrRUJ8QtPTk3vv2jRhZ1Bvh+816iz
 IYyMvy7eQHlLTA7KLinypQwOv1J+aTczBxfI4KaxTHUE4wP+0I3ujUurxoIZfvhJV4z8
 7jXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692375922; x=1692980722;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G8pEiMFERjLgVh4C9AUlgVVF/u9ST2sS9FY068sp55M=;
 b=CWIJ4UanU5ExhXaZMR/lP3LNppt4imj/jtwZlumOptJ1p7UUSv1wd1CH/Vn/kG69j8
 y+jM0LHtHGHbg5tG5xKUfeXOPbLyQaoDnyYPkoBb+nnx4iyhmd80t0x4FunbPDyuHO2Q
 a8ZyaAm3RfpgCoQ1dx6czRYiRHCKi78u4O0vvPZi0vcyZ6aue51y+T77hGKBYPc4Q9bO
 wd6L0i3xeic0BYUcJNaI80UAjxBPMFLX5KzIN4yGiF8ZY92HaRGDwMfxg68vaT+ZXJyP
 V7STKShK8lO3IOPBfdqbzemuVPMpT5kOnlqTqMSpB1GuKLhvSZYpGpW+C48o411p/Tkh
 mWEA==
X-Gm-Message-State: AOJu0Yw+GCx213yqxR4AEyWijHefi6/KWnkTxpcR3AeBYMuVCxKwVCUM
 2s405Tla+HjvnHBUPZ6KYmc=
X-Google-Smtp-Source: AGHT+IHHD2GbCfI74fDNGo4DfOBaJf7xvPPj6QcGsKYq2G/vvkEdZSQJ6smybkTbm7yqRPhd6BjRvw==
X-Received: by 2002:a05:6512:2822:b0:4f6:2317:f387 with SMTP id
 cf34-20020a056512282200b004f62317f387mr2462526lfb.35.1692375921947; 
 Fri, 18 Aug 2023 09:25:21 -0700 (PDT)
Received: from mobilestation ([93.157.254.210])
 by smtp.gmail.com with ESMTPSA id
 eq19-20020a056512489300b004fe1bc7e4acsm395877lfb.131.2023.08.18.09.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 09:25:21 -0700 (PDT)
Date: Fri, 18 Aug 2023 19:25:19 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <ytrtxlidqp4blp5gfrgnnirtosjes7mcjkbdvcm7lmvnpkm7ut@e5tuy3bx2cd5>
References: <20230817165749.672-1-jszhang@kernel.org>
 <20230817165749.672-3-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230817165749.672-3-jszhang@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 2/9] net: stmmac: xgmac: add
 more feature parsing from hw cap
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

On Fri, Aug 18, 2023 at 12:57:42AM +0800, Jisheng Zhang wrote:
> The XGMAC_HWFEAT_GMIISEL bit also indicates whether support 10/100Mbps
> or not.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Acked-by: Alexandre TORGUE <alexandre.torgue@foss.st.com>

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> index 3aacf791efeb..1ef8fc132c2d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> @@ -410,6 +410,7 @@ static int dwxgmac2_get_hw_feature(void __iomem *ioaddr,
>  	dma_cap->vlhash = (hw_cap & XGMAC_HWFEAT_VLHASH) >> 4;
>  	dma_cap->half_duplex = (hw_cap & XGMAC_HWFEAT_HDSEL) >> 3;
>  	dma_cap->mbps_1000 = (hw_cap & XGMAC_HWFEAT_GMIISEL) >> 1;
> +	dma_cap->mbps_10_100 = (hw_cap & XGMAC_HWFEAT_GMIISEL) >> 1;
>  
>  	/* MAC HW feature 1 */
>  	hw_cap = readl(ioaddr + XGMAC_HW_FEATURE1);
> -- 
> 2.40.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
