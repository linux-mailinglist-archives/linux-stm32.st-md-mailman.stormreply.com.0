Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD73E43ACD7
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Oct 2021 09:12:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83B6AC5E2A4;
	Tue, 26 Oct 2021 07:12:10 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FC34C5E2A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 07:12:08 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so1465108pjl.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Oct 2021 00:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pcmEq5vv4/Zod2OeFqMFRTk1dpSjGR5ACaXGxWChEao=;
 b=UROeYmwKyzBBptFZ2WM2sIvqfej1E24tNMxcO+fJbUuoHrtg/lP7jjI67OH+qdCK4c
 2EX6FMwa7uegRS2RqUpww4jwphTv3ml7Ungd7Ij4XVp63cooOxW5qnW3tLyuLnL4Ujec
 yQTW9BW+JoxLOLN3rYXVIFEeMznSxvuuCrfsVwkgbJCscGZIaOkCz3EXJPM0XoNyNhB5
 wWzFJss7rNc1Nx1qv4ymI2cYLw47ggMMnOVtp1I/v4Wx8VSxQP/njbRy1wHnwUsLcKK1
 4Y9AhoJBsGfjAxDCp94+ofWuBiouce9rBw3kpF2H/QE8vQSax6TWM9HPtsL/BuMIu2jj
 ZFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pcmEq5vv4/Zod2OeFqMFRTk1dpSjGR5ACaXGxWChEao=;
 b=TiyYjecXeOk4tiqbpdIgOKQ3VMfQbI/oprEv8Mp52lnX2wNsKoTnHFPfYvsyt3vEFM
 VBzQxNw1q36N+KA+VKu9pzcbRpkf66TJmQa3LQWiOAR7YP8nvvrqxF8amTBHsUUUlR8l
 WE6ofx+UYV+b4g4wAxaI3eczcngyisyjA2RQ7Kv8W/WBlneiUqyAQMwUWb11DmGb5EBP
 UWJ2EoaUhGCMNj8h2OGQJEiqcQVFj9wI0HDBx12aCYXAEHfogG9hnXeL/1AyYbz2onUn
 KHRu+UX7maC+TcKgR/jL+BNKDgWjFeftyjDOAzqo/J3Fb4BhVFm1g7+LyWlaVVysmzdU
 22Zw==
X-Gm-Message-State: AOAM53161S8T29ARExrjOtZn1LYQtaDeERjV4u1CvFJ5YAOm88bTGNFP
 ubzR9fT2/rx859ks61gjDMs=
X-Google-Smtp-Source: ABdhPJziu59cIkiWnsyl37/UYoRpXfnGMq87xvUw1+ZM3AAuKyK6nSnS4JbZ8hGQuLkxHrsKU3d2lA==
X-Received: by 2002:a17:90a:2bca:: with SMTP id
 n10mr27232652pje.241.1635232327365; 
 Tue, 26 Oct 2021 00:12:07 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.12.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Oct 2021 00:12:07 -0700 (PDT)
From: Dillon Min <dillon.minfei@gmail.com>
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Tue, 26 Oct 2021 15:11:19 +0800
Message-Id: <1635232282-3992-8-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, lkp@intel.com,
 hugues.fruchet@foss.st.com, llvm@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v7 07/10] media: v4l2-ctrls: Add
	V4L2_CID_COLORFX_CBCR max setting
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

The max of V4L2_CID_COLORFX_CBCR is 0xffff, so add it to v4l2_ctrl_fill()
to sure not beyond that.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index ebe82b6ba6e6..0cb6c0f18b39 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1400,6 +1400,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		/* Max is calculated as RGB888 that is 2^24 */
 		*max = 0xFFFFFF;
 		break;
+	case V4L2_CID_COLORFX_CBCR:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*step = 1;
+		*min = 0;
+		*max = 0xffff;
+		break;
 	case V4L2_CID_FLASH_FAULT:
 	case V4L2_CID_JPEG_ACTIVE_MARKER:
 	case V4L2_CID_3A_LOCK:
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
