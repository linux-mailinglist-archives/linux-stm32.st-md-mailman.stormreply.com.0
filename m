Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA40B5E5D
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Sep 2019 09:53:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E47EDC35E05;
	Wed, 18 Sep 2019 07:53:44 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F5C7C35E03
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 07:53:43 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id d3so2745333plr.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2019 00:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PJG4R+fWj0sM0gBzRDWpk4Qq46V/CmHI+1H6OVyYxow=;
 b=LPLquoAAfdRTAHtbCvmLo89FOddl3kLcmoKcvwkZ0Aw07CYrKMn+rFIQ2SMea735AQ
 AhnhBuxblGpnPuo+csACqsv4/PROmfKoa5EOp8kW373rASStMsZzdD+2vvLXcKZJcyxi
 2ImXKEAbpcXEmkfMjE0o+4eZnp8Xd6U5kObCj+vhHZLUxNrHqO3Fb2vGNuc4KjPolu9a
 eNwCsdLN6k8bFLCyXjsqYRR6Fs0KdBq96+GkBgYg897380aPwILuaA9ey3/ifpesPQLU
 w68JEyzljbnOCXit4ZJLKveLJOqxOvOZIgwQR0ydrTc51rSAGBZehoceinBxXYmxAzwE
 T+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PJG4R+fWj0sM0gBzRDWpk4Qq46V/CmHI+1H6OVyYxow=;
 b=Bo6eZwFwni0IM0sF0TODnD/+s6R4WyIQD6XP59SXMyqAQOwrCLSRiFI98K+zYUqRes
 qzZu9dG5RSvmM8pwdP1F4QHPYJwqKcPtEKD2MN96NkmgByqHN7otG77cMUjazjirD/rm
 QfEoIVP//WgbTR5dNESEXfQOVKil9rv/tXL+QMOendmgzsxJaglaKLLS0x2ZwK7syeXS
 sJsl3YTej0mqEPZwonWBumkAnBEm041OVs122YNzcy4ikM9vU+Qf0tOUrKxCVUMKSOv7
 br1KZinhOyoUquFZf2tFMEnDgUt+w8WnxcVMh55/3ZoCOs0roh6IdnzKFQ9Z4/UB5MyV
 dJPw==
X-Gm-Message-State: APjAAAWg71w/b9qsVAjJ35c+xMe3C5XYeZGmJmTulK6JWIz/hJ7GlqR0
 ZnfCBjj+tIs1hP1rgPWd0ew=
X-Google-Smtp-Source: APXvYqwvA2Z/8K4t3M3bEg5QWzJdOEqfLT2DZsU8W/BmRASwQDwnmEUZ8gxHBxKvOMXGNHlizN8Mqg==
X-Received: by 2002:a17:902:8d87:: with SMTP id
 v7mr2716294plo.229.1568793222048; 
 Wed, 18 Sep 2019 00:53:42 -0700 (PDT)
Received: from localhost.localdomain ([2001:268:c147:d9df:f819:e399:825f:f2dc])
 by smtp.gmail.com with ESMTPSA id h8sm5580715pfo.64.2019.09.18.00.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 00:53:41 -0700 (PDT)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@jic23.retrosnub.co.uk
Date: Wed, 18 Sep 2019 16:52:47 +0900
Message-Id: <d8c0acde9e5de3930397cb184fd97c1e1372642a.1568792697.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1568792697.git.vilhelm.gray@gmail.com>
References: <cover.1568792697.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 linux-kernel@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 6/7] counter: stm32-lptimer-cnt: Update
	count_read callback
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

The count_read callback passes unsigned long now.

Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/stm32-lptimer-cnt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
index bbc930a5962c..73bb773f5e6d 100644
--- a/drivers/counter/stm32-lptimer-cnt.c
+++ b/drivers/counter/stm32-lptimer-cnt.c
@@ -377,8 +377,7 @@ static enum counter_synapse_action stm32_lptim_cnt_synapse_actions[] = {
 };
 
 static int stm32_lptim_cnt_read(struct counter_device *counter,
-				struct counter_count *count,
-				struct counter_count_read_value *val)
+				struct counter_count *count, unsigned long *val)
 {
 	struct stm32_lptim_cnt *const priv = counter->priv;
 	u32 cnt;
@@ -388,7 +387,7 @@ static int stm32_lptim_cnt_read(struct counter_device *counter,
 	if (ret)
 		return ret;
 
-	counter_count_read_value_set(val, COUNTER_COUNT_POSITION, &cnt);
+	*val = cnt;
 
 	return 0;
 }
-- 
2.23.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
