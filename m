Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3715955102
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Aug 2024 20:46:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EBAAC7129D;
	Fri, 16 Aug 2024 18:46:19 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA8BAC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 18:46:12 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2f3b7aba3dbso27441841fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Aug 2024 11:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723833972; x=1724438772;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GR4ikPPWol9ep3eUe0jkCvtintspPHLufmBMOxuSaZA=;
 b=nXTIhqbvjFvKScx4TUjqxqL259rpuGEHJ27ejj/S5agoM1v0ULYm4yUC4JlisF/Xi5
 oq7J2zaVjyHQX1PgXTuDW20nSN18Tp0DwckOyG+Us009qHWbnLZUFKlubx9IAEcOUdvh
 rFAfkAe229Q5qlFpolJBu5y/sj3NiNzv7qYEEajidNPMHY/ONirsR/yQ76O08OJzWFCa
 0RKJvMXzSw4qulwSYiEN3SjcsF8NeCheLkrKAUtKOJ02YoIPJr52Vo/h3RBxOlR6vVg1
 jzQs0EHCw0PRhgYMTG9XAfeg0uJCCkr1h+S3/U+FDLLQ5Zz+r/eAJDTaaImlKjyOyDpu
 NLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723833972; x=1724438772;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GR4ikPPWol9ep3eUe0jkCvtintspPHLufmBMOxuSaZA=;
 b=NMvHyxH8o8wXVxsLQiLcwl/wgK6E+CNHUbIrdmx256/Ft20hn4BsEXSfbqo5yx/QG8
 LeNNiliAHNjoBpl9WPC76wqNrfYlkxSwFuvFlWhd/UGVKfNy4tp/Ix2bZzzISRtYLbTq
 RzSt0Pa2NvoXxZFYEGC3n7wZ712GvNB3yyObGgnskSul52N4yS/c3t9pd5Y1nfGN8D16
 V+2ZanHauVt+NqSQTWZtiXBvXVUZwst7CddQsFV0IFoo6hJaMnANMXwDvEyN36wcx8Pz
 IBA7Xxurw1iQG/h4912u3qczPs+ZnuBXDPTB8Yk46XPnBp5BziSUGP6sZTNc3kS7GZwk
 4G5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSlmfV810lEGlmADyybc+I3eKEyyObOjhzZT7nS6AxQ1YddRdiB88kd837uP/EQ0yUBfqEyH7bV2WEzIrHFLWcGJK+V0VZ3nuTkQfePBmEETjhoELHpK3F
X-Gm-Message-State: AOJu0YxxnrdrQClxrKj63OF471qkEu2JSJDd7m/UGIedpY3FcAVMF6YK
 TPiacDIGUIMCruvt7IvcuS98FNU58nZUIGiyP2adYgHd+FYeVUnv
X-Google-Smtp-Source: AGHT+IH5KhGUQnH9Joun4vIZh1odDxIkkjfXbFhlAGMBPBeYBvb0XZeIIU7MeMHFMyTdtaiRFqTk8A==
X-Received: by 2002:a2e:be1c:0:b0:2ef:2c91:502a with SMTP id
 38308e7fff4ca-2f3be575bf6mr35545871fa.3.1723833971285; 
 Fri, 16 Aug 2024 11:46:11 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f3b746cd25sm6429871fa.9.2024.08.16.11.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 11:46:10 -0700 (PDT)
Date: Fri, 16 Aug 2024 21:46:07 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: jitendra.vegiraju@broadcom.com
Message-ID: <pajh2btfch2a5nmjuup4djtv4l3ofref5tjx7ocs7ofwnjfej6@n3gf36v37liz>
References: <20240814221818.2612484-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240814221818.2612484-1-jitendra.vegiraju@broadcom.com>
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, leong.ching.swee@intel.com,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, linux@armlinux.org.uk,
 joabreu@synopsys.com, bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, ahalaney@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 xiaolei.wang@windriver.com, florian.fainelli@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, horms@kernel.org,
 mcoquelin.stm32@gmail.com, bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [net-next v4 0/5] net: stmmac: Add PCI driver
 support for BCM8958x
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

On Wed, Aug 14, 2024 at 03:18:13PM -0700, jitendra.vegiraju@broadcom.com wrote:
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
> MAC IP introduces new DMA architecture called Hyper-DMA for virtualization
> scalability.
> 
> Driver functionality specific to new MAC (DW25GMAC) is implemented in
> new file dw25gmac.c.
> 
> Management of integrated ethernet switch on this SoC is not handled by
> the PCIe interface.
> This SoC device has PCIe ethernet MAC directly attached to an integrated
> ethernet switch using XGMII interface.
> 
> v3->v4:
>    Based on Serge's questions, received a confirmation from Synopsis that
>    the MAC IP is indeed the new 25GMAC design.
>    Renamed all references of XGMAC4 to 25GMAC.
>    The patch series is rearranged slightly as follows.
>    Patch1 (new): Define HDMA mapping data structure in kernel's stmmac.h
>    Patch2 (v3 Patch1): Adds dma_ops for dw25gmac in stmmac core
>        Renamed new files dwxgmac4.* to dw25gmac.* - Serge Semin
>        Defined new Synopsis version and device id macros for DW25GMAC.
>        Coverted bit operations to FIELD_PREP macros - Russell King
>        Moved hwif.h to this patch, Sparse flagged warning - Simon Horman
>        Defined macros for hardcoded values TDPS etc - Serge Semin
>        Read number of PDMAs/VDMAs from hardware - Serge Semin
>    Patch3 (v3 Patch2): Hooks in hardware interface handling for dw25gmac
>        Resolved user_version quirks questions - Serge, Russell, Andrew
>        Added new stmmac_hw entry for DW25GMAC. - Serge
>        Added logic to override synopsis_dev_id by glue driver.
>    Patch4 (v3 Patch3): Adds PCI driver for BCM8958x device
>        Define bitmmap macros for hardcoded values - Andrew Lunn
>        Added per device software node - Andrew Lunn
>    Patch5(new/split): Adds BCM8958x driver to build system

Thanks for the series update and I'm sorry for abandoning the
v3 discussion. I had to work on another urgent task. I'll get back to
reviewing your patch set on the next week.

-Serge(y)

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
>    https://lore.kernel.org/netdev/20240802031822.1862030-1-jitendra.vegiraju@broadcom.com/
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
> Jitendra Vegiraju (5):
>   Add HDMA mapping for dw25gmac support
>   Add basic dw25gmac support to stmmac core
>   Integrate dw25gmac into stmmac hwif handling
>   Add PCI driver support for BCM8958x
>   Add BCM8958x driver to build system
> 
>  MAINTAINERS                                   |   8 +
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   3 +-
>  drivers/net/ethernet/stmicro/stmmac/common.h  |   2 +
>  .../net/ethernet/stmicro/stmmac/dw25gmac.c    | 173 ++++++
>  .../net/ethernet/stmicro/stmmac/dw25gmac.h    |  90 +++
>  .../net/ethernet/stmicro/stmmac/dwmac-brcm.c  | 530 ++++++++++++++++++
>  .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  31 +
>  drivers/net/ethernet/stmicro/stmmac/hwif.c    |  25 +-
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    |   1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |   1 +
>  include/linux/stmmac.h                        |  50 ++
>  12 files changed, 922 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dw25gmac.c
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dw25gmac.h
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
> 
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
