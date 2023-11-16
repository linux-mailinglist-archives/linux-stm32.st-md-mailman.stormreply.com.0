Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB087EF496
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Nov 2023 15:35:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E0B8C6DD64;
	Fri, 17 Nov 2023 14:35:33 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60FDFC6B44F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 15:48:30 +0000 (UTC)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: andrzej.p)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3C4316607359;
 Thu, 16 Nov 2023 15:48:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700149710;
 bh=FWoRq71D+3CZWvgfQamGU6bN0kUnW+MQUhCIbwvri58=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dmvWKIACvVm8j1f0ShhDkQUcTBQpus3oQZsJORrCeE0Zs22+DDxZtF123CnE5cdlo
 LNAbDrYcaX3lN76LF2kTVRecK7MfohVzK29uMcu/sGkh1cjm3beTb+QhQ65gRpyRoU
 vpGjAg1yyqacC6K4acERKOE9Z/K2PlMwNVjWxT7qD1ucqibzuZ/2YkNgus43Bw3VTf
 Y3rNiyomHPbD8jBLEJbe99QkHFerTrbozpkaMu8yzaK/9AKlqLcFllDflm8IzGjayn
 qOuP3b00Zp8E5sZm/im6xXR3kU6sDok8wz1JYCzBZNWT7vsUt8ZebTUtpVBIC5Iq1b
 2q6bAj/bppDVA==
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 16 Nov 2023 16:48:13 +0100
Message-Id: <20231116154816.70959-4-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116154816.70959-1-andrzej.p@collabora.com>
References: <20231116154816.70959-1-andrzej.p@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 Nov 2023 14:35:32 +0000
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [Linux-stm32] [RFC 3/6] media: verisilicon: Improve constant's name
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

For VP8 BIT(18) of this register is for enabling the boolean encoder.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_h1_regs.h    | 2 +-
 drivers/media/platform/verisilicon/hantro_h1_vp8_enc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_h1_regs.h b/drivers/media/platform/verisilicon/hantro_h1_regs.h
index 7752d1291c0e..c1c66c934a24 100644
--- a/drivers/media/platform/verisilicon/hantro_h1_regs.h
+++ b/drivers/media/platform/verisilicon/hantro_h1_regs.h
@@ -70,7 +70,7 @@
 #define    H1_REG_ENC_CTRL2_DISABLE_QUARTER_PIXMV	BIT(22)
 #define    H1_REG_ENC_CTRL2_TRANS8X8_MODE_EN		BIT(21)
 #define    H1_REG_ENC_CTRL2_CABAC_INIT_IDC(x)		((x) << 19)
-#define    H1_REG_ENC_CTRL2_ENTROPY_CODING_MODE		BIT(18)
+#define    H1_REG_ENC_CTRL2_VP8_BOOLENC_ENABLE		BIT(18)
 #define    H1_REG_ENC_CTRL2_H264_INTER4X4_MODE		BIT(17)
 #define    H1_REG_ENC_CTRL2_H264_STREAM_MODE		BIT(16)
 #define    H1_REG_ENC_CTRL2_INTRA16X16_MODE(x)		((x))
diff --git a/drivers/media/platform/verisilicon/hantro_h1_vp8_enc.c b/drivers/media/platform/verisilicon/hantro_h1_vp8_enc.c
index 05aa0dd9c09c..08c5079fbfd0 100644
--- a/drivers/media/platform/verisilicon/hantro_h1_vp8_enc.c
+++ b/drivers/media/platform/verisilicon/hantro_h1_vp8_enc.c
@@ -1226,7 +1226,7 @@ static void hantro_h1_vp8_enc_set_params(struct hantro_dev *vpu, struct hantro_c
 	reg = 0;
 	if (mb_width * mb_height > MAX_MB_COUNT_TO_DISABLE_QUARTER_PIXEL_MV)
 		reg = H1_REG_ENC_CTRL2_DISABLE_QUARTER_PIXMV;
-	reg |= H1_REG_ENC_CTRL2_ENTROPY_CODING_MODE;
+	reg |= H1_REG_ENC_CTRL2_VP8_BOOLENC_ENABLE;
 
 	inter_favor = 128 - ctx->vp8_enc.prob_intra;
 	if (inter_favor >= 0)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
