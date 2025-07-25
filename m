Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAD5B118EB
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Jul 2025 09:12:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8654EC3089D;
	Fri, 25 Jul 2025 07:12:05 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 982D0C30883
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Jul 2025 07:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1753427524; x=1784963524;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xvFMByaEOz99iBJ7NSHYWQOqz3P4t9DDrFX2j8+C6hA=;
 b=YXYS6UJ87OqFi1Bwej5rfCAZzMm0g++CvYfvv1Mvgi6Bd56XeBvmz6xk
 0ff8j26bCHavC2MBuHFp4Go2KtkPPiOSZCYFE/Nb91Oq1Ozbnj+hBvcCZ
 tEfRXuSbFUKHLfU8bbExLG53xKszLUBZJd3Cxi1VmZ4dsD7wAYmeULV8O
 7iBkQOMm9+8mz21PY9YYgJR00apZcHSulTAumwkGRjnE/F/CIWzOmbDXe
 JXg0jGvJU4DY/srTrDucRPgAE5bqMoAjRqBdUVfn90RGgrxKoBpzToeOZ
 T8qvjwhzD4jUQUO6ETGARD1Op/8W6nb9gRSaGW8vbS+TMISaHLVo3ERND Q==;
X-CSE-ConnectionGUID: bv4wrw58TomqhpSLsYv+Rg==
X-CSE-MsgGUID: mi2/nxJnQXO7TUmO26w0Jw==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; d="scan'208";a="45414799"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 25 Jul 2025 09:12:00 +0200
X-CheckPoint: {68832E40-2D-8CC3CD70-C1DBF452}
X-MAIL-CPID: EC45E6D563B909B0A7AC09FCAAE3848B_1
X-Control-Analysis: str=0001.0A002116.68832E72.002D, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 69C25164BC2; Fri, 25 Jul 2025 09:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1753427516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xvFMByaEOz99iBJ7NSHYWQOqz3P4t9DDrFX2j8+C6hA=;
 b=GRGUZbp+a3LTjQwnJbRRa/pseIjyLhgxfEw3blzWJ0HjxzsDf7rFtCvZX+FbWLjjD/dS99
 7PqxlbAcYSGGpi/E/GeCOiqWJAlgLrWPckiBuE15pKScyQEG4rowg2MMmMEMbFwoxP2wVf
 ns4ey/Sx7KaYdueqXmlF1PTKXZASGVyGdU3XChW5LlReB3b7JWoqp7bF519JVOsyU1fNov
 E4kN16bEYYW/9lHaYas17pcOqUYHnfmU/6i5uHLh/DZh4YC6nYm913IZqp5g/ICcLDGNnu
 /nOhRhXkmC46sOPYpb5w3YvgUL5XxBA8lnoHFhGLKU/tVcLRQQMkGyd/83oZ2A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 25 Jul 2025 09:11:48 +0200
Message-ID: <20250725071153.338912-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/3] stmpe module support
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

Hi there,

this series adds support for building stmpe mfd driver as a module along with
the bus driver for i2c and spi. This depends on the cleanup series [1]
just for avoiding conflicts.
I'm not sure in which order module support should be added, maybe even all at
once. Please advice if necessary.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20250725070752.338376-1-alexander.stein@ew.tq-group.com/

Alexander Stein (3):
  mfd: stmpe-spi: Add missing MODULE_LICENSE
  mfd: stmpe-i2c: Add missing MODULE_LICENSE
  mfd: stmpe: Allow building as module

 drivers/mfd/Kconfig     | 10 +++++-----
 drivers/mfd/stmpe-i2c.c |  1 +
 drivers/mfd/stmpe-spi.c |  1 +
 drivers/mfd/stmpe.c     |  6 ++++++
 4 files changed, 13 insertions(+), 5 deletions(-)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
