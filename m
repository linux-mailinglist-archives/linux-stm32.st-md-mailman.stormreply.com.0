Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE988A2940
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Apr 2024 10:25:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BD9C6C6B444;
	Fri, 12 Apr 2024 08:25:42 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 776D6CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 08:25:42 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a51a7dc45easo62387866b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Apr 2024 01:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712910342; x=1713515142;
 darn=st-md-mailman.stormreply.com; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zBk3IkdFTVmum+vYtVeAJMby59eq87hfD5TBghPTWMM=;
 b=Ya4qFgcNVtpn49J3eGcZzSA/TjwQaKaPp28kltakCUEy2JbgM5D9YymTKxzMqONEpx
 T2QvQQea1Xybiegb04Eomb+vei0WqCJx+dnwHOzPzs5lQhp9tHygyGrcp+dyOYCtq5Xn
 nzpWIzLgD+0xQUlbQaYkjuSIkKlVX/fivEOCzceUb11WSWDBi9rzQbMQPezapNRHU1/a
 ZMg7JPvDJXLHJ+VquICEHvQSlmkmrQau1zoYZsFBUvP/mLukPQ3loKJPdQvlV01ceLAw
 hjQluzeNvn6Cl6/UdKh2IVwHky83FUNnby4FzzLpMAPHS1mwOYu3DnXQuM768zHiYD3s
 Yx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712910342; x=1713515142;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zBk3IkdFTVmum+vYtVeAJMby59eq87hfD5TBghPTWMM=;
 b=qtlysHrwKyvTJAO5IHzcPmfQZwWOMUkKEA1qRidZd8Ky+IBqkzx5oPU8aZIFFchLTi
 0lKKHix1vQR9aNImhzXNaQzyoEgfTVtxkVnSYwuqltpP0KFqPau3pZOupVCuUmImOnm3
 Iysxrw8UscVkoF3HwYchGUB3PmlyffReaI2G+FP73V1sgqUykeUzqqXzzSrnQY0vuR1R
 huHj/ICq7xK+Hxi2E2vjkXM4pLo+CZO9YKhCeS3m+ELqbUZXMm4j04dTALQL7WwJTpzh
 LxoKBenVIUPm1IvluiQ/ZujKM7k2D2jtW8tt5dTQ2rSpvtWnXRDcydXNdzU7rxyQKidP
 Vu9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRRI4RIeslMEizX5pc8Prte4ETZ+TgWa4XSM7HS7D/WJmKQfnrOWL1b3tu6FKdMoxHwnewKl+xGmECIVyZSZDAHyNN0mrDoRqRYpuzK/XerrYe2SG0LToE
X-Gm-Message-State: AOJu0Yz8HTx5n+AdKdOxDGIUuqNbE5N6L2lLH7AWbY1F3BQZiNq7XZfM
 K/T/K1HeM7D+mRKuVlUqGP7YU62fnsE94QOR4vlGsS0CwZ0HePq2FAjJDRGZVqY=
X-Google-Smtp-Source: AGHT+IE00wDPrRr8eIax00TpINor2PbGdsjSZ8kU77JYzzDd3jq7whb6zK+VFuCJsGHEYumc624Pkw==
X-Received: by 2002:a17:906:4f06:b0:a51:e351:9ad4 with SMTP id
 t6-20020a1709064f0600b00a51e3519ad4mr1518672eju.9.1712910341629; 
 Fri, 12 Apr 2024 01:25:41 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 go36-20020a1709070da400b00a51fea47897sm1546872ejc.214.2024.04.12.01.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 01:25:41 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:25:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <17dce071-21ef-49f5-be45-f93bbf3642ec@moroto.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] bus: stm32_firewall: fix off by one in
 stm32_firewall_get_firewall()
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

The "nb_firewall" variable is the number of elements in the firewall[]
array, which is allocated in stm32_firewall_populate_bus().  So change
this > comparison to >= to prevent an out of bound access.

Fixes: 5c9668cfc6d7 ("firewall: introduce stm32_firewall framework")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/bus/stm32_firewall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index decb79449047..2fc9761dadec 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -53,7 +53,7 @@ int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *f
 			return err;
 		}
 
-		if (j > nb_firewall) {
+		if (j >= nb_firewall) {
 			pr_err("Too many firewall controllers");
 			of_node_put(provider);
 			return -EINVAL;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
