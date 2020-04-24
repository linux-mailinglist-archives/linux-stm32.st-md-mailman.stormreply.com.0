Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1D91B8079
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2020 22:25:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D1E8C36B0E;
	Fri, 24 Apr 2020 20:25:10 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EEB0FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 20:25:09 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 18so5338965pfx.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 13:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p2iTWW4nO5SL6In2uagzPcw9ivsY9NbY9ua5sw1Z8YY=;
 b=Xh2v5zI/BaXOCyJfw0q7LclyWcz17VcHHRAtRtzAcWv4MREiZiUr1J57Qh4LJD8BbF
 xVMrr3t30yanDFyJWCs1QAlhVVOPRQE1Ayy8l+zkS5hsvfZBhqo64LotHv+13vShH52s
 wv70aHtI8AK4YzwCCPu1bRvf4t3gI0y3Gg+gu0cfcOukzcvEoZvDZK3qlFeucEIz5Xoa
 p9UPO8xv7uLv96Kr6yUS5T/DFvplz/q3gISrhvhd2RZMX+4ccKZkW0qJpKovw4Wfxlaq
 OsHB6DdRPFDTnyMA+I0y/d1mIUtmQUeUj9fgAF7r7U7fJfvPQXzbE8lz7nSADY6zUtDu
 insA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p2iTWW4nO5SL6In2uagzPcw9ivsY9NbY9ua5sw1Z8YY=;
 b=oN8ToRvKADjZ3bHpKTH62Yp3uIXjSqKVGWQwXdgK2J93EfSnh7GLsbB0L9qyjvqI/a
 0mEpOFA53E9c1dUi74NmB/vMqQhoREmGDursjOIP3ApsTR8nUbkCTmOJPoNa0Dn0QJK4
 tCH2URBa70ThY5Dk2Ymj/+DCV2IiXY5MfrYMb99BXhiThM4+bAvSnhmO6LtVOJaJ0xQF
 4T5KGiZRXIrzBVw8aZDv9LpKNOUFeGrtDUPiNZFUv0Y9OsF4nAb+xUnw6eI1VbELwKVC
 G4y9nm+m1gbNroluZjl4f1bb+pMDXaLYnE07m6f0LWoVOhBg7J0aVqz1PdBAsNjQ1ZQ3
 WDBA==
X-Gm-Message-State: AGi0PubaEAeiRM8Wvi9mLmHg/UEQywqgZze96IhWVPsU708/cbjWbmm1
 vqaBxBIb+R1qY2n/c6I/Fz0zhw==
X-Google-Smtp-Source: APiQypJDYCDbHcowl3s80XHCz3TTRatT6q2ZhtMCaPAqLRA3rMW4yZfkqAlnuY7yy/eBSoya9iCBlw==
X-Received: by 2002:a63:5a50:: with SMTP id k16mr9509922pgm.171.1587759908429; 
 Fri, 24 Apr 2020 13:25:08 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 13:25:08 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Fri, 24 Apr 2020 14:24:54 -0600
Message-Id: <20200424202505.29562-2-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424202505.29562-1-mathieu.poirier@linaro.org>
References: <20200424202505.29562-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 01/12] remoteproc: stm32: Decouple rproc
	from memory translation
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

Remove the remote processor from the process of parsing the memory
ranges since there is no correlation between them.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Loic Pallardy <loic.pallardy@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 0f9d02ca4f5a..91fd59af0ffe 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -127,10 +127,10 @@ static int stm32_rproc_mem_release(struct rproc *rproc,
 	return 0;
 }
 
-static int stm32_rproc_of_memory_translations(struct rproc *rproc)
+static int stm32_rproc_of_memory_translations(struct platform_device *pdev,
+					      struct stm32_rproc *ddata)
 {
-	struct device *parent, *dev = rproc->dev.parent;
-	struct stm32_rproc *ddata = rproc->priv;
+	struct device *parent, *dev = &pdev->dev;
 	struct device_node *np;
 	struct stm32_rproc_mem *p_mems;
 	struct stm32_rproc_mem_ranges *mem_range;
@@ -606,7 +606,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev)
 
 	rproc->auto_boot = of_property_read_bool(np, "st,auto-boot");
 
-	return stm32_rproc_of_memory_translations(rproc);
+	return stm32_rproc_of_memory_translations(pdev, ddata);
 }
 
 static int stm32_rproc_probe(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
