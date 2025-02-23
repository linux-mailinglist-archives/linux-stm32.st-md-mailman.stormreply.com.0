Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D8FA40CD9
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Feb 2025 06:40:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB576C78034;
	Sun, 23 Feb 2025 05:40:07 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64AF0C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Feb 2025 05:40:05 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2fbfa8c73a6so6912756a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Feb 2025 21:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740289204; x=1740894004;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BfvuWvSB4FrYuL3Q9W8pUmNF8XrVHM6syd74IbIbqmI=;
 b=dt4ElKDUyKnJv0tEu5jrFSSl3RAjITf+RbBqJI7vCm/vMTAk0UtwajERVM9HHz1Ga8
 OjFsQZ5z9xenGPCEhVXB/axxw6l1xbz24G1KXTyHsYV6LbqSAi45lpychjLykQTOCitJ
 cwx5E5LRgbkdjd4tGR1EaDA8FGhA7gQfdg9y0SgHJ0BijAQAnfA3fASNy1NJQgSG3aS0
 5TBBtKLqbSAfeHDf1qJ9PkrA9bIBcIMKEQW3bg4orU/DmZGBjh4eGAY//h5nyNPjhHzo
 UZxcjCUl2BzY+6A1wTi00MFgqPeRDpIBxo2XwaKWtdvHS6LWqdEyEEqE+FVH92XZb7hD
 g1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740289204; x=1740894004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BfvuWvSB4FrYuL3Q9W8pUmNF8XrVHM6syd74IbIbqmI=;
 b=Y/iAjFV+UU0o2fypoFy6QYyRCp6QP23Y81jkAuuTxxBpEBoQ1tE3xE9ufY05pdLDI0
 UZDKowEthHkcoAv7BX5Iy40AmZPdXwsLHgRimV/sh2yuXcWuOBiSQmgl2AoNHoce3NqN
 waHDpgnrtFyTxei+FIYm4K7oyjn7wikk+t5gLOq6LR1FE5/MshZ5y99BIeHuWa3rTQ+A
 qZKqa0gPkBOwCsVn8k18KarrSt8C+2UN3ewwqcGNU1oFUvUzwWZyWacoRSs3/9bEUl0k
 WeqfBs0OaY2P4oGAlTw/+QzY4dj9/A+fB75ozJZ7yMNGYIq4NRCqbr7YPu2gWch1Upau
 al3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYl8MeLm7oViuOdY+nu4ZzfMyNLU4YxU9ITcU/iYepwczql+mLvxwGP4wJu1P8T58kOEb1FjK+CYVJZw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzeIHWJf8lv9A0I+5ouhd5+D2/pWM1oFGyOIvLr6sAKRgR963bM
 cyjEG3uAIlFRfnf5yjhnWhohB/bphL6+YYMXe/BdCRkBNQYwr2Yz
X-Gm-Gg: ASbGnct4pfPc2iYaoMxAA9e4i/khi8I/i+zzLWmAqoA4/YB+oBd0zyevgNW7s9Ytkb5
 NLvC7kuRBeO75/bl6vbFTvS8XMa4pfkc4AtVvMo6dK7/jCDGFDiG1wVrPyycwsLH2e2dFrDaJOq
 C8nMMiXIJvHLkb/gfN01nDbPJHMXhIZEDnNrLpqO//vTpxlvqmwv+IHQwqBGuy0Zb5o/NZx3Sf9
 7z5dIMr4qYweZTcvhvicZaUgUee1SdqfdAZrNbJAkJ+iCyikYP09LwVF5+/iP9ivSwPG4SrZTDn
 Qne+n1WhUXQ6YhQXX5Jk7t0=
X-Google-Smtp-Source: AGHT+IEsyitKBEB+TjtOIJ7j0ghQQ1PUySgYsjd6ENH+ooYHWDcum4IoJa9MuHEv9g0sOVIJCIQYCA==
X-Received: by 2002:a05:6a20:8403:b0:1ee:efa5:6573 with SMTP id
 adf61e73a8af0-1eef52c9981mr17773167637.8.1740289203622; 
 Sat, 22 Feb 2025 21:40:03 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73261ca7831sm15022814b3a.104.2025.02.22.21.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2025 21:40:03 -0800 (PST)
Date: Sun, 23 Feb 2025 13:39:47 +0800
From: Furong Xu <0x1207@gmail.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Message-ID: <20250223133947.00002f06@gmail.com>
In-Reply-To: <20250220025349.3007793-2-faizal.abdul.rahim@linux.intel.com>
References: <20250220025349.3007793-1-faizal.abdul.rahim@linux.intel.com>
 <20250220025349.3007793-2-faizal.abdul.rahim@linux.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, intel-wired-lan@lists.osuosl.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v5 1/9] net: ethtool: mm: extract
 stmmac verification logic into common library
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

On Wed, 19 Feb 2025 21:53:41 -0500, Faizal Rahim <faizal.abdul.rahim@linux.intel.com> wrote:

> @@ -1258,23 +1236,8 @@ static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
>  	if (err)
>  		return err;
>  
> -	/* Wait for the verification that's currently in progress to finish */
> -	timer_shutdown_sync(&fpe_cfg->verify_timer);
> -
> -	spin_lock_irqsave(&fpe_cfg->lock, flags);
> -
> -	fpe_cfg->verify_enabled = cfg->verify_enabled;
> -	fpe_cfg->pmac_enabled = cfg->pmac_enabled;
> -	fpe_cfg->verify_time = cfg->verify_time;
> -	fpe_cfg->tx_enabled = cfg->tx_enabled;
> -
> -	if (!cfg->verify_enabled)
> -		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
> -
> +	ethtool_mmsv_set_mm(&priv->fpe_cfg.mmsv, cfg);
>  	stmmac_fpe_set_add_frag_size(priv, frag_size);
> -	stmmac_fpe_apply(priv);

Well, I would prefer keeping stmmac_fpe_set_add_frag_size() before
ethtool_mmsv_set_mm(), but not after, the VERIFY process should be
triggered after all the parameters are set.

> -
> -	spin_unlock_irqrestore(&fpe_cfg->lock, flags);
>  
>  	return 0;
>  }

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
