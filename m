Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 248A47DB9B2
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Oct 2023 13:16:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D376FC6B44B;
	Mon, 30 Oct 2023 12:16:52 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE349C6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Oct 2023 12:16:51 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5079f6efd64so6111000e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Oct 2023 05:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698668211; x=1699273011;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Cbm5lTXBFVIsSs+1ANa7wn2CrqJ6D0ati494gyw8FFM=;
 b=bIUppnkCy+cVkkPRyvXhYwAwwSxjeJtzs/z7p++DfGnY3bwe+7E1E5YbGQS3ENcZq0
 fhnFpdKtVwwQgpU14MQu2aDoICfa8hROqoJbvYVLhFHhAZcCdto/E0vHluAZPsBgN2OZ
 Y1Lk4L/yzIguaWHxB/SKdZ8CACCuKbAswzNdpQSLQ3+QoKBUpjEyyrRhW0kQI0toSh1B
 jisErxXnMrs870UrN+qdZmUoLblPwMJGmOVmpQLCp02cAXv17dC1fz7fOydcMLJe7NOY
 9LVJYGFW+qMwNC5pX6V8K643pkSVqm7rM0C3S3JezLAgWIM9mHP6en9n5XThStnEuy1x
 o+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698668211; x=1699273011;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cbm5lTXBFVIsSs+1ANa7wn2CrqJ6D0ati494gyw8FFM=;
 b=g2RtuvzR9bz+NWhw2LcNfiNluIx1RMYzXYSRUZEoLdWHlG4qI+EpRKldd811a8KDN0
 IMzFySEpRWnxAJlxFjv5I7FH0kxedWOxvnibYNDg9G3gKvV2zkxT5h/lHYrpgGYb0ozh
 UQz8F4rHitfEt3a6QH5B/3IsrrFp91PC0i2RKmx+n4hX/xjCnDZ/Mh13tuJU8AiL0FSr
 0Av1QwXHVQaJ6om6IePoAYISNUHoWI2Y5/hGUDUhhrsTwTWV/cYPJSR925XS2Kbf2HXM
 aHZsmfu/J/urHTPtVr3qnnYJpQPYJZ5zUVA2XF8Wyu3IPM45gDPAd7EyKDO2ZUo0ukJ4
 Qtww==
X-Gm-Message-State: AOJu0Yymi3EpEVhAV/V+FVFIExnwCKluF3+GvyPxzT1NIcbfjluklYUF
 Nj68t2zcEXLiOMlal3cYu50=
X-Google-Smtp-Source: AGHT+IEOLthbp7Tfp6EdgCrBQvhiY+rzXkU8whMbq+0zowLUHkcytR2z5F8TiLx8t1G9VqSpCIIewg==
X-Received: by 2002:ac2:43bc:0:b0:508:1a4c:b9b8 with SMTP id
 t28-20020ac243bc000000b005081a4cb9b8mr5907776lfl.36.1698668210756; 
 Mon, 30 Oct 2023 05:16:50 -0700 (PDT)
Received: from mobilestation (srv1.baikalchip.ru. [87.245.175.227])
 by smtp.gmail.com with ESMTPSA id
 f22-20020ac251b6000000b005007e7211f7sm1432686lfk.21.2023.10.30.05.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 05:16:50 -0700 (PDT)
Date: Mon, 30 Oct 2023 15:16:48 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <ek3edupo2ve2puzee7376ugjwpuimz3pipf5m2naulmi4ghefr@qgz5g6vitblx>
References: <20231027025603.1035668-1-0x1207@gmail.com>
 <bayygz3wn6toglzzfdy7ygzs3bhenlrs2y4jjkat54tr3pvxbt@gligw4c4umbe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bayygz3wn6toglzzfdy7ygzs3bhenlrs2y4jjkat54tr3pvxbt@gligw4c4umbe>
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

On Mon, Oct 30, 2023 at 02:03:50PM +0300, Serge Semin wrote:
> On Fri, Oct 27, 2023 at 10:56:03AM +0800, Furong Xu wrote:
> > From XGMAC Core 3.20 and later, each Flexible PPS has individual PPSEN bit
> > to select Fixed mode or Flexible mode. The PPSEN must be set, or it stays
> > in Fixed PPS mode by default.
> > XGMAC Core prior 3.20, corresponding PPSEN bits are read-only reserved,
> > always set PPSEN do not make things worse ;)
> > 
> > Fixes: 95eaf3cd0a90 ("net: stmmac: dwxgmac: Add Flexible PPS support")
> > Signed-off-by: Furong Xu <0x1207@gmail.com>
> 
> Please don't forget to add the already got tags shall you need more
> patch revisions.
> 
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Ops, this was intended to be sent for v2... I'll send a copy there.

-Serge(y)

> 
> -Serge(y)
> 
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h      | 2 +-
> >  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > index 7a8f47e7b728..a4e8b498dea9 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> > @@ -259,7 +259,7 @@
> >  	((val) << XGMAC_PPS_MINIDX(x))
> >  #define XGMAC_PPSCMD_START		0x2
> >  #define XGMAC_PPSCMD_STOP		0x5
> > -#define XGMAC_PPSEN0			BIT(4)
> > +#define XGMAC_PPSENx(x)			BIT(4 + (x) * 8)
> >  #define XGMAC_PPSx_TARGET_TIME_SEC(x)	(0x00000d80 + (x) * 0x10)
> >  #define XGMAC_PPSx_TARGET_TIME_NSEC(x)	(0x00000d84 + (x) * 0x10)
> >  #define XGMAC_TRGTBUSY0			BIT(31)
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > index f352be269deb..53bb8f16c481 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> > @@ -1178,7 +1178,7 @@ static int dwxgmac2_flex_pps_config(void __iomem *ioaddr, int index,
> >  
> >  	val |= XGMAC_PPSCMDx(index, XGMAC_PPSCMD_START);
> >  	val |= XGMAC_TRGTMODSELx(index, XGMAC_PPSCMD_START);
> > -	val |= XGMAC_PPSEN0;
> > +	val |= XGMAC_PPSENx(index);
> >  
> >  	writel(cfg->start.tv_sec, ioaddr + XGMAC_PPSx_TARGET_TIME_SEC(index));
> >  
> > -- 
> > 2.34.1
> > 
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
