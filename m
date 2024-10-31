Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA9D9B812D
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Oct 2024 18:29:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4AAE0C78035;
	Thu, 31 Oct 2024 17:29:56 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83C7DC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 17:29:49 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43155a6c3a6so1632745e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 10:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730395789; x=1731000589;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y2c2+8hCBcHHsv3z7ugoMx+aG94aS+LJBUKz0Fv+Ygw=;
 b=hys2JFD/JHRJcWl8YPYKpwjdTJqiUTEywqsX9mN8HPsmb6+il+qFWqsi6jV31NxCaW
 Ym/yrx92XVqp1IodmO/hJhyUlXqH5swBp1Z7h5exqbuuMR9qxbiVbzk3/8szGRyvZtPD
 uTbQvV1XMO9Jrv36ieoazOzNLgWm6aJ3T6eSD2H4kZ6yfOAvFPEcoJb7p1lbit7x1Mm+
 c8iouKKXsm7IEsxDapwnD0sEEUtNCIC+CukWofd0MkPUCV+Nun4YbRjKuK/jjziycp05
 wc/JfbhYteMCnExe/zKd2tYykA9w3UWwTIpBQdcyjcfCI/SILhpTojLEkcPcTT9GQjAp
 +W5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730395789; x=1731000589;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y2c2+8hCBcHHsv3z7ugoMx+aG94aS+LJBUKz0Fv+Ygw=;
 b=pE01VNXKtThy2BXLZHRzbYEAi4l8aXFqeTvrijbW45Q6D8N47nNo7Hm2Bp7KRXajOI
 4qJhYGhQQkR9f7kubg/+WysZbntIJW0fQYQJ4Z+qB7QARXN4LROYBNB6DJi44I2hryoW
 f1qRToKKSsBhtM6TmODcS8SWnb6frYnuTmd4MaGYYCXW5jv9FEaROlQY0/jwFx6RTp0U
 EP1phokcabg9cb4yqAxqJtpVSdRCEd91DolgZPn80qa/pYLXJglwVzEfKHshmfvaWX30
 lFlcYHOtgcXyE8QcrscXe/PKxmMus4hHBFArMNrrq8Vb+8aImUooVmROigljKSZLvccT
 J/KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxEXWMAupZOFgbjISOxPAc6ELg51qrM+A1tUJtwIHUq9qNZmouhnb9VqPVwH5Vg++J5BvR/FKpIur52g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwoaCCycnI8QwCHB+O28AdZPbxvHOJiQwGjDxzrsxM06SjYZX+O
 GSBgVjK0wq3qa4IcRy3Ss5DGGVepcp9ZDrCsmxVAhT+oIT60OEIz
X-Google-Smtp-Source: AGHT+IHakfGneSPWq42iuCut70oQ1E9rhNIoV1udWPYkJZcYcJIwtNnTlcAC2SE6lmct2XjYknh6Xg==
X-Received: by 2002:a05:600c:1c91:b0:42c:b9c8:2ba9 with SMTP id
 5b1f17b1804b1-4319ad2b318mr76969105e9.6.1730395788864; 
 Thu, 31 Oct 2024 10:29:48 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4327d5ab305sm33621135e9.7.2024.10.31.10.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 10:29:47 -0700 (PDT)
Date: Thu, 31 Oct 2024 19:29:44 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20241031172944.ykgvlsysz5srxyr4@skbuf>
References: <cover.1730376866.git.0x1207@gmail.com>
 <9876134957283296792864da97eab60328f8d478.1730376866.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9876134957283296792864da97eab60328f8d478.1730376866.git.0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v7 1/8] net: stmmac: Introduce
 separate files for FPE implementation
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

On Thu, Oct 31, 2024 at 08:37:55PM +0800, Furong Xu wrote:
> +void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
> +{
> +	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
> +	unsigned long flags;
> +
> +	timer_shutdown_sync(&fpe_cfg->verify_timer);
> +
> +	spin_lock_irqsave(&fpe_cfg->lock, flags);
> +
> +	if (is_up && fpe_cfg->pmac_enabled) {
> +		/* VERIFY process requires pmac enabled when NIC comes up */
> +		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
> +				     priv->plat->tx_queues_to_use,
> +				     priv->plat->rx_queues_to_use,
> +				     false, true);
> +
> +		/* New link => maybe new partner => new verification process */
> +		stmmac_fpe_apply(priv);
> +	} else {
> +		/* No link => turn off EFPE */
> +		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
> +				     priv->plat->tx_queues_to_use,
> +				     priv->plat->rx_queues_to_use,
> +				     false, false);
> +	}
> +
> +	spin_unlock_irqrestore(&fpe_cfg->lock, flags);
> +}
> +
> +void stmmac_fpe_apply(struct stmmac_priv *priv)

This is absolutely minor, but could you please sort the functions in
their natural calling order (callee first, caller second)? It's fine now
that stmmac_fpe_apply() has its function prototype exported, and that
works as a forward declaration because we also include stmmac_fpe.h.
But if somebody were to unexport stmmac_fpe_apply() in the future, they
would also have to move it too.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
