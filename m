Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C786978B3A8
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Aug 2023 16:52:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50A5BC6B469;
	Mon, 28 Aug 2023 14:52:15 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F045EC65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 17:35:53 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-d776e1f181bso2495974276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 10:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693157753; x=1693762553;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yHRJyx7j7BhNrqT0LEFiRvYT/7EP1f7+a5goYW9ZPlQ=;
 b=EkYs6uWloceFx4lf6qAj6cZq8oInXSxa7HppzYedisheYwIrVpU82K1yxd5GFjpExz
 W0qpBeecg/4GUhmoIiHNt3xzhmsr+5seo+IrpFZ7D480CB4GJK+nGVIG9BUCR7uHmoIr
 kd/gRidR5+6jleWuCwJScXZSpi55SeJB8VeOjCk9eKQb+23zYGNOkECc8u59/h9MKtC0
 Zp6MW9KujONHosLkM65LRPtMfGrHsn6hqTcPi+3vMrTcsheH9lxcowsbtiqD1NDyGwff
 7LGhchL785MkQKbg+O5rMsBdF+7CDf1/0bb7FoY0xvxQL9IMsysEzPc9L2LNttJmdDZe
 gu6g==
X-Gm-Message-State: AOJu0Yx5hUEk0t/P9PpGT/UQ0+a3OzXsc8h9bzqZaQwgjrSHGrA21tra
 oHIksxjhrWsOBUqD9kDAO0K46pAFGrsE6D/oyD4=
X-Google-Smtp-Source: AGHT+IFJ1JezbeXTpjjF0OoeKFxHC2a61ED9VzkqbhoT8LTwdtSmsZCpkyXrM/VyazMaxfjC0Yfep1dd4tZSMKxYXzE=
X-Received: by 2002:a25:830d:0:b0:d78:69ad:cffa with SMTP id
 s13-20020a25830d000000b00d7869adcffamr6115368ybk.42.1693157752891; Sun, 27
 Aug 2023 10:35:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230827134150.2918-1-jszhang@kernel.org>
 <20230827134150.2918-2-jszhang@kernel.org>
 <ZOtWmedBsa6wQQ6+@shell.armlinux.org.uk>
In-Reply-To: <ZOtWmedBsa6wQQ6+@shell.armlinux.org.uk>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Sun, 27 Aug 2023 19:35:41 +0200
Message-ID: <CANBLGcyfxNSgNjNvU1_N2ZC5q1YjqDjS69E7grbfCYM7bmm=-g@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
X-Mailman-Approved-At: Mon, 28 Aug 2023 14:52:13 +0000
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Samin Guo <samin.guo@starfivetech.com>, Jisheng Zhang <jszhang@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: dwmac-starfive:
 improve error handling during probe
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

On Sun, 27 Aug 2023 at 15:59, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Sun, Aug 27, 2023 at 09:41:49PM +0800, Jisheng Zhang wrote:
> > After stmmac_probe_config_dt() succeeds, when error happens later,
> > stmmac_remove_config_dt() needs to be called for proper error handling.
>
> Have you thought about converting to use devm_stmmac_probe_config_dt()
> which will call stmmac_remove_config_dt() if the probe fails or when
> the device is unbound?

+1. Using devm_stmmac_probe_config_dt() seems like a better solution.

> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
