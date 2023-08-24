Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5FB7877F1
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Aug 2023 20:33:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 509E1C6B455;
	Thu, 24 Aug 2023 18:33:13 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF9F5C6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 18:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692901990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qzwAY3qfQtSXBG/JoTJUgqmvExN/Fjeet/g8tdk5k1I=;
 b=OuabQIduFRWmgsmAX5ex9bmTFZtO6/MzsO8yb1sKprRVzDAC5Bc5zFSRjYrKZiBUfYLyMA
 HC0aNofWCBezWcr+Kg/hC8EUV+ZnJ0pmWwKxAPGWmxPQBbY2pqZ8+za6BpvkOXMnWGpyrZ
 hEtMRSTU9zYaNGiI6+7yZiy8qE0D+/U=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-SVmgxZJzPDesxkvAXoRV7Q-1; Thu, 24 Aug 2023 14:33:07 -0400
X-MC-Unique: SVmgxZJzPDesxkvAXoRV7Q-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-64b7c2a0d5dso1329926d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 11:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692901987; x=1693506787;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qzwAY3qfQtSXBG/JoTJUgqmvExN/Fjeet/g8tdk5k1I=;
 b=UWV7VW8Q1C72OCjfLPYdvfOsWZ6aIIyTMaUutz0XyUy2x5XG212vEOPYXovlGTCVBO
 oRBi/sJA5r6b/lCreWw1a/OetizByK7/mRt0bkhFJn/zM/NarMYf4LssJDv7Syum4Fn6
 lvA9cs64dYA58Pc6iAIm/LYQkxjjT68q0ITkmMmrEzxWd2pBprLXrlFJOcFDbdr+PFis
 SttRQwy106gyLjz2A0D1e1GJ7r0FSOzVT3SUmhrOkHgV5IxpEICoL2927z+MqbpqukWb
 CP5j9FsVfaVng8a9PhweJZ/7cuxEW5Bcij3UBf5Zdg8PfNWWld055y1JzQbnpjw4e3QS
 S2uw==
X-Gm-Message-State: AOJu0YxVCNlmOmPAQFT5wpMoJs1hrDCsRJj+C6xPZEmrfq5tOZ5xzDN8
 S8ofkhdfgaYrIL1DDQfgoqz17yavITAN6b0RBvjdmD5Z2oDu6M9i3YXwGQfv++XW9JBR4sVwoke
 uqbBUnN4uWh04osbGYTIOuhJkJT+0f0PqJ+L7g4e9
X-Received: by 2002:a0c:cb8a:0:b0:64b:997f:5a73 with SMTP id
 p10-20020a0ccb8a000000b0064b997f5a73mr17312059qvk.0.1692901986873; 
 Thu, 24 Aug 2023 11:33:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0V6Mej9o119R+pmyxj+YFe+lm4pgu3DlavB9TMY9jyVspWXod0xr56aTpa4++K5uMfm7xpg==
X-Received: by 2002:a0c:cb8a:0:b0:64b:997f:5a73 with SMTP id
 p10-20020a0ccb8a000000b0064b997f5a73mr17312048qvk.0.1692901986627; 
 Thu, 24 Aug 2023 11:33:06 -0700 (PDT)
Received: from [192.168.1.165] ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a0ceb11000000b0064f77d37798sm4209qvp.5.2023.08.24.11.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 11:33:06 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Thu, 24 Aug 2023 13:32:58 -0500
MIME-Version: 1.0
Message-Id: <20230824-stmmac-subsecond-inc-cleanup-v1-7-e0b9f7c18b37@redhat.com>
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
Subject: [Linux-stm32] [PATCH net-next 7/7] net: stmmac: Make PTP reference
 clock references more clear
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

ptp_clock is an overloaded term, and in some instances it is used to
represent the clk_ptp_rate variable. Just use that name as it is
clear that it represents the rate of the PTP reference clock.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.h            |  5 +++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 10 +++++-----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index bd607da65037..ba92b10cff0e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -523,8 +523,9 @@ struct stmmac_ops {
 /* PTP and HW Timer helpers */
 struct stmmac_hwtimestamp {
 	void (*config_hw_tstamping) (void __iomem *ioaddr, u32 data);
-	void (*config_sub_second_increment)(void __iomem *ioaddr, u32 ptp_clock,
-					   int gmac4, u32 *sub_second_inc);
+	void (*config_sub_second_increment)(void __iomem *ioaddr,
+					    u32 clk_ptp_rate,
+					    int gmac4, u32 *sub_second_inc);
 	int (*init_systime) (void __iomem *ioaddr, u32 sec, u32 nsec);
 	int (*config_addend) (void __iomem *ioaddr, u32 addend);
 	int (*adjust_systime) (void __iomem *ioaddr, u32 sec, u32 nsec,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index 29fd51bb853d..cc0386ee6dee 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -24,7 +24,7 @@ static void config_hw_tstamping(void __iomem *ioaddr, u32 data)
 }
 
 static void config_sub_second_increment(void __iomem *ioaddr,
-		u32 ptp_clock, int gmac4, u32 *sub_second_inc)
+		u32 clk_ptp_rate, int gmac4, u32 *sub_second_inc)
 {
 	u32 value = readl(ioaddr + PTP_TCR);
 	unsigned long data;
@@ -34,14 +34,14 @@ static void config_sub_second_increment(void __iomem *ioaddr,
 	 * increment to twice the number of nanoseconds of a clock cycle.
 	 * The calculation of the default_addend value by the caller will set it
 	 * to mid-range = 2^31 when the remainder of this division is zero,
-	 * which will make the accumulator overflow once every 2 ptp_clock
+	 * which will make the accumulator overflow once every 2 clk_ptp_rate
 	 * cycles, adding twice the number of nanoseconds of a clock cycle :
-	 * 2 * NSEC_PER_SEC / ptp_clock.
+	 * 2 * NSEC_PER_SEC / clk_ptp_rate.
 	 */
 	if (value & PTP_TCR_TSCFUPDT)
-		data = (2 * NSEC_PER_SEC / ptp_clock);
+		data = (2 * NSEC_PER_SEC / clk_ptp_rate);
 	else
-		data = (NSEC_PER_SEC / ptp_clock);
+		data = (NSEC_PER_SEC / clk_ptp_rate);
 
 	/* 0.465ns accuracy */
 	if (!(value & PTP_TCR_TSCTRLSSR))

-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
