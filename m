Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA10945691
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 05:18:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFE19C712A2;
	Fri,  2 Aug 2024 03:18:35 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com
 [192.19.144.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA19EC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 03:18:28 +0000 (UTC)
Received: from mail-lvn-it-01.lvn.broadcom.net
 (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
 by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id A7FB7C0000FB;
 Thu,  1 Aug 2024 20:18:27 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com A7FB7C0000FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1722568707;
 bh=Byi4hFC4zQfURMvG9HJsbqs4CTUUYXVawmUffe2MvgU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V01bo855974jyILx11o6rArID2xgFGTAfUwUD6a+EB/gxzkG4TVLjiVhkLtONwmtQ
 i/ogUHwtru0oMGOXzfGtkEOAYWmqMDwN0582E/BdtkqwWU1WUDFKt4d68M2T8Ra53H
 M8OidI2gKYuhqJJaJUWDmOHFWko7LF7YcxO9NA60=
Received: from pcie-dev03.dhcp.broadcom.net (pcie-dev03.dhcp.broadcom.net
 [10.59.171.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id D2A0818041CAC4;
 Thu,  1 Aug 2024 20:18:24 -0700 (PDT)
From: jitendra.vegiraju@broadcom.com
To: netdev@vger.kernel.org
Date: Thu,  1 Aug 2024 20:18:22 -0700
Message-Id: <20240802031822.1862030-4-jitendra.vegiraju@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Cc: andrew@lunn.ch, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, linux@armlinux.org.uk, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, jitendra.vegiraju@broadcom.com,
 kuba@kernel.org, pabeni@redhat.com, hawk@kernel.org, richardcochran@gmail.com,
 ast@kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com,
 linux-kernel@vger.kernel.org, horms@kernel.org, bpf@vger.kernel.org,
 davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Add PCI driver
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

From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>

Add PCI ethernet driver support for Broadcom BCM8958x SoC devices used
in automotive applications.

This SoC device has PCIe ethernet MAC attached to an integrated ethernet
switch using XGMII interface. The PCIe ethernet controller is presented to
the Linux host as PCI network device.

The following block diagram gives an overview of the application.
             +=================================+
             |       Host CPU/Linux            |
             +=================================+
                        || PCIe
                        ||
        +==========================================+
        |           +--------------+               |
        |           | PCIE Endpoint|               |
        |           | Ethernet     |               |
        |           | Controller   |               |
        |           |   DMA        |               |
        |           +--------------+               |
        |           |   MAC        |   BCM8958X    |
        |           +--------------+   SoC         |
        |               || XGMII                   |
        |               ||                         |
        |           +--------------+               |
        |           | Ethernet     |               |
        |           | switch       |               |
        |           +--------------+               |
        |             || || || ||                  |
        +==========================================+
                      || || || || More external interfaces

The MAC block on BCM8958x is based on Synopsis XGMAC 4.00a core. This
driver uses common dwxgmac2 code where applicable.
Driver functionality specific to this MAC is implemented in dwxgmac4.c.

Management of integrated ethernet switch on this SoC is not handled by
the PCIe interface.

This SoC device has PCIe ethernet MAC directly attached to an integrated
ethernet switch using XGMII interface. Since device tree support is not
available on this platform, a software node is created to enable
fixed-link support using phylink driver.

Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
---
 MAINTAINERS                                   |   8 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-brcm.c  | 517 ++++++++++++++++++
 4 files changed, 537 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8766f3e5e87e..cce3d2e9eb22 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4350,6 +4350,14 @@ N:	brcmstb
 N:	bcm7038
 N:	bcm7120
 
+BROADCOM BCM8958X ETHERNET DRIVER
+M:	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
+R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
+F:	drivers/net/ethernet/stmicro/stmmac/dwxgmac4.*
+
 BROADCOM BCMBCA ARM ARCHITECTURE
 M:	William Zhang <william.zhang@broadcom.com>
 M:	Anand Gore <anand.gore@broadcom.com>
diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 05cc07b8f48c..47c9db123b03 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -298,6 +298,17 @@ config DWMAC_LOONGSON
 	  This selects the LOONGSON PCI bus support for the stmmac driver,
 	  Support for ethernet controller on Loongson-2K1000 SoC and LS7A1000 bridge.
 
+config DWMAC_BRCM
+	tristate "Broadcom XGMAC support"
+	depends on STMMAC_ETH && PCI
+	depends on COMMON_CLK
+	help
+	  Support for ethernet controllers on Broadcom BCM8958x SoCs.
+
+	  This selects Broadcom XGMAC specific PCI bus support for the
+	  stmmac driver. This driver provides the glue layer on top of the
+	  stmmac driver required for the Broadcom BCM8958x SoC devices.
+
 config STMMAC_PCI
 	tristate "STMMAC PCI bus support"
 	depends on STMMAC_ETH && PCI
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 2f637612513d..90c135ea25eb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -41,4 +41,5 @@ dwmac-altr-socfpga-objs := dwmac-socfpga.o
 obj-$(CONFIG_STMMAC_PCI)	+= stmmac-pci.o
 obj-$(CONFIG_DWMAC_INTEL)	+= dwmac-intel.o
 obj-$(CONFIG_DWMAC_LOONGSON)	+= dwmac-loongson.o
+obj-$(CONFIG_DWMAC_BRCM)	+= dwmac-brcm.o
 stmmac-pci-objs:= stmmac_pci.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
new file mode 100644
index 000000000000..a7b0031506b8
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
@@ -0,0 +1,517 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2024 Broadcom Corporation
+ *
+ * PCI driver for ethernet interface of BCM8958X automotive switch chip.
+ *
+ * High level block diagram of the device.
+ *              +=================================+
+ *              |       Host CPU/Linux            |
+ *              +=================================+
+ *                         || PCIe
+ *                         ||
+ *         +==========================================+
+ *         |           +--------------+               |
+ *         |           | PCIE Endpoint|               |
+ *         |           | Ethernet     |               |
+ *         |           | Controller   |               |
+ *         |           |   DMA        |               |
+ *         |           +--------------+               |
+ *         |           |   MAC        |   BCM8958X    |
+ *         |           +--------------+   SoC         |
+ *         |               || XGMII                   |
+ *         |               ||                         |
+ *         |           +--------------+               |
+ *         |           | Ethernet     |               |
+ *         |           | switch       |               |
+ *         |           +--------------+               |
+ *         |             || || || ||                  |
+ *         +==========================================+
+ *                       || || || || More external interfaces
+ *
+ * This SoC device has PCIe ethernet MAC directly attached to an integrated
+ * ethernet switch using XGMII interface. Since devicetree support is not
+ * available on this platform, a software node is created to enable
+ * fixed-link support using phylink driver.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/dmi.h>
+#include <linux/pci.h>
+#include <linux/phy.h>
+
+#include "stmmac.h"
+#include "dwxgmac2.h"
+
+#define PCI_DEVICE_ID_BROADCOM_BCM8958X		0xa00d
+#define BRCM_MAX_MTU				1500
+#define READ_POLL_DELAY_US			100
+#define READ_POLL_TIMEOUT_US			10000
+#define DWMAC_125MHZ				125000000
+#define DWMAC_250MHZ				250000000
+#define BRCM_XGMAC_NUM_VLAN_FILTERS		32
+
+/* TX and RX Queue counts */
+#define BRCM_TX_Q_COUNT				4
+#define BRCM_RX_Q_COUNT				4
+
+#define BRCM_XGMAC_DMA_TX_SIZE			1024
+#define BRCM_XGMAC_DMA_RX_SIZE			1024
+#define BRCM_XGMAC_BAR0_MASK			BIT(0)
+
+#define BRCM_XGMAC_IOMEM_MISC_REG_OFFSET	0x0
+#define BRCM_XGMAC_IOMEM_MBOX_REG_OFFSET	0x1000
+#define BRCM_XGMAC_IOMEM_CFG_REG_OFFSET		0x3000
+
+#define XGMAC_MMC_CTRL_RCHM_DISABLE		BIT(31)
+#define XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LOW	0x940
+#define XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LO_VALUE	0x00000001
+#define XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HIGH	0x944
+#define XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HI_VALUE	0x88000000
+
+#define XGMAC_PCIE_MISC_MII_CTRL			0x4
+#define XGMAC_PCIE_MISC_MII_CTRL_VALUE			0x7
+#define XGMAC_PCIE_MISC_PCIESS_CTRL			0x8
+#define XGMAC_PCIE_MISC_PCIESS_CTRL_VALUE		0x200
+#define XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO		0x90
+#define XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_VALUE	0x00000001
+#define XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI		0x94
+#define XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_VALUE	0x88000000
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST0	0x700
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST0_VALUE	1
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST1	0x704
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST1_VALUE	1
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST_DBELL	0x728
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST_DBELL_VALUE	1
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_SBD_ALL		0x740
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_SBD_ALL_VALUE	0
+
+#define XGMAC_PCIE_MISC_FUNC_RESOURCES_PF0	0x804
+
+/* MSIX Vector map register starting offsets */
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_RX0_PF0	0x840
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_TX0_PF0	0x890
+#define BRCM_MAX_DMA_CHANNEL_PAIRS		4
+
+#define BRCM_XGMAC_MSI_MAC_VECTOR		0
+#define BRCM_XGMAC_MSI_RX_VECTOR_START		9
+#define BRCM_XGMAC_MSI_TX_VECTOR_START		10
+
+static const struct software_node phy_handle_node = {
+	.name = "bcm8958x-fixed-link",
+};
+
+static const struct property_entry fixed_link_properties[] = {
+	PROPERTY_ENTRY_U32("speed", 10000),
+	PROPERTY_ENTRY_BOOL("full-duplex"),
+	PROPERTY_ENTRY_BOOL("pause"),
+	{ }
+};
+
+static const struct software_node fixed_link_node = {
+	.name = "fixed-link",
+	.parent = &phy_handle_node,
+	.properties = fixed_link_properties,
+};
+
+static const struct software_node *fixed_link_node_group[] = {
+	&phy_handle_node,
+	&fixed_link_node,
+	NULL
+};
+
+static int num_instances;
+
+struct brcm_priv_data {
+	void __iomem *mbox_regs;    /* MBOX  Registers*/
+	void __iomem *misc_regs;    /* MISC  Registers*/
+	void __iomem *xgmac_regs;   /* XGMAC Registers*/
+};
+
+struct dwxgmac_brcm_pci_info {
+	int (*setup)(struct pci_dev *pdev, struct plat_stmmacenet_data *plat);
+};
+
+static void misc_iowrite(struct brcm_priv_data *brcm_priv,
+			 u32 reg, u32 val)
+{
+	iowrite32(val, brcm_priv->misc_regs + reg);
+}
+
+static struct mac_device_info *dwxgmac_brcm_setup(void *ppriv)
+{
+	struct stmmac_priv *priv = ppriv;
+	struct mac_device_info *mac;
+
+	mac = devm_kzalloc(priv->device, sizeof(*mac), GFP_KERNEL);
+	if (!mac)
+		return NULL;
+
+	priv->synopsys_id = DWXGMAC_CORE_4_00;
+	priv->dma_conf.dma_tx_size = BRCM_XGMAC_DMA_TX_SIZE;
+	priv->dma_conf.dma_rx_size = BRCM_XGMAC_DMA_RX_SIZE;
+	priv->plat->rss_en = 1;
+	mac->pcsr = priv->ioaddr;
+	priv->dev->priv_flags |= IFF_UNICAST_FLT;
+	mac->multicast_filter_bins = priv->plat->multicast_filter_bins;
+	mac->unicast_filter_entries = priv->plat->unicast_filter_entries;
+	mac->mcast_bits_log2 = 0;
+
+	if (mac->multicast_filter_bins)
+		mac->mcast_bits_log2 = ilog2(mac->multicast_filter_bins);
+
+	mac->link.duplex = DUPLEX_FULL;
+	mac->link.caps = (MAC_ASYM_PAUSE | MAC_SYM_PAUSE | MAC_10000FD);
+	mac->link.xgmii.speed10000 = XGMAC_CONFIG_SS_10000;
+	mac->link.speed_mask = XGMAC_CONFIG_SS_MASK;
+
+	return mac;
+}
+
+static void dwxgmac_brcm_common_default_data(struct plat_stmmacenet_data *plat)
+{
+	int i;
+
+	plat->has_xgmac = 1;
+	plat->force_sf_dma_mode = 1;
+	plat->mac_port_sel_speed = SPEED_10000;
+	plat->clk_ptp_rate = DWMAC_125MHZ;
+	plat->clk_ref_rate = DWMAC_250MHZ;
+	plat->setup = dwxgmac_brcm_setup;
+	plat->tx_coe = 1;
+	plat->rx_coe = 1;
+	plat->max_speed = SPEED_10000;
+
+	/* Set default value for multicast hash bins */
+	plat->multicast_filter_bins = HASH_TABLE_SIZE;
+
+	/* Set default value for unicast filter entries */
+	plat->unicast_filter_entries = 1;
+
+	/* Set the maxmtu to device's default */
+	plat->maxmtu = BRCM_MAX_MTU;
+
+	/* Set default number of RX and TX queues to use */
+	plat->tx_queues_to_use = BRCM_TX_Q_COUNT;
+	plat->rx_queues_to_use = BRCM_RX_Q_COUNT;
+
+	plat->tx_sched_algorithm = MTL_TX_ALGORITHM_SP;
+	for (i = 0; i < plat->tx_queues_to_use; i++) {
+		plat->tx_queues_cfg[i].use_prio = false;
+		plat->tx_queues_cfg[i].prio = 0;
+		plat->tx_queues_cfg[i].mode_to_use = MTL_QUEUE_AVB;
+	}
+
+	plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
+	for (i = 0; i < plat->rx_queues_to_use; i++) {
+		plat->rx_queues_cfg[i].use_prio = false;
+		plat->rx_queues_cfg[i].mode_to_use = MTL_QUEUE_AVB;
+		plat->rx_queues_cfg[i].pkt_route = 0x0;
+		plat->rx_queues_cfg[i].chan = i;
+	}
+}
+
+static int dwxgmac_brcm_default_data(struct pci_dev *pdev,
+				     struct plat_stmmacenet_data *plat)
+{
+	/* Set common default data first */
+	dwxgmac_brcm_common_default_data(plat);
+
+	plat->bus_id = 0;
+	plat->phy_addr = 0;
+	plat->phy_interface = PHY_INTERFACE_MODE_USXGMII;
+
+	plat->dma_cfg->pbl = 32;
+	plat->dma_cfg->pblx8 = 0;
+	plat->dma_cfg->aal = 0;
+	plat->dma_cfg->eame = 1;
+
+	plat->axi->axi_wr_osr_lmt = 31;
+	plat->axi->axi_rd_osr_lmt = 31;
+	plat->axi->axi_fb = 0;
+	plat->axi->axi_blen[0] = 4;
+	plat->axi->axi_blen[1] = 8;
+	plat->axi->axi_blen[2] = 16;
+	plat->axi->axi_blen[3] = 32;
+	plat->axi->axi_blen[4] = 64;
+	plat->axi->axi_blen[5] = 128;
+	plat->axi->axi_blen[6] = 256;
+
+	plat->msi_mac_vec = BRCM_XGMAC_MSI_MAC_VECTOR;
+	plat->msi_rx_base_vec = BRCM_XGMAC_MSI_RX_VECTOR_START;
+	plat->msi_tx_base_vec = BRCM_XGMAC_MSI_TX_VECTOR_START;
+
+	return 0;
+}
+
+static struct dwxgmac_brcm_pci_info dwxgmac_brcm_pci_info = {
+	.setup = dwxgmac_brcm_default_data,
+};
+
+static int brcm_config_multi_msi(struct pci_dev *pdev,
+				 struct plat_stmmacenet_data *plat,
+				 struct stmmac_resources *res)
+{
+	int ret;
+	int i;
+
+	if (plat->msi_rx_base_vec >= STMMAC_MSI_VEC_MAX ||
+	    plat->msi_tx_base_vec >= STMMAC_MSI_VEC_MAX) {
+		dev_err(&pdev->dev, "%s: Invalid RX & TX vector defined\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	ret = pci_alloc_irq_vectors(pdev, 2, STMMAC_MSI_VEC_MAX,
+				    PCI_IRQ_MSI | PCI_IRQ_MSIX);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "%s: multi MSI enablement failed\n",
+			__func__);
+		return ret;
+	}
+
+	/* For RX MSI */
+	for (i = 0; i < plat->rx_queues_to_use; i++)
+		res->rx_irq[i] = pci_irq_vector(pdev,
+						plat->msi_rx_base_vec + i * 2);
+
+	/* For TX MSI */
+	for (i = 0; i < plat->tx_queues_to_use; i++)
+		res->tx_irq[i] = pci_irq_vector(pdev,
+						plat->msi_tx_base_vec + i * 2);
+
+	if (plat->msi_mac_vec < STMMAC_MSI_VEC_MAX)
+		res->irq = pci_irq_vector(pdev, plat->msi_mac_vec);
+
+	plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
+	plat->flags |= STMMAC_FLAG_TSO_EN;
+
+	return 0;
+}
+
+static int dwxgmac_brcm_pci_probe(struct pci_dev *pdev,
+				  const struct pci_device_id *id)
+{
+	struct dwxgmac_brcm_pci_info *info =
+		(struct dwxgmac_brcm_pci_info *)id->driver_data;
+	struct plat_stmmacenet_data *plat;
+	struct brcm_priv_data *brcm_priv;
+	struct stmmac_resources res;
+	int rx_offset;
+	int tx_offset;
+	int vector;
+	int ret;
+
+	brcm_priv = devm_kzalloc(&pdev->dev, sizeof(*brcm_priv), GFP_KERNEL);
+	if (!brcm_priv)
+		return -ENOMEM;
+
+	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL);
+	if (!plat)
+		return -ENOMEM;
+
+	plat->dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*plat->dma_cfg),
+				     GFP_KERNEL);
+	if (!plat->dma_cfg)
+		return -ENOMEM;
+
+	plat->axi = devm_kzalloc(&pdev->dev, sizeof(*plat->axi), GFP_KERNEL);
+	if (!plat->axi)
+		return -ENOMEM;
+
+	/* This device is directly attached to the switch chip internal to the
+	 * SoC using XGMII interface. Since no MDIO is present, register
+	 * fixed-link software_node to create phylink.
+	 */
+	if (num_instances == 0) {
+		ret = software_node_register_node_group(fixed_link_node_group);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"%s: failed to register software node\n",
+				__func__);
+			return ret;
+		}
+	}
+	num_instances++;
+	plat->port_node = software_node_fwnode(&phy_handle_node);
+
+	/* Disable D3COLD as our device does not support it */
+	pci_d3cold_disable(pdev);
+
+	/* Enable PCI device */
+	ret = pcim_enable_device(pdev);
+	if (ret) {
+		dev_err(&pdev->dev, "%s: ERROR: failed to enable device\n",
+			__func__);
+		return ret;
+	}
+
+	/* Get the base address of device */
+	ret = pcim_iomap_regions(pdev, BRCM_XGMAC_BAR0_MASK, pci_name(pdev));
+	if (ret)
+		goto err_disable_device;
+	pci_set_master(pdev);
+
+	memset(&res, 0, sizeof(res));
+	res.addr = pcim_iomap_table(pdev)[0];
+	/* MISC Regs */
+	brcm_priv->misc_regs = res.addr + BRCM_XGMAC_IOMEM_MISC_REG_OFFSET;
+	/* MBOX Regs */
+	brcm_priv->mbox_regs = res.addr + BRCM_XGMAC_IOMEM_MBOX_REG_OFFSET;
+	/* XGMAC config Regs */
+	res.addr += BRCM_XGMAC_IOMEM_CFG_REG_OFFSET;
+	brcm_priv->xgmac_regs = res.addr;
+
+	plat->bsp_priv = brcm_priv;
+
+	/* Initialize all MSI vectors to invalid so that it can be set
+	 * according to platform data settings below.
+	 * Note: MSI vector takes value from 0 up to 31 (STMMAC_MSI_VEC_MAX)
+	 */
+	plat->msi_mac_vec = STMMAC_MSI_VEC_MAX;
+	plat->msi_wol_vec = STMMAC_MSI_VEC_MAX;
+	plat->msi_lpi_vec = STMMAC_MSI_VEC_MAX;
+	plat->msi_sfty_ce_vec = STMMAC_MSI_VEC_MAX;
+	plat->msi_sfty_ue_vec = STMMAC_MSI_VEC_MAX;
+	plat->msi_rx_base_vec = STMMAC_MSI_VEC_MAX;
+	plat->msi_tx_base_vec = STMMAC_MSI_VEC_MAX;
+
+	ret = info->setup(pdev, plat);
+	if (ret)
+		goto err_disable_device;
+
+	pci_write_config_dword(pdev, XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LOW,
+			       XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LO_VALUE);
+	pci_write_config_dword(pdev, XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HIGH,
+			       XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HI_VALUE);
+
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO,
+		     XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_VALUE);
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI,
+		     XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_VALUE);
+
+	/* SBD Interrupt */
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_SBD_ALL,
+		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_SBD_ALL_VALUE);
+	/* EP_DOORBELL Interrupt */
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST_DBELL,
+		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST_DBELL_VALUE);
+	/* EP_H0 Interrupt */
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST0,
+		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST0_VALUE);
+	/* EP_H1 Interrupt */
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST1,
+		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST1_VALUE);
+
+	rx_offset = XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_RX0_PF0;
+	tx_offset = XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_TX0_PF0;
+	vector = BRCM_XGMAC_MSI_RX_VECTOR_START;
+	for (int i = 0; i < BRCM_MAX_DMA_CHANNEL_PAIRS; i++) {
+		/* RX Interrupt */
+		misc_iowrite(brcm_priv, rx_offset, vector++);
+		/* TX Interrupt */
+		misc_iowrite(brcm_priv, tx_offset, vector++);
+		rx_offset += 4;
+		tx_offset += 4;
+	}
+
+	/* Enable Switch Link */
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MII_CTRL,
+		     XGMAC_PCIE_MISC_MII_CTRL_VALUE);
+	/* Enable MSI-X */
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_PCIESS_CTRL,
+		     XGMAC_PCIE_MISC_PCIESS_CTRL_VALUE);
+
+	ret = brcm_config_multi_msi(pdev, plat, &res);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"%s: ERROR: failed to enable IRQ\n", __func__);
+		goto err_disable_msi;
+	}
+
+	ret = stmmac_dvr_probe(&pdev->dev, plat, &res);
+	if (ret)
+		goto err_disable_msi;
+
+	return ret;
+
+err_disable_msi:
+	pci_free_irq_vectors(pdev);
+err_disable_device:
+	pci_disable_device(pdev);
+
+	return ret;
+}
+
+static void dwxgmac_brcm_pci_remove(struct pci_dev *pdev)
+{
+	stmmac_dvr_remove(&pdev->dev);
+	pci_free_irq_vectors(pdev);
+	pcim_iounmap_regions(pdev, BRCM_XGMAC_BAR0_MASK);
+	pci_clear_master(pdev);
+
+	if (num_instances == 1)
+		software_node_unregister_node_group(fixed_link_node_group);
+	num_instances--;
+}
+
+static int __maybe_unused dwxgmac_brcm_pci_suspend(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	int ret;
+
+	ret = stmmac_suspend(dev);
+	if (ret)
+		return ret;
+
+	ret = pci_save_state(pdev);
+	if (ret)
+		return ret;
+
+	pci_disable_device(pdev);
+	pci_wake_from_d3(pdev, true);
+
+	return 0;
+}
+
+static int __maybe_unused dwxgmac_brcm_pci_resume(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	int ret;
+
+	pci_restore_state(pdev);
+	pci_set_power_state(pdev, PCI_D0);
+
+	ret = pci_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	pci_set_master(pdev);
+
+	return stmmac_resume(dev);
+}
+
+static SIMPLE_DEV_PM_OPS(dwxgmac_brcm_pm_ops,
+			 dwxgmac_brcm_pci_suspend,
+			 dwxgmac_brcm_pci_resume);
+
+static const struct pci_device_id dwxgmac_brcm_id_table[] = {
+	{ PCI_DEVICE_DATA(BROADCOM, BCM8958X, &dwxgmac_brcm_pci_info) },
+	{}
+};
+
+MODULE_DEVICE_TABLE(pci, dwxgmac_brcm_id_table);
+
+static struct pci_driver dwxgmac_brcm_pci_driver = {
+	.name = "brcm-bcm8958x",
+	.id_table = dwxgmac_brcm_id_table,
+	.probe	= dwxgmac_brcm_pci_probe,
+	.remove = dwxgmac_brcm_pci_remove,
+	.driver = {
+		.pm = &dwxgmac_brcm_pm_ops,
+	},
+};
+
+module_pci_driver(dwxgmac_brcm_pci_driver);
+
+MODULE_DESCRIPTION("Broadcom 10G Automotive Ethernet PCIe driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
