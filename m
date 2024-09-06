Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C76296F4A9
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 14:53:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAED7C78013;
	Fri,  6 Sep 2024 12:53:09 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2FBDC6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 12:53:02 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5c2535b081fso175833a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Sep 2024 05:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725627182; x=1726231982;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=690hJkBK217OakU19EFY9fs/Kc2GYaKx8HXQ7unUhlQ=;
 b=D4qv+p9Zz6kiWCxfs2Juf96LR+18Zzzi/GMBhWFAzCMRg2vPcdtbd7mYTTsAWj2tj4
 9p8x1H5eO+y9ueUpctkUkDJAtenw4J3t1EXNIwz5jkfx3mMQNotKkzjDghco+O7eSOaD
 QcWV5GwhYbTseDvSCia0FZIJKA6V+8iTIVyBBXpaKvQRIcpZEaca9pskBcTh0REvJf8e
 RtW1K7EFdUeJmWgTrXSW0FWHucIo3y2vRvGsXowdcKhlz9hstYgrssxJdlUd6gx34t7s
 IwsUN7g5bZVI5fjN6KxFaaW/rAb5L+IXVRlvMTWTfjSzObVj0Mx4TAtQR55s107WJkWV
 iEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725627182; x=1726231982;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=690hJkBK217OakU19EFY9fs/Kc2GYaKx8HXQ7unUhlQ=;
 b=hSabvkpZDdcVOc2k3OnBVjm/YStNvaDRR74ybd+TxBcsupr/2tOEXM3M7yrXd7o5e1
 piXrmnVcMMkRoywOBtRqkbu8GBjRu2G+UQSqP8eFnYy8H0Bgw6hii4Kmst+NJM46KHsy
 Vy/6yF9W2yP8vMRDXhXGt3qad3n6MgXK5+IK/QT35mw2VS5cLOKX0MsQBYtICHKu56oN
 9hYi7jKWYEbSR1sxKRvSlxZx/BcFNCge4EWw/9T0qpHh6EWN4H3/eV3PQenRKFCnENbw
 Q9yDbO1VFz3LdDj2rv//jZBDFcccRwAIhEqhOjOlHJNUVIXerpqIWehEY2tOs41MDUVB
 eV0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcRoLRxpjheOVFnbkKo9XACVrJbtfy3faFvJ35oGFwlcSo750VDzdOzLzKSonZRMukDxbt5LHSSOtGzw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwsiCEsO6lsCuDOAAdCQIUsA4ojStIxSlwXKw/I/pogGrcZqH4J
 7pDIYASReRBOl7UAYmKiHCEYDabAnxNM4wUmOv4jpaEnXeGfwiPX
X-Google-Smtp-Source: AGHT+IFUUlXDd8a581aFfNhl9hEBR8Xj7Vj1SfC+dxLDEYbwn71uSH7PY1/UYC/o4JTGTrHDO3gv+Q==
X-Received: by 2002:a05:6402:50c7:b0:5c2:6850:7b2 with SMTP id
 4fb4d7f45d1cf-5c3dc7ef8cfmr1030364a12.6.1725627181456; 
 Fri, 06 Sep 2024 05:53:01 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc56a897sm2426757a12.47.2024.09.06.05.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 05:53:00 -0700 (PDT)
Date: Fri, 6 Sep 2024 15:52:58 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240906125258.d7rhhcjdic3quqg2@skbuf>
References: <cover.1725597121.git.0x1207@gmail.com>
 <13f5833e52a47895864db726f090f323ec691c62.1725597121.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13f5833e52a47895864db726f090f323ec691c62.1725597121.git.0x1207@gmail.com>
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
> @@ -5979,44 +5956,29 @@ static int stmmac_set_features(struct net_device *netdev,
>  static void stmmac_fpe_event_status(struct stmmac_priv *priv, int status)
>  {
>  	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
> -	enum stmmac_fpe_state *lo_state = &fpe_cfg->lo_fpe_state;
> -	enum stmmac_fpe_state *lp_state = &fpe_cfg->lp_fpe_state;
> -	bool *hs_enable = &fpe_cfg->hs_enable;
>  
> -	if (status == FPE_EVENT_UNKNOWN || !*hs_enable)
> -		return;
> +	/* This is interrupt context, just spin_lock() */
> +	spin_lock(&fpe_cfg->lock);
>  
> -	/* If LP has sent verify mPacket, LP is FPE capable */
> -	if ((status & FPE_EVENT_RVER) == FPE_EVENT_RVER) {
> -		if (*lp_state < FPE_STATE_CAPABLE)
> -			*lp_state = FPE_STATE_CAPABLE;
> +	if (!fpe_cfg->pmac_enabled || status == FPE_EVENT_UNKNOWN)
> +		goto unlock_out;
>  
> -		/* If user has requested FPE enable, quickly response */
> -		if (*hs_enable)
> -			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
> -						fpe_cfg,
> -						MPACKET_RESPONSE);
> -	}
> +	/* LP has sent verify mPacket */
> +	if ((status & FPE_EVENT_RVER) == FPE_EVENT_RVER)
> +		stmmac_fpe_send_mpacket(priv, priv->ioaddr, fpe_cfg,
> +					MPACKET_RESPONSE);
>  
> -	/* If Local has sent verify mPacket, Local is FPE capable */
> -	if ((status & FPE_EVENT_TVER) == FPE_EVENT_TVER) {
> -		if (*lo_state < FPE_STATE_CAPABLE)
> -			*lo_state = FPE_STATE_CAPABLE;
> -	}
> +	/* Local has sent verify mPacket */
> +	if ((status & FPE_EVENT_TVER) == FPE_EVENT_TVER &&
> +	    fpe_cfg->status != ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED)
> +		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_VERIFYING;
>  
> -	/* If LP has sent response mPacket, LP is entering FPE ON */
> +	/* LP has sent response mPacket */
>  	if ((status & FPE_EVENT_RRSP) == FPE_EVENT_RRSP)
> -		*lp_state = FPE_STATE_ENTERING_ON;
> +		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED;

Nitpick, doesn't affect normal behavior.
If the link partner crafts an unsolicited Response mPacket, and we have
verify_enabled = false, what we should do is we should ignore it.
But what the code does is to transition the state to SUCCEEDED, as if
verify_enabled was true.

We should ignore FPE_EVENT_RRSP events if we are in the
ETHTOOL_MM_VERIFY_STATUS_DISABLED state.

Depending on how the maintainers feel, this could also be handled in a
subsequent patch.

>  
> -	/* If Local has sent response mPacket, Local is entering FPE ON */
> -	if ((status & FPE_EVENT_TRSP) == FPE_EVENT_TRSP)
> -		*lo_state = FPE_STATE_ENTERING_ON;
> -
> -	if (!test_bit(__FPE_REMOVING, &priv->fpe_task_state) &&
> -	    !test_and_set_bit(__FPE_TASK_SCHED, &priv->fpe_task_state) &&
> -	    priv->fpe_wq) {
> -		queue_work(priv->fpe_wq, &priv->fpe_task);
> -	}
> +unlock_out:
> +	spin_unlock(&fpe_cfg->lock);
>  }
>  
>  static void stmmac_common_interrupt(struct stmmac_priv *priv)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
