Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 986FD2F643D
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 16:23:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65064C3FAD6;
	Thu, 14 Jan 2021 15:23:44 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6928C424C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 15:23:42 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id h17so4681136wmq.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 07:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j/+bCy6NrhocYkhQjIFLsXRroyVux/dbH+svWNWdQyQ=;
 b=ERomriJ5NywBp23UX4u658HW/Nqh6AIqaycBNvleJNsA1Ud7a5YalC0I1tzz0fC5Od
 fwYjHvaaSrXnwaf11CdOVPvy3SjksfFQJ3jVKe2/I6WG1sAvkUbYXhP/GTCw+Jh2mFiT
 wZRDhrP8rYmcOyhpozbE7EvpOLJvZUyTmmJAMSD801UGfV2EEawB7QH703cVvVhRuhOC
 4UsILN0LirRxIgkt/4BUIfyeCvSt697EHySQjjr42tE+XPF/K05dCHFSxLWKONRWvPj3
 PfnUsZOpohgo9ShFwvhpOkB1abEhWH/tcVzRfNQ/XIvuZrXh6sfMD9a8isblKDYKo0jl
 BvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j/+bCy6NrhocYkhQjIFLsXRroyVux/dbH+svWNWdQyQ=;
 b=N6YOUR+jCpePVIGQgOfnF7KP75Z+j15u2yUNuJPIA0VcRHJro5D5KIBP2Ny1EDDdFH
 ZtWfw2D8fWSts/x8VPZuRBkOYMl+XdgE85g9Ha4O2q4rMgscAqVAAZRdET/8khnkGV/0
 ziN9Zfpb1NZhxGpcyPve+usJjdJHzWRsL1TmNPQi2y3YO4N661OHni7TYAeQZbDXYAtW
 omiksdC9Yi5mSth+jGg3/kLp+YpQOF5EiihhxcdIV5ilq08Mc/IuFlEiadBgqeaquopH
 PuOeHlSTnHe5CSFkXVJs1EbZ2f7gVQSwGmRLVTgLPhD2zmVf6oBLf/UtnrigFRMamZmy
 1PmQ==
X-Gm-Message-State: AOAM532Ls4lCgIoNNIt4zD3yUNQGkfEfErIQw1POq35Zrld/+j1MgJhV
 RIAxcAlimEsai9/sTuy0lsMJng==
X-Google-Smtp-Source: ABdhPJyB5UCo1HKIbdX59cHs1y1+H/YppQr8pHhUpqQnshgUA1zoSs1SW9jgNoHwXrjI1Ae5j6gnhw==
X-Received: by 2002:a1c:acc9:: with SMTP id v192mr4340744wme.174.1610637822501; 
 Thu, 14 Jan 2021 07:23:42 -0800 (PST)
Received: from dell.default ([91.110.221.178])
 by smtp.gmail.com with ESMTPSA id e15sm10777713wrx.86.2021.01.14.07.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 07:23:41 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Thu, 14 Jan 2021 15:23:23 +0000
Message-Id: <20210114152323.2382283-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114152323.2382283-1-lee.jones@linaro.org>
References: <20210114152323.2382283-1-lee.jones@linaro.org>
MIME-Version: 1.0
Cc: Luotao Fu <l.fu@pengutronix.de>,
 Stefan Riedmueller <s.riedmueller@phytec.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/5] input: touchscreen: stmpe-ts: Add
	description for 'prop' struct member
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

Fixes the following W=1 kernel build warning(s):

 drivers/input/touchscreen/stmpe-ts.c:82: warning: Function parameter or member 'prop' not described in 'stmpe_touch'

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
Cc: Luotao Fu <l.fu@pengutronix.de>
Cc: linux-input@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/touchscreen/stmpe-ts.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index cd747725589b1..25c45c3a35615 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -52,6 +52,7 @@
  * @idev: registered input device
  * @work: a work item used to scan the device
  * @dev: a pointer back to the MFD cell struct device*
+ * @prop: Touchscreen properties
  * @ave_ctrl: Sample average control
  * (0 -> 1 sample, 1 -> 2 samples, 2 -> 4 samples, 3 -> 8 samples)
  * @touch_det_delay: Touch detect interrupt delay
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
