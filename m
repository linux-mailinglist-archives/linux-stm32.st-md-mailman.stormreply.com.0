Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CBF38A9D3
	for <lists+linux-stm32@lfdr.de>; Thu, 20 May 2021 13:05:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F788C57B6A;
	Thu, 20 May 2021 11:05:42 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7561DC57B6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 May 2021 11:05:39 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d16so12072348pfn.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 May 2021 04:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0oFfIWOdrNxxHDeBLAkvWpJ2lIKRgTWmgVtZro160nA=;
 b=NgzNWH/sWTyfspG523F3M89WfHPNXWnk/w5kyeLxo7FcaM+DuOjyCZbUk3FbfITIkI
 eXM5D7qbkqyA5IULgS2k4qu1LImkHPUUKnX8KyMyXc4UWFtgi3/UrsSqKPI1YKXBeafC
 yumG1AhjmP13RjNkrXNiNx8mJC3TCJb4Y3Z1jwLNWCRUPOxviTuGyLDSMw1EHGyjLfSI
 fQ6UFlKhtMtlh0+RtMANy6gCOVNBsO9O1OAWNYdc8A+S8hRSAnpkBEPFZDF2SJZUdnL+
 HZs/K5ZVpzR86VO3Inhw/89ynPrZIaV22i19X8Qen6DI491cd9rJJFVWgkQzK+YiNAdt
 X0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0oFfIWOdrNxxHDeBLAkvWpJ2lIKRgTWmgVtZro160nA=;
 b=dUCVeSlM/2nPnLHWF7YNv6S6ehPCrzNlY5Rjk9BabLQIc/j3sZLM8dmqEh030BGg/I
 RZ+R5zezY7Hl1PT6ZuiOEndhKAuxwO4xLqW3rxfZbeiLs1LU9W6DryZDMJGK6a6vdv2y
 7Ord/rwWQlH0HNxfLfAYX6ZXeeNNJi4W+0BxHixz1bYt+Leqpxw501JWSCIhQOCJnd6/
 aTx/xpVssmUA6hxXotypZyzvS08X8sva6CwzTquPhoSHADD5eYDCl1695vs2IR7rmq33
 krrgcUteyz3a3v96ZUgWJyw2Tf2TAtMoTi9ODUk937hrZTIutHB46Z8AjCRv1GE1lLnS
 j8kQ==
X-Gm-Message-State: AOAM532iXsN5dHSC1ra6ijKB4x3rtgC/JxLOvn37DQPBwS7jghoii80K
 ctpVGf3v3LPeG1OGkrDEz2c=
X-Google-Smtp-Source: ABdhPJwNSLnDX2NgTftaUo9jI4/HhJwLnQlxnfQwRUGa/5PdBWI9rxfBNoSJccRirWl2S1GSdeTn7g==
X-Received: by 2002:a63:f443:: with SMTP id p3mr3993109pgk.378.1621508738022; 
 Thu, 20 May 2021 04:05:38 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id hk15sm5839121pjb.53.2021.05.20.04.05.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 May 2021 04:05:37 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Date: Thu, 20 May 2021 19:05:21 +0800
Message-Id: <1621508727-24486-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/7] media: admin-guide: add stm32-dma2d
	description
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

From: Dillon Min <dillon.minfei@gmail.com>

add stm32-dma2d description for dma2d driver

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 Documentation/admin-guide/media/platform-cardlist.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/media/platform-cardlist.rst b/Documentation/admin-guide/media/platform-cardlist.rst
index 261e7772eb3e..ac73c4166d1e 100644
--- a/Documentation/admin-guide/media/platform-cardlist.rst
+++ b/Documentation/admin-guide/media/platform-cardlist.rst
@@ -60,6 +60,7 @@ s5p-mfc            Samsung S5P MFC Video Codec
 sh_veu             SuperH VEU mem2mem video processing
 sh_vou             SuperH VOU video output
 stm32-dcmi         STM32 Digital Camera Memory Interface (DCMI)
+stm32-dma2d        STM32 Chrom-Art Accelerator Unit
 sun4i-csi          Allwinner A10 CMOS Sensor Interface Support
 sun6i-csi          Allwinner V3s Camera Sensor Interface
 sun8i-di           Allwinner Deinterlace
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
