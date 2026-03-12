Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHKbMZAVsmkCIgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 02:23:28 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1EC26BE72
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 02:23:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D59FC8F28A;
	Thu, 12 Mar 2026 01:23:28 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DD90C8F26C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 01:23:27 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-50917e02472so5785581cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Mar 2026 18:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773278606; x=1773883406;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=67f6aplaQjeW67VXDX4TdCndW5aSx2/hPT60hva8Vws=;
 b=L0LP3LesQs34EG1/jybuCGgItA/dOTU4m1x7shUSeJvTDeDj5rwzZCHm5qmsQF8bgW
 K9pxIF5JbsWFqNw93MLv3jUfYC/5fPiwCyAlnix8hceQXyGBVRhir26hgACuFD8HlzoR
 DGEnWx0Xwo0Hby57JsvfRc5qPwCpJjx/xH4S7Hr/nw0bPGp3RVbHEoqY9pLttBld5ZGn
 iiniQvw3P87UW7Br6YDV3y/ubxnWcWfzHv/U2n095tlztrcnKGmL1DOg2oIkf4QFhOqI
 ua8IMXsnFCfrebEsRP3rkEnVeVeirLR/P+gqeaAA9Y51mo9iRomONTbtahUrCJ3mvdur
 20jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773278606; x=1773883406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=67f6aplaQjeW67VXDX4TdCndW5aSx2/hPT60hva8Vws=;
 b=dwf2l3Ai9ONHoytSAbOhwjGxIbyyzv1GrGY/uZnF26FZXm1tw6+EJ3wVYkByDHTo8i
 AYjxn9VuoZv3+wiwpoQJ0935oAFckejAgSA6SV5r7BdG5fS9KxStnrsYgKNj/bOqn4oi
 vUkw5bmpMXUGC93+4HktJYV3oIhvNqGxTOjZhvOcZ/fKwxS1Rf+4JBmQRD7lC2MMSDZU
 UA/AF3+ASv0YgXDqFQXY4VMzU0OKi33J4jQAraFhaCa29TsCJtNx5xp14QuyrbUodlkZ
 KBzN8O/4JDmQflPb/+5Z+fVL5Uy5VQbYRkiNyhdykwxUISno4fQnmwAqHgPmqaC/tQaT
 RU3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/AZ+rMwzCnF/HIj0XOZMopbZ6cYBcWVzo+T57t8t8+0pl+EK/14ssvVjzc9qCM5Gyw+xhf/Wce6Nj0w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyCBWOTwAMPD0mEBAU/ReTmMFjeCSoB1OBTtRA5wwur3zX/FG4O
 dtniSSFnuTNcnViuRxAAHaNuh9qLoBlfiC126ukbR2wHmxkXin+uQUBm
X-Gm-Gg: ATEYQzwUMv4mKDF16XPnLaf1GONRj/G5Ue/i6aM1KunPOzCX3ODzx4umKT73j2XJxMr
 7abXIj6B7ZzZRCLeB/YkpBEJ4UwZR05pmVcBeqIbRonTIbnL/v4XVtIdREiB7TeodXnlZc3F8pO
 oxASmGtHBiCkye8X3rPhn892Qey80oKOqFc8wFbUk1Ho+3PsRMTjwO/eOkmqz6JfptWlDDckrZf
 LzbYUHFCaGu3mtQEz8oZBfThaTUZJqln41KrIUqxDe1qnZQXWcZRgQFp+KCKpc4h/rMvWOuqclb
 +r9gvUlKBeudBE6VfQu8AberGQVPHpimFq9PJJm4GWCZJhSW5YocUYLcp1pzdsYQ4YGgumNqDxx
 IAwU2mGdtZSnwuDdskxsWM3LOyFq+ZCPGz3kX10S0cPe+UC7+hjPSQ0xhlhrK8mwGMVzGepmCq2
 8tOAIyWeuy1Pz9A0LspnsLmKA=
X-Received: by 2002:ac8:5914:0:b0:509:16a1:2033 with SMTP id
 d75a77b69052e-50939fc6e51mr61632471cf.26.1773278606210; 
 Wed, 11 Mar 2026 18:23:26 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5093a0ea244sm23041871cf.16.2026.03.11.18.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 18:23:25 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Yixun Lan <dlan@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Yao Zi <me@ziyao.cc>,
 Yanteng Si <siyanteng@cqsoftware.com.cn>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Chen-Yu Tsai <wens@kernel.org>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Thu, 12 Mar 2026 09:22:24 +0800
Message-ID: <20260312012232.373713-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312012232.373713-1-inochiama@gmail.com>
References: <20260312012232.373713-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v9 2/4] net: stmmac: platform: Add
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
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:inochiama@gmail.com,m:dlan@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:richardcochran@gmail.com,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:rmk+kernel@armlinux.org.uk,m:me@ziyao.cc,m:siyanteng@cqsoftware.com.cn,m:vladimir.oltean@nxp.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:maxime.chevallier@bootlin.com,m:wens@kernel.org,m:weishangjuan@eswincomputing.com,m:boon.khai.ng@altera.com,m:quentin.schulz@cherry.de,m:peppe.cavallaro@st.com,m:joabreu@synopsys.com,m:devicetree@vger.kernel.org,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:looong.bin@gmail.com,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andre
 w@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:looongbin@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gentoo.org,gmail.com,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,armlinux.org.uk,ziyao.cc,cqsoftware.com.cn,nxp.com,bp.renesas.com,bootlin.com,eswincomputing.com,altera.com,cherry.de,st.com,synopsys.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.651];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6E1EC26BE72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible string for 5.40a version that can avoid to define some
platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
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
