Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 781F233269A
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Mar 2021 14:21:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44983C57B78;
	Tue,  9 Mar 2021 13:21:38 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0F3AC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Mar 2021 13:21:35 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id l7so9492413pfd.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Mar 2021 05:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lKQBbBWNoQCAzrzOLXLXaWKO88BEqFAf4JzZ/BOkGvk=;
 b=h9WuVuuqiNzrtydGX1I+OAyd5xdQWeCeb19No6Q9k349Tqh4H6uH3x5Cxx3KM7/kCf
 b6FtVO35EmYC/8BDUs3JwcHbVvGVzJ5KeIMV4iW8anmQIiVcIgsDAXYEiRMAbkBU1866
 C9sC1208pC96x5X5JBEurygLyzBSDY0tjlcGo3HYD8jTF1DDdenq+AQW/IlU2l5zyAVn
 2qe7tPOajW1VwQj9H9O6u90GfeGun8cbzNKaTNFRTwaKBUNNp4dcoN6AQF2KC5ANnr+2
 ajp6E3j6wuMCtmkCV7Bq4WFPmXpPJlLpf6quj0pFmlewc0Lx6wfdaVY9kFrBGGH51R+5
 KBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lKQBbBWNoQCAzrzOLXLXaWKO88BEqFAf4JzZ/BOkGvk=;
 b=f2FOECJluujPWDtHphW4Wridr4cMTfsMzR3yDVV/ULtqxLwL/gJA34TLd9lldEbkKb
 06cfNsnh6LLzdiB/ROgixUBa818+4VaJ1emsjLXq5Bigu59eh+AMwhpa5U/58I/8LM7T
 O4HW1LetNENhL6l7N20wT8e/X5TO50PgonDF3oYcrV+fxiwNSLUGnPyawNPDA6Wjmol8
 tIslNGm6ozRtdMHZs2ymnoIYd5OeV6lDj5ZdQx94EZBGlmGcWMbn7omBq96K0qOSzPvU
 E3TQqPAaRIuDOxkEMlgOXI99mDeTLKfVo0gNboHw9PLUXqK7TGmcdm7pe3ixnVLeOBe/
 6f6g==
X-Gm-Message-State: AOAM531Pa2t6UBhZ59I+yoT2Uj9GJAOBC5WRpmxZZ+UH40Pywv6CzrTJ
 2kepeUg5n+U1r5+UZgNNiFk=
X-Google-Smtp-Source: ABdhPJwhZtTdMde26dsAarCbRJh8s9mIuxXONPgp8SHKC13ALeUMBJEC0fjJIDp7ScHjRLkR5ibpnA==
X-Received: by 2002:aa7:9298:0:b029:1ed:fd64:e6b7 with SMTP id
 j24-20020aa792980000b02901edfd64e6b7mr25686117pfa.5.1615296094436; 
 Tue, 09 Mar 2021 05:21:34 -0800 (PST)
Received: from localhost.localdomain ([156.146.35.76])
 by smtp.gmail.com with ESMTPSA id y9sm7647421pfl.201.2021.03.09.05.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:21:34 -0800 (PST)
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: jic23@kernel.org
Date: Tue,  9 Mar 2021 22:19:29 +0900
Message-Id: <01cafeb117b6c12288db7d36ff295ff903397e34.1615293276.git.vilhelm.gray@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <cover.1615293276.git.vilhelm.gray@gmail.com>
References: <cover.1615293276.git.vilhelm.gray@gmail.com>
MIME-Version: 1.0
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, david@lechnology.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de, kernel@pengutronix.de,
 William Breathitt Gray <vilhelm.gray@gmail.com>, fabrice.gasnier@st.com,
 syednwaris@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Subject: [Linux-stm32] [PATCH v9 16/33] counter: stm32-lptimer-cnt: Add
	const qualifier for actions_list array
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
stm32_lptim_cnt_synapse_actions to match actions_list.

Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
---
 drivers/counter/stm32-lptimer-cnt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
index 0f7d3f1ec1b6..c19d998df5ba 100644
--- a/drivers/counter/stm32-lptimer-cnt.c
+++ b/drivers/counter/stm32-lptimer-cnt.c
@@ -146,7 +146,7 @@ enum stm32_lptim_synapse_action {
 	STM32_LPTIM_SYNAPSE_ACTION_NONE,
 };
 
-static enum counter_synapse_action stm32_lptim_cnt_synapse_actions[] = {
+static const enum counter_synapse_action stm32_lptim_cnt_synapse_actions[] = {
 	/* Index must match with stm32_lptim_cnt_polarity[] (priv->polarity) */
 	[STM32_LPTIM_SYNAPSE_ACTION_RISING_EDGE] = COUNTER_SYNAPSE_ACTION_RISING_EDGE,
 	[STM32_LPTIM_SYNAPSE_ACTION_FALLING_EDGE] = COUNTER_SYNAPSE_ACTION_FALLING_EDGE,
-- 
2.30.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
