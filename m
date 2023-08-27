Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE3778B3A7
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 16:52:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41B7DC6B459;
	Mon, 28 Aug 2023 14:52:15 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E01F2C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 17:33:22 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-594f8a7125cso10689137b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 10:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693157602; x=1693762402;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AXRQ29Kd0gz5Nx/WOSU5Qc0o5kViYnspMVCSG/2JHCQ=;
 b=H4w6CxSGMhrSyB7dJuVFCZihopAdGrrqeMrUtEGpAhlSXuGFNqzoRJMfkKntd5tHgv
 ndfbxdoWLH0YzQXsdYuUVst3dzTR5JGFFjRF+6Ab1ufVHeEtnBQOC9/zwDXieMt7Aumo
 eHcBH5P9SMLp9ZeOLWWAvnBET8Le7niADgah7MFrfNz7E73zjx0jLBrwtYRhr9oB+eTP
 8//xCXaXsgbu4UbrXNnAavTxIXZivS6//g1wDFd7OvZA5Xyww7zOTHLi/DFZUNoF785B
 t3yonuYXHkevN6sEuU2OukXMoLKKrKf7cZ5TqEtaO5AptwgLQ5T9VZd8BfR/nZ0f81UU
 lQNQ==
X-Gm-Message-State: AOJu0YzgD6yYtL027iqGbbmT6JNhZ64LZGeCnDjG06MXvx2Amtfg7vk2
 fzsNhvK/i02GTTzoDa6nFAuOF0rVv+iyjKl85AI=
X-Google-Smtp-Source: AGHT+IFeGyy/bOxlt/AopeThQo710RCsTrK7BUhmNx2WxxR/Zx+G5YbigEwuQUWlQAo8X0U6SjRSRv2LcPeHqj5YXsk=
X-Received: by 2002:a05:690c:2d85:b0:593:47ff:bd7 with SMTP id
 er5-20020a05690c2d8500b0059347ff0bd7mr4875229ywb.46.1693157601831; Sun, 27
 Aug 2023 10:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230827134150.2918-1-jszhang@kernel.org>
 <20230827134150.2918-3-jszhang@kernel.org>
In-Reply-To: <20230827134150.2918-3-jszhang@kernel.org>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Sun, 27 Aug 2023 19:33:10 +0200
Message-ID: <CANBLGcwFW_Y4PC1hxJ7OQN-h025e5wwoCNwnk8OXh3ALFQPcXg@mail.gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
X-Mailman-Approved-At: Mon, 28 Aug 2023 14:52:13 +0000
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: dwmac-starfive:
 remove unnecessary clk_get_rate()
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

On Sun, 27 Aug 2023 at 15:53, Jisheng Zhang <jszhang@kernel.org> wrote:
>
> In starfive_dwmac_fix_mac_speed(), the rate gotten by clk_get_rate()
> is not necessary, remove the clk_get_rate() calling.

Thanks. I suggested this change during the initial review, but someone
wanted the code as it is. I must admit I don't understand why, so
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> index b68f42795eaa..422138ef565e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> @@ -30,8 +30,6 @@ static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigne
>         unsigned long rate;
>         int err;
>
> -       rate = clk_get_rate(dwmac->clk_tx);
> -
>         switch (speed) {
>         case SPEED_1000:
>                 rate = 125000000;
> @@ -44,7 +42,7 @@ static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigne
>                 break;
>         default:
>                 dev_err(dwmac->dev, "invalid speed %u\n", speed);
> -               break;
> +               return;
>         }
>
>         err = clk_set_rate(dwmac->clk_tx, rate);
> --
> 2.40.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
