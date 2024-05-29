Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9699A8D3285
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2024 11:05:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44E3EC6B47E;
	Wed, 29 May 2024 09:05:21 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62170C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 09:05:14 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52ab1d7243fso805327e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 02:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716973513; x=1717578313;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2uhqxaKdsBnrqyALusZlhX48zdbF/2oM3lehcGhLjfU=;
 b=m9oPSuK9saPcArU49rv88Pc3yr4CYFSO+sKgzspFiZa0JpTy4gngnIzLaN6ObII02v
 j/UveWbUw6NrrZ2sVxWyZVD6GYI1u0ARrUgO+3ibuW1Aq2aKUGZSmCzJsgB1OduGJkjE
 +f1FZSwr3k7DMlmXWmtdR5TOKLC85B+lrQcztyYQpVbHxBliH6DBr/Itgs48aYNmhtBK
 gYx2jBNXsVmlkVSPOLLsm4R2LpE/kDY5itmBWdUTVZBVncHXoFJVBv0w+xSVsrXBDbuQ
 mY3Vp59AbmlPM2S19GtBBQXU7y1W5BkZhs8jFFJra9opZib36OKU2ssermuTxv3Z4gcG
 30Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716973513; x=1717578313;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2uhqxaKdsBnrqyALusZlhX48zdbF/2oM3lehcGhLjfU=;
 b=JjhQ7Q4h5FXNKt/sLq+UZYt5X9pD4DF265ujUS5VtW60DmOykUMWQK1vWOj782Aq94
 t/5Toeu+mouXhAtHSbAy91pQt26lGkg84zoN0HGojacDHgF9EjMbmj7AW3kEKUoNhYeY
 20TnYwWn07BmlX9igRLvW5Kn9bEAFEaQjV0jg3Of2o/jE/wN4g+EUI/lubkoaWV49GEk
 FiEN3PjDt1/p9kxZipH3ImrbDligWl9hu+ZTQCAqDfYCdsK2LO4ILorDYCnTNGTW0JZ3
 wnqNSIt4axE0keqhUi+bGdTX9uvqXXeNOVBqlKVRMXg1x+5wGDrHyP1azAzsI3etCT9O
 UhZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiU5A0Da6xuIO/BuKucv2VB/BgIUqFnhdhGZg0INL6KXdikkKFcdX4v27DR/N2wD5Ck1+Mo2yK8Hfk/FZI58xqt6sXoRwpg3uhbDN5yRiEF9E0pXxSX/kR
X-Gm-Message-State: AOJu0Yxhkkf/nj+aXb5tYzlWS4zf/DLKEP3NVfYPQLj1rA7HEG7Q8paT
 JkmaiGMF9GS2+Uz7PFhl+zYCALNRAl4l3ov6Ox86ILuApaOut8a5
X-Google-Smtp-Source: AGHT+IGkJLkQMou+KJ5AYD271MNcgYNd5Ks9H4jDXgA41PXt63NDcXHszC5RogGekpQjLjW87jJmTg==
X-Received: by 2002:a05:6512:3c9b:b0:529:b734:ebc9 with SMTP id
 2adb3069b0e04-529b734ec38mr4424149e87.38.1716973513190; 
 Wed, 29 May 2024 02:05:13 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296e886ea4sm1175791e87.26.2024.05.29.02.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 02:05:12 -0700 (PDT)
Date: Wed, 29 May 2024 12:05:09 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <bfiqy7q3fb6ybmpszd7ktvuxr3kec4z2ra455pdqjkn6i4fb64@crtsjh4bslim>
References: <Zlbp7xdUZAXblOZJ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zlbp7xdUZAXblOZJ@shell.armlinux.org.uk>
Cc: Vinod Koul <vkoul@kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/6] net: stmmac: cleanups
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

Hi Russell

On Wed, May 29, 2024 at 09:40:15AM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> This series removes various redundant items in the stmmac driver:
> 
> - the unused TBI and RTBI PCS flags
> - the NULL pointer initialisations for PCS methods in dwxgmac2
> - the stmmac_pcs_rane() method which is never called, and it's
>   associated implementations
> - the redundant netif_carrier_off()s
> 
> Finally, it replaces asm/io.h with the preferred linux/io.h.
> 
> Changes since v1:
>  - Fix patch 1 "Drop TBI/RTBI flags" which didn't transfer correctly
>    between my internal trees!
>  - Update patch 5 to address all the asm/io.h in stmmac
>  - Add Andrew Halaney's reviewed-by
>  - Add patch 6 cleaning up qcom-ethqos phy speed setting

Thanks for the series. For all patches:

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

* Note I've got your messages regarding the STMMAC driver and
RGMII/SGMII/etc PCS. I do remember about that and will respond to all
of them either later today or tomorrow. Currently busy with my long
lasting DW XPCS series.

-Serge(y)

> 
>  drivers/net/ethernet/stmicro/stmmac/common.h       |  2 --
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 24 +++++++-------
>  .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |  8 +----
>  .../net/ethernet/stmicro/stmmac/dwmac1000_dma.c    |  2 +-
>  .../net/ethernet/stmicro/stmmac/dwmac100_core.c    |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac100_dma.c |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  8 -----
>  .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  6 ----
>  drivers/net/ethernet/stmicro/stmmac/hwif.h         |  3 --
>  .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 38 +++++-----------------
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   | 17 ----------
>  12 files changed, 26 insertions(+), 88 deletions(-)
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
