Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B48F7877E3
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Aug 2023 20:33:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6CB0C6B454;
	Thu, 24 Aug 2023 18:33:02 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E9FAC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 18:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692901980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6MSPeUOmvEq1eUUgwQ2syHQsuZQFtArlwfrE4/FiNFk=;
 b=MlFwLBFWJG6gjowEuFQCKNzg9JVCfTrGVQgaLU9iWtUcx6YAE/byFaQzduOJ8eq40QIEYL
 U/y0CXWakzmuxFykx5wNhtp3oMCy2S8oRXjdu3RVAivM0dool/YSaTvV8BBqzgr5cK+w9N
 7K5vl69YJnVD4EVnYD3wg5otyWehKKg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-H8-2CimwMsOZmO9xbPk17Q-1; Thu, 24 Aug 2023 14:32:59 -0400
X-MC-Unique: H8-2CimwMsOZmO9xbPk17Q-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6491907dba4so2022296d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 11:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692901979; x=1693506779;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6MSPeUOmvEq1eUUgwQ2syHQsuZQFtArlwfrE4/FiNFk=;
 b=EaiylSirlsiiFnKXjRFE3KMtMGo+HNePUE8AlXAJuRt7mTpPv25rA9jb2t504muqlX
 3Tz1cTN5H5w1taW/Wwz5wRFLHmLtN17O8WaPO5D9Gs/hu/K95ZGONTcKrB6Fnq7VEubL
 68cbLPIr0rRNTIswGzPmnUasuTlq5w3AW8lLgSgmK9nGgbH5wLhlAcoDadOCpOJUhiBs
 JgZsRquzDpCOlr/7C/XfcrI1K2fX0aXFuMEPNJpLqb+5RZYWA/a3Z5PGhayyzlo5RlEw
 yBFFsGGEmw6Ebk+FjQ28OexZHSoJryWldgyvqLO8Fy63TGVIwKlFnTEMWij76d6on/0A
 C8sw==
X-Gm-Message-State: AOJu0Yz/62JhaaKEcxF8A5R4QfZ1AgD/LHhQNVGl1y5DzQvyH89qrQQu
 xVfUn681wZesUhBDl15qpdPBWPu/zKCl0oKHUi0hgPN0y1xirH6iWVsJGpJsfXyLvzxcCg0SVOn
 aLCltmKtknyGmIL3GVgtbx7A1JSGdLgZsAJXDwJDN
X-Received: by 2002:a0c:e246:0:b0:647:2653:bcc with SMTP id
 x6-20020a0ce246000000b0064726530bccmr18915145qvl.13.1692901978978; 
 Thu, 24 Aug 2023 11:32:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOnxZtOm4Zbo/1b64keu9y2z8jyW5dWXMkNKbfmN/AXxPf8v016bCHVXCzjBnQUDUxKTav6w==
X-Received: by 2002:a0c:e246:0:b0:647:2653:bcc with SMTP id
 x6-20020a0ce246000000b0064726530bccmr18915120qvl.13.1692901978737; 
 Thu, 24 Aug 2023 11:32:58 -0700 (PDT)
Received: from [192.168.1.165] ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a0ceb11000000b0064f77d37798sm4209qvp.5.2023.08.24.11.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 11:32:58 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Thu, 24 Aug 2023 13:32:52 -0500
MIME-Version: 1.0
Message-Id: <20230824-stmmac-subsecond-inc-cleanup-v1-1-e0b9f7c18b37@redhat.com>
References: <20230824-stmmac-subsecond-inc-cleanup-v1-0-e0b9f7c18b37@redhat.com>
In-Reply-To: <20230824-stmmac-subsecond-inc-cleanup-v1-0-e0b9f7c18b37@redhat.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>
X-Mailer: b4 0.12.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: netdev@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 1/7] net: stmmac: Use consistent
 variable name for subsecond increment
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

Subsecond increment is the name of the field being programmed.
Let's stop using a bunch of variations of that name and just
use sub_second_inc throughout.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.h            |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c |  6 +++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 10 +++++-----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 238f17c50a1e..bd607da65037 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -524,7 +524,7 @@ struct stmmac_ops {
 struct stmmac_hwtimestamp {
 	void (*config_hw_tstamping) (void __iomem *ioaddr, u32 data);
 	void (*config_sub_second_increment)(void __iomem *ioaddr, u32 ptp_clock,
-					   int gmac4, u32 *ssinc);
+					   int gmac4, u32 *sub_second_inc);
 	int (*init_systime) (void __iomem *ioaddr, u32 sec, u32 nsec);
 	int (*config_addend) (void __iomem *ioaddr, u32 addend);
 	int (*adjust_systime) (void __iomem *ioaddr, u32 sec, u32 nsec,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index 540f6a4ec0b8..6dcf8582a70e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -24,7 +24,7 @@ static void config_hw_tstamping(void __iomem *ioaddr, u32 data)
 }
 
 static void config_sub_second_increment(void __iomem *ioaddr,
-		u32 ptp_clock, int gmac4, u32 *ssinc)
+		u32 ptp_clock, int gmac4, u32 *sub_second_inc)
 {
 	u32 value = readl(ioaddr + PTP_TCR);
 	unsigned long data;
@@ -56,8 +56,8 @@ static void config_sub_second_increment(void __iomem *ioaddr,
 
 	writel(reg_value, ioaddr + PTP_SSIR);
 
-	if (ssinc)
-		*ssinc = data;
+	if (sub_second_inc)
+		*sub_second_inc = data;
 }
 
 static void hwtstamp_correct_latency(struct stmmac_priv *priv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7a9bbcf03ea5..67e4f65f0f68 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -836,7 +836,7 @@ int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags)
 {
 	bool xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
 	struct timespec64 now;
-	u32 sec_inc = 0;
+	u32 sub_second_inc = 0;
 	u64 temp = 0;
 
 	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp))
@@ -848,16 +848,16 @@ int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags)
 	/* program Sub Second Increment reg */
 	stmmac_config_sub_second_increment(priv, priv->ptpaddr,
 					   priv->plat->clk_ptp_rate,
-					   xmac, &sec_inc);
-	temp = div_u64(1000000000ULL, sec_inc);
+					   xmac, &sub_second_inc);
+	temp = div_u64(1000000000ULL, sub_second_inc);
 
 	/* Store sub second increment for later use */
-	priv->sub_second_inc = sec_inc;
+	priv->sub_second_inc = sub_second_inc;
 
 	/* calculate default added value:
 	 * formula is :
 	 * addend = (2^32)/freq_div_ratio;
-	 * where, freq_div_ratio = 1e9ns/sec_inc
+	 * where, freq_div_ratio = 1e9ns/sub_second_inc
 	 */
 	temp = (u64)(temp << 32);
 	priv->default_addend = div_u64(temp, priv->plat->clk_ptp_rate);

-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
