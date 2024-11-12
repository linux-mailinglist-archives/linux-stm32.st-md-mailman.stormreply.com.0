Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED84B9C5425
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2024 11:38:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6DEDC78F80;
	Tue, 12 Nov 2024 10:38:15 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 797C0C78F80
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 10:38:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 75F8DA41970;
 Tue, 12 Nov 2024 10:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C85C4CECD;
 Tue, 12 Nov 2024 10:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731407893;
 bh=gQlW2cwXESWjdYBxHe3WgqAb0ars9D3QYrkWX2iMrJk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dFKvp9cEMeavg+1yXZ6Yx4xRdS48tciq7FIX1ikoTWlNkwf1h5WoLNDxko2RFzWle
 ULFfnyQVpmO7wz1qsUjZF2cWbOH9z5Q6RE5yugwRqe4Ba7gqgXMOhIxmQq9XinPj/N
 YQ6NK94bsG3gGTX9BEnMbGbYQ8nyD3M3zPbg/XEVrHnaMZ+MUajbnBx6iuiQo7VLd7
 a9H7zBPDjnKchDCevm6dex1uA9vJTrXaVjebXxswE4unjxwwickU3e7ClF5NbJcKtg
 5OIpWhfnl1s8km5Lvgi3kRs2B4D9AHUN36qXSSZdbkd8F7dVkNfHqcaJE0AwFUSMlC
 fimODpkiics4g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 12 Nov 2024 05:38:00 -0500
Message-ID: <20241112103803.1654174-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112103803.1654174-1-sashal@kernel.org>
References: <20241112103803.1654174-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.229
Cc: Luo Yifan <luoyifan@cmss.chinamobile.com>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, mcoquelin.stm32@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-sound@vger.kernel.org, perex@perex.cz,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.10 5/6] ASoC: stm: Prevent potential
	division by zero in stm32_sai_get_clk_div()
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

[ Upstream commit 23569c8b314925bdb70dd1a7b63cfe6100868315 ]

This patch checks if div is less than or equal to zero (div <= 0). If
div is zero or negative, the function returns -EINVAL, ensuring the
division operation is safe to perform.

Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>
Link: https://patch.msgid.link/20241107015936.211902-1-luoyifan@cmss.chinamobile.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/stm/stm32_sai_sub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 3a7f0102b4c5c..90e4757f76b0f 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -319,7 +319,7 @@ static int stm32_sai_get_clk_div(struct stm32_sai_sub_data *sai,
 	int div;
 
 	div = DIV_ROUND_CLOSEST(input_rate, output_rate);
-	if (div > SAI_XCR1_MCKDIV_MAX(version)) {
+	if (div > SAI_XCR1_MCKDIV_MAX(version) || div <= 0) {
 		dev_err(&sai->pdev->dev, "Divider %d out of range\n", div);
 		return -EINVAL;
 	}
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
