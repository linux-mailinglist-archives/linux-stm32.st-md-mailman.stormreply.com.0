Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5DC96F413
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 14:14:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73AABC78013;
	Fri,  6 Sep 2024 12:14:32 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDDDBC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 12:14:24 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5365aec6fc1so517151e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Sep 2024 05:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725624864; x=1726229664;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7MCTJ64Ap0FWa8Yerpoe9k6SUGm0Hd0erFmU70Kt+Uk=;
 b=bM/L1imfpbglILIACZDjgvINHB75qFgprJoROILBtg+hcPEp6b/en1CR1vr2xIIjSP
 dIMnPrvdy+aiTGFZDLLfYwAVdCrP31CuG6zeTX4IWLBO0o6Q8JRs4UR2Pjei1YvWk+Si
 Vs4s4//ASlyx/Q7u7u/pfv5/kuY/Mwm4OGvw8skJTjlg+T9rOoL62Nc+CSp976nFB5BD
 kxIpXxyuxCQeQFzuuOe2WjXrUOjTOUUllVUsPapeOactQCWpWahf7fBSEl9LL2AOBeOq
 UisqhtJuF4J1lOjsLCZqpsEsZTRhPuUeMSXm/f6a8Q8hx6i0a7R6RLX3tZHP9JUQCXwx
 41pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725624864; x=1726229664;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7MCTJ64Ap0FWa8Yerpoe9k6SUGm0Hd0erFmU70Kt+Uk=;
 b=pYF8eZUd4ZIhDPJxD3zGR47ezF3YCAe+a+ZXoS7S2jao+pCMXI7XK+aeQF6sNGo+D1
 3nDJDfCGzbxBuHshWxnhvdpgpE77UyVpMNiz9f/V4Vez8/VoaJZC7zsK9wtKJt5sllR7
 Dn4DLJM/o9dbO3DKN5b9y1fb9hf67eVKcbUsoc5Rd7DJjbylSMSARLFAetC0/BjVjMGT
 bYKaM83Wps6Qo6z+8Nk73bJ+JR1FMig70301YwndRckZC90T0yCdShkiJ2Dq2SPvDctC
 ZPO5AcKWa0Wxzx11kXFsC6DX6fDq1H2Fs/OkP6D9hsOKRG/iYVnhcSOeUyPrWvvlQYBW
 8IdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuGcAzwNxkeBwrrr3BvFf785UBAKrdd8KmgvkYAO91AX4syTUWZVfYejnnqU8zbYnhqtY8lh3KpWcVpw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzRfzyO6UdmaIUbTEacmXIlPaVOWOqgP4gAM1XTThA49nUq8fz9
 YAk2Ksod+N5iXTRFSVeAulRz+U60stQhhBDtTY3MfLJ8+XgsExI+
X-Google-Smtp-Source: AGHT+IGydFRd1uISwcLNQ7/uLhpGxcjZgeGYt7HNPMfkdE+mw4ggyg3ydgWLV8t9ZR41n0MYx7mGoA==
X-Received: by 2002:a05:6512:398d:b0:532:ef22:eb4e with SMTP id
 2adb3069b0e04-5365880a275mr1109279e87.54.1725624863153; 
 Fri, 06 Sep 2024 05:14:23 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5356d3782e0sm464090e87.299.2024.09.06.05.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 05:14:22 -0700 (PDT)
Date: Fri, 6 Sep 2024 15:14:20 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: jitendra.vegiraju@broadcom.com
Message-ID: <h74bn2huz3oul27lu7b7upy6mtpbr4w4mbtquxqlvzccackoiy@74tc67lafadf>
References: <20240904054815.1341712-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240904054815.1341712-1-jitendra.vegiraju@broadcom.com>
Cc: andrew@lunn.ch, Jianheng.Zhang@synopsys.com, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org,
 rohan.g.thomas@intel.com, pabeni@redhat.com, ahalaney@redhat.com,
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

Hi Jitendra

On Tue, Sep 03, 2024 at 10:48:10PM -0700, jitendra.vegiraju@broadcom.com wrote:
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

Thanks for the update. I'll have a closer look at the series early
next week.

-Serge(y)

> [...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
