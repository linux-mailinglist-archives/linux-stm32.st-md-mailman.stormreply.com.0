Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7E39D870B
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Nov 2024 14:50:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 966C4C78F7F;
	Mon, 25 Nov 2024 13:50:01 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEB38C78F80
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Nov 2024 13:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References; bh=QFkmN5/AIJVNMn/fY5/nPE6hxTuKJ8kdCgzvY8ANXv0=; b=Ui
 OcUpXXU5DoRQrTujmQVvo+gXQsDG8zxhh4Jw9cs7bgHLQfSQF29//1GlOfqsnITLAxDWKMmq5lCe4
 XEvHH3OpAfw5YMaPyBbSr6chLFJhOVZlsPepDhZ+T4ahEq2CVJgkQsvXih1aypuLkQEl6SwhVcxNZ
 TAFha6pmabINsQXjBMiisq8w883Gx2CzEDEgdc+3joRrtW+pNnAeY/hX7Tbw5RpXM2TV40lwFRaIH
 01nVIQEAGLq0hzRVVXTBGwfrPRncRNn27pQOdIBtoT1RFt6bo8VeWQE8wHL0p2hE0tPxMmpg6rqlm
 gf7tW8pMxXQzm3GmSBIS5rACM2V3UUzw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1tFZTA-000CcV-R3; Mon, 25 Nov 2024 14:49:40 +0100
Received: from [185.17.218.86] (helo=zen.localdomain)
 by sslproxy08.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sean@geanix.com>) id 1tFZT9-000A3a-2Q;
 Mon, 25 Nov 2024 14:49:39 +0100
From: Sean Nyekjaer <sean@geanix.com>
Date: Mon, 25 Nov 2024 14:49:25 +0100
Message-Id: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGWARGcC/x2MQQqDMBBFryKzbiQzSRW66j3ERRpHHWi1JEVSJ
 Hdvms2H93m8EyIH4Qi35oTAh0TZtwJ0acCvbltYyVQYSJNFpKuaoqjAT5cUWrQPN3d+6i0U/x1
 4llRbw1h4lfjZw7emD/y/taINEWrbG2rJUK87rVBFdtt9KSOp9fsLxpzzD8aKpzGcAAAA
X-Change-ID: 20241125-dsi-relax-1414baf6cd74
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27468/Mon Nov 25 10:36:56 2024)
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, Sean Nyekjaer <sean@geanix.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/3] drm/stm: dsi: relax mode_valid clock
	tolerance
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

Introduce helper function to check if the pixel clock is within
tolerance.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
Changes in v2:
- Introduce helper function drm_mode_validate_mode()
- drm/stm: use helper function for mode validation
- drm/sun4i: use helper function for mode validation
- Link to v1: https://lore.kernel.org/r/20240322104732.2327060-1-sean@geanix.com

---
Sean Nyekjaer (3):
      drm/modes: introduce drm_mode_validate_mode() helper function
      drm/sun4i: use drm_mode_validate_mode() helper function
      drm/stm: dsi: use drm_mode_validate_mode() helper function

 drivers/gpu/drm/drm_modes.c           | 34 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 12 +++++-------
 drivers/gpu/drm/sun4i/sun4i_rgb.c     | 22 ++++------------------
 include/drm/drm_modes.h               |  2 ++
 4 files changed, 45 insertions(+), 25 deletions(-)
---
base-commit: 28eb75e178d389d325f1666e422bc13bbbb9804c
change-id: 20241125-dsi-relax-1414baf6cd74

Best regards,
-- 
Sean Nyekjaer <sean@geanix.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
