Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A878967BB
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Apr 2024 10:08:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84935C6B45B;
	Wed,  3 Apr 2024 08:08:41 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDDA5C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Apr 2024 08:08:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A2FAE61200;
 Wed,  3 Apr 2024 08:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1BBC433C7;
 Wed,  3 Apr 2024 08:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712131719;
 bh=3FgSuQ7tiSYGFrQ5YgtJKC7vrKzdmqUOX9CzJzQDHso=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nxMBY/dLT6CayFR5A/KNDA9+vTisu7sftWa5Fvqb/eWp5hcNJVBZxE9PlPmmG0QXZ
 PMutL9J0QSHGMavbJbyARu2AUBjoIc+3iSnRqlG0axBXj/qfXEED6BpTlolCLYUMOj
 ezmb4Sd4u19bTzrzPZBjQ267Nwk8617FXcMyq6nCqmafQWbowELlaEoijdQv6RWuKJ
 ULjhPLhit5npJ+VXlpwMZ7Xdy6KT9Qph/ZBNCTOBM1xBHql8FNz7ybTgT3dzMFonXw
 T1Ga5mqfORgR30VA1C3RLnZnowT51tCaV2hczw1rvEgp7DBkjzev151PGQBnGvDbs3
 QJ2+o6Xmk6guw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed,  3 Apr 2024 10:06:25 +0200
Message-Id: <20240403080702.3509288-8-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403080702.3509288-1-arnd@kernel.org>
References: <20240403080702.3509288-1-arnd@kernel.org>
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 07/34] Input: stmpe-ts - mark OF related data
	as maybe unused
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

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

When compile tested with W=1 on x86_64 with driver as built-in:

  stmpe-ts.c:371:34: error: unused variable 'stmpe_ts_ids' [-Werror,-Wunused-const-variable]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/touchscreen/stmpe-ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index b204fdb2d22c..022b3e94266d 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -366,7 +366,7 @@ static struct platform_driver stmpe_ts_driver = {
 };
 module_platform_driver(stmpe_ts_driver);
 
-static const struct of_device_id stmpe_ts_ids[] = {
+static const struct of_device_id stmpe_ts_ids[] __maybe_unused = {
 	{ .compatible = "st,stmpe-ts", },
 	{ },
 };
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
