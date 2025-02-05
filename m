Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF109A29AD9
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2025 21:11:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6F6EC78F90;
	Wed,  5 Feb 2025 20:11:45 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57F2FC78F88
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2025 20:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738786297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZN6lOxdYMjUO49jm3bB80agqHnejl+uLnWAidVCm81Y=;
 b=gkUUGYACCvhEdRm3qcoUQurj9ClYboNAwYU6wsIL4mNXiuVoYSf7DAKMuadPRoxQmanDzi
 ZZC74n0sqthRfB+OMNF6d2IkJGIDcmwa/wtDG7fOwz2SpkbhR70vFq31+k8jOJjMl7/mtY
 EeMydc44H5xZAn9T6JwYUASh/O75hrQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564-VivRk6b0MMGXZMwAVSQiaA-1; Wed,
 05 Feb 2025 15:11:35 -0500
X-MC-Unique: VivRk6b0MMGXZMwAVSQiaA-1
X-Mimecast-MFC-AGG-ID: VivRk6b0MMGXZMwAVSQiaA
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BA2681801A18; Wed,  5 Feb 2025 20:11:28 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 760DD19560AB; Wed,  5 Feb 2025 20:11:18 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 05 Feb 2025 15:08:08 -0500
MIME-Version: 1.0
Message-Id: <20250205-mem-cocci-newapi-v1-12-aebf2b0e2300@redhat.com>
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
In-Reply-To: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
To: Joel Stanley <joel@jms.id.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Alexey Brodkin <abrodkin@synopsys.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Jonathan Corbet <corbet@lwn.net>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738786137; l=1470;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=8E/zDOS2y2jXYtpxt4v/XPpri1L2d3Hp1icGGz6XyLc=;
 b=kvdtINpTCFoOpfqXf/fVrI+PlDBH109lqvGOt8aqdxgPNRLHbndphfZbHS68h26FBvlE/Lev1
 rwTEVkvxYkZBkVPbSaO6vTBgPPPOtlnOVyP8CR4ue3yQ+gZM3xTUog2
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pLI_ZWrLvjeoulYYlcefGgs1sU6XUFJQAepyzXGAFQ0_1738786288
X-Mimecast-Originator: redhat.com
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 12/12] Documentation: Update the todo
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

Update the Documentation to be more precise.

v2: Update for clarity

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 Documentation/gpu/todo.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 256d0d1cb2164bd94f9b610a751b907834d96a21..03fcd086889acbd1294669b260292ffc79e97e2f 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -441,13 +441,13 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
 
 Level: Intermediate
 
-Request memory regions in all drivers
--------------------------------------
+Request memory regions in all fbdev drivers
+--------------------------------------------
 
-Go through all drivers and add code to request the memory regions that the
-driver uses. This requires adding calls to request_mem_region(),
-pci_request_region() or similar functions. Use helpers for managed cleanup
-where possible.
+Old/ancient fbdev drivers do not request their memory properly.
+Go through these drivers and add code to request the memory regions that the
+driver uses. Problematic areas include hardware that has exclusive ranges like
+VGA. VGA16fb does not request the range as it is expected.
 
 Drivers are pretty bad at doing this and there used to be conflicts among
 DRM and fbdev drivers. Still, it's the correct thing to do.

-- 
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
