Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 552E49E5174
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Dec 2024 10:34:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E93D3C71292;
	Thu,  5 Dec 2024 09:34:49 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E990C7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Dec 2024 09:34:43 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-215770613dbso3978305ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Dec 2024 01:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733391282; x=1733996082;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=svw3hVWhjLUsKCnyMo5bW6Ng4sD85ogIrMfseX9wbyA=;
 b=hSBfbx4gzy9XbSwytU5qmp9bVBtov3hiPtAb7HAIvKzRaMTgYG7kh7e5P05dP7OXb/
 gbJulVbTIsIrbpWrsg1GFXhDQ/b1VRxliQNajVyHNiqnAZmZjP8k8wnQ0ik87+gtXY7R
 wTWIXFdxrPsJEQEJXkt7Gz1eU6S2ltN98m4aNxkCVy9bAygHXRjA641tN0KWzbLvcHCb
 gXAYG7SON/hBsGUZLbthSXhLX6v3Lxa2UiWnrmXf/FeYL93j2NJfGEbDKHam6uV+0D/N
 gJ3CNw/z7wzrpnRTQOGw3uMErUqqn7ZwKY4PTOfwrMtyt4U0S+1XdJQoyzeviyhfk6Kp
 FgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733391282; x=1733996082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=svw3hVWhjLUsKCnyMo5bW6Ng4sD85ogIrMfseX9wbyA=;
 b=VVAl5u8JRuTlrIYreLHyGPiChKkmROgdlgWqfn8zcQGHB6h9pXgJzLNI1x4odIN+nt
 ZkYnach1WWVc7FNE+HLhzLAd9y1zElCx5oM0CgecMMAZnJl+GyjcKCWlMfP6/zE/wvbc
 AF/SYTfeczfiWnQvW9m8y6IMNNRFZar/XN8DYAzVZpqNLeSVshesoXVki5qoEqhFT2fz
 3D7o+9G4YBv5Y3B3cwvMBqeZPnWGTZkmAXaMMj2JtCFAkrOYOUowGNHhz7BPMIvzW35I
 aMJ6Y2JHb1uvlOmqUIbqz7ASESqflLrBtvDOmi3+lF8Zqkl9r8I6FQ2wWagt7TnM0CBU
 rg3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuJo6OmmO/IEVn9ri75+gUMbETjWgtZ0J0OVBjb47u0xpKQUC6x7Bly9he9jaQWmqEvwgMx+6vBaAf6w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy+y9Hltz7jAKNRNx8zMA5Ii8rG0kC4MYXq/H270Mbn4ak9zcdR
 8ou/eSarrYjo8hM8UAleUy4B0CvnS2AtkTzLnDW7EM4y1IrBfOVL
X-Gm-Gg: ASbGncvQMLxModuRksTtkwYJdxy1adnvFIaS9NTgqQok/I8g/doZhjDIibHkUuM7uzS
 vDa3y0nvLaSskA2guYrDosv0cmw8L4Y/2AfqgiCdAotZobwbJAYtIZ1Jsl8whTtd4yWFevkMX0X
 2zAQKmTop/u9zNadyIF3jdyi6bSvZormisrlQwLKNniJtair4irW5rSAPOoIYLsqUaVPwsDyUCN
 nicUzJETHHVxZf0918S6jriJhzgIxzjbphrY0KMQ7F5fH4=
X-Google-Smtp-Source: AGHT+IGGByayQpZUFnuuK54B4xfgnuxti4ZXFGpFEg18KahQT7dWybOnF+z1/CV1gszt9ZR4jHsBdg==
X-Received: by 2002:a17:902:ec8b:b0:215:19ae:77bf with SMTP id
 d9443c01a7336-215bd0d8999mr134561575ad.19.1733391281860; 
 Thu, 05 Dec 2024 01:34:41 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215f8e5f172sm8672215ad.69.2024.12.05.01.34.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 01:34:41 -0800 (PST)
Date: Thu, 5 Dec 2024 17:34:31 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20241205173431.0000779e@gmail.com>
In-Reply-To: <Z1CVRzWcSDuPyQZe@shell.armlinux.org.uk>
References: <20241128144501.0000619b@gmail.com>
 <20241202163309.05603e96@kernel.org>
 <20241203100331.00007580@gmail.com>
 <20241202183425.4021d14c@kernel.org>
 <20241203111637.000023fe@gmail.com>
 <klkzp5yn5kq5efgtrow6wbvnc46bcqfxs65nz3qy77ujr5turc@bwwhelz2l4dw>
 <df3a6a9d-4b53-4338-9bc5-c4eea48b8a40@arm.com>
 <2g2lp3bkadc4wpeslmdoexpidoiqzt7vejar5xhjx5ayt3uox3@dqdyfzn6khn6>
 <Z1CFz7GpeIzkDro1@shell.armlinux.org.uk>
 <9719982a-d40c-4110-9233-def2e6cb4d74@nvidia.com>
 <Z1CVRzWcSDuPyQZe@shell.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Jose Abreu <joabreu@synopsys.com>,
 Thierry Reding <treding@nvidia.com>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: TSO: Fix unbalanced
 DMA map/unmap for non-paged SKB data
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

Hi Russell,

On Wed, 4 Dec 2024 17:45:43 +0000, "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> So yes, "des" is being offset, which will upset the unmap operation.
> Please try the following patch, thanks:
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 9b262cdad60b..c81ea8cdfe6e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4192,8 +4192,8 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>  	struct stmmac_txq_stats *txq_stats;
>  	struct stmmac_tx_queue *tx_q;
>  	u32 pay_len, mss, queue;
> +	dma_addr_t tso_des, des;
>  	u8 proto_hdr_len, hdr;
> -	dma_addr_t des;
>  	bool set_ic;
>  	int i;
>  
> @@ -4289,14 +4289,15 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
>  
>  		/* If needed take extra descriptors to fill the remaining payload */
>  		tmp_pay_len = pay_len - TSO_MAX_BUFF_SIZE;
> +		tso_des = des;
>  	} else {
>  		stmmac_set_desc_addr(priv, first, des);
>  		tmp_pay_len = pay_len;
> -		des += proto_hdr_len;
> +		tso_des = des + proto_hdr_len;
>  		pay_len = 0;
>  	}
>  
> -	stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags == 0), queue);
> +	stmmac_tso_allocator(priv, tso_des, tmp_pay_len, (nfrags == 0), queue);
>  
>  	/* In case two or more DMA transmit descriptors are allocated for this
>  	 * non-paged SKB data, the DMA buffer address should be saved to
> 

Much appreciated for your comments and suggestions, I sent a new patch to fix
this issue. Please let me know if you have any new advice.
https://lore.kernel.org/netdev/20241205091830.3719609-1-0x1207@gmail.com/

Thanks,
Furong
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
