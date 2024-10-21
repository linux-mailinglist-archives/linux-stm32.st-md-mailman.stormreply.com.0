Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D55659A65D7
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Oct 2024 13:05:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 872BFC78035;
	Mon, 21 Oct 2024 11:05:34 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DED8CC78033
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 11:05:26 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2fb4af0b6beso66074101fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 04:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729508726; x=1730113526;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NqNFHSWuutv20ehvXxI1hUrs4pZWsBCSOoD06uhzKuM=;
 b=iq2tC6Jh5GumZopjrkoiyzVUB3vjQVzdW59s10JMA6v2nzECDk30kX29VASwQANrAN
 /+pfn251JKM+09AE3buH++jH+gFnZ1I3ECec+nVh7ympZnGa3DRmpROgWwirDOKl7N5s
 rsDvqXA/3xEwGtCDGB2kklYl9wfRm9N1E0FT6La31AzqcKXG7t2A9qis1H0xmypBUG+c
 B/c2QRvjjuxO7kOTlmdqtgHPV4SM86Ulav0S5ioKu5ZsMZ2CR1N8bu5bpuLlnzNpwXor
 ZOzzjj8iDdH45fMdcxj+V3mKP9DJrHhD8fIRJIViwdZ9DpMIfoQ8P/uhZFtbJpRiJRl/
 Ii0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729508726; x=1730113526;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NqNFHSWuutv20ehvXxI1hUrs4pZWsBCSOoD06uhzKuM=;
 b=qpQuuYyeQwUM6G1opM1t27HVgliEnVbWz43P9RQxjmAQ99Lap4uTTcskW6n22eEWWN
 /wDTGd5y4a0KViknTFhtuOo42/zp1LbNNTJriDrVRARnW0yCQI4iS/tiaSf16NZEilUk
 nowcYt1qbZRWG4sVPZO12VnMiM1Eg6q6/rXTW2GE2Nj4PuD24lEf3q3EHPr0nXj70tpY
 rhYMooxZZXn0q1T/Ix1DQZ0lvyQ/gislJ8YXe44ZbBHBa1RAg2PoIs3a1Anx0WCkjefM
 UReyNI3YRAaDGivGH9Yc+KbRe+eDO9HNu/o9VxLvj6aSbtke+pdiqe7LYpJe8poRyL/6
 sXlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmZqo1zPXtu+svP2EWWXX4oWkpM4STIat2Ry86DNsomxkby89REdap+jO8X4VnPSG1/nTVBbUSBd++Rw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzvR3fmrvoos57fE8xeRIttketnYEIbIFioVJPDWwktrLm+9rvO
 42YaQNwxVQm4mKEg9Yp6zIdjUFMuyJl8n4kzVX1GAAhOMhnS6hDU
X-Google-Smtp-Source: AGHT+IFOG1PkyobwVZ39rIiirf4rBQ3iEqCXuA8Jmy8EQXggUTer46/r7rXVJ6UNucPZayPd0vjXNg==
X-Received: by 2002:a05:6512:3f12:b0:533:71f:3a3d with SMTP id
 2adb3069b0e04-53a1545d85fmr8891958e87.24.1729508725650; 
 Mon, 21 Oct 2024 04:05:25 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a2242024csm453364e87.121.2024.10.21.04.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 04:05:25 -0700 (PDT)
Date: Mon, 21 Oct 2024 14:05:21 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: jitendra.vegiraju@broadcom.com
Message-ID: <nvc3cop5dn5yjmt4n3q64j76ulsowfw4l577pe47qmba3pvz4z@owm4jwjuhawr>
References: <20241018205332.525595-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241018205332.525595-1-jitendra.vegiraju@broadcom.com>
Cc: andrew@lunn.ch, quic_abchauha@quicinc.com, Jianheng.Zhang@synopsys.com,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 daniel@iogearbox.net, john.fastabend@gmail.com, linux@armlinux.org.uk,
 joabreu@synopsys.com, bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, ahalaney@redhat.com,
 hawk@kernel.org, richardcochran@gmail.com, ast@kernel.org,
 rmk+kernel@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 xiaolei.wang@windriver.com, florian.fainelli@broadcom.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, horms@kernel.org,
 mcoquelin.stm32@gmail.com, bpf@vger.kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v6 0/5] net: stmmac: Add PCI
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

On Fri, Oct 18, 2024 at 01:53:27PM GMT, jitendra.vegiraju@broadcom.com wrote:
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
> v5->v6:
>    Change summary to address comments/suggestions by Serge Semin.
>    Patch1:
>      Removed the comlexity of hdma mapping in previous patch series and
>      use static DMA mapping.
>      Renamed plat_stmmacenet_data::snps_dev_id as dev_id and moved to
>      the beginning of the struct.
>    Patch2:
>      Added dw25gmac_get_hw_feature() for dw25gmac.
>      Use static one-to-one VDMA-TC-PDMA mapping.
>    Patch4:
>      Remove usage of plat_stmmacenet_data::msi_*_vec variables for
>      interrupt vector initialization.
>      Change phy_interface type to XGMII.
>      Cleanup unused macros.

Sorry for abandoning the v5 discussion for too long. I've finally
finished another urgent task, so I'll be more interactive in the next
few weeks. I'll get back to reviewing this series today or early
tomorrow.

-Serge(y)

>      
> v4->v5:
>    Summary of changes in this patch series:
>    As suggested by Serge Semin, defined common setup function for dw25gmac.
>    To accommodate early adopter DW25GMAC used in BCM8958x device, provide
>    a mechanism to override snps_id and snps_dev_id used for driver entry
>    matching in hwif.c
> 
>    Patch1:
>      Added plat_stmmacenet_data::snps_id,snps_dev_id fields - Serge Semin
>    Patch2:
>      Define common setup function for dw25gmac_setup() - Serge Semin
>      Support DW25GMAC IPs with varying VDMA/PDMA count - Abhishek Chauhan
>      Allocate and initialize hdma mapping configuration data dynamically
>      based on device's VDMA/PDMA feature capabilities in dw25gmac_setup().
>      Spelling errors in commit log, lower case 0x for hex -Amit Singh Tomar
>    Patch3:
>      Glue support in hwif.c for DW25GMAC in hwif.c - Serge Semin
>      Provide an option to override snps_id and snps_dev_id when the device
>      reports version info not conformant with driver's expectations as is
>      the case with BCM8958x device. - Serge Semin
>    Patch4:
>      Remove setup function in the glue driver - Serge Semin
>      Remove unnecessary calls pci_enable_device() and pci_set_master()
>      in dwxgmac_brcm_pci_resume() - Jakub Kicinski
>      Merge variable definitions to single line - Amit Singh Tomar
>     https://lore.kernel.org/netdev/20240904054815.1341712-1-jitendra.vegiraju@broadcom.com/
>    
> v3->v4:
>    Based on Serge's questions, received a confirmation from Synopsys that
>    the MAC IP is indeed the new 25GMAC design.
>    Renamed all references of XGMAC4 to 25GMAC.
>    The patch series is rearranged slightly as follows.
>    Patch1 (new): Define HDMA mapping data structure in kernel's stmmac.h
>    Patch2 (v3 Patch1): Adds dma_ops for dw25gmac in stmmac core
>        Renamed new files dwxgmac4.* to dw25gmac.* - Serge Semin
>        Defined new Synopsis version and device id macros for DW25GMAC.
>        Converted bit operations to FIELD_PREP macros - Russell King
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
>    https://lore.kernel.org/netdev/20240814221818.2612484-1-jitendra.vegiraju@broadcom.com/
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
>   Add snps_id, dev_id to struct plat_stmmacenet_data
>   Add basic dw25gmac support in stmmac core
>   Integrate dw25gmac into stmmac hwif handling
>   Add PCI driver support for BCM8958x
>   Add BCM8958x driver to build system
> 
>  MAINTAINERS                                   |   8 +
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   3 +-
>  drivers/net/ethernet/stmicro/stmmac/common.h  |   4 +
>  .../net/ethernet/stmicro/stmmac/dw25gmac.c    | 161 ++++++
>  .../net/ethernet/stmicro/stmmac/dw25gmac.h    |  92 ++++
>  .../net/ethernet/stmicro/stmmac/dwmac-brcm.c  | 478 ++++++++++++++++++
>  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |   1 +
>  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  42 ++
>  .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  52 ++
>  drivers/net/ethernet/stmicro/stmmac/hwif.c    |  26 +-
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    |   1 +
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |  26 +
>  include/linux/stmmac.h                        |   2 +
>  14 files changed, 905 insertions(+), 2 deletions(-)
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
