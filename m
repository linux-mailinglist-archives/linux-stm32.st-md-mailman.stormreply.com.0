Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 286CE858508
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Feb 2024 19:24:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5520C65E42;
	Fri, 16 Feb 2024 18:24:06 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0352C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 18:24:05 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2d0b4ea773eso29564241fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Feb 2024 10:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708107845; x=1708712645;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cVDKfJQ+tCuSdXhY6TiavPFjaspEvu7Ad4BGUjaCUAE=;
 b=DYg7XL0ZA99eljNHPshVyOA2za0paTC70Kcsy4qzVuKebuKb6h+8rzkxlCEpL6bCrT
 sq2ecNtuCeSu1ci0drrbRZlSwYVUWyUnKNJnFTmEuRaadhFfogeQ3xTbI7zEADSw8YIM
 iOZ/MqlNH6C3QWuvPz2HmW4QcxBSvrwi00vGGDZ9YVIgzuSVr/gbKYcnlgyJDhd2c8ht
 oUsMKLvotX7czokeXFnpQXijU2rBUWZZ3DvjZI1o+zbrWszGs0EfutdBQbwt4vOBtibW
 4Zk3+8hZ9bmbznQuX9QN810aBdErAxetLkAqSnDGALBaaJ66plEcZ501BPdPue7+qMeZ
 wUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708107845; x=1708712645;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cVDKfJQ+tCuSdXhY6TiavPFjaspEvu7Ad4BGUjaCUAE=;
 b=bK3mNN1Gb9xB/OLCSunhl1OSFKp5E/izeJ1YaS2woSIWXKNvlXq7yH/ywpp2V0JqJz
 YjqdEecMdY0hNxY2bS9BHlxcvAFIjeFdCoJ0KCZ2HeVq19iIl3ixV8G90LuNyfa0HIQ5
 AD96UIl1+sUC5h87z4OKdLhPvOVYyGBlOxrLrzyMc4hx8uKpcMBV8z5SPdzqn/kwN+xS
 1NoVUpIECB36UrLpkPaQDGEhcc/XkgjfXffpJzvm3g8gAgkQet6PCd1Y5OKbX4fo316O
 Fp2AO5fNyH7+5OE96gCpsHH+Tts5gcOntMGhQzK8J1jZL/D/q3v9VPYGMiIIwS8BCNI9
 am5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqkpFTFrULHv+5B0AXevjo41id3YDqSg2tz/vPtGv3kYi9lYnx4QRh6FdaU5Zm4TljCH71vQYWDhzJrkpl3M0pW5PVidXM8WVH6m+6aTON3qcybcdGrE6G
X-Gm-Message-State: AOJu0YyPRfpKL0yRaWzJ0UOeXcQRf7eqvBHsYBkm8P4T9rzYoqaw2LtB
 RWkguPPjhLX2cehIlIIWHh8ofK26lOaaaMhVHXfsOGg65OJn3bqV
X-Google-Smtp-Source: AGHT+IHz8SLuj0HeZjrA59fbpHxEZQx4CNdTDrSGjiJcc/KB/eOtXjEXu1w0IDtU5LUHJY6IknyBAg==
X-Received: by 2002:a2e:7202:0:b0:2d0:e730:b7d5 with SMTP id
 n2-20020a2e7202000000b002d0e730b7d5mr3975909ljc.1.1708107844735; 
 Fri, 16 Feb 2024 10:24:04 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a2e9d19000000b002d100bd4cdbsm40573lji.45.2024.02.16.10.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 10:24:04 -0800 (PST)
Date: Fri, 16 Feb 2024 21:24:01 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>, 
 Jesper Nilsson <jesper.nilsson@axis.com>
Message-ID: <53fctveh4pl3c5wys37c2wcpbsxr7tggw3d3y5eudgrbvr2vdl@fbqc2meg5yv3>
References: <20240216-stmmac_stats-v1-1-7065fa4613f8@axis.com>
 <61bdd802-abe4-4544-8e48-9493a6bb99c8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61bdd802-abe4-4544-8e48-9493a6bb99c8@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, kernel@axis.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: mmc_core: Assign,
 don't add interrupt registers
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

On Fri, Feb 16, 2024 at 09:13:51AM -0800, Florian Fainelli wrote:
> On 2/16/24 07:24, Jesper Nilsson wrote:
> > The MMC IPC interrupt status and interrupt mask registers are of
> > little use as Ethernet statistics, but incrementing counters
> > based on the current interrupt and interrupt mask registers
> > makes them worse than useless.
> > 
> > For example, if the interrupt mask is set to 0x08420842,
> > the current code will increment by that amount each iteration,
> > leading to the following sequence of nonsense:
> > 
> > mmc_rx_ipc_intr_mask: 969816526
> > mmc_rx_ipc_intr_mask: 1108361744
> > 
> > Change the increment to a straight assignment to make the
> > statistics at least nominally useful.
> > 
> > Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
> > ---
> >   drivers/net/ethernet/stmicro/stmmac/mmc_core.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
> > index 6a7c1d325c46..6051a22b3cec 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
> > @@ -280,8 +280,8 @@ static void dwmac_mmc_read(void __iomem *mmcaddr, struct stmmac_counters *mmc)
> >   	mmc->mmc_rx_vlan_frames_gb += readl(mmcaddr + MMC_RX_VLAN_FRAMES_GB);
> >   	mmc->mmc_rx_watchdog_error += readl(mmcaddr + MMC_RX_WATCHDOG_ERROR);
> >   	/* IPC */
> > -	mmc->mmc_rx_ipc_intr_mask += readl(mmcaddr + MMC_RX_IPC_INTR_MASK);
> > -	mmc->mmc_rx_ipc_intr += readl(mmcaddr + MMC_RX_IPC_INTR);
> > +	mmc->mmc_rx_ipc_intr_mask = readl(mmcaddr + MMC_RX_IPC_INTR_MASK);
> > +	mmc->mmc_rx_ipc_intr = readl(mmcaddr + MMC_RX_IPC_INTR);
> 

> So in premise I agree with the patch, that incrementing those is not the
> right way to go about them. However these registers are currently provided
> as part of the statistics set, but they should instead be accessed via the
> register dumping method.
> 
> In either case you will get at best a snapshot of those two registers at any
> given time and I suppose this can help diagnose a stuck RX condition, but
> not much more than that.

Could you please clarify why do those CSRs state need to be exposed in
the statistics anyway? Who would need such information really?
Wouldn't that be better to just drop the
stmmac_counters::{mmc_rx_ipc_intr_mask,mmc_rx_ipc_intr}
fields? Is it because of the statistics nodes are a kind of kernel
ABI? Even in that case I don't see much reason to support something
that has been absolutely useless so far seeing the nodes currently
returning basically some random values.

-Serge(y)

> -- 
> Florian
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
