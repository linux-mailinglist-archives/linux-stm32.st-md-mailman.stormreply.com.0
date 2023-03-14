Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 382E86B9409
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 13:40:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0784C65E60;
	Tue, 14 Mar 2023 12:40:31 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F15FC65E59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 12:40:30 +0000 (UTC)
Received: from maxwell.localdomain ([109.43.51.107]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MHG4c-1pgRfb1IOW-00DIcr; Tue, 14 Mar 2023 13:39:43 +0100
From: Jochen Henneberg <jh@henneberg-systemdesign.com>
To: netdev@vger.kernel.org
Date: Tue, 14 Mar 2023 13:37:58 +0100
Message-Id: <20230314123759.132521-2-jh@henneberg-systemdesign.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230314123759.132521-1-jh@henneberg-systemdesign.com>
References: <20230314123759.132521-1-jh@henneberg-systemdesign.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:9odOXzVTEt6nET6RlhuEMzaEAU5NfNUV6HWs/su++s+L/5aTzSd
 2U+FGb12WmVeADxMSgj4AoUS69olA6Y9Kqi+kaAIlGBdcnOr8aIQTWSm35+rNDTBjRDVDho
 eNHW/U3NzgInsz4ivdVqmoAVGimlcvOV08kcXmzmia9EAJJvXkgpnldAn3iCMiK2y9zzQ9o
 B/b58yd8mdmj1Sk9DPXaQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/fOfKsvUD+g=;sxxvpWoq14GpQddXVAEZgM/jJdG
 yHR9rVIVtYcQhfVxQeryIFNxqE2xa3liPaImv5X7DGDyJovJMlKl2PUktAIYCOAl1JdUiuRZg
 jCE+lvKP4cY2gf7CEPskk3rw1bEtGEl75ftWcrz6ErR3E1sYEPSccN0fwkazy9o36+IifYr/C
 zagZvmnDAYwGdpl2+9HtVFKx+xhfBRFM5ILGh+dtXSehJ4limnGf/mqUyU3WU9nynsSQQK5iR
 zOn3ljotP68kUNn1oTelWNEoyPZr9ZtY9zGCihw1YG60oAjxF6AuZqDbzB+vVkxBw6SuH22EF
 /vbU3FDdSMeTqRc248H+KSsFX4zj7TijNro2Jc/4D1Gv/QZze/CpuEjA6fizZDPv/nRNitOJw
 ClbGx6tJvw24Ni59fV/V662YQbogO4CUfvc73t3ZtzsEbcJqBAZndyNJCQ46QBZDUIku7rWov
 lks4mV+uFXuy7yfov+pGKToFbq0ATarscX5yru3ZHNwekFd6tCxvljOzgR4vDt4H9qH80aKcG
 OzcB1JUzp4Tnj9Id34dLcGi3s/wjUqvwgbmkK79tQIDzoe01FlFu6VnJfBmnSzSR/vCWVOYDf
 0MOldfeWjXyTw45HxZjkAxUo+bxXpinW5NjIM2tZPvVvbB1kTrx0YZhn4MZ/j1m5jeuVjyedg
 osVLy171KIFp3SyPzFqZy2YTP0+8iFyyCQ+kfGGwrGH6LWYymaJ/OjzuA2apBGl2DPw/anWCM
 wi1pOr75AiL
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Jakub Kicinski <kuba@kernel.org>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/2] net: stmmac: Premature loop
	termination check was ignored
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
