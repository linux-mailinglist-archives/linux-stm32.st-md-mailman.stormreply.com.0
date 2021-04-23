Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B65D369030
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Apr 2021 12:18:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92CF5C57B54;
	Fri, 23 Apr 2021 10:18:20 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F916C57195
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 10:18:19 +0000 (UTC)
Received: from mail-wr1-f71.google.com ([209.85.221.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lZst8-0001aV-Es
 for linux-stm32@st-md-mailman.stormreply.com; Fri, 23 Apr 2021 10:18:18 +0000
Received: by mail-wr1-f71.google.com with SMTP id
 h60-20020adf90420000b029010418c4cd0cso14055590wrh.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Apr 2021 03:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aYP7r7LEZu6SffM7BQ/kCnDNHMdX1uJGOUnQwrtupd4=;
 b=nZuXv5GU3jHBJLDTT51H+ElVEELULp/V3SPAuIPHCqkXEqLiMs/d+ydNsKV3fC20mN
 IvNxjDOhPcYBeFVmyuMGq2c3FwF3hD54BdNnnNcXfNfXwD4t5Gau/LI0GYrsz4fRQvDz
 LupmFIFd9m/QdltsuE6KYvX/8NWDseCSLmpFbMnFeBG/tOtBT0GXCP+gWvJJyr5vxEMx
 3koe5GOhsCzMr8jE3mpwt9Wp0zWSqiUCeYYM8nXHmtBa5ByvoXxtwhbZewOawDVrGiNK
 xoaGNEkWjmN6R/CFGnSoxoul7aDD3Gt/ZqXCUH06NzLq9knYFkJu5fCj6JfvBVFTDhC1
 CcMw==
X-Gm-Message-State: AOAM532onycB3VT3Ea8DM8PyPGgheN3sJsM8jKx2fq1eGze3DWN0Vc2L
 1KSuUSdlYBsJ2OZPuG7W9nn+lwWbhrKGOCPn9BaLJx5q5j04ORHTdNMRFM0CCtcMkRpJUD6dkoU
 LPjvx2Pj6qcdSwm2opUYytTAL57WjObq+9cXxHCjKcz8EtEEbZPCy/IafVg==
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr3621886wrq.321.1619173098077; 
 Fri, 23 Apr 2021 03:18:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYKHJDOkDZqAUM3Wgbi5Urcq0uh3Bk7tH9x1MWtycNV6cQpV4aktMYKexZVqRVW2OoCmZ6Xw==
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr3621863wrq.321.1619173097904; 
 Fri, 23 Apr 2021 03:18:17 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch.
 [188.155.180.75])
 by smtp.gmail.com with ESMTPSA id k22sm9011546wrh.5.2021.04.23.03.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 03:18:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Fri, 23 Apr 2021 12:18:14 +0200
Message-Id: <20210423101815.119341-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Linux-stm32] [PATCH 1/2] memory: stm32-fmc2-ebi: add missing
	of_node_put for loop iteration
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

Early exits from for_each_available_child_of_node() should decrement the
node reference counter.  Reported by Coccinelle:

  drivers/memory/stm32-fmc2-ebi.c:1046:1-33: WARNING:
    Function "for_each_available_child_of_node" should have of_node_put() before return around line 1051.

Fixes: 66b8173a197f ("memory: stm32-fmc2-ebi: add STM32 FMC2 EBI controller driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/memory/stm32-fmc2-ebi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/memory/stm32-fmc2-ebi.c b/drivers/memory/stm32-fmc2-ebi.c
index 4d5758c419c5..ffec26a99313 100644
--- a/drivers/memory/stm32-fmc2-ebi.c
+++ b/drivers/memory/stm32-fmc2-ebi.c
@@ -1048,16 +1048,19 @@ static int stm32_fmc2_ebi_parse_dt(struct stm32_fmc2_ebi *ebi)
 		if (ret) {
 			dev_err(dev, "could not retrieve reg property: %d\n",
 				ret);
+			of_node_put(child);
 			return ret;
 		}
 
 		if (bank >= FMC2_MAX_BANKS) {
 			dev_err(dev, "invalid reg value: %d\n", bank);
+			of_node_put(child);
 			return -EINVAL;
 		}
 
 		if (ebi->bank_assigned & BIT(bank)) {
 			dev_err(dev, "bank already assigned: %d\n", bank);
+			of_node_put(child);
 			return -EINVAL;
 		}
 
@@ -1066,6 +1069,7 @@ static int stm32_fmc2_ebi_parse_dt(struct stm32_fmc2_ebi *ebi)
 			if (ret) {
 				dev_err(dev, "setup chip select %d failed: %d\n",
 					bank, ret);
+				of_node_put(child);
 				return ret;
 			}
 		}
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
