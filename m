Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D5627A2EC
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Sep 2020 21:55:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 840E6C3FAD3;
	Sun, 27 Sep 2020 19:55:15 +0000 (UTC)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 044E9C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Sep 2020 19:55:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.77,311,1596492000"; d="scan'208";a="360169490"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES256-SHA256;
 27 Sep 2020 21:55:12 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Matt Mackall <mpm@selenic.com>
Date: Sun, 27 Sep 2020 21:12:14 +0200
Message-Id: <1601233948-11629-5-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 04/18] hwrng: stm32 - use semicolons rather
	than commas to separate statements
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

Replace commas with semicolons.  What is done is essentially described by
the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/char/hw_random/stm32-rng.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index 38324c2ddda1..bc22178f83e8 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -145,12 +145,12 @@ static int stm32_rng_probe(struct platform_device *ofdev)
 
 	dev_set_drvdata(dev, priv);
 
-	priv->rng.name = dev_driver_string(dev),
+	priv->rng.name = dev_driver_string(dev);
 #ifndef CONFIG_PM
-	priv->rng.init = stm32_rng_init,
-	priv->rng.cleanup = stm32_rng_cleanup,
+	priv->rng.init = stm32_rng_init;
+	priv->rng.cleanup = stm32_rng_cleanup;
 #endif
-	priv->rng.read = stm32_rng_read,
+	priv->rng.read = stm32_rng_read;
 	priv->rng.priv = (unsigned long) dev;
 	priv->rng.quality = 900;
 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
