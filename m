Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A47567B9D69
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Oct 2023 15:38:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69EB6C6C835;
	Thu,  5 Oct 2023 13:38:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 596EAC6C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Oct 2023 13:38:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 395Bswhm002764; Thu, 5 Oct 2023 15:38:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=GR7/PkrCPiZ87Ql+mCFVzbYkH3KLy87NbQlZNSov48c=; b=QY
 LsWBx6EgTOZDVYTetZOGYnd0aycQ4LiLjTiezvdnhtzE1UFt5a2PTN6hXUMfCjiT
 rq6mImsNMqwjDtSiFAadY23rHIAyGMxre+4P4XREDW2yyMr5jFBU5y/SrFNr+VAJ
 RyjW671+9n58o6aXuyZ1v7/Viy2SXDDkXlrM/TYUzS6ce70HFWJtlvqBKEZrc7q7
 X3kYnwIh8EUMtZWKP4gXElq9ddHUTdqswDFzKnR5qgRo1MDGI7UYel7zW1Qjk0lp
 SkhOJkKo8K11XgJ09U9D22nG4er8VXF0koA3/hfhO+U54N2enerYEcQM+xW6B97O
 Ak6Lfr+xlgbFw19w441g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3thvpjgdrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Oct 2023 15:38:37 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6E0DA10005C;
 Thu,  5 Oct 2023 15:38:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6408B260284;
 Thu,  5 Oct 2023 15:38:35 +0200 (CEST)
Received: from localhost (10.201.20.120) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 15:38:35 +0200
From: Hugues Fruchet <hugues.fruchet@foss.st.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, Mauro
 Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, <linux-media@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
Date: Thu, 5 Oct 2023 15:37:09 +0200
Message-ID: <20231005133710.3589080-6-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231005133710.3589080-1-hugues.fruchet@foss.st.com>
References: <20231005133710.3589080-1-hugues.fruchet@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_08,2023-10-05_01,2023-05-22_02
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>, Adam Ford <aford173@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>
Subject: [Linux-stm32] [RFC v2 5/6] media: hantro: h1: NV12 single-plane
	support
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

Add support of NV12 single-plane input frame.

Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
---
 .../platform/verisilicon/hantro_h1_jpeg_enc.c | 42 +++++++++++--------
 .../platform/verisilicon/hantro_h1_vp8_enc.c  | 13 +++++-
 2 files changed, 36 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c b/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
index 12d69503d6ba..9cba30945421 100644
--- a/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
+++ b/drivers/media/platform/verisilicon/hantro_h1_jpeg_enc.c
@@ -42,9 +42,13 @@ static void hantro_h1_jpeg_enc_set_buffers(struct hantro_dev *vpu,
 					   struct vb2_buffer *src_buf,
 					   struct vb2_buffer *dst_buf)
 {
+	const u32 src_addr_regs[] = { H1_REG_ADDR_IN_PLANE_0,
+				      H1_REG_ADDR_IN_PLANE_1,
+				      H1_REG_ADDR_IN_PLANE_2 };
 	struct v4l2_pix_format_mplane *pix_fmt = &ctx->src_fmt;
-	dma_addr_t src[3];
+	size_t luma_size;
 	u32 size_left;
+	int i;
 
 	size_left = vb2_plane_size(dst_buf, 0) - ctx->vpu_dst_fmt->header_size;
 	if (WARN_ON(vb2_plane_size(dst_buf, 0) < ctx->vpu_dst_fmt->header_size))
@@ -57,23 +61,25 @@ static void hantro_h1_jpeg_enc_set_buffers(struct hantro_dev *vpu,
 			   H1_REG_ADDR_OUTPUT_STREAM);
 	vepu_write_relaxed(vpu, size_left, H1_REG_STR_BUF_LIMIT);
 
-	if (pix_fmt->num_planes == 1) {
-		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
-		/* single plane formats we supported are all interlaced */
-		vepu_write_relaxed(vpu, src[0], H1_REG_ADDR_IN_PLANE_0);
-	} else if (pix_fmt->num_planes == 2) {
-		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
-		src[1] = vb2_dma_contig_plane_dma_addr(src_buf, 1);
-		vepu_write_relaxed(vpu, src[0], H1_REG_ADDR_IN_PLANE_0);
-		vepu_write_relaxed(vpu, src[1], H1_REG_ADDR_IN_PLANE_1);
-	} else {
-		src[0] = vb2_dma_contig_plane_dma_addr(src_buf, 0);
-		src[1] = vb2_dma_contig_plane_dma_addr(src_buf, 1);
-		src[2] = vb2_dma_contig_plane_dma_addr(src_buf, 2);
-		vepu_write_relaxed(vpu, src[0], H1_REG_ADDR_IN_PLANE_0);
-		vepu_write_relaxed(vpu, src[1], H1_REG_ADDR_IN_PLANE_1);
-		vepu_write_relaxed(vpu, src[2], H1_REG_ADDR_IN_PLANE_2);
-	}
+	luma_size = hantro_rounded_luma_size(ctx->src_fmt.width,
+					     ctx->src_fmt.height);
+
+	vepu_write_relaxed(vpu,
+			   vb2_dma_contig_plane_dma_addr(src_buf, 0) +
+			   src_buf->planes[0].data_offset,
+			   src_addr_regs[0]);
+	vepu_write_relaxed(vpu,
+			   vb2_dma_contig_plane_dma_addr(src_buf, 0) +
+			   src_buf->planes[0].data_offset +
+			   luma_size,
+			   src_addr_regs[1]);
+
+	for (i = 1; i < pix_fmt->num_planes; ++i)
+		/* Multiplanes. */
+		vepu_write_relaxed(vpu,
+				   vb2_dma_contig_plane_dma_addr(src_buf, i) +
+				   src_buf->planes[i].data_offset,
+				   src_addr_regs[i]);
 }
 
 static void
diff --git a/drivers/media/platform/verisilicon/hantro_h1_vp8_enc.c b/drivers/media/platform/verisilicon/hantro_h1_vp8_enc.c
index b7a635fb73b0..05aa0dd9c09c 100644
--- a/drivers/media/platform/verisilicon/hantro_h1_vp8_enc.c
+++ b/drivers/media/platform/verisilicon/hantro_h1_vp8_enc.c
@@ -1129,7 +1129,18 @@ hantro_h1_vp8_enc_set_buffers(struct hantro_dev *vpu, struct hantro_ctx *ctx, u3
 			   H1_REG_ADDR_REC_CHROMA);
 
 	/* Source buffer. */
-	for (i = 0; i < src_fmt->num_planes; ++i)
+	vepu_write_relaxed(vpu,
+			   vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0) +
+			   src_buf->vb2_buf.planes[0].data_offset,
+			   src_addr_regs[0]);
+	vepu_write_relaxed(vpu,
+			   vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0) +
+			   src_buf->vb2_buf.planes[0].data_offset +
+			   luma_size,
+			   src_addr_regs[1]);
+
+	for (i = 1; i < src_fmt->num_planes; ++i)
+		/* Multiplanes. */
 		vepu_write_relaxed(vpu,
 				   vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, i) +
 				   src_buf->vb2_buf.planes[i].data_offset,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
