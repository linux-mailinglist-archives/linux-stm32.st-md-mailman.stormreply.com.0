Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AA4CAF10F
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Dec 2025 07:53:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A927EC5C842;
	Tue,  9 Dec 2025 06:53:43 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A66AAC5A4E4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Dec 2025 06:53:41 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso43203155e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Dec 2025 22:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765263221; x=1765868021;
 darn=st-md-mailman.stormreply.com; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qpimlZdEDtuP7WR2mZA0+z1H7nFjtx/bFty3v8hsXUU=;
 b=XwV+ZQJ3eDfyjsEUcI6GT7xpfgFI3MWslKEUPUb8VbaZBX8p6t8GcdbsCkxFfYPVpB
 9kL1Bn4cV53Qs2Nu8YbSVeak1xgtN7jyzZ4WLtzYc7XAokjkFNAo4de7bJJHGX8LXt7R
 60Qzn+t8hxR/Yab9qr478SWWyg8340ywmn/6p90XE4asc3W6ltsLEFs7+VaNYw21wsqq
 WQAWJfj+v12RDkBLdQK31sKQ8FWfUZmTI7VnD5CLLqMPj3xDAnDHNoP5FL5MOm6Ndw7b
 maxoKreHb6NHTx0xulU2UexOJQBxIirIjKEGEfKxf+og5dNmIIUYem5lWkKFhxmBLscK
 laAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765263221; x=1765868021;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qpimlZdEDtuP7WR2mZA0+z1H7nFjtx/bFty3v8hsXUU=;
 b=SqXjxfiOpfPe/z49+telQUiJ/bhvJ204zyGGsoO2bIBoV+1RNwHixdpGG+dINm88LZ
 u+w7MMXT0tuxntc09PymG9QLZWIo37KT4+JwVG5xEHeQrPXX3rP0Eh6uEbhrsRyNxNtk
 BJAe60l0LM9n/BVmYqdMuk4U+ofbO0q49bpFgJigid5vAwDSaJP5VkJeolDZRCyBx0gt
 DBt0ss1jJzdOEDen34m4MZieIJKNuWDuqIg3yQMnT0AtawgmuBNE3wYN9L0f/Io0vJS6
 7v3GB1hEHQMcBLOfDdFkftSr3GZaNpCGEayiDaqqbKEJbWK4dUAeuaxfE/6DxrCtwbEt
 C0/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC+s6FUwwlviyVBkIjL91+hgODI4P0q3MxvRrYT4jEkxylnaWxQrFEVvFkdGejVOs5jqBzrhmngzTnvg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YySBqwNr3I1EnFI8ByyPVx31mA79N6PoZUoYyyXp+Ys/U5GnIYz
 KAzKFgEg7BEhrTQCHOpkQvQKu0RL9A1KI2RQFTtjavKg0S3daNHXWYb3w/kFtKSagr4=
X-Gm-Gg: ASbGnctnptb776kb6g4A7SSWcN+yb5+mJ85cVpNg9sWdyJDDmDuKktjMidDM6h2rty2
 vCFq/ez8qXed5Re6IfS5gRYD263t/xBUcySEDmRKYKjH4cwzDK79z3oOuQBOFVo5A1dzRbDkyIf
 plEpbCTObHFTswQQZkqtjBBc2EXNHgz/+Lczipv2hU6v5bAIlgyhP6fJ1lhu/yMml71a9pgNnbo
 HLHY3CXlkobRJ6nnrlPR2cjYC+24Xt9DkkQuFPjDMkCS9JAQskAu5PFwsl/CXlaAFTuerW1icKy
 EjCNWPvVMqij5zLmLOF5RXRLYSq0bBiAjEYdUsgraDrSnEw0HyaQwzXRbZvwcnPLfjYxuk4XpX/
 eZrpzV3SdNMKZzSKih6SOQHCuw8CWdFpRs1beoFw++zU0dS4jLVLjraWTr83hVZerfE0tOL25/L
 oRp0k7HXaQ2T3lJUeL
X-Google-Smtp-Source: AGHT+IGaTnV6DUM6NZ8B996sUpARBrir70sGaGW5NyYdRK9/TvpgGM9K+ozidhKmYpB4+XkFZ3zK7g==
X-Received: by 2002:a05:600c:1990:b0:477:73e9:dbe7 with SMTP id
 5b1f17b1804b1-47939e4d013mr112666895e9.35.1765263220857; 
 Mon, 08 Dec 2025 22:53:40 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a7d35713asm11916255e9.1.2025.12.08.22.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 22:53:40 -0800 (PST)
Date: Tue, 9 Dec 2025 09:53:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <aTfHcMJK1wFVnvEe@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-phy@lists.infradead.org,
 Fengguang Wu <fengguang.wu@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Johan Hovold <johan+linaro@kernel.org>
Subject: [Linux-stm32] [PATCH] phy: stm32-usphyc: Fix off by one in probe()
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

The "index" variable is used as an index into the usbphyc->phys[] array
which has usbphyc->nphys elements.  So if it is equal to usbphyc->nphys
then it is one element out of bounds.  The "index" comes from the
device tree so it's data that we trust and it's unlikely to be wrong,
however it's obviously still worth fixing the bug.  Change the > to >=.

Fixes: 94c358da3a05 ("phy: stm32: add support for STM32 USB PHY Controller (USBPHYC)")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/phy/st/phy-stm32-usbphyc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index 27fe92f73f33..b44afbff8616 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -712,7 +712,7 @@ static int stm32_usbphyc_probe(struct platform_device *pdev)
 		}
 
 		ret = of_property_read_u32(child, "reg", &index);
-		if (ret || index > usbphyc->nphys) {
+		if (ret || index >= usbphyc->nphys) {
 			dev_err(&phy->dev, "invalid reg property: %d\n", ret);
 			if (!ret)
 				ret = -EINVAL;
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
