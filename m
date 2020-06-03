Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0491ED61E
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jun 2020 20:29:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA8BAC36B21;
	Wed,  3 Jun 2020 18:29:01 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A5B1C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jun 2020 18:28:58 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id g3so3477497ilq.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jun 2020 11:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3NGIVu2o5ZfD238nU7EioWKtwbHFSnlq8NDGe0k+Ao4=;
 b=k3ilaOYF8Zi0ElPbQJ/D49l1sxfzgbs2aELXse9DU/MINXIppqkdvBI8IRGXkt7qnr
 YYF3d7PfHOOFB+hGrxZ3+xPRdzQU6XMqlx9T38qqrfKVoP64G+ZP4jO5wUMxTHl8sVhS
 cTJIPP/Q/q3qVd/z5hd/6Of2I0zkRaYEO0Z7YG2BOh+yG84ubkHJDtAHlttRRrV18rqD
 6X5ezQCYJ9TFzK4NOjPnaGDjgL1OfSlWRI0KRsAwMaDAIJY0CKKCJmptYGerKyak8Eud
 VNWoH3Z8z2mFwedGksqyvg03pOBIA90ohxYaa7prO8d+ShBZ3ixbSd3YzdNuJUYaEL/3
 qzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3NGIVu2o5ZfD238nU7EioWKtwbHFSnlq8NDGe0k+Ao4=;
 b=sSbXnF749a7d0vUcWfP44TgbhdMANbxvkfx2gueAQKjYp/H96jyfaZB8gTarzWwjq2
 3kqqwkTHKIKM60V82VMsYtkSWW1pHpik3s3GDFkg2KJvmtp9WNQYYe77GFtl+8f9kQqc
 qnDcn9ppFdMkuZ3Pf7CZyvFEz3HHGQ92WWGlc955/HqsaBjW+jaC0YMA5MrzqvxfwD/q
 mNe2rZRcmvhi8ohi2YehJK/L4X02ALU1xeV4l035jYOT5z8NM+k+5R+zOHzEduz8xrYy
 4055GU0ghiG0pMf8tx/wnwdytyLIZ9OjDVfxEk7cmiik76yK4sjA2YEUhuMUgJ3ZC+kX
 azCA==
X-Gm-Message-State: AOAM533FzXewdHWOcWuj/cIdA7yRvnkRMwW1WiBnIqjrNbZOiim6gGUA
 7E7u5uDxQOAb4YhxZvp9ftA=
X-Google-Smtp-Source: ABdhPJxloba1LOqTexHUXjZhHas0R9a8NLk9aQarShAtzLkMpIQM5Zn2/I2esN8JN1+SF46qVDdTtQ==
X-Received: by 2002:a92:5e59:: with SMTP id s86mr843617ilb.104.1591208937224; 
 Wed, 03 Jun 2020 11:28:57 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
 by smtp.googlemail.com with ESMTPSA id y2sm152329ilg.69.2020.06.03.11.28.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 11:28:56 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed,  3 Jun 2020 13:28:50 -0500
Message-Id: <20200603182850.66692-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>, emamd001@umn.edu, kjlu@umn.edu,
 wu000273@umn.edu, smccaman@umn.edu
Subject: [Linux-stm32] [PATCH] dmaengine: stm32-mdma: call pm_runtime_put if
	pm_runtime_get_sync fails
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Calling pm_runtime_get_sync increments the counter even in case of
failure, causing incorrect ref count. Call pm_runtime_put if
pm_runtime_get_sync fails.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/dma/stm32-mdma.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/stm32-mdma.c b/drivers/dma/stm32-mdma.c
index 5469563703d1..79bee1bb73f6 100644
--- a/drivers/dma/stm32-mdma.c
+++ b/drivers/dma/stm32-mdma.c
@@ -1449,8 +1449,10 @@ static int stm32_mdma_alloc_chan_resources(struct dma_chan *c)
 	}
 
 	ret = pm_runtime_get_sync(dmadev->ddev.dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put(dmadev->ddev.dev);
 		return ret;
+	}
 
 	ret = stm32_mdma_disable_chan(chan);
 	if (ret < 0)
@@ -1718,8 +1720,10 @@ static int stm32_mdma_pm_suspend(struct device *dev)
 	int ret;
 
 	ret = pm_runtime_get_sync(dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_sync(dev);
 		return ret;
+	}
 
 	for (id = 0; id < dmadev->nr_channels; id++) {
 		ccr = stm32_mdma_read(dmadev, STM32_MDMA_CCR(id));
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
