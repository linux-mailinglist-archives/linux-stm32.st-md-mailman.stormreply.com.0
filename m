Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFFE4D2059
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Mar 2022 19:43:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3629FC60496;
	Tue,  8 Mar 2022 18:43:04 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2C42C60469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Mar 2022 18:43:02 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 n33-20020a05600c3ba100b003832caf7f3aso1855030wms.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Mar 2022 10:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=WPSR5Pt5CyT3sNl2ngwE6qDTVKse5DLOw/U1LDqYMBg=;
 b=W5xLQ/VvKJrQobnASIqIOUeXdu5LvZwL5CZjqip4x2czfPRBmOOle2igTyF5q/P1To
 2Vpat+WamBy8TV67fwXu7DU39Ep47pZUdfCydEmv7JuoS5Gqk+2nz8aya3/ApMuxGLCa
 dYQ3zrlqVzgc236yc2n/vObRV69OiMI0UWJ1CyjIh521pB0+iCZ5VcPPp5kQ7wcU2Ex+
 JcqSx62AmINDi5urIeW1xz4R5+KUvgqtbQEpksKX+PICypBSXf0SYdFQ816hakCpJA7W
 tLGZ+NGP1UbsPG4jbqZygA0VO0RXBTrexH5o0mAj5Rk+/y/l9VMsggXKCMoasthupgVY
 RKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=WPSR5Pt5CyT3sNl2ngwE6qDTVKse5DLOw/U1LDqYMBg=;
 b=2co7/WI4PPR1gz6bqNOz/Pxo6R/v9bONC9LTEI4+3AryfuS9bDdxGVmDv5iPNVoVVZ
 S7aU64mQgs5kfiuYKME+5LafDlmqhFEbuaoTKk8vqEZpjMoo8O4pqvjy5g/CB7GZcH1a
 TKTLCe0QMQ/E2Tm2QYqVCNQNZZXJ/prZvOQvcDIWYoPtv5tRC535ANOensIAAsi4nsgB
 HzZ9bUOE3geQR0nRzUgF4syyXH8QMDqsnMh4L2bKyS+Odk6SWJd+TA3rCRcvsTCumbBl
 g916YP4CeOfPkfDW58DsHFB9ya5cbYa9/GiksX3fcyCk/3jgDciMzQ8hKiJzo/HikjUR
 53aQ==
X-Gm-Message-State: AOAM530F8dWawM+XUC6Bum4fiVIetnauAQSfIPYMJArYd9+igWciLz97
 B3cXOt5embf9hZsTnzmSmbc=
X-Google-Smtp-Source: ABdhPJwssyolF7w+4CyCS2TboMQECwBl9var3nzNWRK0sQ7ZDQ+b8NMYecp6FwF72IxyBfDn1//wVQ==
X-Received: by 2002:a05:600c:4ec7:b0:389:bf36:ce3a with SMTP id
 g7-20020a05600c4ec700b00389bf36ce3amr509566wmq.118.1646764982229; 
 Tue, 08 Mar 2022 10:43:02 -0800 (PST)
Received: from ?IPV6:2a01:c22:7b54:500:3175:f9ac:af86:a778?
 (dynamic-2a01-0c22-7b54-0500-3175-f9ac-af86-a778.c22.pool.telefonica.de.
 [2a01:c22:7b54:500:3175:f9ac:af86:a778])
 by smtp.googlemail.com with ESMTPSA id
 p2-20020a1c7402000000b0038159076d30sm2906185wmc.22.2022.03.08.10.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 10:43:01 -0800 (PST)
Message-ID: <ee685745-f1ab-e9bf-f20e-077d55dff441@gmail.com>
Date: Tue, 8 Mar 2022 19:42:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski
 <kuba@kernel.org>, David Miller <davem@davemloft.net>
From: Heiner Kallweit <hkallweit1@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: switch no PTP HW
 support message to info level
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

If HW doesn't support PTP, then it doesn't support it. This is neither
a problem nor can the user do something about it. Therefore change the
message level to info.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index cf4e077d2..c1bfd89a5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3275,7 +3275,7 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 
 	ret = stmmac_init_ptp(priv);
 	if (ret == -EOPNOTSUPP)
-		netdev_warn(priv->dev, "PTP not supported by HW\n");
+		netdev_info(priv->dev, "PTP not supported by HW\n");
 	else if (ret)
 		netdev_warn(priv->dev, "PTP init failed\n");
 	else if (ptp_register)
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
