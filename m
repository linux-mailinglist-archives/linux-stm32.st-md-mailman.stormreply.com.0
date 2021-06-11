Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E45883A49CF
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jun 2021 22:05:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA512C58D7C;
	Fri, 11 Jun 2021 20:05:57 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93272C58D5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 20:05:55 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id my49so6247602ejc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 13:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hYLxhuwHVg89Dl/lCk/ypB8Gf9ORlIGXC8Igf4TEJuo=;
 b=uj2ns78lP9PM5eOEarBfs0nLqIBqapJ9u+ITOjY5yDGMfB68oDYGduL3ZjEiOai6q3
 ieD5L03FqpCCvrkqcJUuEvlMUdWbSdacCFt8oszPbLIvCkCVsD6pedceB2r36zC1GpWd
 G+omc13Mbvh+pRqGokXT1nub1cQtWOnNvqr57DJRKlO5eMs7h8M2qu3R0Lj1Eocy+o4m
 Cs5wy8p16HNdhaPTRkRzxm5aRpEL0iY+DDOXQkDDDiAkQIg0KYrAniCAsRspx/iQ8+QK
 tn8LhK42B2CNWT97FeQTGnI8ncPq2k7rKoRZBm+sVvPIlZkHX2ndRoDyjzEWkcLfslCF
 IX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hYLxhuwHVg89Dl/lCk/ypB8Gf9ORlIGXC8Igf4TEJuo=;
 b=Za8xjNiw9ZSsCSvjmsRN9o+rKeM5J7Hi7oA0vq1j0T6kFBw1UwoDLUUnNRFFsi7yAU
 q4Abc5OoU2YqAO4xKc5Ongtdi4/zOlWCpIthX8/Q/iLGeHJ7ukhHHY/1eyAkzNWBSmuk
 susweQwdcGQ/8boHibvfz8iSA2lQh3pGgu6VDf33Wpyl6A1d9JRZTgm3BK7KWsMPxmy0
 6JB0XEQImvAAMqC24ejNCdB76HKyiMqqXrZH71BEVebqaGuHOSgXOO5iprTIgXdBXJYM
 xddiDcCPF2xj8+N5/6ZLy76t3RlEFvL4W1LFW3atmMEZebery+VY7sA/f7I2QaKrC95i
 tDnA==
X-Gm-Message-State: AOAM5322/TCS3FRsneqhZMhcIWCoT6D43PHF+pxsHW6aQTk8421jx6L1
 3nyUaAeBFkAaomcWWLwJK3A=
X-Google-Smtp-Source: ABdhPJwoPXlVRrU44Dx3Wfyg7Y5dBhlDaehsaVMJPlrsyPJ20Zt4U5vH54p9acY15RLnrafahtXwpw==
X-Received: by 2002:a17:907:92e:: with SMTP id
 au14mr5043497ejc.194.1623441955250; 
 Fri, 11 Jun 2021 13:05:55 -0700 (PDT)
Received: from localhost.localdomain ([188.26.52.84])
 by smtp.gmail.com with ESMTPSA id w2sm2392084ejn.118.2021.06.11.13.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 13:05:54 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org
Date: Fri, 11 Jun 2021 23:05:24 +0300
Message-Id: <20210611200531.2384819-7-olteanv@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611200531.2384819-1-olteanv@gmail.com>
References: <20210611200531.2384819-1-olteanv@gmail.com>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Wong Vee Khee <vee.khee.wong@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH v3 net-next 06/13] net: pcs: xpcs: also ignore
	phy id if it's all ones
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

From: Vladimir Oltean <vladimir.oltean@nxp.com>

xpcs_get_id() searches multiple MMDs for a known PHY ID, starting with
MDIO_MMD_PCS (3). However not all integrators might have implemented
that MMD on their MDIO bus. For example, the NXP SJA1105 and SJA1110
switches only implement vendor-specific MMD 1 and 2.

When there is nothing on an MDIO bus at a certain address, traditionally
the bus returns 0xffff, which means that the bus remained in its default
pull-up state for the duration of the MDIO transaction. The 0xffff value
is widely used in drivers/net/phy/phy_device.c (see get_phy_c22_id for
example) to denote a missing device.

So it makes sense for the xpcs to ignore this value as well, and
continue its search, eventually finding the proper PHY ID in the
vendor-specific MMDs.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v2->v3: none
v1->v2: none

 drivers/net/pcs/pcs-xpcs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 743b53734eeb..ecf5011977d3 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -965,8 +965,10 @@ static u32 xpcs_get_id(struct dw_xpcs *xpcs)
 	if (ret < 0)
 		return 0xffffffff;
 
-	/* If Device IDs are not all zeros, we found C73 AN-type device */
-	if (id | ret)
+	/* If Device IDs are not all zeros or all ones,
+	 * we found C73 AN-type device
+	 */
+	if ((id | ret) && (id | ret) != 0xffffffff)
 		return id | ret;
 
 	/* Next, search C37 PCS using Vendor-Specific MII MMD */
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
