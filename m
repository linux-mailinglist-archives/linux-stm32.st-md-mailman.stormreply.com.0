Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4286BC80D
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Mar 2023 09:01:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98C39C69067;
	Thu, 16 Mar 2023 08:01:27 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95674C6904A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Mar 2023 08:01:26 +0000 (UTC)
Received: from maxwell.fritz.box ([109.42.114.157]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MmDZI-1qKbvm25dg-00iGnY; Thu, 16 Mar 2023 09:00:50 +0100
From: Jochen Henneberg <jh@henneberg-systemdesign.com>
To: netdev@vger.kernel.org
Date: Thu, 16 Mar 2023 08:59:39 +0100
Message-Id: <20230316075940.695583-2-jh@henneberg-systemdesign.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316075940.695583-1-jh@henneberg-systemdesign.com>
References: <20230316075940.695583-1-jh@henneberg-systemdesign.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:dJfqpxbCayMr14ZFZm6NMfVkugOqNjZ2iAm1ZLyeMPYoZbW08Lt
 ezIrj1cTZrWHpr2CpztcBtZE2fTekHb3T9QhUeri4Wt8WKnySAuUg4bIcGA3OYMwjl5TL64
 0QebK9E1A+ExosRjclv3CIPLbXK9+nhooxmIW8ybunk1oqJsgFGRQK1GAzfyaMRLRAFm8yL
 vCzKHUO8P58D1wHOkkP5A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JxekeCwxMts=;mYRg07aZUIGOTMgzcF6FhusRbxy
 M5FCszaB2xtyZ6GAMnGLSMOt6OAJxjyt8IDhkBft2C1qNrtLO8JiNNCi+1I37J95xipWG67AR
 YVhdkVd8yZKeP1vGW/rS0AuFg0C+K5hv8077Oj5f0tJFE/7e+J4v78fP0lFlRitsDBCaES3UB
 azH72JkUGe8QPes6XT5PcyAtPl+HqjQmjAnm0ziePShDWyTnR+45nxGbebNI0RQJMzm/aszPb
 OqkxkIPp6l5bTGdlketCVg3cb2WL+cwsqnNk1nppzulJY+y64dqohoHkR3jcwT6MYRI/3ui2y
 cJzbqIT99TPi0IzTSD5SyGXaGyznCPZ2Ed6yNY9szyiBowHVYE/fhwVCGQxU5bdlIstrZAT7y
 yNXYRC3BMIYvJH11MhM5Mnu4pePCxDhP7/jE4btJRDHSi2CZ7fwj1A5+AHtCDoOP6FCMLbA+e
 nL5mIU+Qzh29/wXJzzsO3xszYy1UcoKyPHvUSh7DA87aB9iTG95h8u52PW/ERA4A/X3F1TRoU
 lIuVzjibAk+f12wXUdWaYNAw3NTVcK7Oq2tgEzMDcQ8Cvq3w04PANYHRjFMKrZYrZ3vqykYyS
 n4HQdHo/CS2ogo8C5rCvwI7pOvcDyRZKXV1VQXL3RuoD89OTJUDcmGBIh7/diwb7LiUp9ctaU
 lKt0aFx3mBJkkegvRrwxgpb6/5T5L18D6canc0/qjA==
X-Topics: 
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net V2 1/2] net: stmmac: Premature loop
	termination check was ignored on rx
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

The premature loop termination check makes sense only in case of the
jump to read_again where the count may have been updated. But
read_again did not include the check.

Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
Signed-off-by: Jochen Henneberg <jh@henneberg-systemdesign.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index e4902a7bb61e..ea51c7c93101 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5221,10 +5221,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			len = 0;
 		}
 
+read_again:
 		if (count >= limit)
 			break;
 
-read_again:
 		buf1_len = 0;
 		buf2_len = 0;
 		entry = next_entry;
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
