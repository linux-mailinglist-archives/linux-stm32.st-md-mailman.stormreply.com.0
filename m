Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DAAA998CD
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Apr 2025 21:42:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D8CDC7802F;
	Wed, 23 Apr 2025 19:42:50 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B21DCC78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 19:42:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0272244E7B;
 Wed, 23 Apr 2025 19:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400B0C4CEE8;
 Wed, 23 Apr 2025 19:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745437367;
 bh=F3azllxUB00Zjj+oyESkLHmmdJpPPIUF3Md9fl4CSXY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=qyjGsfeKW2GqcFpbWB3Kb7mvyy2Xoq+aQoDh1c/CoCcOoFyHg28t1qqkV0fIPJCkH
 4OUZ6PRJoqEgjXGexarz0xJp7gH73jzW4MhyuWTN89MBqcBul7aqBEa3pSsZwfBGIM
 +HcPAhQVvU3iYoVDTo4bVvwNjY9dsBEcSppmkUBTA/zD48tTfHCjdOxDh3faN8Pu+H
 7SZ8MFljQ0ztYHcPBYFW5zKWJ5rhQh5b5aSyGJAPacb1vt0bbfu9VUWeaVn9ENoE25
 ZoZUWC5DLuCnZ49Vi9akP16BmfWUWfTqrfZPBUSr8cvm5n2x1C7QSTmTZTWlQbcQfs
 RlVvMmkZSPanw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 23 Apr 2025 14:42:15 -0500
MIME-Version: 1.0
Message-Id: <20250423-dt-memory-region-v2-v2-3-2fbd6ebd3c88@kernel.org>
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
In-Reply-To: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
To: Saravana Kannan <saravanak@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>
X-Mailer: b4 0.15-dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/4] devres: Export
	devm_ioremap_resource_wc()
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

devm_ioremap_resource_wc() is not exported, so add one.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - New patch
---
 lib/devres.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/devres.c b/lib/devres.c
index 73901160197e..378b07730420 100644
--- a/lib/devres.c
+++ b/lib/devres.c
@@ -206,6 +206,7 @@ void __iomem *devm_ioremap_resource_wc(struct device *dev,
 {
 	return __devm_ioremap_resource(dev, res, DEVM_IOREMAP_WC);
 }
+EXPORT_SYMBOL(devm_ioremap_resource_wc);
 
 /*
  * devm_of_iomap - Requests a resource and maps the memory mapped IO

-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
