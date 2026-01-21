Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJcxEiCZcGlyYgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 10:15:12 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CED8542D5
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 10:15:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B589C36B3C;
	Wed, 21 Jan 2026 09:15:11 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95D4BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 09:15:10 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-50150bc7731so94956181cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 01:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768986909; x=1769591709;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fbq78sea0hmX5//P4GjhYjkpSX+LqZ+KYNl1xezZDJM=;
 b=FobmAbi2EUyrBsYCxwbivw6czBZKZrTbVFU2SbOcgL08Ic8DO1+PUkU9KEBXYHsUy3
 l7LNA4v86h3PaBZyqYSwo2SX5OnSSYKQgHIkvsFZc027XuzJUBUhg2PrtuWiCfBuzZ01
 K6VBxNs+YUCC9lG64Uyn3eaiuBVa4+a4TtZvnIolpgeJbfFv1Ik1sWGT65X3PQFHCUsN
 HW+nwTJoTqX2M9itgpXPtvvZAcwerqukwyYYZKfNtZ40ynR5L/p/KPLtAsuGcPI+HzbA
 Yjdi3DG3fQCeZDhG+WES9mOYgRMMAK3UnOG++c04fF6JGLc7LNb5NyGeX+nza3xG5cNr
 bl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768986909; x=1769591709;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fbq78sea0hmX5//P4GjhYjkpSX+LqZ+KYNl1xezZDJM=;
 b=s6VhdYCbfbZ6xzbBdc31UEkN4BIMGm7FyBLMcK5iOK9Y/iwUWlUHxYavfMthuWpI0/
 bsQTNDsMr/gi4FAcdWDx1thBXtR28HmbS28fd5qjHiMITIT33N8iNgEcn0TyeuGwScs2
 3GV4ha15JDjCfzzdv31T/VFN1KqzmUh9ljTMciuTmtbWl/nl9IagJK1ulntizNNJiEPK
 mQoYfjV9hrGIPycfMCL7yl0QlZpslytLNq0nWMfyPZeHamu9/+jWfT9R7JIcmOxdE/nQ
 V6cICfQnxHyrVKr1Bd8y1E1k14XFMmQWJ77hiRH2VnlbgOGt3+RYE3csU3RrCMpfTbD6
 Q1TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDVYzCMhOT+k/eOTCHQ6AX7q7wVfhd8qR4trzgrIT72YeGgOvMaGJ3ULBw4geCSmHjZ6OlR2ypmnVq7w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyJqmS+OcDorlTHbc7hTucKhVD3n4fzt+uEDLfvixevJ+a8/nl7
 uUG6opYIYFosGq58/3g5UzNiBA7WwEiC4B1lYsgFVUJ13AwombLA1SM6
X-Gm-Gg: AZuq6aLVfDsfGiFVAS4BJiPQm8d+uG5gCNgeGl+d0ImGVuuwbheO1mUPE9Gpu9bYt7y
 p54vERdGjy9v7Bxhh4HCwxNlbVPzjkZUCvTmy2OY5t8N+6pq98lqYvuBZO8EUTG8C7lYs+22RWl
 q3LVandCHOOEy90dm6oe7pAD961LZc9oDby4VQhh5cwuofI7V6mRGhn1OIUsd+5Vkkuyak8DCow
 uUhdhB+MmSFcZv8HAbX9x3lcATEaf9MxryxA/GwM1GwAL2gGp0gchUFAjws7AmoHY5uXRNbYBj2
 yOkFAiExqxE4JWGeW6bTicAdI2kNjOmhEutA7+ch3WFgqZwpx+DzXdUETEKEjR8Km0i1tPrMRyU
 G5Czqbup/lvoFch0EWmADbkdtb3LJUJcI0n98qo+NarbJYBP60OhqRUjczxKXTaQWufH55Rjxwv
 7NfeNQni/sow==
X-Received: by 2002:a05:7022:6b86:b0:11b:923d:773f with SMTP id
 a92af1059eb24-1244b3081a4mr12334928c88.5.1768979609488; 
 Tue, 20 Jan 2026 23:13:29 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1244ad7201fsm24056346c88.7.2026.01.20.23.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 23:13:29 -0800 (PST)
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
Date: Wed, 21 Jan 2026 15:13:08 +0800
Message-ID: <20260121071315.940130-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/3] riscv: spacemit: Add ethernet
	support for K3
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 9CED8542D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add initial support for ethernet controller of the Spacemit K3 SoC.
This ethernet controller is almost a standard Synopsys DesignWare
MAC (version 5.40a). This controller require a syscon device to
configure some basic features, like interface type and internal delay.

Change from v1:
- https://lore.kernel.org/netdev/20260120043609.910302-1-inochiama@gmail.com
patch 1:
1. remove phy clock
patch 3:
1. improve comment and include something special about Spacmit K3 dwmac
2. reorder the included file
3. fix wrong delay macro used in spacemit_dwmac_set_delay.
4. add check for maximum supported delay.
5. use DIV_ROUND_CLOSEST to calculate best delay configuration.
6. use assign for the ctrl register initial value.
7. fix input when calling of_property_read_u32().

Inochi Amaoto (3):
  dt-bindings: net: Add support for Spacemit K3 dwmac
  net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
  net: stmmac: Add glue layer for Spacemit K3 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 221 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 341 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
