Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F883A2BECF
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 10:09:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5CBAC78F67;
	Fri,  7 Feb 2025 09:09:41 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D73BC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 09:09:33 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-21f44e7eae4so21013965ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Feb 2025 01:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738919372; x=1739524172;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5tYIxWjH4asPJ7vGr3zm8KkssG+yJatoWr9svY3RnU4=;
 b=k3xY56qW/hZqdWV35BvKvTNEI3kPAKnuaLTLsVeP8inwqwPoBliE4bvopUqhK5UmpS
 ACOANQG3saT5c3t94r4iQ1R+BUb0KvWAu1V9cXhJvVhRx6zw3xdBd5HAratwsGPC2brU
 4FVZIOLVHxU0fblX2PNgOGMXJb5spmiCw7hwBEhTvKbkqtrze8B46MYF7KDBeJ578Shv
 aOt4Vw5kqytrek8cpzuCn57SxeLadIFYv/Hl0w8O7hu6ywg/Jys4WEoGpsSLfN2LnVYv
 zVMwnJ+hrBaQihDR1h2PThaMDSrgSXerFNb88dQonSMM8K2NFQ/XvoiPgxXs1SncZyGC
 Cw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738919372; x=1739524172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5tYIxWjH4asPJ7vGr3zm8KkssG+yJatoWr9svY3RnU4=;
 b=RGftFlf0tFg2dHZUJ/IUZtC/gHmnJO95hYsi7bt5AF82n1QzxDbMSiazkpgr2Krd7q
 aS7sO0MbZi/AwB9KSlW8875zi/4DUIbbqQUJDysic7t3M0loN4R0sdZ13ZMoh0Am2MyT
 mbja/ErnGyjnLAwZxGhbSB5g4ueKQWQCtiml7GNTnXtVGVs1MTOgd7qxU7YIJo/UPBZM
 6h2k8xgoDNcaG7oszNRlmVAE1DChZNF0mQ208fHHtq6fIDof1up+Pi6+I+xWUDXuOB6B
 QA4SA8eiK6VaJEzNcWNr6m/FKforgUDgh3rg6QUyH6JjQG1gS22o3Nwhbg1w2UEahjbV
 DOOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzUwYhqnnJbdLiRxHX+9Gms9wGU0Vnhy+nvzmmJtuUBhrRZB2j0QV3UKaMANNZMerGtDSJczo26dnD1g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw7CvGoViNHogHeNeqgmuJGB4HkrOKzfxr+h6rWvXop2Un+zI55
 XmgVB5xGBobnDEvsOogI5WhlmiadPK6XcIcrqKCL6XajQGtwHpX/
X-Gm-Gg: ASbGncu121IoC4a+oHjUHYFdUtrCqoi22kG8zOvPyUs9IWXxnHC76GSh35lXPiKCppB
 D1eyn3gwwAQF/bYCPltZL7igsk/g5w2nMi5vJTsGrVDnMAOpsxnoGl3AVlJ897THzDewZ1BLgvQ
 G7xr7dmUNPe0kMsh74xH964NGwYgzSWkQNDbn8s1wEoX8J4Ro/fzFCi4qe++h7CiUGrgxM1efNW
 vxaKlhL753TiJJJSw7ocJHYBmGfVDinqNY528B8FyI5WC5ovgFDopAOIJnVxACknIVrSwtz9yoa
 /fYogljrMAv5
X-Google-Smtp-Source: AGHT+IHdbdRPTIQl2gSZ+CotH7ac/oBwZCxsHs4UvbL1u5MkN8h8LbL1QYV1lgF7a8TsacFSkfg1rg==
X-Received: by 2002:a17:902:ea0c:b0:216:760c:3879 with SMTP id
 d9443c01a7336-21f4e781389mr39271805ad.46.1738919371696; 
 Fri, 07 Feb 2025 01:09:31 -0800 (PST)
Received: from localhost ([129.146.253.192]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f36881e14sm25847215ad.207.2025.02.07.01.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 01:09:31 -0800 (PST)
Date: Fri, 7 Feb 2025 17:07:44 +0800
From: Furong Xu <0x1207@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <20250207170744.00006ceb@gmail.com>
In-Reply-To: <108592a6-de5b-4804-92ff-c7d4547beff0@nvidia.com>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
 <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
 <20250124104256.00007d23@gmail.com> <Z5S69kb7Qz_QZqOh@shredder>
 <20250125230347.0000187b@gmail.com>
 <kyskevcr5wru66s4l6p4rhx3lynshak3y2wxjfjafup3cbneca@7xpcfg5dljb2>
 <108592a6-de5b-4804-92ff-c7d4547beff0@nvidia.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Alexander Lobakin <aleksander.lobakin@intel.com>, netdev@vger.kernel.org,
 Joe Damato <jdamato@fastly.com>, linux-kernel@vger.kernel.org,
 Brad Griffis <bgriffis@nvidia.com>, Ido Schimmel <idosch@idosch.org>,
 Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Lunn <andrew+netdev@lunn.ch>
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

Hi Jon,

On Wed, 29 Jan 2025 14:51:35 +0000, Jon Hunter <jonathanh@nvidia.com> wrote:
> Hi Furong,
> 
> On 27/01/2025 13:28, Thierry Reding wrote:
> > On Sat, Jan 25, 2025 at 11:03:47PM +0800, Furong Xu wrote:  
> >> Hi Thierry
> >>
> >> On Sat, 25 Jan 2025 12:20:38 +0200, Ido Schimmel wrote:
> >>  
> >>> On Fri, Jan 24, 2025 at 10:42:56AM +0800, Furong Xu wrote:  
> >>>> On Thu, 23 Jan 2025 22:48:42 +0100, Andrew Lunn <andrew@lunn.ch>
> >>>> wrote:  
> >>>>>> Just to clarify, the patch that you had us try was not intended
> >>>>>> as an actual fix, correct? It was only for diagnostic purposes,
> >>>>>> i.e. to see if there is some kind of cache coherence issue,
> >>>>>> which seems to be the case?  So perhaps the only fix needed is
> >>>>>> to add dma-coherent to our device tree?  
> >>>>>
> >>>>> That sounds quite error prone. How many other DT blobs are
> >>>>> missing the property? If the memory should be coherent, i would
> >>>>> expect the driver to allocate coherent memory. Or the driver
> >>>>> needs to handle non-coherent memory and add the necessary
> >>>>> flush/invalidates etc.  
> >>>>
> >>>> stmmac driver does the necessary cache flush/invalidates to
> >>>> maintain cache lines explicitly.  
> >>>
> >>> Given the problem happens when the kernel performs syncing, is it
> >>> possible that there is a problem with how the syncing is performed?
> >>>
> >>> I am not familiar with this driver, but it seems to allocate multiple
> >>> buffers per packet when split header is enabled and these buffers are
> >>> allocated from the same page pool (see stmmac_init_rx_buffers()).
> >>> Despite that, the driver is creating the page pool with a non-zero
> >>> offset (see __alloc_dma_rx_desc_resources()) to avoid syncing the
> >>> headroom, which is only present in the head buffer.
> >>>
> >>> I asked Thierry to test the following patch [1] and initial testing
> >>> seems OK. He also confirmed that "SPH feature enabled" shows up in the
> >>> kernel log.  
> >>
> >> It is recommended to disable the "SPH feature" by default unless some
> >> certain cases depend on it. Like Ido said, two large buffers being
> >> allocated from the same page pool for each packet, this is a huge waste
> >> of memory, and brings performance drops for most of general cases.
> >>
> >> Our downstream driver and two mainline drivers disable SPH by default:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c#n357
> >> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c#n471  
> > 
> > Okay, that's something we can look into changing. What would be an
> > example of a use-case depending on SPH? Also, isn't this something
> > that should be a policy that users can configure?
> > 
> > Irrespective of that we should fix the problems we are seeing with
> > SPH enabled.  
> 
> 
> Any update on this?

Sorry for my late response, I was on Chinese New Year holiday.

The fix is sent, and it will be so nice to have your Tested-by: tag there:
https://lore.kernel.org/all/20250207085639.13580-1-0x1207@gmail.com/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
