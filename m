Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG6dDEY0pmlJMQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 02:07:18 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 136FF1E77C7
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 02:07:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0063C3F945;
	Tue,  3 Mar 2026 01:07:17 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE378C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Mar 2026 01:07:15 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-82748095892so2299002b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Mar 2026 17:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772500034; x=1773104834;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
 b=L1zufXn/p8elrmt4L/s4s1X96ya7X92i3xKdaoRb8+aIbegpeMBowdF9Q1qLHHlvGQ
 BP5YTg5edqxGMsnXNqrekJZbFpzJ/DDreHoGHHSb8hy4v3ZdnnEtu+zhTYQ7nVSJ13yZ
 idYz94XWkcvIIs34HHB3PLrcL1Qjf8eV5L609GerQLyUSSHjkk3kyo0yARfBGE9o0qVh
 xb2p+yRGHxq/Bi8Xxd7gLiKtVVJKOAa3bNN1T6le32QtnaG/Za4SPrxGhRPzBoMKyaWh
 yC8yHDo2WC3toeDi2sH4w3odmayIxlHJ5sXo7K82tguZtvsBTITz+YI2Tr0W0QfXa4/M
 4YvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772500034; x=1773104834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=62PbYYmVOOK5poz3ReEQOuGuTu2sU2hARoRYcSfvRXU=;
 b=tchevj4I0iJzB+5UVXPV2YTeqZbjvrDARCRyeuBX0a+1XFPu0xHwTcNC6UHRdN9Fzg
 4DN1KlyCTfRC8T0BWqjQPmJye/8cxG3Fi2KAAUqvnNJ6uJ7lEjxrlniI4paFzr/J7iE1
 zQl429xhEC8xIcx9wMZogONGDqBv0OtGUNW6Qng3836c3Aig+cU/q0z80mdMwqHOJOBZ
 sEGeuZ8ok397CzCp11V2iJYi/8l2EkW2AtueDRS1jgDP+gJBqcU6oFsZOO3z/uZksaNN
 imUfOBILojTs2C8nerfhpi6to8TvQMCG6l8cADe7YKQhMvjKbrP6qMnUbceb9wR3x2f1
 q5hA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSgjF3RfPF9btnBQZYUn+sWXGDuyIuAIgBiWRweWrtyIqOqmm9tAaSzxs0nVNc2SeTk1FODXGO6TYy+g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxcuhoCN/vhtQ7BVwCG6/WXs5EoNJQ4+eIjkDwsbrfklFEqIkCT
 UYUye4iIBKLvgN30FvztF8A/gZKghWY/oEfg52VsBCai6CJRclTLMH/S
X-Gm-Gg: ATEYQzzi0ms4adx8fJXZ5KlAkizWkPnRid19/AFT3IYCYM6PsB0PKSCg5+QTII3NLwj
 vkOqpDxSXn2eswBD0eYiTkCLPpf7F7noFAbASGW8TSqg2WFqHn8Ur/BOoFixg52oPF7tPQMyi47
 KNE8BfGq+8spjp9/g2/Q/+X7MWqAgWvfrP+3I+8Te2kUefkp9JYwCDEW7Gba18+146WiMRc4gfn
 WrZLbGcyvkspaJ5/Wq+CHoGs72i0kSXPKrT8GFc0JhTuOSHh+jyjNuR3g0KK6ZQpy1Innm0I0v/
 kLqyiBzxKK/Kg9BRdCgDRgtph/wgQw1IExwNUj0AQtLamvSbgrKURYiIlQCJeiNkH6GYNe2VKby
 aeUdaFPsWE7h1w0M6NZ9KaUM7FmKyOupLkchrGbSOO+MslheoO+OPPnGJsxczAGdfH2KJcRdwqN
 USHJl6oG+dpm3aj+8Oa40/1g==
X-Received: by 2002:a05:6a21:170b:b0:35f:b243:46cb with SMTP id
 adf61e73a8af0-395c3a1a5f3mr14011142637.12.1772500034381; 
 Mon, 02 Mar 2026 17:07:14 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c70fa5ef857sm12435059a12.7.2026.03.02.17.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 17:07:14 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Yao Zi <me@ziyao.cc>,
 Yanteng Si <siyanteng@cqsoftware.com.cn>,
 Inochi Amaoto <inochiama@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Tue,  3 Mar 2026 09:06:28 +0800
Message-ID: <20260303010630.567674-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303010630.567674-1-inochiama@gmail.com>
References: <20260303010630.567674-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 2/3] net: stmmac: platform: Add
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
X-Rspamd-Queue-Id: 136FF1E77C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlan@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:richardcochran@gmail.com,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:rmk+kernel@armlinux.org.uk,m:me@ziyao.cc,m:siyanteng@cqsoftware.com.cn,m:inochiama@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:weishangjuan@eswincomputing.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:boon.khai.ng@altera.com,m:maxime.chevallier@bootlin.com,m:quentin.schulz@cherry.de,m:peppe.cavallaro@st.com,m:joabreu@synopsys.com,m:devicetree@vger.kernel.org,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:looong.bin@gmail.com,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andr
 ew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:jernejskrabec@gmail.com,m:looongbin@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,armlinux.org.uk,ziyao.cc,cqsoftware.com.cn,bp.renesas.com,eswincomputing.com,altera.com,bootlin.com,cherry.de,st.com,synopsys.com];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gentoo.org,gmail.com,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.985];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]
X-Rspamd-Action: no action

Add compatible string for 5.40a version that can avoid to define some
platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 5c9fd91a1db9..02303a808fb5 100644
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
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
