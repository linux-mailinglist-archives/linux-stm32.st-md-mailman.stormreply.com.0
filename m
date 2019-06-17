Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C86B57E95
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 372E3C90085
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:50 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86BE1D31859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2019 14:30:59 +0000 (UTC)
Received: from ramsan ([84.194.111.163]) by andre.telenet-ops.be with bizsmtp
 id RqWz200013XaVaC01qWzED; Mon, 17 Jun 2019 16:30:59 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hcsew-0002HQ-VP; Mon, 17 Jun 2019 16:30:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hcsew-00014s-TH; Mon, 17 Jun 2019 16:30:58 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jonathan Cameron <jic23@kernel.org>
Date: Mon, 17 Jun 2019 16:30:57 +0200
Message-Id: <20190617143057.4096-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:46 +0000
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] Documentation: ABI: Add missing newline at
	end of file
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

"git diff" says:

    \ No newline at end of file

after modifying the files.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/ABI/testing/sysfs-bus-iio-dfsdm-adc-stm32 | 2 +-
 Documentation/ABI/testing/sysfs-power                   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio-dfsdm-adc-stm32 b/Documentation/ABI/testing/sysfs-bus-iio-dfsdm-adc-stm32
index da9822309f0757bd..0e66ae9b0071e80b 100644
--- a/Documentation/ABI/testing/sysfs-bus-iio-dfsdm-adc-stm32
+++ b/Documentation/ABI/testing/sysfs-bus-iio-dfsdm-adc-stm32
@@ -13,4 +13,4 @@ Description:
 			error on writing
 		If DFSDM input is SPI Slave:
 			Reading returns value previously set.
-			Writing value before starting conversions.
\ No newline at end of file
+			Writing value before starting conversions.
diff --git a/Documentation/ABI/testing/sysfs-power b/Documentation/ABI/testing/sysfs-power
index 18b7dc929234f625..3c51303550118474 100644
--- a/Documentation/ABI/testing/sysfs-power
+++ b/Documentation/ABI/testing/sysfs-power
@@ -300,4 +300,4 @@ Description:
 		attempt.
 
 		Using this sysfs file will override any values that were
-		set using the kernel command line for disk offset.
\ No newline at end of file
+		set using the kernel command line for disk offset.
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
