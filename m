Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45848CD187
	for <lists+linux-stm32@lfdr.de>; Sun,  6 Oct 2019 13:09:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A5A8C36B0E;
	Sun,  6 Oct 2019 11:09:11 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (us03-smtprelay2.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21D57C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Oct 2019 11:09:09 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F27D2C04C2;
 Sun,  6 Oct 2019 11:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1570360147; bh=LFaf3+7wRgrSGyyxrsz2u9BWasMzLRw65zAzqni4KP0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=LwVvaryBQmGsGWI1yASqXJOnp6B6WcMX2ECJagkeBEtaMISMNaj952xosP+Fdumky
 /ZH4+uALVgk6eoYlpdzzhblyFkL9QNj0YQ6BQZfIwgo94JoeczN3UynFrMpY2gna2m
 y7edTDXI2Sgc0CxfowepcKLrh1kstlhRJsbMLvSkBTKEG3YRaLJb1HBgJE8rNM3nop
 FeNCZ60U5RR8aaHMDn6MKIM913xs1WJdUfXE6l0Jvy1Lx+MaKeZDnFyVv3TFj0OKKP
 8Mc4C5DJyJJjBXCrMKJEzJZhd219nd0UK0h51yPhQzFVGQTUb18x//eEjsWC1+8iZs
 Rg+huqBfsacDA==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id A877FA0069;
 Sun,  6 Oct 2019 11:09:04 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Sun,  6 Oct 2019 13:08:57 +0200
Message-Id: <9ee5ff5b606fb7aceaa2e31a56737378653345ab.1570359800.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570359800.git.Jose.Abreu@synopsys.com>
References: <cover.1570359800.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1570359800.git.Jose.Abreu@synopsys.com>
References: <cover.1570359800.git.Jose.Abreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 3/3] net: stmmac: selftests: Fix L2 Hash
	Filter test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

With the current MAC addresses hard-coded in the test we can get some
false positives as we use the Hash Filtering method. Let's change the
MAC addresses in the tests to be unique when hashed.

Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index ed3926d4471d..e4ac3c401432 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -487,8 +487,8 @@ static int stmmac_filter_check(struct stmmac_priv *priv)
 
 static int stmmac_test_hfilt(struct stmmac_priv *priv)
 {
-	unsigned char gd_addr[ETH_ALEN] = {0x01, 0x00, 0xcc, 0xcc, 0xdd, 0xdd};
-	unsigned char bd_addr[ETH_ALEN] = {0x09, 0x00, 0xaa, 0xaa, 0xbb, 0xbb};
+	unsigned char gd_addr[ETH_ALEN] = {0x01, 0xee, 0xdd, 0xcc, 0xbb, 0xaa};
+	unsigned char bd_addr[ETH_ALEN] = {0x01, 0x01, 0x02, 0x03, 0x04, 0x05};
 	struct stmmac_packet_attrs attr = { };
 	int ret;
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
