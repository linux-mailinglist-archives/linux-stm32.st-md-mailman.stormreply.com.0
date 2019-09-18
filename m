Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCF7B5E5C
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Sep 2019 09:53:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D937CC35E04;
	Wed, 18 Sep 2019 07:53:39 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89B52C35E02
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 07:53:38 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id a2so3815003pfo.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 00:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jztD0q/pSM8JUi6mwAcEWzxcgZfTnzpK2xWBV2x6KlU=;
 b=Um9D2iCr8IeMcdqzFKJCNkI4+H9iquS7B6UFk6cgl4jXkAirxwIuJ95qkKTrUhPsfT
 gTJcQMEthS4bzi0GfhSAd52gBR5BnadIzveTBTJe5gXEKvFl/zkrZBG1JQAG3wwASiDa
 INEDf4012fWYH/QZwcG3VHMmcNQaX2TVdkk3ncLyDT9fs5uPELiztes5FG8XMNlvN0fi
 YM0fnrpbCFQ0TSpfLVRR3SyTJKZH5qDBhLa0bfCyr2euLMqndD+EYffJSPfQ3LI5rTg4
 VbrNEubms5qPtsWb331YMEQTqHr4o0GWM0hcAlBaJwAVOpVN8q53IHXZBOA7Z1F9Hfxs
 DeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jztD0q/pSM8JUi6mwAcEWzxcgZfTnzpK2xWBV2x6KlU=;
 b=ltu3M3yasAsUqZFOVpoJ4S9QXq55tCL5Ls0vv4B1i01vWmSH0B9zWIN+SxU0UAzGQT
 4/Oh6lvcAw2yAELwJu9Tu3HHtZJSNyWPjdCwxEm3vRfAfhx6nuLqHZdkB+3lI3n2/tnS
 mnbWnqqj0fxumJi4Zy4/xmdvvwJeo1Z4zkowuLCz7579dXT7FnH6360+Np5zoPACN5qO
 539i7amnJhxUalPcc/QQKpBIC+tOBAUGlVTK70SPvHR8IcVr8RYfB2IsBjVa9uVGqXCb
 krIeisAlqGA1dMvf5j0WWXlQRqAUxp5bZTHOUWoeJctd6opH1NcOt+IVKwUHxwVa2rSI
 yWpw==
X-Gm-Message-State: APjAAAUaGOHh5ilAoOj4nJb9JwGIkU9WfyaVi2UFucR7KXToAPJxGPNo
 uD0ccCsUVQzwPpdjePjRwf0=
X-Google-Smtp-Source: APXvYqxxqPoVDdtGr5+T574vmF9JYrxp2FWnYti4I+/c5S8B3oWrqRqPteeAZ6AyHkDVfV3S2ouo0A==
X-Received: by 2002:a63:2004:: with SMTP id g4mr2593156pgg.97.1568793217016;
 Wed, 18 Sep 2019 00:53:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:268:c147:d9df:f819:e399:825f:f2dc])
 by smtp.gmail.com with ESMTPSA id h8sm5580715pfo.64.2019.09.18.00.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 00:53:36 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@jic23.retrosnub.co.uk
Date: Wed, 18 Sep 2019 16:52:46 +0900
Message-Id: <6925fdda26c57ce29d373f8cb01a572cd7b92c0f.1568792697.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1568792697.git.vilhelm.gray@gmail.com>
References: <cover.1568792697.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 5/7] counter: ftm-quaddec: Update
	count_read and count_write callbacks
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

The count_read and count_write callbacks pass unsigned long now.

Cc: Patrick Havelange <patrick.havelange@essensium.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/ftm-quaddec.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/counter/ftm-quaddec.c b/drivers/counter/ftm-quaddec.c
index 4046aa9f9234..c2b3fdfd8b77 100644
--- a/drivers/counter/ftm-quaddec.c
+++ b/drivers/counter/ftm-quaddec.c
@@ -178,31 +178,25 @@ static const enum counter_count_function ftm_quaddec_count_functions[] = {
 
 static int ftm_quaddec_count_read(struct counter_device *counter,
 				  struct counter_count *count,
-				  struct counter_count_read_value *val)
+				  unsigned long *val)
 {
 	struct ftm_quaddec *const ftm = counter->priv;
 	uint32_t cntval;
 
 	ftm_read(ftm, FTM_CNT, &cntval);
 
-	counter_count_read_value_set(val, COUNTER_COUNT_POSITION, &cntval);
+	*val = cntval;
 
 	return 0;
 }
 
 static int ftm_quaddec_count_write(struct counter_device *counter,
 				   struct counter_count *count,
-				   struct counter_count_write_value *val)
+				   const unsigned long val)
 {
 	struct ftm_quaddec *const ftm = counter->priv;
-	u32 cnt;
-	int err;
 
-	err = counter_count_write_value_get(&cnt, COUNTER_COUNT_POSITION, val);
-	if (err)
-		return err;
-
-	if (cnt != 0) {
+	if (val != 0) {
 		dev_warn(&ftm->pdev->dev, "Can only accept '0' as new counter value\n");
 		return -EINVAL;
 	}
-- 
2.23.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
