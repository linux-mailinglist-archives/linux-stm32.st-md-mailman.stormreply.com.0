Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C3370B6E1
	for <lists+linux-stm32@lfdr.de>; Mon, 22 May 2023 09:46:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B301FC6A61A;
	Mon, 22 May 2023 07:46:17 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED19AC6A5E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 May 2023 07:46:16 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-30a4ebbda56so1655469f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 May 2023 00:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684741576; x=1687333576;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RIVk01vUE32Fs5xmh6uGF+YSpQzTcY9OgG1aTov+WQM=;
 b=aJRU56KCSo3rpIlXDTIxgutOm21kKy4pCK66q+4n23HGRVPpaHZ5t/IbiMDcg7xCuv
 4GCem5qCSVC6EYh9WGOI8/10GlUS5tuxOR2nUWxbeeJF167/MDDiSn4dWSw0S+LLy31t
 CF/ABoFrh40zfGyBbPC+qXy3UqY4m4fe6+D/rlof4kyKWHt2VEZRsXwcoONP6Dheffpk
 BbXo0EkS57WXREeM5uUaCQh+FhxLv2bVH34MMgZRF7x01Sj2FVKrqsB9bLYAK8y8+o74
 LSFCN5M2zDH3pSfwQpdZPksdF7Cs7/6XzjjGKsqE2zouxyHOWZNyA4v9LbT7x5WN9ET+
 NcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684741576; x=1687333576;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RIVk01vUE32Fs5xmh6uGF+YSpQzTcY9OgG1aTov+WQM=;
 b=CVtIXEwGA1xymvA86kvYjGbbyKiD/3unS/+Eg7NyvFx6BYB2tKgeVI2vzDUtXAL+XU
 BcDdLZMQOVjr7Es1Vjsbxjz58O2SG+0hSmehEhNSoqSkbZ2cnz7RxuJlyWa4LqgyOZfR
 QewHnx0rfdEp6o4nvVrOLgVYKnSioU2FPFPifkyy+ho8G6byJlg9GFR2XdqRF+1dMLES
 7MQzVwlnud6x0+3sNKa/F5qA8MakqIBBTwPHM02x0zepuywBx036vuZM6PPgckNNSVaJ
 aHVPNl5NJKC+1xF25k3E91kSkAmjigH6ZSt4PkO9XISXJIeWJX9/mrW3VWQ0S/FP0Cuh
 dIIQ==
X-Gm-Message-State: AC+VfDxbaJdMseq0SgEUItZHuzaxIJ/rGQwAnUyLRQPfbPCYHbeSRdfh
 YodPE7EAXmaGC6uu8Lol4AcSpA==
X-Google-Smtp-Source: ACHHUZ5WPY0s+puoCLwPIv3+dZIthZntG1qO8mejkYgqwA0xER2gHbAwLfhkvLu0SZTyKxPKdCZmfw==
X-Received: by 2002:adf:de10:0:b0:306:2dd6:95d3 with SMTP id
 b16-20020adfde10000000b003062dd695d3mr8301383wrm.22.1684741576394; 
 Mon, 22 May 2023 00:46:16 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 a2-20020a5d53c2000000b002ffbf2213d4sm6816964wrw.75.2023.05.22.00.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 00:46:15 -0700 (PDT)
Date: Mon, 22 May 2023 10:46:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <6f457246-6446-42cb-81ae-d37221d726b1@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 kernel-janitors@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] remoteproc: stm32: Fix error code in
	stm32_rproc_parse_dt()
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

There is a cut and paste bug so this code was returning the wrong
variable.  It should have been "ddata->hold_boot_rst" instead of
"ddata->rst".

Fixes: de598695a2ad ("remoteproc: stm32: Allow hold boot management by the SCMI reset controller")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 0e322697d210..a7457777aae4 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -755,7 +755,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 
 	ddata->hold_boot_rst = devm_reset_control_get_optional(dev, "hold_boot");
 	if (IS_ERR(ddata->hold_boot_rst))
-		return dev_err_probe(dev, PTR_ERR(ddata->rst),
+		return dev_err_probe(dev, PTR_ERR(ddata->hold_boot_rst),
 				     "failed to get hold_boot reset\n");
 
 	if (!ddata->hold_boot_rst && IS_ENABLED(CONFIG_HAVE_ARM_SMCCC)) {
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
