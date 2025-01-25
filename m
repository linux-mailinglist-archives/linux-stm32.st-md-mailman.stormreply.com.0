Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43850A1C3E3
	for <lists+linux-stm32@lfdr.de>; Sat, 25 Jan 2025 16:04:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD9EAC78011;
	Sat, 25 Jan 2025 15:04:13 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 136DDC71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jan 2025 15:04:06 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-21c2f1b610dso69624855ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Jan 2025 07:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737817444; x=1738422244;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UKw2SOCMf2JGxTXIqSAP0tOzr6+c+Tge86dZCU0DFh8=;
 b=BUyxAUbhz9CRwenQp/TwD8sRNQkdutl8/Vkc+dPIkiNRKioNjlpze4aDbxgu/JMaA8
 k1vHUnwJSE3arvk/XpfiroiS66E4qRam3lxH6M9/kNj7a9PgbnZHZL+BpEbX+HcweBMC
 e8qSm5VHEs1kcuTzsIsFdDVlZaisv4K2CvQ18b2yWtoAOrk1XJZhQdTdJgkqJaW7xkYr
 slNeIW0+wFuasPtS4Zs8MTnN4WRfuEkk2iAIkNvnclDOujf7kBGOuVNGPosDTP4HgpGa
 dE92G5tGuhgdhzlRi8KowrzKBeYBPcqlYC66zHSSjeKkY6eCxyvtw4MDnTnZH/II2UKm
 G+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737817444; x=1738422244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UKw2SOCMf2JGxTXIqSAP0tOzr6+c+Tge86dZCU0DFh8=;
 b=mMTk9vI6H4Gj2deOuCaAN6vFHEiNx1iWD0zE0PyVfGPDJE+wJPIv45Wvf8fqAhkHh0
 cAZF55d9SQ7pVF2Uu3PHsFCG66DPcJ2AgO3eslLISJH6AtZLIkGC+xEMFtnD0vUX+tl1
 2yV4rna0YQjKp2QX2ym3j90Byi545NPWNNuGcAcQeh1sItbcD2V11cn519kgl1QrqdOm
 3iAhbSe9dMqBDadnTjg7AIy4bdWVFD7biciX9THPPUAclVg73B+8WCAE2N6PMZxYZzdM
 0asdAdIWur1xkpm8QQB7HwUyJYGRQb29HcyXRjJjAMtF4O0No862e3CZnHVfX9hfuUGn
 TfuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/cK5GIy/KIz+HQ2fQjxDclVXeVjdknWKO9iJ5ffmTg+nPSCJVDQnYR76DeFQnqJWbE2HuY4ZN+8x0gQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxTFQGYT6FGxBoq4VZtdw2lTP1ia+YTqL9R1f3LjULaPJL9melq
 cgGH5BzOmOeXyMPnSvBNGwBRA8M+rbgHK1uU82mnJths6QRJLhdc
X-Gm-Gg: ASbGncv53In0qFYbmmLDYV/2hXJJtEnzZVQoda19MKRRYuaYSHZVihLI8udhL6wsep2
 gfNuQZ4bDpu3ohBmda/JgyNeWTZxgFcDlK4CbxMa0N6auw63TCluaiW8FUJEMsver4ny2xEZbnr
 KDwWXgnVp/lcpdKNk4FrXjozBYuMtoMGL9pIJBwXv3XIsNxBlYbzO4rLcS37YC1AaWKXhL+A5/Y
 42bhU2Ue5AXuoa9GUj44hRdaSUeIKP7LYuAy4gJuxqMWKrHAGSaRC+grfSkFfACSVu0F3fv2OKw
 tg==
X-Google-Smtp-Source: AGHT+IFVzWzSGBn66Dc2tB9vnmWyHkByC3/61GF44GlshncBb/NN1MnhhqsxwhJuUAHRXdCbEwQ2Dw==
X-Received: by 2002:a05:6a00:92a0:b0:725:df1a:27c with SMTP id
 d2e1a72fcca58-72dafa4ce00mr48575267b3a.14.1737817444411; 
 Sat, 25 Jan 2025 07:04:04 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a69fde0sm3933161b3a.18.2025.01.25.07.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jan 2025 07:04:04 -0800 (PST)
Date: Sat, 25 Jan 2025 23:03:47 +0800
From: Furong Xu <0x1207@gmail.com>
To: Ido Schimmel <idosch@idosch.org>
Message-ID: <20250125230347.0000187b@gmail.com>
In-Reply-To: <Z5S69kb7Qz_QZqOh@shredder>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
 <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
 <20250124104256.00007d23@gmail.com> <Z5S69kb7Qz_QZqOh@shredder>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 Joe Damato <jdamato@fastly.com>, linux-kernel@vger.kernel.org,
 Brad Griffis <bgriffis@nvidia.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>, "David S.
 Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/4] net: stmmac: Switch to
 zero-copy in non-XDP RX path
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

Hi Thierry

On Sat, 25 Jan 2025 12:20:38 +0200, Ido Schimmel wrote:

> On Fri, Jan 24, 2025 at 10:42:56AM +0800, Furong Xu wrote:
> > On Thu, 23 Jan 2025 22:48:42 +0100, Andrew Lunn <andrew@lunn.ch>
> > wrote: 
> > > > Just to clarify, the patch that you had us try was not intended
> > > > as an actual fix, correct? It was only for diagnostic purposes,
> > > > i.e. to see if there is some kind of cache coherence issue,
> > > > which seems to be the case?  So perhaps the only fix needed is
> > > > to add dma-coherent to our device tree?    
> > > 
> > > That sounds quite error prone. How many other DT blobs are
> > > missing the property? If the memory should be coherent, i would
> > > expect the driver to allocate coherent memory. Or the driver
> > > needs to handle non-coherent memory and add the necessary
> > > flush/invalidates etc.  
> > 
> > stmmac driver does the necessary cache flush/invalidates to
> > maintain cache lines explicitly.  
> 
> Given the problem happens when the kernel performs syncing, is it
> possible that there is a problem with how the syncing is performed?
> 
> I am not familiar with this driver, but it seems to allocate multiple
> buffers per packet when split header is enabled and these buffers are
> allocated from the same page pool (see stmmac_init_rx_buffers()).
> Despite that, the driver is creating the page pool with a non-zero
> offset (see __alloc_dma_rx_desc_resources()) to avoid syncing the
> headroom, which is only present in the head buffer.
> 
> I asked Thierry to test the following patch [1] and initial testing
> seems OK. He also confirmed that "SPH feature enabled" shows up in the
> kernel log.

It is recommended to disable the "SPH feature" by default unless some
certain cases depend on it. Like Ido said, two large buffers being
allocated from the same page pool for each packet, this is a huge waste
of memory, and brings performance drops for most of general cases.

Our downstream driver and two mainline drivers disable SPH by default:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c#n357
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c#n471
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
