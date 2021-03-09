Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C9933269B
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:21:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5245EC57B78;
	Tue,  9 Mar 2021 13:21:43 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39671C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:21:41 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id o38so8751114pgm.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K+ywkOKIYI1rUeLTBajU0K1er4fWBGM8+BnI9DpZoy4=;
 b=llzPUbkZxWj2ssspPIFBoD9My5GmxNP0UdKdVEXdz2zTh/foocktiGWxwlIfJRrW45
 FOQPeFWkgFJA6uvgzNbb18ffI2aSIKJaf2Nxh1NOqOr43nJx5WTDzmKwlzYr1lcWwDUc
 clNvv9Co6ef7KmnE8OQszPLQ4TtmGTF65GqOntoIFFysIoFobvTu6O2G4VGTVNQyJDxo
 d1T1n//jA+sdhr3RSOgPIrY77OCfVqPS76BZ7+Pk9u10JTdIgL7mUuSUisGCW8n+9uYU
 pJLL6lkUIBYwiaig6NrOJ9TKFfZraijrjmUYMN7yhxoLuFmGdPhNkp5Y5a8nxQG/MYlI
 hejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K+ywkOKIYI1rUeLTBajU0K1er4fWBGM8+BnI9DpZoy4=;
 b=ZanLUXJBuGr9yHpsuFPF8cEmq/h06LlzQG2LVuiIBnAimHUcWqA/zrT89dYTsNknew
 A7aP/vuSx5ybQ9JR5pZ9lk402lEFtjKu6Pub9uUlOKJnWfwp/L6yeh9NHKqg7N8qBy0o
 fmmhWMRPglDf5cWXjSFCFw5E6OTIbn7cr3vLxmJ/Wzn14MWmzALx4r9Em3c6Qe267A8a
 PlYZw70Y1UnAe3qkRraEjR2WYG/aL0AlMAvrbTXWo00efWH/KICHg1eq+SLmh8vgRQRZ
 3mNfreIcIzg6vIrXR/ThQvcmWVSC/dgHpaASazIUkWDs8kDZxfJMyT1oq3aJrInfLaUE
 gBPg==
X-Gm-Message-State: AOAM533VFbq9mN3fVGEASi9zokvvkZKRvvKilNaisgpL0tmZ5qhvmZOZ
 Cw9KkWjrok5bI5ncvL7U4vI=
X-Google-Smtp-Source: ABdhPJyMLZ5b8EtqeiyGaxx6CJ7F0mX+VStcZ4Cbtooq3osrjRxIYqYrjb9XnyiH4sa4PKgADAZXqg==
X-Received: by 2002:a62:928f:0:b029:1ef:2370:2600 with SMTP id
 o137-20020a62928f0000b02901ef23702600mr24730883pfd.9.1615296099884; 
 Tue, 09 Mar 2021 05:21:39 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:21:39 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:30 +0900
Message-Id: <4d1b80ddf1ec22c70b7b11389a5c14fe209e06c2.1615293276.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1615293276.git.vilhelm.gray@gmail.com>
References: <cover.1615293276.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>, kamel.bouhara@bootlin.com,
 gwendal@chromium.org, david@lechnology.com, linux-iio@vger.kernel.org,
 patrick.havelange@essensium.com, alexandre.belloni@bootlin.com,
 mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v9 17/33] counter: stm32-timer-cnt: Add const
	qualifier for actions_list array
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

The struct counter_synapse actions_list member expects a const enum
counter_synapse_action array. This patch adds the const qualifier to the
stm32_synapse_actions to match actions_list.

Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/stm32-timer-cnt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 0c18573a7837..603b30ada839 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -267,7 +267,7 @@ enum stm32_synapse_action {
 	STM32_SYNAPSE_ACTION_BOTH_EDGES
 };
 
-static enum counter_synapse_action stm32_synapse_actions[] = {
+static const enum counter_synapse_action stm32_synapse_actions[] = {
 	[STM32_SYNAPSE_ACTION_NONE] = COUNTER_SYNAPSE_ACTION_NONE,
 	[STM32_SYNAPSE_ACTION_BOTH_EDGES] = COUNTER_SYNAPSE_ACTION_BOTH_EDGES
 };
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
