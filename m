Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE38EB069AD
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Jul 2025 01:01:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80036C349C1;
	Tue, 15 Jul 2025 23:01:44 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3F8FC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 23:01:42 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-73e55e829fcso978108a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 16:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752620501; x=1753225301;
 darn=st-md-mailman.stormreply.com; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=46gEt3Bx0FBkn/nnSaRTnSsikfa6dw7cUtJIKu/AHuc=;
 b=HawzMDVXMraOSqg0sVH+98vkdNlCKQta35QL2MOS5JG9hQHH/B/7k8mrOjGBy3u22k
 rIZQAJjKFBdM5J+RmUyUULFKZUMKIYZ1JyzQ5JKSBGnxLsr6c3lBKVTBI5fkcR4p0VFX
 iAcWmkS5x6/ZU5jnmKX+YxG4/ovdrgsFEY/ufPGIaAV8UHjDoAfGLLUrKu/73SMEid++
 Ys7oG9GYAO2SWxtVdBbTysB0Mz+OlN8af4rBGVWHOF9oZWWI/im8VnabFsjoSYICJK8V
 u/UPB2oh2asC54yuR1bBoK5x1ef4UjPAAJI66SlbScpxjT4So6o6NKZc8AB3P+GjxkbW
 5Whw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752620501; x=1753225301;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=46gEt3Bx0FBkn/nnSaRTnSsikfa6dw7cUtJIKu/AHuc=;
 b=ptxwiqssj/gKhRcQtpBW7Btl/3yax+gc6zfDskTOJxbHxC+Bfbn94GEOS4ntIFCTUG
 VrNgHvOQbx3rFcRNP0ikPc0/xR1OAWvH7Bx277DUrel8nnnUeB0rw34/nZkhC1cQzbWU
 6w777mObZen+d6gMzMSEr4wdjhUxSgjK6dGBgZ7jiR6Pk5n3gArvXxlrNT2sTGO0EH45
 /yaMoODO6yGyd1KS819Ip3YGuvz/9Yud8Whn6BqW4F6vfc3o4hgccPR+nFnMRHgaRy13
 Uy6DWSTGhE67jqrqJuKEF/Hooz6/djPVCfl+zoNfy19zAPu+++w1zveaePMjngcI0rji
 KcuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIVjWFSZbou+aKADxWaM8NPsLK7ZIh3+m8HDf4YMhnZGerQhXwr8m4N9H1VcEtibia+672GZNNPHCQgg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzGi4W0flcgGxllf9+4ykwMAOcG+acwu4vwlkRxxma9jFQlY0kR
 3RLUTwaxsJJA/Iykm3rtgszPSNWjKkt09CKkcy/kz6eSfP55mBv9JSE97v8mchZewaY=
X-Gm-Gg: ASbGncu0Ux9lYaGsau6P5Fa6xHY44aOc1HfLDySYShoWuICt+HgtFqDRb5cf/SAA6UE
 YP7429aR1NsZpqo/ibcv1nu4lpjGYgiw6N9T3JjtwnV5xk/tJNfiFuyj2VOv9NcF/xua4lzOp+s
 TsZShVGMPRSByvPpTq6mZKzGLsqahx59q9KvCWQbQtEO3aeF4ROGhbTRWDu6bxoDo4aM3HlwT2i
 D87qxvz/i9RZP06L5wNIcf83nTvMwJHb7xi5pZfn73EefrLh5KqahA3VNNUt8Q8eR5j7ZARzM5Y
 3Li+aakQZt5Ipu2TPYOoQAeXnyCm3PzZtGFauJkrAyyAp4mIkBXuArTBz/CvOCFumhHd0/sHbZN
 TilHBwUJSrYDYa240zOIH4gjME97QWxgenINq0sI=
X-Google-Smtp-Source: AGHT+IFrIo3qo3Xq7DrVRugRg16jg4aCYHopevdB0f55AiC+g1RwMciM6Lgy4L9vDkABRNtjnbIHXQ==
X-Received: by 2002:a05:6808:30a2:b0:409:f8e:7272 with SMTP id
 5614622812f47-41cf0cb0f3cmr543563b6e.38.1752620501381; 
 Tue, 15 Jul 2025 16:01:41 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
 by smtp.gmail.com with UTF8SMTPSA id
 5614622812f47-41c73a25f04sm457282b6e.0.2025.07.15.16.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 16:01:40 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:01:39 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <fb2a26a2-119b-4b5a-8d44-b29e2c736081@sabinyo.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH next] spi: stm32-ospi: Fix NULL vs IS_ERR()
 bug in stm32_ospi_get_resources()
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

This code was changed from using devm_ioremap() which returns NULL to
using devm_ioremap_resource() which returns error pointers.  Update
the error checking to match.

Fixes: defe01abfb7f ("spi: stm32-ospi: Use of_reserved_mem_region_to_resource() for "memory-region"")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-stm32-ospi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index 72baa402a2c3..f36fd36da269 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -823,9 +823,9 @@ static int stm32_ospi_get_resources(struct platform_device *pdev)
 	if (!ret) {
 		ospi->mm_size = resource_size(res);
 		ospi->mm_base = devm_ioremap_resource(dev, res);
-		if (!ospi->mm_base) {
+		if (IS_ERR(ospi->mm_base)) {
 			dev_err(dev, "unable to map memory region: %pR\n", res);
-			ret = -ENOMEM;
+			ret = PTR_ERR(ospi->mm_base);
 			goto err_dma;
 		}
 
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
