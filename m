Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 714FF366D76
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Apr 2021 16:01:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E91DC58D5C;
	Wed, 21 Apr 2021 14:01:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93C22C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 14:01:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A979661439;
 Wed, 21 Apr 2021 14:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619013660;
 bh=29A7NdsSMfao/ozpDLRWzTLaOL+x/9sHr4gIsv0B3sE=;
 h=From:To:Cc:Subject:Date:From;
 b=BFT/Vgsc5U+2LDBEh9S2JL4tC/mPPkKi7Nx0UNKYzmmujuUeEwu7M/w7cpHoWAYGY
 wTDNRyCbL/Y/++Qmu7SrDWH3FmkVVK0AJ8HTyu82djzAcS/Dxr5YLYgFuL/0o5WXnA
 Ur3vLQdGVJsEryRNQZQ9vnbo6jOyjh1xNEBlOvAgDcDQqsgJyV1SwZeY7F724jJNX4
 T7vO+Qn/Hv7bVAKmmgKAlR98YT6ssef/w1trMub+J/FDf56UvwifkRyr+pyPiMKiEs
 Mb3bTizsctlTSUhbcU9LMKupBGqXf95sV42iV/R/DQOWt/wTVDV3Abw2wFaqBf77GH
 I0yCM+0smte6A==
From: Arnd Bergmann <arnd@kernel.org>
To: Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>
Date: Wed, 21 Apr 2021 16:00:40 +0200
Message-Id: <20210421140053.3727528-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] remoteproc: stm32: fix phys_addr_t format
	string
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

From: Arnd Bergmann <arnd@arndb.de>

A phys_addr_t may be wider than an int or pointer:

drivers/remoteproc/stm32_rproc.c: In function 'stm32_rproc_da_to_pa':
drivers/remoteproc/stm32_rproc.c:583:30: error: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'phys_addr_t' {aka 'long long unsigned int'} [-Werror=format=]
  583 |                 dev_dbg(dev, "da %llx to pa %#x\n", da, *pa);

Print it by reference using the special %pap format string.

Fixes: 8a471396d21c ("remoteproc: stm32: Move resource table setup to rproc_ops")
igned-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/stm32_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 7353f9e7e7af..32595c950569 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -580,7 +580,7 @@ static int stm32_rproc_da_to_pa(struct rproc *rproc,
 			continue;
 
 		*pa = da - p_mem->dev_addr + p_mem->bus_addr;
-		dev_dbg(dev, "da %llx to pa %#x\n", da, *pa);
+		dev_dbg(dev, "da %llx to pa %pap\n", da, pa);
 
 		return 0;
 	}
-- 
2.29.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
