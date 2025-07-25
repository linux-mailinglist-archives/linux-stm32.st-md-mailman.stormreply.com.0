Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E657B118DD
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Jul 2025 09:08:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA28CC30883;
	Fri, 25 Jul 2025 07:08:02 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97D68C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 07:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1753427281; x=1784963281;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uh1MZsai+1QlLMsnGqqtZ6xsZZILDM6L6Dcdbc1nr8M=;
 b=D8LgC2Ms8pO/HzWx6sYoCTGxH3YHEYRR8hPX2mw9UunA4y9ehRCrAu8n
 FLog3iY0hLOaOnfHzZU2YAVN/ADVrQ9XV1V69+l6E23kGRh0RXXWZe4c+
 8abA6oZBhX7YrByo2p583MV+dwAm2p5srLjgiosv86CHjyuyJHig791Wy
 PkI94QL7oWRxCDbZKlH5q9RhhXVjPcRrYZE+9qgrYDXmgdIoy2VGgjyA4
 fwvQM6wdwStyHsDiQthEElSG02Xw2EkXm1TgtNiiiu/CMhlbYEtzZ0gEf
 G8BDGD19lOujSfkI8t+AtqTrd6IU8KizpWjE95S4lwk2xqfePYZire8LK w==;
X-CSE-ConnectionGUID: pTxjeaYCTjqymR65UahxpQ==
X-CSE-MsgGUID: yGEwm0Q0QTu0I1hikHzCSA==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; d="scan'208";a="45414666"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 25 Jul 2025 09:08:00 +0200
X-CheckPoint: {68832D50-7-943DFC15-D71A48EE}
X-MAIL-CPID: 0E5749B5E1E6CD6317F31CC94F75ADF3_5
X-Control-Analysis: str=0001.0A002103.68832D70.003C, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D106C164BC2; Fri, 25 Jul 2025 09:07:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1753427276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=uh1MZsai+1QlLMsnGqqtZ6xsZZILDM6L6Dcdbc1nr8M=;
 b=ie9ng9nsm5xHyEGnzo8Ek6IVDFTxaYyS1NHVI2f4YZQEHwwQ7ZEh0NnX6Pye5k/7Zy00Gr
 iI/W0lyjEgiEt1hXqW11CULqiZYCm/G9+szNBzPwj6kha8dMUshtp7pxrnA0YGXc0uGBy4
 5DNSRSifq+cl4ixhjX4+SQnoSWzyg+fD/0Owmm5AlAB3azTcW/yes2mj0DBP4VtvRBqe5p
 8fsG/HvrKdHUrOZL66RRUK0W5TUmmOTtUNV1PQE7QgXl2G65zGcNgbOtiBXczZQaFFVfsy
 Hm+p5luodaRrLh2womSCWm3n8Q4x9dBZg08JJ/fMYKi+28XMslVcRCvScgb5Ww==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 25 Jul 2025 09:07:48 +0200
Message-ID: <20250725070752.338376-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/3] mfd: stmpe: Remove IRQ domain upon removal
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

The IRQ domain is (optionally) added during stmpe_probe, but never removed.
Add the call to stmpe_remove.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/mfd/stmpe.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 819d19dc9b4a9..e1165f63aedae 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1485,6 +1485,9 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
 
 void stmpe_remove(struct stmpe *stmpe)
 {
+	if (stmpe->domain)
+		irq_domain_remove(stmpe->domain);
+
 	if (!IS_ERR(stmpe->vio) && regulator_is_enabled(stmpe->vio))
 		regulator_disable(stmpe->vio);
 	if (!IS_ERR(stmpe->vcc) && regulator_is_enabled(stmpe->vcc))
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
