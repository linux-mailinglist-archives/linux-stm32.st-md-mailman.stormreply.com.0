Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55998973636
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Sep 2024 13:29:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01ABEC78010;
	Tue, 10 Sep 2024 11:29:48 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50590C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 11:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725967780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3k0Yno5D36yM2/Zcgb354fBW/hkrA2j+HBAI2XgatF0=;
 b=Ox0QHVSPWhe2FTH9xeUKZPLHLP+nmxZKG52tbVSBBTfP0n8Y5sHbJubD1h3xyCMXF/POPB
 jWT3ketA6+BdYAr2/jb8mwDmvXKWbykZoJsia1PEyM7I+VyUu1STUQfLJRmux5hxP56nmg
 DbQrJ+lF0wry1lsDgndf2CvHDQQa86I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-q_sJImN1OjeSbwAIVHl3Ug-1; Tue, 10 Sep 2024 07:29:39 -0400
X-MC-Unique: q_sJImN1OjeSbwAIVHl3Ug-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42cb857fc7dso15284725e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 04:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725967778; x=1726572578;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3k0Yno5D36yM2/Zcgb354fBW/hkrA2j+HBAI2XgatF0=;
 b=BcQpNFPbGQ22dasKv5/a16DwqMogpQbtWaznpMCfxLsVYepk49WB9EUY871j8TrtB4
 x2L0z4Rw1wABjq6mXfV4HiGL3EX2CB+xV4z9IK3TvAJ6blg4g0m+HhS6kXngiktlHjTC
 0ZRstmA0tWvdM9NZE4gFKQr5n6AHkGS2U2MBlf9xeAIz3LfkYwxH2pWZgmrPacEWiUQh
 srIMy/ucI33rHZgQ3jwNKpoDI6nhucvl7P88a5HB2OI2EaIYZSHi5L5GiVXUDOTwp+EG
 uI6bkcjZ+grMP9Bq1nyPSQ/wMcOrDMzDDoP4oicwHOdfggPIJsjlO3J9Wv8xQv8h35bI
 yBKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbt4fKmqsAndrdRCLG3Ipxq63WJSPIpEbIPHNT293MWF9v7FFMqcSnHoF5sm5YAXfgwkpMKdcTsUYG8w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YylvsZfxnxbA0XvrQacuznYr108ZRLPAI44Y0giIjM8pnbUx8jH
 yLDEk4tPyaDQVtJfudttzMGEK7T27fNQbQrSZbu4ghrl4sgLxltqHEHxPGVLCT1mVco7QPPoXUz
 j8vWnMjrC/HfXuM1ED1vr6Bosod5qDh7SiSlfgVKHrsJbjGG0+HnA+BOLI1KsvfHsun5QQ+y9/a
 wo4w==
X-Received: by 2002:a05:6000:4581:b0:374:ca92:5e44 with SMTP id
 ffacd0b85a97d-378895d6239mr8374070f8f.32.1725967777783; 
 Tue, 10 Sep 2024 04:29:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY+YEkoOGjNl2+G//8jJ4VdFMDQlFRqdfpWwy9CZc+EaVMXGy/JX1O/pSEqP1jkH3ae8fIng==
X-Received: by 2002:a05:6000:4581:b0:374:ca92:5e44 with SMTP id
 ffacd0b85a97d-378895d6239mr8374039f8f.32.1725967777174; 
 Tue, 10 Sep 2024 04:29:37 -0700 (PDT)
Received: from [192.168.88.27] (146-241-69-130.dyn.eolo.it. [146.241.69.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d3687sm8612612f8f.71.2024.09.10.04.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 04:29:36 -0700 (PDT)
Message-ID: <56c4fccd-787f-4936-9f4b-a1b9ebae6d03@redhat.com>
Date: Tue, 10 Sep 2024 13:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: fancer.lancer@gmail.com
References: <20240904054815.1341712-1-jitendra.vegiraju@broadcom.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20240904054815.1341712-1-jitendra.vegiraju@broadcom.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 9/4/24 07:48, jitendra.vegiraju@broadcom.com wrote:
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
>               +=================================+
>               |       Host CPU/Linux            |
>               +=================================+
>                          || PCIe
>                          ||
>          +==========================================+
>          |           +--------------+               |
>          |           | PCIE Endpoint|               |
>          |           | Ethernet     |               |
>          |           | Controller   |               |
>          |           |   DMA        |               |
>          |           +--------------+               |
>          |           |   MAC        |   BCM8958X    |
>          |           +--------------+   SoC         |
>          |               || XGMII                   |
>          |               ||                         |
>          |           +--------------+               |
>          |           | Ethernet     |               |
>          |           | switch       |               |
>          |           +--------------+               |
>          |             || || || ||                  |
>          +==========================================+
>                        || || || || More external interfaces
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
> v4->v5:
>     Summary of changes in this patch series:
>     As suggested by Serge Semin, defined common setup function for dw25gmac.
>     To accommodate early adopter DW25GMAC used in BCM8958x device, provide
>     a mechanism to override snps_id and snps_dev_id used for driver entry
>     matching in hwif.c
> 
>     Patch1:
>       Added plat_stmmacenet_data::snps_id,snps_dev_id fields - Serge Semin
>     Patch2:
>       Define common setup function for dw25gmac_setup() - Serge Semin
>       Support DW25GMAC IPs with varying VDMA/PDMA count - Abhishek Chauhan
>       Allocate and initialize hdma mapping configuration data dynamically
>       based on device's VDMA/PDMA feature capabilities in dw25gmac_setup().
>       Spelling errors in commit log, lower case 0x for hex -Amit Singh Tomar
>     Patch3:
>       Glue support in hwif.c for DW25GMAC in hwif.c - Serge Semin
>       Provide an option to override snps_id and snps_dev_id when the device
>       reports version info not conformant with driver's expectations as is
>       the case with BCM8958x device. - Serge Semin
>     Patch4:
>       Remove setup function in the glue driver - Serge Semin
>       Remove unnecessary calls pci_enable_device() and pci_set_master()
>       in dwxgmac_brcm_pci_resume() - Jakub Kicinski
>       Merge variable definitions to single line - Amit Singh Tomar
> 
> v3->v4:
>     Based on Serge's questions, received a confirmation from Synopsys that
>     the MAC IP is indeed the new 25GMAC design.
>     Renamed all references of XGMAC4 to 25GMAC.
>     The patch series is rearranged slightly as follows.
>     Patch1 (new): Define HDMA mapping data structure in kernel's stmmac.h
>     Patch2 (v3 Patch1): Adds dma_ops for dw25gmac in stmmac core
>         Renamed new files dwxgmac4.* to dw25gmac.* - Serge Semin
>         Defined new Synopsis version and device id macros for DW25GMAC.
>         Converted bit operations to FIELD_PREP macros - Russell King
>         Moved hwif.h to this patch, Sparse flagged warning - Simon Horman
>         Defined macros for hardcoded values TDPS etc - Serge Semin
>         Read number of PDMAs/VDMAs from hardware - Serge Semin
>     Patch3 (v3 Patch2): Hooks in hardware interface handling for dw25gmac
>         Resolved user_version quirks questions - Serge, Russell, Andrew
>         Added new stmmac_hw entry for DW25GMAC. - Serge
>         Added logic to override synopsis_dev_id by glue driver.
>     Patch4 (v3 Patch3): Adds PCI driver for BCM8958x device
>         Define bitmmap macros for hardcoded values - Andrew Lunn
>         Added per device software node - Andrew Lunn
>     Patch5(new/split): Adds BCM8958x driver to build system
>     https://lore.kernel.org/netdev/20240814221818.2612484-1-jitendra.vegiraju@broadcom.com/
> 
> v2->v3:
>     Addressed v2 comments from Andrew, Jakub, Russel and Simon.
>     Based on suggestion by Russel and Andrew, added software node to create
>     phylink in fixed-link mode.
>     Moved dwxgmac4 specific functions to new files dwxgmac4.c and dwxgmac4.h
>     in stmmac core module.
>     Reorganized the code to use the existing glue logic support for xgmac in
>     hwif.c and override ops functions for dwxgmac4 specific functions.
>     The patch is split into three parts.
>       Patch#1 Adds dma_ops for dwxgmac4 in stmmac core
>       Patch#2 Hooks in the hardware interface handling for dwxgmac4
>       Patch#3 Adds PCI driver for BCM8958x device
>     https://lore.kernel.org/netdev/20240802031822.1862030-1-jitendra.vegiraju@broadcom.com/
> 
> v1->v2:
>     Minor fixes to address coding style issues.
>     Sent v2 too soon by mistake, without waiting for review comments.
>     Received feedback on this version.
>     https://lore.kernel.org/netdev/20240511015924.41457-1-jitendra.vegiraju@broadcom.com/
> 
> v1:
>     https://lore.kernel.org/netdev/20240510000331.154486-1-jitendra.vegiraju@broadcom.com/
> 
> Jitendra Vegiraju (5):
>    Add HDMA mapping for dw25gmac support
>    Add basic dw25gmac support in stmmac core
>    Integrate dw25gmac into stmmac hwif handling
>    Add PCI driver support for BCM8958x
>    Add BCM8958x driver to build system
> 
>   MAINTAINERS                                   |   8 +
>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   3 +-
>   drivers/net/ethernet/stmicro/stmmac/common.h  |   4 +
>   .../net/ethernet/stmicro/stmmac/dw25gmac.c    | 224 ++++++++
>   .../net/ethernet/stmicro/stmmac/dw25gmac.h    |  92 ++++
>   .../net/ethernet/stmicro/stmmac/dwmac-brcm.c  | 507 ++++++++++++++++++
>   .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |   1 +
>   .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  43 ++
>   .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  31 ++
>   drivers/net/ethernet/stmicro/stmmac/hwif.c    |  26 +-
>   drivers/net/ethernet/stmicro/stmmac/hwif.h    |   1 +
>   include/linux/stmmac.h                        |  48 ++
>   13 files changed, 997 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dw25gmac.c
>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dw25gmac.h
>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c

Hi Serge, to you think you will have time to review this series soon?

We are sort in a rush to flush the net-next material before the upcoming 
merge window.

Thanks,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
