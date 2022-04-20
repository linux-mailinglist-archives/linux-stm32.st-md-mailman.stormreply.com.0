Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0B9508470
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Apr 2022 11:05:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 581A0C6049B;
	Wed, 20 Apr 2022 09:05:04 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76BBEC6047D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Apr 2022 09:05:03 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id bb21so526243qtb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Apr 2022 02:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GWU0CFZHZcK0qVtLfhFSoJd+WGMELdBWCS1aTnDQr3U=;
 b=Iv2nZ/RlP644ADdG0Hr0RG7R/5gfSIQHdry7ICG8dKhB1iHWDcQCWdF7CfrLtk4hGv
 gQRXUT6pvM1qpHMrUoWSoaUV1nendQ7v3rdf8Uo4ZSqn/yEYDQSFYpJlfYvjvgwHdcse
 JK4il4+3AiMnBm+F1NoGl433RbNvIJTR8uHZqZVSPPiWiusSgQyakK2Ri0ArABjsRPP/
 bX0WQMZxc9kZiZ47tVtutgaqh0iRmbdFXjMzyVYZ/UMZBiwUgzv0829jphGWtb1vLK+o
 QUiQtVS2bBRa+ZDO7SijfGJhpI9dkaw/9B+k7LMSq7L9ImXT2X0n1a4o9ZY0ezJOQg3W
 2iAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GWU0CFZHZcK0qVtLfhFSoJd+WGMELdBWCS1aTnDQr3U=;
 b=dfFNTysBm6VxSn0WBF5NxHXKxGdx6goYP5VEzbXgpF0jb7B7Z0Xh5MDhp48GywM/c5
 HoeUUcy6IyBNcqFFw9I07zvrop62NqeKa2KlpTWBvQ5OdaCV9Ps0686qUmHgAF6oEnEr
 GWGdvf2ch0TNMOaVsQ2nCDPguc23IdN7R/O6aTp6Mi36/wiVASbgpSy4QVxdUD+eBaMR
 k9MnoPuhvBVP4edOmxuJp0a8LKL1uOssvRVLzGrZI/LvBrhefwQ9wgOcitW7q5fEUOFO
 xNZ+7VrMGduDEQdtd3rLdcFsJjGALXL2ooE2BdZn8UxX2I3P6jLD6J4+hgdqR5PG7Au9
 C24g==
X-Gm-Message-State: AOAM530Py9X3Xvby6nkzkYnIYcGfRR8gVFREtrPkZm9YD1geecdj3PIm
 TcbMm6tqZZuJIBNcsReuX0o=
X-Google-Smtp-Source: ABdhPJynC+cZt0N24fBHq9t1/ImAPBCuJFzgMh6bLZNrRU9DO1Wd9RchF3AZrg8Hkwza637Uw3GtwQ==
X-Received: by 2002:a05:622a:1ba5:b0:2f1:f540:e04b with SMTP id
 bp37-20020a05622a1ba500b002f1f540e04bmr11914803qtb.62.1650445502343; 
 Wed, 20 Apr 2022 02:05:02 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 f28-20020a05620a20dc00b0069d98e6bff9sm1249602qka.32.2022.04.20.02.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 02:05:01 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: alain.volmat@foss.st.com
Date: Wed, 20 Apr 2022 09:04:52 +0000
Message-Id: <20220420090452.2588930-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, linux-spi@vger.kernel.org,
 broonie@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] spi: stm32: using pm_runtime_resume_and_get
	instead of pm_runtime_get_sync
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
pm_runtime_put_noidle. This change is just to simplify the code, no
actual functional changes.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/spi/spi-stm32.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index a6adc20f6862..6fe617b445a5 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -2000,9 +2000,8 @@ static int __maybe_unused stm32_spi_resume(struct device *dev)
 		return ret;
 	}
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
-		pm_runtime_put_noidle(dev);
 		dev_err(dev, "Unable to power device:%d\n", ret);
 		return ret;
 	}
-- 
2.25.1


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
