Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFO4AKV8cGktYAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 08:13:41 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCA052A86
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 08:13:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FD80C36B3C;
	Wed, 21 Jan 2026 07:13:40 +0000 (UTC)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64AA4C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 07:13:38 +0000 (UTC)
Received: by mail-dl1-f42.google.com with SMTP id
 a92af1059eb24-12448c4d404so5215620c88.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 23:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768979617; x=1769584417;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
 b=SZC2nolh7f4xn3whir0CH1Tep0zVEMuA9vyOv29DLfn/bUBsDlNPTPK+k7HRwxPryV
 MSsFM5c1pHUlfAyyiHBLStvSSMur9/d/k6yMYV3UozRGxm0GmREtWLnSx6ql7QD7zTwn
 cR8oY8JKq8NttvwUuB4X0JgwFJj5d6vsodlKEc1OcXaGCYLRmx15amJRBax64bqBBMvG
 CS1Aqu791xh5cnyiso1ZoJU4cn7os2ZDJJGxNztEgAK8ylBb23Fmy5DYhCUKg70WZK/S
 Mm2pegsUG0rXYR9COAvYImDohmcv0aLbj9xpDC9CX9xkg7l8UlOGG51rujDAa9G90Ay6
 vikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768979617; x=1769584417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
 b=r/qlWFF75WvVSrPS+FJRIY0/S0zZPsJICR2gK2TcEhCo+u4n8lifRKO6khwbxgEn/T
 TBERA3SOT/xw9GjbBd7UNOZbL17hJQlwr9BwfG8Y6iY9VI9sIyhrEi18s4J7VAzXG0xc
 XW/HPz+lrI62aWvKvb7rEu5IqLCRb193pzorWQq5Q/8GQNeLy4dlAoCGOk9yf6mTr/GQ
 rQ7FIMdyUf6kYFXLAOYsFCS+aWux2I43d5ZcaNBB0hVciBBIHXiLHvfcF7/K20g+TMvb
 GFwUIUM325weYU2AUNKOxGksOCbYofa1CnntQOvUQBLW5No2kvhqbLmFQk4eejbaA9eZ
 2x1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdhKnj936I/zSS/oRmBVTWdY4OPbDG6akTQpmkm0Q46hwQg+G+MUE8ezbDHxmm7HT8ubCKBnMFFbgdkA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzBGKaunbnFNcIz3s58qKK2trtZPgFiNwp5kySrV+23II+6q6Id
 GLS/EITYWb4szXoGiInHBIanws8/kBHKJNjqu4a8Ps2itzvJPFdjM+/6
X-Gm-Gg: AZuq6aK8+6NFSDR8WIPOCLd73GaRBpnLYTSQriHOfm1JyxVVMlt2PEDAmt4gwf0lUhh
 tPZ0c73OjHvKHfhkLlhg1Etm8RZCCjucYOEgYopDMuno8hWoXjq23Ka3I8vk9uuhyf0OV20FLfi
 CtG8cbHuAxfBS/qwCmH+JOYNCqx6Qu8uCUI+YHc45QALYAU82KhIt540KxohLE/vJq/ta4Cvnre
 5dRzN/YMXYICdqxOFMvArnehnElkLpUWWox5CRTbLqKRIkHAttr0ABbaUMpmPe5+QC4dEffPCFK
 Q8ifuFzeOs9NIcMTOg08SJa/F2czjgwJm6zvEPVDe3QhXvdO6TZ6L/o+gGLaDtqRH3c4SERuiqp
 LmaI1JX78V5uKXG7zz9KjeClApPkDRQPjmm8eTg7tkbxl1z9PUdyQGeO6N5RurPYWe+NnoC+iJQ
 a6T77/V0qC5Q==
X-Received: by 2002:a05:7022:914:b0:11b:a514:b64f with SMTP id
 a92af1059eb24-1246a966afdmr2812178c88.13.1768979616484; 
 Tue, 20 Jan 2026 23:13:36 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b6b367cbc9sm22387219eec.32.2026.01.20.23.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 23:13:36 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Yao Zi <ziyao@disroot.org>, Yanteng Si <siyanteng@cqsoftware.com.cn>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Chen-Yu Tsai <wens@kernel.org>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Wed, 21 Jan 2026 15:13:10 +0800
Message-ID: <20260121071315.940130-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121071315.940130-1-inochiama@gmail.com>
References: <20260121071315.940130-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 2/3] net: stmmac: platform: Add
	snps, dwmac-5.40a IP compatible string
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlan@gentoo.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:richardcochran@gmail.com,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:rmk+kernel@armlinux.org.uk,m:ziyao@disroot.org,m:siyanteng@cqsoftware.com.cn,m:vladimir.oltean@nxp.com,m:inochiama@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:wens@kernel.org,m:yong.liang.choong@linux.intel.com,m:weishangjuan@eswincomputing.com,m:jernej.skrabec@gmail.com,m:boon.khai.ng@altera.com,m:maxime.chevallier@bootlin.com,m:quentin.schulz@cherry.de,m:peppe.cavallaro@st.com,m:joabreu@synopsys.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:looong.bin@gmail.com,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply
 .com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:jernejskrabec@gmail.com,m:looongbin@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gentoo.org,gmail.com,foss.st.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,armlinux.org.uk,disroot.org,cqsoftware.com.cn,nxp.com,bp.renesas.com,linux.intel.com,eswincomputing.com,altera.com,bootlin.com,cherry.de,st.com,synopsys.com];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 9FCA052A86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible string for 5.40a version that can avoid to define some
platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 8979a50b5507..54c7b1537ab9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -396,6 +396,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
 	"snps,dwmac-5.30a",
+	"snps,dwmac-5.40a",
 	NULL
 };
 
-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
