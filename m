Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF0743315B
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Oct 2021 10:44:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8CD9C5C84D;
	Tue, 19 Oct 2021 08:44:06 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22AC9C5C84B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 08:44:05 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id b14so3410140plg.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Oct 2021 01:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Fpv8AcIulys1PXAdWath/FGKH2Raxc3fRVYv8xcpy/Y=;
 b=ZQyuDd1JPbt6Yem87TsLy2jaYyQcfhxQLoLZ3GRcSyAAfjuRfnE1vU4p0fNuBbhZr5
 KTuGHA3zN0B/zG798Fx3Sn5X2LvRBwBVWPTFXJdqIG5AVhT10CU0d0E1t9XflnPnmbk7
 dFK4owQ0ubhSm3fREJfMfW2TgFWKcm4E5oRsXFrYPKY0AwoqWOgnAusosp0wt+mR5Sb1
 AXTF55TiXmfVzuPxPLXcq9pAPUBFotptpcvKu9jX9KFPMuPHyL2ahguULvjEENZpqkSx
 bcey0AUXhU1bhwrU9tUOJ0fzrGyZAjvKoSQBAZZ9QrzRHWc4G9f+EDReyzsAdcUUt9qy
 GM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Fpv8AcIulys1PXAdWath/FGKH2Raxc3fRVYv8xcpy/Y=;
 b=HarejeTXDFpvqMKBNTpLUQyN6FufGwg+kjNuHhR4tki4AYLPGWLPS0iDVGYHuP9OJm
 6LIxMoZP1c3ZvBtVv7sgQagf0Hp4jqEfTEJGHO9dCdQ0FiRRk+C7xcCl9LY8MYizoic4
 ZRmMOCG3jTPtCe7Rtl7f1DAZQdkMEaMQqfx1o10XkCVSu3W9o7kdmlg+J/2M+XkTf/fP
 8eiyV1BnM2xxuTX3ORdyNXybgSP1DtJm3kRtOnlMQBaK4LQhzLskAq5ocTLoBFQlaR7M
 eBDWNGppeF6Gq28Z1mnHc9bEojhDqDeTRt08W4p4MXNPPXa3NYXnHo5OGW1qc+8A5Ycb
 Y3Eg==
X-Gm-Message-State: AOAM531s17NVs+wsXlGPR0D6aj9sNeKZlt1jQaRqoymchBMja/KB1Klu
 JO4nIExrMwfnNzZM13+GPx4=
X-Google-Smtp-Source: ABdhPJwjGCds8GUyFgYQKvpUI+Vs44NhfMvVq6jqaLXrSPXVrqRx350tjn7R7itLUjK2s5ZQ+KtYvQ==
X-Received: by 2002:a17:90a:7d0f:: with SMTP id
 g15mr4938039pjl.227.1634633043820; 
 Tue, 19 Oct 2021 01:44:03 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id c11sm1824716pji.38.2021.10.19.01.43.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Oct 2021 01:44:03 -0700 (PDT)
From: Dillon Min <dillon.minfei@gmail.com>
To: mchehab@kernel.org, mchehab+huawei@kernel.org, hverkuil-cisco@xs4all.nl,
 ezequiel@collabora.com, gnurou@gmail.com, pihsun@chromium.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 gabriel.fernandez@st.com, gabriel.fernandez@foss.st.com
Date: Tue, 19 Oct 2021 16:43:20 +0800
Message-Id: <1634633003-18132-8-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
References: <1634633003-18132-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, hugues.fruchet@foss.st.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v6 07/10] media: v4l2-ctrls: Add
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
v6: no change.

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
