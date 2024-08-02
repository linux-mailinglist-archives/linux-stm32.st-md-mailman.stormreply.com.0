Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 074FE945BB9
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 12:03:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA97AC7129D;
	Fri,  2 Aug 2024 10:03:02 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCF41C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 10:02:55 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52efa16aad9so11341089e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Aug 2024 03:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722592975; x=1723197775;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wZVHSXBYePrNzDvUHr9E39NsWzR6Its68DUoWo8U4b0=;
 b=ITi98jAsfchwZKxsH04nJ16shS3wtazYH0j374dwl/wuNzeoAVhxKOmHebHc+k4GoB
 m0p3qlX8Gb6GlA3t4PY7sGf38uFxJZyzIi4oe1pLABbnMuxBkrDheTBfXW0Rue65CesL
 Sc1Lut0FZHdotovyULjhEQpaD/P619J3WND6b3Mi9aMc9uarTEbQoiGFsy6NpZl5BozO
 0l6nzHmuW8jZNcnyormug8Pdlr3LWxLTKo6hfjsU0CV342GeEt7VD2H+EEJwuROH7JPy
 5pO3Mcws6jW6XgYNie7dW42TPBBQPW+BD+DX1mKdVdcETYp2jRHs55yO/7Wr5+y2g4Pi
 3gbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722592975; x=1723197775;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wZVHSXBYePrNzDvUHr9E39NsWzR6Its68DUoWo8U4b0=;
 b=u7HQ9nIF+X3FPGaNmN3PL9ussJGFMUj/3TkGYt4ynRgQYWXob7TILCht90Apzkva4B
 JA5Lc3PVhKIIBzlF0ZL/7Z6IrM/0txn6mglKZlrw0mRneLpK4AAGsc1exgChbM2usJtI
 iULr9FG3PQ083iBhRoaedq8dv+o5f9peB68rgtyE8eNO74Iu3BVYGXg1+QE1xMcu+HZE
 CdMbEgYdmSFJ6B0g6GTIKZDnGWGcxPmq1KFdCZVJ+5Khaz5GUqRU2BpwQmlcTgqWnAel
 cwlv+LA9Pwsq3YpfpV31TCkMnhYM+tno+qkmbnKVG+fv/YhLPIHGagmbkiAaxDoqo2Sn
 ep9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9yImEOKbDvkvSxltSqQu+f6xreKI9M1+TEm4c3XMi9r3N+gDkGtrdeUEeOlse1hMHXY6XxQR8KSgncJli8XG0Hch9GzQGr1+nv1pIaUcwHA6To0Pk08oo
X-Gm-Message-State: AOJu0YwU4fxHNi4So9MLpqEBhBmYXL3x7C7vtc4fMeRg8LqFp6yaBm3+
 Qq6v1KXA0Bs4wA8jgQUHnCdUcT1F9JIJD4PiFvj5GTPvXUIU1Wsh
X-Google-Smtp-Source: AGHT+IF1UmlHhGYQVK/9XpRdhD/Aw56X/aI72duc6eMy8HIVqxE9ZpT4HSD4Bwp8nUlVnomP0I4Aog==
X-Received: by 2002:ac2:4e14:0:b0:52f:cd03:a847 with SMTP id
 2adb3069b0e04-530bb3a4f47mr1435029e87.61.1722592974390; 
 Fri, 02 Aug 2024 03:02:54 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530bba2a10asm189014e87.133.2024.08.02.03.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 03:02:53 -0700 (PDT)
Date: Fri, 2 Aug 2024 13:02:50 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: jitendra.vegiraju@broadcom.com
Message-ID: <oul3ymxlfwlqc3wikwyfix5e2c7hozwfsdwswkdtayxd2zzphz@mld3uobyw5pv>
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
Cc: andrew@lunn.ch, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 florian.fainelli@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, horms@kernel.org, bpf@vger.kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/3] net: stmmac: Add PCI
 driver support for BCM8958x
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

Hi Jitendra

On Thu, Aug 01, 2024 at 08:18:19PM -0700, jitendra.vegiraju@broadcom.com wrote:
> From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> 
> This patchset adds basic PCI ethernet device driver support for Broadcom
> BCM8958x Automotive Ethernet switch SoC devices.
> 
> This SoC device has PCIe ethernet MAC attached to an integrated ethernet
> switch using XGMII interface. The PCIe ethernet controller is presented to
> the Linux host as PCI network device.
> 
> The following block diagram gives an overview of the application.
>              +=================================+
>              |       Host CPU/Linux            |
>              +=================================+
>                         || PCIe
>                         ||
>         +==========================================+
>         |           +--------------+               |
>         |           | PCIE Endpoint|               |
>         |           | Ethernet     |               |
>         |           | Controller   |               |
>         |           |   DMA        |               |
>         |           +--------------+               |
>         |           |   MAC        |   BCM8958X    |
>         |           +--------------+   SoC         |
>         |               || XGMII                   |
>         |               ||                         |
>         |           +--------------+               |
>         |           | Ethernet     |               |
>         |           | switch       |               |
>         |           +--------------+               |
>         |             || || || ||                  |
>         +==========================================+
>                       || || || || More external interfaces
> 
> The MAC block on BCM8958x is based on Synopsis XGMAC 4.00a core. This
> driver uses common dwxgmac2 code where applicable.

Thanks for submitting the series.

I am curious how come Broadcom got to use an IP-core which hasn't
been even announced by Synopsys. AFAICS the most modern DW XGMAC
IP-core is of v3.xxa version:

https://www.synopsys.com/dw/ipdir.php?ds=dwc_ether_xgmac

Are you sure that your device isn't equipped with some another DW MAC
IP-core, like DW 25G Ethernet MAC? (which BTW is equipped with a new
Hyper DMA engine with a capability to have up to 128/256 channels with
likely indirect addressing.) Do I miss something?

* I'll join the patch set review after the weekend, sometime on the
next week.

-Serge(y)

> Driver functionality specific to this MAC is implemented in dwxgmac4.c.
> Management of integrated ethernet switch on this SoC is not handled by
> the PCIe interface.
> This SoC device has PCIe ethernet MAC directly attached to an integrated
> ethernet switch using XGMII interface.
> 
> v2->v3:
>    Addressed v2 comments from Andrew, Jakub, Russel and Simon.
>    Based on suggestion by Russel and Andrew, added software node to create
>    phylink in fixed-link mode.
>    Moved dwxgmac4 specific functions to new files dwxgmac4.c and dwxgmac4.h
>    in stmmac core module.
>    Reorganized the code to use the existing glue logic support for xgmac in
>    hwif.c and override ops functions for dwxgmac4 specific functions.
>    The patch is split into three parts.
>      Patch#1 Adds dma_ops for dwxgmac4 in stmmac core
>      Patch#2 Hooks in the hardware interface handling for dwxgmac4
>      Patch#3 Adds PCI driver for BCM8958x device
> 
> v1->v2:
>    Minor fixes to address coding style issues.
>    Sent v2 too soon by mistake, without waiting for review comments.
>    Received feedback on this version.
>    https://lore.kernel.org/netdev/20240511015924.41457-1-jitendra.vegiraju@broadcom.com/
> 
> v1:  
>    https://lore.kernel.org/netdev/20240510000331.154486-1-jitendra.vegiraju@broadcom.com/
> 
> Jitendra Vegiraju (3):
>   Add basic dwxgmac4 support to stmmac core
>   Integrate dwxgmac4 into stmmac hwif handling
>   Add PCI driver support for BCM8958x
> 
>  MAINTAINERS                                   |   8 +
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   3 +-
>  drivers/net/ethernet/stmicro/stmmac/common.h  |   4 +
>  .../net/ethernet/stmicro/stmmac/dwmac-brcm.c  | 517 ++++++++++++++++++
>  .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  31 ++
>  .../net/ethernet/stmicro/stmmac/dwxgmac4.c    | 142 +++++
>  .../net/ethernet/stmicro/stmmac/dwxgmac4.h    |  84 +++
>  drivers/net/ethernet/stmicro/stmmac/hwif.c    |  26 +-
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    |   1 +
>  10 files changed, 825 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwxgmac4.c
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwxgmac4.h
> 
> -- 
> 2.34.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
