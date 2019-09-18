Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54865B5E62
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Sep 2019 09:53:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 223F2C35E05;
	Wed, 18 Sep 2019 07:53:49 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F507C35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 07:53:47 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q21so3809648pfn.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 00:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wv4la6Y6FsJg+2v49trmGgdAwNGUcPB7OMZV54Bj2EQ=;
 b=gBsEGCLIoG9yZOLSPABp5DkqpxUM9VPF+gft6+M58mitntGiBP2B8ZmrdxOFtVQXbn
 Ri3QHHyEmNUfyQSyX52qq4D7m9tZmGEhy7E12ATGIl8xUL2fdr6MQC7B7UgLocy3qRN2
 zKvq2O6kUZNUZUjYg9ZTnJLo1cAZ3DagU2gA6jbq1mM9d7b8TS+CBxCYv73a21JsSweL
 YgDq8thCF1g0TVAs5oSjbcIWdTfUOK6BABgoT/pslldal2AWK0yke8OqcUmbkyBbntit
 /xJdKQ99zJ/XgOU8AdprPj5kAjHHpD7e2Vrr4WeHEetM6hB5L+So+ClfGNokdxjz5+Vw
 UwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wv4la6Y6FsJg+2v49trmGgdAwNGUcPB7OMZV54Bj2EQ=;
 b=cgzTQn1UDsE9Fc/fDSpq5LLHO2G6dZG1O8SVBm7v7/GF2WSD1MyaKz+scrVffDCFgT
 d/gfyP+eA1PoYPSCl+4GHMcXsoKAM0J+v+zq7hVVrXfWFclZOHgKD4NpmshUphE/8cDw
 YmB+qdBQnqTuEiA6jXnBikIohjIbBP4WNTgfBq2gMwaR5Ee4Hob1ViTjns/IaXWVSo3t
 mv4qtTaaW/xHa3b3EG2YZRQBI8RpvBl4TQwixHKcotF/lqwPrYWT0XM1a/uPYpPg9OGW
 QYOimL5mxzzswebmUvf6+oMFOo5eRaYw/cHo7OrEjxjU250pG/P2cRsa2t5Q1ownVI5e
 sXog==
X-Gm-Message-State: APjAAAXOLuT0lYkTNFo5oqi87KhvBGaBYg0kQNYf2nP25sPcg4aPPCGa
 AFQNm4NB/lrc3p/HGSu1r2ezOHaf
X-Google-Smtp-Source: APXvYqyk7VLAQdjAwuVNeoLOS2lLrS99HPfR5mFLVgsHVxJ42p5JUMRjPPcgX6gO5Y/xqCH3Tv6Kyg==
X-Received: by 2002:a17:90a:b108:: with SMTP id
 z8mr2370791pjq.64.1568793226157; 
 Wed, 18 Sep 2019 00:53:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:268:c147:d9df:f819:e399:825f:f2dc])
 by smtp.gmail.com with ESMTPSA id h8sm5580715pfo.64.2019.09.18.00.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 00:53:45 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@jic23.retrosnub.co.uk
Date: Wed, 18 Sep 2019 16:52:48 +0900
Message-Id: <327fe01b7ce4feb0fc3d854393691664a6a36b40.1568792697.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1568792697.git.vilhelm.gray@gmail.com>
References: <cover.1568792697.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 7/7] counter: stm32-timer-cnt: Update
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

Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/stm32-timer-cnt.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 644ba18a72ad..839083543323 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -48,34 +48,27 @@ static enum counter_count_function stm32_count_functions[] = {
 };
 
 static int stm32_count_read(struct counter_device *counter,
-			    struct counter_count *count,
-			    struct counter_count_read_value *val)
+			    struct counter_count *count, unsigned long *val)
 {
 	struct stm32_timer_cnt *const priv = counter->priv;
 	u32 cnt;
 
 	regmap_read(priv->regmap, TIM_CNT, &cnt);
-	counter_count_read_value_set(val, COUNTER_COUNT_POSITION, &cnt);
+	*val = cnt;
 
 	return 0;
 }
 
 static int stm32_count_write(struct counter_device *counter,
 			     struct counter_count *count,
-			     struct counter_count_write_value *val)
+			     const unsigned long val)
 {
 	struct stm32_timer_cnt *const priv = counter->priv;
-	u32 cnt;
-	int err;
-
-	err = counter_count_write_value_get(&cnt, COUNTER_COUNT_POSITION, val);
-	if (err)
-		return err;
 
-	if (cnt > priv->ceiling)
+	if (val > priv->ceiling)
 		return -EINVAL;
 
-	return regmap_write(priv->regmap, TIM_CNT, cnt);
+	return regmap_write(priv->regmap, TIM_CNT, val);
 }
 
 static int stm32_count_function_get(struct counter_device *counter,
-- 
2.23.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
