Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2150196C314
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 17:55:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB590C78011;
	Wed,  4 Sep 2024 15:55:51 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5506FC78010
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2024 15:55:44 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a86a69bfcdaso41230366b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Sep 2024 08:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725465344; x=1726070144;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mcX2cY1Y9Cg1FIm24tTfwc/xlRibf5mFH2JL1I2kqCI=;
 b=IIrBFVXuzH0cTWdaaFGMovBPlLUcuDUNAChIlWgKsN6HlvMVRxYxl3zt3W6mtVJWlJ
 Gibh2MxzGtSyqp70AFHScc3bKtlpP2rjpq4qyni6cEozB8fHRJIANAUPx++FxRc1wD5z
 10zuFKBHFCEzfqSHihzXqeS993ceGDQwUqODeyKNbh3H2VxyYkraZKAJ0Ez3+OelsnD0
 pNpgz/cERFXdH8voodkEpV8P4SClVPd9XQFFmNwCwRpoF3h5Y7z8rl83o7fRPyMdR7BT
 ntzjk1Rgh3HKqBdOGN1HYISvKneiXLAg/c7FT6JtxkU/x0gR4bgHm6kQm+n2xLJ5QeBy
 M/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725465344; x=1726070144;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mcX2cY1Y9Cg1FIm24tTfwc/xlRibf5mFH2JL1I2kqCI=;
 b=qZuDs0o8fa4yqwiZVb1WARACrCjivgHe/JC0jVVG07h2xfNPDYhYA4hke/O/VN4shf
 6tb5d0C+B4HYSCR1kSwYjDfACqWlJ9zvTlMSvYlx/lnnh/o0IQeAQIcvzjOmCh+e8JSj
 TeLJTZXE0FpneussIUx1oQ5OC12MVqUNOVC2VBZzz+SsUVYvKf0q0X90bAq9D7GHTOH9
 Z9TDuHHT9HiV/+3KwHIxI56MG6ndFM/ihWfapPm7LzjkXhdibGE8U7UYJ2jMb/g2pfpE
 SdjGAK9OT2jRoiMi4rvGUj+wcmRhbsNVpTrJ1uwetbWBqmwX8K0pOij5dyK9/UuJPkpe
 haew==
X-Forwarded-Encrypted: i=1;
 AJvYcCU346ZoJz9qAg/kcYSWN3pyEHANlaIviTqCAiJAopnx/ooj3kmjelF1smKvlv9iXdf1xRkNs05OnMeKew==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwEyL7blx66ffGcnIaxjZYNX0kHFxfvzsW+UAbZJZMcW+b39NNV
 aiBvXGhfgEoLLdCvyHWqmtUYnLr2IkLdcfnI6O5owX7JG8ocRTSE
X-Google-Smtp-Source: AGHT+IHCCHjeecVUu2mfuw+SZXICoUrUnjll4WII6neWRV8Wc3f3RmXhAL6+xuBDckdLKsiyVJeqRg==
X-Received: by 2002:a17:907:c21:b0:a7a:9d1e:3b28 with SMTP id
 a640c23a62f3a-a89a377d761mr766072866b.5.1725465343025; 
 Wed, 04 Sep 2024 08:55:43 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a6236d16fsm7662166b.99.2024.09.04.08.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 08:55:42 -0700 (PDT)
Date: Wed, 4 Sep 2024 18:55:39 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240904155539.mh5crdw7xqudkjur@skbuf>
References: <cover.1725441317.git.0x1207@gmail.com>
 <cover.1725441317.git.0x1207@gmail.com>
 <3bf0857f46b15980e60f3ec71acd0f80452863e4.1725441317.git.0x1207@gmail.com>
 <3bf0857f46b15980e60f3ec71acd0f80452863e4.1725441317.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3bf0857f46b15980e60f3ec71acd0f80452863e4.1725441317.git.0x1207@gmail.com>
 <3bf0857f46b15980e60f3ec71acd0f80452863e4.1725441317.git.0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 rmk+kernel@armlinux.org.uk, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v7 6/7] net: stmmac: support fp
 parameter of tc-taprio
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

On Wed, Sep 04, 2024 at 05:21:21PM +0800, Furong Xu wrote:
>  .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 23 +++++++------------
>  1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> index 9ec2e6ab81aa..2bdb22e175bc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> @@ -931,9 +931,9 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  			       struct tc_taprio_qopt_offload *qopt)
>  {
>  	u32 size, wid = priv->dma_cap.estwid, dep = priv->dma_cap.estdep;
> +	struct netlink_ext_ack *extack = qopt->mqprio.extack;
>  	struct timespec64 time, current_time, qopt_time;
>  	ktime_t current_time_ns;
> -	bool fpe = false;
>  	int i, ret = 0;
>  	u64 ctr;
>  
> @@ -1018,16 +1018,12 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  
>  		switch (qopt->entries[i].command) {
>  		case TC_TAPRIO_CMD_SET_GATES:
> -			if (fpe)
> -				return -EINVAL;
>  			break;
>  		case TC_TAPRIO_CMD_SET_AND_HOLD:
>  			gates |= BIT(0);
> -			fpe = true;
>  			break;
>  		case TC_TAPRIO_CMD_SET_AND_RELEASE:
>  			gates &= ~BIT(0);
> -			fpe = true;
>  			break;
>  		default:
>  			return -EOPNOTSUPP;
> @@ -1058,11 +1054,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  
>  	tc_taprio_map_maxsdu_txq(priv, qopt);
>  
> -	if (fpe && !priv->dma_cap.fpesel) {
> -		mutex_unlock(&priv->est_lock);
> -		return -EOPNOTSUPP;
> -	}
> -
>  	ret = stmmac_est_configure(priv, priv, priv->est,
>  				   priv->plat->clk_ptp_rate);
>  	mutex_unlock(&priv->est_lock);
> @@ -1071,6 +1062,11 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  		goto disable;
>  	}
>  
> +	ret = stmmac_fpe_map_preemption_class(priv, priv->dev, extack,
> +					      qopt->mqprio.preemptible_tcs);
> +	if (ret)
> +		goto disable;
> +

Doesn't this break taprio for those callers of tc_setup_taprio() which
do not implement fpe_map_preemption_class(), but at least want taprio
without FPE nonetheless? As in the earlier mqprio patch, they will
return -EINVAL here.

Through code inspection, those users are:
- All users of .tc = dwxgmac_tc_ops: they have .mac = &dwxlgmac2_ops or
  .mac = &dwxgmac210_ops, neither of which implements fpe_map_preemption_class().
- The users of .tc = &dwmac510_tc_ops which have .mac = &dwmac4_ops.
  Again, this does not implement .fpe_map_preemption_class().

I can only rely on code inspection, because I don't know what is the
priv->dma_cap.estsel value that the above cores were synthesized with.
Thus, I don't know if we break a feature which was available before, or
one that was already unavailable.

My suggestion is similar: allow mqprio.preemptible_tcs to go to non-zero
only if fpe_map_preemption_class() is implemented. Then, program it with
any value (including 0) only if fpe_map_preemption_class() is implemented.

>  	netdev_info(priv->dev, "configured EST\n");
>  
>  	return 0;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
