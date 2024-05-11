Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCE98C330D
	for <lists+linux-stm32@lfdr.de>; Sat, 11 May 2024 20:02:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B777EC6907A;
	Sat, 11 May 2024 18:02:08 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F541C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 May 2024 18:02:01 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2e3e18c24c1so30393481fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 May 2024 11:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715450520; x=1716055320;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Dp1FBV890Rr8xYuH1p15alQ7JOm1monzCoypwIt+8aw=;
 b=EZWMf7vAiMUL8ofaCJp3FiB76olrGpmub994aZA/2UlGbdY2ChglYR24Ah1Gzo7yXy
 lzqrMa5Htoxwm9r+aQ8BHC6wy7duY/Xf2Pw23EvloPDxmx8aRT1xCDDVMWGaXJ7ksD/e
 rU88qUTMPoXDONTWdjdR6qysdJcQxC/UPyZYoaKKJpoWR8wMil6wKvG696qTMUnMSnbG
 NxzGZwVooEcI7pI8jaVI5jL48jX+oUlb1UVL5uKa5voSUPpvSe6LJXOTp+E2AKVtHB0u
 wv7Q/sCvYhtbO4j9cp+P66qPFyAOgjTJtpqbYrIDEvOrhQkrfqiMgKsQuBYmVi9Nuq3f
 qzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715450520; x=1716055320;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dp1FBV890Rr8xYuH1p15alQ7JOm1monzCoypwIt+8aw=;
 b=L+uiBePqjFITRw7Z8+d2WuHN3ppJCddhVRQzH3PCcxkRKwH/qQom2SAKAsFpH1JlOt
 iSnHAGhoE/2FtV91hOu7a9VJjZRjeueW5acoz2MpK4Fl4zmNzFk/M9Lqg6pMYvOH+6LC
 hv9WtdmNvjPWtrtFQAto4YebIngnc/w2ZfXzm8au0SH8f7mOXZjkMQ/fF4jHXvHb98+q
 NFCKzuAQ+Kbjc9Y4XdEiiyQFHcWP49JJDklMeq7B8vhwXFvQQjmTzfczm1n9AIobzVpD
 nhZgUG5kpMtwdyHO2OkYy4QFqYbL0bw4IWe9uZy9VhwoVCdZywF2O6PuwX+mBqeYhwmp
 APiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY28lD/i5e3V76T/uOyoByKqFhu6n/HglvnNH+3Ge8chPcshsVTukd1qfoWFHYroy/MJHDhet/hmWu4jsx8tYGLCZ5HVlcF9Vx2Vhg8xrUvsxwweWHDTnZ
X-Gm-Message-State: AOJu0Yx31Pz1ZygZVu51Ln1Hjplpkrp2R2D/7JjXaGFCYuygsPZM3+V0
 Dzq0xzMaeNRNee1UoNoo7DYUzYXmlutdKFuFN1kEuvOU2/le8pq1
X-Google-Smtp-Source: AGHT+IGfy4kPvQK5vwPPlsebwBxmmcuk4Ux0iviSNZQuyb9wNvuZXbDZEH2WwSlxm+oMOj2wMWD2kA==
X-Received: by 2002:a2e:3217:0:b0:2e5:4b96:ccb3 with SMTP id
 38308e7fff4ca-2e54b96d1f4mr27798311fa.48.1715450520117; 
 Sat, 11 May 2024 11:02:00 -0700 (PDT)
Received: from mobilestation ([95.79.182.53]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d1620071sm8020021fa.106.2024.05.11.11.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 May 2024 11:01:59 -0700 (PDT)
Date: Sat, 11 May 2024 21:01:57 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Message-ID: <r3mcmjyestwft4vrhg4wsgfrw6khxo4rhbags46igoc54qvnv2@v5nc6qr47xms>
References: <20240510122155.3394723-1-xiaolei.wang@windriver.com>
 <20240510122155.3394723-2-xiaolei.wang@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240510122155.3394723-2-xiaolei.wang@windriver.com>
Cc: linux-kernel@vger.kernel.org, horms@kernel.org,
 bartosz.golaszewski@linaro.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, rohan.g.thomas@intel.com, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, ahalaney@redhat.com
Subject: Re: [Linux-stm32] [net PATCH v5 1/2] net: stmmac: move the EST lock
 to struct stmmac_priv
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

On Fri, May 10, 2024 at 08:21:54PM +0800, Xiaolei Wang wrote:
> Reinitialize the whole EST structure would also reset the mutex
> lock which is embedded in the EST structure, and then trigger
> the following warning. To address this, move the lock to struct
> stmmac_priv. We also need to reacquire the mutex lock when doing
> this initialization.
> 
> DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> WARNING: CPU: 3 PID: 505 at kernel/locking/mutex.c:587 __mutex_lock+0xd84/0x1068
>  Modules linked in:
>  CPU: 3 PID: 505 Comm: tc Not tainted 6.9.0-rc6-00053-g0106679839f7-dirty #29
>  Hardware name: NXP i.MX8MPlus EVK board (DT)
>  pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>  pc : __mutex_lock+0xd84/0x1068
>  lr : __mutex_lock+0xd84/0x1068
>  sp : ffffffc0864e3570
>  x29: ffffffc0864e3570 x28: ffffffc0817bdc78 x27: 0000000000000003
>  x26: ffffff80c54f1808 x25: ffffff80c9164080 x24: ffffffc080d723ac
>  x23: 0000000000000000 x22: 0000000000000002 x21: 0000000000000000
>  x20: 0000000000000000 x19: ffffffc083bc3000 x18: ffffffffffffffff
>  x17: ffffffc08117b080 x16: 0000000000000002 x15: ffffff80d2d40000
>  x14: 00000000000002da x13: ffffff80d2d404b8 x12: ffffffc082b5a5c8
>  x11: ffffffc082bca680 x10: ffffffc082bb2640 x9 : ffffffc082bb2698
>  x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 : 0000000000000001
>  x5 : ffffff8178fe0d48 x4 : 0000000000000000 x3 : 0000000000000027
>  x2 : ffffff8178fe0d50 x1 : 0000000000000000 x0 : 0000000000000000
>  Call trace:
>   __mutex_lock+0xd84/0x1068
>   mutex_lock_nested+0x28/0x34
>   tc_setup_taprio+0x118/0x68c
>   stmmac_setup_tc+0x50/0xf0
>   taprio_change+0x868/0xc9c
> 
> Fixes: b2aae654a479 ("net: stmmac: add mutex lock to protect est parameters")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h   |  2 ++
>  .../net/ethernet/stmicro/stmmac/stmmac_ptp.c   |  8 ++++----
>  .../net/ethernet/stmicro/stmmac/stmmac_tc.c    | 18 ++++++++++--------
>  include/linux/stmmac.h                         |  1 -
>  4 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index dddcaa9220cc..64b21c83e2b8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -261,6 +261,8 @@ struct stmmac_priv {
>  	struct stmmac_extra_stats xstats ____cacheline_aligned_in_smp;
>  	struct stmmac_safety_stats sstats;
>  	struct plat_stmmacenet_data *plat;

> +	/* Protect est parameters */
> +	struct mutex est_lock;

Not the best place to have the EST-related things in the structure.
The point is to place the most frequently utilized fields together so
to have a single L1-cache line for all of them. In this case it's
statistics fields, plat-pointer, HW-capabilities, MMC-counters, etc.
EST doesn't seem like that much popular feature. I would have it moved
someplace around TC fields.

In anyway I'll leave it for the maintainers to decide whether it's
worth taking my note into account. Other than the nitpick above the
change looks good. Thanks.

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

>  	struct dma_features dma_cap;
>  	struct stmmac_counters mmc;
>  	int hw_cap_support;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> index e04830a3a1fb..0c5aab6dd7a7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> @@ -70,11 +70,11 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
>  	/* If EST is enabled, disabled it before adjust ptp time. */
>  	if (priv->plat->est && priv->plat->est->enable) {
>  		est_rst = true;
> -		mutex_lock(&priv->plat->est->lock);
> +		mutex_lock(&priv->est_lock);
>  		priv->plat->est->enable = false;
>  		stmmac_est_configure(priv, priv, priv->plat->est,
>  				     priv->plat->clk_ptp_rate);
> -		mutex_unlock(&priv->plat->est->lock);
> +		mutex_unlock(&priv->est_lock);
>  	}
>  
>  	write_lock_irqsave(&priv->ptp_lock, flags);
> @@ -87,7 +87,7 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
>  		ktime_t current_time_ns, basetime;
>  		u64 cycle_time;
>  
> -		mutex_lock(&priv->plat->est->lock);
> +		mutex_lock(&priv->est_lock);
>  		priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
>  		current_time_ns = timespec64_to_ktime(current_time);
>  		time.tv_nsec = priv->plat->est->btr_reserve[0];
> @@ -104,7 +104,7 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
>  		priv->plat->est->enable = true;
>  		ret = stmmac_est_configure(priv, priv, priv->plat->est,
>  					   priv->plat->clk_ptp_rate);
> -		mutex_unlock(&priv->plat->est->lock);
> +		mutex_unlock(&priv->est_lock);
>  		if (ret)
>  			netdev_err(priv->dev, "failed to configure EST\n");
>  	}
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> index cce00719937d..620c16e9be3a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> @@ -1004,17 +1004,19 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  		if (!plat->est)
>  			return -ENOMEM;
>  
> -		mutex_init(&priv->plat->est->lock);
> +		mutex_init(&priv->est_lock);
>  	} else {
> +		mutex_lock(&priv->est_lock);
>  		memset(plat->est, 0, sizeof(*plat->est));
> +		mutex_unlock(&priv->est_lock);
>  	}
>  
>  	size = qopt->num_entries;
>  
> -	mutex_lock(&priv->plat->est->lock);
> +	mutex_lock(&priv->est_lock);
>  	priv->plat->est->gcl_size = size;
>  	priv->plat->est->enable = qopt->cmd == TAPRIO_CMD_REPLACE;
> -	mutex_unlock(&priv->plat->est->lock);
> +	mutex_unlock(&priv->est_lock);
>  
>  	for (i = 0; i < size; i++) {
>  		s64 delta_ns = qopt->entries[i].interval;
> @@ -1045,7 +1047,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  		priv->plat->est->gcl[i] = delta_ns | (gates << wid);
>  	}
>  
> -	mutex_lock(&priv->plat->est->lock);
> +	mutex_lock(&priv->est_lock);
>  	/* Adjust for real system time */
>  	priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
>  	current_time_ns = timespec64_to_ktime(current_time);
> @@ -1068,7 +1070,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  	tc_taprio_map_maxsdu_txq(priv, qopt);
>  
>  	if (fpe && !priv->dma_cap.fpesel) {
> -		mutex_unlock(&priv->plat->est->lock);
> +		mutex_unlock(&priv->est_lock);
>  		return -EOPNOTSUPP;
>  	}
>  
> @@ -1079,7 +1081,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  
>  	ret = stmmac_est_configure(priv, priv, priv->plat->est,
>  				   priv->plat->clk_ptp_rate);
> -	mutex_unlock(&priv->plat->est->lock);
> +	mutex_unlock(&priv->est_lock);
>  	if (ret) {
>  		netdev_err(priv->dev, "failed to configure EST\n");
>  		goto disable;
> @@ -1096,7 +1098,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  
>  disable:
>  	if (priv->plat->est) {
> -		mutex_lock(&priv->plat->est->lock);
> +		mutex_lock(&priv->est_lock);
>  		priv->plat->est->enable = false;
>  		stmmac_est_configure(priv, priv, priv->plat->est,
>  				     priv->plat->clk_ptp_rate);
> @@ -1105,7 +1107,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  			priv->xstats.max_sdu_txq_drop[i] = 0;
>  			priv->xstats.mtl_est_txq_hlbf[i] = 0;
>  		}
> -		mutex_unlock(&priv->plat->est->lock);
> +		mutex_unlock(&priv->est_lock);
>  	}
>  
>  	priv->plat->fpe_cfg->enable = false;
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index dfa1828cd756..c0d74f97fd18 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -117,7 +117,6 @@ struct stmmac_axi {
>  
>  #define EST_GCL		1024
>  struct stmmac_est {
> -	struct mutex lock;
>  	int enable;
>  	u32 btr_reserve[2];
>  	u32 btr_offset[2];
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
