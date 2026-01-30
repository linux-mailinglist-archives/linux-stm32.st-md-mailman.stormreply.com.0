Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHQyMJKxfGmbOQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 14:26:42 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DF4BAFD7
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 14:26:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10732C1A97C;
	Fri, 30 Jan 2026 13:26:42 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDCA6C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jan 2026 13:26:39 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-64b9cb94ff5so2750217a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jan 2026 05:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769779599; x=1770384399;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0EdujWQoBAn/IwVhOEaFp9E9St0lYVYzZ1tCazrBN34=;
 b=VEB22BZSwpX59xxB6JnIZLBgZmwVYVMSLeXD9eYSt7yDE2smq6wjT3gmtaWi0eSvMU
 yWqYvURB+x9NPQbWNurip/Os7228HgGrD+ce6XxDWvyVk72d2pONIkkTJeH5ao6CsfgT
 oyZtQBRThduiIGgzA69sX/VDSQBYo3B+XgfacJIzWuZTZoYVRgMEPrwguOq0SAcDXw4n
 d1NUmicGQWWtyjxguATBLKlJcS0ldlqRCWgpT6vyhUsCIxRbdLokL27/dd4XMXyGluX4
 e9EbwME1/klej2AOJ/xtNyfgN8vqNenHE5QmN44lfxMJ1NVlmQKGlg61WhHzs4IUQGjK
 w1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769779599; x=1770384399;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0EdujWQoBAn/IwVhOEaFp9E9St0lYVYzZ1tCazrBN34=;
 b=JzmcGMEGN5efNsvW0dMMdzTZ/mmQKTkr0uDHGT/W6ITV4qMVcg0mKF9jNb8kVQdwzn
 P2tutPU5wkweVl58hh2Rco/4Ahu4ilg4h2SUqm/BaWejmXkiiXfP9xurumSyTlFCKnrR
 9ePlevXI/d8KmbpgX/dugFOjY0l2Ra7y4yrL1WXfyHoDmjEuVlBcjhS7zArer8QA2Q9X
 coOK4Eb9Krb5K1PrqQBBEZTaBDiThwEbNEvltRpqeekH1ZY3b445HJII6qUndq554o9Q
 RVZc9J1/KGmez9AA/C/17EiPRoQjFrq7oeLhaKyZYhazP16vD+0hPcc6RCw/HNq1J2em
 SIrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnSctJTadPZixgwZPm6r3HbNSqkWuP0zMtm47fOdUYUecoza2/2TjW2lpZVHu9VLciubSlmCOasYW9pw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YydkyPWozTgLykqBw8IJ0z6q3N/1NzTyi9yFM99GEtS0sfLshAq
 Ib0HPYztVWbYfVH0AOIEfVixQYz7FaqLjrDR7X74egoWWmo0lC31R81WXwfGwQ==
X-Gm-Gg: AZuq6aI8WcAyaIbM4sFoc47QWnFvQ5Ju8HuKiAM7gEBCd1TN1QaveVHzoLD7hZh+VJ9
 +UnC/PR7aOotEMf84fZ/fWwg6fLgkS/cTCtTiIR82rZp/WtyodmpbOW4C7rAirvYOiYbYtSAaeH
 /LF1u53QUsc/i7W8/auL6ZOUuB5Whhs6ge8x+jV337v3H5v95d7ezlCSjDqG8P1lwkEzvO7OvC/
 ykJ0yiJdPPKixpVyAjMPQlBcEgGx0gmfUFuNjmJJErgGSFf4fwwRg2rPRFjEsVCRIHS70DUeso8
 l4B94TG79aDhP9rWfqXmFYRoZF5Wu14AgdcgkCdN9D+O7bxjbF8SyBhQ6Idsotb8YI8GEvRFO0a
 /CVxMaqBN+yDD5IOPIO25FPwi6nZR1a9c6xDlbLFzVjUD9r9/MfMHG1V4ORnzYsVw4mN3QG+Ndu
 jcbG1OYZRfo4+VAYqtAqIe+zwBPIrYpA0FvIE=
X-Received: by 2002:a17:907:7212:b0:b87:daee:a6c4 with SMTP id
 a640c23a62f3a-b8dff6846admr145665366b.36.1769773667338; 
 Fri, 30 Jan 2026 03:47:47 -0800 (PST)
Received: from localhost.localdomain
 ([2a00:23c4:a758:8a01:bd64:2984:fe71:7633])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8de3046abasm243751266b.2.2026.01.30.03.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 03:47:47 -0800 (PST)
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
Date: Fri, 30 Jan 2026 11:47:38 +0000
Message-ID: <20260130114744.252533-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Biju Das <biju.das.au@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/2] Add support for Renesas
	RZ/G3L GBETH
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
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:geert+renesas@glider.be,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:magnus.damm@gmail.com,m:biju.das.au@gmail.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:joabreu@synopsys.com,m:biju.das.jz@bp.renesas.com,m:peppe.cavallaro@st.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:mcoquelinstm32@gmail.com,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be,foss.st.com,bp.renesas.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,synopsys.com,bp.renesas.com,st.com,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,bp.renesas.com:mid,renesas.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 68DF4BAFD7
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The Renesas RZ/G3L GBETH IP uses Synopsys DesignWare MAC version 5.30
compared to other Renesas SoC such as RZ/V2H that use MAC version 5.20.

The RZ/G3L GBETH requires an extra clock compared to RZ/G3E and has pps
interrupts. Document the Renesas RZ/G3L GBETH IP in bindings and enable
the Gigabit Ethernet Interface (GBETH0) populated on the RZ/G3L SMARC
EVK. The eth1, pincontrol definitions and hotplug support will be added
later.

v1->v2:
 * Separated ethernet patches from series [1]
 * Collected tag for binding patch

[1] https://lore.kernel.org/all/20260128125850.425264-1-biju.das.jz@bp.renesas.com/

Biju Das (2):
  dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L SoC
  net: stmmac: dwmac-renesas-gbeth: Add support for RZ/G3L SoC

 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 77 ++++++++++++++++---
 .../devicetree/bindings/net/snps,dwmac.yaml   |  3 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      |  1 +
 3 files changed, 70 insertions(+), 11 deletions(-)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
