Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3167EF498
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Nov 2023 15:35:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84685C6DD66;
	Fri, 17 Nov 2023 14:35:33 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E839C6B44F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 15:48:31 +0000 (UTC)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: andrzej.p)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5638A6607377;
 Thu, 16 Nov 2023 15:48:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700149711;
 bh=4cgLKTgnVvYWRE/faVahndrRcA5UJbNrZ9b/DGo2+3M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=etCEYydZA2yxC3PIsk2+nUDQofJiiZUNeIKweun2Fe1TgNzSxuQtKBYgN/xIFCyxK
 LwT2D0+u4yvJdNFEvnV1gI2mTy17gGqlPuSCealHhBEKlGh0x4mQH+iIcI6N93FwcO
 uExFhkYsZ6Mu5Cy3GHLeexxea74Cs+8w4ej6rIw+Zx/6RJoFAAPJD64wWTrsVVQAFV
 QdWqVLgZAUEFPvaXseelAUkczkIw1GjcvDWVoVRVPI6cvuvCZzv8es3eFj8qUL/pJc
 prsnNwcMce4i5hWxAsKoYe3QNWpT8zQD5DmoLynPoT231EYmsBWN/LNv09rTd9MqhF
 FuXv6uX2yt7sw==
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 16 Nov 2023 16:48:14 +0100
Message-Id: <20231116154816.70959-5-andrzej.p@collabora.com>
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
Subject: [Linux-stm32] [RFC 4/6] media: verisilicon: Update H1 register
	definitions
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

Add definition of register at offset 0x00c.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_h1_regs.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_h1_regs.h b/drivers/media/platform/verisilicon/hantro_h1_regs.h
index c1c66c934a24..efb46da23eab 100644
--- a/drivers/media/platform/verisilicon/hantro_h1_regs.h
+++ b/drivers/media/platform/verisilicon/hantro_h1_regs.h
@@ -23,6 +23,15 @@
 #define     H1_REG_AXI_CTRL_INPUT_SWAP32		BIT(2)
 #define     H1_REG_AXI_CTRL_OUTPUT_SWAP8		BIT(1)
 #define     H1_REG_AXI_CTRL_INPUT_SWAP8			BIT(0)
+#define H1_REG_DEVICE_CTRL				0x00c
+#define     H1_REG_DEVICE_CTRL_SCALE_OUTPUT_SWAP8	BIT(27)
+#define     H1_REG_DEVICE_CTRL_SCALE_OUTPUT_SWAP16	BIT(26)
+#define     H1_REG_DEVICE_CTRL_SCALE_OUTPUT_SWAP32	BIT(25)
+#define     H1_REG_DEVICE_CTRL_MV_OUTPUT_SWAP8		BIT(24)
+#define     H1_REG_DEVICE_CTRL_MV_OUTPUT_SWAP16		BIT(23)
+#define     H1_REG_DEVICE_CTRL_MV_OUTPUT_SWAP32		BIT(22)
+#define     H1_REG_DEVICE_CTRL_INPUT_READ_1MB		BIT(21)
+#define     H1_REG_DEVICE_CTRL_AXI_DUAL_CHANNEL		BIT(20)
 #define H1_REG_ADDR_OUTPUT_STREAM			0x014
 #define H1_REG_ADDR_OUTPUT_CTRL				0x018
 #define H1_REG_ADDR_REF_LUMA				0x01c
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
