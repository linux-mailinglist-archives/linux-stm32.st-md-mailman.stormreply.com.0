Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 964C596B66E
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 11:22:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AB21C78018;
	Wed,  4 Sep 2024 09:22:52 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB53CC78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2024 09:22:50 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-277f35c01f5so298999fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Sep 2024 02:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725441770; x=1726046570;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l/8+A9ugkeSdUO4d9xUElrWU5gNJWxJ7CSf83sCLP+g=;
 b=YQjogPvDgYB6h1WxsTDSO8GCGWxVARMt7UYgpKV53TrXQREoD56naPbMmDbm8S6qXY
 iQJSkwGf1Ih07HWkZMHbDvk52/FZXgA5Lhahnu9mLBiFqV4DX6SnITnSTTJnM48ddlQ2
 8fSaGHe9DbfBizm76kKRL59lECzrf61SYCsQOqSduKdC0A6wrTQoSi2F1N0GmUuX1D2i
 WouYR8QvNlobl3nwdZx5eVzoVlhnfg8iwREVgJcPs5TD5sl55LxuKI6P54uHCImQMqCM
 YNY0EvFUnxXjVYc7x2l6FHlu8iUhA2QSUZVjhH/AtL1srcNsV+9DEDVAPddVbeZ8MH4W
 OkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725441770; x=1726046570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l/8+A9ugkeSdUO4d9xUElrWU5gNJWxJ7CSf83sCLP+g=;
 b=J+tbi6mwoQKmbTuCRgI5Gcav6gsoRVc6FtH5yKMHMSO3s+QrHL0Pd+ex9xI2jELFh0
 TGXEqMdBuN4uFdVWJlkLemcGMilQz9r9+Ok3XIIOubwK07AzOpRwtlj0+vJMqt4ntelM
 VMqVL+nAdS3TbmGVIlbAlbjC48py3i89aks75xr7JEH2R1e5Gfni1zZ5JgFLkqSakwif
 ZTbhNgJ1GaVDLrEBl/iGwj4AfxOFw4NDBq9rZqcatBZ2hIyma/PqOjRvm13eJ5WHY16n
 Bv0n+8VVtVuMg5WMX15Ox/1RVzaKhlUWyxtfe+N5OOENGg/CTTEDf3sWfYDltovCJBW5
 m8Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeseAEE1NN0nKhJsJ9vTcFtVCHRJyw+e0y+PSYzAcqxbQakBezi+YjHnzFPPBPufDtH5lbwOcZJdBxqg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw6lIxbcDtESE+1DbqdsL3D1Ay7WVI9/Yam1fNofG2jyCsi3cYg
 BiiioZZGQtK514vqelGAORUcBGsYLQ4UUPkB6BFZmfymtgdFfFdI
X-Google-Smtp-Source: AGHT+IHe8i/RMFB93f80fa0xNtf7015I9vsbV2fcKKV9lX2mHFQQLj0Q4XSX8GgljC2ApjpzJdbVjw==
X-Received: by 2002:a05:6871:8c15:b0:277:db7f:cfb2 with SMTP id
 586e51a60fabf-277db7fd4camr9154084fac.14.1725441769759; 
 Wed, 04 Sep 2024 02:22:49 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7177859968csm1232048b3a.146.2024.09.04.02.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 02:22:49 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Wed,  4 Sep 2024 17:21:22 +0800
Message-Id: <3cc959e1ab2e6cc7a4b39d22e34c38df70f01125.1725441317.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725441317.git.0x1207@gmail.com>
References: <cover.1725441317.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 7/7] net: stmmac: silence FPE
	kernel logs
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

ethtool --show-mm can get real-time state of FPE.
Those kernel logs should keep quiet.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index dd9583968962..580c02eaded3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -620,22 +620,22 @@ int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
 
 	if (value & TRSP) {
 		status |= FPE_EVENT_TRSP;
-		netdev_info(dev, "FPE: Respond mPacket is transmitted\n");
+		netdev_dbg(dev, "FPE: Respond mPacket is transmitted\n");
 	}
 
 	if (value & TVER) {
 		status |= FPE_EVENT_TVER;
-		netdev_info(dev, "FPE: Verify mPacket is transmitted\n");
+		netdev_dbg(dev, "FPE: Verify mPacket is transmitted\n");
 	}
 
 	if (value & RRSP) {
 		status |= FPE_EVENT_RRSP;
-		netdev_info(dev, "FPE: Respond mPacket is received\n");
+		netdev_dbg(dev, "FPE: Respond mPacket is received\n");
 	}
 
 	if (value & RVER) {
 		status |= FPE_EVENT_RVER;
-		netdev_info(dev, "FPE: Verify mPacket is received\n");
+		netdev_dbg(dev, "FPE: Verify mPacket is received\n");
 	}
 
 	return status;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
