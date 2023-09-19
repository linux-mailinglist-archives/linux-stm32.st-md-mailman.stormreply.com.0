Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3EF7A6DE4
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Sep 2023 00:05:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E466C6B477;
	Tue, 19 Sep 2023 22:05:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4056C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 22:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FlndQIDvmQNNiDBOWM0TZkkOp47C0AT0vhY18+2aUjE=;
 b=gqeCRq+JhHqCxu2pEuxHldzo8+uXP8NBQ9VmJt/sKPmSdP7CwF+/VSscWHo16LaQN5od4F
 9xCabrpAQDwrKXqSSx/e41bclDJalB/ylzOEg4UdKou4PW0d2Nt+NdpS1Gg+xbokHaNhZ9
 ljk3mbbSKix1iYv+qurf3CJPamMDIs4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-22c3P2eXNY-K10RoW_-XLg-1; Tue, 19 Sep 2023 18:05:08 -0400
X-MC-Unique: 22c3P2eXNY-K10RoW_-XLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 804A73822565;
 Tue, 19 Sep 2023 22:05:06 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02E1940C2064;
 Tue, 19 Sep 2023 22:05:05 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 17:55:57 -0400
Message-ID: <20230919220442.202488-3-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-1-lyude@redhat.com>
References: <20230919220442.202488-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Cc: Daniel Vetter <daniel@ffwll.ch>, Karol Herbst <kherbst@redhat.com>,
 Danilo Krummrich <me@dakr.org>, open list <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Airlie <airlied@gmail.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH v3 02/44] drm/nouveau/imem: support
	allocations not preserved across suspend
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

From: Ben Skeggs <bskeggs@redhat.com>

Will initially be used to tag some large grctx allocations which don't
need to be saved, to speedup suspend/resume.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 .../drm/nouveau/include/nvkm/core/memory.h    |  1 +
 .../drm/nouveau/include/nvkm/subdev/instmem.h |  2 +-
 drivers/gpu/drm/nouveau/nvkm/core/memory.c    | 15 +++++++++++++--
 .../drm/nouveau/nvkm/subdev/instmem/base.c    | 19 ++++++++++++++-----
 .../drm/nouveau/nvkm/subdev/instmem/priv.h    |  1 +
 5 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/memory.h b/drivers/gpu/drm/nouveau/include/nvkm/core/memory.h
index d3b6a68ddda36..fc0f389813916 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/memory.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/memory.h
@@ -12,6 +12,7 @@ struct nvkm_tags {
 };
 
 enum nvkm_memory_target {
+	NVKM_MEM_TARGET_INST_SR_LOST, /* instance memory - not preserved across suspend */
 	NVKM_MEM_TARGET_INST, /* instance memory */
 	NVKM_MEM_TARGET_VRAM, /* video memory */
 	NVKM_MEM_TARGET_HOST, /* coherent system memory */
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
index fcdaefc99fe85..92a36ddfc29ff 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
@@ -26,7 +26,7 @@ struct nvkm_instmem {
 
 u32 nvkm_instmem_rd32(struct nvkm_instmem *, u32 addr);
 void nvkm_instmem_wr32(struct nvkm_instmem *, u32 addr, u32 data);
-int nvkm_instobj_new(struct nvkm_instmem *, u32 size, u32 align, bool zero,
+int nvkm_instobj_new(struct nvkm_instmem *, u32 size, u32 align, bool zero, bool preserve,
 		     struct nvkm_memory **);
 int nvkm_instobj_wrap(struct nvkm_device *, struct nvkm_memory *, struct nvkm_memory **);
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/memory.c b/drivers/gpu/drm/nouveau/nvkm/core/memory.c
index c69daac9bac7b..a705c2dfca809 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/memory.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/memory.c
@@ -140,12 +140,23 @@ nvkm_memory_new(struct nvkm_device *device, enum nvkm_memory_target target,
 {
 	struct nvkm_instmem *imem = device->imem;
 	struct nvkm_memory *memory;
+	bool preserve = true;
 	int ret;
 
-	if (unlikely(target != NVKM_MEM_TARGET_INST || !imem))
+	if (unlikely(!imem))
 		return -ENOSYS;
 
-	ret = nvkm_instobj_new(imem, size, align, zero, &memory);
+	switch (target) {
+	case NVKM_MEM_TARGET_INST_SR_LOST:
+		preserve = false;
+		break;
+	case NVKM_MEM_TARGET_INST:
+		break;
+	default:
+		return -ENOSYS;
+	}
+
+	ret = nvkm_instobj_new(imem, size, align, zero, preserve, &memory);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c
index e0e4f97be0294..24886eabe8dc3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c
@@ -94,15 +94,21 @@ nvkm_instobj_wrap(struct nvkm_device *device,
 		  struct nvkm_memory *memory, struct nvkm_memory **pmemory)
 {
 	struct nvkm_instmem *imem = device->imem;
+	int ret;
 
 	if (!imem->func->memory_wrap)
 		return -ENOSYS;
 
-	return imem->func->memory_wrap(imem, memory, pmemory);
+	ret = imem->func->memory_wrap(imem, memory, pmemory);
+	if (ret)
+		return ret;
+
+	container_of(*pmemory, struct nvkm_instobj, memory)->preserve = true;
+	return 0;
 }
 
 int
-nvkm_instobj_new(struct nvkm_instmem *imem, u32 size, u32 align, bool zero,
+nvkm_instobj_new(struct nvkm_instmem *imem, u32 size, u32 align, bool zero, bool preserve,
 		 struct nvkm_memory **pmemory)
 {
 	struct nvkm_subdev *subdev = &imem->subdev;
@@ -130,6 +136,7 @@ nvkm_instobj_new(struct nvkm_instmem *imem, u32 size, u32 align, bool zero,
 		nvkm_done(memory);
 	}
 
+	container_of(memory, struct nvkm_instobj, memory)->preserve = preserve;
 done:
 	if (ret)
 		nvkm_memory_unref(&memory);
@@ -176,9 +183,11 @@ nvkm_instmem_fini(struct nvkm_subdev *subdev, bool suspend)
 
 	if (suspend) {
 		list_for_each_entry(iobj, &imem->list, head) {
-			int ret = nvkm_instobj_save(iobj);
-			if (ret)
-				return ret;
+			if (iobj->preserve) {
+				int ret = nvkm_instobj_save(iobj);
+				if (ret)
+					return ret;
+			}
 		}
 
 		nvkm_bar_bar2_fini(subdev->device);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
index fe92986a38858..390ca00ab5678 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
@@ -25,6 +25,7 @@ void nvkm_instmem_boot(struct nvkm_instmem *);
 struct nvkm_instobj {
 	struct nvkm_memory memory;
 	struct list_head head;
+	bool preserve;
 	u32 *suspend;
 };
 
-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
