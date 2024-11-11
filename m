Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F26149C3FA6
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2024 14:40:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90EE2C78F66;
	Mon, 11 Nov 2024 13:40:52 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr
 [80.12.242.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0FF7C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 13:40:45 +0000 (UTC)
Received: from localhost.localdomain ([90.11.132.44])
 by smtp.orange.fr with ESMTPA
 id AUeotDgOMjazzAUeotYuEf; Mon, 11 Nov 2024 14:40:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1731332445;
 bh=aySs7bPSbKHWLCsqe0IIm6YT4GwJ1SdufWSYkYaSwbI=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=O8PY86N9o1YxVmAvOi+EPQ182u26D9pzzm1S1y6qWETG6+O2hE66wviD3oAwa2Gt6
 9nIIMvC4ADzLn1TvnNYhVDo//mJuQAavXJjQC6yx1YZjwPgmeVckyMGIMtLCLyVh25
 3iHLtI2DuUTMNTE5pt4ejl8e/Fwe4XPqrmKXA+agqkg2S+0uIO4dhvkaxH3VwA2X/M
 RumGr+FGQoTQ6ePSEu5YlXfHNydANZ+b0jeS/GU14Twiu4J8nLBOAruIITf/XiHhxo
 SDj8578AqRNmy7e4E2VJ4OK5xTwtsHVtDGINf+5TS3aWJI9Q3Z4W7h+nr9KyDCuuq7
 bbGJtXZuY83ig==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 11 Nov 2024 14:40:45 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Kalle Valo <kvalo@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 11 Nov 2024 14:40:35 +0100
Message-ID: <78810e3ebb74ddbd3a4538f182bf1143b89baba7.1731332414.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] wlcore: testmode: Constify strutc nla_policy
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

'struct nla_policy' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   5062	    528	      0	   5590	   15d6	drivers/net/wireless/ti/wlcore/testmode.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   5178	    404	      0	   5582	   15ce	drivers/net/wireless/ti/wlcore/testmode.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/net/wireless/ti/wlcore/testmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ti/wlcore/testmode.c b/drivers/net/wireless/ti/wlcore/testmode.c
index 3f338b8096c7..fc8ea58bc165 100644
--- a/drivers/net/wireless/ti/wlcore/testmode.c
+++ b/drivers/net/wireless/ti/wlcore/testmode.c
@@ -45,7 +45,7 @@ enum wl1271_tm_attrs {
 };
 #define WL1271_TM_ATTR_MAX (__WL1271_TM_ATTR_AFTER_LAST - 1)
 
-static struct nla_policy wl1271_tm_policy[WL1271_TM_ATTR_MAX + 1] = {
+static const struct nla_policy wl1271_tm_policy[WL1271_TM_ATTR_MAX + 1] = {
 	[WL1271_TM_ATTR_CMD_ID] =	{ .type = NLA_U32 },
 	[WL1271_TM_ATTR_ANSWER] =	{ .type = NLA_U8 },
 	[WL1271_TM_ATTR_DATA] =		{ .type = NLA_BINARY,
-- 
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
