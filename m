Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7BD50E608
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 18:43:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45151C60462;
	Mon, 25 Apr 2022 16:43:59 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 758E3C5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Apr 2022 08:16:48 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id
 s14-20020a17090a880e00b001caaf6d3dd1so16672232pjn.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Apr 2022 01:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QuqDicbY3kF4HQHdeFb/QPn21jDri/mLpJf4XQrwT3o=;
 b=Cf91qwkiOFKTt4qMLq9v73fay0oIWWa+PJlaAfoWlehlU4po3BhqsIN49MGh99uXsq
 4xQC18cXFAhYHB1KMlGLW2uhEljK5iDu1fsATHCWs1p/gPmzOQFmczki0721XqaT+IxJ
 GUEYGWevx06ZGeWVwXeL5peJ58NYCPqBOsHlPwjpyFTvoClq2WFVu42rZPe/44iBdBH4
 7InQgDLAq+z0Wm8/LOwqDZyiEg1NkqX/2Maj8gqEgvdXlCK/KnWE217YXd1spF3U4zHz
 xN4iBZ6o3LaF9zPmz8IGEDJnrN1PPTFYU9OMG6Sipf15vnV3P2T1es2G0lE+dbGV55As
 PK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QuqDicbY3kF4HQHdeFb/QPn21jDri/mLpJf4XQrwT3o=;
 b=WdTXy3n5mr466bXBUNYYhRSLgu8ry8AjdA/E4xoIJ91TxirnSiR+Ya1FCTuBGS7q2Y
 ZF55tZyCNxp/RkYLhuxIrN1pJoQ6bJWsHPyblKEMExgbpmFwRrRAnRoZEKWOj+70v+Su
 M3FA7ZOjCN3owjkHa5k0zxu4l9QGyJZTM/iv/ioLmWBxz69YrjD2KB6wQwxciisn4qEE
 Q6PUu+AZE2aO7rud+fXhkqW0IMrdWoZjKisFAprl+abluwdUNlBV8l4bn5s9tdATwBwY
 7gKvUAnUlmWaU2KNrNKKJ3wFlS73jAOA690my22rUZQtwMmZuo4ZdaVP9r68g0uXfOMp
 X1xQ==
X-Gm-Message-State: AOAM532EoCm3hXPKZzKISGJbrcTFaGsDVTrtGf/1dkn4tInkXBex/bUz
 2S9mqeHljWyZYrorwaNgSsQ=
X-Google-Smtp-Source: ABdhPJzwGQWOC0I6R9+OHjfZ/iZ3x1t3TfAOEyesjAPVx/oKo1R9eOfSpI5WOxjRu4mpqrgcWQm9AQ==
X-Received: by 2002:a17:902:f0ca:b0:158:d082:ee3a with SMTP id
 v10-20020a170902f0ca00b00158d082ee3amr10191448pla.151.1650269806945; 
 Mon, 18 Apr 2022 01:16:46 -0700 (PDT)
Received: from localhost.localdomain ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a6540ca000000b0037445e95c93sm11777600pgp.15.2022.04.18.01.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 01:16:46 -0700 (PDT)
From: Hangyu Hua <hbh25y@gmail.com>
To: alexander.shishkin@linux.intel.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, gregkh@linuxfoundation.org,
 mathieu.poirier@linaro.org
Date: Mon, 18 Apr 2022 16:16:32 +0800
Message-Id: <20220418081632.35121-1-hbh25y@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 Apr 2022 16:43:58 +0000
Cc: Hangyu Hua <hbh25y@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] hwtracing: stm: fix possible double free in
	stm_register_device()
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

put_device() will call stm_device_release() to free stm when
stm_register_device() fails. So there is no need to call vfree() again.

Fix this by adding a return after put_device().

Fixes: 7bd1d4093c2f ("stm class: Introduce an abstraction for System Trace Module devices")
Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 drivers/hwtracing/stm/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index 2712e699ba08..403b4f41bb1b 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -915,6 +915,7 @@ int stm_register_device(struct device *parent, struct stm_data *stm_data,
 
 	/* matches device_initialize() above */
 	put_device(&stm->dev);
+	return err;
 err_free:
 	vfree(stm);
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
