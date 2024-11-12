Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A779C9C5413
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2024 11:37:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BD7BC78F7F;
	Tue, 12 Nov 2024 10:37:10 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 242FBC78F77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 10:37:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 056B1A41950;
 Tue, 12 Nov 2024 10:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1245AC4CED7;
 Tue, 12 Nov 2024 10:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731407827;
 bh=gcv43duiZlx3LiKyePNQ3QLqwqId7kWDW/PegWv9o20=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BcuzQBaDCvka7cJavNwqvkZQkLkwdocA4aFbdSevA0WHGWlIpbVCawiOT8vlny9Ip
 0HIdSVmpnOg9lZ67hv8eTmcWn7PxKWGIBLXtJX4xnxRygCmo4MzrH3Deb19iNTfXhY
 DPxKQr7kka2AKiOc28zClQc78eX+aJuOtnMsWE1Tx5gwrTvNlieMMNe4MiJCECmBgc
 jZQCN20Ow5wv27rV6EzFYRQcD7PqarofcyzHuJh282ok9wIEmyJJo2E/jOqEpPtYkY
 cVUCQdVCxF22FTTbn1/YwQvVVapqwCVB+INzGqOxVXqFSh3iYpUpRQyRpDIvLyj7PN
 GAThcyuMpL1Jg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 12 Nov 2024 05:36:33 -0500
Message-ID: <20241112103643.1653381-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112103643.1653381-1-sashal@kernel.org>
References: <20241112103643.1653381-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.60
Cc: Luo Yifan <luoyifan@cmss.chinamobile.com>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, mcoquelin.stm32@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-sound@vger.kernel.org, perex@perex.cz,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 6.6 12/15] ASoC: stm: Prevent
	potential division by zero in stm32_sai_mclk_round_rate()
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

From: Luo Yifan <luoyifan@cmss.chinamobile.com>

[ Upstream commit 63c1c87993e0e5bb11bced3d8224446a2bc62338 ]

This patch checks if div is less than or equal to zero (div <= 0). If
div is zero or negative, the function returns -EINVAL, ensuring the
division operation (*prate / div) is safe to perform.

Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
Link: https://patch.msgid.link/20241106014654.206860-1-luoyifan@cmss.chinamobile.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/stm/stm32_sai_sub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 0acc848c1f004..1b61110cb9174 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -378,8 +378,8 @@ static long stm32_sai_mclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	int div;
 
 	div = stm32_sai_get_clk_div(sai, *prate, rate);
-	if (div < 0)
-		return div;
+	if (div <= 0)
+		return -EINVAL;
 
 	mclk->freq = *prate / div;
 
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
