Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 844E71C87CB
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 13:14:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4596FC3F93A;
	Thu,  7 May 2020 11:14:56 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13B70C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 11:14:55 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id ms17so2487332pjb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 04:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+rp0hHwgqIdfgMKxOUzphxxo4JDZCcfnfLUjyAdUEiI=;
 b=S7E9vxwgne3IjONysfCfx0M3VX2AbXVhOXdey3dogNGV2F9OwqcBy3oTnxsMV7KGHv
 +C0iOQhkPwhJuz3mhviDDa7H5Hy+OffpMWdD4yp1YJ750RC0BNC7bBwXGYRxEzN3/sWq
 dBvNuWJmqhUgJIScldGp5wGxTV0vfwtEQnuOCvP9ellFEIiR7tvUi9pyVNUdeT/2vPlU
 KCUfperFTOp1Q5Xn0pNcdhUCPmcvZakvQuFhVNTXsgGPfgTBHCDqsl3IAJVb8PDH7A09
 jp8W9Il/Ex9De7qbCIerpVY3XezcvMHQq4qxT6KdR0kUaw9cP5USOO7TNMnkNjABweta
 wrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+rp0hHwgqIdfgMKxOUzphxxo4JDZCcfnfLUjyAdUEiI=;
 b=hrjqQ/XPXbfVvJAP0Tq7Dk8RF1yij04+MVuP4/BmW3xWKuBExvkHBzXD1igQH1WXXI
 tV/KS9Go8YHJaO/+IS2m7m9MOmkHyqTMmbn2DfWtY0sVGLmesbNYw2nspyf2NPZLxWfA
 nYmg3n55mxhps2HFkkQMBth/wPUesJVnWQGikOmeQErtEhQYn03dfbNOEYRu0XdjNGPx
 DH+Re4j5rx4x1Iq5t4s9K02ubKRlPkDdZ0gRYs2FqmRoQwmJpE9UkU8q43Ddd3+iFoCB
 8ibtwVZhrllTJ+wm1FhjMMxtyzSWyhktBEngNbMyWPbcBoDvf6Obhe9dSebMeKCSNrGA
 ikNQ==
X-Gm-Message-State: AGi0PuZ9Mls49hPItnI6avgmdkzQdu1lcxIFu/KHMkFvIedqClxels+5
 FP3r7j3Poppq12Cikw84wRc=
X-Google-Smtp-Source: APiQypLaeQmfMqENPb7tQLhoxQC3jxPkAodQ3l/6XIitoKL8eDkg01q/ii73kk1m0Mx56maZ5k9kDg==
X-Received: by 2002:a17:902:bf46:: with SMTP id
 u6mr12316877pls.318.1588850093478; 
 Thu, 07 May 2020 04:14:53 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id l30sm7304041pje.34.2020.05.07.04.14.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 04:14:52 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 philippe.schenker@toradex.com
Date: Thu,  7 May 2020 19:14:45 +0800
Message-Id: <1588850086-24169-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH V2] Enable stmpe811 on stm32f429-disco board
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


This patchset has following one patchs changed in V2 based on V1

Changes in V2:

[Patch V2 3/4]: remove id, blocks, irq-trigger from dts node.

Changes in V1:

[Patch 1/4]: add I2C3 support on STM32F429 SoC
[Patch 2/4]: Add pin map for I2C3 controller on stm32f4
[Patch 3/4]: enable stmpe811 on stm32429-disco board
[Patch 4/4]; Fix stmpe811 get xyz data timeout issue
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
