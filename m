Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2308A3C9B83
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jul 2021 11:25:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7EF9C597B1;
	Thu, 15 Jul 2021 09:25:27 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB3C8C597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 09:25:25 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id j199so4618908pfd.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jul 2021 02:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mCcTQBeV0g268A2M9TPD/9QxrKalElJIkYLfh3ClvtQ=;
 b=Hx12agFbmL8htX+dr539NiSOb1OzLWj+QjnX8mUQBWVX6ExO4WMMYR1MKn7hnSjzMM
 rFv17izWcpK1xoNuzf3G0fvNjo1g88292HTPJZenvZP+1xaIbMcyQmL/HblJ4AdRYjCE
 pQel4PvXS016GiSh3kl7uo4n+AkSqDbZ0NSV/W/gGG32Zc+kExFz98iyYTk1rkIK3gNe
 s8qXkWAfTylADMyMIljPZBckRn6bC7+C0vf6zoejQ+PapzxhvmaN8IAfHJ4nap8gMXno
 Ii1ZlqXXG7BYgkoFY6TTZEKsO96BIPyGDbD8tzYAzf4SunPtdh7ClKc6qhGSAokCQreM
 DR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mCcTQBeV0g268A2M9TPD/9QxrKalElJIkYLfh3ClvtQ=;
 b=dX87gKTmHbcxXSgwe48drRZLw7PZdbdYPq9ok/JNIoxaGNbAmSTpwZ5FjI3ujOfcqx
 cLmt12gPCHHikoV274w3iyNDO4lPvma0dq+bZl5FoD2JTntotK7Ibz2j4ByrVLe/L99u
 021L7T5pmbwGj2VcyBwtBBpV7BRCTn2jSe8ctx1a7FQNLzZq3v8kWpaVGl+kA+casMkI
 ZzcVEVikjVeKoE0kkdlo/6oI2oZtR1Of4/xsnca+o5l56JNN7p0P8MK7mbXa04f2jLDq
 tfxtthex4RTtxU2GJBaEQS3GU48uQb+7LwGDDWP5Uy6ZcK3SY7naz/fOz19WD3EsGkKf
 fs/g==
X-Gm-Message-State: AOAM530FSGCRCOOlyZErYZQ7kmvTIaw4chk8SQZ4MFPhanT9RG2k+Idg
 KV8Si3fT5GlidfH1lnPafDk=
X-Google-Smtp-Source: ABdhPJxMJxo14DoKAz5WkwKvBVs4O2DW4zPJOjE/luIJX85eXMwUytMX8KL2Zyku97hm8pr46j1iNA==
X-Received: by 2002:aa7:85da:0:b029:329:aacc:333e with SMTP id
 z26-20020aa785da0000b0290329aacc333emr3579809pfn.60.1626341124469; 
 Thu, 15 Jul 2021 02:25:24 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.25.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Jul 2021 02:25:24 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Date: Thu, 15 Jul 2021 17:24:20 +0800
Message-Id: <1626341068-20253-12-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 1/9] media: admin-guide: add stm32-dma2d
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
v2: no change

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
