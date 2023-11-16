Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FE17EF495
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Nov 2023 15:35:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D295C6DD62;
	Fri, 17 Nov 2023 14:35:33 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45EA2C6C837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 15:48:29 +0000 (UTC)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: andrzej.p)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 22B5E6607351;
 Thu, 16 Nov 2023 15:48:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700149709;
 bh=BY0sbxpm5Rf/FVPVvUAfc6hpVbEdkpX0L7b1vxWfMEA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oPVwla9EfSUkl+veP0U8qGqhda2TGfetqap4Bmramto6x2j2n7SeKMnWUvuZsyg71
 vFN74GbG8QqbTHRo7s/Yww6Xewg3xlapQbFk9W6RhMFPRekZWPwE0enUCWQBPMMBnK
 h9Kl/V+QGhujIiJ+RoMZ3z9X1wuAkHyOf82S9SeiUHjIAtA/viI7yDY9BlLzqmtQ1j
 zg98jCindurfZRzNIzglm6FqFDLLWwAyL0c3L7t2gn0aRb5Zdw/FsY0fE1D1Brt0Wz
 u2d0NEfGBrXqEdnat7Ma4vhfILY+ACIVRvpD6ryHB82wUFxUNmtBgBlNj9HczHtfYE
 rNxqRgNkbaetA==
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 16 Nov 2023 16:48:12 +0100
Message-Id: <20231116154816.70959-3-andrzej.p@collabora.com>
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
Subject: [Linux-stm32] [RFC 2/6] media: verisilicon: Correct a typo in
	H1_REG_MAD_CTRL_MAD_THRESHOLD
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

It's a THRESHOLD and not a THREDHOLD.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_h1_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_h1_regs.h b/drivers/media/platform/verisilicon/hantro_h1_regs.h
index 57e89bb975ae..7752d1291c0e 100644
--- a/drivers/media/platform/verisilicon/hantro_h1_regs.h
+++ b/drivers/media/platform/verisilicon/hantro_h1_regs.h
@@ -92,7 +92,7 @@
 #define H1_REG_STR_BUF_LIMIT				0x060
 #define H1_REG_MAD_CTRL					0x064
 #define    H1_REG_MAD_CTRL_QP_ADJUST(x)			((x) << 28)
-#define    H1_REG_MAD_CTRL_MAD_THREDHOLD(x)		((x) << 22)
+#define    H1_REG_MAD_CTRL_MAD_THRESHOLD(x)		((x) << 22)
 #define    H1_REG_MAD_CTRL_QP_SUM_DIV2(x)		((x))
 #define H1_REG_ADDR_VP8_PROB_CNT			0x068
 #define H1_REG_QP_VAL					0x06c
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
