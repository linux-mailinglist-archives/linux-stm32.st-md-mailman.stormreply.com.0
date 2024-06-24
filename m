Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A6C914E6D
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2024 15:28:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73FEDC71282;
	Mon, 24 Jun 2024 13:28:38 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B06E3C71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 13:28:31 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-52ce6a9fd5cso873386e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719235711; x=1719840511;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=weoB2927OHeQLkItSsl1+92aESa5A0VbbSHXdYNaCxU=;
 b=k2yUjHvMrxK6Wp4mlHGwJKx9hUEESJk7kOZOhNzmQdxhXuximEDTwE1OAPw1N7TDur
 f03xs2nkLHmsn25amu+FxR9AGgP1PBZnKlSQKIVPsLyxwgsQL22WdkRGSn4f1JGmycVP
 UtP7KqRNEg8EjRLCW6GSdQAmOuH3sPRNI0IRTgu0w0dFj+NnPYyLgGK/cwv1sQWL3zdM
 oxpBDwlC5Uptf0LpvAuJHC/kuYhrJgWG973tEjTv/yMAkzGssvkVoYo1F7nvWzEXWYzV
 GrslGK60kJz4MNcQWLSH0A5xABloAZtGKxGdqYE2ebg0oOT4PY/HE/Bclom+qsjd3hTZ
 i7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719235711; x=1719840511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=weoB2927OHeQLkItSsl1+92aESa5A0VbbSHXdYNaCxU=;
 b=aN7Iep6P33qwe0cG4qF98bEsnRQVUQrkrVXgAscXlQO0SCBv3xTwXo8dHXG32rcLRm
 QqNl2EYJX8usv3bGZY7xvpTDbEsLEB6pAzSvTO5SSotqYC3k832ve4pFvgyE5TtvJWD2
 ZUJyE/IUi2492VvUDFFCqMf3beQgiMOlzpCk34GiN5Cc3CcBT9pWQptt38seI6yBzRss
 8gVA0bc5v0rXGfL+zt7xVE1ElAVt3/X0quXKOIK6yCrrgslXi3BDDplxVyovhLPnlw7F
 I34jWNi3yXcNeIYA7aF+g7ebI6Cexr2oa3AJ2XbGonx54iS5KbHCC4fpumaHSeFySpMC
 oFuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkRviZvfYWdmqyuu1VbmSolzpBPG4mD3kCi08xvrhmSQsHooUfGIjHrmcEgt+HpeP2QuNAFbaRodiAeSPZ3i48WjflyZzX/l0MVULXydD/DYDM7R46XvLB
X-Gm-Message-State: AOJu0YxpH5kSxBCmqsd4pu8dNtRA7lcyysfqJOFBNgM8uvh60sDd3EGF
 jWWoAVLLuHxmgA8CnE2h55F35XVZVIK7v4vzU+tU8iVjYXxO1cBg
X-Google-Smtp-Source: AGHT+IFq8C6kBEtbmGEGitX4D9FUoJzf8LPqBHNhfBy21YGAueF442o3wAvxepev68ZGGljisU8J+g==
X-Received: by 2002:a05:6512:ba1:b0:52c:dd38:f3a3 with SMTP id
 2adb3069b0e04-52ce185cf4amr3356821e87.46.1719235710522; 
 Mon, 24 Jun 2024 06:28:30 -0700 (PDT)
Received: from localhost ([213.79.110.82]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd6454a96sm968129e87.303.2024.06.24.06.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 06:28:30 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Halaney <ahalaney@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 24 Jun 2024 16:26:26 +0300
Message-ID: <20240624132802.14238-1-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next v2 09/17] net: stmmac: Introduce
	mac_device_info::priv pointer
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

There is going to be introduced an PCS-specific CSR space pointer defined
in the stmmac_priv structure nearby the mmcaddr, estaddr and ptpaddr
fields. In order to have that pointer accessible from the PCS-specific
callback, let's introduce pointer to stmmac_priv defined in the
mac_device_info structure.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Note the better approach would be to convert the mac_device_info instance
to being embedded into the stmmac_priv structure. It would have solved
many driver problems like non-unified HW abstraction interface, duplicated
fields (ioaddr and pcsr, etc) or too many non-runtime parameters passed to
the callbacks, etc. But the change also would have been much-much more
invasive than this one is. If despite of that you find the mac_device_info
embedding into stmmac_priv more appropriate (as I do), then I'll provide
the respective patch in place of this one.
---
 drivers/net/ethernet/stmicro/stmmac/common.h | 1 +
 drivers/net/ethernet/stmicro/stmmac/hwif.c   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index a66b836996d6..f7661268518f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -580,6 +580,7 @@ struct mii_regs {
 };
 
 struct mac_device_info {
+	struct stmmac_priv *priv;
 	const struct stmmac_ops *mac;
 	const struct stmmac_desc_ops *desc;
 	const struct stmmac_dma_ops *dma;
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 29367105df54..84fd57b76fad 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -351,6 +351,7 @@ int stmmac_hwif_init(struct stmmac_priv *priv)
 		mac->tc = mac->tc ? : entry->tc;
 		mac->mmc = mac->mmc ? : entry->mmc;
 		mac->est = mac->est ? : entry->est;
+		mac->priv = priv;
 
 		priv->hw = mac;
 		priv->ptpaddr = priv->ioaddr + entry->regs.ptp_off;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
