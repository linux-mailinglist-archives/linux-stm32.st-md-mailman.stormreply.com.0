Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFVZFWeafGmzNwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 12:47:51 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D706CBA277
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 12:47:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FB54C01FBF;
	Fri, 30 Jan 2026 11:47:50 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9554BC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jan 2026 11:47:49 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b88455e6663so292704266b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jan 2026 03:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769773669; x=1770378469;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HiAdJAOATpphPKKt4Msqi/O3DHV/llCZQK8v55LcCMs=;
 b=aqKUt9ubJGznQAP1gcC8MlSF85nQCcaR0X1MedVhBJbd15IZwZiqrOXkoDv21vnlE5
 c9ur32AmSY1RNGDX7Eq7vYgWqeQh6E4UM828I8b7y0dzc46VF5RE6gkZvwgFU6lj9ImN
 aFMrOOy7IMOuL09aedcVcjsnZkcTQPoDCC3Jr8DpfDIhcM/LZzoyrKZYKusUjXINEOcI
 gV2caPNO+UtZ7h3hFqQqMiIrLRtnV7t84JAm/YejAhOGvVKFZWaVSyPEh/tXF8tP94wl
 73bwbv35dy5C6ADQaGit/qeGPPQ99fexnTxxzaO/Rwkwe/GH82TasCKBpkWyuqoDsRdA
 ub7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769773669; x=1770378469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HiAdJAOATpphPKKt4Msqi/O3DHV/llCZQK8v55LcCMs=;
 b=sdYOipex9cKP7ULJPin6Ka9x4vr0FVNEzqoYQizE54eYcXIKtX6yXEzu/U8KNe2ScR
 sYD7xfEOM3o4xfGPt7yQc6Su6oID0Js2/j4CQNrvuRcgJR6ohxlIfpLtny3TwAKxihzd
 jrAJS6rvefLPLhl5989Yr0hfDolhDwdMZmtJozKsrZf61cFRs40yZj+qqe0LKQLyXd5U
 nX117CMbl+MuG2UROE46OWhTrsxNq/VozMYUat47b6x3gkxLKb2+fz1d1XG9sXu8ao8H
 IuAuhrLRQZ2wz0wNxR9vIUDifApvoWNqQIUyomj7I+ZKcUv5SiLmCgp0etY/wxmkqaoS
 Q/Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXyGgpiPl2Dq7A0tUhCtfeUKV9gAzx/ecoKcM7JxPxNL/IKwxBmSwfHFRM/oqWKHUyfR80Rc5HmW1vQQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzUEddzwAJFj2bIhZtHTRGCZNA4hABd3o7T0Cq0a+aPsFjSpTH6
 0VTx4plO0hST9yW+Mt2TdkzpmpkSnU0qkM37qqrXAyNU64Kx7S+8lUgW
X-Gm-Gg: AZuq6aJwc6OZrXSfxLxylbd/HPvM72I1XTOpCV7zk+/IoOrJn6NFYC6r2tittNwX8Rr
 EFY/W6icL+wgXSH/Sr3s1pwtRwLzLz94c+SAEcqvptb4s3kFZeT7xte40Ntp2+x1XasY4/d3i7/
 +gWArIOa0258iE/MVAnCyZAkSqAi4lN4cqFU92OwwsNBWsEyUqQwLYTiHxDywiVeJZB11whz/3v
 e2UxqQzzwVmIBjqLiB62bGzdjgYQRF1Hp3XjOP7cdSrQ/nqHZ4JC4zV9tLEiTu83jr/rgE9keVC
 Xuzv8yzs86oLeLAe15DdlY49GsjXwGpMEzOe5pWMic9E2Xh6OjWUyKvbhKwLzVEwOzDq+vcCS8x
 zgYgh1zgf6hCeOQbCMYYV7EoZ36volpUWIhn/qQNAZOpiZeJAUV+K1LXYPwCUdliL4rvoEzSe8a
 PYCUYepR2wYJLMGS5YmWn+D7o51YuEVMkYyy0=
X-Received: by 2002:a17:907:7212:b0:b73:9280:2e7 with SMTP id
 a640c23a62f3a-b8dff71f572mr144266166b.34.1769773668637; 
 Fri, 30 Jan 2026 03:47:48 -0800 (PST)
Received: from localhost.localdomain
 ([2a00:23c4:a758:8a01:bd64:2984:fe71:7633])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8de3046abasm243751266b.2.2026.01.30.03.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 03:47:48 -0800 (PST)
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
Date: Fri, 30 Jan 2026 11:47:40 +0000
Message-ID: <20260130114744.252533-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130114744.252533-1-biju.das.jz@bp.renesas.com>
References: <20260130114744.252533-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Cc: Biju Das <biju.das.au@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 2/2] net: stmmac:
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:richardcochran@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.au@gmail.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[bp.renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: D706CBA277
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Compared to other Renesas GBETH stmmac glue drivers, RZ/G3L GBETH IP use
the version Synopsys DesignWare MAC (version 5.30). It has an extra clock
compared to RZ/V2H and has ptp_pps_o interrupts. Add support for RZ/G3L
GBETH by reusing device data of RZ/V2H and can be extended to add other
functionalities later.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
