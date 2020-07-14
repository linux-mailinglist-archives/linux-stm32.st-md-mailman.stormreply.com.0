Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE3A21FE04
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jul 2020 22:04:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AD2BAC36B29;
	Tue, 14 Jul 2020 20:04:51 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 989EAC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2020 20:04:49 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z3so8023369pfn.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jul 2020 13:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LjzGXptWS/l0yG6s3mnPFGJ9K+cv+bp4hvQ+18wjBOc=;
 b=pSWmdrIlDHbS9EiuzX5lEL+nl6cwEFKhWNqXr24ppucg3KUIEItrCqgIaY2CfWl5Sb
 VXCPBw9smvPY9q5wN2FjPisBSw/oMoLzsdE3mUlNlMnIJrtSGiPWAQ8qFoBUwS9hLECt
 stXm8A+QYTxXLKJ8xPOpARtEIRygLfZrzqSUk32OQC9+EnRMfrGDd9O+8uiHIgkWAqI9
 fRKIwqRUabJDEGXhMj+fBvuMe26diJ7knaDmPQsIdNAvmJGr5ipTt5Iv1KtzvJgdD5hP
 GdlvcmzYywX8JcOuLydc3CI+W3lrUd4maNGsBsu8XCh0mOoBftWAZHXFJQEo1B9BYKwS
 dykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LjzGXptWS/l0yG6s3mnPFGJ9K+cv+bp4hvQ+18wjBOc=;
 b=Uj8xdspqpfikKsh2Fb8R1yyFqtjp2p0h7Jj+5AI4RSJ5v1J1cCQPjWZDyPOVa9KLKY
 dQ1fZmWR/Sy4pN5NANBwobWEEouRnrSr/uM2JN1Qox+ZCl7v+hYw+gPM1bdaQVYZpEwy
 F/AihFX3xUm+rFKVzP9+mL1S0ASUyfB8I8oKE2z0qcxQs34UUlXC/0de6X41nbLQ9Ea/
 Eiq94B1T+CHoj+IEga2GJGNqdseGJCsTmsR1fsf3tlq5M2gw63esOsjpwePafBpVgYRx
 xPfhCu3D0cpvg+0t4Ob/U53+zcy2qmslBxkSBj5+utUT94dl3EZxiiy6d7T3VdoYgG5w
 wvIg==
X-Gm-Message-State: AOAM530T0rInXiPdVBqRoaPm6KV9zb8qglOKjO7o+SgqWmlkl5An0XMD
 Cgrx5M5bOZxknecUAfbaPGdHJQ==
X-Google-Smtp-Source: ABdhPJzCWJ6LvA6aca6tiDqN7zYn4kfS9K/PQYq6jFFANS1a+sv1tJBiB1G33DS7mXamhMqGfm7uDQ==
X-Received: by 2002:a63:2146:: with SMTP id s6mr4602907pgm.411.1594757087541; 
 Tue, 14 Jul 2020 13:04:47 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id t13sm3262959pjs.17.2020.07.14.13.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 13:04:46 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, loic.pallardy@st.com,
 arnaud.pouliquen@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Date: Tue, 14 Jul 2020 14:04:34 -0600
Message-Id: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v6 00/11] remoteproc: stm32: Add support for
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

New to V6:
1) Removed extra newline in patch 06. 
2) Re-worked title and changelog of patch 08 to better reflect
   what is done by the patch.

Tested on ST's mp157c development board.

Thanks,
Mathieu

[1].https://patchwork.kernel.org/project/linux-remoteproc/list/?series=318275 

Mathieu Poirier (11):
  remoteproc: stm32: Decouple rproc from memory translation
  remoteproc: stm32: Request IRQ with platform device
  remoteproc: stm32: Decouple rproc from DT parsing
  remoteproc: stm32: Remove memory translation from DT parsing
  remoteproc: stm32: Parse syscon that will manage M4 synchronisation
  remoteproc: stm32: Properly set co-processor state when attaching
  remoteproc: Make function rproc_resource_cleanup() public
  remoteproc: stm32: Parse memory regions when attaching to M4
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
