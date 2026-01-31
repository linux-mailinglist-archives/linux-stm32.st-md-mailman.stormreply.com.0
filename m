Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNswOAcqfmkJWQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Jan 2026 17:12:55 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA9EC2E91
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Jan 2026 17:12:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12908C0693F;
	Sat, 31 Jan 2026 16:12:55 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F6ACC0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Jan 2026 16:12:54 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-65378ba2ff7so4581617a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Jan 2026 08:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769875973; x=1770480773;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LquA6UvIHZojV0lXQ8Twrjt3A7E6bOJA9Lb19ucfhkw=;
 b=YSmR/+aDiJwq6rvDcukKXx5R8j0upOlvJvUESHzioqodMqTeT5QPNHRguUWduOeN0k
 sHqtOiEIyUjSqJO2v9pHWyQxmmoonGsxO8jtk64w8xrOTR2uVDVm66GcKqLni0UAI4P0
 4xqPNb41K5GSq1CknaBIZ1FvuuOfzZ8bQz+YeuOydR2EnfuG7P+ifMgAUXzrdlEFCQr4
 kdjqVfIxpSn3bly/F9fU0T8JoTVs6sk615lFZe4YNWiD1hvZYF8Nvi7En7jOZH0D6UaP
 UL3+6fHVD0qMHu6J9o+ehi51+hIcQkyRqZvEBh4v6394FSTG94YDd98wO9zOtTyBejxx
 psNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769875973; x=1770480773;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LquA6UvIHZojV0lXQ8Twrjt3A7E6bOJA9Lb19ucfhkw=;
 b=A1sPbN7fqFmbxAyHbqJq+gPFqmQ584CzprKGh/QqGeJrK+Orcx+5bokOt57NaZ6wht
 1tOXwOtvosl/zgXuctDFOAjfJEqfGVsqaSV8L2BDGAVuFyjU5bg9xgF7Rd8gQWGv5a5Z
 tisqA9jW/W4ABz2hOx2G95WOedgSbJ6HvuVlTa2lYwM7139fG55ev/b2yjT6KkpZAmX6
 88KcoVQm2K7mZjETiaq/AxbBxtS459iFtBlFHR4kOOeil8cRsZe2uOXI5rS0/li9fhDY
 TUztwgFO+Lq1I97DCmEWCSOgYo9m3xU+kQQEPvizvz5Egz2THJUYtEMSw0Z75/yBLlzM
 Oy0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkvNvqKNsOfAOLfgTkpyyULykHn+sESnOmUXVFx4qdmPcjytj2Gq2wjv2mr5ciie0lneZPHGUvkTpTSg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwXaYRdLm/LODq7UUpJ2V2pBsc3uYpmX4mTZOP84LimvR4wDxUk
 HB/btZ65c87aamZvLGssMsOXlH+rMGqL3bPxqqUI/UfZS13BtRx8R98b
X-Gm-Gg: AZuq6aKK4kKpzEy/pciNtIUc7fo0CLUFqQ7SW2z9+3QQ8xwVamHyrS3HM/sFDzLchKH
 h+OdVsarjSb9FXKSO1skYG8jWYpV21XZypawTc66tfY4hgKQOlCiVF4OGO7mGjSW2DDcpkDq9c3
 QMxkMPP8QomElw+3trGpiEJjyN/nGCpabJyC4tRcfMpG0Y4GMAXjxW1nXguX4oscBqJgkm/bBXK
 v+iSGhs3j28e/VvveL8OQnyR6gtVIp/ELzaYZkRlIuavnUrEw1o43+tzQaHr4C9UHsK2WsA2lvt
 /JtLc9J3esqnqNZwsKf4uQ1K+i/qVqZ3JpYBK1vYlhN/D6WCkBvIb7BBpTF7XeKWcAvdXk6e4A9
 1J5T1vbo3KfiHh2Oz4oeSYlhnt5GX1f65yqyQsuycLIbHl0NIkYnsk4FlMLHPwNFzdVKTbI+Uvs
 gwKbjO3JvkB8S90BrGQGenxXfVWLfjC0gwVCk=
X-Received: by 2002:a05:6402:399c:b0:658:c140:4edf with SMTP id
 4fb4d7f45d1cf-658de58b52amr2912149a12.21.1769875973316; 
 Sat, 31 Jan 2026 08:12:53 -0800 (PST)
Received: from localhost.localdomain
 ([2a00:23c4:a758:8a01:46ad:7674:ff90:13f3])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-658b46ac0e8sm5433232a12.34.2026.01.31.08.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jan 2026 08:12:53 -0800 (PST)
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
Date: Sat, 31 Jan 2026 16:12:41 +0000
Message-ID: <20260131161250.5047-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Biju Das <biju.das.au@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 0/2] Add support for Renesas
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,bp.renesas.com:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 6EA9EC2E91
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The Renesas RZ/G3L GBETH IP uses Synopsys DesignWare MAC version 5.30
compared to other Renesas SoC such as RZ/V2H that use MAC version 5.20.

The RZ/G3L GBETH requires an extra clock compared to RZ/G3E and has pps
interrupts. Document the Renesas RZ/G3L GBETH IP in bindings and add
support for the RZ/G3L GBETH in dwmac-renesas-gbeth glue driver.

v2->v3:
 * Fixed the typo ppt->ptp as pointed by netdev-ai[1] in bindings
 * Keep the tag as the change is trivial.
 * Collected tag for the driver
v1->v2:
 * Separated ethernet patches from series [2]
 * Collected tag for binding patch

[1]https://netdev-ai.bots.linux.dev/ai-review.html?id=495cbea4-c154-4027-9ecf-0167906492fe
[2] https://lore.kernel.org/all/20260128125850.425264-1-biju.das.jz@bp.renesas.com/

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
