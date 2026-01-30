Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AC4QA/OvfGmbOQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 14:19:47 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB347BAEAF
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 14:19:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72748C1A97C;
	Fri, 30 Jan 2026 13:19:46 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F1B0C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jan 2026 13:19:45 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-47ee937ecf2so18036325e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jan 2026 05:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769779185; x=1770383985;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6LftfxHAZaora2yPEdmX+khpJwn0jgto61bYSOyCgE0=;
 b=j/egEHLITXECT7ZGfPhhczUAgQJZPEZFFDfnSkAXIvDCgkiMpjfzbVWsFrgAuq9VoU
 QTtIVUXtw2sNLONJD2w2mt76GqN+kGghOl3YXnVHsb7XguJ6liGVOoD5iNKHe2U+Zd/m
 nD5kty9GoVJZzNmAVeZs1op78+wsqxNvfekgbCM0ocVv9p1KBVt/7R8XF69IO5jWB4zB
 kwGweyeM9uf2BZpvrMbKNQElNfM5ncAmb+J9RGQyXDw6VkGjC47rJ8rdYnvcNFWwtRlU
 Db4CgBcFezmnzNcgosgOz91b99gH699qpm6Fzieurnx0m7khEFk0Duq09clghnPJ0yyf
 mZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769779185; x=1770383985;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6LftfxHAZaora2yPEdmX+khpJwn0jgto61bYSOyCgE0=;
 b=leGc+IUgw8oheDVsLerXph6x7cdRAk8Zcl9V38waxSOKmo7fTXWGUXMR/PZbBwkkXk
 Q2NcB6BVqlAHcjB1K8sB+Qi59rw7APTOcv5b/GiLSaNJInpqmfB9RGqv/jqqNtzJuDEM
 i3FS1TWghT4pJk2Mf7YfChtyDga9pzXmNYwRfZQSyvlmpPLC28orpnquzOFkMsclNP6t
 amkyH5g+kVWC2+ih6YYFSPM6uGwG/OURp5Qr5gOs6G0P8Cb2FaRC57mI20GvhCX/71gt
 xlyMocr1m/R7lS0b9GzsbK1FGPKlJyNHTInAH5Iqf4lmpOdzk6s+FgJtDImc5vYgtiRo
 sfsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP5fv1t0B9cUDw2AsJWk0hKBmJg4A97Yj3se/NR7fm3+ez7TLJspxLXgQICLsFdasTLLtR2N65dKpphg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwxkfdnuX/+lUzDP0OB/FlaardK4p7w+cX2XGyHPg9wvN7Ia8Uh
 2//OGserHkPO9RwueN+UuP5x6QCXGRDWo0v5M0pJPI884zim0Ng1ba6tXAs15UeSURE=
X-Gm-Gg: AZuq6aKCfcPWPWV5bJox+qW8QhSGYEyCTL/TAxxVoSZSYl17hHEpRaNsAxJ7tDfVoJ6
 8QpKSOPwViTwLSSJx1d+MIo5lt2XS/2BgO/O0GnjgykaqdqCDIhfyHuwcmZvMI+tm+kxNhEkf/i
 lQ7hwTN1Vl7tJAYXV9iQ2/qU1Yn/NOW0gzBOnnWsVPod37Ut8Erj56uJa40B8zSQiKengrUMwqy
 Pl5CpnBkjT5aJIVBhy3MF21Gk33PMSzj2hBKGpHA8n9WhzSov1LB6/cWuYv59kCV+aYabKLzt6Y
 CT5lDlfWKkCAIwfvNncy0LT7LBO4Heiuk+Tvx7UGWlfSD04KOij8Sd3Nklh9t5Ov7RmzFkYuQPk
 uDifVtgIUw+u86mU9bRo3tlsZX75WPfHL+BuLyuy/p1V/0DE86Wmgak6RXJFf1V1BYpM5VwMo7h
 t+V2H+2pXNBMrLpi3h
X-Received: by 2002:a05:600c:680a:b0:47e:e051:79ee with SMTP id
 5b1f17b1804b1-480828745d7mr89683285e9.3.1769779184609; 
 Fri, 30 Jan 2026 05:19:44 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cdd77b8sm200882875e9.3.2026.01.30.05.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 05:19:44 -0800 (PST)
Date: Fri, 30 Jan 2026 16:19:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Message-ID: <b6b60d03344d070b2b4db7f0f00527f166e594e0.1769764941.git.dan.carpenter@linaro.org>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1769764941.git.dan.carpenter@linaro.org>
Cc: imx@lists.linux.dev, s32@nxp.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linaro-s32@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 1/3] net: stmmac: s32: use a syscon for
 S32_PHY_INTF_SEL_RGMII
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jan.petrous@oss.nxp.com,m:imx@lists.linux.dev,m:s32@nxp.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:linaro-s32@linaro.org,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,linaro.org,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: BB347BAEAF
X-Rspamd-Action: no action

On the s32 chipsets the GMAC_0_CTRL_STS register is in GPR region.
Originally, accessing this register was done in a sort of ad-hoc way,
but we want to use the syscon interface to do it.

This is a little bit ugly because we have to maintain backwards
compatibility to the old device trees so we have to support both ways
to access this register.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
v6: Add Jan's R-b tag
v5: Return an error if regmap_write() fails
v4: no change
v3: no change
v2: Fix forward porting bug.  s/PHY_INTF_SEL_RGMII/S32_PHY_INTF_SEL_RGMII/

 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index 5a485ee98fa7..af594a096676 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
@@ -11,12 +11,14 @@
 #include <linux/device.h>
 #include <linux/ethtool.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_mdio.h>
 #include <linux/of_address.h>
 #include <linux/phy.h>
 #include <linux/phylink.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/stmmac.h>
 
 #include "stmmac_platform.h"
@@ -32,6 +34,8 @@
 struct s32_priv_data {
 	void __iomem *ioaddr;
 	void __iomem *ctrl_sts;
+	struct regmap *sts_regmap;
+	unsigned int sts_offset;
 	struct device *dev;
 	phy_interface_t *intf_mode;
 	struct clk *tx_clk;
@@ -40,11 +44,17 @@ struct s32_priv_data {
 
 static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
 {
-	writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
+	int ret = 0;
+
+	if (gmac->ctrl_sts)
+		writel(S32_PHY_INTF_SEL_RGMII, gmac->ctrl_sts);
+	else
+		ret = regmap_write(gmac->sts_regmap, gmac->sts_offset,
+				   S32_PHY_INTF_SEL_RGMII);
 
 	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(*gmac->intf_mode));
 
-	return 0;
+	return ret;
 }
 
 static int s32_gmac_init(struct device *dev, void *priv)
@@ -125,10 +135,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 
 	/* PHY interface mode control reg */
-	gmac->ctrl_sts = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
-	if (IS_ERR(gmac->ctrl_sts))
-		return dev_err_probe(dev, PTR_ERR(gmac->ctrl_sts),
-				     "S32CC config region is missing\n");
+	gmac->sts_regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
+					"nxp,phy-sel", 1, &gmac->sts_offset);
+	if (gmac->sts_regmap == ERR_PTR(-EPROBE_DEFER))
+		return PTR_ERR(gmac->sts_regmap);
+	if (IS_ERR(gmac->sts_regmap)) {
+		gmac->ctrl_sts = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
+		if (IS_ERR(gmac->ctrl_sts))
+			return dev_err_probe(dev, PTR_ERR(gmac->ctrl_sts),
+					     "S32CC config region is missing\n");
+	}
 
 	/* tx clock */
 	gmac->tx_clk = devm_clk_get(&pdev->dev, "tx");
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
