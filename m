Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F31979D6509
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Nov 2024 21:46:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 922F8C7A852;
	Fri, 22 Nov 2024 20:46:15 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A02FDC7A851
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Nov 2024 20:46:07 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-460ace055d8so16381651cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Nov 2024 12:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732308366; x=1732913166;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KdfcoTAixo+mlxOpXRifnZy9GhI+cyrUE3VMtPIwmvg=;
 b=a4+MJlxwAbmHs0pyFxhoaHKXEff+shubU8yrmNKs4VY7jd3aWrPRVllLxoMkQRVmXL
 pW9mD2jXtJyzn2R29IiPIzfmQWDOJvOfeVtKJK+Enkjc8TyLaBTR7Rkqp8hIBfqiK8Hy
 q0rZz1kwmEJpRdSgORWrfJon/jfMXJ4pLnUlmM7UTXqZXkN/GubFqWXGIoYpE+l27qQw
 aejcvM0c72Aft4ayuRJoXXp1FDy8w72XoKbnUbkpRoTdq3uIkCgg8CARdQB97vMwv3dq
 vbQVmhsYIvU3hDxbOQMgVSpYP7Xjqw9POh/f/0kuHtio3PSsRIB2NTu6dZsl3R6Githb
 yzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732308366; x=1732913166;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KdfcoTAixo+mlxOpXRifnZy9GhI+cyrUE3VMtPIwmvg=;
 b=PHX0ZLAp3Q5bUgrwgrGKHfLPzXooadHPaqO8+d8t8sqCWXIOY3ES1KV/D605PqUwTV
 cIzDv+gXd22RHfwwL5lI5gC3rqNPrB/Qv+XtPuqObSp3M3sTstAd9jQKTFuVDk1qEjgC
 DzhMgqhwrZK/Mh4pi5WHTu9hDmYhi0HRLh5AsUIOz0YpbxGjDMgJ/LpxtZe2VNnCNvVs
 o7viZwOcJQN7ToH8mGyPck/nKe/pIbt8AhkYxKUpUI6eYqIeqLdtg36Yoxyo0LUqh6oO
 vvTT4Qj4xCv7hpyxoXhDX22/GVhdq/XGpHcPVFFzsBtzVWiEq00jlsZxTH12KgJGsN99
 vi8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTQA9YChYQSvDZIOCQc9kh0bPVzjxpYgXjF0g+5nTI98m+KgiUh2Xnq+tHuy9MZMvAypDhuN7uLUQpAw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz33OYPJUQP8EstmVhI6NLqAh+iD60e8z+mngeP6/0/pOeW0FIk
 WZG9679FCnYpHMLuS8sCONPQhYsMLMjIQNS4Ksto5b/iwGiABGq8
X-Gm-Gg: ASbGncs56U7cByfbTd2Kql9mzKyXLMpy+5FweS63RFmI88a9XBAXQTMMyRsTDG7WGdX
 isgpqxjgG4KwqX27u4Wu+GEU/yLLLLoU7wbKlTbVqBaH8ImbwxuhBu3AGLqpr/XAV3kWy6nHWXL
 C5kuhmcguNJ99+YptS7etp0iMb4O6gKBgPJoHc8h1LidrEaQM3iVcUCP+1Lqb36Jzp3bHUCHi7x
 tonbIIz4d8vd/91u+NQzBO95/mhHKQYyjRjNfWjV7qkGo2ZHrI0RQHQMhOj3W/CxltoLa01
X-Google-Smtp-Source: AGHT+IEDZRkTO5+DQwSrlRCcw21oaJiFGCJZnGNbrmx62J2fNbuC3IdPrM/AFVV8d9sqgagVOv+RJg==
X-Received: by 2002:ac8:7d92:0:b0:45d:9525:42ff with SMTP id
 d75a77b69052e-4653d632068mr45585081cf.54.1732308366553; 
 Fri, 22 Nov 2024 12:46:06 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4653c3ed111sm16082051cf.20.2024.11.22.12.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2024 12:46:06 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: mchehab@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, hverkuil@xs4all.nl,
 u.kleine-koenig@baylibre.com, neil.armstrong@linaro.org,
 andrzejtp2010@gmail.com, dillon.minfei@gmail.com
Date: Fri, 22 Nov 2024 20:46:03 +0000
Message-Id: <20241122204603.44419-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH] media: platform: stm32: Add check for
	clk_enable()
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

Add check for the return value of clk_enable() to gurantee the success.

Fixes: 002e8f0d5927 ("media: stm32-dma2d: STM32 DMA2D driver")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/media/platform/st/stm32/dma2d/dma2d.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/dma2d/dma2d.c b/drivers/media/platform/st/stm32/dma2d/dma2d.c
index b6c8400fb92d..48fa781aab06 100644
--- a/drivers/media/platform/st/stm32/dma2d/dma2d.c
+++ b/drivers/media/platform/st/stm32/dma2d/dma2d.c
@@ -490,7 +490,8 @@ static void device_run(void *prv)
 	dst->sequence = frm_cap->sequence++;
 	v4l2_m2m_buf_copy_metadata(src, dst, true);
 
-	clk_enable(dev->gate);
+	if (clk_enable(dev->gate))
+		goto end;
 
 	dma2d_config_fg(dev, frm_out,
 			vb2_dma_contig_plane_dma_addr(&src->vb2_buf, 0));
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
