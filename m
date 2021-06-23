Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B91DF3B1778
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jun 2021 11:59:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BE74C597B7;
	Wed, 23 Jun 2021 09:59:46 +0000 (UTC)
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B4BAC597B4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jun 2021 09:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=k1; bh=+dJisOoRlpnaFm/+eXurATQB9Rw
 iXYy889RBZ/5oR1M=; b=0Qn1AEWFWm6AOFPOC5H30RuTJ/0vARRi4QcLLtYbOUE
 4EpagQFXqT1VD5gYz7nzCdnNmjYG8KfX7rnQOjv48HdJP8U+npGDyKwLk/9PkzQ5
 tm0ePKN/c5paoWm2+E1+0ch4UBDLqjM2H7dsYeV8XsN4h8mru9fIjsZzD0kal3vo
 =
Received: (qmail 2551888 invoked from network); 23 Jun 2021 11:59:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 23 Jun 2021 11:59:43 +0200
X-UD-Smtp-Session: l3s3148p1@i9Eu92vFEKogARa4RfhaAavnjlTTqzSz
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Date: Wed, 23 Jun 2021 11:59:34 +0200
Message-Id: <20210623095942.3325-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/7] i2c: use proper DMAENGINE API for
	termination
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

dmaengine_terminate_all() is deprecated in favor of explicitly saying if
it should be sync or async. Update the drivers I audited.


Wolfram Sang (7):
  i2c: at91-master: : use proper DMAENGINE API for termination
  i2c: imx: : use proper DMAENGINE API for termination
  i2c: mxs: : use proper DMAENGINE API for termination
  i2c: qup: : use proper DMAENGINE API for termination
  i2c: rcar: : use proper DMAENGINE API for termination
  i2c: sh_mobile: : use proper DMAENGINE API for termination
  i2c: stm32f7: : use proper DMAENGINE API for termination

 drivers/i2c/busses/i2c-at91-master.c | 4 ++--
 drivers/i2c/busses/i2c-imx.c         | 6 +++---
 drivers/i2c/busses/i2c-mxs.c         | 4 ++--
 drivers/i2c/busses/i2c-qup.c         | 2 +-
 drivers/i2c/busses/i2c-rcar.c        | 4 ++--
 drivers/i2c/busses/i2c-sh_mobile.c   | 4 ++--
 drivers/i2c/busses/i2c-stm32f7.c     | 8 ++++----
 7 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
