Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6039C57E94
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 232B8C8E65A
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:50 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E51D2C61D2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2019 14:23:40 +0000 (UTC)
Received: from ramsan ([84.194.111.163]) by xavier.telenet-ops.be with bizsmtp
 id RqPP2000J3XaVaC01qPP2r; Mon, 17 Jun 2019 16:23:32 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hcsXZ-0002FM-Vp; Mon, 17 Jun 2019 16:23:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hcsXZ-0000ld-Tm; Mon, 17 Jun 2019 16:23:21 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Joe Perches <joe@perches.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Mon, 17 Jun 2019 16:23:20 +0200
Message-Id: <20190617142320.2830-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:46 +0000
Cc: linux-stm32@st-md-mailman.stormreply.com,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] [RFC] get_maintainer: Really limit regex
	patterns to words
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

Limit file and directory regex matching to paths that contain the
pattern as a word, i.e. that contain word boundaries before and after
the pattern.  This helps avoiding false positives.

Without this, e.g. "scripts/get_maintainer.pl -f
tools/perf/pmu-events/arch/x86/westmereex" lists the STM32 maintainers,
due to the presence of "stm" in the middle of a word in the path name.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
What to do with drivers/pwm/pwm-stmpe.c, which is no longer caught?
Add a new pattern to MAINTAINERS?
---
 scripts/get_maintainer.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index c1c088ef1420e68a..a34057d87a56492f 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -884,7 +884,7 @@ sub get_maintainers {
 				}
 			    }
 			} elsif ($type eq 'N') {
-			    if ($file =~ m/$value/x) {
+			    if ($file =~ m/\b$value\b/x) {
 				$hash{$tvi} = 0;
 			    }
 			}
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
