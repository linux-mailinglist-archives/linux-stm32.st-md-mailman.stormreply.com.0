Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 772E246A1D
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2019 22:36:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 374FEC0613B
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Jun 2019 20:36:58 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1FC3C0613A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2019 20:36:56 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p26so5269527edr.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Jun 2019 13:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lBWG1/N0+LvEZ6uCwdhrYMnJvIvD0qmv1VyQaIMwTtA=;
 b=MnAT1Ta2fJrQ+MzHqIGw7Shq8DQY0UyfJXcxciD2tMsWXkM/e+djKuILD3xOuf0Uz3
 UiwlDWaJoYEWLwTa5q+H6pfZUOWppMtUjYUczcOj3scDCe6su+59j1Kiq/rPHRe9B2nK
 zkOqwlOWco8m2GkXoVjE8GSKN8dWCnDhizRbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lBWG1/N0+LvEZ6uCwdhrYMnJvIvD0qmv1VyQaIMwTtA=;
 b=SJimQ3EErohx+XvE/A9vprPuC0+6QMzaHbRLOegrGUZBY+O38dxgDT2jX7e89SYciN
 fBk/OTHbKz28JSVD5mMiMNZGma6oWl6qGGqarrIA0e/SG2i67LiJNz7LNqXdxQB4HLbt
 so0F+TqQy3pKp8e55oO3tRWx18fI634CtwU8zQctJxamtoeGSMrmQnCOhcaAmDNwxSTK
 oVJDm11XIkHv289W+lURzy+XHBI4DRMXtDSJv/ALEYn5v5eAOoR4ejv54S+lmQjjkC1p
 ptc70oOZKvAIAvctRTZkfjV0ObSOyX98msHcSrhtDd6Y/rR/mbwdH+TugwJOECDp6qwi
 ub9w==
X-Gm-Message-State: APjAAAVK6oMVOk9Tqu7qUl4z3LfKc8+y8I95NE79GdO5Su6CPwHCSJ3s
 ZCoD7Ke4Jlji7oeogtf4AyUX9g==
X-Google-Smtp-Source: APXvYqwPMEc8FYi6lS+722FehIBIdaF7/9dHp0qvNZR0OU0SWpzWu4FMznELavDMjpI6+yK++1DnHw==
X-Received: by 2002:a17:906:2890:: with SMTP id
 o16mr58729664ejd.80.1560544616483; 
 Fri, 14 Jun 2019 13:36:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:55 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Fri, 14 Jun 2019 22:35:46 +0200
Message-Id: <20190614203615.12639-31-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Philippe Cornu <philippe.cornu@st.com>, Yannick Fertre <yannick.fertre@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 30/59] drm/stm: Drop
	drm_gem_prime_export/import
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

They're the default.

Aside: Would be really nice to switch the others over to
drm_gem_object_funcs.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Yannick Fertre <yannick.fertre@st.com>
Cc: Philippe Cornu <philippe.cornu@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: Vincent Abriou <vincent.abriou@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/stm/drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 4026c33ccc39..331f5e8d779b 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -67,8 +67,6 @@ static struct drm_driver drv_driver = {
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_free_object_unlocked = drm_gem_cma_free_object,
 	.gem_vm_ops = &drm_gem_cma_vm_ops,
-	.gem_prime_export = drm_gem_prime_export,
-	.gem_prime_import = drm_gem_prime_import,
 	.gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
 	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
 	.gem_prime_vmap = drm_gem_cma_prime_vmap,
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
