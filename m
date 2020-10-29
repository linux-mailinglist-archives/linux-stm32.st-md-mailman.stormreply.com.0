Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 058AC29E519
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Oct 2020 08:52:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B23B7C424D1;
	Thu, 29 Oct 2020 07:52:06 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C27CAC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 07:51:13 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id s22so1653794pga.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 00:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NGq3AUw6ysMha/FfRYSK0ItKsIwpDFgIL0/PfPvnWrU=;
 b=bnVSoLrbLDKak3wbA067m2XQ+pNeAm2plBFMKyCKdA6CEgzhXD/wXBT5lXDx0F+8u+
 xYegieS/ReMqYyfPoM2IYge7/7qvFLjd5p4NxLM1GxnEauDnW2+Qrwu+tn3YNmWONFRY
 TgS5K0YsDv7YYNr/facwK8WQaHhPXtmjgYdq+u34vTR9EUf3NDDQ5eKeO1zV9VpaNhEs
 9KtXX4PvOatAAYC5gUr9/ubfqsegV5th2OOTUNWlDOawIAPSzAw4xbzfxBij0rwLPFUM
 2xchontH33wuSdahu4mOyCKEF9c1qMiITDcq6/FB4VQz3YMJZkirx1xBZxhj28bGLJfS
 I/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NGq3AUw6ysMha/FfRYSK0ItKsIwpDFgIL0/PfPvnWrU=;
 b=AwBVPteO3om/v9YFIkCGCMo3KyJkviPAuVi8z1P8WBtCy8WbdnBZn3CBnKzoiQCc8I
 Lb7Sp68pKHN1rQSvHMR+iw/GklEOfWq70EpgoGQvCW5XrDQi5U9oJQuPfS5+1ux6G7Sb
 IJTz1h1VnPIXxVectDGSvhfpJP85koLbpir6kf84hMPnvH8YSjKkY05PpjG3SLnBoXWs
 OkE8ARMjCpnsdaPlkSqtACPzN558enjB0plqGzFbgxm0PdGBxczXpVXys07jWvuQB8S5
 b9Jod3TiorbTj1+9uEaFBgtSUadjsStsASYzLGEY+S05sZM77LpuvlpifineebJ4+fEZ
 WXsg==
X-Gm-Message-State: AOAM532pxJFZhWOdgc/QXNZZ1/CFRh241NEbpQQJJmuKgW++N3D69/3Y
 XRH9fYRDi4hBUmMeOywllaM=
X-Google-Smtp-Source: ABdhPJyuOhugn9EpUqKcAqFDBehBdUAOq+V9klQLT4mpZNvgrUWTycwVHeRUf0JZ947fMhy6rQ4NGA==
X-Received: by 2002:a17:90a:b303:: with SMTP id
 d3mr3056205pjr.207.1603957872363; 
 Thu, 29 Oct 2020 00:51:12 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id y1sm1932947pjl.12.2020.10.29.00.51.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:51:12 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>
Date: Thu, 29 Oct 2020 15:49:05 +0800
Message-Id: <20201029074910.227859-10-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074910.227859-1-coiby.xu@gmail.com>
References: <20201029074910.227859-1-coiby.xu@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 29 Oct 2020 07:52:04 +0000
Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH 10/15] iio: adc: stm32: remove unnecessary
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

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/iio/adc/stm32-adc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index b3f31f147347..42f9013730f8 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -1988,7 +1988,6 @@ static int stm32_adc_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#if defined(CONFIG_PM_SLEEP)
 static int stm32_adc_suspend(struct device *dev)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev);
@@ -2018,7 +2017,6 @@ static int stm32_adc_resume(struct device *dev)
 
 	return stm32_adc_buffer_postenable(indio_dev);
 }
-#endif
 
 #if defined(CONFIG_PM)
 static int stm32_adc_runtime_suspend(struct device *dev)
-- 
2.28.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
