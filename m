Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1052070B4DC
	for <lists+linux-stm32@lfdr.de>; Mon, 22 May 2023 08:07:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDEB7C6B45B;
	Mon, 22 May 2023 06:07:25 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12B2BC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 May 2023 11:50:37 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-25367154308so1249984a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 May 2023 04:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684497036; x=1687089036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hQGAuByaIDxbyojHoKmHrl+Nk6GqKopJ1ZhmVD31Npc=;
 b=gunVkUnD7D4jkTN/U/zUqKXL2XEJa5twGkfe4HTgztsK/5C89ynhd6QbT3z7m0Iqfm
 oeqjVPhzJzgc8EamP7G+QEn2+7n+YCbaqDep1azYXCx1SyIpOe27xfSa5xnR96AlLooV
 PzKMYNCtt31yvvz0xAjrReNxyG/QMkCaQY9z0lJg4GZKYDgYRSWkjjuVtw+489YSZCT3
 F8qSGTt7IsVLLjjmjN2LPUcO9kyWDManwqtE79Lk8lXj+ZlchKawFbqlDytge3OCbT+f
 zT8nJ/REBMfCgIMq86rPkcDq7sLstL/WvIK7pUs3nqAqbWrSqne3MOPAYI7cZgT4Hzt0
 /AjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684497036; x=1687089036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hQGAuByaIDxbyojHoKmHrl+Nk6GqKopJ1ZhmVD31Npc=;
 b=VQOZu4J6DNzVDo6RYm3diD0dsRI7eU/QVcYPeevBlAOx61o4q6JproqPp4yUjqZOnV
 bli5+9I21Qxh9tbDMDZ651S4NFECEbD/PcJaNhejc9lSGY0l80V4jm+9G/nckEO8cBRv
 iAAfk+wk6awDDVjFgJOc8pdEfDcVnPSrmS9Yh+KCIKzTVal+fr9TRA2fyGxigBA05fdx
 tkFwN1x1na5GctxpTzsTBq5JOnwfpN54H3n7yhkArxluPzZdmT3MKOh6pMCPsHVMQLuf
 EkKWjxh0cJx9Et2YAnF+/Kyv7JjU6tusuPsoJwplGnmzP7+r8infE51m/ySEEOifo+6e
 saTQ==
X-Gm-Message-State: AC+VfDxJGQefjqWBvv/XS3TP9w0bJOukbVqETgJBGJr7qWihYG9rxgfv
 /3h9IOwOCVHDGUmNH0PCNLs=
X-Google-Smtp-Source: ACHHUZ7pPIhbppvLnQ1vgjftgAajPnjW22pA73/CudJr5YDBYqN2Ag+3yy0FJSQutFhspU/Hkvhegw==
X-Received: by 2002:a17:90a:d513:b0:24d:d377:d1 with SMTP id
 t19-20020a17090ad51300b0024dd37700d1mr1776498pju.45.1684497035724; 
 Fri, 19 May 2023 04:50:35 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-97-28.dynamic-ip.hinet.net.
 [36.228.97.28]) by smtp.gmail.com with ESMTPSA id
 z15-20020a17090a468f00b00250334d97dasm1259507pjf.31.2023.05.19.04.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 04:50:35 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 19 May 2023 19:50:28 +0800
Message-Id: <20230519115030.74493-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 May 2023 06:07:23 +0000
Cc: Simon Horman <simon.horman@corigine.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Min-Hua Chen <minhuadotchen@gmail.com>
Subject: [Linux-stm32] [PATCH v3] net: stmmac: compare p->des0 and p->des1
	with __le32 type values
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

Use cpu_to_le32 to convert the constants to __le32 type
before comparing them with p->des0 and p->des1 (they are __le32 type)
and to fix following sparse warnings:

drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:110:23: sparse: warning: restricted __le32 degrades to integer
drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:110:50: sparse: warning: restricted __le32 degrades to integer

Reviewed-by: Simon Horman <simon.horman@corigine.com>
Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
---

Change since v1:
use cpu_to_le32 to the constants

Change since v2:
remove unnecessary parentheses

---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 13c347ee8be9..ffe4a41ffcde 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -107,7 +107,8 @@ static int dwxgmac2_rx_check_timestamp(void *desc)
 	ts_valid = !(rdes3 & XGMAC_RDES3_TSD) && (rdes3 & XGMAC_RDES3_TSA);
 
 	if (likely(desc_valid && ts_valid)) {
-		if ((p->des0 == 0xffffffff) && (p->des1 == 0xffffffff))
+		if (p->des0 == cpu_to_le32(0xffffffff) &&
+		    p->des1 == cpu_to_le32(0xffffffff))
 			return -EINVAL;
 		return 0;
 	}
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
