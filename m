Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BE89B920E
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Nov 2024 14:32:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63E35C78035;
	Fri,  1 Nov 2024 13:32:24 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 698D3C78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 13:32:22 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-720b2d8bb8dso1542253b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Nov 2024 06:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730467941; x=1731072741;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wphCThRlK5730NbXh9Ab0RkkuVRzjiZcFhR/+OwDyt0=;
 b=gxqoqZWxr6TsswI7Mh0f1sF1GeuH5Fk4lPX7n8UT3yrQD6JaSxCjPRXiEhecuqRllp
 xi5ltVHdF+mjkhY186zBTIxRjJ/oTmeyoeFGlmwtY3sSgQQMMeAyy/XrDyllF58dKcKy
 Gu6gsAlrcVzv+PNMRoJPpG7ouy5vF167bZnmnLWYZyW+vcY/yr4iiUhGeYehGm1iN2/z
 4CNCpaqTyPGHiwwz9cjc3QxjXDXdtzkJ++BgVOd4+D5t/sxZJGyNB7BvPIFvcXMxISUK
 cmaHO5s3eC5hkRuHLdz+SIDvcbwcaBkCWCp8mvgp5YpNePtKPEw9Yj5oWozhgi55xBRI
 lMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730467941; x=1731072741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wphCThRlK5730NbXh9Ab0RkkuVRzjiZcFhR/+OwDyt0=;
 b=qEHM86WTyd3X7UO3XzWran5Gnf2kDpPU+qOy3vaO3msQTdmPW7ygHb7iKYqdAKWjnV
 il9rQqObL6MbAqxUhC1cEWamjBNVWMcq8zeurH1x1ymH9Izzmc2lU/TdsvKM+GSwpZJh
 81py9fLsWQgDklTjjVsQQdYnsB1X2L5f3/ermO8g6E2Mh5Y1BDtlnim2geONbYD+KTop
 IdnzQKNAij1YvxVt/3S73BBNVWEcnJcrDmFR83tIi41e0jHiM92OBmlgAY92kGzfnJBj
 NVAglPaSt+8OFl+igpnResEPy1fFZFB+QhDzX+XjqATOelNRT2qOJLwYrFM5gxyD6llq
 fzCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxUW/SYIC2N8jRX9bTyrDNmOr5sRT+pU+0Os4eIBaPwJyxEMYIBh1v+MZsmaEJeYM4IIySDvCpdCId1A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyysdkD597b7IZK2DKKbIuXyTdKUbuEJZUhzKxKSrbtuJ3DC0cN
 qEDSJBF9/3NKUrE7HRP5l/gsYwJlTyBLeCr/nAkT/AutzsF51CRh
X-Google-Smtp-Source: AGHT+IEwkwocJqJz+kaOZcvq+ymOZftMTIobWIrePUj2ag6n4idToR7gk3ClbrJoOWA/v/BFlkpmRg==
X-Received: by 2002:a05:6a00:887:b0:71e:72b5:3094 with SMTP id
 d2e1a72fcca58-7206305a115mr32325469b3a.28.1730467940877; 
 Fri, 01 Nov 2024 06:32:20 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-7ee452ac4ffsm2425552a12.25.2024.11.01.06.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 06:32:20 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri,  1 Nov 2024 21:31:32 +0800
Message-Id: <6298463f4655a76faf94e4273a4205c13ca17c77.1730449003.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730449003.git.0x1207@gmail.com>
References: <cover.1730449003.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v8 5/8] net: stmmac: Get the TC
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
index affb68604b96..ab717c9bba41 100644
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
