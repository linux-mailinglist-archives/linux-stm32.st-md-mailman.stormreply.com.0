Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE0F154817
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2020 16:30:15 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 496F0C36B0B;
	Thu,  6 Feb 2020 15:30:15 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0DFD4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2020 15:30:12 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id t14so2479379plr.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Feb 2020 07:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yvImeWdanhuXuKTpYgc+fUvWT1XXGf47f3QA3cS1IIo=;
 b=rFy8JI1vDm33O8mChanZAaw9Ljfkv2cbVdDfPeB6ygWnADagveeIi5z8zmtsfjhtXk
 tX/Hcd+yx6frFoD5raNVuvjk/3vnNIdFDP7R8yiJy2CxUbmqvk6e7GJoqIFIg2Byj4EA
 XMSjcshvC9HFUwkmuc2dZP0x5lfcWssoZVFuunuHnSZEuTX5HfAQzUJjQIz+PQPbmwz8
 GKRiviOt/4ZkcDTyuXqcrq3xuyinxw/KC2HxZAzjL+V+pTp1uHOJC7Tv01vRNfCYGtkK
 4ATt7SzL7W7MvrYlowHvzlAmdqN+Y6UxmRwxpRZcHWZMlv4o6zEfEhISBxlAbX5xTxcC
 dOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yvImeWdanhuXuKTpYgc+fUvWT1XXGf47f3QA3cS1IIo=;
 b=O8ERhAKmhenKqqvjh8Bw2xj2hprALfvR26ceRWexx5rejTPz4K5JGi4voowFVDL+jl
 JxwKgiIibphl/h1dyXBtHOSVA1jSOEfcriNkePcORjXjp5bbM7KRV6QiJPObUebjWtoo
 LK3E8e1sISGf4+p6bpuM1TnFwXTb7jr1D7wnwX7Wf9rsd5b0oyu6XqkmdeIB+ZPtzYj+
 ukT5dEYpdbwZMRDssA7ru8wt3deqQb3gQAGvU96JBxxwfMSr3bLhkMYoZ2eX1UC8hHBx
 Z+paNKnsRqwJicyFEuApLJqzWg0SAOnFvWdQo63NEVXfGxAu23XkHlCC04bv7mwLA4zs
 RB+w==
X-Gm-Message-State: APjAAAWx5UUvjwySlUEtqMrStA8J5fKKs1aWdn6IU0hU4k8FrAiiPypb
 7PI7G5jBmlgq0QCCplHBAyE=
X-Google-Smtp-Source: APXvYqzpVmwc8UDf4PLytIuzNQu7ecLLGVgM3QijN3zs88b3yKr+R6UlvDt1Mn1NA3D4q/iXZ4uqmA==
X-Received: by 2002:a17:90a:2ec5:: with SMTP id
 h5mr5063197pjs.79.1581003011165; 
 Thu, 06 Feb 2020 07:30:11 -0800 (PST)
Received: from localhost (104.128.80.227.16clouds.com. [104.128.80.227])
 by smtp.gmail.com with ESMTPSA id f43sm3879247pje.23.2020.02.06.07.30.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Feb 2020 07:30:10 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: vkoul@kernel.org, peppe.cavallaro@st.com, alexandre.torgue@st.com,
 joabreu@synopsys.com, davem@davemloft.net, mcoquelin.stm32@gmail.com,
 niklas.cassel@linaro.org, netdev@vger.kernel.org
Date: Thu,  6 Feb 2020 23:29:17 +0800
Message-Id: <20200206152917.25564-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: Dejin Zheng <zhengdejin5@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3] net: stmmac: fix a possible endless loop
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

Hi David, I'm so sorry for that.

v3:
remove an empty line between Fixes and other tags.

v2:
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
