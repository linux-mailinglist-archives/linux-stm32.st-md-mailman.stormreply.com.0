Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE533ACFD89
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Jun 2025 09:33:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69070C3F933;
	Fri,  6 Jun 2025 07:33:34 +0000 (UTC)
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5777FC3089F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Jun 2025 20:03:53 +0000 (UTC)
Received: from mail.nppct.ru (localhost [127.0.0.1])
 by mail.nppct.ru (Postfix) with ESMTP id DDA0A1C2AB9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Jun 2025 23:03:51 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
 reason="pass (just generated,
 assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:to:from:from; s=
 dkim; t=1749153831; x=1750017832; bh=TeGhnktdSvFxXreUkwhblyYxGqC
 rkCLuVr00TRFUiKg=; b=muyYK09AKsd5svyarCM+wgyXi06Ne0zIQpr8osYyGlM
 mvFv38mvh3e1slWQweEQvM33yQ2sJPuyYfezhOkuBx44rteHQiJ3P3ULqQ0CTKY+
 Yf6RfncjFBjitQYbMnjScBBdtAJZeidKE5vZzL2zX0n+++cfU7vC7VRQHVDjnJt8
 =
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
 by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id S_unyRVKzFXZ
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Jun 2025 23:03:51 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
 by mail.nppct.ru (Postfix) with ESMTPSA id EA2801C2ABA;
 Thu,  5 Jun 2025 23:03:49 +0300 (MSK)
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: Lyude Paul <lyude@redhat.com>
Date: Thu,  5 Jun 2025 20:03:24 +0000
Message-ID: <20250605200332.336245-2-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605200332.336245-1-sdl@nppct.ru>
References: <20250605200332.336245-1-sdl@nppct.ru>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Jun 2025 07:33:32 +0000
Cc: Simona Vetter <simona@ffwll.ch>, Alexey Nepomnyashih <sdl@nppct.ru>,
 lvc-project@linuxtesting.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] drm/nouveau/instmem/gk20a: fix incorrect
	argument in iommu_unmap
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

The unmap logic assumes a fixed step size of PAGE_SIZE, but the
actual IOVA step depends on iommu_pgshift, not PAGE_SHIFT. If
iommu_pgshift > PAGE_SHIFT, this results in mismatched offsets and
causes iommu_unmap() to target incorrect addresses, potentially
leaving mappings intact or corrupting IOMMU state.

Fix this by recomputing the offset per index using the same logic as
in the map loop, ensuring symmetry and correctness.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Cc: stable@vger.kernel.org # v4.3+
Fixes: a7f6da6e758c ("drm/nouveau/instmem/gk20a: add IOMMU support")
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
index 17a0e1a46211..f58e0d4fb2b1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
@@ -481,8 +481,9 @@ gk20a_instobj_ctor_iommu(struct gk20a_instmem *imem, u32 npages, u32 align,
 			nvkm_error(subdev, "IOMMU mapping failure: %d\n", ret);
 
 			while (i-- > 0) {
-				offset -= PAGE_SIZE;
-				iommu_unmap(imem->domain, offset, PAGE_SIZE);
+				iommu_unmap(imem->domain,
+					    ((unsigned long)r->offset + i) << imem->iommu_pgshift,
+					    PAGE_SIZE);
 			}
 			goto release_area;
 		}
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
