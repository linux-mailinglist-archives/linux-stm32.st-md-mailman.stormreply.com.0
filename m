Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0809742CFE
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jun 2023 21:18:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 974DBC6B455;
	Thu, 29 Jun 2023 19:18:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F8ECC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jun 2023 19:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688066288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YCceMk07Z77c7iGv0vMNdhiFvW89N91YRXanb/xg6cQ=;
 b=ZUCVAHHH4eyXYsVGvyEjZ1WncZ22wld/rMfLs04qHKeW+kbq7+gcufhaGjPsrnWKC3VnOf
 EK32+1VlooMvcBNMqXDkH8Y+TozR39uo9yXnyKndQC59h8RHNkGNQLsGvpDzzHqp0CuLD6
 BAECYswgmzJhScFM3D+fduGl8r0MiQk=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-T4b0kykHOP-zE6T0rTWXEg-1; Thu, 29 Jun 2023 15:18:04 -0400
X-MC-Unique: T4b0kykHOP-zE6T0rTWXEg-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-5704995f964so8781497b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jun 2023 12:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688066284; x=1690658284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YCceMk07Z77c7iGv0vMNdhiFvW89N91YRXanb/xg6cQ=;
 b=h4HqK1aoDzBCj1Vm0Ss45+z8U+4izqvgDtCBt+SQ+Y3rUUB7bXbZumOW2QEW3OgUHZ
 fMTWSEr6cjrDv1rm/PAZNd+n2bTUhJkdZNoYbdVCaJY8J2nJu939YBGc4KlDYJrdnrfi
 kSOISBOzaQb/6uB7O53NK39F33gphlgTr/+5Kpn/iD0jtHcSjjszi7biF9LxkgNvJbpG
 OjzZJMOvEgYDCS7bcAQnaL6ZlwqTDK+PhRSJO9tC6yLJOR0mYKpV4hdKHwWVSg+taHab
 CHS/8+8Didy9Q3fLIhI371gIGfq29RIueGQgYLlp0l8K/c8SvwM4DdDmqNv+cCQNGRtz
 Du0g==
X-Gm-Message-State: ABy/qLbiFHjngYnjX6If541C4EHkulP4yi0+jpQl8AbOT1KsnXFKz7Py
 kSYkUt64TkaG4WVAf1t3negJ2c9gYVyAK2QECuxpoI0zfwlWFMSfMSQ8M2HVM+1u4D6Mysfrp78
 +mRrbEO/QUVI/0VcUPX3ymTnhWsk8YaeaqqAdBILP
X-Received: by 2002:a81:88c7:0:b0:56d:43bd:5513 with SMTP id
 y190-20020a8188c7000000b0056d43bd5513mr352214ywf.5.1688066284373; 
 Thu, 29 Jun 2023 12:18:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGdHXzFMRozd6nGxf58W0Xv/QopKQ9WchA/okhijXMBtBl5YPN9hN+ACX/VQ9/Q0R3vF2Wxng==
X-Received: by 2002:a81:88c7:0:b0:56d:43bd:5513 with SMTP id
 y190-20020a8188c7000000b0056d43bd5513mr352198ywf.5.1688066284148; 
 Thu, 29 Jun 2023 12:18:04 -0700 (PDT)
Received: from halaney-x13s.redhat.com ([2600:1700:1ff0:d0e0::22])
 by smtp.gmail.com with ESMTPSA id
 w127-20020a0ded85000000b0057085b18cddsm3052478ywe.54.2023.06.29.12.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 12:18:03 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 29 Jun 2023 14:14:18 -0500
Message-ID: <20230629191725.1434142-3-ahalaney@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629191725.1434142-1-ahalaney@redhat.com>
References: <20230629191725.1434142-1-ahalaney@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, bartosz.golaszewski@linaro.org,
 netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 kuba@kernel.org, pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH 3/3] net: stmmac: dwmac-qcom-ethqos: Log more
	errors in probe
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

These are useful to see when debugging a probe failure.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index a40869b2dd64..d792b7dd9fc3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -706,7 +706,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret,
+				     "Failed to get platform resources\n");
 
 	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat)) {
@@ -735,13 +736,16 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		ethqos->configure_func = ethqos_configure_sgmii;
 		break;
 	default:
+		dev_err(dev, "Unsupported phy mode %s\n",
+			phy_modes(ethqos->phy_mode));
 		return -EINVAL;
 	}
 
 	ethqos->pdev = pdev;
 	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_base))
-		return PTR_ERR(ethqos->rgmii_base);
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
 
 	ethqos->mac_base = stmmac_res.addr;
 
@@ -753,7 +757,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
-		return PTR_ERR(ethqos->link_clk);
+		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+				     "Failed to get link_clk\n");
 
 	ret = ethqos_clks_config(ethqos, true);
 	if (ret)
@@ -765,7 +770,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
 	if (IS_ERR(ethqos->serdes_phy))
-		return PTR_ERR(ethqos->serdes_phy);
+		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+				     "Failed to get serdes phy\n");
 
 	ethqos->speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
