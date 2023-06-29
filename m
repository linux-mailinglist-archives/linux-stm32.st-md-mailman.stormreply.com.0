Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E28CF742CFB
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jun 2023 21:17:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FD72C6B455;
	Thu, 29 Jun 2023 19:17:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57C4DC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jun 2023 19:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688066268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CB4F2eDO1VL92Q0HqzTksbw7n9fujtKb1FZPPsN/d0c=;
 b=BqpD4ZwMzYZmpIJ45DfkxUtfb6EFY/wUovblgtb4/RWR9jwNEyvj2jNzIpKyYnEZETM4sQ
 6Y1Zn0/78sSfVelNKxLcfN24j4Pbo1Bvo8oXo1fbYvpJy8nm0mxVf+YpQ6k54PNHJvwA7G
 kMonJ0IdMCIJic14np/lWmUqJ+sIpQk=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-R0ZbwcJ-Puy7EOopemY07g-1; Thu, 29 Jun 2023 15:17:46 -0400
X-MC-Unique: R0ZbwcJ-Puy7EOopemY07g-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-577323ba3d5so9290527b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jun 2023 12:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688066266; x=1690658266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CB4F2eDO1VL92Q0HqzTksbw7n9fujtKb1FZPPsN/d0c=;
 b=i760ThhGiDZVhy5DKIs5MPDoXsmwEltQzSWBDVF2cEEIsKdggciobaboCsCI/zTPRS
 kUDDPOnboYDlKhRcJl6iA+4ZgS6NRZkKKgcUZ5gkL5OxXjG60LEstj4FY7MIMJ5fRBTS
 HZYUX/TEA1On5NN3qJJLyXcL0VdGfzEOv0RhksvTKwiYJBog+CzW3pp9cHXdyE6B9oQi
 M6he+pf1B9Aoo/+ugWoLP9NbY0vqTFiA59yucvriJf2Smp7L7yQrBfwelzRoHE2q9f8x
 KjS7mEGtKaHl+aV0cFJnsdKshgHIB3WarqLOou8FX3UtrBAU2kTmIHOaELFZ20WEYWrL
 6T/A==
X-Gm-Message-State: ABy/qLa9kKwiMjkry1EGdAhneD1WxjLKUmG9iIkkU66opu9uBzLURXEt
 mg0wTegfmZ/47mHnLqS+HqpgYfNbKwdQezUFYaVIeq49QoKm4jL117PHtnMkyy7DJpkYiXrPMrX
 RkzVemfU2Yi+2Nbk6hwAFCs7s5W0Lab4odXEj9mGs
X-Received: by 2002:a81:a04a:0:b0:56c:e260:e2d5 with SMTP id
 x71-20020a81a04a000000b0056ce260e2d5mr6808613ywg.7.1688066266282; 
 Thu, 29 Jun 2023 12:17:46 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHOfhrwZ9iRh4ReGxdsfikEqHuYNT4UdGjpezi+NU1/qUuJa+z/QJduR3WvMUh9O98fjlkVHg==
X-Received: by 2002:a81:a04a:0:b0:56c:e260:e2d5 with SMTP id
 x71-20020a81a04a000000b0056ce260e2d5mr6808604ywg.7.1688066266038; 
 Thu, 29 Jun 2023 12:17:46 -0700 (PDT)
Received: from halaney-x13s.redhat.com ([2600:1700:1ff0:d0e0::22])
 by smtp.gmail.com with ESMTPSA id
 w127-20020a0ded85000000b0057085b18cddsm3052478ywe.54.2023.06.29.12.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 12:17:45 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 29 Jun 2023 14:14:16 -0500
Message-ID: <20230629191725.1434142-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, bartosz.golaszewski@linaro.org,
 netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 kuba@kernel.org, pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH 1/3] net: stmmac: dwmac-qcom-ethqos: Return
	device_get_phy_mode() errors properly
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

Other than -ENODEV, other errors resulted in -EINVAL being returned
instead of the actual error.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e62940414e54..3bf025e8e2bd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -721,6 +721,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ethqos->phy_mode = device_get_phy_mode(dev);
+	if (ethqos->phy_mode < 0)
+		return dev_err_probe(dev, ethqos->phy_mode,
+				     "Failed to get phy mode\n");
 	switch (ethqos->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
@@ -731,8 +734,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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
