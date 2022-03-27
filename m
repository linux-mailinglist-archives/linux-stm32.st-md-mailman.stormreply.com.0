Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A955A4E8D9C
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Mar 2022 07:56:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5841BC5E2CC;
	Mon, 28 Mar 2022 05:56:26 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31D48C5F1FA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Mar 2022 05:54:04 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id gb19so11165526pjb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Mar 2022 22:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=LIDQGlj3VLO68EFfP7fGx3WACork59rTmNVuYIV40DE=;
 b=q1T9x1irmTEDglNu4jA/LGN/tv+9XWlN8xmGoZRJ94dQYV4PFTPV+3L3D6La0T5TGO
 U7u5tZsTqJm/JgbrkP+OQlxzLLkeh4oACKfpJ6iH3azw4RA2mxRiB2By0FqZdKeiR8NK
 d6UJaVdF2yWaggbls8plj0d0/v3rL2+jiOEyoCkppbkHH/q/WxNnxLp7ed1z9AVoQSkq
 vPw7DDwGHJMnX4Doy3QuQrbWiTeq9wsbyNHKN5wC/oF42wohZagR1O+ZCi+G5rSAfwcB
 B/66OfrBlgVndH/XA71/creKi9QT6sKKlyswdatTFl96vg8weVg1aBPdaIiYMYbWhbY6
 CoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LIDQGlj3VLO68EFfP7fGx3WACork59rTmNVuYIV40DE=;
 b=TDLYlRYDxISUAMRD1r3EVnMZ1lVW0Q6rj+cgQnil21XptUkfrkuya8nIobVdrOLlPM
 yVSgF0jHvu2+XJ5nrGphiUjo6ZHO3NtadhUz95HQi/wUA3ocddZPljQRm731slucD+wg
 z7VzunqiDxk8hyYwmQHzInwnbNLk77i7f1bFXXiyZ4TuuA8PbLEIxtOcD+j6tUSs5ifG
 t0thd5F55iiGGYjlC2oVXaDZU6xJTPXfwRbNcl36rRumaSaiBMjeex1ytK5E6KzkGYpN
 3bD7gr/NJ8r4IXVREYFoddr1NfbHTFrT5oDC1y7vv8ZAtUN0E+j5LXr3ylL0pdd7ZzI4
 VNng==
X-Gm-Message-State: AOAM5314GTmYQwZUvZFNX9GyQlc0ZJz1jYNPAofKhZZLrSXyZyB9v3Hh
 n6U8C9RI2ir2ZR8fsCYFzOA=
X-Google-Smtp-Source: ABdhPJy4k07mvfzm2EG3bok+szq0r8f379ZtqpNiz3wD1da1BhAx93ZoSKYEp5L3TI3I5jVnEniXNA==
X-Received: by 2002:a17:90b:1a8b:b0:1c7:386b:4811 with SMTP id
 ng11-20020a17090b1a8b00b001c7386b4811mr22577530pjb.4.1648360442838; 
 Sat, 26 Mar 2022 22:54:02 -0700 (PDT)
Received: from localhost.localdomain ([115.220.243.108])
 by smtp.googlemail.com with ESMTPSA id
 w61-20020a17090a6bc300b001c7ca8a1467sm8779049pjj.46.2022.03.26.22.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 22:54:02 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: yannick.fertre@foss.st.com
Date: Sun, 27 Mar 2022 13:53:55 +0800
Message-Id: <20220327055355.3808-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 28 Mar 2022 05:56:25 +0000
Cc: marex@denx.de, daniel@ffwll.ch, airlied@linux.ie,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 mcoquelin.stm32@gmail.com, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] stm: ltdc: fix two incorrect NULL checks on
	list iterator
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The two bugs are here:
	if (encoder) {
	if (bridge && bridge->timings)

The list iterator value 'encoder/bridge' will *always* be set and
non-NULL by drm_for_each_encoder()/list_for_each_entry(), so it is
incorrect to assume that the iterator value will be NULL if the
list is empty or no element is found.

To fix the bug, use a new variable '*_iter' as the list iterator,
while use the old variable 'encoder/bridge' as a dedicated pointer
to point to the found element.

Cc: stable@vger.kernel.org
Fixes: 99e360442f223 ("drm/stm: Fix bus_flags handling")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/gpu/drm/stm/ltdc.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index dbdee954692a..d6124aa873e5 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -528,8 +528,8 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	struct drm_device *ddev = crtc->dev;
 	struct drm_connector_list_iter iter;
 	struct drm_connector *connector = NULL;
-	struct drm_encoder *encoder = NULL;
-	struct drm_bridge *bridge = NULL;
+	struct drm_encoder *encoder = NULL, *en_iter;
+	struct drm_bridge *bridge = NULL, *br_iter;
 	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
 	u32 hsync, vsync, accum_hbp, accum_vbp, accum_act_w, accum_act_h;
 	u32 total_width, total_height;
@@ -538,15 +538,19 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	int ret;
 
 	/* get encoder from crtc */
-	drm_for_each_encoder(encoder, ddev)
-		if (encoder->crtc == crtc)
+	drm_for_each_encoder(en_iter, ddev)
+		if (en_iter->crtc == crtc) {
+			encoder = en_iter;
 			break;
+		}
 
 	if (encoder) {
 		/* get bridge from encoder */
-		list_for_each_entry(bridge, &encoder->bridge_chain, chain_node)
-			if (bridge->encoder == encoder)
+		list_for_each_entry(br_iter, &encoder->bridge_chain, chain_node)
+			if (br_iter->encoder == encoder) {
+				bridge = br_iter;
 				break;
+			}
 
 		/* Get the connector from encoder */
 		drm_connector_list_iter_begin(ddev, &iter);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
