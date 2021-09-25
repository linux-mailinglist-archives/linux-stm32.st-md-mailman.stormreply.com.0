Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB2C4184F2
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Sep 2021 00:22:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AA9BC5A4F7;
	Sat, 25 Sep 2021 22:22:22 +0000 (UTC)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3462DC0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Sep 2021 22:22:19 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id F2D914049E; 
 Sat, 25 Sep 2021 22:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632608537;
 bh=KqfzOAU9rH+MFeq0GoYgMDIMmLolH9PE7uCZ+3pFhB4=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=WBJHDA2COZIgumOa5LcS9hV6S6aafp95dVa/yF2z3vYirsEwGccP3VgwsbRgbFQ+O
 6i/S8bAW0M65MmcIjNsSc/lxD3INNkWR8qYakDWSvJY9eeS7SMaGlW/QDKkUpZtfQH
 1FHvy7Bc55we5rBGlnhJXQcJ27le4DrKROejRJe+f4Po6k+pdyTtTL5AB3r6Nxj8b9
 cZkwgYKEpwK/IbfDn5M5TwhP4kckSHxJGIIutLonci/mddHGV+GDpdmu4RNXq8TvA9
 GdivW6VZhmyIZnCChMFVo/sTRBUFPNBW23k3mmm6svpQNDPIIG1BIlSzh4Xz4yrbro
 DweE0YHkSTLvw==
From: Colin King <colin.king@canonical.com>
To: Jiri Kosina <jikos@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Sat, 25 Sep 2021 23:22:16 +0100
Message-Id: <20210925222216.182099-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] HID: thrustmaster: Initialized pointer twi
	with NULL rather than 0
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

From: Colin Ian King <colin.king@canonical.com>

Pointers should be initialized with NULL rather than 0. Fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/hid-thrustmaster.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index d44550aa8805..aa874f075bf9 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -205,7 +205,7 @@ static void thrustmaster_model_handler(struct urb *urb)
 	struct tm_wheel *tm_wheel = hid_get_drvdata(hdev);
 	uint16_t model = 0;
 	int i, ret;
-	const struct tm_wheel_info *twi = 0;
+	const struct tm_wheel_info *twi = NULL;
 
 	if (urb->status) {
 		hid_err(hdev, "URB to get model id failed with error %d\n", urb->status);
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
