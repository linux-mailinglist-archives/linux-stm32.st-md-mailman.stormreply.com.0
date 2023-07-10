Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC17F74DF08
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 22:17:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93B50C6B457;
	Mon, 10 Jul 2023 20:17:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2565EC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 20:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689020264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Lt3BtWczAjK1pGWk1bVfpBjHD7dTaFpkCieY8rxpSU=;
 b=cNkbrjcJFsTKJ1KCk6HwIpM70gl9YYlTLxj7sGrSWh/ia3KXaMrv+MOM/rgKP4wNKfzRow
 6+4YlFD4d0gykE1c7/GwiTUQowrz09AA2pdQWtsFJv+3BOCNfGp00V9ZJdrkcZ1hcq736a
 HXB2m+T8mwsE87RH8KZcTzqTFygIBZw=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-uyKMzWZNOB6STQafGbBl7Q-1; Mon, 10 Jul 2023 16:17:43 -0400
X-MC-Unique: uyKMzWZNOB6STQafGbBl7Q-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-1a6545aa0e0so4797822fac.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 13:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689020262; x=1691612262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Lt3BtWczAjK1pGWk1bVfpBjHD7dTaFpkCieY8rxpSU=;
 b=fd5dXS2kqbh8fRdcjIbaVk59WyrahF5ARZ+2jfRdFoGvIMjvBpitbj4O+3GUliV30c
 CZ+bzMed8FWsBSNjnUyL7mPRRffZYxTyoC+Wa04Hj6ZShlr3TmclPbkKBFwxMJnVOJdi
 bbxP3JXTdO6T6XqC4gQKqeRKyEiVBAeSnq1Xyp46BWZGrgmaGKcjgIuOAD7xa+ol2eNy
 TZuczxoq0HtgaeZMOvENJ7OjrVOurnH+SbmuYX8ZEKt/QKx48CcC8UYuzQTfn8xr4zgx
 +Y8xn/wYmO/XWYOET/jXe4/hpqayCe22g7rAJWANL1gKL6AkACD6ijWYwUjJ8T48gxpu
 i8XQ==
X-Gm-Message-State: ABy/qLb29ggTTJENevd1patub++bRhBXYS8ltsXD9V/G1V8XE8xpOeo7
 vJJHAszRX8QESbNOz8zbdOFtHQCzNZAHELtSHcogtnTyOwaZrzwob09xPm1JqhDi/DKIOERwDLn
 1OgVjE+VBrok730LL11+FyxjvkoExX1cwhekYBgNU
X-Received: by 2002:a05:6870:6112:b0:1b0:4899:10d with SMTP id
 s18-20020a056870611200b001b04899010dmr13142248oae.35.1689020262506; 
 Mon, 10 Jul 2023 13:17:42 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH5cLj5bn3UpXHR1dUTlmhj+Qmb+K7OJTd7/WyAoeWXbjil07VpyzlZI5NQ0gyXvfavO3Rbyg==
X-Received: by 2002:a05:6870:6112:b0:1b0:4899:10d with SMTP id
 s18-20020a056870611200b001b04899010dmr13142235oae.35.1689020262255; 
 Mon, 10 Jul 2023 13:17:42 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::22])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a81920c000000b0056d2a19ad91sm155097ywg.103.2023.07.10.13.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 13:17:41 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 10 Jul 2023 15:06:39 -0500
Message-ID: <20230710201636.200412-4-ahalaney@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710201636.200412-1-ahalaney@redhat.com>
References: <20230710201636.200412-1-ahalaney@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, andrew@lunn.ch,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, simon.horman@corigine.com, kuba@kernel.org,
 pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v2 3/3] net: stmmac:
	dwmac-qcom-ethqos: Log more errors in probe
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

Changes since v1:
    * No changes

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 1e103fd356b7..757504ebb676 100644
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
@@ -734,13 +735,16 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
 
@@ -752,7 +756,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
-		return PTR_ERR(ethqos->link_clk);
+		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+				     "Failed to get link_clk\n");
 
 	ret = ethqos_clks_config(ethqos, true);
 	if (ret)
@@ -764,7 +769,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
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
