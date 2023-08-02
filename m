Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBE376EECF
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Aug 2023 17:58:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 382B2C6A5F2;
	Thu,  3 Aug 2023 15:58:02 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2DCAC6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Aug 2023 12:09:34 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-51d95aed33aso9001711a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 02 Aug 2023 05:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690978174; x=1691582974;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kIfnwiKIrKjy8l+DtnHC/rUW3Cj13n5h4X8XpNbnkyM=;
 b=DyhB/KMxgYS+hBfZV6y0QkwuP8HK2zVcW0tYBoZ2pEqwSEGNQB9u2GyVGUHU9FKz/h
 ydy9W6pkqAoST2V8ycIQjtjjNUUHkqvF2E0cVfug86Kg4P6//7P90W/wnalAyrifTZuq
 a4N4X4Dsd2U9EWTFJ5Z153dCUyOfH7Pn5u5CP3WQyTjpY/x9CLSx1Lz0CoohDCRmpNki
 2RGfg2nkQD4fiel6zJpsDhIHkhd6vzCayvfLNfMUWzzZfMTOOF7nINFnlLfYu14z/0j1
 2kSqTBBVhIuwtSUolQvKwf59jzQ3tpPoeu/mv1h3Z6ZQNFRYjRWVocHB6BQ01nUdz7M/
 1nYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690978174; x=1691582974;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kIfnwiKIrKjy8l+DtnHC/rUW3Cj13n5h4X8XpNbnkyM=;
 b=ej9kjJ8ZYjGjrfSsxjEYSZi3Xmq+yV1Hhl3o9fIwjQA0d/fGY3bB51fUYri5JZEthn
 ZoVhdLqwsdaLlTdtLxcjFY5Edx0YD893EpwcznGiq5VIVEZvQ8MGGL1sLxGpCLu1iD3E
 bTqusOqaemFNGi5sGiVPm2NJJ8NFkxVcSbX0BbksHtHhsdDc+1LvrsFeXGjWi4Aq5ZoT
 IpoBuuxUXiUihBVZQ5XVXLyR0NRbiFF01T5ZlVqCP4wsSLhB9pMBSVbefsgI30mi4EYM
 BvL9i4MiHnNUwwPWpPtHhBqzxbVYS80MwUDFu316bS/dTMkqcgN41cCyEb2OE2dx46f7
 q8sA==
X-Gm-Message-State: ABy/qLYytA6Rb24isnKlDSnpAwRvbV7btEg5SmJ4ZJlwkuWzfTiGvlVl
 hMfoQmDHMT9ICHXYuTCxNNCr9GnzLDrUDQ==
X-Google-Smtp-Source: APBJJlFIlMpjkQXYR0nTH3B/PW4Nk+MZdj/vRDNt02fMNNjw4O3ddEje19xHCBDCsg9Jr6lvTvK/qA==
X-Received: by 2002:a05:6402:b09:b0:522:c877:568b with SMTP id
 bm9-20020a0564020b0900b00522c877568bmr4935572edb.16.1690978173944; 
 Wed, 02 Aug 2023 05:09:33 -0700 (PDT)
Received: from localhost.localdomain ([78.97.234.98])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a056402139500b005227e53cec2sm8375732edv.50.2023.08.02.05.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 05:09:33 -0700 (PDT)
From: Andrei Coardos <aboutphysycs@gmail.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-iio@vger.kernel.org
Date: Wed,  2 Aug 2023 15:09:15 +0300
Message-Id: <20230802120915.25631-1-aboutphysycs@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 03 Aug 2023 15:58:01 +0000
Cc: lars@metafoo.de, Andrei Coardos <aboutphysycs@gmail.com>,
 mcoquelin.stm32@gmail.com, Alexandru Ardelean <alex@shruggie.ro>,
 jic23@kernel.org
Subject: [Linux-stm32] [PATCH] iio: trigger: stm32-lptimer-trigger: remove
	unneeded platform_set_drvdata()
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

This function call was found to be unnecessary as there is no equivalent
platform_get_drvdata() call to access the private data of the driver. Also,
the private data is defined in this driver, so there is no risk of it being
accessed outside of this driver file.

Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
---
 drivers/iio/trigger/stm32-lptimer-trigger.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iio/trigger/stm32-lptimer-trigger.c b/drivers/iio/trigger/stm32-lptimer-trigger.c
index 2e447a3f047d..df2416e33375 100644
--- a/drivers/iio/trigger/stm32-lptimer-trigger.c
+++ b/drivers/iio/trigger/stm32-lptimer-trigger.c
@@ -92,8 +92,6 @@ static int stm32_lptim_trigger_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	platform_set_drvdata(pdev, priv);
-
 	return 0;
 }
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
