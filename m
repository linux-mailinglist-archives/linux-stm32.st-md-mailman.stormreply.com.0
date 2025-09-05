Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66008B45D72
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Sep 2025 18:06:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3BD7C35E2E;
	Fri,  5 Sep 2025 16:06:54 +0000 (UTC)
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 415C7C36B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Sep 2025 16:06:53 +0000 (UTC)
Received: from [192.168.2.102] (213.87.137.226) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 5 Sep
 2025 19:06:50 +0300
Message-ID: <58116e65-1bca-4d87-b165-78989e1aa195@omp.ru>
Date: Fri, 5 Sep 2025 19:06:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
X-Originating-IP: [213.87.137.226]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 09/05/2025 15:43:06
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 196074 [Sep 05 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 66 0.3.66
 fc5dda3b6b70d34b3701db39319eece2aeb510fb
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 127.0.0.199:7.1.2; omp.ru:7.1.1
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.137.226
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/05/2025 15:46:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/5/2025 1:33:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
Cc: linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: prevent division by 0 in
 stmmac_init_tstamp_counter()
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

In stmmac_init_tstamp_counter(), the sec_inc variable is initialized to 0,
and if stmmac_config_sub_second_increment() fails to set it to some non-0
value, the following div_u64() call would cause a kernel oops (because of
the divide error exception).  Let's check sec_inc for 0 before dividing by
it and just return -EINVAL if so...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Fixes: df103170854e ("net: stmmac: Avoid sometimes uninitialized Clang warnings")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
The patch is against the master branch of Linus Torvalds' linux.git repo.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |    2 ++
 1 file changed, 2 insertions(+)

Index: linux/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
===================================================================
--- linux.orig/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ linux/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -817,6 +817,8 @@ int stmmac_init_tstamp_counter(struct st
 	stmmac_config_sub_second_increment(priv, priv->ptpaddr,
 					   priv->plat->clk_ptp_rate,
 					   xmac, &sec_inc);
+	if (!sec_inc)
+		return -EINVAL;
 	temp = div_u64(1000000000ULL, sec_inc);
 
 	/* Store sub second increment for later use */
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
