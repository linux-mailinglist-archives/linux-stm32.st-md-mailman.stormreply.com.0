Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A536217A69
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jul 2020 23:31:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5318C36B2B;
	Tue,  7 Jul 2020 21:31:18 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F692C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2020 21:31:16 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id k5so231758pjg.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jul 2020 14:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2x+L8FUv9bI+crByz6/Ejtn3DTdscAGUJ17rPzAIyTM=;
 b=Uar/WVI5Uzn3sX7rG1DAuVylL5XgU7OFLcnSATfNdujh9l6dnFFSiueycjbskupllK
 celMxqY20h+WdblDasjQ1F38BszhI2do0gEHIlktty4KSV0cOnRKxhIon51VNKznyIec
 dfjSilPFBTh9IwRVFg7h+U0KJJNmXLwLR8y6O5q5t8M7D1nNA8n9EojU8azxptnVypny
 fv4+hH3JNyOLDCE7T4FTrp4aEYsq9aKCeO71waT+yZ8tQKUjsnBdfCq7T1oxa8kdcdHx
 +bophkIFyqn/1lEPOQBj6LzZix1MN8GBkXBH9dLEVXOIzFJ6CyTGtpVRVVpiQVnFTjMX
 BWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2x+L8FUv9bI+crByz6/Ejtn3DTdscAGUJ17rPzAIyTM=;
 b=gevN5IBdBsA3VrdJTrpxj0xYryL6OKNKWEf12imkD5diLOr4kjWYxTHKG0Aci03bWG
 tdN1YPUb7qsE92HZMRRWqrCH0RztE24hHcXCIUZDRAK1bPDZYq5424c5Jp0TvkAH4LZA
 W0CyNa74E54CN//TZYbGW/vH6R8nAmw9/7kUMmu8LcuulNmgxLt1TyxKZG8uDVaIUhbF
 ITkMuAlJtAsqDc5qEGNV8xdIgIGX+ENtkOJeT0tpeiA7Tf90aiTNmpylF1b3RlBQOC7S
 fI3m1KEXhnqHdWj8wd7SNBOWCKA+MXqusp61n3xQjZLJhhVtLWrjjozdBNvCC96WgVsc
 gt3g==
X-Gm-Message-State: AOAM53383Rqho7qJKGEdhPnSgryJoapOkPuwRfM8CwLsXAd1t+p84sNC
 jHyW5tEDPKW1h1l20alKF1apGg==
X-Google-Smtp-Source: ABdhPJxj36Ux6T1EDbfBl8b9cg/WZBuy2kEOSrmZQ9rkYWPCm3sFJTgo+Y9ZkjXG8JajBiUvgf4rxw==
X-Received: by 2002:a17:902:a410:: with SMTP id
 p16mr46001431plq.283.1594157474673; 
 Tue, 07 Jul 2020 14:31:14 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id o128sm23560832pfg.127.2020.07.07.14.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 14:31:14 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
 arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Date: Tue,  7 Jul 2020 15:31:01 -0600
Message-Id: <20200707213112.928383-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 00/11] remoteproc: stm32: Add support for
	attaching to M4
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

This set applies on top of [1] and refactors the STM32 platform code in
order to attach to the M4 remote processor when it has been started by the
boot loader.

New to V5:
1) Added Bjorn's reviewed-by to patch 06.
2) Removed Loic's reviewed-by from patch 08, it has changed too much.

Patches that need to be reviewed: 7, 8, 9 and 10.

Tested on ST's mp157c development board.

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=314523

Mathieu Poirier (11):
  remoteproc: stm32: Decouple rproc from memory translation
  remoteproc: stm32: Request IRQ with platform device
  remoteproc: stm32: Decouple rproc from DT parsing
  remoteproc: stm32: Remove memory translation from DT parsing
  remoteproc: stm32: Parse syscon that will manage M4 synchronisation
  remoteproc: stm32: Properly set co-processor state when attaching
  remoteproc: Make function rproc_resource_cleanup() public
  remoteproc: stm32: Split function stm32_rproc_parse_fw()
  remoteproc: stm32: Properly handle the resource table when attaching
  remoteproc: stm32: Introduce new attach() operation
  remoteproc: stm32: Update M4 state in stm32_rproc_stop()

 drivers/remoteproc/remoteproc_core.c |   3 +-
 drivers/remoteproc/stm32_rproc.c     | 214 ++++++++++++++++++++++++---
 include/linux/remoteproc.h           |   1 +
 3 files changed, 198 insertions(+), 20 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
