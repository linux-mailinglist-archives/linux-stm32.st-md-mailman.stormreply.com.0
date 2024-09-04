Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C56BD96BD8A
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 15:02:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71DD3C78011;
	Wed,  4 Sep 2024 13:02:36 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAED4C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2024 13:02:29 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42bb9a23ea7so8291605e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Sep 2024 06:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725454949; x=1726059749;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EcbQbaIVPohzYKpW0NAJ6739Zodc4w16fXaT/0eJq+0=;
 b=COizgXv3nbf54LHl+CoULqsJFLrdc+9cxC1sWJG4BIednUFdq9J8yZLjLl6TowAuh7
 y4wJAC0LTjeG0FicNANtn+WGVc4L/z0HMzgd/0GC6NDBvQDg0syFXwjGxng5JSBYwrQA
 NlAE1eHU89p0dyQeHD3Esm8VrBPuNxpGp/aLUk4NU945FlpmzKubTgW/X3rQILCvtTGm
 dsuYPALIizys47KUJeAsJUFpk9tBEK/Yo9Xew5IAu21AIpbIJ3TEKPYu4xeUDBL67kfr
 sqrX7S/hZTk4IxgzLrYQyNjFpJY9NGCsxK/pdlJ7n2pXWuwQtmK3ppdJHZx1MFKow1rc
 zx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725454949; x=1726059749;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EcbQbaIVPohzYKpW0NAJ6739Zodc4w16fXaT/0eJq+0=;
 b=Wh6dO7Yu9zM4OLNPYej6JLmlF1HH6VFj98eJVRnRv79J1meU9bJM2jlW+M+liHz1/N
 sVinaPH9KnDEHhzSqFa15y/4FiqDDrXnrQUHkqLKo9KeXVQI+M2Z4ADhnbkTapDaDTzu
 XadLZsc4XaAiZMWfYl6PNRsoJMSr3FMEW709LyoEXLfBbS4f0EYrA2gqlQQ2606Vu8gr
 06LsCdNA5/VOTyqLcPcHuULpc6OdeCTt3FfMPNBYDK+1Oo47Cn7cQcdbAuvrvPLAeipG
 7yyALqStrmGmOSKzbw1bSZ4r0zvcrr4HvtNeBVpVH2v2JUxmCNrlz9L6AMihiOIFk3jD
 iQUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1jW631hPd8u8aN3yzunwtDRwmw2QztEHl2eW8Ov7Sd/f2x5DJlonNWBybYQy0/TGj76LT9rGQkW1xwA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyjMO6KQg2Jdt9NGNjs1gdbVhPf5AOEOQ97niUOcYcfuj/83wG7
 iigpygPJmxPyL2rnQFUwNqjnxzNJDzMIox1gc1VEYbkE97mzC3BZ
X-Google-Smtp-Source: AGHT+IH7hReguc+nH4lTt0jjKw5fmY4WB2guwukGV6szfSaPGtYeUcThT/DU2IKUCSeJ3RODNpc+Zw==
X-Received: by 2002:a05:600c:4fd6:b0:425:6dfa:c005 with SMTP id
 5b1f17b1804b1-42bbb204f9dmr68776885e9.2.1725454946828; 
 Wed, 04 Sep 2024 06:02:26 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df9705sm202738055e9.27.2024.09.04.06.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 06:02:25 -0700 (PDT)
Date: Wed, 4 Sep 2024 16:02:23 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240904130223.py2yxmwo5kp6yvnu@skbuf>
References: <cover.1725441317.git.0x1207@gmail.com>
 <cover.1725441317.git.0x1207@gmail.com>
 <1e452525e496b28c0b1ea43afbdc3533c92930c6.1725441317.git.0x1207@gmail.com>
 <1e452525e496b28c0b1ea43afbdc3533c92930c6.1725441317.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1e452525e496b28c0b1ea43afbdc3533c92930c6.1725441317.git.0x1207@gmail.com>
 <1e452525e496b28c0b1ea43afbdc3533c92930c6.1725441317.git.0x1207@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 rmk+kernel@armlinux.org.uk, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v7 3/7] net: stmmac: refactor FPE
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

On Wed, Sep 04, 2024 at 05:21:18PM +0800, Furong Xu wrote:
> +static void stmmac_fpe_verify_timer_arm(struct stmmac_fpe_cfg *fpe_cfg)
> +{
> +	struct ethtool_mm_state *state = &fpe_cfg->state;
> +
> +	if (state->pmac_enabled && state->tx_enabled &&
> +	    state->verify_enabled &&
> +	    state->verify_status != ETHTOOL_MM_VERIFY_STATUS_FAILED &&
> +	    state->verify_status != ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED) {
> +		/* give caller a chance to release the spinlock */
> +		mod_timer(&fpe_cfg->verify_timer, jiffies + 1);
> +	}
> +}

Why do you need to give the caller a chance to release the spinlock?
Isn't the timer code blocked anyway, as stmmac_fpe_verify_timer_arm()
runs under irqsoff?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
