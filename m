Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9E111F400
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Dec 2019 21:36:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63E13C36B0B;
	Sat, 14 Dec 2019 20:36:29 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 033CFC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Dec 2019 20:36:27 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id r11so1324960pgf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Dec 2019 12:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=u5S8AzA/two94BW1QHz+RPP0930vQSWwKoy/1jrejMo=;
 b=lfGP0h/6gjRV3qM4YEFh2+9XY/Vn700YCuonoJZrLzUvgymJ4AwkVEjYqcRp6LBlMl
 ptZSe9eEWDPT9Af6pcwB5Rd12R0ps6Rdsue/xR4W7IWtPvk87m9rzCSv7zx66OWmUnnP
 z+6PZGJ0sQnUihfo3rijoi1qU6NsYEuNgZjWfihTdu/VKqe0oOLBGKVjw5GSBliKtM7i
 B8kAQFe6vXRShN9qPbBkACTWzJEgjbfxxzPqtB2Ahdyhg/bj+mvtc3xoousWt49dfeu3
 p30tsbDnEzZFNYY1geeh9It/aYV+mifXhi2O+iNCguBlN7RD1Z9hBxkKccDNUmUpOquF
 YeoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=u5S8AzA/two94BW1QHz+RPP0930vQSWwKoy/1jrejMo=;
 b=LtmWUmiG7Jybp9YlsTso+OeQZ87BqXp5CEHnmNkfyG/4jWBYycwN3lR4LniUGTE+5p
 wLBRZU5c9rDsorwbmzUyODSQD+Q63w/4oa8uqDtBXD+zCvNndFhJhDUqRPtyXhluyK7Z
 rtqWicx3+u2usbrOHffoXSuOP0h4SgEqnnzM/LkJbyLNEabn0mZlZMw0havyQHOvc/0r
 5mR9fJHA/U6+tlIEbMF34b9FQFfT2Nz4KlYq9X8hhHZJzDMTIKaqIIxvsD6AyVHN/gSv
 XhNBwkMP6a99JHytvkMIkJ9mzSNysZUA3V1XFSPNKC0qr6PTmcqXEY+YeC66MSdSWHWr
 JL/g==
X-Gm-Message-State: APjAAAUB6CKOhRKXR68vqpaVB0SVfkCCoNfNbKEbAv5PeWhJPfkMNHU/
 3c2AGEeFIjgiL6G9q69Sngu7rA==
X-Google-Smtp-Source: APXvYqyy2Uw5pYrnt7cqN32mxFB1vF+Q9fs1ZY/FlZ7maVgLk5Wicty7+Ay07UDDowWoZgWaopJlaA==
X-Received: by 2002:a62:ee06:: with SMTP id e6mr7100945pfi.45.1576355786428;
 Sat, 14 Dec 2019 12:36:26 -0800 (PST)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net.
 [73.202.202.92])
 by smtp.gmail.com with ESMTPSA id j28sm15493997pgb.36.2019.12.14.12.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Dec 2019 12:36:26 -0800 (PST)
Date: Sat, 14 Dec 2019 12:36:23 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20191214123623.1aeb4966@cakuba.netronome.com>
In-Reply-To: <04c000a3e0356e8bfb63e07490d8de8e081a2afe.1576007149.git.Jose.Abreu@synopsys.com>
References: <cover.1576007149.git.Jose.Abreu@synopsys.com>
 <04c000a3e0356e8bfb63e07490d8de8e081a2afe.1576007149.git.Jose.Abreu@synopsys.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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

On Tue, 10 Dec 2019 20:54:43 +0100, Jose Abreu wrote:
> @@ -2278,10 +2286,14 @@ static void stmmac_tx_timer(struct timer_list *t)
>  	 * If NAPI is already running we can miss some events. Let's rearm
>  	 * the timer and try again.
>  	 */
> -	if (likely(napi_schedule_prep(&ch->tx_napi)))
> +	if (likely(napi_schedule_prep(&ch->tx_napi))) {
> +		unsigned long flags;
> +
> +		spin_lock_irqsave(&ch->lock, flags);
> +		stmmac_disable_dma_irq(priv, priv->ioaddr, ch->index, 0, 1);
> +		spin_unlock_irqrestore(&ch->lock, flags);
>  		__napi_schedule(&ch->tx_napi);
> -	else
> -		mod_timer(&tx_q->txtimer, STMMAC_COAL_TIMER(10));

You should also remove the comment above the if statement if it's
really okay to no longer re-arm the timer. No?

> +	}
>  }
>  
>  /**

> @@ -3759,24 +3777,18 @@ static int stmmac_napi_poll_tx(struct napi_struct *napi, int budget)
>  	struct stmmac_channel *ch =
>  		container_of(napi, struct stmmac_channel, tx_napi);
>  	struct stmmac_priv *priv = ch->priv_data;
> -	struct stmmac_tx_queue *tx_q;
>  	u32 chan = ch->index;
>  	int work_done;
>  
>  	priv->xstats.napi_poll++;
>  
> -	work_done = stmmac_tx_clean(priv, DMA_TX_SIZE, chan);
> -	work_done = min(work_done, budget);
> -
> -	if (work_done < budget)
> -		napi_complete_done(napi, work_done);
> +	work_done = stmmac_tx_clean(priv, budget, chan);
> +	if (work_done < budget && napi_complete_done(napi, work_done)) {

Not really related to this patch, but this looks a little suspicious. 
I think the TX completions should all be processed regardless of the
budget. The budget is for RX.

> +		unsigned long flags;
>  
> -	/* Force transmission restart */
> -	tx_q = &priv->tx_queue[chan];
> -	if (tx_q->cur_tx != tx_q->dirty_tx) {
> -		stmmac_enable_dma_transmission(priv, priv->ioaddr);
> -		stmmac_set_tx_tail_ptr(priv, priv->ioaddr, tx_q->tx_tail_addr,
> -				       chan);
> +		spin_lock_irqsave(&ch->lock, flags);
> +		stmmac_enable_dma_irq(priv, priv->ioaddr, chan, 0, 1);
> +		spin_unlock_irqrestore(&ch->lock, flags);
>  	}
>  
>  	return work_done;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
