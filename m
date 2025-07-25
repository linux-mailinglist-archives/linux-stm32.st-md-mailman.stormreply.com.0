Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0932B118ED
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Jul 2025 09:12:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1A65C3089D;
	Fri, 25 Jul 2025 07:12:13 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70664C30883
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 07:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1753427532; x=1784963532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ot79FB6Rm05Ivf76UgZFDK3nri1VvL/P6ylysfzZ5W4=;
 b=IgIP1Yol3DDy/KWYofw1jRIu1qgpWHuYKeqEKBwV4YAa7A1ha+yyHoVj
 zKLI3C+bir219f3bru/cIibcCquNGOyA7twxd1SafM9vMPv0UAKNQUr8r
 vH2Owsn6105wEXznHtFOVocFWIxcijeN/E15iY5KoeraON9TZkgENXbr8
 H/fUZnIFGaTxttD1LlWVXcYesHB98t6f9IXmHcUA1UC4uWqyJil3TIuuA
 lpO99bOuCKaXYm0fHEjcPOjJ/5dEkH1xW/K2wUP0G98I7ADaKF3zCNIYE
 axU6aTj0+4u7rpMQ45JLAUaeyi9NZyMt6OSl6vgYZlFRiQodl86Na8F+F Q==;
X-CSE-ConnectionGUID: UQgwQ7H2Q5OqZClASaX5fQ==
X-CSE-MsgGUID: PPfXhhUZQLSXodAMzkknMA==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; d="scan'208";a="45414809"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 25 Jul 2025 09:12:10 +0200
X-CheckPoint: {68832E4A-15-9BFD12F6-F51D5FD4}
X-MAIL-CPID: B89379C4CC39DD7BE940DE706BEDB41B_3
X-Control-Analysis: str=0001.0A002107.68832E05.004C, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0A4091736D8; Fri, 25 Jul 2025 09:12:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1753427526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ot79FB6Rm05Ivf76UgZFDK3nri1VvL/P6ylysfzZ5W4=;
 b=CDqNMw2wSEOHuEBFOE/lt41HATMfB0u8IJVw5kJwXQGig4wLnRDKmsXIGCgrsBKsgNJPgw
 Av666r0Lz63sAtAwglhN1ZyghP57DRbbTG3ifpAERuZoCRfONkAIh/t5jNga37tdDtp2dH
 j8+XUHRxlyn0MZuPNaqK7dzWwUMEJKGQojBrlM9EXK41qnzHzSxrs5hZSVI/4rDwx75kCY
 hLH5IuvCW6pp6GLy7s+6Gbjg4HAQsa0RHNGg+ny89xR6V8O274EdfwlXSChK/aHgAbYQML
 4S7v4S9JbvcEx5EAWkgn7WI05MTXPQibg2wBBeaRn7xrhG5wyT/WZ9A/pgjgow==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 25 Jul 2025 09:11:50 +0200
Message-ID: <20250725071153.338912-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725071153.338912-1-alexander.stein@ew.tq-group.com>
References: <20250725071153.338912-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/3] mfd: stmpe-i2c: Add missing MODULE_LICENSE
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
 drivers/mfd/stmpe-i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/stmpe-i2c.c b/drivers/mfd/stmpe-i2c.c
index 145836320c170..943fa363efc35 100644
--- a/drivers/mfd/stmpe-i2c.c
+++ b/drivers/mfd/stmpe-i2c.c
@@ -126,3 +126,4 @@ module_i2c_driver(stmpe_i2c_driver);
 
 MODULE_DESCRIPTION("STMPE MFD I2C Interface Driver");
 MODULE_AUTHOR("Rabin Vincent <rabin.vincent@stericsson.com>");
+MODULE_LICENSE("GPL");
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
