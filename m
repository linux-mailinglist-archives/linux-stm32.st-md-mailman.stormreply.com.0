Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CO+NNKjVeWntzwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 10:23:52 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB3F9EC35
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 10:23:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12E12C01FBF;
	Wed, 28 Jan 2026 09:23:52 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com
 [74.125.82.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EAA0C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 09:23:50 +0000 (UTC)
Received: by mail-dy1-f172.google.com with SMTP id
 5a478bee46e88-2b70abe3417so14667013eec.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 01:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769592229; x=1770197029;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uKUvT1UkLVoSBo2GeUIFsYzGNbYkZ2w4SGalbBin6yo=;
 b=kAn5NGtdGsLSukPWrSKn96zAJMSYpnSpTNW9FpIUfU7JGIRKJo66Fjgp1RZH1dMzlQ
 FZK96F9FI6syrOAzALUoG+z++eI2wLH/CgwnF3X8T9QAoxtF5mEyXgzkHJ/rCE6UUozc
 bjpklcCWuQH+VZkIhdRuq0qyZPAONMJ0mygjam6yOjEAJWsfzTvDcyh01/nrJiZucw94
 UMQxZgY1uR1ZEmBH4mFge6JyZ6OVnXHVTUQTDIV0OxuVhD3h3Xiksi1cCPdcVDC0ftcQ
 u/cHJiM4kckrJf2zH0Suz9OOU/ZSK5iJO3we4WizfuKg0jxtBKtwAxolRAiGQ47XKgtk
 JRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769592229; x=1770197029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uKUvT1UkLVoSBo2GeUIFsYzGNbYkZ2w4SGalbBin6yo=;
 b=cSdf2sgCxLxZ3QJ/mKl5Rdxx499rQG1GyHfuSxZRKhVEOzej8mcoU8BaML/yCjx/2x
 GLSaHBFylIQQp49rDvj+MNTHQBnpZn0l4Y+WIApygI8tppTvgjXss7Lg0chgccQ015d8
 cBHvsiXq2lZ1MxiT52wLAOXZ11D9PRzAVYe8t3S76Zc1NznkI7K5WmBgarH3BWqPwoLC
 Ip9ZXtKhBE5jgwr0JG5rOqYkZMdzBihbirhBb++KibWU78lkhzhhR+WCJ+yaRK1HtKhQ
 oJ8yCRM3+yNUgUR0f2ELIYoCvl5JEW4HjFC1VUGZeyJPqkkWD+liRzJQwH0CweFPDqq/
 R4uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwn5VHMB2ju1wntm9sNDRpuM/kbrF9p9r72pSwpcgkrimJZ+26qMQpULyiBKtgzGtKGbrMSUHPEjqVlw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzfvJMU+kSw/Re7FBtPzqvbM74RsV7ZMj8jb34FhddkkMJ6z5ub
 cf7Yi1gwVcv1dwy1ua2QKDT4lYImAcEnfVfH05Rox5fzF/plcrgZYpZmI2luuXWX
X-Gm-Gg: AZuq6aKgQxCGpPJKg10Ao4hkHu9y4NCSqKRkBqvSnvgE/2XpjndNrV+6dx7IYdIa6z8
 QlvRecGp118sUMphgznYdDhAfV386tkcC6DCmMrzDEK0kWO7yLrcTnqS/Gc1B5j+335YwivNHpU
 PXirXNso/vaVI2or62kuioJTCRHBM3KgUWOqzEwI5eq+SRu6OQrvK6INvQOSWcyHTsOggIluxj+
 fvv4E9OrjOXvjYzsCYFOPtY3LNEelyUMYu/bZt+21/MZixo6oc5qdTHVL/56ekHNS8ciYK9xxYj
 06cgWkSm7a2z0F4sLsLEOhlPdakuU9FE+1RZg+g7BPkdRW/ID/LhKO7FkMSMIzEHHAOSm+N6nDd
 sCdcZvXTWfBpitddQ7zQOGlwpkyY0aEnsPaGatbwMPFfFwMkytqSn/tUour3iHa3PIQelTCk6yL
 41i8dA5xxQwQ==
X-Received: by 2002:a05:7300:6d08:b0:2b7:2664:aeae with SMTP id
 5a478bee46e88-2b78da0b4a8mr2419091eec.37.1769585393102; 
 Tue, 27 Jan 2026 23:29:53 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-124a9d6b658sm1374769c88.3.2026.01.27.23.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 23:29:52 -0800 (PST)
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
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Chen-Yu Tsai <wens@kernel.org>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Wed, 28 Jan 2026 15:29:26 +0800
Message-ID: <20260128072931.875041-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 0/3] riscv: spacemit: Add ethernet
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gentoo.org,gmail.com,foss.st.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,armlinux.org.uk,disroot.org,cqsoftware.com.cn,bp.renesas.com,bootlin.com,linux.intel.com,eswincomputing.com,altera.com,cherry.de,st.com,synopsys.com];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dlan@gentoo.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:richardcochran@gmail.com,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:rmk+kernel@armlinux.org.uk,m:ziyao@disroot.org,m:siyanteng@cqsoftware.com.cn,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:inochiama@gmail.com,m:maxime.chevallier@bootlin.com,m:yong.liang.choong@linux.intel.com,m:wens@kernel.org,m:weishangjuan@eswincomputing.com,m:boon.khai.ng@altera.com,m:quentin.schulz@cherry.de,m:peppe.cavallaro@st.com,m:joabreu@synopsys.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:looong.bin@gmail.com,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@
 lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:looongbin@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 6AB3F9EC35
X-Rspamd-Action: no action

Add initial support for ethernet controller of the Spacemit K3 SoC.
This ethernet controller is almost a standard Synopsys DesignWare
MAC (version 5.40a). This controller require a syscon device to
configure some basic features, like interface type and internal delay.

Change from v2:
- https://lore.kernel.org/netdev/20260121071315.940130-1-inochiama@gmail.com
patch 1:
1. remove not needed compatible for select
2. drop empty line in "spacemit,apmu" properties
3. add spacemit,apmu properties to required.
patch 3:
1. remove misused phy_fix_phy_mode_for_mac_delays.
2. use local tx clock instead of the clk_tx_i in the dwmac.

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

 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 +++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 218 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 337 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
