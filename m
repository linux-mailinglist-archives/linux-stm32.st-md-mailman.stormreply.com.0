Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E524596E4F
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Aug 2022 14:19:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A135EC640F1;
	Wed, 17 Aug 2022 12:19:31 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2120C03FEA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Aug 2022 06:43:32 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id bh13so11226460pgb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Aug 2022 23:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=sRtVmdkfpIv+4fJ6hEvE/u1I0caO2Utch477V1tTTSQ=;
 b=B6y6PEJmx2qiyHVQwpLfY35AoW9MxWGQJ/u2Fdo3JL9rOFFAWnxXyBbYVMDi81FG2w
 3mdzEditG26F6zi5AobWEoEv0s1ekpwrTYUlTB6auOqUIf221yaeukYGG3gKPjQlJKkg
 8w+1aHQnBwKW0KrjKliqqFuyk0xL52Kbl7MfJmYaJws3vMA2ur6XLLs+PAA3xNtQO9HL
 pffS/6hQ6SXu4lVcmprqIUYYIOoeWI0+IODFKqPXu44aK+i9VGL4lG7kzMTlKVlCC8WP
 m0ACw/rEN1oVr8aP0CflmraNbcUKJdhZLeHjtLgam2qDV6kcxwv+TVWMWr0rWGo52Nop
 LbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=sRtVmdkfpIv+4fJ6hEvE/u1I0caO2Utch477V1tTTSQ=;
 b=GQk17JgN1yBfuQtuKtskdHiXh4gR4/aIGc6K+Jw33eCwJtxkCl3oCFJc5nlF+Q33DH
 3pzH8STc4v/STWuOTFrfmsDhVmKgm7p+QlPNtNvuZBTAO7DH4DLEzz9c1TNbO3k7prYm
 4p0e+BNBNTasFD7BDMx7TuMScKCCLirwCJqpfDPQtGS6xhv0CPAV16L16Oe08GOzHVdp
 naJHIP3dwVC6hikFxhXwnLx1lP4lklqFzVeJfsRYtOg1XgfUk9Q5XieraXKcQzlYELSK
 o1j8uiD229UEGdQPdfusayPZfckM3Ds61cH2izgNQw9y8mcdoH9H2PuyFJHtI1L5gtUc
 777A==
X-Gm-Message-State: ACgBeo3RUbyzsB6hle4jtQsn7Et5uCzBCV2o9H0+o35CgDm4nrg1wkgP
 FOdVewFhW6wQ523NxMa5qKo=
X-Google-Smtp-Source: AA6agR4jTkQIoWwsu8U7pRmSeejsbdCgNbbKnRMCQNoGEqTjE/Nh2ZtoqZ64ZgAreWV4KR2/j9H0Nw==
X-Received: by 2002:a63:4608:0:b0:41a:617f:e194 with SMTP id
 t8-20020a634608000000b0041a617fe194mr21435137pga.152.1660718611295; 
 Tue, 16 Aug 2022 23:43:31 -0700 (PDT)
Received: from localhost.localdomain (203-74-121-181.hinet-ip.hinet.net.
 [203.74.121.181]) by smtp.gmail.com with ESMTPSA id
 i10-20020a1709026aca00b0016dc240b24bsm568882plt.95.2022.08.16.23.43.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 16 Aug 2022 23:43:30 -0700 (PDT)
From: Wong Vee Khee <veekhee@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed, 17 Aug 2022 14:43:24 +0800
Message-Id: <20220817064324.10025-1-veekhee@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 17 Aug 2022 12:19:30 +0000
Cc: netdev@vger.kernel.org, Kurt Kanzenbach <kurt@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Wong Vee Khee <veekhee@apple.com>
Subject: [Linux-stm32] [net-next v2 1/1] stmmac: intel: remove unused
	'has_crossts' flag
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

From: Wong Vee Khee <veekhee@apple.com>

The 'has_crossts' flag was not used anywhere in the stmmac driver,
removing it from both header file and dwmac-intel driver.

Signed-off-by: Wong Vee Khee <veekhee@apple.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 1 -
 include/linux/stmmac.h                            | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 52f9ed8db9c9..1d96ca96009b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -610,7 +610,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 	plat->int_snapshot_num = AUX_SNAPSHOT1;
 	plat->ext_snapshot_num = AUX_SNAPSHOT0;
 
-	plat->has_crossts = true;
 	plat->crosststamp = intel_crosststamp;
 	plat->int_snapshot_en = 0;
 
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 8df475db88c0..fb2e88614f5d 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -257,7 +257,6 @@ struct plat_stmmacenet_data {
 	u8 vlan_fail_q;
 	unsigned int eee_usecs_rate;
 	struct pci_dev *pdev;
-	bool has_crossts;
 	int int_snapshot_num;
 	int ext_snapshot_num;
 	bool int_snapshot_en;
-- 
2.32.1 (Apple Git-133)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
