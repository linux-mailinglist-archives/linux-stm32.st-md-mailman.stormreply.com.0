Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 609F89743B0
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Sep 2024 21:52:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF45BC78011;
	Tue, 10 Sep 2024 19:52:11 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B918C712A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 19:52:05 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5365c512b00so1523939e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 12:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725997924; x=1726602724;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rg66culn34hkYpzu7uE7pyvZ9RgiZbC8QTthgKlA9w8=;
 b=gylgt7m32Z77qsB8xF7gLwz/rC/KdK1E7CRJmpaawYIrthe0ae+4H+iwXcL5gZceBE
 lqpExzA7d3wiSspa1zGFkdo1hFCauggrjpb9+UOEVqq60+Wy/XNYD/+7RrSaXtfhxZWO
 kClb2JfbAMEOeHaJpnn0mvvTKo/2gBHEdfZdPqaPUZq8v9L6hHP0lyUZnjkCPj5k/sh6
 SJ5RaU8XWbAHoawnbGBazKH4RURc67gohxvGZe1wWUrAcXfau2M6Xxg1eCXrwpLMzNyv
 0z6Xx7XXd6l5u5uZm36V2OZpOMz+VOTTRvPO5+p62MnOCcP6zTW6k3sdhXTYoXFEmVfR
 JhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725997924; x=1726602724;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rg66culn34hkYpzu7uE7pyvZ9RgiZbC8QTthgKlA9w8=;
 b=renrmI+D04TYH00glehFKRc+Q4wgNf5d4aNUxr3krn8XuP2tmnD3XJziLaiJdbvGFj
 FU2QlUepK9EkrPexO1cMmdUE6ZrxlFZO1tQf95saUQYDdSGKjgbNx4izPAiZ6cI/IB5V
 tEjf0KiN3YNRxPQI5XnzetNVNxKyt9F9sNe/8ydwKshh9QJ5OUzBmuyx5vPyd2o2Qjhr
 Ntu+AIrH+zB3AnV0FutlEVcyPo7pr+izJJ3hXQTn1N4AvyfQyzTAKJ1lBbrQP9uIVCt7
 WwxAd+3iE9TpGt/1a0ehsIhJKLFESpP4l1IIf54h8F0qd3yVoGS7wFMwxNXyMQNTsIhH
 pDjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTqkO1bJhc1iEQov7XbA29pr3I/FIG106nPqkVPxxcpTOn++boncLblphaNCDY3di9m/MkVPacC0y+3A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YytclWAacMAWkgBHDjVP6tbSYklAfWrE9Aisq3YugVEs5hFkB3J
 DW+BJdwDlAgSZs/fvuYcL3G0K4Z3FvPN4+Mp+n4PCpTzWlYsjTQW
X-Google-Smtp-Source: AGHT+IExLE42iaYlvITqmZ8EdlqzfD7O/kX6cdfUbUUEntJgpcMIYPYptt7E5l7e5wsXsrguSkUWEQ==
X-Received: by 2002:a05:6512:1382:b0:52e:9b92:4990 with SMTP id
 2adb3069b0e04-53673b6addbmr387130e87.32.1725997923179; 
 Tue, 10 Sep 2024 12:52:03 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5365f8cb671sm1276677e87.123.2024.09.10.12.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 12:52:02 -0700 (PDT)
Date: Tue, 10 Sep 2024 22:51:59 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: jitendra.vegiraju@broadcom.com
Message-ID: <zv2yxt4aw2wscvmcaadll5gmiswhlgdiesuny2ge7ufhs3xyjn@d7oxhj63qiey>
References: <20240904054815.1341712-1-jitendra.vegiraju@broadcom.com>
 <20240904054815.1341712-5-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240904054815.1341712-5-jitendra.vegiraju@broadcom.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v5 4/5] net: stmmac: Add PCI
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

On Tue, Sep 03, 2024 at 10:48:14PM -0700, jitendra.vegiraju@broadcom.com wrote:
> From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> 
> Add PCI ethernet driver support for Broadcom BCM8958x SoC devices used
> in automotive applications.
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
> The MAC IP block on BCM8958x is based on Synopsis XGMAC 4.00a core. This
> driver uses common dwxgmac2 code where applicable.
> Driver functionality specific to this MAC is implemented in dw25gmac.c.
> The glue driver is responsible for setting up hdma mappings.
> 
> Management of integrated ethernet switch on this SoC is not handled by
> the PCIe interface.
> Since BCM8958x is an early adopter device, override the hardware reported
> synopsis versions with actual DW25MAC versions that support hdma.
> 
> This SoC device has PCIe ethernet MAC directly attached to an integrated
> ethernet switch using XGMII interface. Since device tree support is not
> available on this platform, a software node is created to enable
> fixed-link support using phylink driver.
> 
> Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-brcm.c  | 507 ++++++++++++++++++
>  1 file changed, 507 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
> new file mode 100644
> index 000000000000..b5dd97d9b938
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
> @@ -0,0 +1,507 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2024 Broadcom Corporation
> + *
> + * PCI driver for ethernet interface of BCM8958X automotive switch chip.
> + *
> + * High level block diagram of the device.
> + *              +=================================+
> + *              |       Host CPU/Linux            |
> + *              +=================================+
> + *                         || PCIe
> + *                         ||
> + *         +==========================================+
> + *         |           +--------------+               |
> + *         |           | PCIE Endpoint|               |
> + *         |           | Ethernet     |               |
> + *         |           | Controller   |               |
> + *         |           |   DMA        |               |
> + *         |           +--------------+               |
> + *         |           |   MAC        |   BCM8958X    |
> + *         |           +--------------+   SoC         |
> + *         |               || XGMII                   |
> + *         |               ||                         |
> + *         |           +--------------+               |
> + *         |           | Ethernet     |               |
> + *         |           | switch       |               |
> + *         |           +--------------+               |
> + *         |             || || || ||                  |
> + *         +==========================================+
> + *                       || || || || More external interfaces
> + *
> + * This SoC device has PCIe ethernet MAC directly attached to an integrated
> + * ethernet switch using XGMII interface. Since devicetree support is not
> + * available on this platform, a software node is created to enable
> + * fixed-link support using phylink driver.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/dmi.h>
> +#include <linux/pci.h>
> +#include <linux/phy.h>
> +
> +#include "stmmac.h"
> +#include "dwxgmac2.h"
> +#include "dw25gmac.h"
> +
> +#define PCI_DEVICE_ID_BROADCOM_BCM8958X		0xa00d
> +#define BRCM_MAX_MTU				1500

> +#define READ_POLL_DELAY_US			100
> +#define READ_POLL_TIMEOUT_US			10000

These macros are unused. Why do you need them here?

> +#define DWMAC_125MHZ				125000000
> +#define DWMAC_250MHZ				250000000

Drop these and use the literals directly.

> +#define BRCM_XGMAC_NUM_VLAN_FILTERS		32
> +
> +/* TX and RX Queue counts */
> +#define BRCM_TX_Q_COUNT				4
> +#define BRCM_RX_Q_COUNT				4
> +

> +#define BRCM_XGMAC_DMA_TX_SIZE			1024
> +#define BRCM_XGMAC_DMA_RX_SIZE			1024

Unused.

> +#define BRCM_XGMAC_BAR0_MASK			BIT(0)
> +
> +#define BRCM_XGMAC_IOMEM_MISC_REG_OFFSET	0x0
> +#define BRCM_XGMAC_IOMEM_MBOX_REG_OFFSET	0x1000
> +#define BRCM_XGMAC_IOMEM_CFG_REG_OFFSET		0x3000
> +
> +#define XGMAC_MMC_CTRL_RCHM_DISABLE		BIT(31)
> +#define XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LOW	0x940
> +#define XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LO_VALUE	0x00000001
> +#define XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HIGH	0x944
> +#define XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HI_VALUE	0x88000000
> +
> +#define XGMAC_PCIE_MISC_MII_CTRL_OFFSET			0x4
> +#define XGMAC_PCIE_MISC_MII_CTRL_PAUSE_RX		BIT(0)
> +#define XGMAC_PCIE_MISC_MII_CTRL_PAUSE_TX		BIT(1)
> +#define XGMAC_PCIE_MISC_MII_CTRL_LINK_UP		BIT(2)
> +#define XGMAC_PCIE_MISC_PCIESS_CTRL_OFFSET		0x8
> +#define XGMAC_PCIE_MISC_PCIESS_CTRL_EN_MSI_MSIX		BIT(9)
> +#define XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_OFFSET	0x90
> +#define XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_VALUE	0x00000001
> +#define XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_OFFSET	0x94
> +#define XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_VALUE	0x88000000
> +#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST0_OFFSET	0x700
> +#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST0_VALUE	1
> +#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST1_OFFSET	0x704
> +#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST1_VALUE	1
> +#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST_DBELL_OFFSET	0x728
> +#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST_DBELL_VALUE	1
> +#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_SBD_ALL_OFFSET	0x740
> +#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_SBD_ALL_VALUE	0
> +
> +#define XGMAC_PCIE_MISC_FUNC_RESOURCES_PF0_OFFSET	0x804
> +
> +/* MSIX Vector map register starting offsets */
> +#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_RX0_PF0_OFFSET	0x840
> +#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_TX0_PF0_OFFSET	0x890
> +#define BRCM_MAX_DMA_CHANNEL_PAIRS		4
> +
> +#define BRCM_XGMAC_MSI_MAC_VECTOR		0
> +#define BRCM_XGMAC_MSI_RX_VECTOR_START		9
> +#define BRCM_XGMAC_MSI_TX_VECTOR_START		10
> +
> +static char *fixed_link_node_name = "fixed-link";
> +
> +static const struct property_entry fixed_link_properties[] = {
> +	PROPERTY_ENTRY_U32("speed", 10000),
> +	PROPERTY_ENTRY_BOOL("full-duplex"),
> +	PROPERTY_ENTRY_BOOL("pause"),
> +	{ }
> +};
> +
> +struct brcm_priv_data {
> +	void __iomem *mbox_regs;    /* MBOX  Registers*/
> +	void __iomem *misc_regs;    /* MISC  Registers*/
> +	void __iomem *xgmac_regs;   /* XGMAC Registers*/
> +	struct software_node fixed_link_node;
> +};
> +
> +struct dwxgmac_brcm_pci_info {
> +	int (*setup)(struct pci_dev *pdev, struct plat_stmmacenet_data *plat);
> +};
> +
> +static void misc_iowrite(struct brcm_priv_data *brcm_priv,
> +			 u32 reg, u32 val)
> +{
> +	iowrite32(val, brcm_priv->misc_regs + reg);
> +}
> +
> +static void dwxgmac_brcm_common_default_data(struct plat_stmmacenet_data *plat)
> +{
> +	int i;
> +
> +	plat->has_xgmac = 1;
> +	plat->force_sf_dma_mode = 1;
> +	plat->mac_port_sel_speed = SPEED_10000;

> +	plat->clk_ptp_rate = DWMAC_125MHZ;
> +	plat->clk_ref_rate = DWMAC_250MHZ;

Just 125000000 and 250000000. There is no need in defining the macro
with the names matching the numerical literals.

> +	plat->tx_coe = 1;
> +	plat->rx_coe = 1;
> +	plat->max_speed = SPEED_10000;
> +
> +	/* Set default value for multicast hash bins */
> +	plat->multicast_filter_bins = HASH_TABLE_SIZE;
> +
> +	/* Set default value for unicast filter entries */
> +	plat->unicast_filter_entries = 1;
> +
> +	/* Set the maxmtu to device's default */
> +	plat->maxmtu = BRCM_MAX_MTU;
> +
> +	/* Set default number of RX and TX queues to use */
> +	plat->tx_queues_to_use = BRCM_TX_Q_COUNT;
> +	plat->rx_queues_to_use = BRCM_RX_Q_COUNT;
> +
> +	plat->tx_sched_algorithm = MTL_TX_ALGORITHM_SP;
> +	for (i = 0; i < plat->tx_queues_to_use; i++) {
> +		plat->tx_queues_cfg[i].use_prio = false;
> +		plat->tx_queues_cfg[i].prio = 0;
> +		plat->tx_queues_cfg[i].mode_to_use = MTL_QUEUE_AVB;
> +	}
> +
> +	plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
> +	for (i = 0; i < plat->rx_queues_to_use; i++) {
> +		plat->rx_queues_cfg[i].use_prio = false;
> +		plat->rx_queues_cfg[i].mode_to_use = MTL_QUEUE_AVB;
> +		plat->rx_queues_cfg[i].pkt_route = 0x0;
> +		plat->rx_queues_cfg[i].chan = i;
> +	}
> +}
> +
> +static int dwxgmac_brcm_default_data(struct pci_dev *pdev,
> +				     struct plat_stmmacenet_data *plat)
> +{
> +	/* Set common default data first */
> +	dwxgmac_brcm_common_default_data(plat);
> +
> +	plat->snps_id = DW25GMAC_CORE_4_00;
> +	plat->snps_dev_id = DW25GMAC_ID;
> +	plat->bus_id = 0;
> +	plat->phy_addr = 0;

> +	plat->phy_interface = PHY_INTERFACE_MODE_USXGMII;

Really, USXGMII? Universal Serial XGMII? Synopsys call it just XGMII:
https://www.synopsys.com/dw/ipdir.php?ds=dwc_25g_ethernet_mac_ip

> +
> +	plat->dma_cfg->pbl = 32;
> +	plat->dma_cfg->pblx8 = 0;
> +	plat->dma_cfg->aal = 0;
> +	plat->dma_cfg->eame = 1;
> +
> +	plat->axi->axi_wr_osr_lmt = 31;
> +	plat->axi->axi_rd_osr_lmt = 31;
> +	plat->axi->axi_fb = 0;
> +	plat->axi->axi_blen[0] = 4;
> +	plat->axi->axi_blen[1] = 8;
> +	plat->axi->axi_blen[2] = 16;
> +	plat->axi->axi_blen[3] = 32;
> +	plat->axi->axi_blen[4] = 64;
> +	plat->axi->axi_blen[5] = 128;
> +	plat->axi->axi_blen[6] = 256;
> +

> +	plat->msi_mac_vec = BRCM_XGMAC_MSI_MAC_VECTOR;
> +	plat->msi_rx_base_vec = BRCM_XGMAC_MSI_RX_VECTOR_START;
> +	plat->msi_tx_base_vec = BRCM_XGMAC_MSI_TX_VECTOR_START;

Please see my next comments about these fields utilization.

> +
> +	return 0;
> +}
> +
> +static struct dwxgmac_brcm_pci_info dwxgmac_brcm_pci_info = {
> +	.setup = dwxgmac_brcm_default_data,
> +};
> +
> +static void brcm_config_misc_regs(struct pci_dev *pdev,
> +				  struct brcm_priv_data *brcm_priv)
> +{
> +	pci_write_config_dword(pdev, XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LOW,
> +			       XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LO_VALUE);
> +	pci_write_config_dword(pdev, XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HIGH,
> +			       XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HI_VALUE);
> +
> +	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_OFFSET,
> +		     XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_VALUE);
> +	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_OFFSET,
> +		     XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_VALUE);
> +
> +	/* Enable Switch Link */
> +	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MII_CTRL_OFFSET,
> +		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_RX |
> +		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_TX |
> +		     XGMAC_PCIE_MISC_MII_CTRL_LINK_UP);
> +}
> +
> +static int brcm_config_multi_msi(struct pci_dev *pdev,
> +				 struct plat_stmmacenet_data *plat,
> +				 struct stmmac_resources *res)
> +{
> +	int ret, i;
> +

> +	if (plat->msi_rx_base_vec >= STMMAC_MSI_VEC_MAX ||
> +	    plat->msi_tx_base_vec >= STMMAC_MSI_VEC_MAX) {

Please see my next comment about these fields and STMMAC_MSI_VEC_MAX
utilization.

> +		dev_err(&pdev->dev, "%s: Invalid RX & TX vector defined\n",
> +			__func__);
> +		return -EINVAL;
> +	}
> +
> +	ret = pci_alloc_irq_vectors(pdev, 2, STMMAC_MSI_VEC_MAX,
> +				    PCI_IRQ_MSI | PCI_IRQ_MSIX);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "%s: multi MSI enablement failed\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	/* For RX MSI */
> +	for (i = 0; i < plat->rx_queues_to_use; i++)
> +		res->rx_irq[i] = pci_irq_vector(pdev,
> +						plat->msi_rx_base_vec + i * 2);
> +
> +	/* For TX MSI */
> +	for (i = 0; i < plat->tx_queues_to_use; i++)
> +		res->tx_irq[i] = pci_irq_vector(pdev,
> +						plat->msi_tx_base_vec + i * 2);
> +

> +	if (plat->msi_mac_vec < STMMAC_MSI_VEC_MAX)
> +		res->irq = pci_irq_vector(pdev, plat->msi_mac_vec);

What if msi_mac_vec is greater than STMMAC_MSI_VEC_MAX? Will your
device work without delivering the MAC IRQs? I doubt so.

In anyway see my next comment.

> +
> +	plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
> +	plat->flags |= STMMAC_FLAG_TSO_EN;
> +
> +	return 0;
> +}
> +
> +static int dwxgmac_brcm_pci_probe(struct pci_dev *pdev,
> +				  const struct pci_device_id *id)
> +{
> +	struct dwxgmac_brcm_pci_info *info =
> +		(struct dwxgmac_brcm_pci_info *)id->driver_data;
> +	struct plat_stmmacenet_data *plat;
> +	struct brcm_priv_data *brcm_priv;
> +	struct stmmac_resources res;
> +	struct device *dev;
> +	int rx_offset;
> +	int tx_offset;
> +	int vector;
> +	int ret;
> +
> +	dev = &pdev->dev;
> +
> +	brcm_priv = devm_kzalloc(&pdev->dev, sizeof(*brcm_priv), GFP_KERNEL);
> +	if (!brcm_priv)
> +		return -ENOMEM;
> +
> +	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
> +	if (!plat)
> +		return -ENOMEM;
> +
> +	plat->dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg),
> +				     GFP_KERNEL);
> +	if (!plat->dma_cfg)
> +		return -ENOMEM;
> +
> +	plat->axi = devm_kzalloc(&pdev->dev, sizeof(*plat->axi), GFP_KERNEL);
> +	if (!plat->axi)
> +		return -ENOMEM;
> +
> +	/* This device is directly attached to the switch chip internal to the
> +	 * SoC using XGMII interface. Since no MDIO is present, register
> +	 * fixed-link software_node to create phylink.
> +	 */
> +	plat->port_node = fwnode_create_software_node(NULL, NULL);
> +	brcm_priv->fixed_link_node.name = fixed_link_node_name;
> +	brcm_priv->fixed_link_node.properties = fixed_link_properties;
> +	brcm_priv->fixed_link_node.parent = to_software_node(plat->port_node);
> +	device_add_software_node(dev, &brcm_priv->fixed_link_node);
> +
> +	/* Disable D3COLD as our device does not support it */
> +	pci_d3cold_disable(pdev);
> +
> +	/* Enable PCI device */
> +	ret = pcim_enable_device(pdev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "%s: ERROR: failed to enable device\n",
> +			__func__);
> +		return ret;
> +	}
> +
> +	/* Get the base address of device */
> +	ret = pcim_iomap_regions(pdev, BRCM_XGMAC_BAR0_MASK, pci_name(pdev));
> +	if (ret)
> +		return ret;
> +	pci_set_master(pdev);
> +
> +	memset(&res, 0, sizeof(res));
> +	res.addr = pcim_iomap_table(pdev)[0];
> +	/* MISC Regs */
> +	brcm_priv->misc_regs = res.addr + BRCM_XGMAC_IOMEM_MISC_REG_OFFSET;
> +	/* MBOX Regs */
> +	brcm_priv->mbox_regs = res.addr + BRCM_XGMAC_IOMEM_MBOX_REG_OFFSET;
> +	/* XGMAC config Regs */
> +	res.addr += BRCM_XGMAC_IOMEM_CFG_REG_OFFSET;
> +	brcm_priv->xgmac_regs = res.addr;
> +
> +	plat->bsp_priv = brcm_priv;
> +
> +	/* Initialize all MSI vectors to invalid so that it can be set
> +	 * according to platform data settings below.
> +	 * Note: MSI vector takes value from 0 up to 31 (STMMAC_MSI_VEC_MAX)
> +	 */

> +	plat->msi_mac_vec = STMMAC_MSI_VEC_MAX;
> +	plat->msi_wol_vec = STMMAC_MSI_VEC_MAX;
> +	plat->msi_lpi_vec = STMMAC_MSI_VEC_MAX;
> +	plat->msi_sfty_ce_vec = STMMAC_MSI_VEC_MAX;
> +	plat->msi_sfty_ue_vec = STMMAC_MSI_VEC_MAX;
> +	plat->msi_rx_base_vec = STMMAC_MSI_VEC_MAX;
> +	plat->msi_tx_base_vec = STMMAC_MSI_VEC_MAX;

Please don't use these fields and the STMMAC_MSI_VEC_MAX macro. Either
have the BRCM_XGMAC_MSI* macros utilized directly or define the
device-specific data in the glue driver (in brcm_priv_data if you
wish). Really the MSI vectors aren't related to any DW *MAC IP-core
these are the pure vendor platform-specific settings.

The fields originally have been introduced by the Intel developers,
who AFAICS just found it easier to extend the generic platform-data
structure instead of introducing the new Intel MAC-specific data.

I am going to drop these fields in a future cleanup patchset so to
reduce the plat_stmmacenet_data structure complexity.

-Serge(y)

> [...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
