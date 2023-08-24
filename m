Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B34C7877E5
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Aug 2023 20:33:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E651DC6B47D;
	Thu, 24 Aug 2023 18:33:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E690C6B455
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 18:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692901982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=thxHPyqpXjBOV26mQw4932uoaf4t0NSsG4y7+rk0Hj4=;
 b=gYa4tBS4f5oK40bQR6hGQM5vJLmEyh8YfSRCxWo7/SisVwV7IL6LzmSJq1wpMePpaiMyMI
 K28ti6ALn5+5ZkQdm2zixodxGQbSWe8upww+yk2k9u9jC3631LZJ8Z1DmAQipP/yvO86sU
 GBgMKvO94M7BslCERBd7ycU6m0d7WkY=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-M2jR2ebRNiSx-beYRxWh7Q-1; Thu, 24 Aug 2023 14:33:00 -0400
X-MC-Unique: M2jR2ebRNiSx-beYRxWh7Q-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1c0ed186cf5so110009fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 11:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692901980; x=1693506780;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=thxHPyqpXjBOV26mQw4932uoaf4t0NSsG4y7+rk0Hj4=;
 b=DoKaJlLfECQyRzBoPUMXeabVOlRshs81tmbBjT/Jek26Q8zZAuFOqDBws/EsQ4KWIy
 OY469WDfqI+UFAsURAoQd7LiQEFWu/TZg5URFYcqNSmGr+e6rQ/JJuV+/6W117y1bwJO
 f586/UNcqX95W9cohcUECDf+5mGkSlv4yBOuCOkor0OT4x45czgAwDi8r1mA0JFLvfsM
 B8SI4y7A24N68J2hwxqbowls0XK8nWRP3lniCjfdBV98TqRxBCgOs/s4iIspu0wRQV0a
 IFoDFitsjbdARSaS05pJjK7IpLaXp5+HCN9vKZXlza0UvW/Zwg0bcYuO2D6m5FdvtB8c
 N93w==
X-Gm-Message-State: AOJu0YwLZRD24hdA+h7YCq0QZRz60SfwvMtWfP2IAuqNey3HlEuCwsny
 vZdwNIjFV3CtNL2TWCb0t48/uFph5q0c0DHHSf+QLRqg9wBUgEesfVlQqKBTF1gF3FE5j5LjW9f
 ETuN/TgVMjrT7Ml1TiWuQGFJEkOXTpxh1LtBfYtr7
X-Received: by 2002:a05:6870:b30e:b0:1c8:b870:4e62 with SMTP id
 a14-20020a056870b30e00b001c8b8704e62mr553971oao.52.1692901980218; 
 Thu, 24 Aug 2023 11:33:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNSmaNfEZS7WL931iN10lI15Wz+1s4J2mbWyoGTTDkdpLqrEtuCwFnkDMpqeyKk0MWFoSBXQ==
X-Received: by 2002:a05:6870:b30e:b0:1c8:b870:4e62 with SMTP id
 a14-20020a056870b30e00b001c8b8704e62mr553945oao.52.1692901979913; 
 Thu, 24 Aug 2023 11:32:59 -0700 (PDT)
Received: from [192.168.1.165] ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a0ceb11000000b0064f77d37798sm4209qvp.5.2023.08.24.11.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 11:32:59 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Thu, 24 Aug 2023 13:32:53 -0500
MIME-Version: 1.0
Message-Id: <20230824-stmmac-subsecond-inc-cleanup-v1-2-e0b9f7c18b37@redhat.com>
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
Subject: [Linux-stm32] [PATCH net-next 2/7] net: stmmac: Use NSEC_PER_SEC
 for hwtstamp calculations
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

This makes it more clear what unit conversions are happening.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 6 +++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index 6dcf8582a70e..29fd51bb853d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -36,12 +36,12 @@ static void config_sub_second_increment(void __iomem *ioaddr,
 	 * to mid-range = 2^31 when the remainder of this division is zero,
 	 * which will make the accumulator overflow once every 2 ptp_clock
 	 * cycles, adding twice the number of nanoseconds of a clock cycle :
-	 * 2000000000ULL / ptp_clock.
+	 * 2 * NSEC_PER_SEC / ptp_clock.
 	 */
 	if (value & PTP_TCR_TSCFUPDT)
-		data = (2000000000ULL / ptp_clock);
+		data = (2 * NSEC_PER_SEC / ptp_clock);
 	else
-		data = (1000000000ULL / ptp_clock);
+		data = (NSEC_PER_SEC / ptp_clock);
 
 	/* 0.465ns accuracy */
 	if (!(value & PTP_TCR_TSCTRLSSR))
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 67e4f65f0f68..ba38ca284e26 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -849,7 +849,7 @@ int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags)
 	stmmac_config_sub_second_increment(priv, priv->ptpaddr,
 					   priv->plat->clk_ptp_rate,
 					   xmac, &sub_second_inc);
-	temp = div_u64(1000000000ULL, sub_second_inc);
+	temp = div_u64(NSEC_PER_SEC, sub_second_inc);
 
 	/* Store sub second increment for later use */
 	priv->sub_second_inc = sub_second_inc;

-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
