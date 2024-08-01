Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4AC9454D9
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 01:16:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5E28C712A1;
	Thu,  1 Aug 2024 23:16:36 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8F1EC7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Aug 2024 23:16:29 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a7a8553db90so1021077166b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Aug 2024 16:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722554189; x=1723158989;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vRHY8LMAMsDzYIYRh2DEhqf/+ZSkBDumcnyt9s3s3SU=;
 b=aPhZVS2wRgkDnn1tzyzwoVkD1bJlqPLgegHk6fEdjP4xx0bXi0kwT6MZiwETJ7OBfC
 wSYsUiu9WXN2IeW5xNg1miX5tduHdS+89wNlsrBiYu0qs4drh1pZy7+9YF2zEJK3QlLq
 jWxfoDplIxO/hPBmGuU13mEPEsHEBtjqphQgvZ6x69QCb5f3fCZsNmOung7xAkTHDTjz
 HPq/ZyKz1+/QkOkon+/FuCvQbSKrPRQsAlDqPKGqYiV6ZpValy48vdV1lJXV/itORGvQ
 T1wBza/Ql9PxVmKYm+jyMiLVRvtKLOBZ+b11hGKBETmqYYxAA7f5EeednXE03fVTDqRR
 Wllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722554189; x=1723158989;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vRHY8LMAMsDzYIYRh2DEhqf/+ZSkBDumcnyt9s3s3SU=;
 b=RHirC28EkY1VN3xw3IBF4HAd2qegzGdsx+v1sr2tCc/9g+wwp0P+wq5TDfl5vKs0Nf
 PAtSP6So2/esRl0BKjm+dzvOdPb+Y8MZ2THi2bNatb1BViaUmzYXJ5i42N5ukyrkbQv1
 RWhfrpSse/DfkUIcqiZDzozYFI/m81lOwa2lCdeuAJC2tqy4sVc+kqt3G+qb6po7dfG7
 PU6/YW/83/aR29e7QdTGxGkCh5/Agu039txcl6CEG97oHSZjOT+6pve2ho96AbBZqQl4
 KwjG1Tl5bqzlzM9GHfg3C1Jq3CougPwr1DTdBwXSZxb8P02u467hlmSWVrWuLPjWjr/N
 71+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtwNT9KGTM6X5H6LSIFdKaB8u5vgek5Jn3GKz2uX/ZO8JxSYWPYBn7N7CECPXFppu+2YgkXTPqlzkTHFBEDj9GdS80aksFtyMYofDkFMoQ4o1ijWcTO8KZ
X-Gm-Message-State: AOJu0YxCjNFQDKlSQhLW2krBJI5TOvrWoJtG33dlND66ZKVHuQylu5Dp
 CGzuO1cvEyC/p/vfuUOlO/7AiRmXcg6pYUKk09LMsB0ZZlkIzQF1
X-Google-Smtp-Source: AGHT+IEsxgfvGijlQDD+0yGHl9Bv4Sl5rFZvFBX00pRtsgyK5toVPnhYX03gaMnFF/r02MjdVSWnNg==
X-Received: by 2002:a17:907:3f28:b0:a7a:acae:3415 with SMTP id
 a640c23a62f3a-a7dc4db4b08mr146394566b.10.1722554188713; 
 Thu, 01 Aug 2024 16:16:28 -0700 (PDT)
Received: from skbuf ([188.25.135.70]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bcada0sm30237866b.31.2024.08.01.16.16.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 16:16:27 -0700 (PDT)
Date: Fri, 2 Aug 2024 02:16:25 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240801231625.uqa4gq7vokp63dfp@skbuf>
References: <cover.1722421644.git.0x1207@gmail.com>
 <4603a4f68616ce41aca97bac2f55e5d51c865f53.1722421644.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4603a4f68616ce41aca97bac2f55e5d51c865f53.1722421644.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, rock.xu@nio.com,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 3/5] net: stmmac: support fp
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

On Wed, Jul 31, 2024 at 06:43:14PM +0800, Furong Xu wrote:
> tc-taprio can select whether traffic classes are express or preemptible.
> 
> After some traffic tests, MAC merge layer statistics are all good.
> 
> Local device:
> ethtool --include-statistics --json --show-mm eth1
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
>             "MACMergeFragCountTx": 1398,
>             "MACMergeHoldCount": 15783
>         }
>     } ]
> 
> Remote device:
> ethtool --include-statistics --json --show-mm eth1
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
>             "MACMergeFrameAssOkCount": 1388,
>             "MACMergeFragCountRx": 1398,
>             "MACMergeFragCountTx": 0,
>             "MACMergeHoldCount": 0
>         }
>     } ]
> 
> Tested on DWMAC CORE 5.10a
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 34 ++-----------------
>  1 file changed, 3 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> index 494fe2f68300..eeb5eb453b98 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> @@ -943,7 +943,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  	u32 size, wid = priv->dma_cap.estwid, dep = priv->dma_cap.estdep;
>  	struct timespec64 time, current_time, qopt_time;
>  	ktime_t current_time_ns;
> -	bool fpe = false;
>  	int i, ret = 0;
>  	u64 ctr;
>  
> @@ -1028,16 +1027,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  
>  		switch (qopt->entries[i].command) {
>  		case TC_TAPRIO_CMD_SET_GATES:
> -			if (fpe)
> -				return -EINVAL;
> -			break;
> -		case TC_TAPRIO_CMD_SET_AND_HOLD:
> -			gates |= BIT(0);
> -			fpe = true;
> -			break;
> -		case TC_TAPRIO_CMD_SET_AND_RELEASE:
> -			gates &= ~BIT(0);
> -			fpe = true;

I don't think these can go.

In the DWMAC5 manual, I see:
"To enable the support of hold and release operations, the format of the
GCL is slightly changed while configuring and enabling the FPE. The first Queue (Q0) is always programmed to carry preemption
traffic and therefore it is always Open. The bit corresponding to Q0 is renamed as Release/Hold MAC control. The TX Queues
whose packets are preemptable are indicated by setting the PEC field of the MTL_FPE_CTRL_STS register. The GCL bit of the
corresponding Queue are ignored and considered as always "Open". So, even if the software writes a "0" ("C"), it is ignored for
such queues."

It's relatively clear to me that this is what the "gates" variable is
doing here - it's modulating when preemptible traffic begins to be
"held", and when it is "released".

Now, the "fpe" variable - that can definitely go.

>  			break;
>  		default:
>  			return -EOPNOTSUPP;

Also, this is more general advice. If TC_TAPRIO_CMD_SET_AND_HOLD and
TC_TAPRIO_CMD_SET_AND_RELEASE used to work as UAPI input into this
driver, you don't want to break that now by letting those fall into the
default -EOPNOTSUPP case. What worked must continue to work... somehow.

> @@ -1068,16 +1057,11 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  
>  	tc_taprio_map_maxsdu_txq(priv, qopt);
>  
> -	if (fpe && !priv->dma_cap.fpesel) {
> +	if (qopt->mqprio.preemptible_tcs && !priv->dma_cap.fpesel) {
>  		mutex_unlock(&priv->est_lock);
>  		return -EOPNOTSUPP;
>  	}
>  
> -	/* Actual FPE register configuration will be done after FPE handshake
> -	 * is success.
> -	 */
> -	priv->plat->fpe_cfg->enable = fpe;
> -
>  	ret = stmmac_est_configure(priv, priv, priv->est,
>  				   priv->plat->clk_ptp_rate);
>  	mutex_unlock(&priv->est_lock);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
