Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1964A5404C
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 03:09:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BF47C78F6E;
	Thu,  6 Mar 2025 02:09:30 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD5EBC78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 02:09:29 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-22398e09e39so1537915ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Mar 2025 18:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741226968; x=1741831768;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z1rT13AxT6i7F5Ycxl5JT25b4uDj1fZ8K6rhKfIa2rM=;
 b=e7cBOBvxQg9wHLnr6nWw0AHVnBl4YbJiaB++1VWOpmyH0GfdqIHRqQH4ob/QTN6SiX
 LzyaY9ASo7QVGQ3u4TOrciuEdQjuNCX89tPvCyST7wJCc1bKGrjs5RfCNQibYHaKdmqC
 Mv9P1NKaRISjRD2MH4h4Bm2vZmD94ZFOZst+PAfgQp2Rf0cCSfegLsntp+7r74Xqna1e
 9V8gy69DNCw0tAyGfIL5wcBckxHtkAPCg3MaHC3xhnWxUMjsNJPK523IrL7eo1d6BvoY
 TND/xVbblPZZ3WDxQuZHtJKFekBtR70HUtmCBNlFqFa0hurt9qKWH+9rKdRgydqvbHgD
 Vspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741226968; x=1741831768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z1rT13AxT6i7F5Ycxl5JT25b4uDj1fZ8K6rhKfIa2rM=;
 b=bR2p5ZJN0qejakz9OT4L9ZdH0rcsWSOWsgNu8sZKFR39XQwTsFYOAkjMdhk3iQNpFC
 bYUky5+4VnZyrxIgSmUmkK2C878xZU+A6kc2AAu9KDoh+MlNrWz1+B4q8vnhtjMi2/Kt
 GkPBPmRnN6fqUqSuaeSzYJLAOClspdzbqdFsoOjFHy+QhSso/9xsAMRjKft3QBlDOZmt
 7BsUGRwSY7fD6zvltDTfXU17qIVX3BPzUGjKKc0WkO5Z8K1ZtTfCx9C71Dvxw/0CcUHi
 Opc/Mxi+5duwQC6HDA8FpjUkvxxzwYUfnTjNd5UUOWtFhLJ+tB6D1ZriZa3exCOwaeUV
 OPgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgJ+4XnkUvA0ldB2YcwAKrxpyqOaEzWUviaDYhAEBcygO/46WvogdAHz0Sc3S++517HWrhe4A0dH7PhA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxkYlENXTFZ7sy2N1QdM7qERQwryRQ8ofP0qB7bLvsS6USvYzsT
 D7iODmAqFqzHJv7kryUBJ2r/cjnoGzEi3adnRL6ig8fpjh/BL3hW
X-Gm-Gg: ASbGncu0uoIIjN5G3UPSfWIs4+y/nd0bWG+MbbVFM+DTygopeYfHEwOA/Y4UoxorsjV
 WWeeBj7mLz40DSIBc3VML0aKuof9z4Bh6Ffw90CkOO/SyBJC04Vtt7QvjT5p9vDNNFxZuC9qXRh
 984Y1wE2bdJeIypG38CboqkoeI9aOhnX9mriogS99MY5ORH37OJxtGnVNOh/NZu/1VIztOSVqsw
 ihMevrUD8VBtXvFtQfEV3Ke12g7n2hHtCFMY5YJEhd6ZkBogcCMxWhrXbc8EXe+63HU+AEw7vxv
 u/Oo1GX8EwUpHUm+4haFze+oKCYGOgRm4vIYYw==
X-Google-Smtp-Source: AGHT+IF9QeRgv+6Z/cPJtnzTG5KuBBCd8Qdr6JTrB73F+Bp0n4Wqinq/xvlObO2mPBHhOim0ujthOA==
X-Received: by 2002:a05:6a00:889:b0:736:55ec:ea8b with SMTP id
 d2e1a72fcca58-73682d00a42mr7712708b3a.24.1741226967842; 
 Wed, 05 Mar 2025 18:09:27 -0800 (PST)
Received: from localhost ([144.24.43.60]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73698519026sm139246b3a.144.2025.03.05.18.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 18:09:27 -0800 (PST)
Date: Thu, 6 Mar 2025 10:09:13 +0800
From: Furong Xu <0x1207@gmail.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Message-ID: <20250306100913.00005bb8@gmail.com>
In-Reply-To: <20250305130026.642219-2-faizal.abdul.rahim@linux.intel.com>
References: <20250305130026.642219-1-faizal.abdul.rahim@linux.intel.com>
 <20250305130026.642219-2-faizal.abdul.rahim@linux.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Chwee-Lin Choong <chwee.lin.choong@intel.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, intel-wired-lan@lists.osuosl.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v8 01/11] net: stmmac: move
 frag_size handling out of spin_lock
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

On Wed,  5 Mar 2025 08:00:16 -0500
Faizal Rahim <faizal.abdul.rahim@linux.intel.com> wrote:

> The upcoming patch will extract verification logic into a new module,
> MMSV (MAC Merge Software Verification). MMSV will handle most FPE fields,
> except frag_size. It introduces its own lock (mmsv->lock), replacing
> fpe_cfg->lock.
> 
> Since frag_size handling remains in the driver, the existing rtnl_lock()
> is sufficient. Move frag_size handling out of spin_lock_irq_save() to keep
> the upcoming patch a pure refactoring without behavior changes.
> 
> Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index 918a32f8fda8..cfe5aea24549 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -1216,6 +1216,10 @@ static int stmmac_get_mm(struct net_device *ndev,
>  	if (!stmmac_fpe_supported(priv))
>  		return -EOPNOTSUPP;
>  
> +	state->rx_min_frag_size = ETH_ZLEN;
> +	frag_size = stmmac_fpe_get_add_frag_size(priv);
> +	state->tx_min_frag_size = ethtool_mm_frag_size_add_to_min(frag_size);
> +
>  	spin_lock_irqsave(&priv->fpe_cfg.lock, flags);
>  
>  	state->max_verify_time = STMMAC_FPE_MM_MAX_VERIFY_TIME_MS;
> @@ -1224,7 +1228,6 @@ static int stmmac_get_mm(struct net_device *ndev,
>  	state->verify_time = priv->fpe_cfg.verify_time;
>  	state->tx_enabled = priv->fpe_cfg.tx_enabled;
>  	state->verify_status = priv->fpe_cfg.status;
> -	state->rx_min_frag_size = ETH_ZLEN;
>  
>  	/* FPE active if common tx_enabled and
>  	 * (verification success or disabled(forced))
> @@ -1236,9 +1239,6 @@ static int stmmac_get_mm(struct net_device *ndev,
>  	else
>  		state->tx_active = false;
>  
> -	frag_size = stmmac_fpe_get_add_frag_size(priv);
> -	state->tx_min_frag_size = ethtool_mm_frag_size_add_to_min(frag_size);
> -
>  	spin_unlock_irqrestore(&priv->fpe_cfg.lock, flags);
>  
>  	return 0;
> @@ -1258,6 +1258,8 @@ static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
>  	if (err)
>  		return err;
>  
> +	stmmac_fpe_set_add_frag_size(priv, frag_size);
> +
>  	/* Wait for the verification that's currently in progress to finish */
>  	timer_shutdown_sync(&fpe_cfg->verify_timer);
>  
> @@ -1271,7 +1273,6 @@ static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
>  	if (!cfg->verify_enabled)
>  		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
>  
> -	stmmac_fpe_set_add_frag_size(priv, frag_size);
>  	stmmac_fpe_apply(priv);
>  
>  	spin_unlock_irqrestore(&fpe_cfg->lock, flags);

Reviewed-by: Furong Xu <0x1207@gmail.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
