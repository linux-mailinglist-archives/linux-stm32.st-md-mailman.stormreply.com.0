Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A6B2A1E72
	for <lists+linux-stm32@lfdr.de>; Sun,  1 Nov 2020 15:07:45 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08AD3C36B36;
	Sun,  1 Nov 2020 14:07:45 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FF09C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Nov 2020 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604239661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=EQ7i+/lF3EujJ95sQqC9i7wHrofb94VFCyP+azCPi/I=;
 b=ZLVApX2cu/or3K+1q7xg3+tqLxnBCr1sckVV7dkDyyS9QuIUA4rlyFmFOFulR2+K2cDNUS
 bYml5AHet3ocWvhr1mEBUfLCQdIeZpFGG/kURnekDP24bDhoyGLHh2LREQKyPRyc1SfBbN
 XDLKljLGj2CMPnXJxgSXUp+I+Mte7Ew=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-kcY-jw5kPqapokqQmCsUmg-1; Sun, 01 Nov 2020 09:07:39 -0500
X-MC-Unique: kcY-jw5kPqapokqQmCsUmg-1
Received: by mail-ot1-f70.google.com with SMTP id e6so5121811otk.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 01 Nov 2020 06:07:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EQ7i+/lF3EujJ95sQqC9i7wHrofb94VFCyP+azCPi/I=;
 b=i27XhzyM0FhjvizbOPz6f+Enjg/PgT1Y3le9+5xhTJd4uCpJAQgTJXHBfIVVR2sSAq
 jdy0THgACmBVRDg1OTZQNeirDNdfOZTC0Y7/erV/abG7FglFPfJjmi32ll+W3cEXrmL8
 2tINXoElNDBAAaTiPHn53mEMx0KfF31Mf5SIsdO2OdZrB3BGg152jV7BkA5Kr2frNrAa
 PVkmGZQYrvGG114I6t/ABAFZguo4B2poTyEbrSCf6I9RJ897PNE47WPx9KTm9He69coh
 UNU63RoyoLkHq0lfDa/4eewx0tuUZOF55klPbIiTuUbFSQ3TuQubhWL8pVN9vkVLTuU5
 BNdw==
X-Gm-Message-State: AOAM532xwTLGSupc3wWvdWeJqkLRef7OzjLUjhslxZLXXdf8j9sibrom
 ipbP6s3H9BtudtFPYr3NE+LLQIC1RaIgf9bvvml8o6Lb0paN+bcfrjMbdSa5Q4uScHkypDDi3uY
 GZmoy2Gz8FOPUZf9yTtuOcCIIIMLqTFaYdMSRqzj5
X-Received: by 2002:aca:e0c3:: with SMTP id x186mr6987541oig.140.1604239658333; 
 Sun, 01 Nov 2020 06:07:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcu+/hiKh26DPEvMTbBAZGfTPVYBsLJwAAjV5P0Oa0ZdQWckM+cGghBgyRCnt32yB+IjjJCQ==
X-Received: by 2002:aca:e0c3:: with SMTP id x186mr6987526oig.140.1604239658186; 
 Sun, 01 Nov 2020 06:07:38 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id i18sm2881929oik.7.2020.11.01.06.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 06:07:37 -0800 (PST)
From: trix@redhat.com
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, kuba@kernel.org, mcoquelin.stm32@gmail.com,
 khilman@baylibre.com, narmstrong@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Date: Sun,  1 Nov 2020 06:07:20 -0800
Message-Id: <20201101140720.2280013-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tom Rix <trix@redhat.com>, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: dwmac-meson8b: remove unneeded
	semicolon
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Tom Rix <trix@redhat.com>

A semicolon is not needed after a switch statement.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 5afcf05bbf9c..dc0b8b6d180d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -299,7 +299,7 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 		dev_err(dwmac->dev, "unsupported phy-mode %s\n",
 			phy_modes(dwmac->phy_mode));
 		return -EINVAL;
-	};
+	}
 
 	if (rx_dly_config & PRG_ETH0_ADJ_ENABLE) {
 		if (!dwmac->timing_adj_clk) {
-- 
2.18.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
