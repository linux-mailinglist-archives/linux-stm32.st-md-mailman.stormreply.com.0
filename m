Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEA27D96D6
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Oct 2023 13:43:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B17FC6C841;
	Fri, 27 Oct 2023 11:43:42 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11131C6C837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Oct 2023 11:43:40 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2c5720a321aso26167471fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Oct 2023 04:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698407020; x=1699011820;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6FxTvodzs+sXyw4G+vyKIEx0C/eMaA77aXx03U9uf0M=;
 b=VnALdHpnmIMb+Ztu411Bh2NzHOZzy1zb8qkMvkaFz1T3XkuYvGrcOPRRzIS0tak7+L
 oYHfXU7RnxIT7hCbcCDNMN3Uw2vDzFvZzyVOvxbwtDuNOIABDH6Mxs5tyOLTcbOcH809
 oOW2g5bKCPb0jI5X440W3FNu4KTIeuLgjjRBSUMrE7I9MFpOasptRt9GTpRc4PphfLaC
 qhRY2sdDXLgh4WWkD85ylTytTijq2vkG9+K5RYkrml8K33o1+YTBcczy1H9+9aK9d7LA
 7v9iJfALE7oumnofrlK8TSyL0vz/K2Uva5Egyc3GHUZme17piMjKHxxRO+zgSx/40ex+
 X0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698407020; x=1699011820;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6FxTvodzs+sXyw4G+vyKIEx0C/eMaA77aXx03U9uf0M=;
 b=aD8/+uEHf7xhcZjpa8kAK9MNb8y8bX4s0O0ntk48HrhHFdkPfMTaRr1cgoPrBVnEez
 V44gJFmjOls9M6e5bMt8q5TtnuCRfhJYt7G1Mw2b8igi2ctiCh7OT4rrA0OGxuVuebhy
 RQ72nXwJ0ADt8FoV2Pwg9buBB7td9yyoFJJKCPu5Rd7LeCh8cHOfTbjAUqr5mExZmHcj
 drIG6VxJPS0/3zei0RyXeDVGDzpXCIZdJlpXJj5yCJJmqZ8cu9uWURK5ei6oMNqQHVd0
 l6PQGyimSfZkhTyg1bKa5yFxE9dIMLv3w6VCwGopqgb3rNE7ihzYGbukVbr/k7bzly0z
 bfIg==
X-Gm-Message-State: AOJu0YyLImxCy8siOugwZcAu/2/kGLcfNKKDty27qpGNG5C4WNbHKYuY
 bp5IBUbmoR5bN3yhEa6Zu5Q=
X-Google-Smtp-Source: AGHT+IEKGBDUbCDFRGX1kdv/8N+AISeFx74HIk/UjgqrccXfV5jnOCN8ZLdnx0Gcf7r1wAxUT8Mhwg==
X-Received: by 2002:a2e:7c15:0:b0:2c5:5926:de52 with SMTP id
 x21-20020a2e7c15000000b002c55926de52mr1804330ljc.53.1698407019812; 
 Fri, 27 Oct 2023 04:43:39 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a05651c200700b002c09602150asm255875ljo.27.2023.10.27.04.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 04:43:39 -0700 (PDT)
Date: Fri, 27 Oct 2023 14:43:34 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <gz5iglkftvoisrpmp2wtglctiddnfwopjo2ozedtlas3yg5vnp@bdgsrbzmmeud>
References: <20231026094856.986796-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026094856.986796-1-0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, rock.xu@nio.com
Subject: Re: [Linux-stm32] [PATCH net-next v1 1/1] net: stmmac: xgmac:
 Enable support for multiple Flexible PPS outputs
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

On Thu, Oct 26, 2023 at 05:48:56PM +0800, Furong Xu wrote:
> From XGMAC Core 3.20 and later, each Flexible PPS has individual PPSEN bit
> to select Fixed mode or Flexible mode. The PPSEN must be set, or it stays
> in Fixed PPS mode by default.

Are you sure 3.10a don't have the PPSEN flag available for all
outputs too?

> XGMAC Core prior 3.20, corresponding PPSEN bits are read-only reserved,
> always set PPSEN do not make things worse ;)
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
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

At the very least it would be nice to have a comment here that the
mode selection was available for the output #0 only in the IP-cores
prior v3.20a with the outputs 1-3 always working as flexible PPS
outputs.

Other than that no more comments:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

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
