Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD0A9B7AC5
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Oct 2024 13:39:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65422C78036;
	Thu, 31 Oct 2024 12:39:03 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B370EC78035
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 12:39:01 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-72070d341e5so727674b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 05:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730378340; x=1730983140;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BWr+UUbXH8lnMLmy8eSvjMvYSmy75x4Or0Lzgqe9VF0=;
 b=U7XcJI8g7XTXrT2rBJ38BEXSXaSXapcJs3W6GiqfvVGYHyS+UadO7ARKFRISy2CdOp
 o2w0HadI2lgOXmvzsilYsDIPhUtEW0XpCfaI18wSc7aak+l/g1EZdB3ibwQg4E4s1HFY
 +1QK4q3j7lUOKiKGXtm71Sryv93kWwRmk5oHLCdKdCG1F/XNXDT7vIB7cq4dpgBc5heY
 rLBtzbkBJ2q/oBmLp8s0Dv5Mc1QJoJ+Wf4p2zPDn+UM3perRKf9tUML7ZMnTWTNM+8OZ
 n13YWCjbG9ETrJ6X7nfWAkrmCfu7WwldI8ZvnLTIb/2DUrWnYl9zRsELsgXlJyfJmF19
 mPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730378340; x=1730983140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BWr+UUbXH8lnMLmy8eSvjMvYSmy75x4Or0Lzgqe9VF0=;
 b=HY3REapwa5kHS3WbkG3sWR4VebTInDPL5CzkPVBN1gCiwq3BcQ30TcRbGsFHykMpxx
 uOoE0h617EaP3UJo2jYdmP7YUR1pgExIiR2CYgvFca02a32E/emjMAW7L2TVgUbMpd1J
 aU1zkm0hYegVSzwM+6nN0Xe6wKvwRbrKpPGHMDtpYKqNtFXc72ntNsDA5Uy2GIicnoVe
 C/KIjiIuMyXHHA2XaTvPpmaZMb4buGWrnUb290UJrYwneY9pt/wY3BVS4kq72/NZC3bX
 vFzmRGlqJwRqLGckLfXmjsZusSiOyxYFA8lk/8+DMy0DShB2Y0GCSIcqbKC2LVV+TL9L
 P+xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXALCFhqEnYu5Twjv+kSBgfw+IwwhTlOYnrey0UMZMEdno1l/m18gv/Q+HaCQes70270fIk98dzrRq3Tg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzMihParzptXMlDXILJHhR+auWkCo967uzSvpRhILlOlaefQJ1y
 lHXYNiLvsHPrimfjsUlp6PqqSTHDd5o97IvQ8qbIPPqQzPBm694w
X-Google-Smtp-Source: AGHT+IGBmQcF+qVYl01bmlNc+GnbWq0Wjs3/vOJvZ50iXD5Wd6bwcRVM5avpNRM6Y+vslybR47mm4w==
X-Received: by 2002:a05:6a20:c998:b0:1d9:857a:585c with SMTP id
 adf61e73a8af0-1db91d89bc3mr3170917637.19.1730378340154; 
 Thu, 31 Oct 2024 05:39:00 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-720bc20f50esm1075931b3a.94.2024.10.31.05.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 05:38:59 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 31 Oct 2024 20:37:59 +0800
Message-Id: <4c19d46ee5f6d4229e86eb6195295cf8916b4c09.1730376866.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730376866.git.0x1207@gmail.com>
References: <cover.1730376866.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v7 5/8] net: stmmac: Get the TC
	number of net_device by netdev_get_num_tc()
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

netdev_get_num_tc() is the right method, we should not access
net_device.num_tc directly.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index fe0877ef5f4f..f07972e47737 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -304,7 +304,7 @@ int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 {
 	u32 val, offset, count, queue_weight, preemptible_txqs = 0;
 	struct stmmac_priv *priv = netdev_priv(ndev);
-	u32 num_tc = ndev->num_tc;
+	int num_tc = netdev_get_num_tc(ndev);
 
 	if (!pclass)
 		goto update_mapping;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
