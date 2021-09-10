Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DD94060A9
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Sep 2021 02:17:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4821C5A4D5;
	Fri, 10 Sep 2021 00:17:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14B02C5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Sep 2021 00:17:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D59A611C2;
 Fri, 10 Sep 2021 00:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233032;
 bh=EBKRkFeXmpsBAyqMWL8YMuJwzysuEp6koplyXOSW8iQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LoEQQmMbS6CgzkiYqQJHwyuqCgoThdBhHjeqBdd7DJ50/dA2hyb6g4XORVBI8YALm
 +VV/b3fu75Y0VjDWM4kMcu/g8VmyIIfwqd35HqMxlDLL5nn7iefWUXLbbCtwWEgfuI
 ts9/pFG2l4qRlRVcBt0VPBoo55g3924//RgUcmnz3z+VjBrb+SOoBZy8kCz3AiAVpG
 1RxnOzv5PAZwQmXNx9Z2d1cbrINsyTMUuazGGo7KwenKI94F7vvzy+Up9MYMRgUTBy
 STPL8S1Bbzj9OLD/vVeDZNMXERh2FYnjlJHAwaR4iYtp4dl8W/pl+VN71bpgHMLO6x
 O6moBSB3CuRJQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  9 Sep 2021 20:15:12 -0400
Message-Id: <20210910001558.173296-53-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910001558.173296-1-sashal@kernel.org>
References: <20210910001558.173296-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Evgeny Novikov <novikov@ispras.ru>,
 Jiri Kosina <jkosina@suse.cz>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.14 53/99] HID: thrustmaster: Fix
	memory leaks in probe
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

[ Upstream commit d0f1d5ae23803bd82647a337fa508fa8615defc5 ]

When thrustmaster_probe() handles errors of usb_submit_urb() it does not
free allocated resources and fails. The patch fixes that.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-thrustmaster.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index cdc7d82ae9ed..e94d3409fd10 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -336,11 +336,14 @@ static int thrustmaster_probe(struct hid_device *hdev, const struct hid_device_i
 	);
 
 	ret = usb_submit_urb(tm_wheel->urb, GFP_ATOMIC);
-	if (ret)
+	if (ret) {
 		hid_err(hdev, "Error %d while submitting the URB. I am unable to initialize this wheel...\n", ret);
+		goto error6;
+	}
 
 	return ret;
 
+error6: kfree(tm_wheel->change_request);
 error5: kfree(tm_wheel->response);
 error4: kfree(tm_wheel->model_request);
 error3: usb_free_urb(tm_wheel->urb);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
