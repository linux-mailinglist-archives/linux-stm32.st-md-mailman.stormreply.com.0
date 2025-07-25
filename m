Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 378F3B118DF
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Jul 2025 09:08:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F07F5C3089D;
	Fri, 25 Jul 2025 07:08:12 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 162C6C30883
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 07:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1753427292; x=1784963292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M6nuRxtELZntDjB9h69rDkTQPFgdfIrPnrFInhSdP8E=;
 b=QXrfRCB0trK882GStpOVfWSeMs5wNPmxu5c+OhfVtEo+/Q5mbs+aYAbJ
 cyepXnhniKjWwXuG5E/8O1OsfETp50hg3v39hd3x22WHC4PdnhoTVqxzm
 KcnBkyl73up8mEpul+0UzIZfbbj+wf7hQcKNb2+chyPcN+xIkIohE13dH
 IlfxM1ZH5J05nLCWVbrvLQA+pTdiESlMDxUz3bkK6o9SH9FDNdu++tNdY
 7gyytnQQHdhKw4Eyhbq/UnAsSbvNJsFG5TIB0Bv/xj5Guxskv3aI0gYdL
 iJAykn8JGXa9xaLWg3oqTuFHz8ciEDdaueX+cqkB829igRyFnR+hSLjRP A==;
X-CSE-ConnectionGUID: gHxpVgQ/SjC1lUFhmXG7vQ==
X-CSE-MsgGUID: GnFy7sS6SDuH0SIgq5Y/AQ==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; d="scan'208";a="45414673"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 25 Jul 2025 09:08:10 +0200
X-CheckPoint: {68832D5A-3-4FC15ADB-CD71293B}
X-MAIL-CPID: E5C49D879E08C065B2E90774F3BA4A44_0
X-Control-Analysis: str=0001.0A002121.68832D05.0045, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AC9D41736DA; Fri, 25 Jul 2025 09:08:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1753427285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M6nuRxtELZntDjB9h69rDkTQPFgdfIrPnrFInhSdP8E=;
 b=V7u/p1g/N6DiURgk4wF4ZlDZs+EGZwvvq/6FM+Ys/prtGOGgRIujY0SQoo4LjmJhLlGZ5a
 0t8XZLY1HR+8uCGrwzTBVoPQZji/TASEuCLiURSk4SKt5RWZiYgsOdUe0z0BEAcRn0lQLc
 Pe93BaY67Rxh5Gz/c+MmDkiWrmFPhSRwRWJp1+bdhzbBnbH4hAfwiYLY6vgc/pr9wRNHQE
 eXADSWyzUb8BJ4VQoudX17idCUkOcUahbpRoDAAt+t+0IYonp7GYnACOjg8Fm/ctqt5+Zq
 YC483H/69EgGAuXgo4FWH7tfiLcsHDadwwp1arL4eVpQa8xOEfv/iDk6GBvNcQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 25 Jul 2025 09:07:50 +0200
Message-ID: <20250725070752.338376-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725070752.338376-1-alexander.stein@ew.tq-group.com>
References: <20250725070752.338376-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/3] mfd: stmpe-i2c: Use module_i2c_driver to
	remove boilerplate
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

Driver implements feature of module_i2c_driver() manually. Replace it by
that macro instead.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/mfd/stmpe-i2c.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/mfd/stmpe-i2c.c b/drivers/mfd/stmpe-i2c.c
index fe018bedab983..145836320c170 100644
--- a/drivers/mfd/stmpe-i2c.c
+++ b/drivers/mfd/stmpe-i2c.c
@@ -122,18 +122,7 @@ static struct i2c_driver stmpe_i2c_driver = {
 	.remove		= stmpe_i2c_remove,
 	.id_table	= stmpe_i2c_id,
 };
-
-static int __init stmpe_init(void)
-{
-	return i2c_add_driver(&stmpe_i2c_driver);
-}
-subsys_initcall(stmpe_init);
-
-static void __exit stmpe_exit(void)
-{
-	i2c_del_driver(&stmpe_i2c_driver);
-}
-module_exit(stmpe_exit);
+module_i2c_driver(stmpe_i2c_driver);
 
 MODULE_DESCRIPTION("STMPE MFD I2C Interface Driver");
 MODULE_AUTHOR("Rabin Vincent <rabin.vincent@stericsson.com>");
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
