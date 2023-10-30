Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 753F37DB8AC
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Oct 2023 12:03:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25B9FC6B44B;
	Mon, 30 Oct 2023 11:03:53 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14D0FC6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Oct 2023 11:03:51 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2c595f5dc84so60288351fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Oct 2023 04:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698663830; x=1699268630;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dP22ExIhwcZf4zvM/nB/XRRRBv2PXkjeYmhWWHNWxWc=;
 b=Q4c4RMlBzykFtB5GrQoRW4vPh85v4nGna2MsM6cw4lyMMzzzSyeQGrhWRfSyRC4VX7
 tJU097xjgxVUeCUdzU2PuR36FDhV/vm4Rt3u2wG0XhCjnBYLFV/l6YvFhk4HxiodL5qf
 Sh/PgFCVXtAZd1gMb++zVMm3NR5buG5XXzVjseett0Ou46xsoEgdFWZAqx+SpcKax/Qn
 rnDz4Zz5yQbeYoXepkIFKxtbpJuGwVi3jPP9ee++RZ82SWF3LHyUVVSMx7V0bxA29+JU
 qh468jA68PRFhfzj/goLQUKm6hRglDGk+2QMO0hE+IrmBvHDWpG/PpBSoRKMniFHga+B
 42wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698663830; x=1699268630;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dP22ExIhwcZf4zvM/nB/XRRRBv2PXkjeYmhWWHNWxWc=;
 b=RJm9mdT6nA0hJS7TaFMFR+E/fczXpD0ZAumJxGCU5IFppj9b7a/ukVGLc7JCtX4dV2
 kBmZ/I529zoAQzgWdCb7zJ05IxkqhtKfzXjSynsD3FPWAawNjAL8rMa8WBF+18NrzGcZ
 VqqSbdpfnn1+QlywGwjCd6t83TdYULm3uP+Krf37GqDNojvILIKLWndlHB330YljQeJJ
 8oiz+5BewFh5TMOYp3ywmPO48AzU/oYZj8sfdpj29JpTPkL9rPXYI4MeMijothFac1rZ
 ZmySH7N6EL3mZF3Pxu5Xc3fQWBe9zCvjM0D4ouAFp2ISM5GezPH3pq6QpegaCwj0ThxZ
 UgwQ==
X-Gm-Message-State: AOJu0Ywu8SBnTyjuX8E31BilQ0Mp6/2aNK5bO5R4MSat5MURVAlhiGep
 r7X6gdhE0GbFoR4M+M67fVY=
X-Google-Smtp-Source: AGHT+IHRnkYjUtR8YX6ha89b5TfCd6r0X4MdBYCPEfAfKiXbEl1zEKmaXeRNF5HkMmOrJ40Heesb4w==
X-Received: by 2002:a2e:a309:0:b0:2c4:e5d4:d246 with SMTP id
 l9-20020a2ea309000000b002c4e5d4d246mr4581245lje.7.1698663829773; 
 Mon, 30 Oct 2023 04:03:49 -0700 (PDT)
Received: from mobilestation (srv1.baikalchip.ru. [87.245.175.227])
 by smtp.gmail.com with ESMTPSA id
 a27-20020a2eb17b000000b002bcc303bbffsm1181498ljm.104.2023.10.30.04.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 04:03:49 -0700 (PDT)
Date: Mon, 30 Oct 2023 14:03:47 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <bayygz3wn6toglzzfdy7ygzs3bhenlrs2y4jjkat54tr3pvxbt@gligw4c4umbe>
References: <20231027025603.1035668-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027025603.1035668-1-0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: xgmac: Fix support for
 multiple Flexible PPS outputs
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

On Fri, Oct 27, 2023 at 10:56:03AM +0800, Furong Xu wrote:
> From XGMAC Core 3.20 and later, each Flexible PPS has individual PPSEN bit
> to select Fixed mode or Flexible mode. The PPSEN must be set, or it stays
> in Fixed PPS mode by default.
> XGMAC Core prior 3.20, corresponding PPSEN bits are read-only reserved,
> always set PPSEN do not make things worse ;)
> 
> Fixes: 95eaf3cd0a90 ("net: stmmac: dwxgmac: Add Flexible PPS support")
> Signed-off-by: Furong Xu <0x1207@gmail.com>

Please don't forget to add the already got tags shall you need more
patch revisions.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h      | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> index 7a8f47e7b728..a4e8b498dea9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -259,7 +259,7 @@
>  	((val) << XGMAC_PPS_MINIDX(x))
>  #define XGMAC_PPSCMD_START		0x2
>  #define XGMAC_PPSCMD_STOP		0x5
> -#define XGMAC_PPSEN0			BIT(4)
> +#define XGMAC_PPSENx(x)			BIT(4 + (x) * 8)
>  #define XGMAC_PPSx_TARGET_TIME_SEC(x)	(0x00000d80 + (x) * 0x10)
>  #define XGMAC_PPSx_TARGET_TIME_NSEC(x)	(0x00000d84 + (x) * 0x10)
>  #define XGMAC_TRGTBUSY0			BIT(31)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index f352be269deb..53bb8f16c481 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -1178,7 +1178,7 @@ static int dwxgmac2_flex_pps_config(void __iomem *ioaddr, int index,
>  
>  	val |= XGMAC_PPSCMDx(index, XGMAC_PPSCMD_START);
>  	val |= XGMAC_TRGTMODSELx(index, XGMAC_PPSCMD_START);
> -	val |= XGMAC_PPSEN0;
> +	val |= XGMAC_PPSENx(index);
>  
>  	writel(cfg->start.tv_sec, ioaddr + XGMAC_PPSx_TARGET_TIME_SEC(index));
>  
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
