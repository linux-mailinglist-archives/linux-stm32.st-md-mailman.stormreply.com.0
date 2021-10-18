Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1529E430F86
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Oct 2021 07:05:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F798C5C848;
	Mon, 18 Oct 2021 05:05:32 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91CCBC5C845
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 05:05:31 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id e7so14868399pgk.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Oct 2021 22:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gBhJdCQI3tgtAb+zO+s0+nyy0RkQE7ndnmuRgYdQzh4=;
 b=A4ueMt8YMHWW/89Hh4pdnL//KdrM/svGtwnfxp+r3w3lF/50FZqd/5YFCkL0jU/H9Q
 q7sMGUB7fvz9K33mRO+tE+q7nbC2KV3+gv8yzUMInzTRRyKtdG9uMZ64e9AzzIVB6iJb
 ldev6OY3KCHbw1rnKyY3vuQD7UVvBrofYRQFXVvmRvrN5HEXeSsGBpjBPgv0qp0Q7gC/
 e2DIqgWGb3f015ajx8fjLzg6vIGpI/Qg2/5cbE6QqjjXPmKxEPMdIE+4LOHxsvTjbYNH
 6m4mCxaDIWmArBiCArZ2uS/lB7mNgyCgLKpM2jKiNvRfmy0do3iruFzVlJj9MEx0K7sU
 n2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gBhJdCQI3tgtAb+zO+s0+nyy0RkQE7ndnmuRgYdQzh4=;
 b=ofPOW0vRrb6C4kkUcaJFD27pFgLUdS4+vsvFSyRUkHl3pdLfXp//qNo4zBAUzd0ERD
 hBiOaJ4TBlYZQEVjGKFDxPsRbiDFbi9LyDoGvFFf0DL+OyxHjpAqLGB4F/iFKKfVkQBg
 b8H4HDjrgCtc/hNCYT2iDN/axiWvbCHyZjEg5AFPT1G8utoKkRXM5QagzQQvzcmzFYnl
 FA+4iB97Ik6gjkBkzUGHKbeq8NfF4JGpwLdzHgg9sc66DS/qU5OzsyJ54dBVRjKq3J3c
 ct7pmCEiWpbfkh7ec+Id6AWCJAa4Mwx1JgAjysykNteEC/3ea9WUz78x50D1ggYINTu6
 T7hQ==
X-Gm-Message-State: AOAM530p0g/kuYDiau2Blcmq8Agcepm4qNGUCgZCYrUncetLnxMVfY0Q
 Ci97hgabFcYoQ0Jmt0vKsdY=
X-Google-Smtp-Source: ABdhPJyCsuGeq8UL5I8geM4XvFrDzoZlwiEmGEWko6BtyDIXuIYoj91fZat5S85qitooIzHRujHGBA==
X-Received: by 2002:a05:6a00:23d6:b0:44d:8426:e2bb with SMTP id
 g22-20020a056a0023d600b0044d8426e2bbmr22738198pfc.30.1634533530348; 
 Sun, 17 Oct 2021 22:05:30 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id c205sm11416625pfc.43.2021.10.17.22.05.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 17 Oct 2021 22:05:30 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Mon, 18 Oct 2021 13:04:45 +0800
Message-Id: <1634533488-25334-8-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dillon Min <dillon.minfei@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v5 07/10] media: v4l2-ctrls: Add
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

From: Dillon Min <dillon.minfei@gmail.com>

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
