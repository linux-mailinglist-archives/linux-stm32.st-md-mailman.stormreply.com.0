Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hrD3DioGRWob5QoAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 14:20:58 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE116ED334
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 14:20:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=collabora.com header.s=mail header.b=FDRdcObX;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=collabora.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE6C1C8F272;
	Wed,  1 Jul 2026 12:20:57 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03DEEC8F286
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jul 2026 12:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1782908456;
 bh=MH9rZNYjTexT9/FSQg9LOO/88ptllu4jdjcPjbmJHTI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FDRdcObXoQGxpSBq5tszZW0ObJHRVfa1cpxLK2fqJaguAl4arNEC8PkiDPWOxEPS2
 kPT3nTIPZucvglyTd4QyXT7CRzScrN9bA1pPwRu/SCln3UkIs17qth1mlxI7f/u21h
 Yrk2sLk8MfrIVWu5oFcok/amzu4dcbU2IPjodTIyR2FlR6PU+GknNRjvMYgP/nUU+X
 M0N97n2pUUBEH+NN4WT+vqAP9vcFBa81t6EvqPShuYnhPLEW9w4qnWiY3UcO6OIDzz
 KvAH3judd6aJtkXr0hCd7cc219UNmYi4OhUcJED2BjR85rMn4oKCFnooEAA4544XIe
 HRb9uvJB5S/5Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BBC317E116D;
 Wed,  1 Jul 2026 14:20:55 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Date: Wed,  1 Jul 2026 14:20:43 +0200
Message-ID: <20260701122043.19612-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
References: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Cc: justin.yeh@mediatek.com, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, airlied@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, simona@ffwll.ch, robh@kernel.org,
 ck.hu@mediatek.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 jitao.shi@mediatek.com, andi.shyti@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 mcoquelin.stm32@gmail.com, tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 p.zabel@pengutronix.de, jason-jh.lin@mediatek.com, djakov@kernel.org,
 krzk+dt@kernel.org
Subject: [Linux-stm32] [PATCH 6/6] soc: mediatek: mtk-mmsys: Use
	MMSYS_ROUTE() in default routing table
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[collabora.com:s=mail];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[collabora.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:chunkuang.hu@kernel.org,m:justin.yeh@mediatek.com,m:dri-devel@lists.freedesktop.org,m:kernel@collabora.com,m:airlied@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:simona@ffwll.ch,m:robh@kernel.org,m:ck.hu@mediatek.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:jitao.shi@mediatek.com,m:andi.shyti@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:broonie@kernel.org,m:linux-mediatek@lists.infradead.org,m:matthias.bgg@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:mcoquelin.stm32@gmail.com,m:tzimmermann@suse.de,m:linux-kernel@vger.kernel.org,m:p.zabel@pengutronix.de,m:jason-jh.lin@mediatek.com,m:djakov@kernel.org,m:krzk+dt@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[mediatek.com,lists.freedesktop.org,collabora.com,gmail.com,st-md-mailman.stormreply.com,ffwll.ch,kernel.org,vger.kernel.org,linux.intel.com,lists.infradead.org,suse.de,pengutronix.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:mid,collabora.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1CE116ED334

All of the mtk_mmsys_routes tables for all SoCs were converted to
use the MMSYS_ROUTE() macro but the default one used for MT2701,
MT2712 and SoCs from that generation was not: convert this one as
well.

This brings no functional change.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.h | 279 +++++++++++++------------------
 1 file changed, 114 insertions(+), 165 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index b37d859b6c14..d534d43aad6f 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -157,171 +157,120 @@ struct mtk_mmsys_driver_data {
  * to an independent table.
  */
 static const struct mtk_mmsys_routes mmsys_default_routing_table[] = {
-	{
-		DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
-		DISP_REG_CONFIG_OUT_SEL, BLS_RDMA1_DSI_DPI_MASK,
-		BLS_TO_DSI_RDMA1_TO_DPI1
-	}, {
-		DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
-		DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_MASK,
-		DSI_SEL_IN_BLS
-	}, {
-		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_OUT_SEL, BLS_RDMA1_DSI_DPI_MASK,
-		BLS_TO_DPI_RDMA1_TO_DSI
-	}, {
-		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_MASK,
-		DSI_SEL_IN_RDMA
-	}, {
-		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DPI_SEL, DPI_SEL_IN_MASK,
-		DPI_SEL_IN_BLS
-	}, {
-		DDP_COMPONENT_GAMMA, DDP_COMPONENT_RDMA1,
-		DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN, GAMMA_MOUT_EN_RDMA1,
-		GAMMA_MOUT_EN_RDMA1
-	}, {
-		DDP_COMPONENT_OD0, DDP_COMPONENT_RDMA0,
-		DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD_MOUT_EN_RDMA0,
-		OD_MOUT_EN_RDMA0
-	}, {
-		DDP_COMPONENT_OD1, DDP_COMPONENT_RDMA1,
-		DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD1_MOUT_EN_RDMA1,
-		OD1_MOUT_EN_RDMA1
-	}, {
-		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
-		DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
-		OVL0_MOUT_EN_COLOR0
-	}, {
-		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
-		DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
-		COLOR0_SEL_IN_OVL0
-	}, {
-		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
-		DISP_REG_CONFIG_DISP_OVL_MOUT_EN, OVL_MOUT_EN_RDMA,
-		OVL_MOUT_EN_RDMA
-	}, {
-		DDP_COMPONENT_OVL1, DDP_COMPONENT_COLOR1,
-		DISP_REG_CONFIG_DISP_OVL1_MOUT_EN, OVL1_MOUT_EN_COLOR1,
-		OVL1_MOUT_EN_COLOR1
-	}, {
-		DDP_COMPONENT_OVL1, DDP_COMPONENT_COLOR1,
-		DISP_REG_CONFIG_DISP_COLOR1_SEL_IN, COLOR1_SEL_IN_OVL1,
-		COLOR1_SEL_IN_OVL1
-	}, {
-		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
-		RDMA0_SOUT_DPI0
-	}, {
-		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
-		RDMA0_SOUT_DPI1
-	}, {
-		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
-		RDMA0_SOUT_DSI1
-	}, {
-		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
-		RDMA0_SOUT_DSI2
-	}, {
-		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
-		RDMA0_SOUT_DSI3
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
-		RDMA1_SOUT_DPI0
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_MASK,
-		DPI0_SEL_IN_RDMA1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
-		RDMA1_SOUT_DPI1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_MASK,
-		DPI1_SEL_IN_RDMA1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI0,
-		DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_MASK,
-		DSI0_SEL_IN_RDMA1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
-		RDMA1_SOUT_DSI1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_MASK,
-		DSI1_SEL_IN_RDMA1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
-		RDMA1_SOUT_DSI2
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_MASK,
-		DSI2_SEL_IN_RDMA1
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
-		RDMA1_SOUT_DSI3
-	}, {
-		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_MASK,
-		DSI3_SEL_IN_RDMA1
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
-		RDMA2_SOUT_DPI0
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_MASK,
-		DPI0_SEL_IN_RDMA2
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
-		RDMA2_SOUT_DPI1
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_MASK,
-		DPI1_SEL_IN_RDMA2
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI0,
-		DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_MASK,
-		DSI0_SEL_IN_RDMA2
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
-		RDMA2_SOUT_DSI1
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_MASK,
-		DSI1_SEL_IN_RDMA2
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
-		RDMA2_SOUT_DSI2
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_MASK,
-		DSI2_SEL_IN_RDMA2
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
-		RDMA2_SOUT_DSI3
-	}, {
-		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_MASK,
-		DSI3_SEL_IN_RDMA2
-	}, {
-		DDP_COMPONENT_UFOE, DDP_COMPONENT_DSI0,
-		DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, UFOE_MOUT_EN_DSI0,
-		UFOE_MOUT_EN_DSI0
-	}
+	MMSYS_ROUTE(BLS, 0, DSI, 0,
+		    DISP_REG_CONFIG_OUT_SEL, BLS_RDMA1_DSI_DPI_MASK,
+		    BLS_TO_DSI_RDMA1_TO_DPI1),
+	MMSYS_ROUTE(BLS, 0, DSI, 0,
+		    DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_MASK,
+		    DSI_SEL_IN_BLS),
+	MMSYS_ROUTE(BLS, 0, DPI, 0,
+		    DISP_REG_CONFIG_OUT_SEL, BLS_RDMA1_DSI_DPI_MASK,
+		    BLS_TO_DPI_RDMA1_TO_DSI),
+	MMSYS_ROUTE(BLS, 0, DPI, 0,
+		    DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_MASK,
+		    DSI_SEL_IN_RDMA),
+	MMSYS_ROUTE(BLS, 0, DPI, 0,
+		    DISP_REG_CONFIG_DPI_SEL, DPI_SEL_IN_MASK,
+		    DPI_SEL_IN_BLS),
+	MMSYS_ROUTE(GAMMA, 0, RDMA, 1,
+		    DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN, GAMMA_MOUT_EN_RDMA1,
+		    GAMMA_MOUT_EN_RDMA1),
+	MMSYS_ROUTE(OD, 0, RDMA, 0,
+		    DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD_MOUT_EN_RDMA0,
+		    OD_MOUT_EN_RDMA0),
+	MMSYS_ROUTE(OD, 1, RDMA, 1,
+		    DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD1_MOUT_EN_RDMA1,
+		    OD1_MOUT_EN_RDMA1),
+	MMSYS_ROUTE(OVL, 0, COLOR, 0,
+		    DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
+		    OVL0_MOUT_EN_COLOR0),
+	MMSYS_ROUTE(OVL, 0, COLOR, 0,
+		    DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
+		    COLOR0_SEL_IN_OVL0),
+	MMSYS_ROUTE(OVL, 0, RDMA, 0,
+		    DISP_REG_CONFIG_DISP_OVL_MOUT_EN, OVL_MOUT_EN_RDMA,
+		    OVL_MOUT_EN_RDMA),
+	MMSYS_ROUTE(OVL, 1, COLOR, 1,
+		    DISP_REG_CONFIG_DISP_OVL1_MOUT_EN, OVL1_MOUT_EN_COLOR1,
+		    OVL1_MOUT_EN_COLOR1),
+	MMSYS_ROUTE(OVL, 1, COLOR, 1,
+		    DISP_REG_CONFIG_DISP_COLOR1_SEL_IN, COLOR1_SEL_IN_OVL1,
+		    COLOR1_SEL_IN_OVL1),
+	MMSYS_ROUTE(RDMA, 0, DPI, 0,
+		    DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		    RDMA0_SOUT_DPI0),
+	MMSYS_ROUTE(RDMA, 0, DPI, 1,
+		    DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		    RDMA0_SOUT_DPI1),
+	MMSYS_ROUTE(RDMA, 0, DSI, 1,
+		    DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		    RDMA0_SOUT_DSI1),
+	MMSYS_ROUTE(RDMA, 0, DSI, 2,
+		    DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		    RDMA0_SOUT_DSI2),
+	MMSYS_ROUTE(RDMA, 0, DSI, 3,
+		    DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		    RDMA0_SOUT_DSI3),
+	MMSYS_ROUTE(RDMA, 1, DPI, 0,
+		    DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		    RDMA1_SOUT_DPI0),
+	MMSYS_ROUTE(RDMA, 1, DPI, 0,
+		    DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_MASK,
+		    DPI0_SEL_IN_RDMA1),
+	MMSYS_ROUTE(RDMA, 1, DPI, 1,
+		    DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		    RDMA1_SOUT_DPI1),
+	MMSYS_ROUTE(RDMA, 1, DPI, 1,
+		    DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_MASK,
+		    DPI1_SEL_IN_RDMA1),
+	MMSYS_ROUTE(RDMA, 1, DSI, 0,
+		    DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_MASK,
+		    DSI0_SEL_IN_RDMA1),
+	MMSYS_ROUTE(RDMA, 1, DSI, 1,
+		    DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		    RDMA1_SOUT_DSI1),
+	MMSYS_ROUTE(RDMA, 1, DSI, 1,
+		    DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_MASK,
+		    DSI1_SEL_IN_RDMA1),
+	MMSYS_ROUTE(RDMA, 1, DSI, 2,
+		    DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		    RDMA1_SOUT_DSI2),
+	MMSYS_ROUTE(RDMA, 1, DSI, 2,
+		    DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_MASK,
+		    DSI2_SEL_IN_RDMA1),
+	MMSYS_ROUTE(RDMA, 1, DSI, 3,
+		    DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		    RDMA1_SOUT_DSI3),
+	MMSYS_ROUTE(RDMA, 1, DSI, 3,
+		    DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_MASK,
+		    DSI3_SEL_IN_RDMA1),
+	MMSYS_ROUTE(RDMA, 2, DPI, 0,
+		    DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
+		    RDMA2_SOUT_DPI0),
+	MMSYS_ROUTE(RDMA, 2, DPI, 0,
+		    DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_MASK,
+		    DPI0_SEL_IN_RDMA2),
+	MMSYS_ROUTE(RDMA, 2, DPI, 1,
+		    DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
+		    RDMA2_SOUT_DPI1),
+	MMSYS_ROUTE(RDMA, 2, DPI, 1,
+		    DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_MASK,
+		    DPI1_SEL_IN_RDMA2),
+	MMSYS_ROUTE(RDMA, 2, DSI, 0,
+		    DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_MASK,
+		    DSI0_SEL_IN_RDMA2),
+	MMSYS_ROUTE(RDMA, 2, DSI, 1,
+		    DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
+		    RDMA2_SOUT_DSI1),
+	MMSYS_ROUTE(RDMA, 2, DSI, 1,
+		    DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_MASK,
+		    DSI1_SEL_IN_RDMA2),
+	MMSYS_ROUTE(RDMA, 2, DSI, 2,
+		    DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
+		    RDMA2_SOUT_DSI2),
+	MMSYS_ROUTE(RDMA, 2, DSI, 2,
+		    DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_MASK,
+		    DSI2_SEL_IN_RDMA2),
 };
 
 #endif /* __SOC_MEDIATEK_MTK_MMSYS_H */
-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
