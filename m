Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLFlBHThzmnfrAYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Apr 2026 23:36:52 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A201E38E637
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Apr 2026 23:36:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64F8DC8F271;
	Thu,  2 Apr 2026 21:36:51 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (lpdvsmtp09.broadcom.com
 [192.19.166.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9A06C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Apr 2026 21:36:49 +0000 (UTC)
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net
 [10.35.36.83])
 by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 330DDC00033C;
 Thu,  2 Apr 2026 14:36:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 330DDC00033C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1775165808;
 bh=/JcEL2aEGcxeVMe/m0fHS2YNiAO0KRQJPQdKHaWHBgw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=chNxxj3K3s2HYLJSjlRFZi562FxwTaEB6sD7xUdQwLmrW42QNFUR+yr9/O7VhuiQL
 fnBEqv9zvGZLEYm1wvdULR+0nhDDZ5JnFcbpEediJp9EWt6KRCy4JFMuCUS1QyBSl+
 ACTA+QB6xj70L0jvTsGcAprmQEET/tfYNPrWPV+Q=
Received: from lvnvdb8054.lvn.broadcom.net (lvnvdb8054.lvn.broadcom.net
 [10.17.214.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id A6A6BAE81;
 Thu,  2 Apr 2026 17:36:45 -0400 (EDT)
From: "Jitendra Vegiraju" <jitendra.vegiraju@broadcom.com>
To: netdev@vger.kernel.org
Date: Thu,  2 Apr 2026 14:36:28 -0700
Message-ID: <20260402213629.1996133-4-jitendra.vegiraju@broadcom.com>
X-Mailer: git-send-email 2.45.4
In-Reply-To: <20260402213629.1996133-1-jitendra.vegiraju@broadcom.com>
References: <20260402213629.1996133-1-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Cc: quic_abchauha@quicinc.com, me@ziyao.cc, chenchuangyu@xiaomi.com,
 edumazet@google.com, lizhi2@eswincomputing.com, yangtiezhu@loongson.cn,
 linux-stm32@st-md-mailman.stormreply.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 Russell King <linux@armlinux.org.uk>, siyanteng@cqsoftware.com.cn,
 sdf@fomichev.me, bcm-kernel-feedback-list@broadcom.com,
 vladimir.oltean@nxp.com, jitendra.vegiraju@broadcom.com, kuba@kernel.org,
 pabeni@redhat.com, hawk@kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 ast@kernel.org, rmk+kernel@armlinux.org.uk, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 florian.fainelli@broadcom.com, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, horms@kernel.org,
 bpf@vger.kernel.org, davem@davemloft.net, ovidiu.panait.rb@renesas.com
Subject: [Linux-stm32] [PATCH net-next v9 3/4] net: stmmac: Add PCI glue
	driver for BCM8958x
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
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[broadcom.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[broadcom.com:s=dkimrelay];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[quicinc.com,ziyao.cc,xiaomi.com,google.com,eswincomputing.com,loongson.cn,st-md-mailman.stormreply.com,iogearbox.net,kernel.org,gmail.com,armlinux.org.uk,cqsoftware.com.cn,fomichev.me,broadcom.com,nxp.com,redhat.com,altera.com,bp.renesas.com,lists.infradead.org,vger.kernel.org,lunn.ch,davemloft.net,renesas.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[37];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jitendra.vegiraju@broadcom.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:netdev@vger.kernel.org,m:quic_abchauha@quicinc.com,m:me@ziyao.cc,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:lizhi2@eswincomputing.com,m:yangtiezhu@loongson.cn,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:linux@armlinux.org.uk,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:bcm-kernel-feedback-list@broadcom.com,m:vladimir.oltean@nxp.com,m:jitendra.vegiraju@broadcom.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:hawk@kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:ast@kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:mcoquelin.stm32@gmail.com,m:florian.fainelli@broadcom.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:horms@kernel.org,m:bpf@vger.kernel.org,m:davem@davemloft.net,m:ovidiu.panait.rb@rene
 sas.com,m:johnfastabend@gmail.com,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jitendra.vegiraju@broadcom.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[broadcom.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.456];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:email,broadcom.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,armlinux.org.uk:email]
X-Rspamd-Queue-Id: A201E38E637
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

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

The MAC IP block on BCM8958x is based on Synopsis XGMAC 4.00a core. This
driver uses common dwxgmac2 code where applicable.
Driver functionality specific to this MAC is implemented in dw25gmac.c.

Management of integrated ethernet switch on this SoC is not handled via
the PCIe interface.

This SoC device has PCIe ethernet MAC directly attached to an integrated
ethernet switch using XGMII interface. Since device tree support is not
available on this platform, a software node is created to enable
fixed-link support using phylink driver.

Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-brcm.c  | 360 ++++++++++++++++++
 1 file changed, 360 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
new file mode 100644
index 000000000000..e8c6b4b618ac
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
@@ -0,0 +1,360 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2024-2026 Broadcom Corporation
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
+#include <linux/of_mdio.h>
+#include "stmmac.h"
+#include "stmmac_libpci.h"
+#include "dwxgmac2.h"
+#include "dw25gmac.h"
+
+#define PCI_DEVICE_ID_BCM8958X			0xa00d
+#define BRCM_MAX_MTU				1500
+
+/* TX and RX Queue counts */
+#define BRCM_TX_Q_COUNT				4
+#define BRCM_RX_Q_COUNT				4
+
+#define BRCM_XGMAC_BAR0_MASK			BIT(0)
+
+#define BRCM_XGMAC_IOMEM_MISC_REG_OFFSET	0x0
+#define BRCM_XGMAC_IOMEM_MBOX_REG_OFFSET	0x1000
+#define BRCM_XGMAC_IOMEM_CFG_REG_OFFSET		0x3000
+
+#define XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LOW	0x940
+#define XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LO_VALUE	0x00000001
+#define XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HIGH	0x944
+#define XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HI_VALUE	0x88000000
+
+#define XGMAC_PCIE_MISC_MII_CTRL_OFFSET			0x4
+#define XGMAC_PCIE_MISC_MII_CTRL_PAUSE_RX		BIT(0)
+#define XGMAC_PCIE_MISC_MII_CTRL_PAUSE_TX		BIT(1)
+#define XGMAC_PCIE_MISC_MII_CTRL_LINK_UP		BIT(2)
+#define XGMAC_PCIE_MISC_PCIESS_CTRL_OFFSET		0x8
+#define XGMAC_PCIE_MISC_PCIESS_CTRL_EN_MSI_MSIX		BIT(9)
+#define XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_OFFSET	0x90
+#define XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_VALUE	0x00000001
+#define XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_OFFSET	0x94
+#define XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_VALUE	0x88000000
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST0_OFFSET	0x700
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST0_VALUE	1
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST1_OFFSET	0x704
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST1_VALUE	1
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST_DBELL_OFFSET	0x728
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST_DBELL_VALUE	1
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_SBD_ALL_OFFSET	0x740
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_SBD_ALL_VALUE	0
+
+/* MSIX Vector map register starting offsets */
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_RX0_PF0_OFFSET	0x840
+#define XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_TX0_PF0_OFFSET	0x890
+#define BRCM_XGMAC_MSI_MAC_VECTOR		0
+#define BRCM_PER_CH_INT_VECTOR_START		1
+#define BRCM_VECTOR_MAX		(BRCM_RX_Q_COUNT + BRCM_TX_Q_COUNT + 1)
+
+static const struct property_entry fixed_link_properties[] = {
+	PROPERTY_ENTRY_U32("speed", 10000),
+	PROPERTY_ENTRY_BOOL("full-duplex"),
+	PROPERTY_ENTRY_BOOL("pause"),
+	{ }
+};
+
+static const struct software_node parent_swnode = {
+	.name = "ethernet",
+};
+
+static const struct software_node fixed_link_swnode = {
+	.name = "fixed-link",           /* MUST be named "fixed-link" */
+	.parent = &parent_swnode,
+	.properties = fixed_link_properties,
+};
+
+static const struct software_node *brcm_swnodes[] = {
+	&parent_swnode,
+	&fixed_link_swnode,
+	NULL
+};
+
+struct brcm_priv_data {
+	void __iomem *misc_regs;    /* MISC  Registers*/
+};
+
+static void misc_iowrite(struct brcm_priv_data *brcm_priv,
+			 u32 reg, u32 val)
+{
+	iowrite32(val, brcm_priv->misc_regs + reg);
+}
+
+static void brcm_free_irq_vectors(void *data)
+{
+	struct pci_dev *pdev = data;
+
+	pci_free_irq_vectors(pdev);
+}
+
+static int brcm_config_multi_msi(struct pci_dev *pdev,
+				 struct plat_stmmacenet_data *plat,
+				 struct stmmac_resources *res)
+{
+	int vector;
+	int ret;
+	int i;
+
+	ret = pci_alloc_irq_vectors(pdev, BRCM_VECTOR_MAX, BRCM_VECTOR_MAX,
+				    PCI_IRQ_MSI | PCI_IRQ_MSIX);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "%s: multi MSI enablement failed\n",
+			__func__);
+		return ret;
+	}
+
+	vector = BRCM_XGMAC_MSI_MAC_VECTOR;
+	res->irq = pci_irq_vector(pdev, vector++);
+	for (i = 0; i < BRCM_RX_Q_COUNT; i++, vector++)
+		res->rx_irq[i] = pci_irq_vector(pdev, vector);
+	for (i = 0; i < BRCM_TX_Q_COUNT; i++, vector++)
+		res->tx_irq[i] = pci_irq_vector(pdev, vector);
+
+	plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
+	plat->flags |= STMMAC_FLAG_TSO_EN;
+	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
+
+	return devm_add_action_or_reset(&pdev->dev,
+					brcm_free_irq_vectors, pdev);
+}
+
+static int brcm_drv_init(struct device *dev, void *bsp_priv)
+{
+	struct brcm_priv_data *brcm_priv = (struct brcm_priv_data *)bsp_priv;
+	struct pci_dev *pdev = to_pci_dev(dev);
+	int vector;
+	int ret;
+
+	/* This device is directly attached to the switch chip internal to the
+	 * SoC using XGMII interface. Since no MDIO is present, register
+	 * fixed-link software_node to create phylink.
+	 */
+	ret = software_node_register_node_group(brcm_swnodes);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register software_node\n");
+	device_set_node(dev, software_node_fwnode(&parent_swnode));
+
+	pci_write_config_dword(pdev, XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LOW,
+			       XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LO_VALUE);
+	pci_write_config_dword(pdev, XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HIGH,
+			       XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HI_VALUE);
+
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_OFFSET,
+		     XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_VALUE);
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_OFFSET,
+		     XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_VALUE);
+
+	/* SBD Interrupt */
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_SBD_ALL_OFFSET,
+		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_SBD_ALL_VALUE);
+	/* EP_DOORBELL Interrupt */
+	misc_iowrite(brcm_priv,
+		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST_DBELL_OFFSET,
+		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST_DBELL_VALUE);
+	/* EP_H0 Interrupt */
+	misc_iowrite(brcm_priv,
+		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST0_OFFSET,
+		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST0_VALUE);
+	/* EP_H1 Interrupt */
+	misc_iowrite(brcm_priv,
+		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST1_OFFSET,
+		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST1_VALUE);
+
+	vector = BRCM_PER_CH_INT_VECTOR_START;
+	for (int i = 0, offset = XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_RX0_PF0_OFFSET;
+	     i < BRCM_RX_Q_COUNT; i++, vector++, offset += 4)
+		misc_iowrite(brcm_priv, offset, vector);
+	for (int i = 0, offset = XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_TX0_PF0_OFFSET;
+	     i < BRCM_TX_Q_COUNT; i++, vector++, offset += 4)
+		misc_iowrite(brcm_priv, offset, vector);
+
+	/* Enable Switch Link */
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MII_CTRL_OFFSET,
+		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_RX |
+		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_TX |
+		     XGMAC_PCIE_MISC_MII_CTRL_LINK_UP);
+	/* Enable MSI-X */
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_PCIESS_CTRL_OFFSET,
+		     XGMAC_PCIE_MISC_PCIESS_CTRL_EN_MSI_MSIX);
+	return 0;
+}
+
+static void brcm_drv_exit_cleanup(struct device *dev, void *bsp_priv)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	device_set_node(&pdev->dev, NULL);
+	software_node_unregister_node_group(brcm_swnodes);
+}
+
+static int brcm_pci_resume(struct device *dev, void *bsp_priv)
+{
+	/* Enable Switch Link */
+	misc_iowrite(bsp_priv, XGMAC_PCIE_MISC_MII_CTRL_OFFSET,
+		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_RX |
+		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_TX |
+		     XGMAC_PCIE_MISC_MII_CTRL_LINK_UP);
+
+	return stmmac_pci_plat_resume(dev, bsp_priv);
+}
+
+static struct plat_stmmacenet_data *
+brcm_plat_data_setup(struct pci_dev *pdev)
+{
+	struct plat_stmmacenet_data *plat;
+
+	plat = stmmac_plat_dat_alloc(&pdev->dev);
+	if (!plat)
+		return NULL;
+
+	plat->axi = devm_kzalloc(&pdev->dev, sizeof(*plat->axi), GFP_KERNEL);
+	if (!plat->axi)
+		return NULL;
+
+	plat->core_type = DWMAC_CORE_25GMAC;
+	plat->phy_interface = PHY_INTERFACE_MODE_XGMII;
+
+	plat->dma_cfg->pbl = DEFAULT_DMA_PBL;
+	plat->dma_cfg->pblx8 = true;
+	plat->dma_cfg->eame = true;
+
+	plat->axi->axi_wr_osr_lmt = 31;
+	plat->axi->axi_rd_osr_lmt = 31;
+	plat->axi->axi_blen_regval = DMA_AXI_BLEN64;
+	plat->force_sf_dma_mode = true;
+	plat->mac_port_sel_speed = SPEED_10000;
+	plat->clk_ptp_rate = 125000000;
+	plat->clk_ref_rate = 250000000;
+	plat->tx_coe = true;
+	plat->rx_coe = STMMAC_RX_COE_TYPE1;
+	plat->rss_en = 1;
+	plat->max_speed = SPEED_10000;
+	plat->maxmtu = BRCM_MAX_MTU;
+
+	plat->tx_queues_to_use = BRCM_TX_Q_COUNT;
+	plat->rx_queues_to_use = BRCM_RX_Q_COUNT;
+	plat->tx_sched_algorithm = MTL_TX_ALGORITHM_SP;
+	plat->rx_sched_algorithm = MTL_RX_ALGORITHM_SP;
+
+	plat->init		= brcm_drv_init;
+	plat->exit		= brcm_drv_exit_cleanup;
+	plat->suspend		= stmmac_pci_plat_suspend;
+	plat->resume		= brcm_pci_resume;
+
+	return plat;
+}
+
+static int dwxgmac_brcm_pci_probe(struct pci_dev *pdev,
+				  const struct pci_device_id *id)
+{
+	struct plat_stmmacenet_data *plat;
+	struct brcm_priv_data *brcm_priv;
+	struct stmmac_resources res;
+	int ret;
+
+	brcm_priv = devm_kzalloc(&pdev->dev, sizeof(*brcm_priv), GFP_KERNEL);
+	if (!brcm_priv)
+		return -ENOMEM;
+
+	plat = brcm_plat_data_setup(pdev);
+	if (!plat)
+		return -ENOMEM;
+	plat->bsp_priv = brcm_priv;
+
+	/* Disable D3COLD as our device does not support it */
+	pci_d3cold_disable(pdev);
+
+	/* Enable PCI device */
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to enable device\n");
+
+	pci_set_master(pdev);
+
+	memset(&res, 0, sizeof(res));
+	res.addr = pcim_iomap_region(pdev, 0, pci_name(pdev));
+	if (IS_ERR(res.addr))
+		return dev_err_probe(&pdev->dev, PTR_ERR(res.addr),
+				     "failed to map IO region\n");
+
+	/* MISC Regs */
+	brcm_priv->misc_regs = res.addr + BRCM_XGMAC_IOMEM_MISC_REG_OFFSET;
+	res.addr += BRCM_XGMAC_IOMEM_CFG_REG_OFFSET;
+
+	ret = brcm_config_multi_msi(pdev, plat, &res);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to configure IRQ\n");
+
+	return stmmac_dvr_probe(&pdev->dev, plat, &res);
+}
+
+static void dwxgmac_brcm_pci_remove(struct pci_dev *pdev)
+{
+	stmmac_dvr_remove(&pdev->dev);
+}
+
+static const struct pci_device_id dwxgmac_brcm_id_table[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_BROADCOM, PCI_DEVICE_ID_BCM8958X) },
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
+		.pm = &stmmac_simple_pm_ops,
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
