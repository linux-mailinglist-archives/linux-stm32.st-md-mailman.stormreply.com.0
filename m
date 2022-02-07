Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE5B4AC66D
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 17:53:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B0D9C5EC43;
	Mon,  7 Feb 2022 16:53:20 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B864EC597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 16:53:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54772B812AA;
 Mon,  7 Feb 2022 16:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D23FC340ED;
 Mon,  7 Feb 2022 16:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644252797;
 bh=X39xYx51fikLum/6dHtmOj01yGauqmQNBgR0dA+t/T4=;
 h=From:To:Cc:Subject:Date:From;
 b=daQ/U5GjWfNjCv/LB9Bb4/XbLHnn7bL1gcbSSNpasT2b/VlhN0hVFOpSqKam/0dEa
 bpyiUxlfQlTzbqNwEtgG7vDWrd8uTKgWFaeN1z9j77gL17m0Fwx1GvlcoFD63IOhZ6
 aUAt6UccpTa0iMVMP9JhHEpJoTaCOugnlvW8u+Xcb44//9MHg7zH6jZkEevSiBr5bN
 xJhMylojME3ZonO9bIqbR2RjxTze8Mkm7FQcxq352Y2N5gUjNNJ/fGADzZoIUk2KIm
 pNe/efhQ4UaqmLRW6nyXUhxuqSKaDTbO0GKhwVkYXJ8XUDIdziHpTCA1yN/rYFThfc
 pTYRUq7PJmu3g==
From: Nathan Chancellor <nathan@kernel.org>
To: Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Mon,  7 Feb 2022 09:53:04 -0700
Message-Id: <20220207165304.1046867-1-nathan@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] drm/stm: Avoid using val uninitialized in
	ltdc_set_ycbcr_config()
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

Clang warns:

  drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
          default:
          ^~~~~~~
  drivers/gpu/drm/stm/ltdc.c:635:2: note: uninitialized use occurs here
          val |= LxPCR_YCEN;
          ^~~
  drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'val' to silence this warning
          u32 val;
                 ^
                  = 0
  1 warning generated.

Use a return instead of break in the default case to fix the warning.
Add an error message so that this return is not silent, which could hide
issues in the future.

Fixes: 484e72d3146b ("drm/stm: ltdc: add support of ycbcr pixel formats")
Link: https://github.com/ClangBuiltLinux/linux/issues/1575
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/stm/ltdc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 5eeb32c9c9ce..447ddde1786c 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -624,7 +624,8 @@ static inline void ltdc_set_ycbcr_config(struct drm_plane *plane, u32 drm_pix_fm
 		break;
 	default:
 		/* RGB or not a YCbCr supported format */
-		break;
+		drm_err(plane->dev, "Unsupported pixel format: %u\n", drm_pix_fmt);
+		return;
 	}
 
 	/* Enable limited range */

base-commit: 542898c5aa5c6a3179dffb1d1606884a63f75fed
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
