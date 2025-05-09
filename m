Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B574CAB1174
	for <lists+linux-stm32@lfdr.de>; Fri,  9 May 2025 13:04:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79F6BC78F96;
	Fri,  9 May 2025 11:04:42 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7077C78F94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 May 2025 11:04:41 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-441d1ed82faso12799025e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 May 2025 04:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746788681; x=1747393481;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Q8MiJZaTLkXXn5poCl8egUQZo+oj0wsGgvhPlEKD64U=;
 b=zH4hL3d0RswjTqHo1v3ZoI5gHPwp3nKuSzaSfdmgR0F4O5XAYdF8g45aHnnuHkDTj/
 8Pep4NBEQ34VlxjNDwetNTVerWT++jNq0mgi5yJG8uhlI1Yc7FXSHZoWJ4rr/FaEKeb6
 IqOTbLBd7lttQnvEMWoAPPL2pxJzGP1Ygz5sHvcIhSNg/Df0SB+TFdEDJNH+d5kf7gl3
 GOEszXtINx+KIwgJp6tL7s0Ij7XjfB0gCk5ERvi1HGlfmomSq5frJdRxAoNYnO3JdVBH
 TF2iCKjYKf16NJQCR4XfOZlEaPwMNY8/W52f5FK7CTSYv3ImObwBnpLLd90Xz7qmR6VO
 TULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746788681; x=1747393481;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q8MiJZaTLkXXn5poCl8egUQZo+oj0wsGgvhPlEKD64U=;
 b=dfZDPbEk7ijqBA6KSkBEsQ0JOqXcxGEH0fYotkcrMF351j2wPv70WjEPKQuKE0k24y
 Bl65Z3L25lhJlVOI+Rk8ygPjO3DZu+CIYcgqRob3chVrbV36m5VXn5dCvRcYkVrDVrqJ
 +sAZ7+Rcg3N/Jmmn9ciqCQ2+ewVKE3eaqO++8UYbljWZWYNRCTaFFlUEVW+5kwcWtcLN
 CK+hKNDbUue98FktSQKqg4ST1VK33gRJsitxgajqKSnQSb14XXaGuJDly/j1KkhRrh5J
 qkecDMeaXHiI/LTuY3IwCB64G3AFmHvRcXu9SCMIE/++TDsl+AnnUtJ0oRkr5oQR4w/y
 3K/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH2U2Dax+Al6+r+vWzK7DcSD3g4bvBdHym+Ydo9fujz7oUOKQqzWiboiY3pJU8ONYH49TN4xRhAQHJUw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzYeAJdccoErKaxg00OGYA4+Jfd0x4TYrfph9VEc8vo40aFqY2/
 BAnz4XAd5036xh8CKyxITDMofpKk8/1UcedfcTxpRXe+EQxAVkaTwd05ajQKgdo=
X-Gm-Gg: ASbGncuXNYYANKzDXPaB2XORFHmiC6fSAwbsgWv4Ea8YHZaN4BQ7AZUZJOvegGhZMcD
 adkqZ3dw1djk38zXiwnqY250R1JthOVycsGLuP3msUX4vqcQ1V7lkccso2hc8FSh2EKrqykELNM
 1YYLex/BhP2gdw32t0lcUSdSp4JvaBpyj89xF6iD+ZSUv50CKygvNnbY8OzDueL9tz/1b9dwf/m
 R+nfz0oKgaRMEpsSvUnGNm+N/U0VmOPo0U0HqrJX7D7KJmTyPo6HPwAdqN8A/8kDf8ORcrHh9YT
 pcuvdfJF47MGAKRR3Lcnip9KulVcqByjscnrpf8Fgh/Y6w==
X-Google-Smtp-Source: AGHT+IH8/NzuhQIHAiiCvtk5klNpsdsTuvJWt/oDUURnYu6Ufz/YNp+rlGVB1mscySmEvgSO0iuJ/Q==
X-Received: by 2002:a05:600c:3ac9:b0:441:bf4e:89c8 with SMTP id
 5b1f17b1804b1-442d6d18cc5mr21966385e9.3.1746788681116; 
 Fri, 09 May 2025 04:04:41 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442d687bdcbsm26022585e9.40.2025.05.09.04.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 04:04:40 -0700 (PDT)
Date: Fri, 9 May 2025 14:04:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Message-ID: <a1645f1eedaa9b2ae62ac07feed0552eea75bc46.1746781081.git.dan.carpenter@linaro.org>
References: <cover.1746781081.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1746781081.git.dan.carpenter@linaro.org>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] memory: stm32_omm: Fix NULL vs IS_ERR()
	check in probe()
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

The platform_get_resource_byname() function returns NULL on error.  It
doesn't return error pointers.  Update the check to match.

Fixes: 8181d061dcff ("memory: Add STM32 Octo Memory Manager driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/memory/stm32_omm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index fa0f75e4a6e8..c8de785401f2 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -320,8 +320,8 @@ static int stm32_omm_probe(struct platform_device *pdev)
 		return PTR_ERR(omm->io_base);
 
 	omm->mm_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory_map");
-	if (IS_ERR(omm->mm_res))
-		return PTR_ERR(omm->mm_res);
+	if (!omm->mm_res)
+		return -ENODEV;
 
 	/* check child's access */
 	for_each_child_of_node_scoped(dev->of_node, child) {
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
