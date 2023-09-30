Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C2A7B4032
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Sep 2023 14:04:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFDC0C6B47A;
	Sat, 30 Sep 2023 12:04:34 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55C0AC6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Sep 2023 12:04:33 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-40652e570d9so26584095e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Sep 2023 05:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696075473; x=1696680273;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=y1aX76wnxIZc/qepBCMoxahwj6U8pp0kTrNtby/mtII=;
 b=Mq+7g7mYzopz07YtO8VP9ZyYyhEHlzc9tp5qaiqww7scY+51qHUy63eLWBfh/ZcOy1
 yAp+6QHvcro8E3QLCgcwnUk8u+E+dMYyJ5AcfdisHMB2p1qysCWlxxslDvw5UouhKYvR
 Ea+8hy5SbBevNxOk4frKXpnBKHAmPRhPPxAmqwiCfGxAp0km/J3FnUhkWxRylZPG9AD0
 r6jSjEHo9AYZ/Obv0KtHPU3qpuRas61JxMIOiBbkw/QgYY93EBU+/S3nH08sf3A5l9Dp
 mrJhya8wj9Mpnjpz0tuZ1ip8XBjG65jtrepnYRHpj2PFG1zs6PZY+9+uw45KFVhTjDP5
 pWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696075473; x=1696680273;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y1aX76wnxIZc/qepBCMoxahwj6U8pp0kTrNtby/mtII=;
 b=bCV0mhhT1Ty3j18amyTMeQPgo9wJIO3PZYfvSPUUs/iSpu5FJch25qR29wcbHZPa/P
 cqmGFoabvH31RyMX9nxPFVpBq9hifCN3DVWX5o09bPLbMev2Wn5MtZVmI5/dxa+XCMMN
 MoL1qi1AB66uW1yOVPGf0imFkH5tvY8GsKyTmXVBmSxBdiK0TPVy9VOcjS4pprfrmYiL
 Cq99QNyArmfFR3cUkqJfNRR+S1KB2MW7E47QVXFW3UrfqFjw3hyp9AHIm9h0TGETJ2KX
 A2dIvg3LNTDJuSlUvyrl85S7keQLzDz57DurzhoyUGuAvE+yLvp0sCnk2J4dV804yR8f
 q9Sg==
X-Gm-Message-State: AOJu0YwX7ljVt4ylUzq/bRNbwVTaeB0LlDxcDxi+wf1CZ/pfvTGE70cW
 ICutZ02lDyxRVaqmunbYHBI=
X-Google-Smtp-Source: AGHT+IF/09054jO/NN87gwAvDg9HEwLTvzP+yEzINsQIqa4JrVOm5cj6VxTTRZevsBs3NYcn6qIy1w==
X-Received: by 2002:a05:600c:2317:b0:402:f5c4:2e5a with SMTP id
 23-20020a05600c231700b00402f5c42e5amr6281596wmo.37.1696075472327; 
 Sat, 30 Sep 2023 05:04:32 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
 by smtp.gmail.com with ESMTPSA id
 c19-20020a05600c0ad300b00405c33a9a12sm2415923wmr.0.2023.09.30.05.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Sep 2023 05:04:31 -0700 (PDT)
Message-ID: <65180ecf.050a0220.10a98.7a51@mx.google.com>
X-Google-Original-Message-ID: <ZRgOzeSsTmTOhCdo@Ansuel-xps.>
Date: Sat, 30 Sep 2023 14:04:29 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vincent Whitchurch <Vincent.Whitchurch@axis.com>
References: <20230922111247.497-1-ansuelsmth@gmail.com>
 <20230922111247.497-2-ansuelsmth@gmail.com>
 <0a62a2b6bff4fd01065e0de6a8703c96e344f1dc.camel@axis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0a62a2b6bff4fd01065e0de6a8703c96e344f1dc.camel@axis.com>
Cc: "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "pkshih@realtek.com" <pkshih@realtek.com>,
 "jiri@resnulli.us" <jiri@resnulli.us>, "horms@kernel.org" <horms@kernel.org>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "kvalo@kernel.org" <kvalo@kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "liuhangbin@gmail.com" <liuhangbin@gmail.com>,
 "rajur@chelsio.com" <rajur@chelsio.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [net-next PATCH 2/3] net: stmmac: improve TX
	timer arm logic
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, Sep 29, 2023 at 12:38:48PM +0000, Vincent Whitchurch wrote:
> On Fri, 2023-09-22 at 13:12 +0200, Christian Marangi wrote:
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 9201ed778ebc..14bf6fae6662 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -2994,13 +2994,25 @@ static void stmmac_tx_timer_arm(struct stmmac_p=
riv *priv, u32 queue)
> > =A0{
> > =A0	struct stmmac_tx_queue *tx_q =3D &priv->dma_conf.tx_queue[queue];
> > =A0	u32 tx_coal_timer =3D priv->tx_coal_timer[queue];
> > +	struct stmmac_channel *ch;
> > +	struct napi_struct *napi;
> > =A0
> > =

> > =A0	if (!tx_coal_timer)
> > =A0		return;
> > =A0
> > =

> > -	hrtimer_start(&tx_q->txtimer,
> > -		      STMMAC_COAL_TIMER(tx_coal_timer),
> > -		      HRTIMER_MODE_REL);
> > +	ch =3D &priv->channel[tx_q->queue_index];
> > +	napi =3D tx_q->xsk_pool ? &ch->rxtx_napi : &ch->tx_napi;
> > +
> > +	/* Arm timer only if napi is not already scheduled.
> > +	 * Try to cancel any timer if napi is scheduled, timer will be armed
> > +	 * again in the next scheduled napi.
> > +	 */
> > +	if (unlikely(!napi_is_scheduled(napi)))
> > +		hrtimer_start(&tx_q->txtimer,
> > +			      STMMAC_COAL_TIMER(tx_coal_timer),
> > +			      HRTIMER_MODE_REL);
> > +	else
> > +		hrtimer_try_to_cancel(&tx_q->txtimer);
> =

> When this function is called from within the napi poll function
> (stmmac_tx_clean()), NAPI_STATE_SCHED will always be set and so after
> this patch the "We still have pending packets, let's call for a new
> scheduling" logic will never start the timer.  Was that really
> intentional?
>

No and understanding the code flow of napi and tx-coal is hard... (also
problem with tx coal arise only with real world scenario and now with
synthetic tests like iperf.

I will shortly send a v2 of this that will just move the logic of arming
the TX timer outside napi call after DMA interrupt is enabled again.
Currently testing the new version on openwrt with ipq806x hoping
everything is good.

(same perf increase observed but no queue timeout)

-- =

	Ansuel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
