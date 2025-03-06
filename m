Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5DCA54094
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 03:20:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31914C78F6E;
	Thu,  6 Mar 2025 02:20:49 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F8C0C78F6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 02:20:47 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2234e4b079cso1615635ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Mar 2025 18:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741227646; x=1741832446;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G2hivNpIs9Yw9hGUFhjmLsY68kEzvfhce8DVHWNRyC0=;
 b=hhv4bxCzLWK/5Rrpqb7eL+4uz84dHIAWYBvbVX8pbSx74d6NEQX+bzHZpO1xm1n8QP
 LxTtYFhBfEVkJoKM5jiVVdV0pjxrwt4CYDqZJZaTFlvdTigi9A3so0C+0XjUB8WJRj+r
 T4E0hhbrgMvKuWxv38muzUAhjbuslDJ8pL8qTKM+L0tM87dNgAZ+z1AgcI2704o85DLh
 gedpRiDyZCSVK+J3QO4d5DFcKOe+C7Amd8za8a5UQtCdJoakBrDqWkKJ4gAT2I8+Gvoa
 qivcnPVV390eTeui+uldljJ36A7F6PYzjvRYv/lAqoC9cGfy+9SPdIsTEHwzlATqhFz5
 72iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741227646; x=1741832446;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G2hivNpIs9Yw9hGUFhjmLsY68kEzvfhce8DVHWNRyC0=;
 b=IS+lGi/qXOC7X+OeaCU6jqXJbQD4bpsN881v9EMT2vW+3eYeDyss0IZImcDz0LIF0w
 BhoIIED33GvPc4HRFyueUyfMYrYXtTy/btz2KY21oom3UFjOfCkuOKb2ZZCQMY1gF/kN
 CwnkbENQn9oOpAH34h6boUinDVMIZEcZLYpeKdpm/FDEL/XG2S4zOE/03/3fNWBWmWqt
 C0JOg6oHMXQeoynQWpgjelH29qTiQ6r0zjht6aV3uHTVO+ArX5IEyWZn2QsqCdPjiOg2
 LSkRlsUueD/yJRiX/lo3EujDVVNmtnAVtC4UFlts17084qWyQROl8Ez1N8DrsYfL6BC+
 pdmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCcWMJ2ZY60pq5cTz3tySVa+UjDIXBzJj+nXsDc2rZfxvFcPvEG0GcTb7NtH2rY3+Pbb0mPLNYawU2Zg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxbKoh5E3kEyPGt2dO67a4elnjYUiPIzFlcwDE+iqLV+rBTMkbY
 oYz/1cxhStTCnxS4TvlEX0baGZhCqXTAOMT7s7jiyqvKZt9iVwaC
X-Gm-Gg: ASbGnctbv60jIWceIjCgXy8p9Zwoan1qV8eiHQEw3H08a1kY8/E5fVo17cMWcSijhEl
 Y3N+OOWxA8nZECW7pEizYfxgyzfmYzHt29cuqflkSY683+iwiu2y0rOL4WProQTSIWyYzygCC4k
 lH5y3VRaMxPNUKh6zrFDmrRe1WG64kjeiplswEXojHeg82kOCzDlpHnyQupDd6x9FVeWAa7IDJg
 Jd1OyeeqKCdbnDRuy+YL7jYuyG0ru6xjWMQ+4siNqesGdSFoG2hBfOxLO5PZd6l0wlwCF4WimpY
 cuAFVkzmyILgsCLFcFe86bhX6i4kbCJrqIR24Q==
X-Google-Smtp-Source: AGHT+IHkLXtXH1Ai+gYOOPrG6bG0WcyyOkT8w2yuVJZyzRqP4bS4nX9Piol8DXMXXfkC08Bx4bmSFQ==
X-Received: by 2002:a05:6a00:1788:b0:730:9502:d564 with SMTP id
 d2e1a72fcca58-73682be6b5bmr8585186b3a.14.1741227646199; 
 Wed, 05 Mar 2025 18:20:46 -0800 (PST)
Received: from localhost ([144.24.43.60]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736985387d3sm147939b3a.172.2025.03.05.18.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 18:20:45 -0800 (PST)
Date: Thu, 6 Mar 2025 10:20:37 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250306102037.000007ab@gmail.com>
In-Reply-To: <E1tpswn-005U6I-TU@rmk-PC.armlinux.org.uk>
References: <E1tpswn-005U6I-TU@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: mostly remove
	"buf_sz"
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

On Wed, 05 Mar 2025 17:54:21 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> The "buf_sz" parameter is not used in the stmmac driver - there is one
> place where the value of buf_sz is validated, and two places where it
> is written. It is otherwise unused.
> 
> Remove these accesses. However, leave the module parameter in place as
> removing it could cause module load to fail, breaking user setups.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index cb5099caecd0..037039a9a33b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -101,6 +101,7 @@ static int tc = TC_DEFAULT;
>  module_param(tc, int, 0644);
>  MODULE_PARM_DESC(tc, "DMA threshold control value");
>  
> +/* This is unused */
>  #define	DEFAULT_BUFSIZE	1536
>  static int buf_sz = DEFAULT_BUFSIZE;
>  module_param(buf_sz, int, 0644);
> @@ -218,8 +219,6 @@ static void stmmac_verify_args(void)
>  {
>  	if (unlikely(watchdog < 0))
>  		watchdog = TX_TIMEO;
> -	if (unlikely((buf_sz < DEFAULT_BUFSIZE) || (buf_sz > BUF_SIZE_16KiB)))
> -		buf_sz = DEFAULT_BUFSIZE;
>  	if (unlikely((pause < 0) || (pause > 0xffff)))
>  		pause = PAUSE_TIME;
>  
> @@ -4018,7 +4017,6 @@ static int __stmmac_open(struct net_device *dev,
>  		}
>  	}
>  
> -	buf_sz = dma_conf->dma_buf_sz;
>  	for (int i = 0; i < MTL_MAX_TX_QUEUES; i++)
>  		if (priv->dma_conf.tx_queue[i].tbs & STMMAC_TBS_EN)
>  			dma_conf->tx_queue[i].tbs = priv->dma_conf.tx_queue[i].tbs;
> @@ -7973,9 +7971,6 @@ static int __init stmmac_cmdline_opt(char *str)
>  		} else if (!strncmp(opt, "phyaddr:", 8)) {
>  			if (kstrtoint(opt + 8, 0, &phyaddr))
>  				goto err;
> -		} else if (!strncmp(opt, "buf_sz:", 7)) {
> -			if (kstrtoint(opt + 7, 0, &buf_sz))
> -				goto err;
>  		} else if (!strncmp(opt, "tc:", 3)) {
>  			if (kstrtoint(opt + 3, 0, &tc))
>  				goto err;

Reviewed-by: Furong Xu <0x1207@gmail.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
