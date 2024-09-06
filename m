Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F6896F493
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 14:49:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8AEDC78013;
	Fri,  6 Sep 2024 12:49:37 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 212D5C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 12:49:30 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53652d19553so288213e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Sep 2024 05:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725626969; x=1726231769;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CazLyKDyDWBGE+TrHohi5rRaTCuA6ZV2cOHXjRbJ6FA=;
 b=UC+Ns9Rwu8hE113W0EHOELrqJR+1/SsriKr29tQOQAYW0w5fAhW97IhhzoKLgoLXYi
 BZ6fpOISvAyCNuYwL10mzYllrayIgahMDqppqzb4FW7rtpBwiRxq8y55naSD2n/FC1vO
 xD/sUsQnbdXR2qo5a/n7uwOm+hjR8YfPA4f5tzqc9ajWiwTzbSz0c57+A5aqGC3KhWQ9
 RYEwfD83wydTcAQ/IxDneo+WG1fHRHCeZ0KdcQ7IX4azWoe7apMPv4Fne1vRYCg77kcX
 eu69EVK3byFbx9qCMXly9suA1YdF7rdeu5NQol6Xs5DNGzvfFBHeh51QX5swWg9ezfYw
 VYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725626969; x=1726231769;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CazLyKDyDWBGE+TrHohi5rRaTCuA6ZV2cOHXjRbJ6FA=;
 b=Yqkbt1+L6wrAayKpWEhxK7y/aOICr8f+/YpUL+TGtBOhgUgZhjuz9aILmtuonZeiNJ
 svRH2u6hoU1H/3Pu8iouVN/khpUchCV42TnPJXyYXLbFLXFk8tiqeO+pqqQYmA5hSZZd
 mUmTBWfdA81tNTwq19J9qsQaP4KQTTyN2LX1c0HoffGbUZ8cZe7Mys2D4V58SlQ8rpm7
 dulwoYEKjnF26hOnjtuxeyKZ02LEeGj2AbXnPEhcti8SXQRztmv9u+C6WZEVh3UoJXSV
 HSeYhWocVKaBtqwf/3db111Tsoq4KwLoRFmKQ7Z17LpPtqZRGpmbexva2Gk6QqyU3UZJ
 8Emg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCfrOZtUreLdyBHtrVJl0TqnWe8bjjq2W2xGTkfQ5KNW4wjkyM8uHCThooJv8r0BVWB1QLfHC4BnaYSQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwBo9nTcx/Rk8OvW37ubFVFf6uOeNgOiCsLRvpYUraAdyfs8Wm1
 ICvevW+Uy0vvfDwxtxF5FmqHqmDbu5T8whXBXYcbAbmgnYdCJl63
X-Google-Smtp-Source: AGHT+IGDs+OBqeonRw88x+u40y2cJauEoSXB0MFc/Um5YW0NdPJ9YSGIlAJ4uY+T1N91qq87eQ+3ww==
X-Received: by 2002:a05:6512:3ba4:b0:535:4144:d785 with SMTP id
 2adb3069b0e04-5365881cf56mr870682e87.11.1725626968213; 
 Fri, 06 Sep 2024 05:49:28 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a77f8fefesm198420766b.182.2024.09.06.05.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 05:49:27 -0700 (PDT)
Date: Fri, 6 Sep 2024 15:49:24 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240906124924.odfhsgiyg4jkrnqx@skbuf>
References: <cover.1725597121.git.0x1207@gmail.com>
 <cover.1725597121.git.0x1207@gmail.com>
 <13f5833e52a47895864db726f090f323ec691c62.1725597121.git.0x1207@gmail.com>
 <13f5833e52a47895864db726f090f323ec691c62.1725597121.git.0x1207@gmail.com>
 <20240906124109.s4p7lgrycfgr62vp@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240906124109.s4p7lgrycfgr62vp@skbuf>
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

On Fri, Sep 06, 2024 at 03:41:09PM +0300, Vladimir Oltean wrote:
> On Fri, Sep 06, 2024 at 12:55:58PM +0800, Furong Xu wrote:
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -969,17 +969,30 @@ static void stmmac_mac_config(struct phylink_config *config, unsigned int mode,
> >  static void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
> >  {
> >  	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
> > -	enum stmmac_fpe_state *lo_state = &fpe_cfg->lo_fpe_state;
> > -	enum stmmac_fpe_state *lp_state = &fpe_cfg->lp_fpe_state;
> > -	bool *hs_enable = &fpe_cfg->hs_enable;
> > +	unsigned long flags;
> >  
> > -	if (is_up && *hs_enable) {
> > -		stmmac_fpe_send_mpacket(priv, priv->ioaddr, fpe_cfg,
> > -					MPACKET_VERIFY);
> > +	timer_shutdown_sync(&fpe_cfg->verify_timer);
> >  }
> >  
> >  static void stmmac_mac_link_down(struct phylink_config *config,
> > @@ -4091,10 +4068,10 @@ static int stmmac_release(struct net_device *dev)
> >  
> >  	stmmac_release_ptp(priv);
> >  
> > -	pm_runtime_put(priv->device);
> > -
> >  	if (priv->dma_cap.fpesel)
> > -		stmmac_fpe_stop_wq(priv);
> > +		timer_shutdown_sync(&priv->fpe_cfg.verify_timer);
> > +
> > +	pm_runtime_put(priv->device);
> >  
> >  	return 0;
> >  }
> > @@ -7372,53 +7334,88 @@ int stmmac_reinit_ringparam(struct net_device *dev, u32 rx_size, u32 tx_size)
> > +static void stmmac_fpe_verify_timer_arm(struct stmmac_fpe_cfg *fpe_cfg)
> > +{
> > +	if (fpe_cfg->pmac_enabled && fpe_cfg->tx_enabled &&
> > +	    fpe_cfg->verify_enabled &&
> > +	    fpe_cfg->status != ETHTOOL_MM_VERIFY_STATUS_FAILED &&
> > +	    fpe_cfg->status != ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED) {
> > +		timer_setup(&fpe_cfg->verify_timer, stmmac_fpe_verify_timer, 0);
> > +		mod_timer(&fpe_cfg->verify_timer, jiffies);
> > +	}
> > +}
> > @@ -7875,15 +7874,8 @@ int stmmac_suspend(struct device *dev)
> >  	}
> >  	rtnl_unlock();
> >  
> > -	if (priv->dma_cap.fpesel) {
> > -		/* Disable FPE */
> > -		stmmac_fpe_configure(priv, priv->ioaddr,
> > -				     &priv->fpe_cfg,
> > -				     priv->plat->tx_queues_to_use,
> > -				     priv->plat->rx_queues_to_use, false);
> > -
> > -		stmmac_fpe_stop_wq(priv);
> > -	}
> > +	if (priv->dma_cap.fpesel)
> > +		timer_shutdown_sync(&priv->fpe_cfg.verify_timer);
> >  
> >  	priv->speed = SPEED_UNKNOWN;
> >  	return 0;
> 
> Calling timer_setup() after timer_shutdown_sync() is a bit unconventional,
> but I don't see why it shouldn't work.
> 
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

Actually, I'm really wondering. Is lockdep okay if you run timer_shutdown_sync()
on a timer on which you've never called timer_setup()?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
