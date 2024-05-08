Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D12818BF9DF
	for <lists+linux-stm32@lfdr.de>; Wed,  8 May 2024 11:56:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8316EC62EFE;
	Wed,  8 May 2024 09:56:20 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E43B2C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 May 2024 09:56:13 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-51f0b6b682fso4405463e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 May 2024 02:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715162173; x=1715766973;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=io8fmhR7P9iwCv/52XS5SThweh8W+4/Do9egkjm9CcM=;
 b=cWmP1TNl2E9SUm8/Wm1mX5khxe41XiqqRATIimI01OD4D/uJBCmfioAazxX75DPLwW
 LeIvx7G7Nin2Igc9A6/E0myFktcO4LR+CBdpHxocG22HCH5hghQcXRiqwdxFjq0DnPBw
 lkfWF54Qnt+k8JftvlaI/799+Qm/mtmQ92cV71ARXNU3MR6SViiS9JexVEDJ6L4ib6j9
 bojePv734H6Q16FXGWPyNHdz2zK+btW2ABOJ19pUz0Skc6lCFjEsjnv1nvfRCYqx4g0z
 PODwGRMBB5XLDVq/GjE3LDca1yJ8Bo7qUZd8d+4JSbi735ss1WyXC+Qcgi0P0L9RUTBX
 kBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715162173; x=1715766973;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=io8fmhR7P9iwCv/52XS5SThweh8W+4/Do9egkjm9CcM=;
 b=N7ex8rs5SOdGG6lUFV6JpqwUdbnh1dXREQhNCKywzfn7f3jv3hdn9u6e6mWkEZSdno
 ZjQuiE00U8TJOluJzQwUisDUYRMkci+pRY2AGfAugaLqbUOdNiQZcB8ONB3Btw21vN6I
 IpXbWI2+utoLCAj46rU3XgsyvDPj8ESxBaXKO8LjHhkhYlZkG5spSRFkz9haMkyMDeod
 qLYKvroTsTT3V872VhQ5TY8pJhQ5502OJLw+ovsWc6tBFb95u4eixci6YKp1BBRVnMAQ
 qkA/KMl6bqIM1YglSMnzPLrOnRBuaeZ4xJVwMGbNqe+OIJmScpp1ZgT4oWNxgUAyWaz1
 Iifg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHZAlVXEV+KuPEXB6bO3nWr+PHKaAauALhGds+DVACsv1Dv3QrSPoWzxSkgbxB+ZvhOs/xAtUtoM5ud2m1VMzo+swZtAPARpCSshu0O8JQAslTjDgC8+Lx
X-Gm-Message-State: AOJu0Yxsun4q5GlG7quw9+0CrmSxi+oSgrTkusAl2qDxCEMMGGnwjhlk
 JqNEXhhDq0cfFm1N1gPBCxjpPuDXQqFeHGMDYisyj+r4JxNi0Ggi
X-Google-Smtp-Source: AGHT+IFSg3ipoB9x/q9K5s3nqoZPNbvUw9v4r5YNPaHHmzhGDbABkPL44NPpL7eQYgs74L94b0SGPg==
X-Received: by 2002:a05:6512:3157:b0:518:eef0:45c0 with SMTP id
 2adb3069b0e04-5217cc520d0mr1791398e87.48.1715162172805; 
 Wed, 08 May 2024 02:56:12 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 o3-20020ac24943000000b0051e12a2c07bsm2475872lfi.20.2024.05.08.02.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 02:56:12 -0700 (PDT)
Date: Wed, 8 May 2024 12:56:09 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Message-ID: <dvtilkr2ho5yy56fii6voglgu3tnopmoy556vrdo4evlynet5g@lnrlv73a27hm>
References: <20240508045257.2470698-1-xiaolei.wang@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240508045257.2470698-1-xiaolei.wang@windriver.com>
Cc: j.zink@pengutronix.de, linux-kernel@vger.kernel.org, horms@kernel.org,
 bartosz.golaszewski@linaro.org, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 leong.ching.swee@intel.com, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, rohan.g.thomas@intel.com,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, ahalaney@redhat.com
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: move the lock to struct
 plat_stmmacenet_data
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

On Wed, May 08, 2024 at 12:52:57PM +0800, Xiaolei Wang wrote:
> Reinitialize the whole est structure would also reset the mutex lock
> which is embedded in the est structure, and then trigger the following
> warning. To address this, move the lock to struct plat_stmmacenet_data.
> We also need to require the mutex lock when doing this initialization.
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
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> ---
> v1 -> v2:
>  - move the lock to struct plat_stmmacenet_data
> v2 -> v3:
>  - Add require the mutex lock for reinitialization
> 
>  .../net/ethernet/stmicro/stmmac/stmmac_ptp.c   |  8 ++++----
>  .../net/ethernet/stmicro/stmmac/stmmac_tc.c    | 18 ++++++++++--------
>  include/linux/stmmac.h                         |  2 +-
>  3 files changed, 15 insertions(+), 13 deletions(-)
> 
> [...]
>
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index dfa1828cd756..316ff7eb8b33 100644
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
> @@ -246,6 +245,7 @@ struct plat_stmmacenet_data {
>  	struct fwnode_handle *port_node;
>  	struct device_node *mdio_node;
>  	struct stmmac_dma_cfg *dma_cfg;
> +	struct mutex lock;
>  	struct stmmac_est *est;
>  	struct stmmac_fpe_cfg *fpe_cfg;
>  	struct stmmac_safety_feature_cfg *safety_feat_cfg;

Seeing you are going to move things around I suggest to move the
entire stmmac_est instance out of the plat_stmmacenet_data structure
and place it in the stmmac_priv instead. Why? Because the EST configs
don't look as the platform config, but EST is enabled in runtime with
the settings retrieved for the TC TAPRIO feature also in runtime. So
it's better to have the EST-data preserved in the driver private date
instead of the platform data storage. You could move the structure
there and place the lock aside of it. Field name like "est_lock" might
be most suitable to be looking unified with the "ptp_lock" or
"aux_ts_lock".

* The same, but with no lock-related thing should be done for the
* stmmac_safety_feature_cfg structure,
but it's unrelated to the subject...

-Serge(y)

> -- 
> 2.25.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
