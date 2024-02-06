Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8261284C627
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 09:26:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3929FC71286;
	Wed,  7 Feb 2024 08:26:38 +0000 (UTC)
Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63934C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 07:13:29 +0000 (UTC)
Received: from ssh248.corpemail.net
 by ssh248.corpemail.net ((D)) with ASMTP (SSL) id CZT00124;
 Tue, 06 Feb 2024 15:13:24 +0800
Received: from localhost.localdomain.com (10.73.45.222) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server id
 15.1.2507.34; Tue, 6 Feb 2024 15:13:24 +0800
From: Bo Liu <liubo03@inspur.com>
To: <lee@kernel.org>, <wens@csie.org>, <marek.vasut+renesas@gmail.com>,
 <support.opensource@diasemi.com>, <neil.armstrong@linaro.org>,
 <ckeepax@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
 <mazziesaccount@gmail.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>
Date: Tue, 6 Feb 2024 02:12:56 -0500
Message-ID: <20240206071314.8721-1-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
X-Originating-IP: [10.73.45.222]
tUid: 2024206151324b9f9b62304e62d05a8d60d6ab6a8ea99
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-Mailman-Approved-At: Wed, 07 Feb 2024 08:26:35 +0000
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Bo Liu <liubo03@inspur.com>,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 00/18] mfd: convert to use maple tree register
	cache
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

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache.

Bo Liu (18):
  mfd: ac100: convert to use maple tree register cache
  mfd: as3711: convert to use maple tree register cache
  mfd: as3722: convert to use maple tree register cache
  mfd: axp20x: convert to use maple tree register cache
  mfd: bcm590xx: convert to use maple tree register cache
  mfd: bd9571mwv: convert to use maple tree register cache
  mfd: dialog: convert to use maple tree register cache
  mfd: khadas-mcu: convert to use maple tree register cache
  mfd: lochnagar-i2c: convert to use maple tree register cache
  mfd: wolfson: convert to use maple tree register cache
  mfd: rohm: convert to use maple tree register cache
  mfd: rk8xx: convert to use maple tree register cache
  mfd: rn5t618: convert to use maple tree register cache
  mfd: rsmu_i2c: convert to use maple tree register cache
  mfd: si476x: convert to use maple tree register cache
  mfd: stmfx: convert to use maple tree register cache
  mfd: stpmic1: convert to use maple tree register cache
  mfd: rc5t583: convert to use maple tree register cache

 drivers/mfd/ac100.c         | 2 +-
 drivers/mfd/as3711.c        | 2 +-
 drivers/mfd/as3722.c        | 2 +-
 drivers/mfd/axp20x.c        | 4 ++--
 drivers/mfd/bcm590xx.c      | 4 ++--
 drivers/mfd/bd9571mwv.c     | 4 ++--
 drivers/mfd/da9052-core.c   | 2 +-
 drivers/mfd/da9055-core.c   | 2 +-
 drivers/mfd/da9062-core.c   | 4 ++--
 drivers/mfd/da9063-i2c.c    | 2 +-
 drivers/mfd/da9150-core.c   | 2 +-
 drivers/mfd/khadas-mcu.c    | 2 +-
 drivers/mfd/lochnagar-i2c.c | 4 ++--
 drivers/mfd/rc5t583.c       | 2 +-
 drivers/mfd/rk8xx-spi.c     | 2 +-
 drivers/mfd/rn5t618.c       | 2 +-
 drivers/mfd/rohm-bd71828.c  | 4 ++--
 drivers/mfd/rohm-bd718x7.c  | 2 +-
 drivers/mfd/rohm-bd9576.c   | 2 +-
 drivers/mfd/rsmu_i2c.c      | 2 +-
 drivers/mfd/si476x-prop.c   | 2 +-
 drivers/mfd/stmfx.c         | 2 +-
 drivers/mfd/stpmic1.c       | 2 +-
 drivers/mfd/wm5102-tables.c | 2 +-
 drivers/mfd/wm5110-tables.c | 2 +-
 drivers/mfd/wm8350-regmap.c | 2 +-
 drivers/mfd/wm8400-core.c   | 2 +-
 drivers/mfd/wm97xx-core.c   | 6 +++---
 28 files changed, 36 insertions(+), 36 deletions(-)

-- 
2.18.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
