Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2801B5EE955
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Sep 2022 00:24:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE27BC640E7;
	Wed, 28 Sep 2022 22:24:46 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2EB2C63327
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 22:24:45 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id x18so21846439wrm.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 15:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=tOCqao0F0QwSSCGrvEuCDfM8iTqn8ZX98V4N0X8hr3Y=;
 b=XScKVakNg/IrTdv6P6I92z+G9E2jmAA/hory7em/M8GNMUaNnGu22NDfC3NM21+dSo
 EdpCCD5iO0ddI6UiA2j9EtpLRkPYu53XYy/VaLyi9uefs/XXLc9u6wDNLWwDwH1xfCEW
 JbhX97lZ1ssGGLQD735t6HtopU35eXou3UoCFHsP49WjyMOVtIUkq5w7+ig369HovQpa
 azVWKjXdDnyimh3jZvy0HrX8rZ1sBYqceAK82tY64CzOurwCMNy7v+4UKACfCihuARdz
 9YMt5WlB20cixH1o6i4vi1eYhqfm5ySzUC6GxnXPSwjcKKaLVMzOnbDPNX5cKVaKbDrH
 fRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=tOCqao0F0QwSSCGrvEuCDfM8iTqn8ZX98V4N0X8hr3Y=;
 b=3ft93etG9Liu/zOvVx6HPntgdIWIXfP2oXytjFCSMUT7UZjCniI9uorrclCSKfMa5M
 CxRJ8aSuSVvxKs4wGtYU82ybWBN4jpcYAOyta7uQ2DhesucokyDQzoj6VTTAuefAVSSX
 zfNIS2CKTvfwKd+MEZLDuNteowg3S8cVhx5Nh5/dbK5CGTaIOWO5yWcBQUpnw+nV2Vc3
 PEwvZg1E1F6gCpr9RBw7ilH8tc96WlO0BoF9ZARCI7jle24Kko698fvMiJJbW0hnH78f
 nzMX2xdSrpX18DaSzTtQZBCPrIfCIsoKRvO5sZTYezAV1wNhBCcZ59P7HHFd0bN3Hyzm
 z7vw==
X-Gm-Message-State: ACrzQf3mgkcYHU/79K5U0OTVHd5utlaWA9F14w9Ip1HR/OGXLA13u2hp
 HCNgHPRwdr6YYHf3Nsrhy/k=
X-Google-Smtp-Source: AMsMyM6Dx3qK/uOKDRkcxuP3IeSlkDVMCFpOi2jj5uBMViSsDQ+R61gatBIT/3Zw/8lMBGlFnvacSQ==
X-Received: by 2002:a05:6000:10d2:b0:228:d60b:6d5a with SMTP id
 b18-20020a05600010d200b00228d60b6d5amr41346wrx.146.1664403885112; 
 Wed, 28 Sep 2022 15:24:45 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 k1-20020a056000004100b00228dbf15072sm585114wrx.62.2022.09.28.15.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 15:24:44 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nicolas Toromanoff <nicolas.toromanoff@foss.st.com>,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 28 Sep 2022 23:24:43 +0100
Message-Id: <20220928222443.68705-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] crypto: stm32 - Fix spelling mistake "wite"
	-> "write"
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

There are a couple of spelling mistakes in dev_err messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/crypto/stm32/stm32-cryp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
index 59ef541123ae..59638dfce573 100644
--- a/drivers/crypto/stm32/stm32-cryp.c
+++ b/drivers/crypto/stm32/stm32-cryp.c
@@ -1400,7 +1400,7 @@ static void stm32_cryp_irq_write_ccm_padded_data(struct stm32_cryp *cryp)
 	/* wait end of process */
 	err = stm32_cryp_wait_output(cryp);
 	if (err) {
-		dev_err(cryp->dev, "Timeout (wite ccm padded data)\n");
+		dev_err(cryp->dev, "Timeout (write ccm padded data)\n");
 		return stm32_cryp_finish_req(cryp, err);
 	}
 
@@ -1440,7 +1440,7 @@ static void stm32_cryp_irq_write_ccm_padded_data(struct stm32_cryp *cryp)
 	/* h) wait for completion */
 	err = stm32_cryp_wait_busy(cryp);
 	if (err)
-		dev_err(cryp->dev, "Timeout (wite ccm padded data)\n");
+		dev_err(cryp->dev, "Timeout (write ccm padded data)\n");
 
 	/* i) run the he normal Final phase */
 	stm32_cryp_finish_req(cryp, err);
-- 
2.37.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
