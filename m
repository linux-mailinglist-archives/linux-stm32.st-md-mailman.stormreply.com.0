Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDB396F46C
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 14:41:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15E88C78013;
	Fri,  6 Sep 2024 12:41:21 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A263C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 12:41:14 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5c255eab93dso192422a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Sep 2024 05:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725626473; x=1726231273;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j2oDWupgCB0EJEDFj7Qxwn+hUjKM6noFGnO8rTsV9Zk=;
 b=ZHE9TpdpZZJr3xN0+4ye4TGQ7ZlXcniN4MNAhxBmaam5x0o6EpHFzi++V4NRkUfHb9
 k3w+77Ivxb3Fz6RvBr5LsdgRSNP1Tliffe23cpUqeODZ6wC4ILaq3R+PO6CY9PbB1W4O
 IlBT+ZWNa6ZlfQ5DL6zV4VpqenuA4J8jbpOPTBXm2pGS6R0y3HJnzgs8AThkrLDceVX8
 +mBq29LWDbZNbaerUYM+EjoGAUniiJ8lJjuWKNemid45LFD+tyYqCwTEii6w9T01RgEr
 lhqzz5ckMJYXGV4tsjYu3P4bS4da8yJWnv7iWjgOiltfh9/jXtLy2Jc0D4D3VzYN96nZ
 Ke1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725626473; x=1726231273;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j2oDWupgCB0EJEDFj7Qxwn+hUjKM6noFGnO8rTsV9Zk=;
 b=JAgFo0qFKRp3F6cgbKVq3H24nuT6oFQ/sYjFBKlRni4tq0BaDpSufq1f7cs/tn4zr8
 46CVJPR4+BsoFWfLZ0JslFZAP5RyfSXXmJtjBUdLaFqmu3UyJNuDIK9rNoy8NRjMs9XV
 M0gzbPUghAgwlCwqhzYb1sPezxf5+E/i5ftPtSM2SK65YX7Op8ilj5tAqQso1N1SE3zl
 JJUzkUtBbCqXmax8bSZ69loUb0D/N4oHgC3ffav7SOABcZXY4qDKMWH4StVmyXyFd8j6
 U+5h4bnja5DCJ+Tc1RAw3HxGwf0rMFVgeXzg9mIw0m4agAxM+FLL7cAv4l9jcnReTHQC
 M+gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmQ6LycG+VRZEQ/SQttmWxWtUqZtIyyBTHSq7P5ySlpT6JI6rsVgixdaDMaYSKjhucmwQpkvGRjADtZw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwxF+Fv05ebVP+3gB/l7AyvGP2h5kCwkB1MqTTCR7R4yjKGn+0w
 ZVPcmZtrtU7hdbki5zQHTsk10pVU83HNAiG7PDdWMiGHAZz36ee0
X-Google-Smtp-Source: AGHT+IFM2B8brZFs+Lrn+MmgYrIC5y+ofetm/PeWuFXvo6OEHyA10imDyPZrf3L0Ib3cEXormlIhXw==
X-Received: by 2002:a17:907:971d:b0:a80:a23e:fbf9 with SMTP id
 a640c23a62f3a-a8a88845be5mr83712366b.6.1725626472582; 
 Fri, 06 Sep 2024 05:41:12 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8aeacb588bsm54664566b.78.2024.09.06.05.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 05:41:11 -0700 (PDT)
Date: Fri, 6 Sep 2024 15:41:09 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240906124109.s4p7lgrycfgr62vp@skbuf>
References: <cover.1725597121.git.0x1207@gmail.com>
 <cover.1725597121.git.0x1207@gmail.com>
 <13f5833e52a47895864db726f090f323ec691c62.1725597121.git.0x1207@gmail.com>
 <13f5833e52a47895864db726f090f323ec691c62.1725597121.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13f5833e52a47895864db726f090f323ec691c62.1725597121.git.0x1207@gmail.com>
 <13f5833e52a47895864db726f090f323ec691c62.1725597121.git.0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, rmk+kernel@armlinux.org.uk,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v9 3/7] net: stmmac: refactor FPE
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

On Fri, Sep 06, 2024 at 12:55:58PM +0800, Furong Xu wrote:
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -969,17 +969,30 @@ static void stmmac_mac_config(struct phylink_config *config, unsigned int mode,
>  static void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
>  {
>  	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
> -	enum stmmac_fpe_state *lo_state = &fpe_cfg->lo_fpe_state;
> -	enum stmmac_fpe_state *lp_state = &fpe_cfg->lp_fpe_state;
> -	bool *hs_enable = &fpe_cfg->hs_enable;
> +	unsigned long flags;
>  
> -	if (is_up && *hs_enable) {
> -		stmmac_fpe_send_mpacket(priv, priv->ioaddr, fpe_cfg,
> -					MPACKET_VERIFY);
> +	timer_shutdown_sync(&fpe_cfg->verify_timer);
>  }
>  
>  static void stmmac_mac_link_down(struct phylink_config *config,
> @@ -4091,10 +4068,10 @@ static int stmmac_release(struct net_device *dev)
>  
>  	stmmac_release_ptp(priv);
>  
> -	pm_runtime_put(priv->device);
> -
>  	if (priv->dma_cap.fpesel)
> -		stmmac_fpe_stop_wq(priv);
> +		timer_shutdown_sync(&priv->fpe_cfg.verify_timer);
> +
> +	pm_runtime_put(priv->device);
>  
>  	return 0;
>  }
> @@ -7372,53 +7334,88 @@ int stmmac_reinit_ringparam(struct net_device *dev, u32 rx_size, u32 tx_size)
> +static void stmmac_fpe_verify_timer_arm(struct stmmac_fpe_cfg *fpe_cfg)
> +{
> +	if (fpe_cfg->pmac_enabled && fpe_cfg->tx_enabled &&
> +	    fpe_cfg->verify_enabled &&
> +	    fpe_cfg->status != ETHTOOL_MM_VERIFY_STATUS_FAILED &&
> +	    fpe_cfg->status != ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED) {
> +		timer_setup(&fpe_cfg->verify_timer, stmmac_fpe_verify_timer, 0);
> +		mod_timer(&fpe_cfg->verify_timer, jiffies);
> +	}
> +}
> @@ -7875,15 +7874,8 @@ int stmmac_suspend(struct device *dev)
>  	}
>  	rtnl_unlock();
>  
> -	if (priv->dma_cap.fpesel) {
> -		/* Disable FPE */
> -		stmmac_fpe_configure(priv, priv->ioaddr,
> -				     &priv->fpe_cfg,
> -				     priv->plat->tx_queues_to_use,
> -				     priv->plat->rx_queues_to_use, false);
> -
> -		stmmac_fpe_stop_wq(priv);
> -	}
> +	if (priv->dma_cap.fpesel)
> +		timer_shutdown_sync(&priv->fpe_cfg.verify_timer);
>  
>  	priv->speed = SPEED_UNKNOWN;
>  	return 0;

Calling timer_setup() after timer_shutdown_sync() is a bit unconventional,
but I don't see why it shouldn't work.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
