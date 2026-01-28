Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KD/6G7/ceWnI0QEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 10:54:07 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FEE9F08D
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 10:54:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 062C0C2909A;
	Wed, 28 Jan 2026 09:54:07 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21E8CC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 09:54:06 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso2553995e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 01:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769594045; x=1770198845;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/27C/CNBZB5U2mainQlNU7Fdsq/MruiST5P1Ff/65Ew=;
 b=VYBzKwrAeUsDlC05NZRck89pnnz1aDK2XLK7DPoAL7ox/HRSvdhgSW4GOOofiWreU4
 ynecjO83cmIccpa4qqv64tF8EEz15GTGO+aiUYSUd97PtBXGbI8mWiLbGHeZaEPfEjy7
 8/B74LV98lP7uJIedsxzeJzj4GoCHrm9ZYyENbzhL3wKXQNd0O3vwE2C6fG3XI49ZX8M
 +uKGfLhtAjHrEDCEVAQgDxBOpBsUq+EC7xtqxh3cpCEXXQYfAricD9ppD8RVzcSNS4BR
 MQEp0Rwzw9Z/Dw2ZUyEeqO+lvQs0JcSnjXq1Bfu3wVYr8YDAmfXdcGORC/liWItKdkbO
 WY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769594045; x=1770198845;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/27C/CNBZB5U2mainQlNU7Fdsq/MruiST5P1Ff/65Ew=;
 b=i5u3ZehWp2U1Sj4t2xUJu4neKcN2CoJAKACpkUhNFRFPaWd/jjpT8OvyrUbjSXdGA6
 EIEmAkKgvvZJWZPxlZ1bnZr5zkK/etZ3SDAs1hQ59zAsztCENoRgzX5fTivAPgI2k8pf
 NN4Fmx2EbvootzdLHDc/jar+Gp/gagp8kUfgnbhxBfef1Q2Ytgg/5XOt3IdYGkvXFYcy
 BAURmGZGuyyNsGog6wmttcveyvy711qhlCvTlSQT7iXntKDzDFGJnCIZU66PJ3t5dSNG
 mhN4WBhwQbZrAUEsWWI0DWxndteFCYCdThKuJuPzjsndt98WCB0QJpZ99vVamAToENdm
 PVnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFg3Xx3NMWuhG96ieua33bPScOUWwT3ooaAw4bRbL3LNhRYktMpHn3OTAfLloPFMvVo2T0j2W7bqBT5A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YylWdB9D+lH+J2qpqzv0PszzDeTvZILog1xbKXkbuzyfB/4tdIC
 C7WDUgzoL8Nk24e3L62/ngxkc4w5lSDtEc+U2l0FgknzzHRALyT084xgkKZFtDASMCc=
X-Gm-Gg: AZuq6aIt/nhVAjiusFfjVXVYB7Y5o/rqq5+c8ZLqJwR7VHg1g+1MOKS6XeZ0cQHVepm
 YIOA4kNZN35cxxTVnreQYXiT7EJdubZn1tPPdrIX0lETZqt42lFuRcJ7jCm3B7KcMTIkq5Lb3w2
 yFMv1W9JWJ/syV6bdSX90KibnTeQjB9NeCHd4V5DvvMOjmcqnpdvvVH7horQXGdakUUMmcSScaR
 QZJNy1v1pyEXgxn+2lnvnxee3DRyL0RQ9I/jjZ36Vu8WkewBWgal+Gq1sxfRcxw0v2x/0nSNEaC
 wCMiuoXS3M4pFlXc8nrIgz1QSPSPkvkw29P4y5lSrvK4j1Wmw2sJPnGOBkBWhqFzMOBXOPGV0NQ
 zsiaKMqGVotKYB9Wi5LlAXhmqjEb1PXo3M3nJpctoKPsKRN/HAThdm73NlcV42xQ8rgOZFMC57G
 g0CHnRMthLT9cliIYt
X-Received: by 2002:a05:600c:458a:b0:47b:e2a9:2bd7 with SMTP id
 5b1f17b1804b1-48069c6970fmr53235125e9.19.1769594045452; 
 Wed, 28 Jan 2026 01:54:05 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806ce4c3d1sm51986545e9.9.2026.01.28.01.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 01:54:05 -0800 (PST)
Date: Wed, 28 Jan 2026 12:54:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Message-ID: <b38f1c628cdac8e87271e5fa4e2b71110c15b42c.1769592679.git.dan.carpenter@linaro.org>
References: <cover.1769592679.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1769592679.git.dan.carpenter@linaro.org>
Cc: imx@lists.linux.dev, s32@nxp.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linaro-s32@linaro.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 1/3] net: stmmac: s32: use a syscon for
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
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	GREYLIST(0.00)[pass,meta];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jan.petrous@oss.nxp.com,m:imx@lists.linux.dev,m:s32@nxp.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:linaro-s32@linaro.org,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,linaro.org,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 40FEE9F08D
X-Rspamd-Action: no action

On the s32 chipsets the GMAC_0_CTRL_STS register is in GPR region.
Originally, accessing this register was done in a sort of ad-hoc way,
but we want to use the syscon interface to do it.

This is a little bit ugly because we have to maintain backwards
compatibility to the old device trees so we have to support both ways
to access this register.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
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
