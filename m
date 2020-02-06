Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0971544C6
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2020 14:22:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74768C36B0B;
	Thu,  6 Feb 2020 13:22:09 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F3ACC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2020 13:22:06 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id d9so2336518plo.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Feb 2020 05:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MMEdhBkwc3vUygsidCCQyAeg+NALFLEwybGyK66dnDM=;
 b=ThufnkVcDU19LYejj+ltE3+1XMcAoY8Q+5t0KjvrkpxTrDaeOXYjjmvDvZN/xss2zg
 c51VN03oWDQJKeGWbijzI7CpMn4Nl1RO0c2uNhdpZURO1rGkaTGV1iXXXzZ1QvutbMy/
 LVSnZCHO4RmjIfUno4drB63Z33CNnlrYz3D/AATMdEg4kyx06lZ8PFkMMpjr3z3WV7/o
 Xq50QheauxttDJWQN971cFp4SWsyZM8Lr+bYDGY2svzGNgyZNzEGW6iPJF9bjJAE56Zo
 Th03yl9mlf985Cb/6oqKI6vrQhaMtcEGDcIAD0cp2d1QEt8m6fMtG1fniOeoygtxEInx
 JHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MMEdhBkwc3vUygsidCCQyAeg+NALFLEwybGyK66dnDM=;
 b=WlkYUbKHk9npYDdpHJc1ikRaD9HASrJ8QvKNR0m8ClGf1fmTBMw0soyxFnmcHXgrYD
 zhuTW87DHzylfZvzUXXbMF3aYNouISDuP0+q8p11CybV7jiefiTTieaksydQrehU7dCB
 PQjvmAx2fxJAGceYDXuJYGN2kI7+E9+IsReNcM8vxHIfVPUksNTJR77Ec5Tx713pEUlY
 iuJnBU61rqtEno97gyfuOA9B4n60rnjL00H2/kz4HTayJUyrrX18VeSYus8U/eNEe0Yk
 l5PYKXF85s7rZlCPkxYwV84SVS2B/wk0Km9vK6WJhEztbkk6iW9TL5b5xfkE+/lFq91M
 wBAA==
X-Gm-Message-State: APjAAAW5zoOZMjUL+tj+ihXimJZIosU9kt99wo4isaLWb9KCo+ew7wKF
 A4A5R9CmWyxeyxCZgPoggOY=
X-Google-Smtp-Source: APXvYqxnin0IXvtlv+L3JlOyDTCqX/MIheUeZ43LFgp9JPOckvDVyoULOK5DJ/d00XhbqGPuQwVrVw==
X-Received: by 2002:a17:902:680c:: with SMTP id
 h12mr3688016plk.102.1580995324525; 
 Thu, 06 Feb 2020 05:22:04 -0800 (PST)
Received: from localhost (104.128.80.227.16clouds.com. [104.128.80.227])
 by smtp.gmail.com with ESMTPSA id f9sm3306849pfd.141.2020.02.06.05.22.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Feb 2020 05:22:04 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: vkoul@kernel.org, peppe.cavallaro@st.com, alexandre.torgue@st.com,
 joabreu@synopsys.com, davem@davemloft.net, mcoquelin.stm32@gmail.com
Date: Thu,  6 Feb 2020 21:21:47 +0800
Message-Id: <20200206132147.22874-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: stmmac: fix a possible endless loop
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

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
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
