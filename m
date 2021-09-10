Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD794060AB
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Sep 2021 02:17:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E40BDC5A4D5;
	Fri, 10 Sep 2021 00:17:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D94E0C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Sep 2021 00:17:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF51A610E9;
 Fri, 10 Sep 2021 00:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233033;
 bh=oFz61alXTOW06JOhzSWsngaa9cI/LzWBSyT5PC3YZqU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P0HfgsEzbX3mhEF6T5acNO+vZYafO6JAQ4kbD+PQRvEVHHTqCk4gMH8eWIFj+AXFu
 JsbRPzAW50RuJA06zf5szkFhLIU5wU4+5dQiefdYdUnniLWchh4QPVECzwrki5TqiR
 RFX0VDK4AkPC6/oCA4Xj5tR7GzYAqoXz1LwQ96eyQCB45PcZkQMW94xWk+vjtMkPNu
 Wu4+NucJb+k9Ec2ON0QShzWrPjb/bYJkYa0Bds3yAvM1R6gdy8QIpkD6gGfMZ0P+7l
 xK3cUkwsegy22jipTljhFGxl74umSxbOFtU5S/Z6O9SgTOh9qlBpLOWsQLD9URBa1I
 5UdHKJZxI7M/g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  9 Sep 2021 20:15:13 -0400
Message-Id: <20210910001558.173296-54-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910001558.173296-1-sashal@kernel.org>
References: <20210910001558.173296-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Evgeny Novikov <novikov@ispras.ru>,
 Jiri Kosina <jkosina@suse.cz>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.14 54/99] HID: thrustmaster: Fix
	memory leak in remove
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

From: Evgeny Novikov <novikov@ispras.ru>

[ Upstream commit df3a97bdbc252d3421f1c5d6d713ad6e4f36a469 ]

thrustmaster_remove() does not release memory for
tm_wheel->change_request. This is fixed by the patch.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
