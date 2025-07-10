Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFE7B0079F
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jul 2025 17:51:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 426C6C349C2;
	Thu, 10 Jul 2025 15:51:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC121C349C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 15:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752162715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=roCXYQCCBXv294ZGhANYyUloWkKTg8ORl03eA1Oof+s=;
 b=celLluoZkFwbxr2D/qEZ+uo4KedZFjqRjf2EAXMW3u51lT4mUpHP5jZrksh30oM1G0XVPw
 CpVUeFGvH8XJSTFf+3oCyaj6lAAzQCwMa2vKE75/AnPx6l6Obxsf4uHepqmPRzBxDQxeNQ
 AbxJIcK7gazUPBFa2b8C7g64+UBFST4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-wyXfGt9ONJeBnJLL2Fzc0A-1; Thu, 10 Jul 2025 11:51:53 -0400
X-MC-Unique: wyXfGt9ONJeBnJLL2Fzc0A-1
X-Mimecast-MFC-AGG-ID: wyXfGt9ONJeBnJLL2Fzc0A_1752162713
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-702b5e87d98so23402256d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 08:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752162713; x=1752767513;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=roCXYQCCBXv294ZGhANYyUloWkKTg8ORl03eA1Oof+s=;
 b=CNpAysnzJB58714j/rq26ReLrPjCbbiUUB+YzVhsyMmbqEDwTD2fqXrg/9T4EXFW7z
 HvSQOJs1SvItQ0jsYg7TVW28nQY3ML4joOAu3we6T/x4sz0usdqcb6tLd6fUBniKS1Gu
 TQqO4W+/hOtWuAtwoaq6xDqGC1DussfZp6vUG7HoZgG1Q9MCoEJxloML5kjXpcg/U+tF
 4xQpHGqWq7KDx8LsMTJ+jVdPWv2xFHUG/AuO8ZGWpeSWXVDZBniWgSdmbXJYD0aALOXx
 R4Y59Cpvpg2g0h67bL5Zk23JsBwzfJ35uFhf8ywqKMW1I4PdN7YidYax5CBwKYVtVj7l
 3Jmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNCc5IOnZk+7LnTrFNTU5uQVPU3eMfwjtQRKnlCD8DoHcIxbT4zeuikyub9+0hENQvHSkp3HopuroJvw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxoAfuwBuTgbMwGFHRO6fJzqmJo99fdxSSH/edQVeX0JtDlglaj
 RZ8pYAz5DXKWDBjaK1c4cHaMTJKE1l5E2PBpzMWLWDMO1WIjuyBD+5nlgv/HsuWpCeJ6BBOG+JX
 X1pwQZYlyGMeq4QODG+6r4giq5ujyVQJUUO6PAWjcnLoZVXOVmvcnFSp88W5u9BWSgYjB5RYZIW
 Wr8A1dQg==
X-Gm-Gg: ASbGncuAFQ+t+3e93RI6R15SQdgelmXXTsRzqtIPBfs6iChgoACjkvp0cf0lU21wWIl
 zIDGqL0kMWbuw7IPejVA0rSOMgFnRVPoGlWVNeszcWCEaQIW2Ab6SyOhrkYgVdhOf0ItqSxtLBy
 +AbOcO1NlzEdEqxUfADnXVu3F9Cf2973ExEUOlBbai5Hkxw28kpRcdIYqH0JKSaAymixK+ADNmg
 PRTlZKDdv+8gCxcZdYlxvDH9Ten46HAddfQNLSGOZU1r1sfIeCS4IJI/zSctaA5Z8D01I/hnnB8
 hGFk3o7Pw0VpOI1xTcgCb0KNpBy9K0I2BAlnCrS0Vfy3SmUv5bA2ug8XUOpO
X-Received: by 2002:a05:6214:2503:b0:702:d1de:7650 with SMTP id
 6a1803df08f44-7048b904350mr109101876d6.33.1752162713193; 
 Thu, 10 Jul 2025 08:51:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETv8kKkAF9gRKcsuP04l5OSaop0yTF67wtB5mlM/oS84I84ISgz+5x5RQyUV0R0LiOWXu3+Q==
X-Received: by 2002:a05:6214:2503:b0:702:d1de:7650 with SMTP id
 6a1803df08f44-7048b904350mr109101146d6.33.1752162712560; 
 Thu, 10 Jul 2025 08:51:52 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-70497d3940asm9475456d6.73.2025.07.10.08.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 08:51:51 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 11:51:10 -0400
MIME-Version: 1.0
Message-Id: <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
In-Reply-To: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752162699; l=1297;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=8GFCMbcp0w3lTxuo3uqIq1Kf0gj7x0opWqdcsmabL0w=;
 b=C1NOkFYk4ZvkSlhR/nJT1ZMxm1WrhT5fr4V1f6MUwtgu1IwsGHRhGihPJyKm/qfChcPciMqRX
 jMkYCRRA7J1Bi4cmmruZSnKv3HXP26MoB05WHwsHZzBAvqaIhMzvhGA
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 68Kh9PjvvvjGOm8gCD6WEfZ0YEkYhqcYbRh4E-zL-R8_1752162713
X-Mimecast-Originator: redhat.com
Cc: linux-arm-msm@vger.kernel.org, Brian Masney <bmasney@redhat.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/6] sound: soc: qcom: qdsp6:
 q6dsp-lpass-clocks: convert from round_rate() to determine_rate()
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
index e758411603be5157e468e8c076620d7c18661bf3..03838582aeade389d9a2d90cf9f03fad835f0733 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
@@ -69,17 +69,17 @@ static unsigned long clk_q6dsp_recalc_rate(struct clk_hw *hw,
 	return clk->rate;
 }
 
-static long clk_q6dsp_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *parent_rate)
+static int clk_q6dsp_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
-	return rate;
+	return 0;
 }
 
 static const struct clk_ops clk_q6dsp_ops = {
 	.prepare	= clk_q6dsp_prepare,
 	.unprepare	= clk_q6dsp_unprepare,
 	.set_rate	= clk_q6dsp_set_rate,
-	.round_rate	= clk_q6dsp_round_rate,
+	.determine_rate = clk_q6dsp_determine_rate,
 	.recalc_rate	= clk_q6dsp_recalc_rate,
 };
 

-- 
2.50.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
