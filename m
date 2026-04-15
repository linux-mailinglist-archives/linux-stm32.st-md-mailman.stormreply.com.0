Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ph0OPKa32nXWQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 16:04:34 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBC44051DB
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 16:04:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7704C87EBF;
	Wed, 15 Apr 2026 14:04:33 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CA99C87EBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 14:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1776261871;
 bh=21h7NyivpOz74ue2rg11pkknE/jlHCT9nP2kf9C1szg=;
 h=From:To:Cc:Subject:Date:From;
 b=kHZJQv3gSr7mjPUiqA8xXytY0Z+tkDFhaHfXBo1GFIUOLFZ2KrSN/Im66qkCUl3f0
 ZzBAeWAbyeH4khO07hzYGdOv5nU5Pg4iX6IQaZ4xlMZqV2fG+H3UG9xGcJMngW9vdO
 zeL/uHl5iAWvHylAwiLvTM5rarVkUJVmkQPZNAnfCN4Z9f+MJmHhP3HfFL9cvWc5hC
 SRh9raw5SnPHfaimcZttFQLSwhVNiTwiffBJOWtjGjT5+E2zwPUZm+XSx9T44iT/Tc
 I44azkb8/vTXvFVD+uPwjxoOvxPdpUg3ocaKAHDjfoXx8PyLR3mynZTUPzzgAqJL3+
 TGWIJYRytGgpg==
Received: from benjamin-XPS-13-9310.. (unknown [100.64.1.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: benjamin.gaignard)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5FE1117E1276;
 Wed, 15 Apr 2026 16:04:30 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
 Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, heiko@sntech.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@kernel.org, jernej.skrabec@gmail.com,
 samuel@sholland.org
Date: Wed, 15 Apr 2026 16:04:18 +0200
Message-ID: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 0/2] media: verisilicon: Simplification and
	clean up
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[collabora.com:s=mail];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[collabora.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:nicolas.dufresne@collabora.com,m:p.zabel@pengutronix.de,m:mchehab@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:heiko@sntech.de,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:imx@lists.linux.dev,m:benjamin.gaignard@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-rockchip@lists.infradead.org,m:kernel@collabora.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[collabora.com,pengutronix.de,kernel.org,nxp.com,gmail.com,sntech.de,foss.st.com,sholland.org];
	FORGED_SENDER(0.00)[benjamin.gaignard@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[benjamin.gaignard@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.658];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 6CBC44051DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplify motion vectors and reference allocation with common helpers.
Since it requires to move some of codecs specific functions and
structure in codecs header files add a patch to finish the clean up.

Benjamin Gaignard (2):
  media: verisilicon: Simplify motion vectors and rfc buffers allocation
  media: verisilicon: Clean up messy include

 drivers/media/platform/verisilicon/hantro.h   |  31 +-
 .../media/platform/verisilicon/hantro_av1.c   |   7 -
 .../media/platform/verisilicon/hantro_av1.h   | 100 +++-
 .../platform/verisilicon/hantro_g1_h264_dec.c |   1 +
 .../verisilicon/hantro_g1_mpeg2_dec.c         |   2 +-
 .../platform/verisilicon/hantro_g1_vp8_dec.c  |   2 +-
 .../media/platform/verisilicon/hantro_g2.c    |  36 --
 .../platform/verisilicon/hantro_g2_hevc_dec.c |  26 +-
 .../platform/verisilicon/hantro_g2_vp9_dec.c  |  12 +-
 .../media/platform/verisilicon/hantro_h264.c  |   2 +-
 .../media/platform/verisilicon/hantro_h264.h  |  98 ++++
 .../media/platform/verisilicon/hantro_hevc.c  |  37 +-
 .../media/platform/verisilicon/hantro_hevc.h  |  82 ++++
 .../media/platform/verisilicon/hantro_hw.h    | 446 +-----------------
 .../media/platform/verisilicon/hantro_mpeg2.c |   1 +
 .../media/platform/verisilicon/hantro_mpeg2.h |  27 ++
 .../platform/verisilicon/hantro_postproc.c    |  29 +-
 .../media/platform/verisilicon/hantro_v4l2.c  | 262 +++++++++-
 .../media/platform/verisilicon/hantro_vp8.c   |   1 +
 .../media/platform/verisilicon/hantro_vp8.h   |  29 ++
 .../media/platform/verisilicon/hantro_vp9.h   | 104 ++++
 .../media/platform/verisilicon/imx8m_vpu_hw.c |   5 +
 .../verisilicon/rockchip_vpu2_hw_h264_dec.c   |   2 +-
 .../verisilicon/rockchip_vpu2_hw_mpeg2_dec.c  |   2 +-
 .../verisilicon/rockchip_vpu2_hw_vp8_dec.c    |   2 +-
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  16 +-
 .../platform/verisilicon/rockchip_vpu_hw.c    |   3 +
 .../platform/verisilicon/stm32mp25_vpu_hw.c   |   2 +
 .../media/platform/verisilicon/sunxi_vpu_hw.c |   1 +
 29 files changed, 796 insertions(+), 572 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_h264.h
 create mode 100644 drivers/media/platform/verisilicon/hantro_hevc.h
 create mode 100644 drivers/media/platform/verisilicon/hantro_mpeg2.h
 create mode 100644 drivers/media/platform/verisilicon/hantro_vp8.h

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
