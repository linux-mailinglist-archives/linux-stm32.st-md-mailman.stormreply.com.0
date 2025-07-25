Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F32B118DE
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Jul 2025 09:08:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCB1FC3089D;
	Fri, 25 Jul 2025 07:08:06 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3334C30883
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 07:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1753427285; x=1784963285;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XwSC+xmVIES6nj+1a81sSHqaAHSEmrsC+d7iOGrRylo=;
 b=lux5fxHIiYPFvyfNsfBZCDMxacHRER75EHy9r5waoYYQp/tjZNZrUedC
 14EmDntdxwSTocRBoj4w+ncs+86jkCvu4m5j58yW7gnq/zpoTcISnPBBs
 F0pRiIVIqmPDeT4J8AC3oF2w6CpHo70thhX2OdKFyvleEpkASYKJaNdZH
 QlKqrKOTrKp4lGDr07l4xnmUwF0gSZHztS0SaYJklx1L15mT4jAkbL0YR
 vZIlKSiVt2zfYj4rKNO7mMVRazYJgAzYjlXhgZtn9DfD8GyT1G+iFe8/h
 XALDO7rU6si6oa2LuHUuTrTQHtLmnz13hwpwONswYeEbcscd+TO45uul1 g==;
X-CSE-ConnectionGUID: h+qPiIYfQ4qbBN9e7JX0tQ==
X-CSE-MsgGUID: AghS5NPgSGChX8c9uv8wDQ==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; d="scan'208";a="45414668"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 25 Jul 2025 09:08:05 +0200
X-CheckPoint: {68832D55-19-943DFC15-D71A48EE}
X-MAIL-CPID: 6648D9629072FCC338F99289EBC1854B_5
X-Control-Analysis: str=0001.0A002103.68832D75.0025, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C3D4517365F; Fri, 25 Jul 2025 09:08:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1753427280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XwSC+xmVIES6nj+1a81sSHqaAHSEmrsC+d7iOGrRylo=;
 b=piZvWWy30WlbT9jMg31fqOmt4K1lc1f4DnhLnAmBKKqLgTKbSgCUKpJfDAkHS5BHjPSch6
 JxjYBqLjTDntiju9znT/pM1UpyBG+zFD2QmoIwBVlNdwZMmTs/v/NrffSguWnE5mS0iPsB
 2HsuUUGvD3fXWBPoiZTZJGyKXTQVek6FdpHGFMlur9EwNyUAvX23uhzozXvk8Ty3boXdGr
 tDQY7ho7ajsQwPK7H7esFaOwXz6mEOPOF1DPQAFIujtyKZeU5/4tgAjiwCGlJzj0UieTNY
 yx1y/LKmli0pSqMLNzgnNm9As6H73k/4S5QP5bxEaRmoZJSIPYhkciIQ5WlMAQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 25 Jul 2025 09:07:49 +0200
Message-ID: <20250725070752.338376-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725070752.338376-1-alexander.stein@ew.tq-group.com>
References: <20250725070752.338376-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/3] mfd: stmpe-spi: Use module_spi_driver to
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

Driver implements feature of module_spi_driver() manually. Replace it by
that macro instead.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/mfd/stmpe-spi.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/mfd/stmpe-spi.c b/drivers/mfd/stmpe-spi.c
index b9cc85ea2c401..7fee64102cae7 100644
--- a/drivers/mfd/stmpe-spi.c
+++ b/drivers/mfd/stmpe-spi.c
@@ -141,18 +141,7 @@ static struct spi_driver stmpe_spi_driver = {
 	.remove		= stmpe_spi_remove,
 	.id_table	= stmpe_spi_id,
 };
-
-static int __init stmpe_init(void)
-{
-	return spi_register_driver(&stmpe_spi_driver);
-}
-subsys_initcall(stmpe_init);
-
-static void __exit stmpe_exit(void)
-{
-	spi_unregister_driver(&stmpe_spi_driver);
-}
-module_exit(stmpe_exit);
+module_spi_driver(stmpe_spi_driver);
 
 MODULE_DESCRIPTION("STMPE MFD SPI Interface Driver");
 MODULE_AUTHOR("Viresh Kumar <vireshk@kernel.org>");
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
