Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B459B24F3E
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Aug 2025 18:16:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D13B7C36B16;
	Wed, 13 Aug 2025 16:16:26 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8A09C36B15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Aug 2025 16:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=k1; bh=p6ifxHkAY/tZiF4oxsD8xCvN6uBTURhwZ8wJ5XnK2n8=; b=DS09/O
 0K686u8BmHmwZpkwG52hEbHrnRQR1VlNss8o/Kvt3SNn0m/QeA3gozRxZD6x9Dks
 EywVc2cwPG9nxSiAdv4sAL60NuHiNuaBEOCDKMh+enjxa8djmb1dt5l/6oaDW1i9
 RA9GFHQA49sFMpk4eeG03IiUZrzqPiojyT905bwXrVC0Gvp8n/iaIx0y03HpZZbZ
 bYZb3BgMj5bDTQaS+lN1JH+LDnpW+FhGI8Dud9HtTdCoP7/VyHjKy1LrYkiYAzk3
 RclIPGqY+XhDG26y+Vi/YG1AvrDAr7EWo46yl9G/SEeoDD3tiep+SU8noFhW2nPH
 /XmMNH9PQthPBV4w==
Received: (qmail 694902 invoked from network); 13 Aug 2025 18:16:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 13 Aug 2025 18:16:11 +0200
X-UD-Smtp-Session: l3s3148p1@eqOaeUE8FtttKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 13 Aug 2025 18:14:54 +0200
Message-ID: <20250813161517.4746-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mark Brown <broonie@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 08/21] media: remove unneeded 'fast_io'
	parameter in regmap_config
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

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/media/cec/platform/stm32/stm32-cec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/cec/platform/stm32/stm32-cec.c b/drivers/media/cec/platform/stm32/stm32-cec.c
index fea2d65acffc..1ec0cece0a5b 100644
--- a/drivers/media/cec/platform/stm32/stm32-cec.c
+++ b/drivers/media/cec/platform/stm32/stm32-cec.c
@@ -248,7 +248,6 @@ static const struct regmap_config stm32_cec_regmap_cfg = {
 	.val_bits = 32,
 	.reg_stride = sizeof(u32),
 	.max_register = 0x14,
-	.fast_io = true,
 };
 
 static int stm32_cec_probe(struct platform_device *pdev)
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
