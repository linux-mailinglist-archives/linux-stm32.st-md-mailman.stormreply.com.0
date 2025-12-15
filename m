Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27562CC17AA
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 09:10:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6B21C87EDD;
	Tue, 16 Dec 2025 08:10:23 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E271FC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 14:30:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E07CB60159;
 Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADDB7C4CEF5;
 Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765809005;
 bh=YVvjG+ad6pHMfUraBILNT039YVFkeM0faHWTaRTnmfo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=WdduVxGzhJQVjN6khiLe4OSbXFN3OPJbly6stOErcrXSJZPW+OtXAPfvpqxXNx4Lr
 R/wfbGNMZn8gTeyQoC65rLrrBCoJCFx0i/ugKopUL5aHaJzlntwPR6sNbXyN0lRdXF
 5aAW1J/l/oApl/cuNJSgi5Eq4iSGMCGSVXz4O+4dD0LSlHkp8M1O2Wqd/qN9+aaEXA
 L83Ej0lJZ2hmO6TsaYbX/zAnYPaSL38S0/76nLlf9k9NSBqGZXG2yTOtiTeCnNKnTF
 M5vXwT0D5D9ZPyk7+QN3pV55GWVyulhgae9wvgBJlSmrQHfgrYkWXFyeDbLxx8BavQ
 uX54pneNFylrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3C0D5B16C;
 Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 15 Dec 2025 15:30:01 +0100
MIME-Version: 1.0
Message-Id: <20251215-fts-fixes-v1-1-8c1e3a63ebf1@ixit.cz>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
In-Reply-To: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Javier Martinez Canillas <javier@osg.samsung.com>, 
 Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=901; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=zOdQuMRtwbT9fTBVbDJbgo/FBNojnDOTgGlU+/RFodc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQBtrMN45yASJj+00VAkGd5xdIZEokXHQ2coVt
 zB6A4cgLICJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUAbawAKCRBgAj/E00kg
 cmt/D/0WqN7Qnefn04HGZtDjWqh6Xd3bFVndWwMvuHkGWgqXin0Zz/PSV9ITNRECWqPY/ijIjzb
 QRs1FjZjoX0fwPn1I32WGLypaGIwk64KWTIY1vegL/Ocrl++34Y2YIBphH6P6uw+n5yzGRK0/Xh
 hAsOWgiN2FwBd1Q3qn98deFk9PJVrPq7YIDeAp7/58aBIUxvdd9kWq/B8bRv2LzufshyTkxNjq0
 LExaY/z3xkYjEwuI2D9mXagWS3doWS4womk7GYxbfcWhTfW9JuLP5X6YxDhXX0efbf34/xet2Yk
 x4t9PEtwiYR53Y0LbJS18egxymFMXJlJezYbUTIxN8OoK+Kcaqceg3CioSQwrOyzxaeRQNizSo2
 hd2sfwAREdCgTfKy9KX7CrGoMvSSxynuHrYP+0785QiwU9+dXb/kV53HQK9hDGqWJ2xTw24zpKF
 hjeGgxU5qQJsr60EzcT8fFnuh3sn7v5EQP3zO3dyCqG3f7RIX4uT5VQnbEO+IEaTq9g+0EdbfbH
 xdtPtlgZ7i9KmKXBNZRGHnKn3HJB9qLBa/K1OgKsLkos6GHp5qLew9HGDlUhouQns6M4qxBT/d7
 cdUy5LSPRkuW+cBEq54O20NMWj/GwWVs7Vfq5x8lGiYfjX3F51KFq90B91xqliZXDkgphc9wqAC
 GPMM7leEGyjXGuQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-Mailman-Approved-At: Tue, 16 Dec 2025 08:10:20 +0000
Cc: linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/4] Input: stmfts - correct wording for the
 warning message
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
Reply-To: david@ixit.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: David Heidelberg <david@ixit.cz>

We're trying to enable regulator, not disable it.

Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
Suggested-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 119cd26851cf6..9f5609524fef6 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -120,7 +120,7 @@ static int stmfts_brightness_set(struct led_classdev *led_cdev,
 			err = regulator_enable(sdata->ledvdd);
 			if (err) {
 				dev_warn(&sdata->client->dev,
-					 "failed to disable ledvdd regulator: %d\n",
+					 "failed to enable ledvdd regulator: %d\n",
 					 err);
 				return err;
 			}

-- 
2.51.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
