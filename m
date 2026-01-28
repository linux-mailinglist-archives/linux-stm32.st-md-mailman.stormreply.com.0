Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHHQOrQgemmv2wEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 15:44:04 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7227EA306D
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 15:44:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1137BC56612;
	Wed, 28 Jan 2026 14:44:04 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0725EC01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 12:58:55 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b8838339fc6so183161966b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 04:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769605135; x=1770209935;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=klJSobxqRNPxXq5lBBZpXaYGDx/qIxNfyIEWdrVXkm4=;
 b=i5kvSGLvRYDZzzGK4IBAAeSOUPW/GWCzw/5Kprip7j0OyyD9IMecPT187v/Ea0txvm
 Dxrl8ZzI1tkDLXNkULYWxuCHML8XAtBpeqeojdTQ2tJoD/ftWbZnE3jGVBRrxK2ZyO5l
 zeVp7TXVGvDo02OS6apc4s1y9ceBAG7tTvNafH2VjKGEXI3a7ex8NzNe8fCwWLWPwpYw
 6nz3LlQT57vUU9Ztz0D6D1aDQ3W3dl0NUHjSOtTnzlo1YTN75f6ihHZnB5m9upd3y71k
 zDBvmf0B8/Cxc+yzVoEFaXAGmyDzhPlPsQJqiJT2IGWduPztzS6rm7bHRFbklvWpxPvp
 wuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769605135; x=1770209935;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=klJSobxqRNPxXq5lBBZpXaYGDx/qIxNfyIEWdrVXkm4=;
 b=ZhBhExgYHVMWsikqQtlBtsIhXyEcRdvA9U8EF/NsiKVnCusByc6acLvFUpKL9Ufhn/
 9m4C+S9FPIr7I1Y+yIGwZysHZT+nuzRyPTwAx6C4AVQMPtjE0bGn3dE2HsTkAaL8vXQm
 WzDMgZuvNRHhNHBPjnkRtjlfhzZStC7Utf4Ei520AC50Zo++byjikzHwd6xihOMA1l7L
 ABMfmpUpQu27n/LQeC+U4wiq0fGRx2djtWviRBj84hfwkzfqaBJ/F0qpV91LtU4Z0UaX
 q4NJIUjXItX5HHY6fXFSfhC7cyIO1y7gPTPbsVWnOaLIxCiJ0CgP570nVBmEyKIRxD9h
 dJKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXwbZEdgCJkSmcJXIeFYHqhnbKgpUCGx2Qb6BL7kTZEvbMm4GmvJ/Upg4B22rwVx5AQ6PNr8hE7jrxHA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzqkC/puLAnu4AAvUH1I6cer+7Q0Xy3rprOO/nyJr7cPKKW061+
 CYGQ58TE67BU19YnjboQv+To8WTBHe3kOamYQhB8O23WTK9K1Y6ppxt8
X-Gm-Gg: AZuq6aJPSVfOjCSCl/DMd1BTtOKT8VrFpGzq1hAzBqBL7tF/CqLyh3BtKId3NyZRt4E
 92ho6ZkkC6D45lEukUooPI6sPOBPR8cBPAooGKVitk1gp/0ZDFOhpjZq5VpdeZuzE6lnM/LLJiw
 L/qaW0vXU/iBUc/mIung3pHd1auQ1YmFLBgsFeVV//900xsDQa2vF9APvwVdQu9B9PHKl9xa/Km
 ebWSGgMp+hRy92IHkr7sfmOllChTfgKXVnDIVmuxPwYTWW0XLG29flsWvhdB/yAvhgNLhc8pU4C
 whWIGlvc1i1QQ1jClpR3MEQOgD6jLFynK/5iNzp25TbgJRqsYlTscRCBrAAi17wOcxq5N01bj8t
 nEForHTmxEBfH+RMz36r5dAbTK/NAi4G51Qh1qkhAMUS1+3wPv8SS2jlIwrMzE5MBZ2lXH86yzV
 jlQjEUEIgUvRboBKtnGWX5i3rQ2vsqBawkJTkGFtBo3eLnBQ==
X-Received: by 2002:a17:907:7f8c:b0:b88:3d20:3f44 with SMTP id
 a640c23a62f3a-b8dacdc3040mr351146966b.26.1769605135007; 
 Wed, 28 Jan 2026 04:58:55 -0800 (PST)
Received: from localhost.localdomain
 ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbf2f3e26sm123344966b.67.2026.01.28.04.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 04:58:54 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 28 Jan 2026 12:58:37 +0000
Message-ID: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 28 Jan 2026 14:44:02 +0000
Cc: Biju Das <biju.das.au@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/8] Add support for Renesas RZ/G3L
	GBETH
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:geert+renesas@glider.be,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:magnus.damm@gmail.com,m:biju.das.au@gmail.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:joabreu@synopsys.com,m:biju.das.jz@bp.renesas.com,m:peppe.cavallaro@st.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:mcoquelinstm32@gmail.com,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be,foss.st.com,bp.renesas.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,synopsys.com,bp.renesas.com,st.com,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 7227EA306D
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The Renesas RZ/G3L GBETH IP uses Synopsys DesignWare MAC version 5.30
compared to other Renesas SoC such as RZ/V2H that use MAC version 5.20.

The RZ/G3L GBETH requires an extra clock compared to RZ/G3E and has pps
interrupts. Document the Renesas RZ/G3L GBETH IP in bindings and enable
the Gigabit Ethernet Interface (GBETH0) populated on the RZ/G3L SMARC
EVK. The eth1, pincontrol definitions and hotplug support will be added
later.

Biju Das (8):
  dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L SoC
  net: stmmac: dwmac-renesas-gbeth: Add support for RZ/G3L SoC
  clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
  clk: renesas: rzg2l: Add support for enabling PLLs
  clk: renesas: r8a08g046: Add support for PLL6 clk
  clk: renesas: r9a08g046: Add clock and reset signals for the GBETH IPs
  arm64: dts: renesas: r9a08g046: Add GBETH nodes
  arm64: dts: renesas: rzg3l-smarc-som: Enable eth0 (GBETH) interface

 .../bindings/net/renesas,rzv2h-gbeth.yaml     |  77 +++++-
 .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 237 ++++++++++++++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  35 +++
 drivers/clk/renesas/r9a08g046-cpg.c           | 120 +++++++++
 drivers/clk/renesas/rzg2l-cpg.c               |  70 +++++-
 drivers/clk/renesas/rzg2l-cpg.h               |  10 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      |   1 +
 8 files changed, 539 insertions(+), 14 deletions(-)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
