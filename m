Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED40249D07A
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jan 2022 18:14:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1637C5F1E1;
	Wed, 26 Jan 2022 17:14:28 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E239C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jan 2022 17:14:27 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id e8so325466wrc.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jan 2022 09:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gXtdrW27fCZ/wJUPBVbcRIlDfwjyibpVlA/v0Qe0N+A=;
 b=ShEI2vtBBOEzdM8KBa2+C+sra9rF3eUL8rq9LzYJlSnCdzLTrR9bprTUNRFKfPviWE
 9LxSGdHftoFFaEfs5hs4wlUS92fvaNMhsVvPgTvT2ilBpLXxDvPOF61ztFbDBhyABL1T
 NeAJUgNQN40uFADgvWGHHvtXEXm6/Ml8nuddZ7Oji2LkhqqcjoyLsgnsrnl+kd6/i1iI
 yQRqPJInXft4GD+ohxuxSx1AAny0JGtYF1WIsfY27wSah06MVOWb4YXlTQSzlElHgJAI
 dMjR619JNdTUz0aIjR8ixqhJOIRS0C31q6OhH3D1GxGbZ8jz/18gsCQB3V33I37fzdsc
 T8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gXtdrW27fCZ/wJUPBVbcRIlDfwjyibpVlA/v0Qe0N+A=;
 b=JHtpjE5LREGI/N8KjTdtPM51hlYSw4Tq3/gONLMAZFydmFOKfyrRmt7MRaSbJiSb6f
 nFuK4OeWowq7Db1nYGjFpasnOrzoz1zjRBySBw3p9YDT+2aY+1ZFApXZKxtUXqjztFHU
 7dXxM8L1iI7aa2hqcKxqGB+q/LYjs7luqfKj1au2pfEYKQSp5RSpjZwNm+5z8CCFxLnJ
 NHwoObkeMsimkvSzezO8Lfy9UWh18W05iQ7TG+R0SHPXklALXJ7x+BfGUH9bXQpoqD8h
 rB7DGwhKg0fyyizXAdC6ymQttmrkdqkQ55RcWtJuskRVWXC8JSiGx2OVkZJ/FEolTQl+
 EVJQ==
X-Gm-Message-State: AOAM532ghAzcU0IAMG+GZ7vfqh4No6Q+M3jj4y7qblnlcB9i9XiaolTf
 shuK+YiqDODNi0RWqxXlP+A=
X-Google-Smtp-Source: ABdhPJwj+3itbOp8dJx8AHey5VYTt5YOotHUNr1kojxGb+QydODRJny0bAdqTKmSHnhQdy6BUYrH6g==
X-Received: by 2002:a05:6000:81:: with SMTP id
 m1mr18100420wrx.385.1643217266591; 
 Wed, 26 Jan 2022 09:14:26 -0800 (PST)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net.
 [86.58.32.107])
 by smtp.gmail.com with ESMTPSA id c8sm4800962wmq.34.2022.01.26.09.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 09:14:26 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jisheng Zhang <jszhang@kernel.org>
Date: Wed, 26 Jan 2022 18:14:25 +0100
Message-ID: <5533854.DvuYhMxLoT@kista>
In-Reply-To: <20220126165215.1921-1-jszhang@kernel.org>
References: <20220126165215.1921-1-jszhang@kernel.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-sun8i: use return val
	of readl_poll_timeout()
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

Hi!

Dne sreda, 26. januar 2022 ob 17:52:15 CET je Jisheng Zhang napisal(a):
> When readl_poll_timeout() timeout, we'd better directly use its return
> value.
> 
> Before this patch:
> [    2.145528] dwmac-sun8i: probe of 4500000.ethernet failed with error -14
> 
> After this patch:
> [    2.138520] dwmac-sun8i: probe of 4500000.ethernet failed with error -110
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/
ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 617d0e4c6495..09644ab0d87a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -756,7 +756,7 @@ static int sun8i_dwmac_reset(struct stmmac_priv *priv)
>  
>  	if (err) {
>  		dev_err(priv->device, "EMAC reset timeout\n");
> -		return -EFAULT;
> +		return err;
>  	}
>  	return 0;
>  }
> -- 
> 2.34.1
> 
> 


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
