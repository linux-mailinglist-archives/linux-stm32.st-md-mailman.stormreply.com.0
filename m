Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5F43DD363
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Aug 2021 11:51:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 714D6C5AB68;
	Mon,  2 Aug 2021 09:51:51 +0000 (UTC)
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E430C57B6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jul 2021 16:51:15 +0000 (UTC)
Received: from hellwig.intra.ispras.ru (unknown [83.149.199.249])
 by mail.ispras.ru (Postfix) with ESMTPS id 7AC1440755CD;
 Fri, 30 Jul 2021 16:51:14 +0000 (UTC)
From: Evgeny Novikov <novikov@ispras.ru>
To: Jiri Kosina <jikos@kernel.org>
Date: Fri, 30 Jul 2021 19:51:09 +0300
Message-Id: <20210730165110.24667-2-novikov@ispras.ru>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210730165110.24667-1-novikov@ispras.ru>
References: <20210730165110.24667-1-novikov@ispras.ru>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Aug 2021 09:51:10 +0000
Cc: ldv-project@linuxtesting.org, Evgeny Novikov <novikov@ispras.ru>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/3] HID: thrustmaster: Fix memory leak in
	remove
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

thrustmaster_remove() does not release memory for
tm_wheel->change_request. This is fixed by the patch.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/hid/hid-thrustmaster.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index e94d3409fd10..9cb4248f95af 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -253,6 +253,7 @@ static void thrustmaster_remove(struct hid_device *hdev)
 
 	usb_kill_urb(tm_wheel->urb);
 
+	kfree(tm_wheel->change_request);
 	kfree(tm_wheel->response);
 	kfree(tm_wheel->model_request);
 	usb_free_urb(tm_wheel->urb);
-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
