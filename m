Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8FE3C99D1
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jul 2021 09:45:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A15BC597B0;
	Thu, 15 Jul 2021 07:45:04 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38540C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 07:45:01 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso3441693pjp.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 00:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3H3QucrgEfBfWLW7Yv3LB8AXp4eWdNO8XfGBK/bcpzE=;
 b=CMNeH5VmJGRqAXS/AvAllS3PqwdjoJbxCRmngkrH41hiVpIManVkJBv7RzRIotc59k
 UTiQk01o1Ic4WFKMZorhktNbKXCe/RgI5C7WDFV300wVa7yxbcedja4CPygOHIheCvM6
 hVCPn2fo2hZCwLcbnVc871DLrvZy6yjyRE+TbgRbB8FlM0ObnDMKpr950yYASMuFv5+/
 j0Lep5ydcdJ+C3PMJFs7z93zxrhFjBV1iGWmRWWwGxDfOnAQM0/qL21LfMqkIcwQicbr
 Djwwz/9T8zAIJmkm4McKSDWH+sbPRxopa2mHXF0k1VsOqglInOPmVHFhW7Fto1pkFCcE
 hlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3H3QucrgEfBfWLW7Yv3LB8AXp4eWdNO8XfGBK/bcpzE=;
 b=s8nmOD6eVQmzG4ZkaFc4o4WtHOLaWV8U4JleeyFG7dVJCXQPtJeJR4vmhvA0PkLP7y
 Ty1qUGJRzKksfLnpThQAWPbn3rc1MPNycovg2CyZocDy8uNvTU7eKJvqfGbhs/hYdTrj
 34/ffKBAH+EqNXHoDTngp9GSnBKQoIngi303HfHy2bRc+jQSrNH53WWesY0RxpTD+GjS
 MXS4A36LO8G5LHwHab34dGiXx1OECmIKfoOtnWDAMdsCvriVYVYuSHv6H7WNUKyf+MYT
 cRVivE1PWeLQ5UOdjG2csguDqA7ew8i+O2nrxOjTcoD45O+NHyYju84MQSUK/1KhrCKZ
 5FkA==
X-Gm-Message-State: AOAM53321aLAjjVKtmEIOb/c423IxcYGef+hn4Wq2VhC1SIuGtssh9LP
 KIms1sY6zkqrkDJtFJLvFpc=
X-Google-Smtp-Source: ABdhPJxawBhQnz9L11JWFp/HWmMhtlszU/lv3a9P8s3WIDjJRh1wyfft9iOylxGvQ4wocpArZJC9KA==
X-Received: by 2002:a17:90b:1244:: with SMTP id
 gx4mr3067652pjb.192.1626335100159; 
 Thu, 15 Jul 2021 00:45:00 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id t26sm5702039pgu.35.2021.07.15.00.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 00:44:59 -0700 (PDT)
From: menglong8.dong@gmail.com
X-Google-Original-From: zhang.yunkai@zte.com.cn
To: davem@davemloft.net
Date: Thu, 15 Jul 2021 00:45:39 -0700
Message-Id: <20210715074539.226600-1-zhang.yunkai@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Zhang Yunkai <zhang.yunkai@zte.com.cn>, netdev@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH linux-next] net:stmmac: Fix the unsigned
	expression compared with zero
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

From: Zhang Yunkai <zhang.yunkai@zte.com.cn>

WARNING:  Unsigned expression "queue" compared with zero.
Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7b8404a21544..a4cf2c640531 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1699,7 +1699,7 @@ static int init_dma_rx_desc_rings(struct net_device *dev, gfp_t flags)
 	return 0;
 
 err_init_rx_buffers:
-	while (queue >= 0) {
+	do {
 		struct stmmac_rx_queue *rx_q = &priv->rx_queue[queue];
 
 		if (rx_q->xsk_pool)
@@ -1710,11 +1710,7 @@ static int init_dma_rx_desc_rings(struct net_device *dev, gfp_t flags)
 		rx_q->buf_alloc_num = 0;
 		rx_q->xsk_pool = NULL;
 
-		if (queue == 0)
-			break;
-
-		queue--;
-	}
+	} while (queue--);
 
 	return ret;
 }
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
