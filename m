Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B54172BC0
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jul 2019 11:53:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 093A7CFAC67;
	Wed, 24 Jul 2019 09:53:16 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2934C424CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jul 2019 09:53:14 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id p17so46214995wrf.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jul 2019 02:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lR8Ju9su/CBU1j0HeTY4zNhljAae1dIFpfV6iNZG33M=;
 b=rt/AaXnhKheL0xFkzKLunvj8+9MwYEXt7S1oWeRDReGARnsopOBP3yinZcK7tsLHqv
 qFxSb0f+FgWqC2SiOJ+Y4Q+N2wnCIxG//pk1XmsRAU8Ks4FKHEcjiDkdRA/Vqy8Tpg+3
 IrCkPu96jz7A5YWxYU96ngNunz6QAhNjF4guFqYYXuxMy4oeAms2bw1+kIMcTn0QoPLr
 1JWbKZ0PhszWxXesACC+DBTOOgO2HEByQt11XNPWWviacFtZESCOJUwMHq+yX7lh5fV+
 icCJzRZV90ddlGcEZzwNZpikwm2MDlWl0espu3AlxlUJeG/9K338Yp4WXLlVGzQSyXSH
 MT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lR8Ju9su/CBU1j0HeTY4zNhljAae1dIFpfV6iNZG33M=;
 b=cDpiSvsOPGkmqoHz7YOM6n5bO22qOnDnSzDsgr8UYWW3ztgmUnPqeC3WjD+V+mHG9L
 vWT3kRnOIz38pIgfRuqtJQ5I/pQT4GgOr5vW3lTymN/4+YUsKnw2j1IvdqZYPGDaYx7C
 R6WZZF0XmSaIYfBUeo4aN9U6loCYjY3vy+oRtWchWZI55PGt2/PbgM9E1iwtCOI6Fg9m
 ZrfeZIm1sPl/YhdnJ/ZjkyRiO6YxnsMtB6VFXtKuPYMx+GUqnmE7MUiN6vJMroEjpGqP
 WSheyfexsJFcUw1V9AHwGSpvY0GfADSw1FcAtKIlgSq7Q6jbGIjRFhsyvZlk/dKmDmdA
 yMDw==
X-Gm-Message-State: APjAAAWFYDpULQt9juQNWNW891ptyYyZxZeOitjxczdS7j09UDww1zrJ
 OHkDXCacgWTDRHMBoZPTuklP8Q==
X-Google-Smtp-Source: APXvYqxWislcFVF3Du4KHOxbpYbgSDdLfG5qWcm0W5OuQz1uGH40+V+7q9mAco6CKAQ68bL6fhPIRg==
X-Received: by 2002:a5d:6190:: with SMTP id j16mr76465400wru.49.1563961994279; 
 Wed, 24 Jul 2019 02:53:14 -0700 (PDT)
Received: from apalos (athedsl-373703.home.otenet.gr. [79.131.11.197])
 by smtp.gmail.com with ESMTPSA id p18sm45611466wrm.16.2019.07.24.02.53.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 02:53:13 -0700 (PDT)
Date: Wed, 24 Jul 2019 12:53:10 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190724095310.GA12991@apalos>
References: <BYAPR12MB32692AF2BA127C5DA5B74804D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <6c769226-bdd9-6fe0-b96b-5a0d800fed24@arm.com>
 <8756d681-e167-fe4a-c6f0-47ae2dcbb100@nvidia.com>
 <20190723.115112.1824255524103179323.davem@davemloft.net>
 <20190724085427.GA10736@apalos>
 <BYAPR12MB3269AA9955844E317B62A239D3C60@BYAPR12MB3269.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR12MB3269AA9955844E317B62A239D3C60@BYAPR12MB3269.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "wens@csie.org" <wens@csie.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 David Miller <davem@davemloft.net>, "lists@bofh.nu" <lists@bofh.nu>
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Introducing
 support for Page Pool
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

Jose, 
> From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Date: Jul/24/2019, 09:54:27 (UTC+00:00)
> 
> > Hi David, 
> > 
> > > From: Jon Hunter <jonathanh@nvidia.com>
> > > Date: Tue, 23 Jul 2019 13:09:00 +0100
> > > 
> > > > Setting "iommu.passthrough=1" works for me. However, I am not sure where
> > > > to go from here, so any ideas you have would be great.
> > > 
> > > Then definitely we are accessing outside of a valid IOMMU mapping due
> > > to the page pool support changes.
> > 
> > Yes. On the netsec driver i did test with and without SMMU to make sure i am not
> > breaking anything.
> > Since we map the whole page on the API i think some offset on the driver causes
> > that. In any case i'll have another look on page_pool to make sure we are not
> > missing anything. 
> 
> Ilias, can it be due to this:
> 
> stmmac_main.c:
> 	pp_params.order = DIV_ROUND_UP(priv->dma_buf_sz, PAGE_SIZE);
> 
> page_pool.c:
> 	dma = dma_map_page_attrs(pool->p.dev, page, 0,
> 				 (PAGE_SIZE << pool->p.order),
> 				 pool->p.dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
> 
> "order", will be at least 1 and then mapping the page can cause overlap 
> ?

well the API is calling the map with the correct page, page offset (0) and size
right? I don't see any overlapping here. Aren't we mapping what we allocate?

Why do you need higher order pages? Jumbo frames? Can we do a quick test with
the order being 0?

Thanks,
/Ilias
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
