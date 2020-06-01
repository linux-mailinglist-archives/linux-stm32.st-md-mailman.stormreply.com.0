Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 207E01EA8B5
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jun 2020 19:55:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF375C36B22;
	Mon,  1 Jun 2020 17:55:57 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4474FC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jun 2020 17:55:55 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id f3so3815704pfd.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jun 2020 10:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zACkuhg/77H3zeO+PGHNh+9yMlSwDDWi/x5X1ISMcog=;
 b=PLoEnhnypIxdDYglWjZWdbmVY9O/3d/FXn7/fOGLX1J0QDbcyq5yORuXvRPyf69GmH
 bPmuZpFDZjpxs3BNlZhAHlyAgGtEMEaGUOkeX2GeG6uWEGH6IiHYN5iv6fgkoia729ic
 ukbV9fvbH6EccxPGYp4IcT2N++qdipIqSfWyHPUiwWylioQAnUx6SmnS0U5wt9sn7I2r
 UgI/3DvCL6guNdStmxOeftLH3GgBU0iz+2AdiElVirEa8e3vyBspGCr1Bhs4voehcJiU
 uexyoOA9cpespFyQz8k1bf0tB1pWLksPQnbJGucIYnyTYj7SR+jT1oVyu66oYWuZi+iR
 NJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zACkuhg/77H3zeO+PGHNh+9yMlSwDDWi/x5X1ISMcog=;
 b=KOLKTPnZmjyqj4WtZMYTCYt2zbAAOggsG1U45j1Cq52Q5ahvK+pczlYHa2v0GzSJcZ
 xYT6/C5Lm/ty7bZ9fZhBJC/rquubBnunMiYyXbiJTBDfdY1P/nLTukLez3BTn2fZTHbr
 PKpTz5SwxksTzVU4PXG27iExDspaGiOvDu/O2ndKXYBmhPHJcI1v0fXmLZBzaosiAndk
 N0g8p8IgJ8evRwDY8jFUyRbg+/1PT0WNVA7gVzTcJp0i05S9od39MnF1qm57A4WaVktW
 wiDP/HwV8yLVfEfji7nkccchPUQ1rtnjDtBhSUWfQd7t853tFgZct2Zj71Bf25Q5RO1K
 R4nw==
X-Gm-Message-State: AOAM532he9T0sgppS4uyjELo94qZt2eueXzCOSu6e0rC0Wb1Y+/hTC/9
 TZaAs3SYMIO/9OJPB2+GzvBhmQ==
X-Google-Smtp-Source: ABdhPJx7mm5a3eTp+VHkriv3BjsSxvd0F8RrxXaATmZINzJsX7X4HNjbdTel9tb4XVNDl4GzAM/86Q==
X-Received: by 2002:a62:1681:: with SMTP id 123mr20422249pfw.306.1591034154312; 
 Mon, 01 Jun 2020 10:55:54 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id p7sm64771pfq.184.2020.06.01.10.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 10:55:53 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Mon,  1 Jun 2020 11:55:41 -0600
Message-Id: <20200601175552.22286-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 00/11] remoteproc: stm32: Add support for
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

It carries the same functionatlity as the previeous revision but account
for changes in the remoteproc core to support attaching scenarios.  More
specifically patches 6 to 10 should be given special consideration.

Note that I skipped over v3 and went directly to v4 in order to synchronise
with the remoterproc core patchset[1] that is set at v4.

Tested on ST's mp157c development board.

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=296713

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
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
