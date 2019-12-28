Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EED6E12BEA1
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Dec 2019 20:15:46 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A29AC36B0B;
	Sat, 28 Dec 2019 19:15:46 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C000FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 19:15:44 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id x7so16078549pgl.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Dec 2019 11:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=xMhSUaoLvbRS73MvzsX7fmmvsEWEBSbzwEx5SJxXjpA=;
 b=P66zAWKVsxghJs+uKX+aAsz486sKeQggR9ZD685ZiiotPHnaImkbarQOzpgBExACAr
 0m+wz7SPPDREENrgJWvRXta8HRU1sgpBWtSZt8ikIWwMkKsHreO1F6PWDIioRYGwYLoO
 3esKe6vV7tEabVVmBOtTywnHK87UkCTjNIUtmRZV78MGCd8E36NmO4+tBZUNsZF/5JGH
 P8kQ0M3M2qX1Nwmk0KoeMbbFPNuSBEqWp/TQGJ478HymFQ/YXGIV7X9t89t0ngoSw90I
 nuxjzkXnFG6bvBRatK6eX0j5ejGnieAEpY3jWrNayVvr1dHhzGTlqT8S227pBDd+K0R4
 meUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xMhSUaoLvbRS73MvzsX7fmmvsEWEBSbzwEx5SJxXjpA=;
 b=BOV4hkMISD5mleGZitY5Rz0OG4F0ODY+FHs8ZrCJCSt/Hq6WQU8yt9x/XDb05ZFUnx
 ZuYeOG0IYXdMgfxqZ+YNGo57N8Ot5SYknjOBZoOtlWFdHWTLFjerDZoQ9n75fQyILddK
 rKjdjxPu/3lcvBQefHJhLRWjH1GNwadmwZpWOXLspvRNo46YAErLiswL+e1zcn7QR6NR
 exnm37vY80UA9Qgy7cwpkyThMGp/bGuNLmxjxdb4kCcN/tXqGV7m8wkCtSbK24SJtJr9
 dF+JeVKhFhwnON8uY4x+U8GQpwYWCK6W1soYTJDrR1gqVtRnSlImKUcMtaaxcHBqF85v
 HY1A==
X-Gm-Message-State: APjAAAVLXH9qCDgWZsbhuScLtnUJx68vcYs/egEcHabTOh/7CbJMSKI6
 z1Z8k3h7gd3KbTaroL5XIeoB6PONc4o=
X-Google-Smtp-Source: APXvYqxB6RVGET87O9fX5SlbjXabkBMlr6aK9Z3y6OEKl6J2YM8VVPP34GRL2M3O5laHsLavAdu6OQ==
X-Received: by 2002:a65:6842:: with SMTP id q2mr63586845pgt.345.1577560543230; 
 Sat, 28 Dec 2019 11:15:43 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id d2sm18861017pjo.32.2019.12.28.11.15.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 11:15:42 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 28 Dec 2019 19:15:41 +0000
Message-Id: <20191228191541.26999-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Yangtao Li <tiny.windzz@gmail.com>
Subject: [Linux-stm32] [PATCH] hwspinlock: stm32: convert to
	devm_platform_ioremap_resource
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/hwspinlock/stm32_hwspinlock.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index c8eacf4f9692..3ad0ce0da4d9 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -58,12 +58,10 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 {
 	struct stm32_hwspinlock *hw;
 	void __iomem *io_base;
-	struct resource *res;
 	size_t array_size;
 	int i, ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	io_base = devm_ioremap_resource(&pdev->dev, res);
+	io_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(io_base))
 		return PTR_ERR(io_base);
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
