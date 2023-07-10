Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D3174DF05
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 22:17:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7846DC6B457;
	Mon, 10 Jul 2023 20:17:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61708C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 20:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689020256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YmlAnwDpnt7QnZH9R1+eVRqHntPGLtyJNksmlK12GAU=;
 b=EOkQN6twhZrgUcYmbPrfnWduq5z+Beqp4QwpmPbVKca1sFR4o28fzHL8eHxF3lo2/wWoK+
 Yr5bkI4ILbZg0t8YecAngOG5aphu/vvbZfDk0AVYcn3ozYeSLIDNEHb4sZUzYBhVcI6Cud
 O7A+BHxx7H4rlgWAxaE0CA7Wvq2xU4o=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-r-toUlNjNvq4hzhWZsVduQ-1; Mon, 10 Jul 2023 16:17:35 -0400
X-MC-Unique: r-toUlNjNvq4hzhWZsVduQ-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-1b74e921a7aso351945fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 13:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689020254; x=1691612254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YmlAnwDpnt7QnZH9R1+eVRqHntPGLtyJNksmlK12GAU=;
 b=TKcF+V8S7uUUsX4tBQJ/vk4WFmOhjTxm2G0ftp2t/zccbfuMlNw4Zer6Xm0FXggAJY
 I/j4SYIkmgsJ67gYbWkFTlYvmr6VL7q3xU2xo8z53xMFW8nfczh1QiEw/OtPDF1QyO7m
 damjReGlZYyKlC2aUricj0t01hfCKwMgpiENfdJHHaI22x22SETujW9DfJhkLjuXxZ1I
 cx+wP0eV8eFS3KIwj2XM9RsBTEk1zskn4uHcXQj8UlhNGq4frC4mlzhlvtk/vcIXVpdO
 C3wOGz98gaPJ3Fj7oaSlG76GB5ArLJhGse1c91Trh2JceyF3O70jvb7oau/Ftuts0d7k
 extA==
X-Gm-Message-State: ABy/qLYFFMwHlGuCFchPvB8CSAQFhJAokLIA5DdtbHI1WmmS/jQ4o+Hv
 WfmKtH46GbxShkKTZBN5NUOXHxUPBUVQFt2au3zED7Lmm2HoC3q2UkLnxlhAJlWyTPSP6fXAs5o
 KuiiAZHMHY8bjO55WyboZI9wqv4DZt/j9SK9Kljwu
X-Received: by 2002:a05:6870:5254:b0:1b0:4fc5:2e4b with SMTP id
 o20-20020a056870525400b001b04fc52e4bmr13438900oai.9.1689020254685; 
 Mon, 10 Jul 2023 13:17:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFmKqPEtPtyW1H2DGn/G9uxqGi6UQiom7uSU/SpIgU9Y6/TP9FG19pTfynkVg73dr92H4bGyw==
X-Received: by 2002:a05:6870:5254:b0:1b0:4fc5:2e4b with SMTP id
 o20-20020a056870525400b001b04fc52e4bmr13438882oai.9.1689020254461; 
 Mon, 10 Jul 2023 13:17:34 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::22])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a81920c000000b0056d2a19ad91sm155097ywg.103.2023.07.10.13.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 13:17:34 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 10 Jul 2023 15:06:37 -0500
Message-ID: <20230710201636.200412-2-ahalaney@redhat.com>
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
Subject: [Linux-stm32] [PATCH net-next v2 1/3] net: stmmac:
	dwmac-qcom-ethqos: Use of_get_phy_mode() over device_get_phy_mode()
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

Since this driver only uses devicetree, let's move over to
of_get_phy_mode(). That API has an explicit error return and produces a
phy_interface_t directly instead of an int when representing the phy
mode.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---

Changes since v1:
    * Convert to using of_get_phy_mode() instead of continuing to use
      device_get_phy_mode() (Andrew Lunn)

 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e62940414e54..ebafdadb28d5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -4,10 +4,10 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
-#include <linux/property.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
@@ -104,7 +104,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	unsigned int speed;
-	int phy_mode;
+	phy_interface_t phy_mode;
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -720,7 +720,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (!ethqos)
 		return -ENOMEM;
 
-	ethqos->phy_mode = device_get_phy_mode(dev);
+	ret = of_get_phy_mode(np, &ethqos->phy_mode);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get phy mode\n");
 	switch (ethqos->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
@@ -731,8 +733,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	case PHY_INTERFACE_MODE_SGMII:
 		ethqos->configure_func = ethqos_configure_sgmii;
 		break;
-	case -ENODEV:
-		return -ENODEV;
 	default:
 		return -EINVAL;
 	}
-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
