Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3F7725439
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 08:31:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EE30C6A5FB;
	Wed,  7 Jun 2023 06:31:54 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54F86C6A608
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 06:31:53 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-3f6dfc4e01fso69695445e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Jun 2023 23:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686119513; x=1688711513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QVzHDRPJNZ9IK1tuBeqT97BbWRZLa0+X8FPJl3jJUF8=;
 b=UYvhY2b4HirdovbXfPtrGbUTJmn6mv0vjtYgUpqMd26yDC895U6FxmXqgAGGLQenPB
 FYBFTQymCHZR9yDzHZpZtmUct4e7yOQVQxu9U1J+GoTgNqgB2sTkk86EzY+LrPiny4+E
 xtH62ZWLxxlheBL841A43Q3wpYHfq0ZPA7qsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686119513; x=1688711513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QVzHDRPJNZ9IK1tuBeqT97BbWRZLa0+X8FPJl3jJUF8=;
 b=cSLeiTqTwbs88UgcLKnk13IGyOb5BuERv1u/OnBJuHtUF92BzcccwzPFeJIYE1LSJ3
 PrN+nBi8QkhKW7QdBlL5RGE2CrDWPK5NE5TH3xxuNF/gejFQzsbSiKtTIpvcxej8c4H1
 jGIOpfciowWmXAuguXmz5769EiGUuafl7x6oidCO2QyPauMVtyWV0qUgMJNK7oBwurIY
 VPl5v+A81UKxObfTrZ/qZCb3WC+cAJBEXdyKCJzLt55rUSI/i860RyKbtdQ3IrlF0GXe
 GY6aEBJgTf5M02J8+zzTR7mxUIxZarzMQ7KGPFeo5vNxRolFkv9MZfgpMBQgJwB6tk4i
 wPsA==
X-Gm-Message-State: AC+VfDzEwIljKxZwd321y05sDUM0w9Ss4mvb/Iktj9KekJrndRxFowmQ
 i+mOx0zY/UFE9u9bOFHRUiWLMg==
X-Google-Smtp-Source: ACHHUZ7femRg72fKhwkXtOViccaCRPhvLbf87oH15MUY/N6uqJKzd9GvRbot+SgLThtMLLZ1M23wWg==
X-Received: by 2002:adf:eb88:0:b0:309:38f4:fb52 with SMTP id
 t8-20020adfeb88000000b0030938f4fb52mr5870830wrn.9.1686119512971; 
 Tue, 06 Jun 2023 23:31:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([37.159.114.163])
 by smtp.gmail.com with ESMTPSA id
 m6-20020adff386000000b0030630120e56sm14385127wro.57.2023.06.06.23.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 23:31:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed,  7 Jun 2023 08:31:38 +0200
Message-Id: <20230607063139.621351-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
References: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 kernel test robot <lkp@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v2 5/6] drm/panel: simple: add support
	for Rocktech RK043FN48H panel
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

Add support for Rocktech RK043FN48H 4.3" (480x272) LCD-TFT panel.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306020343.jNTWeM0P-lkp@intel.com/

---

Changes in v2:
- Fix build warning reported by kernel test robot.
- Add 'Reported-by' tag of kernel test robot.

 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 065f378bba9d..3b10e78d07d9 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3188,6 +3188,32 @@ static const struct panel_desc qishenglong_gopher2b_lcd = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
+static const struct display_timing rocktech_rk043fn48h_timing = {
+	.pixelclock = { 6000000, 9000000, 12000000 },
+	.hactive = { 480, 480, 480 },
+	.hback_porch = { 8, 43, 43 },
+	.hfront_porch = { 2, 8, 8 },
+	.hsync_len = { 1, 1, 1 },
+	.vactive = { 272, 272, 272 },
+	.vback_porch = { 2, 12, 12 },
+	.vfront_porch = { 1, 4, 4 },
+	.vsync_len = { 1, 10, 10 },
+	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW |
+		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE,
+};
+
+static const struct panel_desc rocktech_rk043fn48h = {
+	.timings = &rocktech_rk043fn48h_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 95,
+		.height = 54,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct display_timing rocktech_rk070er9427_timing = {
 	.pixelclock = { 26400000, 33300000, 46800000 },
 	.hactive = { 800, 800, 800 },
@@ -4218,6 +4244,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "qishenglong,gopher2b-lcd",
 		.data = &qishenglong_gopher2b_lcd,
+	}, {
+		.compatible = "rocktech,rk043fn48h",
+		.data = &rocktech_rk043fn48h,
 	}, {
 		.compatible = "rocktech,rk070er9427",
 		.data = &rocktech_rk070er9427,
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
