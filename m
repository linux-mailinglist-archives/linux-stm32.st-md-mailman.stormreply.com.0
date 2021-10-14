Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C98F742D6EC
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Oct 2021 12:25:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 842ABC5C83B;
	Thu, 14 Oct 2021 10:25:20 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 405ACC5C839
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 10:25:19 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id e7so5109256pgk.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 03:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qlIjua7EzzlWfNKFnvLiSDvXnVEOxFzRdk3SXOU8E2c=;
 b=c20GPHZ27ma0xaD1YWE8QpEYvYFVqb6a9/kdv8A5Ps+j82AqpDsN76l+NV4YbeWfPl
 w037TDKjmjfMhoQSJ+Y/K8K3Ev7fM26sYybKhgqjRw3kJEJXqkEPRyZOf/9Z+WPS97Go
 TlH361+xeqfV0Mkm7s/XXIolATnP1T7JQ0EF8i4Vt6Yrebq5OyLPAPVSV4EO1dqxRfhc
 f6+VXP779fcrKjMATybRgVBIxViOIzkQ3Yf/X4AL8qhvnzISnMCJ0eBEUbrqrEixVBlH
 UPpIjtynJcslapKndOyV95aU6o27huoodGwgwMi/eCQ83YH2Gv9afnv408mavAnsp6Pg
 Sbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qlIjua7EzzlWfNKFnvLiSDvXnVEOxFzRdk3SXOU8E2c=;
 b=OVsy52uoUWD/8lI/07cAdo1QS6Ha5w3mD8mCgaW0NwGfJNA+M5IixvfwChGcXlX9Ha
 YHxhdllu5oYGOh3Q+PXussvFkT/pknKRtS9M/HmqHeesSjHkNR84TpgIcETkaUzw5tgG
 5wCeuv2X/O16pTshGIB0pmbJZ1aBIJ/q4PmWPURK/5q8XB2hG3DboADYP48WvzQa8wcN
 cB4iu0V2MlUtmz7drG/Gd12sT9bP/tUwIRGbMeFNVCHVMkdUGRRrwzHOzYTIupQNIBix
 50BWbBXAQ/BiAFadfYGCqqzlHqBFutH9pTrZHYxiWS0qXCP1ZAmpcx4ivWJBzpgSpiPp
 8VCA==
X-Gm-Message-State: AOAM533qNFkhdth9/zIopTgUSzEV/H7zJyder4dHVK52sUUqGvCrurGQ
 zJz5PUqwZjGExuovJkDZe4o=
X-Google-Smtp-Source: ABdhPJwr/VaPTK3XZxFWTLKcnjgAte5R7jgVEPQzhe/vi7U7MgGrAahbpF7hSZ7lNm+yny2FyDi3NQ==
X-Received: by 2002:a62:ea04:0:b0:44c:7370:e6d8 with SMTP id
 t4-20020a62ea04000000b0044c7370e6d8mr4652456pfh.18.1634207117968; 
 Thu, 14 Oct 2021 03:25:17 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id ip10sm2105939pjb.40.2021.10.14.03.25.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Oct 2021 03:25:17 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Thu, 14 Oct 2021 18:24:59 +0800
Message-Id: <1634207106-7632-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
References: <1634207106-7632-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v4 1/8] media: admin-guide: add stm32-dma2d
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
v4: no change.

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
