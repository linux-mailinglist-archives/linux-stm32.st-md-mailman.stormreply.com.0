Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E81607EF497
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Nov 2023 15:35:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91AEBC6DD68;
	Fri, 17 Nov 2023 14:35:33 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D465C6C837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Nov 2023 15:48:32 +0000 (UTC)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: andrzej.p)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6ED3E660737C;
 Thu, 16 Nov 2023 15:48:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700149712;
 bh=s9SdZUH9daJVYuIzYT3d5934ifaoV5Ovf46b6nb1+D4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NM2xSvuJCyZiRx/vRl2aijWktFheZxkFkaVD0S49BOj9S3Co3TbPUnGYG2SAxSA02
 7fJsdworHzTEDRYS988j8gTeo2q/wrhbSLEutFvdEqe2ZHQBeCsaD/pdREH2vZA8SE
 LR8H2OX6d2qpg3z4BDjpIbRQe8UpASI5uBk8E6JWIdEOdm6oBiGqeI7JryRvA5+OP5
 tZ0YXzINEaZBkcHioGNP/1YNqiD+jztTRfyl11CuwPMEZwYJo1hJOLhV6SaBAGWtCK
 M/fzWzJMxwowROOAayFA1MlcswPspQYzm0sw8TpyEu7kN35luQQ0+7vKkv2VKDAKi8
 ClPcvNt7OprSw==
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 16 Nov 2023 16:48:15 +0100
Message-Id: <20231116154816.70959-6-andrzej.p@collabora.com>
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
Subject: [Linux-stm32] [RFC 5/6] media: uapi: Add H.264 stateless encoding
	uAPI
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

Ported from:

https://github.com/bootlin/linux/tree/hantro/h264-encoding-v5.11

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 54 ++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c |  9 +++
 include/uapi/linux/v4l2-controls.h        | 85 +++++++++++++++++++++++
 include/uapi/linux/videodev2.h            |  2 +
 4 files changed, 150 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index c7799ceb3d6d..04b7e64312be 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -790,6 +790,48 @@ static int validate_av1_sequence(struct v4l2_ctrl_av1_sequence *s)
 	return 0;
 }
 
+static int
+validate_h264_encode_params(struct v4l2_ctrl_h264_encode_params *encode_params)
+{
+	/* Make sure we're not passed invalid flags. */
+	if (encode_params->flags & ~(V4L2_H264_ENCODE_FLAG_ENTROPY_CABAC |
+		V4L2_H264_ENCODE_FLAG_TRANSFORM_8X8_MODE |
+		V4L2_H264_ENCODE_FLAG_CONSTRAINED_INTRA_PRED |
+		V4L2_H264_ENCODE_FLAG_MARK_LONGTERM))
+		return -EINVAL;
+
+	if (encode_params->slice_type != V4L2_H264_SLICE_TYPE_I &&
+	    encode_params->slice_type != V4L2_H264_SLICE_TYPE_P &&
+	    encode_params->slice_type != V4L2_H264_SLICE_TYPE_B &&
+	    encode_params->slice_type != V4L2_H264_SLICE_TYPE_SI &&
+		encode_params->slice_type != V4L2_H264_SLICE_TYPE_SP)
+		return -EINVAL;
+
+	if (encode_params->cabac_init_idc > 2)
+		return -EINVAL;
+
+	if (encode_params->nalu_type != V4L2_H264_NAL_CODED_SLICE_NON_IDR_PIC &&
+	    encode_params->nalu_type != V4L2_H264_NAL_CODED_SLICE_IDR_PIC)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int
+validate_h264_encode_rc(struct v4l2_ctrl_h264_encode_rc *encode_rc)
+{
+	if (encode_rc->qp > 51)
+		return -EINVAL;
+
+	if (encode_rc->qp_min > 51 || encode_rc->qp_max > 51)
+		return -EINVAL;
+
+	if (encode_rc->qp_min > encode_rc->qp_max)
+		return -EINVAL;
+
+	return 0;
+}
+
 /*
  * Compound controls validation requires setting unused fields/flags to zero
  * in order to properly detect unchanged controls with v4l2_ctrl_type_op_equal's
@@ -1179,6 +1221,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			return -EINVAL;
 		break;
 
+	case V4L2_CTRL_TYPE_H264_ENCODE_PARAMS:
+		return validate_h264_encode_params(p);
+
+	case V4L2_CTRL_TYPE_H264_ENCODE_RC:
+		return validate_h264_encode_rc(p);
+
 	default:
 		return -EINVAL;
 	}
@@ -1881,6 +1929,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_VP8_ENCODE_PARAMS:
 		elem_size = sizeof(struct v4l2_ctrl_vp8_encode_params);
 		break;
+	case V4L2_CTRL_TYPE_H264_ENCODE_PARAMS:
+		elem_size = sizeof(struct v4l2_ctrl_h264_encode_params);
+		break;
+	case V4L2_CTRL_TYPE_H264_ENCODE_RC:
+		elem_size = sizeof(struct v4l2_ctrl_h264_encode_rc);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index bd26f1d89bd5..920ef552770c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1239,6 +1239,9 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_STATELESS_VP8_ENCODE_PARAMS:		return "VP8 Encode Parameters";
 	case V4L2_CID_STATELESS_VP8_ENCODE_QP:			return "VP8 Encode QP";
 
+	case V4L2_CID_STATELESS_H264_ENCODE_PARAMS:             return "H264 Encode Parameters";
+	case V4L2_CID_STATELESS_H264_ENCODE_RC:                 return "H264 Encode Rate-Control";
+
 	/* Colorimetry controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
 	case V4L2_CID_COLORIMETRY_CLASS:	return "Colorimetry Controls";
@@ -1607,6 +1610,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_STATELESS_H264_ENCODE_PARAMS:
+		*type = V4L2_CTRL_TYPE_H264_ENCODE_PARAMS;
+		break;
+	case V4L2_CID_STATELESS_H264_ENCODE_RC:
+		*type = V4L2_CTRL_TYPE_H264_ENCODE_RC;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index fdec5764e09c..c487506f21a9 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1680,6 +1680,91 @@ struct v4l2_ctrl_h264_decode_params {
 	__u32 flags;
 };
 
+#define V4L2_H264_NAL_CODED_SLICE_NON_IDR_PIC	1
+#define V4L2_H264_NAL_CODED_SLICE_IDR_PIC	5
+
+#define V4L2_CID_STATELESS_H264_ENCODE_PARAMS  (V4L2_CID_CODEC_STATELESS_BASE + 8)
+
+/**
+ * struct v4l2_ctrl_h264_encode_params
+ * @slice_type: selects slice type. Set to one of V4L2_H264_SLICE_TYPE_{}
+ * @pic_parameter_set_id: identifies the picture parameter set that is referred to
+ * in the slice header. The value shall be in the range of 0 to 255, inclusive.
+ * @frame_num: an identifier for pictures.
+ * @idr_pic_id: identifies an IDR picture.
+ * @cabac_init_idc: index for determining the initialization table used in the
+ * initialization process for context variables. The value of cabac_init_idc
+ * shall be in the range of 0 to 2, inclusive.
+ * @disable_deblocking_filter_idc: specifies whether the operation of the
+ * deblocking filter shall be disabled across some block edges of the slice and
+ * specifies for which edges the filtering is disabled.
+ * @slice_alpha_c0_offset_div2: offset used in accessing the alpha and tC0
+ * deblocking filter tables for filtering operations controlled by the macroblocks
+ * within the slice.
+ * @slice_beta_offset_div2: offset used in accessing the beta deblocking filter
+ * table for filtering operations controlled by the macroblocks within the slice.
+ * @slice_size_mb_rows: number of macroblock rows in a slice.
+ * @pic_init_qp_minus26: initial value minus 26 of luma qp for each slice.
+ * @chroma_qp_index_offset: offset that shall be added to qp luma for addressing the
+ * table of qp chroma values for the Cb chroma component.
+ * @flags: combination of V4L2_H264_SLICE_FLAG_{} flags.
+ */
+struct v4l2_ctrl_h264_encode_params {
+	/* Slice parameters */
+
+	__u8 slice_type;
+	__u8 pic_parameter_set_id;
+	__u16 frame_num;
+	__u16 idr_pic_id;
+	__u8 cabac_init_idc;
+	__u8 disable_deblocking_filter_idc;
+	__s8 slice_alpha_c0_offset_div2;
+	__s8 slice_beta_offset_div2;
+
+	__s32 slice_size_mb_rows;
+
+	/* PPS parameters */
+
+	__s8 pic_init_qp_minus26;
+	__s8 chroma_qp_index_offset;
+
+	__u32 flags; /* V4L2_H264_ENCODE_FLAG_ */
+
+	/* Nal parameters */
+	__u8 nal_reference_idc; // 2 bit
+	__u8 nalu_type; // 5 bit
+
+	/* Reference */
+
+	__u64 reference_ts;
+};
+
+#define V4L2_H264_ENCODE_FLAG_ENTROPY_CABAC	       0x01
+#define V4L2_H264_ENCODE_FLAG_TRANSFORM_8X8_MODE       0x02
+#define V4L2_H264_ENCODE_FLAG_CONSTRAINED_INTRA_PRED   0x04
+#define V4L2_H264_ENCODE_FLAG_MARK_LONGTERM            0x08
+
+#define V4L2_CID_STATELESS_H264_ENCODE_RC      (V4L2_CID_CODEC_STATELESS_BASE + 9)
+
+/**
+ * struct v4l2_ctrl_h264_encode_rc
+ *
+ * @qp: quantization parameter for the currently encoded slice
+ *
+ * TODO: other fields likely not needed
+ */
+struct v4l2_ctrl_h264_encode_rc {
+	__u32 qp;
+	__u32 qp_min;
+	__u32 qp_max;
+	__s32 mad_qp_delta;
+	__u32 mad_threshold;
+
+	__u32 cp_distance_mbs;
+	__u32 cp_target[10];
+	__s32 cp_target_error[6];
+	__s32 cp_qp_delta[7];
+};
 
 /* Stateless FWHT control, used by the vicodec driver */
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index b3cbdc60b82c..082018abdd18 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1893,6 +1893,8 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_H264_SLICE_PARAMS    = 0x0203,
 	V4L2_CTRL_TYPE_H264_DECODE_PARAMS   = 0x0204,
 	V4L2_CTRL_TYPE_H264_PRED_WEIGHTS    = 0x0205,
+	V4L2_CTRL_TYPE_H264_ENCODE_PARAMS   = 0x0210,
+	V4L2_CTRL_TYPE_H264_ENCODE_RC       = 0x0211,
 
 	V4L2_CTRL_TYPE_FWHT_PARAMS	    = 0x0220,
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
