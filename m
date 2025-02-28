Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1233AA48EE1
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Feb 2025 03:51:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B86A6CFAC47;
	Fri, 28 Feb 2025 02:51:30 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7944ECFAC45
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Feb 2025 02:51:29 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-22356471820so24108665ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 18:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740711088; x=1741315888;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uxfrttinpfziJbmXgIfvT4LSMdxWcEB9U28aIsi8kko=;
 b=nitYv7lkAUtQ9lWciNzUQ4DbzwITlANkoZhsEAZznZmL4SqjmvWAlOYoDn8saTsXiz
 Sl1tElVSYA/8c6GvxaRu3PxKAgHscEsuXKvZxqL1v06s93EwjC9PfDRGjf/cnZBv1VO6
 xlQMaRdataSqC9F2q7nXlbsR9Th3+b+XjbZt93BmO2IjHmtXtNfNXvub28FsJAnEt1Xq
 m6buv850Ox3ttHqnYJdRrq7m7ppLSzGw/oH6J9/Jn8qP1JRyaFC5rh1AcoNSSKMcuWFO
 ZAodAMW1P9mnF3w9D6NNozmKdI/QktEXv8YGV9UhQ2xcDWRKP4UNywCXAK8/OAImMy1U
 z0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740711088; x=1741315888;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uxfrttinpfziJbmXgIfvT4LSMdxWcEB9U28aIsi8kko=;
 b=q3BJ8+u4+bXF8hzYks/Khm8pRozQUNDZOA4Xvp6GcvlKfjrk9gsxGcCOXrEiKB8xW6
 mKc6Jt/mEdgTmmbA3D/Wkb+OpwbId0/zvJaarseTbU9Z2oduiuZEX9fuAccKigVWbdH0
 buNJgcNPGoHLWYBbzuKn7vUzLOauWD4iaZXCeSljaawrCvUoQvqzkFiQUeNEjkBnqnxz
 Hztv19pxgOXJhujavc6uiQLsOOVAMp7pNC9U5xhVKJ9GM6SOFZcoMYaE81mImaX95Hon
 8UZMhqBpLvpngkWq47etiydvJrIjJUXp14BozrjpNM4fWimm/3NvEITt2LPjQImQFUyr
 1Z8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKjO0OSuJnDc9apTeSjc0FC1qNMU3cbO0liKR0di90bHybQVGLiQz5elPtWrG2A6GaiCalcUmSFiqDCw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz7EPmHr4bUfEWR35Uk7+vtDpEymxIRDO6XMiJHvJMq8U+SzCBZ
 6NWMIFdtqSJ3laGO3tK6wJTgrtPlDTZZepHJ6pF4IfX12009QIPT
X-Gm-Gg: ASbGncsjWthymHZJZrRdEgA8zY2wIkDOIw0O4YeoGEkAz6ogHAo3Cqqr5JD1DbH5rEI
 yD13r2khKf0/X7qfcuqEqtrQBDWf5ciCMu1QEHv86q/A7IofiglbuSrgEcAhTSd5kIjT4OafSDX
 nyhr8OPawRwzE5VZQJk4SVpDZZ4EH9jLzUjtbHUSGs5TDgaYT2cctWjqu3mm4L3ZCHxEL/ZhCy9
 A8o0qdkEx1ziZxipRa5UQT+vcoU8k0qB8kYDCjQtpt6odc/e8u8MMXULJ3qufsyXXh+luVMh7Fr
 7zxtfQfedpwp14lg7l9tSGo=
X-Google-Smtp-Source: AGHT+IEKF5Ov9wR3zxBGu/lY9K2QndPcV7vnjEoWJ66hnW/s1gKFCPCGJh1hzPM3pWau6kekz6Qo7Q==
X-Received: by 2002:a17:902:d506:b0:216:3466:7414 with SMTP id
 d9443c01a7336-2236926a542mr23196615ad.44.1740711087768; 
 Thu, 27 Feb 2025 18:51:27 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501d3e63sm22964315ad.11.2025.02.27.18.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 18:51:27 -0800 (PST)
Date: Fri, 28 Feb 2025 10:51:18 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250228105118.00002723@gmail.com>
In-Reply-To: <E1tnfRo-0057SL-Dz@rmk-PC.armlinux.org.uk>
References: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
 <E1tnfRo-0057SL-Dz@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Thierry Reding <treding@nvidia.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jon Hunter <jonathanh@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 3/5] net: stmmac: remove
 unnecessary stmmac_mac_set() in stmmac_release()
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

On Thu, 27 Feb 2025 15:05:12 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> stmmac_release() calls phylink_stop() and then goes on to call
> stmmac_mac_set(, false). However, phylink_stop() will call
> stmmac_mac_link_down() before returning, which will do this work.
> Remove this unnecessary call.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 9462d05c40c8..e47b702fb9f9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4120,9 +4120,6 @@ static int stmmac_release(struct net_device *dev)
>  	/* Release and free the Rx/Tx resources */
>  	free_dma_desc_resources(priv, &priv->dma_conf);
>  
> -	/* Disable the MAC Rx/Tx */
> -	stmmac_mac_set(priv, priv->ioaddr, false);
> -
>  	/* Powerdown Serdes if there is */
>  	if (priv->plat->serdes_powerdown)
>  		priv->plat->serdes_powerdown(dev, priv->plat->bsp_priv);

Tested-by: Furong Xu <0x1207@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
