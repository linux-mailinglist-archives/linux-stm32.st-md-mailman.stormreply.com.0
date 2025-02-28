Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8B7A48EE7
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Feb 2025 03:52:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 027EDCFAC47;
	Fri, 28 Feb 2025 02:52:38 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F196FCFAC45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2025 02:52:35 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-223480ea43aso41151195ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 18:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740711154; x=1741315954;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zYQdPVJK9ENC+FmWjq1SRLNqpphJKsZVKqKTbvYauzA=;
 b=gla8iaVMsiVtHPjx1ax+Un8mVm1jbA+wz6Fba1HYB07Wwz35zCKBfam0CzpsHNp7mj
 zFm2+AO6ZeHK4KFNnGBHSMVOWAzswgSBiYb7R5MBv0SCstHxuBZfUD8hL0e9F+rApUX+
 05BmoUyiOy0N9nmb89FLaOCeAbCYjSGNGb/vLk4ZC7TudgIeuBLJJn/QZzaJCxIh6zfz
 MrGZhoetdXkGJq8BpuP6+NIdaWVHzHRbf3uKwavsdJzLBw77ASlUQuRm2xJlXJvntTEE
 +ibbSKOb8NdyrNqZtgjxhICGcGTIlKaC4REnYPYJyyNDGJDOq7+T+Q3BNwNgCrJ6may2
 TIbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740711154; x=1741315954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zYQdPVJK9ENC+FmWjq1SRLNqpphJKsZVKqKTbvYauzA=;
 b=SzYLhd8/tJGqUq4nw54tPKtZr8IOuOjDfQaxgbH6KM2LSVkdrRrnhHu/ud4gFbVJBU
 nQ4pRiTmsGju6MMo5L/83m0/JcitegO9+woQQFoGDlbRilNTmMKXQetTaUDgYTfs4HLz
 w+CxN8WTQIZ9Rmxtt+jgf6+pIrMlNKniervl+bZNHidp1qYEsiLBOPFvSMdCHq1b9i0v
 cQ/cKeRSRC4nlTZx82j6UmjOuRAAq8cu5OtVRrw5qp0+GClcYO8Pw5Lq14VQOCfJCh0z
 BBAg3HIKG4wPMejylKY+0P68D8YtBLnYz6PW+BN3qrmQpvzojpqaiUMZD5AnxITzVmRe
 8Ufw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz/0s5Kr1riNIyzt/bWBWDpZy6sqRSstusm0L8Jtg4/yPjPS67w3UQshTrRxubytVVXWhSGjMJtkBTmA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyrBuOfJsCn6MZTb+xW/3c8Y1GqHhbwLcALIvfJU3N9xSZyRjoK
 RHmDLPO0KUmioNNnYw4QQDfEcgdGGwR0GWVYpxXHJdhpaUfreJFk
X-Gm-Gg: ASbGncs9oe5fU3ncZMBcJFB/sssNUk7N5bXrpNlILXOompv91tzxml2liMtyPC2dXYt
 DV3UUNqTsc70SNgv7nZ4UWhMxbInMTNBbtZu6SmuUTuF9nNYxjlG5+1EuZwQ8DuBpESAgGVnYYD
 FRWsa0tUDCSAb5PXr2yERTKRMXo5wBJN9870EjKmWrva+i+o8bmWgh6Mo+b5zbfNzZ+MwUSS/Cn
 LDPqabr8A53782vk1i/yamctd/THUiARbmcrAqt6Sts8B3MEXlhFO2HyPUypPJVOjo3kayo8EfG
 GaBFSeVOsdmdae37miq+yp0=
X-Google-Smtp-Source: AGHT+IHaqgolZnBHpg/hTDrE86Pp13wwGc6p6xtFrspmuVKyv7VoeiQOT/3UPkYXRlSlielhuf1AKw==
X-Received: by 2002:a17:902:e54e:b0:215:9642:4d7a with SMTP id
 d9443c01a7336-22368bd1f52mr28089615ad.0.1740711154400; 
 Thu, 27 Feb 2025 18:52:34 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501d279csm23221655ad.44.2025.02.27.18.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 18:52:34 -0800 (PST)
Date: Fri, 28 Feb 2025 10:52:25 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250228105225.000015f5@gmail.com>
In-Reply-To: <E1tnfRy-0057SX-Lj@rmk-PC.armlinux.org.uk>
References: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
 <E1tnfRy-0057SX-Lj@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Thierry Reding <treding@nvidia.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jon Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 5/5] net: stmmac: leave
 enabling RE and TE to stmmac_mac_link_up()
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

On Thu, 27 Feb 2025 15:05:22 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> We only need to enable the MAC receiver and transmiter only when the
> link has come up.
> 
> With commit "net: stmmac: move phylink_resume() after resume setup
> is complete" we move the race between stmmac_mac_link_up() and
> stmmac_hw_setup(), ensuring that stmmac_mac_link_up() happens
> afterwards. This patch is a pre-requisit of this change.
> 
> Remove the unnecessary call to stmmac_mac_set(, true) in
> stmmac_hw_setup().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index e47b702fb9f9..c80952349eb7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3506,9 +3506,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
>  		priv->hw->rx_csum = 0;
>  	}
>  
> -	/* Enable the MAC Rx/Tx */
> -	stmmac_mac_set(priv, priv->ioaddr, true);
> -
>  	/* Set the HW DMA mode and the COE */
>  	stmmac_dma_operation_mode(priv);
>  

Tested-by: Furong Xu <0x1207@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
