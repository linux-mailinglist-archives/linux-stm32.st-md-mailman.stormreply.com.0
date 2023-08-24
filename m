Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1227877F0
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Aug 2023 20:33:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43308C6B45E;
	Thu, 24 Aug 2023 18:33:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF94AC6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 18:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692901988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZLXDxLfpL9zLoWLRxApVYve11hS/OEKZe5Jy4SYblss=;
 b=Q5OdXfzphCkQ9Pv+eImf8vBbwjNLx2MMKoYpPJ+htrYOVXe5sfUsHjCSDnbMoLNIKjys4P
 WS8EoE8rA9gtlji9huSGARMRlNJcXVM99X6lhgOUZlfERmsW/YJG6nU3kwr1In6dj4uycy
 RQgvcJyy0CYWDH4/5qlJm7ygkypjav4=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-GHjzXQFHN6iwMifvMpVGcQ-1; Thu, 24 Aug 2023 14:33:06 -0400
X-MC-Unique: GHjzXQFHN6iwMifvMpVGcQ-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-1ccbcb5034aso101695fac.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 11:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692901985; x=1693506785;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZLXDxLfpL9zLoWLRxApVYve11hS/OEKZe5Jy4SYblss=;
 b=Dv7jTaF9We3cWsHErnEqo10vAX5T78a4lzJ/LNofekvmu6mHrD+aAK/l3/AlR1/+wm
 t2ymS7oMmB80RLLwKsRZNz0xqiAtsMDHLzd26coadFznHAVMftpnRxyqzgg5sxleqfJL
 +NaZWxzM70slJ33vaeDJm+8wDlMS18DeNawuf4Qh7ELQigHwDzmpOwTOPQWcycQ5z6TY
 DwRcdxA9dnh1USR2i/qde3GyvFPDz3+pnOvP6cxSF7ldD7rP7sL+BVZUAY3pI0Gzb87j
 6VHv+tgGga5KfEOHnmKy2HZaPrV5pPr+9qEy49+5PfVaI4ScRUteKY7YjJeseHydQRJO
 UriQ==
X-Gm-Message-State: AOJu0YwHyC+qD6jePPae4fwbwToNPj57lxG4CT9ACCCe+zeA+ImmgB/G
 edOY7mP/ZvqoEhHgBuaM7FnLWAIXfwMmowM37NUmHFDv/r1prgYUorr0jr3pJQdbQdpztj1Ri3V
 LwcZCrnurBRvRrzOsDXiiltb980hrQ42PvHraOXzq
X-Received: by 2002:a05:6871:299:b0:1b4:60b3:98bc with SMTP id
 i25-20020a056871029900b001b460b398bcmr646673oae.2.1692901985287; 
 Thu, 24 Aug 2023 11:33:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbJca0VCeTskNWvGHD1H3TewlM9C3a0yafFFNkx3PrLHoWuGVt7iXKwhjuSJvnGG6tkI3pdg==
X-Received: by 2002:a05:6871:299:b0:1b4:60b3:98bc with SMTP id
 i25-20020a056871029900b001b460b398bcmr646661oae.2.1692901985092; 
 Thu, 24 Aug 2023 11:33:05 -0700 (PDT)
Received: from [192.168.1.165] ([2600:1700:1ff0:d0e0::37])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a0ceb11000000b0064f77d37798sm4209qvp.5.2023.08.24.11.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 11:33:04 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
Date: Thu, 24 Aug 2023 13:32:57 -0500
MIME-Version: 1.0
Message-Id: <20230824-stmmac-subsecond-inc-cleanup-v1-6-e0b9f7c18b37@redhat.com>
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
Subject: [Linux-stm32] [PATCH net-next 6/7] net: stmmac: Fix comment about
 default addend calculation
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

The comment neglects that freq_div_ratio is the ratio between
the subsecond increment frequency and the clk_ptp_rate frequency.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index dfead0df6163..64185753865f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -853,10 +853,12 @@ int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags)
 	/* Store sub second increment for later use */
 	priv->sub_second_inc = sub_second_inc;
 
-	/* calculate default addend value:
-	 * formula is :
-	 * addend = (2^32)/freq_div_ratio;
-	 * where, freq_div_ratio = 1e9ns/sub_second_inc
+	/* Calculate default addend so the accumulator overflows (2^32) in
+	 * sub_second_inc (ns). The addend is added to the accumulator
+	 * every clk_ptp cycle.
+	 *
+	 * addend = (2^32) / freq_div_ratio
+	 * where, freq_div_ratio = (1e9ns / sub_second_inc) / clk_ptp_rate
 	 */
 	temp = div_u64(NSEC_PER_SEC, sub_second_inc);
 	temp = temp << 32;

-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
