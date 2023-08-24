Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DC67877E7
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Aug 2023 20:33:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0946DC6B44E;
	Thu, 24 Aug 2023 18:33:07 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7926C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 18:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692901983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6l23XMepM0Sh/iOcowpX76UCT+vWOCxLFJ6fQYXhTVo=;
 b=X0y107lxiVSyYEmIPUufzreSZ7fAZXPY6VHZIVHtZyobUFY1zBYE41vOxI/IghliVsVQXO
 jjepjQmwzAhZp5kDJste6kkkTLQjMyhvh55CxNyQoulYBTVEcDIi4EsA+BznCaHUZxiFJ1
 LVOWyBxc1BGxKg2uzlUpDWJB/lxDqyo=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-47caenc-P9SnF3J_69Ef5w-1; Thu, 24 Aug 2023 14:33:02 -0400
X-MC-Unique: 47caenc-P9SnF3J_69Ef5w-1
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-5719cc535d3so172962eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 11:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692901981; x=1693506781;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6l23XMepM0Sh/iOcowpX76UCT+vWOCxLFJ6fQYXhTVo=;
 b=Q4fwtWe5zJQG3EsOCORg+8J95jk6pqV9kKMEn7d1rFx+PdvUXT3oUphDuN/RHl6IDI
 LjhZ5E7I3VF7GO2pWd1k4M7VMSNGVrtwBw4U1aQ/RSt9yzPxGlpMMBZ85X9it6z1AMOO
 YyqKPEU+NRehgm7JKxGAU+uGExTotieMhdk2QG1OuEg1oaA2JJW//J5qVAgcZlll13Wi
 Xri4dbqogiGbC7qL+KYfZWYypUQr8Z1+dtIWw/iAKgn1iUY3YbC+QcVddjBFD6fMtx4w
 gHJxGJHYKYsYdwmXMuHjLLXZm+iVEhAj6wyCWkrHcJAU7oCszf3EGxTUll8zNqOUAMu+
 0omg==
X-Gm-Message-State: AOJu0Yw3vLLXBxsbmog0eSJ9JqZmn9PoOAMWCgLWm5HC30GJiivdW7jY
 1+B24VcgZq+xlRIMWkPppqxbNTqh+ySlfegNNw0ePq9k495+vtf6tLNM7UwZOpPgw3eStVq9hx1
 NuLPxar9z7Ia2wfZ76jwsuhdAefMQLoZQdg2W9cw5
X-Received: by 2002:a05:6870:e253:b0:1be:f8d9:7bdd with SMTP id
 d19-20020a056870e25300b001bef8d97bddmr627374oac.6.1692901981456; 
 Thu, 24 Aug 2023 11:33:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHS3fEn/UFcZp7p1JhHHa0Wzb/ax2PIiQ32dL4ujO6wuTfaKPgzGkO+lp3kAWh66sAyZwY+xw==
X-Received: by 2002:a05:6870:e253:b0:1be:f8d9:7bdd with SMTP id
 d19-20020a056870e25300b001bef8d97bddmr627359oac.6.1692901981225; 
 Thu, 24 Aug 2023 11:33:01 -0700 (PDT)
Received: from [192.168.1.165] ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a0ceb11000000b0064f77d37798sm4209qvp.5.2023.08.24.11.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 11:33:00 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Thu, 24 Aug 2023 13:32:54 -0500
MIME-Version: 1.0
Message-Id: <20230824-stmmac-subsecond-inc-cleanup-v1-3-e0b9f7c18b37@redhat.com>
References: <20230824-stmmac-subsecond-inc-cleanup-v1-0-e0b9f7c18b37@redhat.com>
In-Reply-To: <20230824-stmmac-subsecond-inc-cleanup-v1-0-e0b9f7c18b37@redhat.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>
X-Mailer: b4 0.12.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: netdev@vger.kernel.org, Andrew Halaney <ahalaney@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 3/7] net: stmmac: Precede entire
 addend calculation with its comment
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

The addend calculation is currently split. The variable to be programmed
is first altered, then a comment explaining the full calculation is
seen, then the variable is altered further before the calculation is
finished.

Make the comment the first thing read. This makes the conversion of
sub_second_increment from nanoseconds to hertz much easier to
understand and reads logically.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ba38ca284e26..f0e585e6ef76 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -849,7 +849,6 @@ int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags)
 	stmmac_config_sub_second_increment(priv, priv->ptpaddr,
 					   priv->plat->clk_ptp_rate,
 					   xmac, &sub_second_inc);
-	temp = div_u64(NSEC_PER_SEC, sub_second_inc);
 
 	/* Store sub second increment for later use */
 	priv->sub_second_inc = sub_second_inc;
@@ -859,6 +858,7 @@ int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags)
 	 * addend = (2^32)/freq_div_ratio;
 	 * where, freq_div_ratio = 1e9ns/sub_second_inc
 	 */
+	temp = div_u64(NSEC_PER_SEC, sub_second_inc);
 	temp = (u64)(temp << 32);
 	priv->default_addend = div_u64(temp, priv->plat->clk_ptp_rate);
 	stmmac_config_addend(priv, priv->ptpaddr, priv->default_addend);

-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
