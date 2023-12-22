Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 040A581CB73
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Dec 2023 15:45:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FF70C6C820;
	Fri, 22 Dec 2023 14:45:04 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8520CC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 14:45:02 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2cc6b5a8364so20361621fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 06:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703256302; x=1703861102;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yGdflJjpqTzGgrTpB9z3udClEdTa0y2wd5bxJETyASg=;
 b=ZT+ayGSGZkm/WfKdWbG6Lesnok2Ao9jCOKMCuGEC0SfrPpzIQ9niMyCY81neN1UoaA
 H5nzfCxmWtLdQNAlrakzXF92PVc/zMBgFZe+Q2Bo1kTfBNu7DAQGAVtIsX8Kyw/IT8zD
 yLk5aUouMRsjb2JHxGIxcMdp4630tey4epxh6niu2u3AJRzrCZ8/7oVMBwHqt9EaI0uD
 ofUgcswdRNljm1wKeHCTbILSHysPk8OtR1Ql1d4kkyMiPNt5Z27z2wQmolfCYVXegk1p
 VZxyhM9WvmI/n3yb7OyGXUZdO4bMFIkq/8Pq8dsgpjlTtx5rMmSuLfjhjj/2d5H2Xion
 0DaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703256302; x=1703861102;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yGdflJjpqTzGgrTpB9z3udClEdTa0y2wd5bxJETyASg=;
 b=Opdw+jlxPXQRmiUZZ1n0R0w4y01M+P5VciGukfm/ivpHuCUWPkPqqN3vvKhgkNd74L
 yPiMSv3Oafyd+gX1ziB9yfnWPv62GFbrlbZX/QI5mgHP8bqdLXKvefwRSaMWf/VfDkRh
 40xV4aMb4fPFyDO1mfoMpJHB9Xx7Fu7w77WR0putFki9GB5W07B990NpEQSOdkXD8Jm0
 ro5J/DLs2aU60p+rGjex15oOBassIy7D5AaFcTwcu7YpIiF1cTigc1d1e/T1uHigoXlE
 1Z8YM7U9Kw6xjGfqZ+f2+MnoYylEGgtqrN1QwrMkiG89VvgSKDMT1qcf2OoQV1WjnB6y
 6Ghw==
X-Gm-Message-State: AOJu0YypFZ71q+xgo4rJuy9tfkVqVIdmiFC+WRWq8q/hMMFJmzveA1W0
 VLZOFN9Vr+B5ClBm9iPGv4Q=
X-Google-Smtp-Source: AGHT+IFQ7bVzkfn7UHoPdtCntTVZBHNA/6WaE0c0joJuTXolxhHj6vDvJOSq0tamCojdPZB333Wu0g==
X-Received: by 2002:a2e:8742:0:b0:2cc:620e:873 with SMTP id
 q2-20020a2e8742000000b002cc620e0873mr665971ljj.15.1703256301472; 
 Fri, 22 Dec 2023 06:45:01 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a2eb052000000b002cc6c35aa5bsm616191ljl.128.2023.12.22.06.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 06:45:01 -0800 (PST)
Date: Fri, 22 Dec 2023 17:44:58 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Leong Ching Swee <leong.ching.swee@intel.com>
Message-ID: <kmmjm4sf5geudch54nmehl3ibkpwvlgbhpf7y6quhqy3gnqg32@gcvwlvzec6pn>
References: <20231222054451.2683242-1-leong.ching.swee@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231222054451.2683242-1-leong.ching.swee@intel.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v1 0/4] net: stmmac: Enable Per
 DMA Channel interrupt
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

Hi Leong

On Fri, Dec 22, 2023 at 01:44:47PM +0800, Leong Ching Swee wrote:
> From: Swee Leong Ching <leong.ching.swee@intel.com>
> 
> Hi,
> Add Per DMA Channel interrupt feature for DWXGMAC IP.
>  
> Patchset (link below) contains per DMA channel interrupt, But it was 
> achieved.
> https://lore.kernel.org/lkml/20230821203328.GA2197059-
> robh@kernel.org/t/#m849b529a642e1bff89c05a07efc25d6a94c8bfb4
>  
> Some of the changes in this patchset are based on reviewer comment on 
> patchset mentioned beforehand.

Thanks for resubmitting the patches. At some point in the past they
saved me some time in fixing the DW XGMAC on my platform.

-Serge(y)

> 
> Swee Leong Ching (4):
>   dt-bindings: net: snps,dwmac: per channel irq
>   net: stmmac: Make MSI interrupt routine generic
>   net: stmmac: Add support for TX/RX channel interrupt
>   net: stmmac: Use interrupt mode INTM=1 for per channel irq
> 
>  .../devicetree/bindings/net/snps,dwmac.yaml   | 24 ++++++++++----
>  .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  4 +--
>  .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  |  2 +-
>  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 ++
>  .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    | 32 +++++++++++--------
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 29 +++++++++--------
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 24 ++++++++++++++
>  include/linux/stmmac.h                        |  4 +--
>  8 files changed, 84 insertions(+), 38 deletions(-)
> 
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
