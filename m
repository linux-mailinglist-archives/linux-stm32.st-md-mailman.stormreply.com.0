Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09161973685
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Sep 2024 13:56:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B00A3C78010;
	Tue, 10 Sep 2024 11:56:03 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BF63C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 11:55:57 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f752d9ab62so50699411fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 04:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725969356; x=1726574156;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8hfri4dXyAKITBGdpULlHOZ/Wp/1oYlpuTWiNxs1aXQ=;
 b=I/oYW4g13di/mLH8qrHCGfyUKvbN3cD7WZXmrR8ZhzP1LcmGXTJGe3xCMnhp0IDilB
 naKHU6EwcQyQ/CR6KVyJXRtG2lM/xLLlWAIaEbyPKOp+mPt99+kI2PD6/ml8Uc7M9+c5
 FZHexgHQwAK2GzkOvXGyjqtzXL4UIv1x4z/vpTr9NzVDNTCvbpblEgWHWnmK2NdJU+Bd
 N6uCuCfci1DNR8PSLWWJmgE9YXpSPBrvYpURePvKc+8nTmFMBgNL4l4/i+5DGGNWJctP
 Oa/ooD33oNCQ3m+M14P3wOvU0yeiDaWcONkfwwUj4cshxHXtv4AlMvNSGxBGFH7FItF5
 AI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725969356; x=1726574156;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8hfri4dXyAKITBGdpULlHOZ/Wp/1oYlpuTWiNxs1aXQ=;
 b=uhLS8fFtWinqyMfV/hbk4rPA3NTtINdaQ0XN/kzUsStqs4J5kD7F6vmu4l5n+I5HsW
 Timl0/MZPeFKMiYprofbX4TbHsVW5rblLo+oBQu8fsl4hCWKb/sLd77N7Cs4oTf1xbxy
 qeCdJR202qFMDlNDFNnz4iNuc+rkaxkw1Dpz72Pe51qyVglbsxry71uhjxoaX6by4N8S
 kGP+mzWWS5Gz6JtWX+NV5dd9+mgpKNYtR1M4veyEkjT9TUEpgxXLM9hXrwq3wQf94ZeG
 zckYoi7zNIF8Y9d0BFk1shwodujxaVpUZ8TouEStodMk0cg2OnVFIEB4VeIzsrfUVePu
 yBjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6cCJGYTqIRgZHLSGranYq29WNPHam71DosItd6CNXQAs2b2pel5D1/CCHCBl+6IQULIS+EbveMhjn3g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyrFyTlL2L2RlsP4J83uyuZiyqrcE7YNKmmke7R1rcBDOPn2CNn
 U92pAogqNDKOnWCE9d1cq6a0oub63w4bnc6FYtpMa3mkvOcSxxAa
X-Google-Smtp-Source: AGHT+IESmABC/JGjw8+J2iYKtAy7FAr+qsgBYKgilqZukCBJGhpkkaPjbLmHJ2QPX4ajpLltD2eClg==
X-Received: by 2002:a2e:b88a:0:b0:2f3:fd7f:d048 with SMTP id
 38308e7fff4ca-2f75b94234amr69763251fa.39.1725969355087; 
 Tue, 10 Sep 2024 04:55:55 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f75bfe830csm11861191fa.2.2024.09.10.04.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 04:55:54 -0700 (PDT)
Date: Tue, 10 Sep 2024 14:55:51 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Message-ID: <auqco7g64aej7mauw6etpqhauynowktlbise6qo6k7rczz4oao@46miqzgcp7ky>
References: <20240904054815.1341712-1-jitendra.vegiraju@broadcom.com>
 <56c4fccd-787f-4936-9f4b-a1b9ebae6d03@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56c4fccd-787f-4936-9f4b-a1b9ebae6d03@redhat.com>
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, jitendra.vegiraju@broadcom.com,
 kuba@kernel.org, rohan.g.thomas@intel.com, ahalaney@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 xiaolei.wang@windriver.com, florian.fainelli@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, horms@kernel.org,
 mcoquelin.stm32@gmail.com, bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [net-next v5 0/5] net: stmmac: Add PCI driver
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

Hi Paolo

On Tue, Sep 10, 2024 at 01:29:34PM +0200, Paolo Abeni wrote:
> On 9/4/24 07:48, jitendra.vegiraju@broadcom.com wrote:
> > From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> > 
> > This patchset adds basic PCI ethernet device driver support for Broadcom
> > BCM8958x Automotive Ethernet switch SoC devices.
> > 
> > This SoC device has PCIe ethernet MAC attached to an integrated ethernet
> > switch using XGMII interface. The PCIe ethernet controller is presented to
> > the Linux host as PCI network device.
> > 
> > The following block diagram gives an overview of the application.
> >               +=================================+
> >               |       Host CPU/Linux            |
> >               +=================================+
> >                          || PCIe
> >                          ||
> >          +==========================================+
> >          |           +--------------+               |
> >          |           | PCIE Endpoint|               |
> >          |           | Ethernet     |               |
> >          |           | Controller   |               |
> >          |           |   DMA        |               |
> >          |           +--------------+               |
> >          |           |   MAC        |   BCM8958X    |
> >          |           +--------------+   SoC         |
> >          |               || XGMII                   |
> >          |               ||                         |
> >          |           +--------------+               |
> >          |           | Ethernet     |               |
> >          |           | switch       |               |
> >          |           +--------------+               |
> >          |             || || || ||                  |
> >          +==========================================+
> >                        || || || || More external interfaces
> > 
> > The MAC block on BCM8958x is based on Synopsis XGMAC 4.00a core. This
> > MAC IP introduces new DMA architecture called Hyper-DMA for virtualization
> > scalability.
> > 
> > Driver functionality specific to new MAC (DW25GMAC) is implemented in
> > new file dw25gmac.c.
> > 
> > Management of integrated ethernet switch on this SoC is not handled by
> > the PCIe interface.
> > This SoC device has PCIe ethernet MAC directly attached to an integrated
> > ethernet switch using XGMII interface.
> > 
> > v4->v5:
> >     Summary of changes in this patch series:
> >     As suggested by Serge Semin, defined common setup function for dw25gmac.
> >     To accommodate early adopter DW25GMAC used in BCM8958x device, provide
> >     a mechanism to override snps_id and snps_dev_id used for driver entry
> >     matching in hwif.c
> > 
> >     Patch1:
> >       Added plat_stmmacenet_data::snps_id,snps_dev_id fields - Serge Semin
> >     Patch2:
> >       Define common setup function for dw25gmac_setup() - Serge Semin
> >       Support DW25GMAC IPs with varying VDMA/PDMA count - Abhishek Chauhan
> >       Allocate and initialize hdma mapping configuration data dynamically
> >       based on device's VDMA/PDMA feature capabilities in dw25gmac_setup().
> >       Spelling errors in commit log, lower case 0x for hex -Amit Singh Tomar
> >     Patch3:
> >       Glue support in hwif.c for DW25GMAC in hwif.c - Serge Semin
> >       Provide an option to override snps_id and snps_dev_id when the device
> >       reports version info not conformant with driver's expectations as is
> >       the case with BCM8958x device. - Serge Semin
> >     Patch4:
> >       Remove setup function in the glue driver - Serge Semin
> >       Remove unnecessary calls pci_enable_device() and pci_set_master()
> >       in dwxgmac_brcm_pci_resume() - Jakub Kicinski
> >       Merge variable definitions to single line - Amit Singh Tomar
> > 
> > v3->v4:
> >     Based on Serge's questions, received a confirmation from Synopsys that
> >     the MAC IP is indeed the new 25GMAC design.
> >     Renamed all references of XGMAC4 to 25GMAC.
> >     The patch series is rearranged slightly as follows.
> >     Patch1 (new): Define HDMA mapping data structure in kernel's stmmac.h
> >     Patch2 (v3 Patch1): Adds dma_ops for dw25gmac in stmmac core
> >         Renamed new files dwxgmac4.* to dw25gmac.* - Serge Semin
> >         Defined new Synopsis version and device id macros for DW25GMAC.
> >         Converted bit operations to FIELD_PREP macros - Russell King
> >         Moved hwif.h to this patch, Sparse flagged warning - Simon Horman
> >         Defined macros for hardcoded values TDPS etc - Serge Semin
> >         Read number of PDMAs/VDMAs from hardware - Serge Semin
> >     Patch3 (v3 Patch2): Hooks in hardware interface handling for dw25gmac
> >         Resolved user_version quirks questions - Serge, Russell, Andrew
> >         Added new stmmac_hw entry for DW25GMAC. - Serge
> >         Added logic to override synopsis_dev_id by glue driver.
> >     Patch4 (v3 Patch3): Adds PCI driver for BCM8958x device
> >         Define bitmmap macros for hardcoded values - Andrew Lunn
> >         Added per device software node - Andrew Lunn
> >     Patch5(new/split): Adds BCM8958x driver to build system
> >     https://lore.kernel.org/netdev/20240814221818.2612484-1-jitendra.vegiraju@broadcom.com/
> > 
> > v2->v3:
> >     Addressed v2 comments from Andrew, Jakub, Russel and Simon.
> >     Based on suggestion by Russel and Andrew, added software node to create
> >     phylink in fixed-link mode.
> >     Moved dwxgmac4 specific functions to new files dwxgmac4.c and dwxgmac4.h
> >     in stmmac core module.
> >     Reorganized the code to use the existing glue logic support for xgmac in
> >     hwif.c and override ops functions for dwxgmac4 specific functions.
> >     The patch is split into three parts.
> >       Patch#1 Adds dma_ops for dwxgmac4 in stmmac core
> >       Patch#2 Hooks in the hardware interface handling for dwxgmac4
> >       Patch#3 Adds PCI driver for BCM8958x device
> >     https://lore.kernel.org/netdev/20240802031822.1862030-1-jitendra.vegiraju@broadcom.com/
> > 
> > v1->v2:
> >     Minor fixes to address coding style issues.
> >     Sent v2 too soon by mistake, without waiting for review comments.
> >     Received feedback on this version.
> >     https://lore.kernel.org/netdev/20240511015924.41457-1-jitendra.vegiraju@broadcom.com/
> > 
> > v1:
> >     https://lore.kernel.org/netdev/20240510000331.154486-1-jitendra.vegiraju@broadcom.com/
> > 
> > Jitendra Vegiraju (5):
> >    Add HDMA mapping for dw25gmac support
> >    Add basic dw25gmac support in stmmac core
> >    Integrate dw25gmac into stmmac hwif handling
> >    Add PCI driver support for BCM8958x
> >    Add BCM8958x driver to build system
> > 
> >   MAINTAINERS                                   |   8 +
> >   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
> >   drivers/net/ethernet/stmicro/stmmac/Makefile  |   3 +-
> >   drivers/net/ethernet/stmicro/stmmac/common.h  |   4 +
> >   .../net/ethernet/stmicro/stmmac/dw25gmac.c    | 224 ++++++++
> >   .../net/ethernet/stmicro/stmmac/dw25gmac.h    |  92 ++++
> >   .../net/ethernet/stmicro/stmmac/dwmac-brcm.c  | 507 ++++++++++++++++++
> >   .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |   1 +
> >   .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  43 ++
> >   .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  31 ++
> >   drivers/net/ethernet/stmicro/stmmac/hwif.c    |  26 +-
> >   drivers/net/ethernet/stmicro/stmmac/hwif.h    |   1 +
> >   include/linux/stmmac.h                        |  48 ++
> >   13 files changed, 997 insertions(+), 2 deletions(-)
> >   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dw25gmac.c
> >   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dw25gmac.h
> >   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
> 

> Hi Serge, to you think you will have time to review this series soon?
> 
> We are sort in a rush to flush the net-next material before the upcoming
> merge window.

I'll get back to reviewing the series today. Sorry for the
inconvenience.

-Serge(y)

> 
> Thanks,
> 
> Paolo
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
