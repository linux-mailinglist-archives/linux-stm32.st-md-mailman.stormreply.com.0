Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJFcLAkqfmkJWQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Jan 2026 17:12:57 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 606BCC2E98
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Jan 2026 17:12:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21356C56603;
	Sat, 31 Jan 2026 16:12:57 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CF0AC56603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Jan 2026 16:12:56 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-658f1fde4bfso1252228a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 Jan 2026 08:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769875975; x=1770480775;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XTq2LBbLb5L85nE2s4woY/0r3B7VxHgm3zekbSlXMv4=;
 b=b4zMaxnaUNms+jzL+XL5j03MmQRqdxtVQM242O3VXuSunOMIOHqTCKUuZ1ZX4G+cjP
 lcZk/X5pK482+ZIfJxh2SxFsvJGWas4zsrBMSCgoRqxnPB0tJSbpnntGS/V9gQZRUQMt
 ybDtngfhxbyUMae7mZLAFpix2O80OGwfzy4lE/NoXfvNq2vSwmLi5EteXHt6VhAExMup
 iH6k15E2PVCferykVcO8RlicRab+Iodnkws0pD130uYyMQAAG+QP67r8jZY43aMrhppe
 ATw+l/6WXyPS4xhbHOx2QeeeGDgEw+I3jy/gyKk0MimwDEccfnmmQhgHdG4Z0mekQikw
 PuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769875975; x=1770480775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XTq2LBbLb5L85nE2s4woY/0r3B7VxHgm3zekbSlXMv4=;
 b=SNGwwRSHbEPrS64aasQnyK1XrL/2KadyusBHhf0Nk+5Rb3Ygjc5aL851MSSP3N+K6u
 TKrjCE6/ZD6z017Z/fjcUGblJfkSEdcxRnxHTqH3J9GJGby4TVF89Bxl0BeDXyMrwQ/N
 bGu+estTaBeRA61b5RWEHn9nZuyfLy4MevJsdNlYG8sPxtV5lTBHvtnTbK3O/peTL/L4
 h3KC4geCo8O81taubbrDCGE/Zn1X91LLBulmgPVuW+zuHKSgpmzPcLvAByVsD6BlrjRX
 b57Dvh4+XWZazBvtbJaV2c7AirYUohlN7ZOdZIO0RdX8BPN9V0KxD+zkmiVTjXYXS2BS
 3hNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/6vrXdy8zhix6lIUF5A+GfazMdtEd1OlkJLfiAI0BOtzWr5GH4ukp3UZL607Iab9yIwXJxMQHi2X6ig==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxAVPwnZvXq+h1ixie/EvWJeCs22ug2C43ds8wQok1efYrht0yr
 sxxhznNf3WWRDCKcow297ftBlNb6ZK8WAAplVPq/1J4A9hTLY7vFSaxf
X-Gm-Gg: AZuq6aJ5j2EFvLnOhO6qbLOeVs4Yb2ydfFOGkH2jpcYgOYNeqDVfivqJ5jB9rejJFgh
 1rGWO//zq+nDhHK8JKvbpW7HUemzmwkerx9nb0jJ4MjUlI7XNlG89Woy/bAdPRMvVL0dYjDBsLy
 xWPJPd4yJ92IF24YuQJMwQsWoLzNkjHosfILC77Y+cV6QNB8sQEusLltTL8Z7YDR+ogoG1E6KQ7
 UTsIj6JU8+E6H0oaAaa12YZzBFC9J3Smjtw4kZGwhMnI4B66Mx0z1mXmVkQA6eVNka1AMM+tI1z
 bslXABkIRiSNH6ITjYOUg+sfHPuN5pTpjNXNMaC6sF0FPHoGGrcF09fwI8slIapTm1FLYdDrtc8
 hIc+pdK/cb689Lhi8Rs+yHP6u4MPsF/LjU6SoLXrVUxBe+ASXMvjD37S+08wyZhpSYUiV6z4lh3
 RtSt6ZTRIriy6N5D8vNVownMYWRbbmQ24C1BA=
X-Received: by 2002:a17:907:9701:b0:b88:5b72:ec39 with SMTP id
 a640c23a62f3a-b8ddf805340mr625902766b.5.1769875975203; 
 Sat, 31 Jan 2026 08:12:55 -0800 (PST)
Received: from localhost.localdomain
 ([2a00:23c4:a758:8a01:46ad:7674:ff90:13f3])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-658b46ac0e8sm5433232a12.34.2026.01.31.08.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jan 2026 08:12:54 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Date: Sat, 31 Jan 2026 16:12:43 +0000
Message-ID: <20260131161250.5047-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260131161250.5047-1-biju.das.jz@bp.renesas.com>
References: <20260131161250.5047-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Cc: Biju Das <biju.das.au@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 2/2] net: stmmac:
	dwmac-renesas-gbeth: Add support for RZ/G3L SoC
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_RHS_MATCH_TO(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:richardcochran@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.au@gmail.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:biju.das.jz@bp.renesas.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[bp.renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,armlinux.org.uk,bp.renesas.com,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,renesas,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,bp.renesas.com:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 606BCC2E98
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Compared to other Renesas GBETH stmmac glue drivers, RZ/G3L GBETH IP use
the version Synopsys DesignWare MAC (version 5.30). It has an extra clock
compared to RZ/V2H and has ptp_pps_o interrupts. Add support for RZ/G3L
GBETH by reusing device data of RZ/V2H and can be extended to add other
functionalities later.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Collected tag.
v1->v2:
 * No change.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index be7f5eb2cdcf..19f34e18bfef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -214,6 +214,7 @@ static const struct renesas_gbeth_of_data renesas_gmac_of_data = {
 };
 
 static const struct of_device_id renesas_gbeth_match[] = {
+	{ .compatible = "renesas,r9a08g046-gbeth", .data = &renesas_gbeth_of_data },
 	{ .compatible = "renesas,r9a09g077-gbeth", .data = &renesas_gmac_of_data },
 	{ .compatible = "renesas,rzv2h-gbeth", .data = &renesas_gbeth_of_data },
 	{ /* Sentinel */ }
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
