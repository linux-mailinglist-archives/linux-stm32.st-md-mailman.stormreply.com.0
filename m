Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1E1809329
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Dec 2023 22:12:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C0E7C65E42;
	Thu,  7 Dec 2023 21:12:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2879C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Dec 2023 21:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701983569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m0tm0lsXPlnCiFdUXwz3yeCYNRe8/nR8iqlVxg/Ese8=;
 b=Qn2NIJp27vDfEPZ9jPXoaU+8GMHtp5ke+sU/M0M7XiwB+x+Rh73y6RtqejnR/qtDJOlzgJ
 DU926hlL4Xvl9qhSJkW6u+qL14TEbwAlxCjH7UmHoEQxH85QfTcGbO1eoxycXoKiCvjrsH
 c76lswIQoNZMn8ncQgInw4Dlh6PcxAU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-svd6vXeAPyCIZrEC9HuokA-1; Thu, 07 Dec 2023 16:12:48 -0500
X-MC-Unique: svd6vXeAPyCIZrEC9HuokA-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-77f10001de7so130703185a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Dec 2023 13:12:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701983568; x=1702588368;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m0tm0lsXPlnCiFdUXwz3yeCYNRe8/nR8iqlVxg/Ese8=;
 b=YdltTazJz+4FvV/W3KGhYJcNK6ksxm9/o3SuWrkVRJEAWADCJgmSMFlbYAnSOuD6c0
 5CpUn2uXcLktiOUFy/9aSsn9s1TlZYRXvqPHDiccLy4wAWYCCKQtQIErHh5dHyPgIOwP
 DTkPyhiVF7doL1ee6MydraFUSd+u2h4lM8Rvqinm/2c+QsIzZqAJnlNFeXUrhfdjVfZt
 Yd/cM+AG7X8Eeg4alcrsUG3JCxZqlASBu0CkNsGoCVxiMYpvGkk89CgaFHK/KRtt1IOj
 sjm6Ry15aZPU5Z5un4/2Yq29QK12fDa8OMcOLQjAd9B00v8c+68F7YQroberWPIuoEof
 6vXA==
X-Gm-Message-State: AOJu0Yw1aDxgko6Y25s3kdAga7Gtv3IOSXK8gmt7VnWENwdxYFxqseqR
 Ao6tPJ9gdbxeLfTpOz9GwxqLyw534kX15LnByIYT2stYT9Ae+LH5Z/ck4P1ifxjjbnA1yHEUM0A
 RKl8Q0drLCvNzPkW8VYr/sbEMoAKS7OcNBCSD9IFf
X-Received: by 2002:a05:620a:12d9:b0:77e:fba3:8206 with SMTP id
 e25-20020a05620a12d900b0077efba38206mr1847338qkl.156.1701983567822; 
 Thu, 07 Dec 2023 13:12:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7z86zXmymay8jxRxW4MSE3B+0PAsE8XNJYAsWbEq3pdPF6yTm8ycxXKBFDbgo28pcWyd13w==
X-Received: by 2002:a05:620a:12d9:b0:77e:fba3:8206 with SMTP id
 e25-20020a05620a12d900b0077efba38206mr1847324qkl.156.1701983567552; 
 Thu, 07 Dec 2023 13:12:47 -0800 (PST)
Received: from [192.168.1.164] ([2600:1700:1ff0:d0e0::47])
 by smtp.gmail.com with ESMTPSA id
 rb3-20020a05620a8d0300b00774350813ccsm180707qkn.118.2023.12.07.13.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 13:12:47 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Thu, 07 Dec 2023 15:12:40 -0600
MIME-Version: 1.0
Message-Id: <20231207-stmmac-no-mdio-node-v3-1-34b870f2bafb@redhat.com>
X-B4-Tracking: v=1; b=H4sIAEc1cmUC/22OQQ6DIBBFr2Jm3TEC1WpXvUfjAmGqJAUMENLGe
 PdSF1119f/PZF7eBpGCoQjXaoNA2UTjXRniVIFapJsJjS4beMMFY/yCMVkrFTqPVhtfUhMyPQ1
 a9pK3eoDyuQZ6mNdBvYOjhI5eCcZyeQRvMS2B5I/a9E3PSmnPNWNdK5DhFObnbZo15Xp9foGLi
 cmH92GZ+YE9hHjT/RXKvFCEEErSeZiYkrdAepGpVt7CuO/7BxyLB074AAAA
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
X-Mailer: b4 0.12.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v3] net: stmmac: don't create a MDIO
 bus if unnecessary
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

The stmmac_dt_phy() function, which parses the devicetree node of the
MAC and ultimately causes MDIO bus allocation, misinterprets what
fixed-link means in relation to the MAC's MDIO bus. This results in
a MDIO bus being created in situations it need not be.

Currently a MDIO bus is created if the description is either:

    1. Not fixed-link
    2. fixed-link but contains a MDIO bus as well

The "1" case above isn't always accurate. If there's a phy-handle,
it could be referencing a phy on another MDIO controller's bus[1]. In
this case currently the MAC will make a MDIO bus and scan it all
anyways unnecessarily.

There's also a lot of upstream devicetrees[2] that expect a MDIO bus to
be created and scanned for a phy. This case can also be inferred from
the platform description by not having a phy-handle && not being
fixed-link. This hits case "1" in the current driver's logic.

Let's improve the logic to create a MDIO bus if either:

    - Devicetree contains a MDIO bus
    - !fixed-link && !phy-handle (legacy handling)

Below upstream devicetree snippets can be found that explain some of
the cases above more concretely.

Here's[0] a devicetree example where the MAC is both fixed-link and
driving a switch on MDIO (case "2" above). This needs a MDIO bus to
be created:

    &fec1 {
            phy-mode = "rmii";

            fixed-link {
                    speed = <100>;
                    full-duplex;
            };

            mdio1: mdio {
                    switch0: switch0@0 {
                            compatible = "marvell,mv88e6190";
                            pinctrl-0 = <&pinctrl_gpio_switch0>;
                    };
            };
    };

Here's[1] an example where there is no MDIO bus or fixed-link for
the ethernet1 MAC, so no MDIO bus should be created since ethernet0
is the MDIO master for ethernet1's phy:

    &ethernet0 {
            phy-mode = "sgmii";
            phy-handle = <&sgmii_phy0>;

            mdio {
                    compatible = "snps,dwmac-mdio";
                    sgmii_phy0: phy@8 {
                            compatible = "ethernet-phy-id0141.0dd4";
                            reg = <0x8>;
                            device_type = "ethernet-phy";
                    };

                    sgmii_phy1: phy@a {
                            compatible = "ethernet-phy-id0141.0dd4";
                            reg = <0xa>;
                            device_type = "ethernet-phy";
                    };
            };
    };

    &ethernet1 {
            phy-mode = "sgmii";
            phy-handle = <&sgmii_phy1>;
    };

Finally there's descriptions like this[2] which don't describe the
MDIO bus but expect it to be created and the whole address space
scanned for a phy since there's no phy-handle or fixed-link described:

    &gmac {
            phy-supply = <&vcc_lan>;
            phy-mode = "rmii";
            snps,reset-gpio = <&gpio3 RK_PB4 GPIO_ACTIVE_HIGH>;
            snps,reset-active-low;
            snps,reset-delays-us = <0 10000 1000000>;
    };

[0] https://elixir.bootlin.com/linux/v6.5-rc5/source/arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dts
[1] https://elixir.bootlin.com/linux/v6.6-rc5/source/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
[2] https://elixir.bootlin.com/linux/v6.6-rc5/source/arch/arm64/boot/dts/rockchip/rk3368-r88.dts#L164

Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
Changes in v3:
    - Keep logic out of stmmac_probe_config_dt() since it's already massive (Serge)

Changes in v2:
    - Handle the fixed-link + mdio case (Andrew Lunn)
    - Reworded commit message
    - Still handle the "legacy" case mentioned in the commit
    - Bit further refactoring of the function for readability

- Link to v2: https://lore.kernel.org/r/20231206-stmmac-no-mdio-node-v2-1-333cae49b1ca@redhat.com
- Link to v1: https://lore.kernel.org/netdev/20230808120254.11653-1-brgl@bgdev.pl/
---
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 91 +++++++++++++---------
 1 file changed, 54 insertions(+), 37 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 1ffde555da47..d6079c1432c7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -296,62 +296,80 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 }
 
 /**
- * stmmac_dt_phy - parse device-tree driver parameters to allocate PHY resources
- * @plat: driver data platform structure
- * @np: device tree node
- * @dev: device pointer
- * Description:
- * The mdio bus will be allocated in case of a phy transceiver is on board;
- * it will be NULL if the fixed-link is configured.
- * If there is the "snps,dwmac-mdio" sub-node the mdio will be allocated
- * in any case (for DSA, mdio must be registered even if fixed-link).
- * The table below sums the supported configurations:
- *	-------------------------------
- *	snps,phy-addr	|     Y
- *	-------------------------------
- *	phy-handle	|     Y
- *	-------------------------------
- *	fixed-link	|     N
- *	-------------------------------
- *	snps,dwmac-mdio	|
- *	  even if	|     Y
- *	fixed-link	|
- *	-------------------------------
+ * stmmac_of_get_mdio() - Gets the MDIO bus from the devicetree.
+ * @np: devicetree node
  *
- * It returns 0 in case of success otherwise -ENODEV.
+ * The MDIO bus will be searched for in the following ways:
+ * 1. The compatible is "snps,dwc-qos-ethernet-4.10" && a "mdio" named
+ *    child node exists
+ * 2. A child node with the "snps,dwmac-mdio" compatible is present
+ *
+ * Return: The MDIO node if present otherwise NULL
  */
-static int stmmac_dt_phy(struct plat_stmmacenet_data *plat,
-			 struct device_node *np, struct device *dev)
+static struct device_node *stmmac_of_get_mdio(struct device_node *np)
 {
-	bool mdio = !of_phy_is_fixed_link(np);
 	static const struct of_device_id need_mdio_ids[] = {
 		{ .compatible = "snps,dwc-qos-ethernet-4.10" },
 		{},
 	};
+	struct device_node *mdio_node = NULL;
 
 	if (of_match_node(need_mdio_ids, np)) {
-		plat->mdio_node = of_get_child_by_name(np, "mdio");
+		mdio_node = of_get_child_by_name(np, "mdio");
 	} else {
 		/**
 		 * If snps,dwmac-mdio is passed from DT, always register
 		 * the MDIO
 		 */
-		for_each_child_of_node(np, plat->mdio_node) {
-			if (of_device_is_compatible(plat->mdio_node,
+		for_each_child_of_node(np, mdio_node) {
+			if (of_device_is_compatible(mdio_node,
 						    "snps,dwmac-mdio"))
 				break;
 		}
 	}
 
-	if (plat->mdio_node) {
+	return mdio_node;
+}
+
+/**
+ * stmmac_mdio_setup() - Populate platform related MDIO structures.
+ * @plat: driver data platform structure
+ * @np: devicetree node
+ * @dev: device pointer
+ *
+ * This searches for MDIO information from the devicetree.
+ * If an MDIO node is found, it's assigned to plat->mdio_node and
+ * plat->mdio_bus_data is allocated.
+ * If no connection can be determined, just plat->mdio_bus_data is allocated
+ * to indicate a bus should be created and scanned for a phy.
+ * If it's determined there's no MDIO bus needed, both are left NULL.
+ *
+ * This expects that plat->phy_node has already been searched for.
+ *
+ * Return: 0 on success, errno otherwise.
+ */
+static int stmmac_mdio_setup(struct plat_stmmacenet_data *plat,
+			     struct device_node *np, struct device *dev)
+{
+	bool legacy_mdio;
+
+	plat->mdio_node = stmmac_of_get_mdio(np);
+	if (plat->mdio_node)
 		dev_dbg(dev, "Found MDIO subnode\n");
-		mdio = true;
-	}
 
-	if (mdio) {
-		plat->mdio_bus_data =
-			devm_kzalloc(dev, sizeof(struct stmmac_mdio_bus_data),
-				     GFP_KERNEL);
+	/* Legacy devicetrees allowed for no MDIO bus description and expect
+	 * the bus to be scanned for devices. If there's no phy or fixed-link
+	 * described assume this is the case since there must be something
+	 * connected to the MAC.
+	 */
+	legacy_mdio = !of_phy_is_fixed_link(np) && !plat->phy_node;
+	if (legacy_mdio)
+		dev_info(dev, "Deprecated MDIO bus assumption used\n");
+
+	if (plat->mdio_node || legacy_mdio) {
+		plat->mdio_bus_data = devm_kzalloc(dev,
+						   sizeof(struct stmmac_mdio_bus_data),
+						   GFP_KERNEL);
 		if (!plat->mdio_bus_data)
 			return -ENOMEM;
 
@@ -471,8 +489,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	if (of_property_read_u32(np, "snps,phy-addr", &plat->phy_addr) == 0)
 		dev_warn(&pdev->dev, "snps,phy-addr property is deprecated\n");
 
-	/* To Configure PHY by using all device-tree supported properties */
-	rc = stmmac_dt_phy(plat, np, &pdev->dev);
+	rc = stmmac_mdio_setup(plat, np, &pdev->dev);
 	if (rc)
 		return ERR_PTR(rc);
 

---
base-commit: fd8a79b63710acb84321be3ce74be23c876873fb
change-id: 20231127-stmmac-no-mdio-node-1db9da8a25d9

Best regards,
-- 
Andrew Halaney <ahalaney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
