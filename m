Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D114FB118EC
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Jul 2025 09:12:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93950C3089D;
	Fri, 25 Jul 2025 07:12:07 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46DF5C3089E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 07:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1753427526; x=1784963526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GrXdUoo3RbvjWrVbpwGB5q/E3xwWtlH9v1ztr3x3IzI=;
 b=JGODZHpiOFj1BG26YmVPxJamfGtD1u1TIgvQYkEUFW5x+BbSHDc2xw/l
 S7/2D3ZqMmRobTDryR7AltvkatAPnY4Pq4K6QLnF8ZkNXn21Kxe5NCj+W
 E/cg5sdIU8zbM6tlvKRLGWCrmAKdkHt/9b61u9600B9RQ/QGnJt68FnYp
 em+1DaY7DeDetEwxnomX0u8p0gMDUB8xQNFpaqoKX6Uv2xfmYe7IoFsmV
 xrGAh2GdGne/rjRi1tjkByTjfbXPfXmXmiTuckyVB/xdlZ9dCqP48mOQu
 elzIYyoKxlxewKmE49/LhoAL1NATpwwq66U2bqY8/43t++4jSYtt+OFzm w==;
X-CSE-ConnectionGUID: PUeZ/PeBTLKcFpfSm1NfZg==
X-CSE-MsgGUID: n1srBmqRTDaoZdnB3XGiiQ==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; d="scan'208";a="45414804"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 25 Jul 2025 09:12:05 +0200
X-CheckPoint: {68832E45-29-BB1FFBB0-EB2CC75E}
X-MAIL-CPID: E56E1AE4A9F556D2E0DAF917D46174D4_2
X-Control-Analysis: str=0001.0A002116.68832E74.0030, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EF7E01736DC; Fri, 25 Jul 2025 09:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1753427521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GrXdUoo3RbvjWrVbpwGB5q/E3xwWtlH9v1ztr3x3IzI=;
 b=AcJJ5dDK/MkVv8P4tMR3e1nS725P5GBzgXIrHgCdiTw+JAgSTtWW/c27rcx0kH6wScZxG+
 7yCuo/fU6l/3ZhX909b/fozd722BPEAj2yOSKqEfEb8f0JGx2pqW31HLoKiCMnYncWN4lM
 Gv1tT1FO6r7W1RIBsJioNpaQQurVGfeKhndbch2isc8YKCp/pv0/F/H00Id7hmvlPpw5Qa
 yXy9vg7kUchDgiBZVaSx/G5ZfE73v0T77hUL8J44FsMoWonj8Z7l90c+WdrN+eFzZA78dW
 l3GHTtRPyId0s5xWQ4MFERa+zVKHlhz3xsMjz8fsj5rQwpoODINZe6WgHGy5jw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 25 Jul 2025 09:11:49 +0200
Message-ID: <20250725071153.338912-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725071153.338912-1-alexander.stein@ew.tq-group.com>
References: <20250725071153.338912-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 1/3] mfd: stmpe-spi: Add missing MODULE_LICENSE
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

This driver is licensed GPL-2.0-only, so add the corresponding module flag.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/mfd/stmpe-spi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/stmpe-spi.c b/drivers/mfd/stmpe-spi.c
index 7fee64102cae7..dea31efface6e 100644
--- a/drivers/mfd/stmpe-spi.c
+++ b/drivers/mfd/stmpe-spi.c
@@ -145,3 +145,4 @@ module_spi_driver(stmpe_spi_driver);
 
 MODULE_DESCRIPTION("STMPE MFD SPI Interface Driver");
 MODULE_AUTHOR("Viresh Kumar <vireshk@kernel.org>");
+MODULE_LICENSE("GPL");
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
