Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SwZGArUgemkW3AEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 15:44:05 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACFBA306E
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 15:44:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 325E6C57A50;
	Wed, 28 Jan 2026 14:44:04 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43D6EC01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 12:58:57 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-64b92abe63aso13663371a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 04:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769605137; x=1770209937;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j8uaattQ84x7k0dHlXaaGs69eppir8vSPiEkCl0d5XE=;
 b=WTFSHvC8NfkmyKcQ2RvLJ9JZd+T00hJQgEv1XVC1BW/ySl0drmEMUWxxFe7TcAMhL7
 W49dd7dIrbFt2zeb4j2sJQPM8NQjAemIfIGAtXEjB8/+VDtm+HPT9PA3J5JlDngod+sx
 IgMVBIQ8jnf/YKh8F6v/BA6hmJiMI5NBFWJp6CQNIK+snkAZQd2SiTb//1PCjXnbuoFX
 2HJCUbM/5Xf8YpFNiqIEykTHrw4/We22JHpIyCJ76Jw32ewvvVUhNxMb650d1p2dkujk
 k7gjLwg7rVXHAbTcvD3dcTLY5NRDmgIwtsLJKhqociluHfvLtMMDAyju8P1tmPJLOzsT
 PqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769605137; x=1770209937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j8uaattQ84x7k0dHlXaaGs69eppir8vSPiEkCl0d5XE=;
 b=WcLEcOudK3MxYzVzuA1jyXaBbSg3rD5N3Yhi4s0/I0liU60mx422bJs+0f2VTX8E7l
 g91Y3fH/8qSJOFsIFFvvPMbZMaym3ChvZS/anfBEXGjcmbqIKfeiquefYTruNogwOCeS
 gHcw6uSaGKGP2COP6r7nt9tTo4hx8EdQtjVyTvaFGCOsfEKkylZ25KnJ5J40ViYKDhpo
 hxpP4QX7gLuam0ywY5QM4ezfjnLGzp85/p8Ze/YQNygTQCRbYjY5iIlXzqPSK+3r0GzB
 EsfeI3vEeEw8/vBgzkbFxAQ9J3ZyF0+i0pwbE3IyodKRT3aKdwFPVHBTe7MTI2tDPywO
 WBZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCnhgUiKzGfh9q1HS6bMVcuOh86TA/VpfULfNPFfggsec3w6XCisp1Q61I5Rb2ZKD+Lug5IkToMlUMsA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxJa9SoH1GFST9mEIodk0s52a8/yYYoNjucaTuSCfXMHYGtbPUo
 +Nv6LOefgPjZDqQCXF9LTjlx0Atfg1MX5ZAMc+TpsHOCg7/+pA8eifKX
X-Gm-Gg: AZuq6aKdOiirC/2pHiKy/oDxqX/UJ/Jg2DZjUySv4l/63onuJ570pR9u0QCfWbNrBHf
 +wPWTMyeGQwz3lbJ7NadyJQGIwXriFXkiQ3GpY5v2fedbz0mKUbCjD6j1Z3qUnIbejQmGUxl8jZ
 J8eYQttZ2VPDMUzH4XOrrRT8uPQ19tmicLeQ2y9stS3SA9rfWH+cQGCU9zRCWl4+kdmxBrD+vu1
 azyxXZxnbZt0FdUjostd3mlinH0hTBXWfN8/8XBACvSyKmmHqMclplSJP53+SCwiqYVbftSqFiP
 3/it6cUQjf4AgrsTFt0L3YQPeRZ4F5rW2wX9z3zL0kRvRvNCyQzvSO2l3+V2F9gUn9e3MT6PZeS
 L0ITyvSlmtcwnMf+n/7HBlZcP3DTRTU/gYH9l/Hf6qCb1/EmdKHo2RqyhjSmfMY8RLVU/z4+L63
 KAPbqkrq3NrvdHJDT9aVSxwcIBokrAgpw40dE=
X-Received: by 2002:a17:907:d8e:b0:b76:f090:777b with SMTP id
 a640c23a62f3a-b8dab2e7d35mr340320966b.22.1769605136436; 
 Wed, 28 Jan 2026 04:58:56 -0800 (PST)
Received: from localhost.localdomain
 ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbf2f3e26sm123344966b.67.2026.01.28.04.58.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 04:58:56 -0800 (PST)
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
Date: Wed, 28 Jan 2026 12:58:39 +0000
Message-ID: <20260128125850.425264-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
References: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 28 Jan 2026 14:44:02 +0000
Cc: Biju Das <biju.das.au@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/8] net: stmmac:
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:richardcochran@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.au@gmail.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[bp.renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,st-md-mailman.stormreply.com,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,renesas];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 7ACFBA306E
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Compared to other Renesas GBETH stmmac glue drivers, RZ/G3L GBETH IP use
the version Synopsys DesignWare MAC (version 5.30). It has an extra clock
compared to RZ/V2H and has ptp_pps_o interrupts. Add support for RZ/G3L
GBETH by reusing device data of RZ/V2H and can be extended to add other
functionalities later.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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
