Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E0575DE6D
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Jul 2023 22:07:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FD3BC6B44D;
	Sat, 22 Jul 2023 20:07:33 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr
 [80.12.242.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 198EBC6A611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Jul 2023 20:07:32 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id NIsyqCllLulAmNIszqCc5G; Sat, 22 Jul 2023 22:07:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1690056451;
 bh=7S4ycyHIMkZJiLKQzCPxeyh+eo13SBWOIVq3MxxljJ4=;
 h=From:To:Cc:Subject:Date;
 b=H1cITbJGrQCdw/dC2WdazoyVY0mrYULO1Vall8mjmOZhUf2HpWZfD5DXrHO7Fn447
 iY3GHjnyT2VmoVdqX5leLbMcYQnneDP9YXuVSUKXMTUtiqDNTKVMS5T7Ki5SK2BOmi
 QRef6/MoHPpVKxzX+YnsLQdwSUYSUZ2FKJjF+2cn/z/VEHHKzXFzWMgX0gMqsrkdZ3
 x403vWMINEMsctZ55M0vSjPQ7iDnes1FYWLJwL77q3Wuum82zXi94W+cvARrsWfGrJ
 vAMGUCVychN9LGChTN1g0SOTA5QWooUmDW19fCFBSlB8ec//PDWhefBwKbFsNQBF4q
 9D9y0+LtrieXQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 22 Jul 2023 22:07:31 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sat, 22 Jul 2023 22:07:26 +0200
Message-Id: <d14d51f409c1e87fb87fa39869bdf7ce1b766120.1690056420.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] stm class: Use struct_size()
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

Use struct_size() instead of hand-writing it, when allocating a structure
with a flex array.

This is less verbose, more robust and more informative.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
It will also be helpful if the __counted_by() annotation is added with a
Coccinelle script such as:
   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=devel/counted_by&id=adc5b3cb48a049563dc673f348eab7b6beba8a9b
---
 drivers/hwtracing/stm/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index 534fbefc7f6a..2195310ab81c 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -863,7 +863,7 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
 		return -EINVAL;
 
 	nmasters = stm_data->sw_end - stm_data->sw_start + 1;
-	stm = vzalloc(sizeof(*stm) + nmasters * sizeof(void *));
+	stm = vzalloc(struct_size(stm, masters, nmasters));
 	if (!stm)
 		return -ENOMEM;
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
