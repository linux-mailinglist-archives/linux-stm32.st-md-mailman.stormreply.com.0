Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 491AE4690AE
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Dec 2021 08:14:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E515AC5F1E8;
	Mon,  6 Dec 2021 07:14:30 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6BD2CFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  4 Dec 2021 14:00:34 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id v11so11962590wrw.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 04 Dec 2021 06:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jRydfW5dCvLP5M5W9G1L390OMoiuU4elPL4v0ocR8GI=;
 b=KfBlGlO8ievFtXcZ7gIBb6tFFJy1t6XUKHG/+LBpAlwkhYzMt4QygssKPV4cSEp9wr
 l8v7mvBYvpnvaoybP7iEBDWWBLj88MUDWtLVwWwcQ7bogU9kgBUFI+blguQoahyTJdwg
 74Gf23L4aIFOZuTq/B+31fc5qrMC4ihUcVyeuE/krOPX/sNL4KgOw1+Dy2+jbc3ejX9W
 ogG1Pj0IrNllvaQB8qIU71LDG/R5LJUxrM3yy7eSbTDwOfk6v3qzNT1X6hgSyftXnqDt
 uqwFaxyaHDbfstTuvUmfoAuxpljnwINbegY+dUs/3NQq5sdMdYBF7MhdfyWTzHX8G7Wm
 Yllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jRydfW5dCvLP5M5W9G1L390OMoiuU4elPL4v0ocR8GI=;
 b=zHhoggtOtPFcBEcJY7W8atJHNd/DyKC0Q9LzlSJlfgWcz2Jph2JxMlzILzW44xe6Pf
 5hNEdue6MYeECupwivTkavtKxijXCvEWLWnCl4T8qvEBH5m1aBmNR9cl69LFGA/5ujaA
 d2hhRnywiwBJET3Gtd0XXrkEjGovecfxLu8EJDYDsBByMg9sEPXT3f57bKRtj0FqgWO8
 NsGI0hLd3QjqpwxmcMyEW361XtdURhPJYqPC6X8J5V8L2V5aVypWgtEZziosVwxnxihJ
 TzyEV6DApnTnM+AKoPkTZj5Ly6r4zhsJC+N2TBgPAQNjz0xKAFZq3O/MrqPl+DsAdYTA
 OnQQ==
X-Gm-Message-State: AOAM533nOaFvTXIoL18QVrGCrkCRfdNflosJ/UktOsirVjbEC6ewXDW0
 w6F6c3J2WJrxyeMZP2LmgO4=
X-Google-Smtp-Source: ABdhPJyp7Kwzh+WrHOuorXsYydzGifWlvVI1GsnYoZkSBQZorTbVIt+cVUlpC6Lv0Xx65iNRHim+7g==
X-Received: by 2002:a05:6000:15c1:: with SMTP id
 y1mr31001064wry.63.1638626434368; 
 Sat, 04 Dec 2021 06:00:34 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id i7sm5593646wro.58.2021.12.04.06.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:00:33 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Sat,  4 Dec 2021 14:00:32 +0000
Message-Id: <20211204140032.548066-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Dec 2021 07:14:28 +0000
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] dmaengine: stm32-mdma: Remove redundant
	initialization of pointer hwdesc
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

The pointer hwdesc is being initialized with a value that is never
read, it is being updated later in a for-loop. The assignment is
redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/dma/stm32-mdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index d30a4a28d3bf..805a449ff301 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -1279,7 +1279,7 @@ static size_t stm32_mdma_desc_residue(struct stm32_mdma_chan *chan,
 				      u32 curr_hwdesc)
 {
 	struct stm32_mdma_device *dmadev = stm32_mdma_get_dev(chan);
-	struct stm32_mdma_hwdesc *hwdesc = desc->node[0].hwdesc;
+	struct stm32_mdma_hwdesc *hwdesc;
 	u32 cbndtr, residue, modulo, burst_size;
 	int i;
 
-- 
2.33.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
