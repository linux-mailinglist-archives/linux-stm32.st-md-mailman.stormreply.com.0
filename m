Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E40C41C9425
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 17:12:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD725C3F950;
	Thu,  7 May 2020 15:12:25 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81E0DC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 15:12:23 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id l12so2615933pgr.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=96jnTCBD83Wv0PAJTE2BBo0VXx5TqKQi9pMzwgM4Bvo=;
 b=qkcIoMnyddwZz6l2iGAXDhyexKTgNnQAW9lafUYWDMhTepNj8Sta9ZXm4w3wyB2AST
 1AJTMdMBajSvLBhvM16D9KgIqtXbBuhudE+UHuISqWO+qY00UPgJD8yJPr8DZ8rCOMzJ
 c2ItNvJ+ttYCUdfWTOe3xXVOp6Iplo5z9il0iU+Oml333s/6CXcW4Jgp77xvzRrLQgL+
 /ncoVKcoluCYvfQGspde7NgrHxWuU1aOLIThVKDHkx9x8j/6bqj2QsmqLDnPEMdzRg9Z
 Fznfhyk50qoESkluSuANZvefs7UgpLkAYOsCejb35HG+Jd3EE+CfYyOZaeuDWCVW5Z2i
 9hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=96jnTCBD83Wv0PAJTE2BBo0VXx5TqKQi9pMzwgM4Bvo=;
 b=XknR6vlwhOWu+D7sXtOo3/bfbtimmFyLW2eMseu6xV50qGD1GNLaS74UFuNNufRkrB
 WovqI2r0FLkFQQIj2k3VdCVto2xgUN24BIvcPwXu6ghiIaxm6Ab14bH8BjFfU7BUKoIm
 v3b8KlWxnoUU0g8sc3/+SZahZQIp6NrAz6cOcJsey7eZuAXarj/ca+K5yzqUkirWw1lP
 RJLeGOD4Su6DE7YydKwuo2xd65wjYL89SLR5Ku5TeAMg84bIbMtulC+cnwS+IbzBZveS
 K/4VP5YfjjMv4pePhC3dTF+vt0PIdS5n1gZ+A1WxT30eAjP+kj0lSeuuorwYiR72PIUs
 QsaA==
X-Gm-Message-State: AGi0PuZfdY+SS3jbT5+XxQSYsSLq0FQ0Y6vjE423c+SFW7IhjqO4w1C0
 pUpM48uaUGXxxolQdMfax8A=
X-Google-Smtp-Source: APiQypJdokPYKCL5kUn4xIRQIDNKHKOdREr5Pgq69HVLtf4k/OCqHfoHoqbZ9uKHEKRIlSnCEIMzsA==
X-Received: by 2002:a63:6e81:: with SMTP id
 j123mr12541889pgc.333.1588864342098; 
 Thu, 07 May 2020 08:12:22 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id a196sm5276794pfd.184.2020.05.07.08.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:12:21 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Date: Thu,  7 May 2020 23:12:13 +0800
Message-Id: <20200507151213.792640-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] Input: stmpe-ts - add missed
	input_unregister_device
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

This driver calls input_register_device() in probe, but misses
input_unregister_device() in remove.
Add the missed function call to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/input/touchscreen/stmpe-ts.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index 7e16fcfe3b95..5e62b466629b 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -350,6 +350,7 @@ static int stmpe_ts_remove(struct platform_device *pdev)
 {
 	struct stmpe_touch *ts = platform_get_drvdata(pdev);
 
+	input_unregister_device(ts->idev);
 	stmpe_disable(ts->stmpe, STMPE_BLOCK_TOUCHSCREEN);
 
 	return 0;
-- 
2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
