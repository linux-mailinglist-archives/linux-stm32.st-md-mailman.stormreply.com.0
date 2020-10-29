Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4931029E85F
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Oct 2020 11:07:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFF3FC3FAD5;
	Thu, 29 Oct 2020 10:07:35 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CC98C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 10:07:33 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id w11so1053164pll.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 03:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tI5oeu083/nL6GJhPsqc4gO0SNUKlgZsyMixSW/3ceg=;
 b=nSAByfXcQaloLeZ8FOeVHFsqjjm2/caWkiYYZXQGPJqnlWz7Bn83icp5D9q1sD5/Bu
 hSzqZO9EChV1mkauO5ZBbGCqt5JW9mikWmnMl91EKIGgiC5IveqOPDpGqEtiySDXdQKL
 FcnRCoiC2OE7h1Q5Bs8eruWKmzC8N3i+77Nz2w3++hIa3+2dvpnToXmYSNVm9m1egVUA
 pA+vQ3J5sdPBNGbK2Qt7Y/m3oCCXnLFN4jsmAVH4ug0s2BP4RVKkpRIusRhR375vuq64
 /OfnD61VkY2Lc0GbORc7TmQn1OKouobuIr6SP3FrBT53Z5MAnxrt20UanKnbI/3lTnC+
 zPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tI5oeu083/nL6GJhPsqc4gO0SNUKlgZsyMixSW/3ceg=;
 b=rHRvnbTHQo5j1wAr0RtI2RhCrmRDXsKodD5VZUnphLxTqjlc6oQ935ApoUP+egWqbR
 OB0m7Tfc8WxNpmUL0qCLsK6kPFfNwdiuZc+QIbYu4YVgdLTCkdNYCqZgzOZU77GTL3pd
 AM4p/7/+uOl9s1AR4ppF+7Dvlg8owPfpKDkS/xX+Rf8Bv3U7Ak1AFwElJcGECsrGpJbD
 rB66/PcRiGNkI7AUaEINdzwX6HmT8yXxkVnM3yo3xv4nUTOSmxpmuFRHIX5+QfloMuPU
 TO+F/GyAzQlnRiGVXvC78ZTBVNqYs5kvjbJf9NCwu3N/MEu/UxjlQzX8KuXW7ROnx8u2
 qRWQ==
X-Gm-Message-State: AOAM5335lQZnHsV/bzl+dKmmzI6W0xSez9K27qoXfTHYSPoL2CNM+cX8
 CCSgwfgFH4bMOtH38iexcm8=
X-Google-Smtp-Source: ABdhPJwUIb6dKOxpzzTARpwdqzVB5dK/+w1vuIyMljKChJSLGbb8XuMUw6KK3ODz8tr1yXw6ppGc7A==
X-Received: by 2002:a17:902:8c8a:b029:d6:42d5:1cb7 with SMTP id
 t10-20020a1709028c8ab02900d642d51cb7mr3175494plo.73.1603966051875; 
 Thu, 29 Oct 2020 03:07:31 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id l18sm2447529pfd.210.2020.10.29.03.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 03:07:31 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Date: Thu, 29 Oct 2020 18:06:44 +0800
Message-Id: <20201029100647.233361-6-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029100647.233361-1-coiby.xu@gmail.com>
References: <20201029100647.233361-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Cc: "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [PATCH 6/9] mfd: stmfx: remove unnecessary
	CONFIG_PM_SLEEP
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

SIMPLE_DEV_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/mfd/stmfx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
index 5e680bfdf5c9..e760cf2be02e 100644
--- a/drivers/mfd/stmfx.c
+++ b/drivers/mfd/stmfx.c
@@ -469,7 +469,6 @@ static int stmfx_remove(struct i2c_client *client)
 	return stmfx_chip_exit(client);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int stmfx_suspend(struct device *dev)
 {
 	struct stmfx *stmfx = dev_get_drvdata(dev);
@@ -535,7 +534,6 @@ static int stmfx_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static SIMPLE_DEV_PM_OPS(stmfx_dev_pm_ops, stmfx_suspend, stmfx_resume);
 
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
