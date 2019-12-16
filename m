Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4027F121AB5
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2019 21:14:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF9E7C36B0B;
	Mon, 16 Dec 2019 20:14:18 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF1A2C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2019 20:14:17 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id n25so5244200lfl.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2019 12:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=SBA8qsH74joROaQ7qUDtcV487nsBL4T4WgclmBa0Frc=;
 b=ku4jjLQyhZhXcIGu4nZIjg8rbK20un3MtB+TCOZXShMDtjr2HGOaRu9he7uOTF7Cih
 T3brX3yh+ceFv1ntlhNGLP08m0V9P/WctQ31kCqVPwTi11yHvWDB5zIM2L5gdtJU0t6C
 toL5piqJBqXKVfkIh8mA39aWi5VXl3mGdfXtivjFonFdjVGqYWA8jh0Vc6d9QCyAkARu
 JsEfg1+SXICLbj/4yY8AtlA1Ik7ZG/HN0JzGkdvM1S4w9ncr2eYD6CVNrpouMnS8Sv2w
 5TLiAlvSGrxO3NlzrooXpjw9JCEb10909JKvwfctiyJBYaKdJw18ww6wndKPu+6NMY0+
 zznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=SBA8qsH74joROaQ7qUDtcV487nsBL4T4WgclmBa0Frc=;
 b=kLii0gwKnbhfPZS5oagvK1oGDAX4MEoHpWgxF4Lt7R2f5maIQrGnPS+Hdj1OZ3nRmX
 18kKzDB2adCI0j2psQs6XNOnyHf5u/o0BInYlRutrBOr+AnhOUtkw8xwUzl9gy60UHL6
 def8vX9R8Crccjrg5phiQd8ZEowcAEOj3g6cNTCLpIfdQDeYrS00ypaW+dcYiuvnRl8D
 RaU/EHATTgzIteEDFl8a7tsZ3to996JqzWR+M1rLxge3yfjJkUC1edt5WziiMkVIzyP+
 Fr7iofVHBXX8OLfkI61woiu4+CfG58lBiSrrC1EIzr/17xTeiuliAHJFutPpJrpj6B79
 MMtw==
X-Gm-Message-State: APjAAAXX3csT3mEdq2ogTIeJihjTuSyb6IN4NZ3HodB4EZlPadX3rlkL
 wyvSz1FW+QN+hu++yPpSamqkUA==
X-Google-Smtp-Source: APXvYqxKjc/fsBTpIng96/mIdsynKS0oePdJPNDLm9lKBC2UNlCq0QkEhG6AghBZJ/xPXJHMxWvS4w==
X-Received: by 2002:ac2:5635:: with SMTP id b21mr512845lff.127.1576527257085; 
 Mon, 16 Dec 2019 12:14:17 -0800 (PST)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id 192sm9615625lfh.28.2019.12.16.12.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 12:14:16 -0800 (PST)
Date: Mon, 16 Dec 2019 12:14:04 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20191216121404.43966b89@cakuba.netronome.com>
In-Reply-To: <BN8PR12MB3266288303A6CA6C3CAA5E6CD3510@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <cover.1576007149.git.Jose.Abreu@synopsys.com>
 <04c000a3e0356e8bfb63e07490d8de8e081a2afe.1576007149.git.Jose.Abreu@synopsys.com>
 <20191214123623.1aeb4966@cakuba.netronome.com>
 <BN8PR12MB3266288303A6CA6C3CAA5E6CD3510@BN8PR12MB3266.namprd12.prod.outlook.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next 3/4] net: stmmac: Let TX and RX
 interrupts be independently enabled/disabled
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

On Mon, 16 Dec 2019 09:18:50 +0000, Jose Abreu wrote:
> > > @@ -3759,24 +3777,18 @@ static int stmmac_napi_poll_tx(struct napi_struct *napi, int budget)
> > >  	struct stmmac_channel *ch =
> > >  		container_of(napi, struct stmmac_channel, tx_napi);
> > >  	struct stmmac_priv *priv = ch->priv_data;
> > > -	struct stmmac_tx_queue *tx_q;
> > >  	u32 chan = ch->index;
> > >  	int work_done;
> > >  
> > >  	priv->xstats.napi_poll++;
> > >  
> > > -	work_done = stmmac_tx_clean(priv, DMA_TX_SIZE, chan);
> > > -	work_done = min(work_done, budget);
> > > -
> > > -	if (work_done < budget)
> > > -		napi_complete_done(napi, work_done);
> > > +	work_done = stmmac_tx_clean(priv, budget, chan);
> > > +	if (work_done < budget && napi_complete_done(napi, work_done)) {  
> > 
> > Not really related to this patch, but this looks a little suspicious. 
> > I think the TX completions should all be processed regardless of the
> > budget. The budget is for RX.  
> 
> Well but this is a TX NAPI ... Shouldn't it be limited to prevent CPU 
> starvation ?

It is a bit confusing, but at least netpoll expects the TX completions
to be processed with zero budget. Check out poll_one_napi().
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
