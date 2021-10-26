Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F66243ACBD
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Oct 2021 09:11:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 044E9C5E2A4;
	Tue, 26 Oct 2021 07:11:38 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2ABB0C5E2A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 07:11:36 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id n12so4992602plc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 00:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=d7vVyS9haFy4U5/m3XJ2lTxXqjjSqdtOiBYvow20ymM=;
 b=F1lkbzanIYEeyg198jRuVYlN6ThMJHFUk5EmlSopk2yVveb4aeMDnj2vO9ZZa78bXn
 kYVnUBPrHxLVPDkolc1fgILbJa5Ocd+vhhR0JLULCqnY8JVzw2w0rRx+KuwbzCxp0GQt
 3HZjtAZq8b++k3wk7BnBDb4/+1Q6nM1JJ7v2c+mQ1tbGdJxdoR3SV5VXSSiwsqyUs2Rp
 dHWIrxIpeN8rC2K/R9NJ56rGVL82VHD4WEMubsGIyal+tEAIqOCw3dev5OrN7DOOw3at
 7iPFd00yiyS4Wn0Tg/jBC2dO51+48pz04/hOvpDR2v05X85OymtLayXviaKqG8vZtCYj
 SMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=d7vVyS9haFy4U5/m3XJ2lTxXqjjSqdtOiBYvow20ymM=;
 b=IYJGcIw/C24v35BTuR2QkJKyLUXY0lUs9+4Wk5qonrfXmezuk+2+Jn6fR8g5NlM5WW
 eXYc5UBtioMeUGohJ1ltf4kd5EM9bNeQx9p1Ow5qMwqkKf0M6Ca+u8XSrWJzfo8G06vs
 uNBByZZPIgGPf73WgDvtpqfDpE7CLyZ97OFx91v/A1qWyVJ41pAfXR5KeEEjDG04wkh8
 RhVyTAU/9n0AT3Df2Io/5hMFFxq0B+1UNaYAMu7bgwOAAeK0CEFyD2xnEGXyo1dljvQI
 1e6RDT+SAZTxeDAIERq6aauaUuHTU50Qg3wFvbnfP0JPK8w+XGRf7P7Mvji2bg8TdXLY
 X1Dg==
X-Gm-Message-State: AOAM531fhfC9H4EjbgmFOhJPJbfEXsm1CSEisp+xjMET+8fV7DeSeeb/
 zOwW23cHGkaylLkMpFeexvQ=
X-Google-Smtp-Source: ABdhPJx2umfrgoaYiA5DKlzeNXcdI9wmyCHXDMiz2LZ5vi0M6iFBpsIoC4Gsd+uJkw1S6GwuLzSa+A==
X-Received: by 2002:a17:90b:4a07:: with SMTP id
 kk7mr26475946pjb.37.1635232294959; 
 Tue, 26 Oct 2021 00:11:34 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.11.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Oct 2021 00:11:34 -0700 (PDT)
From: Dillon Min <dillon.minfei@gmail.com>
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Tue, 26 Oct 2021 15:11:13 +0800
Message-Id: <1635232282-3992-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, lkp@intel.com,
 hugues.fruchet@foss.st.com, llvm@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v7 01/10] media: admin-guide: add stm32-dma2d
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
