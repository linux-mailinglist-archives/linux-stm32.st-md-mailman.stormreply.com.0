Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D42E4060AC
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Sep 2021 02:17:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2024C5A4F4;
	Fri, 10 Sep 2021 00:17:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49C31C5A4D8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Sep 2021 00:17:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B839611C5;
 Fri, 10 Sep 2021 00:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233035;
 bh=8UHya4BeRSSQoQtCkxlbxEoRKENCHenX+bLVQL2y0dk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mbBhkJeVjnR4xKKgHlWLUvbfIqFxzQLfm6p9sMsWECqH8FgPQ1kzBoKLWjcfKYfrs
 hyr+yCaViGNZ4dWmAFciShchO2uJxTYuX1yIEZDYPzL1AU1xo6S4x5jeTbylRRh7ah
 uQZJGud3uGdtWeKi5MIbzngv9Oiid8X3sygaar5v/36l0fizsfIINKp/o2lfM7S6ql
 gjn9oNNJmrF42qUCGDzc2Jg/5hKzvyKuZrRntSSlA73naCDUzHi4e6NULrXN6eJdMV
 cqnN75W7eRQncA05C3SOP9ex53FBT2xmrXklJsRvkqrFWAp2zQB62BJFYGcon1Br/e
 Dq7w4WWUD+6iQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  9 Sep 2021 20:15:14 -0400
Message-Id: <20210910001558.173296-55-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910001558.173296-1-sashal@kernel.org>
References: <20210910001558.173296-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Evgeny Novikov <novikov@ispras.ru>,
 Jiri Kosina <jkosina@suse.cz>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.14 55/99] HID: thrustmaster: Fix
	memory leak in thrustmaster_interrupts()
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

[ Upstream commit c3800eed22d21c66912b4461a403b4448ed88d95 ]

thrustmaster_interrupts() does not free memory for send_buf when
usb_interrupt_msg() fails. This is fixed by the given patch.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-thrustmaster.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index 9cb4248f95af..d44550aa8805 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -173,6 +173,7 @@ static void thrustmaster_interrupts(struct hid_device *hdev)
 
 		if (ret) {
 			hid_err(hdev, "setup data couldn't be sent\n");
+			kfree(send_buf);
 			return;
 		}
 	}
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
