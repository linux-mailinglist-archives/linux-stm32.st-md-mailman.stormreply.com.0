Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 986E58C3311
	for <lists+linux-stm32@lfdr.de>; Sat, 11 May 2024 20:10:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A6AFC6907A;
	Sat, 11 May 2024 18:10:24 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA5CDC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 May 2024 18:10:16 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-51f40b5e059so3385411e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 May 2024 11:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715451016; x=1716055816;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+X8Pgw9b1n09f4if+qG52s1rC7sizSyA5jgd5Lg9bZc=;
 b=C+p4tDRL1a3EhBxpTCpq/gsQCC+mDPmXUJZ78/Ht6ncx0UiX1aElbt/jeOThM6Je5+
 JpzVQaC7XU5mOa0BTKtaJ82RtG6gUtfAwFGHv3znpTD8LHqe4BeaJlAsn05sLjlJOIns
 GTvxjIs953vxFp1P5eYtSjqUsib3A37JCXKCLIxkpIGPxa78qXwPg/16zHepFBftDayT
 /G2jNig1wF9m1XdRxlEwfkNdqxKrBECJX+Ac71ImI0SedjdbHHDjTx/mkV6wnh7rpYeF
 hgoUMnBKu0Ko3oDnBobH44nxTf5P+gh6izm5ygOB48Ct+1Jm8n44vkOvVHBtJd5l3YHq
 lWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715451016; x=1716055816;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+X8Pgw9b1n09f4if+qG52s1rC7sizSyA5jgd5Lg9bZc=;
 b=Y8jcEARaraQ5YjIU7YkZCV3XRvHxCcdJiL/adXfMJdC53GnAPWLQrihh+chAdKRt7X
 PLtEHorT/fuCUifwltevXYgyKskWgBQJR+11aBMctPWmBn9W8ybL9yKmOI51y1nyGqi+
 JWeAjtIonC33rju1v9/5ocHTXz/gKzeH8/XIovKUAfVj2C9DypmYMgGM+F6Gw/FMoib9
 sXKrIirxR8IoRJf7GcoFYJTULIGXKnk00keqUhYIzacLKgmV+svrZhlkZuQcHYJlEAhF
 3jIYKNfkRPnp7HyZ10lDACP5JWQZlz1MDValxzkvIsbvpNv5E0zBYhWIiNe4QfzwespN
 crVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGijTkyqKQqDpxL+iHO/X7X0annu7skRn9QjXzArcwwFsu0jlh5Wkyj9spUlpYwMEOWT5eRDH2+0UAhSTf4t/4nQr2c7jthXLuaA19y2+TEHftRou8Tsf5
X-Gm-Message-State: AOJu0YwjnySFuF6xr1qPLDn+i9bmWuNHJnLEA/5q/iZJPPCFSmsWMfYh
 TGNlEScrbDbImLJOhmS3BvnzNxhtcng6N1nMvwrJFr4qIX4ByGb/
X-Google-Smtp-Source: AGHT+IH5zn2XCaRhqMIWEDIu5V5GLtDvMGnI/qgcYg25IdLGKgEdc9rWt3zK6m0FdqglAc+aEbJ31A==
X-Received: by 2002:ac2:5e67:0:b0:51b:f78d:c189 with SMTP id
 2adb3069b0e04-5220fb69910mr3323287e87.14.1715451015776; 
 Sat, 11 May 2024 11:10:15 -0700 (PDT)
Received: from mobilestation ([95.79.182.53]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ba49asm1049692e87.64.2024.05.11.11.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 May 2024 11:10:15 -0700 (PDT)
Date: Sat, 11 May 2024 21:10:13 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Message-ID: <j2lpk7afsuitkdgalkwlihpcrjsrxz3eeihiy2hwbuswxmhhkl@qk23rovif2mq>
References: <20240510122155.3394723-1-xiaolei.wang@windriver.com>
 <20240510122155.3394723-3-xiaolei.wang@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240510122155.3394723-3-xiaolei.wang@windriver.com>
Cc: linux-kernel@vger.kernel.org, horms@kernel.org,
 bartosz.golaszewski@linaro.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, rohan.g.thomas@intel.com, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, ahalaney@redhat.com
Subject: Re: [Linux-stm32] [net PATCH v5 2/2] net: stmmac: move the EST
 structure to struct stmmac_priv
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

On Fri, May 10, 2024 at 08:21:55PM +0800, Xiaolei Wang wrote:
> Move the EST structure to struct stmmac_priv, because the
> EST configs don't look like platform config, but EST is
> enabled in runtime with the settings retrieved for the TC
> TAPRIO feature also in runtime. So it's better to have the
> EST-data preserved in the driver private data instead of
> the platform data storage.

As Simon correctly noted this isn't a fix, so the patch was supposed
to be submitted for the net-next tree.

> 
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 18 ++++-----
>  .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 22 +++++-----
>  .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 40 +++++++++----------
>  include/linux/stmmac.h                        |  1 -
>  5 files changed, 40 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index 64b21c83e2b8..e05a775b463e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h

Seeing you'll likely need to resubmit the patch against the net-next
tree please move the stmmac_est structure declaration from 
include/linux/stmmac.h
to
drivers/net/ethernet/stmicro/stmmac/stmmac.h
since there is no longer point in having stmmac_est declared in the
former file, and the pointer to the structure is going to be preserved
in the stmmac_priv structure now which is declared in the later header
file.

With the above done feel free to add
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Thanks
-Serge(y)

> @@ -263,6 +263,7 @@ struct stmmac_priv {
>  	struct plat_stmmacenet_data *plat;
>  	/* Protect est parameters */
>  	struct mutex est_lock;
> +	struct stmmac_est *est;
>  	struct dma_features dma_cap;
>  	struct stmmac_counters mmc;
>  	int hw_cap_support;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 7c6fb14b5555..0eafd609bf53 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2491,9 +2491,9 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
>  		if (!xsk_tx_peek_desc(pool, &xdp_desc))
>  			break;
>  
> -		if (priv->plat->est && priv->plat->est->enable &&
> -		    priv->plat->est->max_sdu[queue] &&
> -		    xdp_desc.len > priv->plat->est->max_sdu[queue]) {
> +		if (priv->est && priv->est->enable &&
> +		    priv->est->max_sdu[queue] &&
> +		    xdp_desc.len > priv->est->max_sdu[queue]) {
>  			priv->xstats.max_sdu_txq_drop[queue]++;
>  			continue;
>  		}
> @@ -4528,9 +4528,9 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
>  			return stmmac_tso_xmit(skb, dev);
>  	}
>  
> -	if (priv->plat->est && priv->plat->est->enable &&
> -	    priv->plat->est->max_sdu[queue] &&
> -	    skb->len > priv->plat->est->max_sdu[queue]){
> +	if (priv->est && priv->est->enable &&
> +	    priv->est->max_sdu[queue] &&
> +	    skb->len > priv->est->max_sdu[queue]){
>  		priv->xstats.max_sdu_txq_drop[queue]++;
>  		goto max_sdu_err;
>  	}
> @@ -4909,9 +4909,9 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
>  	if (stmmac_tx_avail(priv, queue) < STMMAC_TX_THRESH(priv))
>  		return STMMAC_XDP_CONSUMED;
>  
> -	if (priv->plat->est && priv->plat->est->enable &&
> -	    priv->plat->est->max_sdu[queue] &&
> -	    xdpf->len > priv->plat->est->max_sdu[queue]) {
> +	if (priv->est && priv->est->enable &&
> +	    priv->est->max_sdu[queue] &&
> +	    xdpf->len > priv->est->max_sdu[queue]) {
>  		priv->xstats.max_sdu_txq_drop[queue]++;
>  		return STMMAC_XDP_CONSUMED;
>  	}
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> index 0c5aab6dd7a7..a6b1de9a251d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> @@ -68,11 +68,11 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
>  	nsec = reminder;
>  
>  	/* If EST is enabled, disabled it before adjust ptp time. */
> -	if (priv->plat->est && priv->plat->est->enable) {
> +	if (priv->est && priv->est->enable) {
>  		est_rst = true;
>  		mutex_lock(&priv->est_lock);
> -		priv->plat->est->enable = false;
> -		stmmac_est_configure(priv, priv, priv->plat->est,
> +		priv->est->enable = false;
> +		stmmac_est_configure(priv, priv, priv->est,
>  				     priv->plat->clk_ptp_rate);
>  		mutex_unlock(&priv->est_lock);
>  	}
> @@ -90,19 +90,19 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
>  		mutex_lock(&priv->est_lock);
>  		priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
>  		current_time_ns = timespec64_to_ktime(current_time);
> -		time.tv_nsec = priv->plat->est->btr_reserve[0];
> -		time.tv_sec = priv->plat->est->btr_reserve[1];
> +		time.tv_nsec = priv->est->btr_reserve[0];
> +		time.tv_sec = priv->est->btr_reserve[1];
>  		basetime = timespec64_to_ktime(time);
> -		cycle_time = (u64)priv->plat->est->ctr[1] * NSEC_PER_SEC +
> -			     priv->plat->est->ctr[0];
> +		cycle_time = (u64)priv->est->ctr[1] * NSEC_PER_SEC +
> +			     priv->est->ctr[0];
>  		time = stmmac_calc_tas_basetime(basetime,
>  						current_time_ns,
>  						cycle_time);
>  
> -		priv->plat->est->btr[0] = (u32)time.tv_nsec;
> -		priv->plat->est->btr[1] = (u32)time.tv_sec;
> -		priv->plat->est->enable = true;
> -		ret = stmmac_est_configure(priv, priv, priv->plat->est,
> +		priv->est->btr[0] = (u32)time.tv_nsec;
> +		priv->est->btr[1] = (u32)time.tv_sec;
> +		priv->est->enable = true;
> +		ret = stmmac_est_configure(priv, priv, priv->est,
>  					   priv->plat->clk_ptp_rate);
>  		mutex_unlock(&priv->est_lock);
>  		if (ret)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> index 620c16e9be3a..222540b55480 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> @@ -918,7 +918,6 @@ struct timespec64 stmmac_calc_tas_basetime(ktime_t old_base_time,
>  static void tc_taprio_map_maxsdu_txq(struct stmmac_priv *priv,
>  				     struct tc_taprio_qopt_offload *qopt)
>  {
> -	struct plat_stmmacenet_data *plat = priv->plat;
>  	u32 num_tc = qopt->mqprio.qopt.num_tc;
>  	u32 offset, count, i, j;
>  
> @@ -933,7 +932,7 @@ static void tc_taprio_map_maxsdu_txq(struct stmmac_priv *priv,
>  		count = qopt->mqprio.qopt.count[i];
>  
>  		for (j = offset; j < offset + count; j++)
> -			plat->est->max_sdu[j] = qopt->max_sdu[i] + ETH_HLEN - ETH_TLEN;
> +			priv->est->max_sdu[j] = qopt->max_sdu[i] + ETH_HLEN - ETH_TLEN;
>  	}
>  }
>  
> @@ -941,7 +940,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  			       struct tc_taprio_qopt_offload *qopt)
>  {
>  	u32 size, wid = priv->dma_cap.estwid, dep = priv->dma_cap.estdep;
> -	struct plat_stmmacenet_data *plat = priv->plat;
>  	struct timespec64 time, current_time, qopt_time;
>  	ktime_t current_time_ns;
>  	bool fpe = false;
> @@ -998,24 +996,24 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  	if (qopt->cycle_time_extension >= BIT(wid + 7))
>  		return -ERANGE;
>  
> -	if (!plat->est) {
> -		plat->est = devm_kzalloc(priv->device, sizeof(*plat->est),
> +	if (!priv->est) {
> +		priv->est = devm_kzalloc(priv->device, sizeof(*priv->est),
>  					 GFP_KERNEL);
> -		if (!plat->est)
> +		if (!priv->est)
>  			return -ENOMEM;
>  
>  		mutex_init(&priv->est_lock);
>  	} else {
>  		mutex_lock(&priv->est_lock);
> -		memset(plat->est, 0, sizeof(*plat->est));
> +		memset(priv->est, 0, sizeof(*priv->est));
>  		mutex_unlock(&priv->est_lock);
>  	}
>  
>  	size = qopt->num_entries;
>  
>  	mutex_lock(&priv->est_lock);
> -	priv->plat->est->gcl_size = size;
> -	priv->plat->est->enable = qopt->cmd == TAPRIO_CMD_REPLACE;
> +	priv->est->gcl_size = size;
> +	priv->est->enable = qopt->cmd == TAPRIO_CMD_REPLACE;
>  	mutex_unlock(&priv->est_lock);
>  
>  	for (i = 0; i < size; i++) {
> @@ -1044,7 +1042,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  			return -EOPNOTSUPP;
>  		}
>  
> -		priv->plat->est->gcl[i] = delta_ns | (gates << wid);
> +		priv->est->gcl[i] = delta_ns | (gates << wid);
>  	}
>  
>  	mutex_lock(&priv->est_lock);
> @@ -1054,18 +1052,18 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  	time = stmmac_calc_tas_basetime(qopt->base_time, current_time_ns,
>  					qopt->cycle_time);
>  
> -	priv->plat->est->btr[0] = (u32)time.tv_nsec;
> -	priv->plat->est->btr[1] = (u32)time.tv_sec;
> +	priv->est->btr[0] = (u32)time.tv_nsec;
> +	priv->est->btr[1] = (u32)time.tv_sec;
>  
>  	qopt_time = ktime_to_timespec64(qopt->base_time);
> -	priv->plat->est->btr_reserve[0] = (u32)qopt_time.tv_nsec;
> -	priv->plat->est->btr_reserve[1] = (u32)qopt_time.tv_sec;
> +	priv->est->btr_reserve[0] = (u32)qopt_time.tv_nsec;
> +	priv->est->btr_reserve[1] = (u32)qopt_time.tv_sec;
>  
>  	ctr = qopt->cycle_time;
> -	priv->plat->est->ctr[0] = do_div(ctr, NSEC_PER_SEC);
> -	priv->plat->est->ctr[1] = (u32)ctr;
> +	priv->est->ctr[0] = do_div(ctr, NSEC_PER_SEC);
> +	priv->est->ctr[1] = (u32)ctr;
>  
> -	priv->plat->est->ter = qopt->cycle_time_extension;
> +	priv->est->ter = qopt->cycle_time_extension;
>  
>  	tc_taprio_map_maxsdu_txq(priv, qopt);
>  
> @@ -1079,7 +1077,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  	 */
>  	priv->plat->fpe_cfg->enable = fpe;
>  
> -	ret = stmmac_est_configure(priv, priv, priv->plat->est,
> +	ret = stmmac_est_configure(priv, priv, priv->est,
>  				   priv->plat->clk_ptp_rate);
>  	mutex_unlock(&priv->est_lock);
>  	if (ret) {
> @@ -1097,10 +1095,10 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  	return 0;
>  
>  disable:
> -	if (priv->plat->est) {
> +	if (priv->est) {
>  		mutex_lock(&priv->est_lock);
> -		priv->plat->est->enable = false;
> -		stmmac_est_configure(priv, priv, priv->plat->est,
> +		priv->est->enable = false;
> +		stmmac_est_configure(priv, priv, priv->est,
>  				     priv->plat->clk_ptp_rate);
>  		/* Reset taprio status */
>  		for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index c0d74f97fd18..8aa255485a35 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -245,7 +245,6 @@ struct plat_stmmacenet_data {
>  	struct fwnode_handle *port_node;
>  	struct device_node *mdio_node;
>  	struct stmmac_dma_cfg *dma_cfg;
> -	struct stmmac_est *est;
>  	struct stmmac_fpe_cfg *fpe_cfg;
>  	struct stmmac_safety_feature_cfg *safety_feat_cfg;
>  	int clk_csr;
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
