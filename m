Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 489C7985A44
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Sep 2024 14:06:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5695DC78006;
	Wed, 25 Sep 2024 12:06:56 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C80D5C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 12:06:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EA1CAA440FD;
 Wed, 25 Sep 2024 12:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36B7C4CEC7;
 Wed, 25 Sep 2024 12:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727266008;
 bh=BxcwbgJ/CnH0K4cDKwkcguF41kZNgM81f4D/TFs+Ny4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PmlI72A/aHkiHH34lh9MwfJO8CoNy1jwnpDPzMi16x5QidxQqSpgkM8o9UqxwTQkL
 yp0FVyia6YfCcNfJpS50NOLuqKnQCoLDhvjBtgrBHjsIRhs+InwfztOKubuOM1dgmv
 OIzWIZOXj5fG878UkPddGtFg0eqY8SVZxtTFVALrlSvcSFw8XapyYzO3JWmGkdTH1a
 yCPsHDNZ6xxRmfr0J9RXSrFAU29LlbaESre8HXXZ9G3nICGRw8M0hh2znEl88ALmbQ
 PyKGTD4Msm3X3TfwSxUrqXeJpc7NgI22mNEArHhQa2btK73LId2AyySOGkm752hR2f
 LSKDiIQ7KUTww==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 25 Sep 2024 07:52:47 -0400
Message-ID: <20240925115823.1303019-148-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925115823.1303019-1-sashal@kernel.org>
References: <20240925115823.1303019-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.11
Cc: Sasha Levin <sashal@kernel.org>, mcoquelin.stm32@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 6.10 148/197] drm/stm: ltdc: reset
	plane transparency after plane disable
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

From: Yannick Fertre <yannick.fertre@foss.st.com>

[ Upstream commit 02fa62d41c8abff945bae5bfc3ddcf4721496aca ]

The plane's opacity should be reseted while the plane
is disabled. It prevents from seeing a possible global
or layer background color set earlier.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240712131344.98113-1-yannick.fertre@foss.st.com
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/stm/ltdc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index eeaabb4e10d3e..9e76785cb2691 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1513,6 +1513,9 @@ static void ltdc_plane_atomic_disable(struct drm_plane *plane,
 	/* Disable layer */
 	regmap_write_bits(ldev->regmap, LTDC_L1CR + lofs, LXCR_LEN | LXCR_CLUTEN |  LXCR_HMEN, 0);
 
+	/* Reset the layer transparency to hide any related background color */
+	regmap_write_bits(ldev->regmap, LTDC_L1CACR + lofs, LXCACR_CONSTA, 0x00);
+
 	/* Commit shadow registers = update plane at next vblank */
 	if (ldev->caps.plane_reg_shadow)
 		regmap_write_bits(ldev->regmap, LTDC_L1RCR + lofs,
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
