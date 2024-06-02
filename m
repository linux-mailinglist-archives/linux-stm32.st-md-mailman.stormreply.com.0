Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B738C8D7643
	for <lists+linux-stm32@lfdr.de>; Sun,  2 Jun 2024 16:37:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5073DC6B47E;
	Sun,  2 Jun 2024 14:37:10 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15A4CC6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  2 Jun 2024 14:37:03 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52b919d1fc0so780274e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Jun 2024 07:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717339023; x=1717943823;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dU7sOuoCnE7DZBaFJYawXWXaLrHsBgPyxKdpukglgGI=;
 b=V9waRNWki6d/HiYizynPxkmPEUTPdytFG0Ym/N7LI/whHLn2wSGCZqurL0ydB43dhX
 CcaCwCFhnbH/5b8y9MMhxlKoIFRBdIuH77L7LaeHezsxUHb6IKWnYeIm3g7rO9yE8NJJ
 +UmrsvMYjdTceSnh9mHRmvkQly/S/QfwaC9ji3ypbpxUGGfqgopHy3H5QGpWTAmwur09
 rw3saD7Woxcv5ry73BVDQ509+7alCoJ4Xx350npIqWkdZDdRoczArNbwyYnSee04qhvT
 cKTgv6SpDgAXKbRDoL87MwjqWeR0Um6Eev4+adri9xqeM6oTwGzq2m+sLaDF3GJYUiMF
 LlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717339023; x=1717943823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dU7sOuoCnE7DZBaFJYawXWXaLrHsBgPyxKdpukglgGI=;
 b=VumS4oh0VA1CmBCqIizeeJqLKYDAWH6gHWd12Gx/sPgG3ozjTLn/C7lhFTIrfBb9Nu
 hXpLJkhqgt9xTqPC8rZItNB99ufgxrJndfGajJpO5HHMqfhEw8X6/9+EOybedzl1cdaX
 1aAEM5peIf68iSjTTN2SOY0TdWgfVHukawv5rmGcPJFrQMR/Q6FVdkYegm91ii60uJQJ
 WwOKufF6RVdyI5zA51NGnCSDVif9EXqjUxUenal04fgQ1QnUSGK3/794sJ4HnMGiCuw3
 LdMAgh00x7aPLQwEk6HGXxV+X+T8mGoxyWwv5uol6XoUy6VTgP2Mxl/6LeJXapeHW0nn
 eSmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk95CiraiZfM1D301sg5WfEltBa7lPbzib/3zB4SvIEhcKr2LcgunyOMkZFP0PUvSG5rvA77WECyA4aXjB1/q53Ex00puUxpu9wkS7fXctZgfPrPzJNwQD
X-Gm-Message-State: AOJu0YxziCna6R9KCButmCQl7/2GlCWdjjRkQ9eCFo2nfPhE23diw7Y7
 R13kfUhFJ6hQVzAcSpKxYPO+vz32zdvd+VL2fYcIlol2baLzNHr4
X-Google-Smtp-Source: AGHT+IGG30UwFOotd/0Zdrr/C30omiONtB0LV+xIFdYgqxXQLjQdJQlWg/j2uttrnvCHheKu72hvDg==
X-Received: by 2002:a19:5f53:0:b0:52b:8912:2843 with SMTP id
 2adb3069b0e04-52b89122a59mr1943524e87.32.1717339022871; 
 Sun, 02 Jun 2024 07:37:02 -0700 (PDT)
Received: from localhost ([178.178.142.64]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d34b18sm966116e87.12.2024.06.02.07.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 07:37:02 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Sun,  2 Jun 2024 17:36:24 +0300
Message-ID: <20240602143636.5839-11-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240602143636.5839-1-fancer.lancer@gmail.com>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v2 10/10] net: stmmac: Add DW XPCS
	specified via "pcs-handle" support
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

Recently the DW XPCS DT-bindings have been introduced and the DW XPCS
driver has been altered to support the DW XPCS registered as a platform
device. In order to have the DW XPCS DT-device accessed from the STMMAC
driver let's alter the STMMAC PCS-setup procedure to support the
"pcs-handle" property containing the phandle reference to the DW XPCS
device DT-node. The respective fwnode will be then passed to the
xpcs_create_fwnode() function which in its turn will create the DW XPCS
descriptor utilized in the main driver for the PCS-related setups.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 807789d7309a..dc040051aa53 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -497,15 +497,22 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 
 int stmmac_pcs_setup(struct net_device *ndev)
 {
+	struct fwnode_handle *devnode, *pcsnode;
 	struct dw_xpcs *xpcs = NULL;
 	struct stmmac_priv *priv;
 	int addr, mode, ret;
 
 	priv = netdev_priv(ndev);
 	mode = priv->plat->phy_interface;
+	devnode = priv->plat->port_node;
 
 	if (priv->plat->pcs_init) {
 		ret = priv->plat->pcs_init(priv);
+	} else if (fwnode_property_present(devnode, "pcs-handle")) {
+		pcsnode = fwnode_find_reference(devnode, "pcs-handle", 0);
+		xpcs = xpcs_create_fwnode(pcsnode, mode);
+		fwnode_handle_put(pcsnode);
+		ret = PTR_ERR_OR_ZERO(xpcs);
 	} else if (priv->plat->mdio_bus_data &&
 		   priv->plat->mdio_bus_data->has_xpcs) {
 		addr = priv->plat->mdio_bus_data->xpcs_addr;
@@ -515,10 +522,8 @@ int stmmac_pcs_setup(struct net_device *ndev)
 		return 0;
 	}
 
-	if (ret) {
-		dev_warn(priv->device, "No xPCS found\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(priv->device, ret, "No xPCS found\n");
 
 	priv->hw->xpcs = xpcs;
 
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
