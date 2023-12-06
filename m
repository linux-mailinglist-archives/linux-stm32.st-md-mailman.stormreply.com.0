Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E35B807C8B
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Dec 2023 00:46:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C37CC6C85F;
	Wed,  6 Dec 2023 23:46:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5C11C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Dec 2023 23:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701906380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8esKVkgkdO38qfOOlPF2GDuWhXzWAxbw0J892C+UC7Y=;
 b=gTZVBEzA7eNmgI4iUx3i5yXgZYBlR6AQa1CCVSAJX1XXwQMTnhFHngolz8mg7rKv2G28pL
 /hCPLquzeSMY7fCeeTJcjtlGcZSVi0KopQxWyoMaWZEHMC6W/cv1WRwQotvn25Bxk2Fz/Y
 OcBRm9ADIU2MULWQwKQ6BBZ8fsYxG6E=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-UuQpsIFMN42KJ5qZVTHHOQ-1; Wed, 06 Dec 2023 18:46:19 -0500
X-MC-Unique: UuQpsIFMN42KJ5qZVTHHOQ-1
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-58d53348a03so88025eaf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Dec 2023 15:46:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701906378; x=1702511178;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8esKVkgkdO38qfOOlPF2GDuWhXzWAxbw0J892C+UC7Y=;
 b=FXSbcwO4YH7I8GXjZDXAMIcy3DaV+CkjazYT1VXzGF+b7GSCxbKibmj5LbV0y+qW+g
 eknaA8kUSJSsgf2Qo1x8mnczX9WSDN/Gs35xZFoNp1fyayafkdMuxJ19bxngWim6MK7V
 IZ0LLt4RcMDdsqpiJ74glALbWH8DXNxxCjMfI+VM/DGFWsbjheK8FMqp+WWsfyobjLwg
 nm+27GVY2jI0imAw0HgQViQ8rm0YgU4hP8Hi0zvcvGVPynODL167UuohIMuAV2enMne8
 u+HOIwB+EO3ZPLtmlZ70K5sgOEaYuFetnN7qjIzYLORoIFAxTgjnYB9vnlyCQWoDtyHL
 LFdA==
X-Gm-Message-State: AOJu0Ywyg3jD5zOmKid+12IdoA5ZqDpCqax4XiZQR8TJIu8xEizkZpX4
 Kli89DTwv8eVHbj03EF0TVz9GNcUGTcGdCE/dYxOBNm3noQv+YoSPx0/YjZxge2vlTfujSsZ3Kb
 wVKs5IOs/HnxAoqtaBiuJ+fdRSdfHoIVEuBj1gYACtVh4o+6BTOYUTCk+g0KpF+c99uwtScxoKO
 YBjU5Ixe+LM/dlImSh3Mdop+D0
X-Received: by 2002:a05:6358:2910:b0:16d:bbb3:69c6 with SMTP id
 y16-20020a056358291000b0016dbbb369c6mr2398885rwb.13.1701906377986; 
 Wed, 06 Dec 2023 15:46:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAsIygwOoQKZlum7cq8klqlJozHBJy1wvtOxVzB6Tfsb98hdv5DwTkASEhC5ZBOAlTAOdQBA==
X-Received: by 2002:a05:6358:2910:b0:16d:bbb3:69c6 with SMTP id
 y16-20020a056358291000b0016dbbb369c6mr2398863rwb.13.1701906377591; 
 Wed, 06 Dec 2023 15:46:17 -0800 (PST)
Received: from [192.168.1.164] ([2600:1700:1ff0:d0e0::47])
 by smtp.gmail.com with ESMTPSA id
 lg21-20020a056214549500b0067a14238fa9sm11568qvb.94.2023.12.06.15.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 15:46:17 -0800 (PST)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Wed, 06 Dec 2023 17:46:09 -0600
MIME-Version: 1.0
Message-Id: <20231206-stmmac-no-mdio-node-v2-1-333cae49b1ca@redhat.com>
X-B4-Tracking: v=1; b=H4sIAMAHcWUC/z2MwQqDMBBEf0X23BU31lY99T9KD9FdNWASSYII4
 r839NDTzGOYd0KUYCRCX5wQZDfReJdB3QoYF+1mQcOZQVWqJlJPjMlaPaLzaNn4nCxIPHSsW60
 a7iA/tyCTOX7WNzhJ6ORI8MnLFLzFtATRf2vVVi3l0txLokdTI+EQ5vU1zCx7ua1wXV/b0uTPp
 gAAAA==
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
Subject: [Linux-stm32] [PATCH net-next v2] net: stmmac: don't create a MDIO
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
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 85 ++++++++++------------
 1 file changed, 37 insertions(+), 48 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 1ffde555da47..7da461fe93f6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -296,69 +296,39 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
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
+ * stmmac_of_get_mdio() - Gets the MDIO bus from the devicetree
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
-		dev_dbg(dev, "Found MDIO subnode\n");
-		mdio = true;
-	}
-
-	if (mdio) {
-		plat->mdio_bus_data =
-			devm_kzalloc(dev, sizeof(struct stmmac_mdio_bus_data),
-				     GFP_KERNEL);
-		if (!plat->mdio_bus_data)
-			return -ENOMEM;
-
-		plat->mdio_bus_data->needs_reset = true;
-	}
-
-	return 0;
+	return mdio_node;
 }
 
 /**
@@ -417,6 +387,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	struct device_node *np = pdev->dev.of_node;
 	struct plat_stmmacenet_data *plat;
 	struct stmmac_dma_cfg *dma_cfg;
+	bool legacy_mdio;
 	int phy_mode;
 	void *ret;
 	int rc;
@@ -471,10 +442,28 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	if (of_property_read_u32(np, "snps,phy-addr", &plat->phy_addr) == 0)
 		dev_warn(&pdev->dev, "snps,phy-addr property is deprecated\n");
 
-	/* To Configure PHY by using all device-tree supported properties */
-	rc = stmmac_dt_phy(plat, np, &pdev->dev);
-	if (rc)
-		return ERR_PTR(rc);
+	plat->mdio_node = stmmac_of_get_mdio(np);
+	if (plat->mdio_node)
+		dev_dbg(&pdev->dev, "Found MDIO subnode\n");
+
+	/* Legacy devicetrees allowed for no MDIO bus description and expect
+	 * the bus to be scanned for devices. If there's no phy or fixed-link
+	 * described assume this is the case since there must be something
+	 * connected to the MAC.
+	 */
+	legacy_mdio = !of_phy_is_fixed_link(np) && !plat->phy_node;
+	if (legacy_mdio)
+		dev_info(&pdev->dev, "Deprecated MDIO bus assumption used\n");
+
+	if (plat->mdio_node || legacy_mdio) {
+		plat->mdio_bus_data = devm_kzalloc(&pdev->dev,
+						   sizeof(struct stmmac_mdio_bus_data),
+						   GFP_KERNEL);
+		if (!plat->mdio_bus_data)
+			return ERR_PTR(-ENOMEM);
+
+		plat->mdio_bus_data->needs_reset = true;
+	}
 
 	of_property_read_u32(np, "tx-fifo-depth", &plat->tx_fifo_size);
 

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
