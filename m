Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBB071783B
	for <lists+linux-stm32@lfdr.de>; Wed, 31 May 2023 09:29:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4757BC6904E;
	Wed, 31 May 2023 07:29:20 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E339DC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 May 2023 07:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1685518158; x=1717054158;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OFS01oMh3vyVox4i27eCh4n3gvVM54Ok/qp21x0hPuA=;
 b=TnEidlpFGgMtlMzIJRzHt7liWvf78Re9D7iZRgZlsUWCvFZ3gA+DQaY/
 fTTyOdch1P4x65SRd7NCUTvwt9rjPHLAqyoP+Ko4eQAzHF0x4rhm9dhjM
 rqhjl5Un8LpkAlLeeP45C2TGu/nbNma3b+m3J+sOp7I9N+Z62RF6hr64Y
 e36rDtIY7rE/H417p78cBV9vpazcib6foC+zx26/2wIL5OsiXoC3tBd8b
 4DpmzZMipCDcuBMAnsf26pKfycAQINffx7pLiTv+VHdPjkmMVPsRS5BFe
 +pQTKuYgqawxbVPofLDosFtSyHLsDGTRp/4G5Cgr/lK30oXtL1tb+G3Cz g==;
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="227735487"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 May 2023 00:29:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 31 May 2023 00:29:16 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 31 May 2023 00:29:10 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <yannick.fertre@foss.st.com>, <raphael.gallais-pou@foss.st.com>,
 <philippe.cornu@foss.st.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
Date: Wed, 31 May 2023 10:28:54 +0300
Message-ID: <20230531072854.142629-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] drm/stm: ltdc: check memory returned by
	devm_kzalloc()
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

devm_kzalloc() can fail and return NULL pointer. Check its return status.
Identified with Coccinelle (kmerr.cocci script).

Fixes: 484e72d3146b ("drm/stm: ltdc: add support of ycbcr pixel formats")
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---

Hi,

This has been addressed using kmerr.cocci script proposed for update
at [1].

Thank you,
Claudiu Beznea

[1] https://lore.kernel.org/all/20230530074044.1603426-1-claudiu.beznea@microchip.com/

 drivers/gpu/drm/stm/ltdc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 03c6becda795..9f3ac54d4cb3 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1579,6 +1579,8 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
 			       ARRAY_SIZE(ltdc_drm_fmt_ycbcr_sp) +
 			       ARRAY_SIZE(ltdc_drm_fmt_ycbcr_fp)) *
 			       sizeof(*formats), GFP_KERNEL);
+	if (!formats)
+		return NULL;
 
 	for (i = 0; i < ldev->caps.pix_fmt_nb; i++) {
 		drm_fmt = ldev->caps.pix_fmt_drm[i];
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
