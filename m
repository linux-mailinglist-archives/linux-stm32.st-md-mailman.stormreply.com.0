Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C535C742CFD
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jun 2023 21:18:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8910AC6B455;
	Thu, 29 Jun 2023 19:18:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAF77C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jun 2023 19:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688066281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IdunTKBXq26vcyYb/EdIVE7YvQRq/YPpQ2jK2C3l7sY=;
 b=VDKZKcCOjBHpSiu9M3ndPRoUf5k29rXGq/BfARQ3Kk4OKNMGKt6J37KoiLJmUPO8iLsNVm
 ckdnwwfPZG2rdpcxS48stHIBtDITT1qTPPXhThKknvBxu6UT/PsDBdNJ/FPx6V+VUJs/zj
 geler9EUkkpgieB6tBcjuLqXS+x2dA8=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-1gyUhxBsN3G7n-IRZQZOZQ-1; Thu, 29 Jun 2023 15:17:58 -0400
X-MC-Unique: 1gyUhxBsN3G7n-IRZQZOZQ-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-5704991ea05so8769547b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jun 2023 12:17:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688066278; x=1690658278;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IdunTKBXq26vcyYb/EdIVE7YvQRq/YPpQ2jK2C3l7sY=;
 b=Quc8Rfb935MoD/AykyfoZ6y0xPyJabVikGYZcowvtWCt5QmxcacdQ4o5Z/4J3flQlL
 7UlaOWDg1BwseVTvTdydTqBr+cmcn16Ta8xYlGqZuxdjt7AzdohoeznQBqY+FhlwyHJL
 B6vBkijO47jqNCuoUR29oz903KabjqKGONNAVu22SSFDQTG3PO92J2ftjx8W7lB/8Gke
 JhPDwmvMXr6N3e6M1tCQEQtI/cGWqcWLVKcwxHgwsfA9IbApHdIjhie1PNMaowFWdAYX
 r6W9Jm/QAAXKb+Wq4KMzC8sC4ZCQg9Jbt4qrzZEiXs05v0ZkrwYn5KH39DTOYQrjDSwt
 7mTA==
X-Gm-Message-State: ABy/qLbvED73uE8YY7n78F/xnkTeSOxp09niq+0SnRuq7q39hnCCEYz8
 mHxCC3o50KS+6K1sNCBFB9UP7zgpoS9OT8BDh1ofFZHAn9GHwNdBtqkIsdf9zp12YOXfBokRD/h
 YGIfFXgi5+cD8D0O69JxfV58WF2Y/wonyBr5KM6O5
X-Received: by 2002:a0d:f2c4:0:b0:570:6fbd:2daf with SMTP id
 b187-20020a0df2c4000000b005706fbd2dafmr303072ywf.37.1688066278444; 
 Thu, 29 Jun 2023 12:17:58 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGWPYjej9cDTBj9PaobIHZOXCIJHkmLixBjf5KfzXTvWmIZX19PFv5oYzbDnjlXG204DfghIQ==
X-Received: by 2002:a0d:f2c4:0:b0:570:6fbd:2daf with SMTP id
 b187-20020a0df2c4000000b005706fbd2dafmr303048ywf.37.1688066278207; 
 Thu, 29 Jun 2023 12:17:58 -0700 (PDT)
Received: from halaney-x13s.redhat.com ([2600:1700:1ff0:d0e0::22])
 by smtp.gmail.com with ESMTPSA id
 w127-20020a0ded85000000b0057085b18cddsm3052478ywe.54.2023.06.29.12.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 12:17:57 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 29 Jun 2023 14:14:17 -0500
Message-ID: <20230629191725.1434142-2-ahalaney@redhat.com>
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
Subject: [Linux-stm32] [PATCH 2/3] net: stmmac: dwmac-qcom-ethqos: Use
	dev_err_probe()
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

Using dev_err_probe() logs to devices_deferred which is helpful
when debugging.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 3bf025e8e2bd..a40869b2dd64 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -710,8 +710,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat)) {
-		dev_err(dev, "dt configuration failed\n");
-		return PTR_ERR(plat_dat);
+		return dev_err_probe(dev, PTR_ERR(plat_dat),
+				     "dt configuration failed\n");
 	}
 
 	plat_dat->clks_config = ethqos_clks_config;
-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
