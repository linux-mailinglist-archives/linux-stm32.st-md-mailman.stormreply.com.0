Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C441545ED
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2020 15:18:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 798F7C36B0B;
	Thu,  6 Feb 2020 14:18:23 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AE77C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2020 14:18:21 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id l3so2820110pgi.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Feb 2020 06:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tlgS5FHChO1CGBWXTjxXUP4mkvuvW/nEiNannwwjUKs=;
 b=C5fKtB+HfWa9s3R1yA90NR/reVyYx5PpUorZVhZhyxP8LEYRU34BddbXV657OB3yVg
 aUlRzqD2KzLwXLEVCEV2isyrS6k/qilnKMlKF28I33QP/ZjF0OEvvCk6DNqGepF+tWEC
 fAVLPs8p1E4iOwgJD29JREWzS7yUUWMev+5XSy3cKElgs81rAePv5maOhZqzv8J+yem8
 6Cr5+xsL9gaZyla9r3zRhJ3V4E3ZvQ8Jq9BBWf6hZUFj6OOPyqcQv8v2ejVF22yVJ5xj
 2qBYjtCInRJIomYHfGtwJKsXnoe/h40K9OfLC7SYR4/SjgjzEjPIMrwVK7cDLZPU/ymu
 oZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tlgS5FHChO1CGBWXTjxXUP4mkvuvW/nEiNannwwjUKs=;
 b=kzeyPpwgiUCgha/wDSiOvZ59oKSeZPucoWqsGVDzQxTDhGE9RhH1fNQ8I5eBRy/rD6
 ePmsJFg8FsHcPEXrFputqR9op09V7YMxxctRkZ3ZC/0GKglJoCYu5MN/zAzKlYmHXIfK
 AgzBOcQQBB532TRrO9ZPH8wcBkAw5ld40CWun83fc56u39zgAdD+jyLCgs8FaomdMASM
 0gRNsDnJx0yUkfG25u4OK6beHNIUjpgDQNIESz575Ofzj6xbg19A3v70yh3lRCu3zvFz
 F9NieIwHuiU38BEjD+9pNEAzd9cJj5Ie3ReDfyICWVv11R0lBvOJxXm/brLYdaK126OT
 N3OQ==
X-Gm-Message-State: APjAAAX5SewAft7lekXkUwG4LeGaS+0kSX02wQNbazrvJcDVHWSCJHu2
 MsKugwlM3Jqy91xq0yWkwjA=
X-Google-Smtp-Source: APXvYqx6YAdoUhb5FnTWPi7Ak9w5qYjmWF1npBNQTFTivhTR5tidkJgtIV0fl6Haso1hJLuMCgwXOA==
X-Received: by 2002:a63:e007:: with SMTP id e7mr3793478pgh.414.1580998699750; 
 Thu, 06 Feb 2020 06:18:19 -0800 (PST)
Received: from localhost (104.128.80.227.16clouds.com. [104.128.80.227])
 by smtp.gmail.com with ESMTPSA id i9sm3656678pfk.24.2020.02.06.06.18.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Feb 2020 06:18:19 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: vkoul@kernel.org, peppe.cavallaro@st.com, joabreu@synopsys.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com, niklas.cassel@linaro.org,
 netdev@vger.kernel.org
Date: Thu,  6 Feb 2020 22:18:11 +0800
Message-Id: <20200206141811.24862-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: Dejin Zheng <zhengdejin5@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2] net: stmmac: fix a possible endless loop
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

It forgot to reduce the value of the variable retry in a while loop
in the ethqos_configure() function. It may cause an endless loop and
without timeout.

Fixes: a7c30e62d4b8 ("net: stmmac: Add driver for Qualcomm ethqos")

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
---

Vinod Koul and David Miller, Thanks for your comments!

V2:
add an appropriate Fixes tag.

 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 7ec895407d23..e0a5fe83d8e0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -413,6 +413,7 @@ static int ethqos_configure(struct qcom_ethqos *ethqos)
 			dll_lock = rgmii_readl(ethqos, SDC4_STATUS);
 			if (dll_lock & SDC4_STATUS_DLL_LOCK)
 				break;
+			retry--;
 		} while (retry > 0);
 		if (!retry)
 			dev_err(&ethqos->pdev->dev,
-- 
2.25.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
