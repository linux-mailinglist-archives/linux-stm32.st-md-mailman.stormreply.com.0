Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F9696BF94
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 16:05:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54EBDC78011;
	Wed,  4 Sep 2024 14:05:00 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82571C78010
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2024 14:04:53 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42bb9c04fa5so8271465e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Sep 2024 07:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725458693; x=1726063493;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pcSQHDuFZNW8f8jn2HlyrNAfmNzNkeFSHZv2Ikhhg8I=;
 b=iURoiClzm4x5+U09gzm3ALdpND8DI+6J1QER5QruTbptJb/ROl+lue4vMZ4DylhSzn
 TSCMYyQ1vq0sja4Pj1+eZm1FedmNraIkbm2u1cgHnBwlngnSsCMWtZu1zR3HfQGnfLOs
 jVg09NLVPG1S1ZgvsILv0w6YhGzP9an6kAvMb5iwS+Q5KAU/Ylg6x3N0xIOlp2de1M8z
 OeuayqkHM0ezRi2i/kpCGBzJGf6Sneh73rdJRAMLjhbqfXM0eL7dgrQr3wFLVE9mbuAn
 Dui3GONoEptYjmASxmOKciiRCfm3O1URchyMithmVrhDmVxjfNs+d4SDRDHTp1jk8hnB
 o5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725458693; x=1726063493;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pcSQHDuFZNW8f8jn2HlyrNAfmNzNkeFSHZv2Ikhhg8I=;
 b=BkCChDtoXRCAyOVCLP27V3NZe5jrpk4wSIex+SFcAoIR1EvIeMmNv6S+jSssRIN75z
 8iUtrs2oGTgzkfq8elt+zp391pXrkOLFKilj59pVoWV9U/HYKk6yiE7l5zi3T5e08N8s
 2B1UD9SRK4T+uUgb+fhI1gXK/pWHsHJNdolPV6vWTKNfkzv6KdYIC1SXglyOckeISZDR
 ItPP+HcXgs3UHXVcZzdbVfDW/kj9wcPM54OCvjIz/0CNqMhWnSA9SIPoQpR6SdLSsNUo
 9Du7BBqmPrhvkPq5DTi0fSORviEmBiOipLa6mmylU+tjfaJqdRy7fr0+bSJLTxDEU8lA
 HpQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXqLnx2A5C4sp0Np7uZpVE/Yvv+xdwM333vo3+6FO9Z8lIGXksBiCdLbaFHY2iqfBDe+Q4EmkuOYwKHg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwDawkcikHxmIg8fS1iNbzszGmeU6tMun3Pr/iuGY0CKSQ7xsKr
 ZzLKXYJlBumVCXY5dJ8YBFxO+Izhzs3ewMnwfn80EqNLcf8yU1VU
X-Google-Smtp-Source: AGHT+IFwd43mImwMibDfu+DajpXj0lE+8R58B0kaRqv52bm6izGdfKSggdaX92YjEflO0z3LrM32tw==
X-Received: by 2002:a05:600c:1554:b0:425:6962:4253 with SMTP id
 5b1f17b1804b1-42bbb43d5e4mr71495425e9.4.1725458691917; 
 Wed, 04 Sep 2024 07:04:51 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374cf7e2dbfsm7060858f8f.37.2024.09.04.07.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 07:04:51 -0700 (PDT)
Date: Wed, 4 Sep 2024 17:04:48 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240904140448.6hvjzj3ei2k7jdbe@skbuf>
References: <cover.1725441317.git.0x1207@gmail.com>
 <1e452525e496b28c0b1ea43afbdc3533c92930c6.1725441317.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1e452525e496b28c0b1ea43afbdc3533c92930c6.1725441317.git.0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 rmk+kernel@armlinux.org.uk, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v7 3/7] net: stmmac: refactor FPE
 verification process
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

On Wed, Sep 04, 2024 at 05:21:18PM +0800, Furong Xu wrote:
> +/**
> + * stmmac_fpe_verify_timer - Timer for MAC Merge verification
> + * @t:  timer_list struct containing private info
> + *
> + * Verify the MAC Merge capability in the local TX direction, by
> + * transmitting Verify mPackets up to 3 times. Wait until link
> + * partner responds with a Response mPacket, otherwise fail.
> + */
> +static void stmmac_fpe_verify_timer(struct timer_list *t)
>  {
> -	struct stmmac_priv *priv = container_of(work, struct stmmac_priv,
> -						fpe_task);
> -	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
> -	enum stmmac_fpe_state *lo_state = &fpe_cfg->lo_fpe_state;
> -	enum stmmac_fpe_state *lp_state = &fpe_cfg->lp_fpe_state;
> -	bool *hs_enable = &fpe_cfg->hs_enable;
> -	bool *enable = &fpe_cfg->enable;
> -	int retries = 20;
> -
> -	while (retries-- > 0) {
> -		/* Bail out immediately if FPE handshake is OFF */
> -		if (*lo_state == FPE_STATE_OFF || !*hs_enable)
> -			break;
> -
> -		if (*lo_state == FPE_STATE_ENTERING_ON &&
> -		    *lp_state == FPE_STATE_ENTERING_ON) {
> -			stmmac_fpe_configure(priv, priv->ioaddr,
> -					     fpe_cfg,
> -					     priv->plat->tx_queues_to_use,
> -					     priv->plat->rx_queues_to_use,
> -					     *enable);
> -
> -			netdev_info(priv->dev, "configured FPE\n");
> +	struct stmmac_fpe_cfg *fpe_cfg = from_timer(fpe_cfg, t, verify_timer);
> +	struct stmmac_priv *priv = container_of(fpe_cfg, struct stmmac_priv,
> +						fpe_cfg);
> +	struct ethtool_mm_state *state = &fpe_cfg->state;
> +	unsigned long flags;
> +	bool rearm = false;
>  
> -			*lo_state = FPE_STATE_ON;
> -			*lp_state = FPE_STATE_ON;
> -			netdev_info(priv->dev, "!!! BOTH FPE stations ON\n");
> -			break;
> -		}
> +	spin_lock_irqsave(&fpe_cfg->lock, flags);
>  
> -		if ((*lo_state == FPE_STATE_CAPABLE ||
> -		     *lo_state == FPE_STATE_ENTERING_ON) &&
> -		     *lp_state != FPE_STATE_ON) {
> -			netdev_info(priv->dev, SEND_VERIFY_MPAKCET_FMT,
> -				    *lo_state, *lp_state);
> +	switch (state->verify_status) {
> +	case ETHTOOL_MM_VERIFY_STATUS_INITIAL:
> +	case ETHTOOL_MM_VERIFY_STATUS_VERIFYING:
> +		if (fpe_cfg->verify_retries != 0) {
>  			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
> -						fpe_cfg,
> -						MPACKET_VERIFY);
> +						fpe_cfg, MPACKET_VERIFY);
> +			rearm = true;
> +		} else {
> +			state->verify_status = ETHTOOL_MM_VERIFY_STATUS_FAILED;
>  		}
> -		/* Sleep then retry */
> -		msleep(500);
> +
> +		fpe_cfg->verify_retries--;
> +	break;

Odd indentation... "break;" should be on the same level with the code,
not with the "case" statements. Not sure which editor you use, but even
if you hit "==" in vim on this line, it will shift it by one tab to the
right.

> +
> +	case ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED:
> +		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
> +				     priv->plat->tx_queues_to_use,
> +				     priv->plat->rx_queues_to_use,
> +				     true, true);
> +	break;

Same comment here and below.

> +
> +	default:
> +	break;
> +	}
> +
> +	if (rearm) {
> +		mod_timer(&fpe_cfg->verify_timer,
> +			  jiffies + msecs_to_jiffies(state->verify_time));
>  	}
>  
> -	clear_bit(__FPE_TASK_SCHED, &priv->fpe_task_state);
> +	spin_unlock_irqrestore(&fpe_cfg->lock, flags);
> +}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
