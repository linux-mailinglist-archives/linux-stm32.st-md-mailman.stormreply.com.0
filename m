Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA9AAD436E
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jun 2025 22:04:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E240EC35E2E;
	Tue, 10 Jun 2025 20:04:18 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4CB5C36B38
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 20:04:17 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2355360ea88so8481835ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jun 2025 13:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sima.ai; s=google; t=1749585856; x=1750190656;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SLBrHn1lo0nb3pErG+htfOLCGfPDjEh1wfPdZMI4yH4=;
 b=bvLW8iSs3UsVSMkOVh3vfkqPMbUkb0WSFR30ZngSZ3pWsh+2WEu6y+qsGvENQPVLmO
 Dz8ujtYe9bdFzR4RH/cdzRy9ZhF80g1O989vr/mj4g29lmH1bJgeD1eqkymsqIW9X0DW
 2FKvoi88FoZR1uS4QAZyn2eJ/twnK5pFWv4jA0KbkgU3cFw385AE/Asi0xS+ElmEgdRn
 /PNL1g6bp6/XEDv2UxXUfwtS6XrhjdwqpunOPN5jFafuac4PPJLGP1aCGBaWcFX1o0Z2
 nrD+D4X6jNLlP3ilXxXWQabN6eg/aIK8VrLE045dJOpEXDAPwNIYPf/sVYxJzxsoJdl/
 g8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749585856; x=1750190656;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SLBrHn1lo0nb3pErG+htfOLCGfPDjEh1wfPdZMI4yH4=;
 b=Xux9MQW/plgkHllCPLJXSoyiz7OeHLBkllUF8PVJPcG/LymPMqGaJJuk6mnru8u/ju
 DMJu24UkdZRVY75K0Bl/YVqCdi6KnnCLqgCaAkRorLEexkOYQpNQOQr8+on47vYoJEKN
 YMwk60McEaUY2kDywRO1WvdSGx9owuD/fThOAIpbpKxBJ0L48pmA+NAAEBMsHGTdTLrM
 HRqCKUTE71Q6qsJu7E4rkgr95Grl96o5H6v+ifJnOELXNpbX4W520VQa4Gn/RBMMA5eX
 ZePO5deufJv8XgBf///cJwLh6rB8wWefu4QOp6fx59zGpqAhxRh58Jee02jpsRR1QcZY
 brsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoXJ3OTCqbWOHsql2h6P67pcU1n5V7/9DXifKZ+P/JFZE4viRgUsw10wFBqX5NfkiHZQYFP5rB83g+BA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxTGJlsiAQ/a1AFxG6BIhflA5eHIEuPUCvLKIONImov52081mvV
 wpQzHyr24u+TQLInIKe/6GyN1MRFshSxLE2ghwAUFLH4FqEexBVvN6mtZXPGMH8Ibeo=
X-Gm-Gg: ASbGncs18C0A0k5tjTCWK0H5v8+qCQvCX2IobltTjyyp1KaKbEc7WPP6aje64Drk2da
 aqVsggVQ1uhQbcciwtDfq0OBXRREF5zSf3iPNQqsihhoekpmxNhFoygwo8NdrVgNUX3tFN/4+j1
 F4YGlv6gccv2I266uyN3w4/mJm5dMPMlN6VjnFGN8yKo21k/RELm/etfkSvEqJu0ZdR321uKrIy
 T1VENIv91okWXF5Zr5DhQOkDyWqwY283GN6NuDmTHe6CeJj/xyLLm9TB6xU+LKCJ0SBpOzbzznA
 jQGc8xLbCjqwifuwYTb+lBPOBXbNIA+rAp0TA7ipkGkE2U6DAAo5Xv/RraTZxv6voB87N042za3
 Qu88La4dsHrkkwpU=
X-Google-Smtp-Source: AGHT+IER+o3LTU2puTUgTzx5nfZBbOjCThFzTKIlbQejci+9CZwNjpKLs8gAK20uD5mbsirIIc3WyA==
X-Received: by 2002:a17:902:e806:b0:234:d7b2:2abe with SMTP id
 d9443c01a7336-23641ac62fcmr3095555ad.7.1749585856133; 
 Tue, 10 Jun 2025 13:04:16 -0700 (PDT)
Received: from nikunj-kela-u22.eng.sima.ai ([205.234.21.7])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31349ffc151sm7629818a91.48.2025.06.10.13.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 13:04:15 -0700 (PDT)
From: Nikunj Kela <nikunj.kela@sima.ai>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Date: Tue, 10 Jun 2025 13:04:11 -0700
Message-Id: <20250610200411.3751943-1-nikunj.kela@sima.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: romain.gantois@bootlin.com, inochiama@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, netdev@vger.kernel.org, l.rubusch@gmail.com,
 quentin.schulz@cherry.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Nikunj Kela <nikunj.kela@sima.ai>
Subject: [Linux-stm32] [PATCH] net: stmmac: extend use of snps,
	multicast-filter-bins property to xgmac
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

Hash based multicast filtering is an optional feature. Currently,
driver overrides the value of multicast_filter_bins based on the hash
table size. If the feature is not supported, hash table size reads 0
however the value of multicast_filter_bins remains set to default
HASH_TABLE_SIZE which is incorrect. Let's extend the use of the property
snps,multicast-filter-bins to xgmac so it can be set to 0 via devicetree
to indicate multicast filtering is not supported.

Signed-off-by: Nikunj Kela <nikunj.kela@sima.ai>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index b80c1efdb323..4164b3a580d8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -579,6 +579,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->pmt = 1;
 		if (of_property_read_bool(np, "snps,tso"))
 			plat->flags |= STMMAC_FLAG_TSO_EN;
+		of_property_read_u32(np, "snps,multicast-filter-bins",
+				     &plat->multicast_filter_bins);
 	}
 
 	dma_cfg = devm_kzalloc(&pdev->dev, sizeof(*dma_cfg),
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
