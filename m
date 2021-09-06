Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6017A4016F7
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Sep 2021 09:31:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C9A1C59783;
	Mon,  6 Sep 2021 07:31:07 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D23A5C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Sep 2021 07:21:15 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id e7so3377157plh.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Sep 2021 00:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZIcr/6ZRbqQH3X7ecU0Oevl/GBI2TnFrWp3BjerTV2Y=;
 b=AsMDmlxdiu9IuKWP2c08amvI+a9DnAABdiJxgrfxdTs3xg454ApRz5tVIgXiajwRzT
 2cUeMxseKavGtZeHfTe+Hqy1LNcpigQc4s9InO0Z3IK99Vc2NlYvWoavee6b+cyHRuqj
 5aZbJZKx8Bq8RqRP6rlHunDAwDcFKzimwrGoXXBkBJOa3TeiuqdKVpUr2L4LSSEx3b4B
 q25Gvfs4yoyLVIwwfiSpFJ6z83mxqmaW4NL0WPX7j1/gnz8m3bFKct8ZuSzW8UIQHmim
 Y+xWedbuyR6Xjqe/+YzDFrU719MElgFiObJRV0uxku3y8K7zFQwppY4xqQxnqECs7DWP
 /buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZIcr/6ZRbqQH3X7ecU0Oevl/GBI2TnFrWp3BjerTV2Y=;
 b=ZidUIIYwGS5WanyCYWP9Dqwwsn8ztAgcFkcmaresZXT48ujYl0OeNtouqbulkhLgtu
 FXp8W3BKHlOeLP6dbb7Ii7pWCqfyupMMtOVlaKHx8fPqN8gF9AaWvrwcPST50mwdlfRh
 7eG+PV3S1tYqS8Vht/cD84Rze1Gkywinajg8iR/6Z7gZmGkGJl8TJd6nBk4rk6TyOFo6
 EHPtSqoGInk1scdjzC13RElx7R210ylEHUYNIBeppzXqiFQjMayMxwDgbzUXgDyyVbUW
 EKFaYzxOjQSg0tRd0Nx3WnvVXgpj2QdGpmyYDZa38GouyHZRYKULQNK+92mIS/JJtvLy
 quVQ==
X-Gm-Message-State: AOAM531OKaExECzHLwmS3VvoL5PHhXnlQeCfyy+hLCcgLqPVys5XZlnY
 Fjo98dNK3Lw9zqedhVTf+gA=
X-Google-Smtp-Source: ABdhPJxaJzOu+ptHoWdAA1Zn4x5+cq67cLhzW32kK8JTeRlGIurgTODd4I4W91q9Oabq+DvRwmKxMA==
X-Received: by 2002:a17:90b:4d09:: with SMTP id
 mw9mr11117532pjb.71.1630912873988; 
 Mon, 06 Sep 2021 00:21:13 -0700 (PDT)
Received: from localhost.localdomain ([111.207.172.18])
 by smtp.gmail.com with ESMTPSA id w11sm7890885pgf.5.2021.09.06.00.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 00:21:13 -0700 (PDT)
From: zhaoxiao <long870912@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	mcoquelin.stm32@gmail.com
Date: Mon,  6 Sep 2021 15:21:07 +0800
Message-Id: <20210906072107.10906-1-long870912@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Sep 2021 07:31:05 +0000
Cc: netdev@vger.kernel.org, zhaoxiao <long870912@gmail.com>,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 joabreu@synopsys.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] stmmac: dwmac-loongson:Fix missing return
	value
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

Add the return value when phy_mode < 0.

Signed-off-by: zhaoxiao <long870912@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 4c9a37dd0d3f..ecf759ee1c9f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -109,8 +109,10 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 		plat->bus_id = pci_dev_id(pdev);
 
 	phy_mode = device_get_phy_mode(&pdev->dev);
-	if (phy_mode < 0)
+	if (phy_mode < 0) {
 		dev_err(&pdev->dev, "phy_mode not found\n");
+		return phy_mode;
+	}
 
 	plat->phy_interface = phy_mode;
 	plat->interface = PHY_INTERFACE_MODE_GMII;
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
