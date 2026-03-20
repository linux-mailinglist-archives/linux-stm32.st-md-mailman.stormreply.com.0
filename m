Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGLwBQe6vWnyAwMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 22:20:07 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B663A2E1454
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 22:20:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6012DC36B3E;
	Fri, 20 Mar 2026 21:20:06 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (lpdvsmtp09.broadcom.com
 [192.19.166.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31C13C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 21:20:04 +0000 (UTC)
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net
 [10.35.36.83])
 by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 922ABC05AE44;
 Fri, 20 Mar 2026 14:20:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 922ABC05AE44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
 s=dkimrelay; t=1774041602;
 bh=aZJWZChcHQriYj94KKlegTaH8Blqvbr+O8JNgv3EGt4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CgctF/jZkVlUSumC82D5Onn44q+x64d8oSUKFsALOlQsXr74TWf7+tcls0fXZPS/5
 mnGT3IP9a4H/+9wZUaLwBis5XHF51ZwLInidkUsAeIjmy0n6sS9PML3oX1RWypGvx6
 30wIxu4JzTYNFT7354Zj1Atq1p2ieBsKKoOSPXso=
Received: from lvnvdb8054.lvn.broadcom.net (lvnvdb8054.lvn.broadcom.net
 [10.17.214.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id 5585FAE81;
 Fri, 20 Mar 2026 17:19:59 -0400 (EDT)
From: "Jitendra Vegiraju" <jitendra.vegiraju@broadcom.com>
To: netdev@vger.kernel.org
Date: Fri, 20 Mar 2026 14:19:20 -0700
Message-ID: <20260320211921.1202058-6-jitendra.vegiraju@broadcom.com>
X-Mailer: git-send-email 2.45.4
In-Reply-To: <20260320211921.1202058-1-jitendra.vegiraju@broadcom.com>
References: <20260320211921.1202058-1-jitendra.vegiraju@broadcom.com>
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
Subject: [Linux-stm32] [PATCH net-next v8 5/6] Fix error handling in probe
	function.
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
	FORGED_SENDER(0.00)[jitendra.vegiraju@broadcom.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,broadcom.com:email,broadcom.com:mid,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: B663A2E1454
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>

Software node created in probe function is not being cleaned up if
the probe function returns an error.
The stmmac core provides mechanism to handle this error condition
with plat->init, plat->exit helper functions.
Move glue driver's initialization code to plat->init function.
If the probe function returns an error, plat->exit function is
called. Handle any glue driver level cleanup in the plat->exit
handler.
Use devm_add_action_or_reset() to register a callback to free
irq vectors automatically, simplifying error handling in probe().

Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-brcm.c  | 164 ++++++++++--------
 1 file changed, 90 insertions(+), 74 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
index 3a00452c0aa6..9103e9cf38f1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-brcm.c
@@ -218,6 +218,13 @@ static void brcm_config_misc_regs(struct pci_dev *pdev,
 		     XGMAC_PCIE_MISC_MII_CTRL_LINK_UP);
 }
 
+static void brcm_free_irq_vectors(void *data)
+{
+	struct pci_dev *pdev = data;
+
+	pci_free_irq_vectors(pdev);
+}
+
 static int brcm_config_multi_msi(struct pci_dev *pdev,
 				 struct plat_stmmacenet_data *plat,
 				 struct stmmac_resources *res)
@@ -251,9 +258,87 @@ static int brcm_config_multi_msi(struct pci_dev *pdev,
 	plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
 	plat->flags |= STMMAC_FLAG_TSO_EN;
 	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
+
+	return devm_add_action_or_reset(&pdev->dev,
+					brcm_free_irq_vectors, pdev);
+}
+
+static int brcm_drv_init(struct device *dev, void *bsp_priv)
+{
+	struct brcm_priv_data *brcm_priv = (struct brcm_priv_data *)bsp_priv;
+	struct pci_dev *pdev = to_pci_dev(dev);
+	int rx_offset;
+	int tx_offset;
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
+	rx_offset = XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_RX0_PF0_OFFSET;
+	tx_offset = XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_TX0_PF0_OFFSET;
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
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MII_CTRL_OFFSET,
+		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_RX |
+		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_TX |
+		     XGMAC_PCIE_MISC_MII_CTRL_LINK_UP);
+	/* Enable MSI-X */
+	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_PCIESS_CTRL_OFFSET,
+		     XGMAC_PCIE_MISC_PCIESS_CTRL_EN_MSI_MSIX);
 	return 0;
 }
 
+static void brcm_drv_exit_cleanup(struct device *dev, void *bsp_priv)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+
+	device_set_node(&pdev->dev, NULL);
+	software_node_unregister_node_group(brcm_swnodes);
+}
+
 static int brcm_pci_resume(struct device *dev, void *bsp_priv)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
@@ -272,9 +357,6 @@ static int dwxgmac_brcm_pci_probe(struct pci_dev *pdev,
 	struct brcm_priv_data *brcm_priv;
 	struct stmmac_resources res;
 	struct device *dev;
-	int rx_offset;
-	int tx_offset;
-	int vector;
 	int ret;
 
 	dev = &pdev->dev;
@@ -291,13 +373,6 @@ static int dwxgmac_brcm_pci_probe(struct pci_dev *pdev,
 	if (!plat->axi)
 		return -ENOMEM;
 
-	/* This device is directly attached to the switch chip internal to the
-	 * SoC using XGMII interface. Since no MDIO is present, register
-	 * fixed-link software_node to create phylink.
-	 */
-	software_node_register_node_group(brcm_swnodes);
-	device_set_node(dev, software_node_fwnode(&parent_swnode));
-
 	/* Disable D3COLD as our device does not support it */
 	pci_d3cold_disable(pdev);
 
@@ -324,6 +399,8 @@ static int dwxgmac_brcm_pci_probe(struct pci_dev *pdev,
 	res.addr += BRCM_XGMAC_IOMEM_CFG_REG_OFFSET;
 	brcm_priv->xgmac_regs = res.addr;
 
+	plat->init		= brcm_drv_init;
+	plat->exit		= brcm_drv_exit_cleanup;
 	plat->suspend		= stmmac_pci_plat_suspend;
 	plat->resume		= brcm_pci_resume;
 	plat->bsp_priv = brcm_priv;
@@ -332,78 +409,17 @@ static int dwxgmac_brcm_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	pci_write_config_dword(pdev, XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LOW,
-			       XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_LO_VALUE);
-	pci_write_config_dword(pdev, XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HIGH,
-			       XGMAC_PCIE_CFG_MSIX_ADDR_MATCH_HI_VALUE);
-
-	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_OFFSET,
-		     XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_LO_VALUE);
-	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_OFFSET,
-		     XGMAC_PCIE_MISC_MSIX_ADDR_MATCH_HI_VALUE);
-
-	/* SBD Interrupt */
-	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_SBD_ALL_OFFSET,
-		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_SBD_ALL_VALUE);
-	/* EP_DOORBELL Interrupt */
-	misc_iowrite(brcm_priv,
-		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST_DBELL_OFFSET,
-		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST_DBELL_VALUE);
-	/* EP_H0 Interrupt */
-	misc_iowrite(brcm_priv,
-		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST0_OFFSET,
-		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST0_VALUE);
-	/* EP_H1 Interrupt */
-	misc_iowrite(brcm_priv,
-		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST1_OFFSET,
-		     XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_EP2HOST1_VALUE);
-
-	rx_offset = XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_RX0_PF0_OFFSET;
-	tx_offset = XGMAC_PCIE_MISC_MSIX_VECTOR_MAP_TX0_PF0_OFFSET;
-	vector = BRCM_XGMAC_MSI_RX_VECTOR_START;
-	for (int i = 0; i < BRCM_MAX_DMA_CHANNEL_PAIRS; i++) {
-		/* RX Interrupt */
-		misc_iowrite(brcm_priv, rx_offset, vector++);
-		/* TX Interrupt */
-		misc_iowrite(brcm_priv, tx_offset, vector++);
-		rx_offset += 4;
-		tx_offset += 4;
-	}
-
-	/* Enable Switch Link */
-	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_MII_CTRL_OFFSET,
-		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_RX |
-		     XGMAC_PCIE_MISC_MII_CTRL_PAUSE_TX |
-		     XGMAC_PCIE_MISC_MII_CTRL_LINK_UP);
-	/* Enable MSI-X */
-	misc_iowrite(brcm_priv, XGMAC_PCIE_MISC_PCIESS_CTRL_OFFSET,
-		     XGMAC_PCIE_MISC_PCIESS_CTRL_EN_MSI_MSIX);
-
 	ret = brcm_config_multi_msi(pdev, plat, &res);
-	if (ret) {
-		dev_err(&pdev->dev,
-			"%s: ERROR: failed to enable IRQ\n", __func__);
-		goto err_disable_msi;
-	}
-
-	ret = stmmac_dvr_probe(&pdev->dev, plat, &res);
 	if (ret)
-		goto err_disable_msi;
-
-	return ret;
-
-err_disable_msi:
-	pci_free_irq_vectors(pdev);
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to configure IRQ\n");
 
-	return ret;
+	return stmmac_dvr_probe(&pdev->dev, plat, &res);
 }
 
 static void dwxgmac_brcm_pci_remove(struct pci_dev *pdev)
 {
 	stmmac_dvr_remove(&pdev->dev);
-	pci_free_irq_vectors(pdev);
-	device_set_node(&pdev->dev, NULL);
-	software_node_unregister_node_group(brcm_swnodes);
 }
 
 static const struct pci_device_id dwxgmac_brcm_id_table[] = {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
