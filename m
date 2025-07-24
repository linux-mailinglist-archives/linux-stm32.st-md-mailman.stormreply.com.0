Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AEBB1108C
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Jul 2025 19:56:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B796C32EA8;
	Thu, 24 Jul 2025 17:56:56 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7908C36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jul 2025 17:56:54 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-32b7113ed6bso13778301fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jul 2025 10:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753379814; x=1753984614;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7+Hc/EJTpAN/zUBy6dWU21PJ3WMLmwKCsM/9bWx/tE4=;
 b=mT0Wgt2mLAyaqegrEuljmzBxBOwKm3rMXxVn8sBLo8lLFlGSN1mUggYoLcjD/gjUyb
 Uo2lr8UZB8dU+HcYV8tRdUeuuetT/uYSNH27o+r3dRV9fOD1FQ4eJq1Nf9x8pGm+2PGk
 3OA+u7WVG8I1xzuIBtK/d2waAI6MI9Oa2nfrdMBrE2bMakpHb4r7MLp2gKquFJjG7d8H
 Q0tB4Su/LlJEs1XKs6sF/42rTLsmgTv2ug3sgiYjkplFo9eyQ3HetO3FvdFQ3Dlc6bG3
 KP90XHthpecAzXbYBDv9H2v7GMXgFnn7L/sWL3zPMm/S0C1cWCJqpQ3WOMP+7zspqVhI
 IOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753379814; x=1753984614;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7+Hc/EJTpAN/zUBy6dWU21PJ3WMLmwKCsM/9bWx/tE4=;
 b=Xv4yAD9wsE3eJ/4/UP+bFoUdwY0mnEtOqclecSPpu9zvHxzIQ63YAGJ8xaKyM3iSZh
 yQYD4xcHT42i7i0JR4hJ6FINtng9Zwx186yZpTvIWlHD83hvgOAI+Eg35WTfLUFCWyup
 YnrNY9q7QTTgsD604r6MvmwY4HWN4ZbkBpFn25eCh1Um6G5zku5EgE2fJKRCx4AB5CP/
 WJpPM57Nliyk0715tNSf8RuZHyGUJfx8PlUfzv7k25Obq7h46kY1KCJpd0KGouGT0f5Q
 JU4xIlk9FmNaUJxMvdn5W5W3BRQzgb/GBeGkl20HKvj4P2f5WOU03zX4E22+mu28UuBl
 mLdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0aHJqlgkFTpxpDnivlsaqBmpMxivk1DAw9oulQxjafV9qbyfeiNRJH51AT3Zs8AX/ASEE6pf0p989Qw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzmH72iVFA1Wf4w1JSbspQZ9bf6eqK+WEmMUgDaV2hn5kGV3goQ
 Jmjc5t3L+IBjv+DBksFUjVuNmxnLXoQ+kRcJkefV4Uhm/zg0VYgqbcf5
X-Gm-Gg: ASbGnct0QhTk+9Mby8pD3GTY/fvhXMyWYuuAfjKBixxf/Du6Ti+CLBD2oWT64FHGMgX
 EtVu+6qA7iKaKF3fywakALRVmJwDt3Fi47gG/+dgBzyMz7iwiN2iyWI9HFZbxVQ0/sV3q+0fpNo
 bJPLomWRyWiPYCiLZLKWWlNFUblRfYTAdhb4Hp8b5b57rxMM5sqRVRcHtKXhUsHERge+wwyslS+
 Yi9gadK/U7xztwmPO5q0ySpkdnk9RtdeDa4SC/cYi2CJy+gpCnjMZqVTCUQYDjcHWqXik45dvrx
 HF7Nxd1w4i6gA4soq2f9b2YEBZm9zRxHvGpz2reQgAPerbbnsHs7mezu0R3HnkjBTHVniYyweoI
 vK2390uedLd37v9ZUAurFZR+FPduw+401l2BHHiWy
X-Google-Smtp-Source: AGHT+IFN4Xrrwc5r0VQkcaQC/psZUUhsAWA2bd+XSOCuqzO1usstf65IZl+/xhZAoKMELAzl9zDBaw==
X-Received: by 2002:a2e:9cc2:0:b0:32b:3104:f89c with SMTP id
 38308e7fff4ca-330dfe3cf57mr22675651fa.29.1753379813377; 
 Thu, 24 Jul 2025 10:56:53 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331e08e98aesm4007631fa.54.2025.07.24.10.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 10:56:52 -0700 (PDT)
Date: Thu, 24 Jul 2025 20:56:06 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Message-ID: <tcebsuesjejtk3vmzx77yuo7zil2xciucnnrakubrslwvnndas@utvi4r7ob3xa>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-2-c34092a88a72@altera.com>
 <b192c96a-2989-4bdf-ba4f-8b7bcfd09cfa@lunn.ch>
 <e903cb0f-3970-4ad2-a0a2-ee58551779dc@altera.com>
 <6fsqayppkyubkucghk5i6m7jjgytajtzm4wxhtdkh7i2v3znk5@vwqbzz5uffyy>
 <4df7133e-5dcd-4d3d-9a58-d09ad5fd7ec3@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4df7133e-5dcd-4d3d-9a58-d09ad5fd7ec3@altera.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: xgmac: Correct
 supported speed modes
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

Hi Rohan

On Thu, Jul 24, 2025 at 09:48:29PM +0530, G Thomas, Rohan wrote:
> On 7/17/2025 5:17 PM, Serge Semin wrote:
> > DW XGMAC IP-core of v2.x and older don't support 10/100Mbps modes
> > neither in the XGMII nor in the GMII interfaces. That's why I dropped
> > the 10/100Mbps link capabilities retaining 1G, 2.5G and 10G speeds
> > only (the only speeds supported for DW XGMAC 1.20a/2.11a Tx in the
> > MAC_Tx_Configuration.SS register field). Although I should have
> > dropped the MAC_5000FD too since it has been supported since v3.0
> > IP-core version. My bad.(
> > 
> > Starting from DW XGMAC v3.00a IP-core the list of the supported speeds
> > has been extended to: 10/100Mbps (MII), 1G/2.5G (GMII), 2.5G/5G/10G
> > (XGMII). Thus the more appropriate fix here should take into account
> > the IP-core version. Like this:
> > 	if (dma_cap->mbps_1000 && MAC_Version.SNPSVER >= 0x30)
> > 		dma_cap->mbps_10_100 = 1;
> > 
> > Then you can use the mbps_1000 and mbps_10_100 flags to set the proper
> > MAC-capabilities to hw->link.caps in the dwxgmac2_setup() method. I
> > would have added the XGMII 2.5G/5G MAC-capabilities setting up to the
> > dwxgmac2_setup() method too for the v3.x IP-cores and newer.
> 
> Hi Serge,
> 
> From the databook, I noticed the condition:
> (DWCXG_XGMII_GMII == 1) && <DWC-XGMAC-V2_20 feature authorized>
> which seems to suggest that 10/100 Mbps support was introduced starting
> from version 2.20.
> 
> Am I interpreting this correctly, or is this feature only fully
> supported from v3.00 onwards.

Hm. Interesting discovery. I've got only DW XGMAC v1.20a, v2.11a,
v3.01a and v3.20a databooks at hands. So I can't prove for sure your
inference. But the DW XGMAC v3.01a doc indeed states that
DWCXG_FDUPLX_ONLY parameter is enabled if:
(DWCXG_XGMII_GMII == 1) && <DWC-XGMAC-V2_20 feature authorized>
which implies that the parameter was originally introduced in v2.20a
IP-core.

So to speak you might be right. Perhaps it will be more correct to set
dma_cap->mbps_10_100 for v2.20a (SNPSVER = 0x22) IP-cores too
especially seeing another parameter DWCXG_MII_SUPPORT depends on
SNPS_RSVDPARAM_16 which also depends on DWC-XGMAC-V2_20.

-Serge(y)

> 
> Best Regards,
> Rohan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
