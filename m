Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 095D1956989
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 13:42:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B06EAC6DD94;
	Mon, 19 Aug 2024 11:42:53 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B60AEC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 11:42:46 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-371936541caso1863620f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 04:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724067766; x=1724672566;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MO3Bgs9Dy2a9RAD8UjB1CU4gKYO/Woxp4kWSfJ4CEcc=;
 b=QVoUEWDMdyk8miiAIMpgBHHjUhwY7YUhBvBTL9OdEPOExJkFGbkDs7QbhqcxvV89gv
 78MDoxLg2GS24Vc+k+bhryX3KD7V4ScQ0s9FjP8xNz1XP4+BqlkBcQk8ZgqwGbBmCBu/
 oZ7hIyMNJj5wE3K9RiNpycYDHiWWoKfVaXZpusczlEgHVBOE+vvDhfKyRCcQhrQbI9iM
 /o8SfMEtZjBBOMN8qePbinHRixoJqllPbs3wnXXkXChUWnxjDNYr1GMcBfOH5jbeCWwx
 4Kpe0iYGlexNmL58dF8FDNb08mTH1gLJdRtYUI2eJ7pakv4KGVXqsxeu/dEGxRQ/zJ1t
 nGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724067766; x=1724672566;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MO3Bgs9Dy2a9RAD8UjB1CU4gKYO/Woxp4kWSfJ4CEcc=;
 b=RTPhajYbWOv5BngRZIcpASJbwR5bu2rM16Uv/xpp4JrI8zuhJgTgLPCEDzrD00cOT3
 jRNLW0FGr1cMneV0TokoJmporYe4Y/QV429gX2w1+cIccrGwtFCgOmO9Wb4dTqK4bqTx
 iC6uab/U2I/YguyHEz6CItq0oENDnfFiV6Ka9k7Rh5hxDH+D34zj96NVKvglCL6la7ea
 wds3dWl6NhyRuoDsNSgpEF+mk++yPey8HHde7/F2R2l6Z4ViJzhmzVtGRXLMSJ0NAGtL
 rl5hWZJph4crlVczroGkfOgd2qDWJk3TuSGWg7ktLzRaDhe4Nz6o/t92VgNnWB/7yy4A
 Ic6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv34IP+m297vtf/AeSiHNucxV0MI31q8+5PdoghkUWCY6nO2V9Tuod+BdulxkKVAMpm86mstclXktbSgH3RmkWwgQZmWe5DUeLtKgQ9dUl/C3+ebx69aem
X-Gm-Message-State: AOJu0YyIv5uog1WRP9cfdBkLXJY1r1Zph6rPgaLO0RDwRSaIhH37YEF3
 1CWOncKZ3hqe18PCm7sBdYojDDtyvpnCK2Lga+pn2OL6K7QbmYVz
X-Google-Smtp-Source: AGHT+IEL53gDLjuRZcqGEa/kN5yhO0fwxMEnDdHkMbcEE+bMHmvUJLjzmajFixcoI15UC2irOx6iCg==
X-Received: by 2002:adf:e88e:0:b0:36b:d21e:bf85 with SMTP id
 ffacd0b85a97d-371a7477a4bmr4403906f8f.51.1724067765493; 
 Mon, 19 Aug 2024 04:42:45 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37195650163sm8280650f8f.98.2024.08.19.04.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 04:42:44 -0700 (PDT)
Date: Mon, 19 Aug 2024 14:42:42 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240819114242.2m6okk7bq64e437c@skbuf>
References: <cover.1724051326.git.0x1207@gmail.com>
 <cover.1724051326.git.0x1207@gmail.com>
 <28f3b68dd0e0744e851a0b9d90fdee69792fbc0f.1724051326.git.0x1207@gmail.com>
 <28f3b68dd0e0744e851a0b9d90fdee69792fbc0f.1724051326.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <28f3b68dd0e0744e851a0b9d90fdee69792fbc0f.1724051326.git.0x1207@gmail.com>
 <28f3b68dd0e0744e851a0b9d90fdee69792fbc0f.1724051326.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 6/7] net: stmmac: support fp
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

On Mon, Aug 19, 2024 at 03:25:19PM +0800, Furong Xu wrote:
> tc-taprio can select whether traffic classes are express or preemptible.
> 
> 0) tc qdisc add dev eth1 parent root handle 100 taprio \
>         num_tc 4 \
>         map 0 1 2 3 2 2 2 2 2 2 2 2 2 2 2 3 \
>         queues 1@0 1@1 1@2 1@3 \
>         base-time 1000000000 \
>         sched-entry S 03 10000000 \
>         sched-entry S 0e 10000000 \
>         flags 0x2 fp P E E E
> 
> 1) After some traffic tests, MAC merge layer statistics are all good.
> 
> Local device:
> [ {
>         "ifname": "eth1",
>         "pmac-enabled": true,
>         "tx-enabled": true,
>         "tx-active": true,
>         "tx-min-frag-size": 60,
>         "rx-min-frag-size": 60,
>         "verify-enabled": true,
>         "verify-time": 100,
>         "max-verify-time": 128,
>         "verify-status": "SUCCEEDED",
>         "statistics": {
>             "MACMergeFrameAssErrorCount": 0,
>             "MACMergeFrameSmdErrorCount": 0,
>             "MACMergeFrameAssOkCount": 0,
>             "MACMergeFragCountRx": 0,
>             "MACMergeFragCountTx": 17837,
>             "MACMergeHoldCount": 18639
>         }
>     } ]
> 
> Remote device:
> [ {
>         "ifname": "end1",
>         "pmac-enabled": true,
>         "tx-enabled": true,
>         "tx-active": true,
>         "tx-min-frag-size": 60,
>         "rx-min-frag-size": 60,
>         "verify-enabled": true,
>         "verify-time": 100,
>         "max-verify-time": 128,
>         "verify-status": "SUCCEEDED",
>         "statistics": {
>             "MACMergeFrameAssErrorCount": 0,
>             "MACMergeFrameSmdErrorCount": 0,
>             "MACMergeFrameAssOkCount": 17189,
>             "MACMergeFragCountRx": 17837,
>             "MACMergeFragCountTx": 0,
>             "MACMergeHoldCount": 0
>         }
>     } ]
> 
> Tested on DWMAC CORE 5.10a
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> index a967c6f01e4e..05b870b35947 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> @@ -933,7 +933,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  	u32 size, wid = priv->dma_cap.estwid, dep = priv->dma_cap.estdep;
>  	struct timespec64 time, current_time, qopt_time;
>  	ktime_t current_time_ns;
> -	bool fpe = false;
>  	int i, ret = 0;
>  	u64 ctr;
>  
> @@ -1018,16 +1017,12 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
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
> @@ -1058,7 +1053,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  
>  	tc_taprio_map_maxsdu_txq(priv, qopt);
>  
> -	if (fpe && !priv->dma_cap.fpesel) {
> +	if (qopt->mqprio.preemptible_tcs && !priv->dma_cap.fpesel) {
>  		mutex_unlock(&priv->est_lock);
>  		return -EOPNOTSUPP;
>  	}

This condition is dealt with by the core, now.

	if (have_preemption && !ethtool_dev_mm_supported(dev)) {
		NL_SET_ERR_MSG(extack, "Device does not support preemption");
		return -EOPNOTSUPP;
	}

where ethtool_dev_mm_supported() is implemented by issuing a get_mm()
command and seeing what it returns. There's a check for priv->dma_cap.fpesel
there already.

> @@ -1071,6 +1066,9 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  		goto disable;
>  	}
>  
> +	stmmac_fpe_set_preemptible_tcs(priv, priv->dev, qopt->mqprio.extack,
> +				       qopt->mqprio.preemptible_tcs);
> +
>  	netdev_info(priv->dev, "configured EST\n");
>  
>  	return 0;
> @@ -1089,11 +1087,8 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  		mutex_unlock(&priv->est_lock);
>  	}
>  
> -	stmmac_fpe_configure(priv, priv->ioaddr,
> -			     &priv->fpe_cfg,
> -			     priv->plat->tx_queues_to_use,
> -			     priv->plat->rx_queues_to_use,
> -			     false, false);
> +	stmmac_fpe_set_preemptible_tcs(priv, priv->dev, qopt->mqprio.extack, 0);
> +
>  	netdev_info(priv->dev, "disabled FPE\n");
>  
>  	return ret;
> -- 
> 2.34.1
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
