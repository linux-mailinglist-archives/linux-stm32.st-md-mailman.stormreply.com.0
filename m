Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9323A49D7
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jun 2021 22:06:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AC55C59789;
	Fri, 11 Jun 2021 20:06:08 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94D1BC59785
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 20:06:04 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id cb9so38485438edb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 13:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xRBvZz0lIfl1yQ7DunT3dpjQHDR3uZQtR8Zy7dtHBEI=;
 b=eutQrOM2z0zWi66eSb6VewhWJzCQMoabVUTQDr0cbi7Lg+ZLj0b9rpQf8TQ7U2eSlM
 y344OyYmjm9YX4FOs5C25fpYaZDawAvh7T/SuuyxMvQRyrT4shKSJx0z7rxImSks1YVb
 KCEOckI5UWqoVskjGOWWoxnAZMDglUJ1vQRNPlFiBL9de2sPTorxhNWIYJBHlPxI/Tol
 CUlMHkkNgzz8Op5G8o/zur6gYpGvtivmVYTfyiN39X2LSf24Z0x34XODwmYOvDSsPKOM
 rQCcKKw3bQ4m1B+GQe7ALKqUN3kDqj4FxD1ecGXMfTHUz7zLvJosKdhEUKCdtglPeJyY
 54Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xRBvZz0lIfl1yQ7DunT3dpjQHDR3uZQtR8Zy7dtHBEI=;
 b=YzqkJcVRcdXtyCA96qWKbIGFHXDLeghkqSBZfGA7xU/A4k+GuC5OXToi35WZvcAzsL
 NKcbuFEpJhwa7q4HEluE1/97VYk09Qvk1UUoZ6B3NmDIwV3Ih5kC/9YW63PoPsR819nl
 Wrdw6oOqOyV6WJhyfsrioDb1//shgZmPwQCPuYRO+ETrsUTasnYBf6kxzbJPVHQ1SFAu
 Boax2y+mKp/mOoszYgLYsQO+JKbWms0p9WOfDr5Pcos9lXkG3vbsEizcfvRXN2Nj1VXz
 pCmctxzRNCevsxZQ0SYqZBrjZRM2eklx9RUk7GBimKxCwabVxqFr9723OES3gcpVh8hZ
 YTjw==
X-Gm-Message-State: AOAM532kWAY9mB0ER2C8niMhRLW2s5lBZ4yCXzBYbDJgNnYguHWUZiwZ
 vUjBysQvagU38FSUkiHkJ+E=
X-Google-Smtp-Source: ABdhPJyuT9MfxU8KMdbPgDFY+Fo6IcLiSiWe7mongMX3p0Ssy9uL34ykPCRqQZXcSxq8RJrImQHQuA==
X-Received: by 2002:aa7:c758:: with SMTP id c24mr5635417eds.188.1623441964199; 
 Fri, 11 Jun 2021 13:06:04 -0700 (PDT)
Received: from localhost.localdomain ([188.26.52.84])
 by smtp.gmail.com with ESMTPSA id w2sm2392084ejn.118.2021.06.11.13.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 13:06:03 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org
Date: Fri, 11 Jun 2021 23:05:30 +0300
Message-Id: <20210611200531.2384819-13-olteanv@gmail.com>
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
Subject: [Linux-stm32] [PATCH v3 net-next 12/13] net: dsa: sja1105: SGMII
	and 2500base-x on the SJA1110 are 'special'
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

For the xMII Mode Parameters Table to be properly configured for SGMII
mode on SJA1110, we need to set the "special" bit, since SGMII is
officially bitwise coded as 0b0011 in SJA1105 (decimal 3, equal to
XMII_MODE_SGMII), and as 0b1011 in SJA1110 (decimal 11).

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v2->v3: none
v1->v2: none

 drivers/net/dsa/sja1105/sja1105_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/dsa/sja1105/sja1105_main.c b/drivers/net/dsa/sja1105/sja1105_main.c
index bd1f2686e37d..3e32b8676fa7 100644
--- a/drivers/net/dsa/sja1105/sja1105_main.c
+++ b/drivers/net/dsa/sja1105/sja1105_main.c
@@ -209,12 +209,14 @@ static int sja1105_init_mii_settings(struct sja1105_private *priv)
 				goto unsupported;
 
 			mii->xmii_mode[i] = XMII_MODE_SGMII;
+			mii->special[i] = true;
 			break;
 		case PHY_INTERFACE_MODE_2500BASEX:
 			if (!priv->info->supports_2500basex[i])
 				goto unsupported;
 
 			mii->xmii_mode[i] = XMII_MODE_SGMII;
+			mii->special[i] = true;
 			break;
 unsupported:
 		default:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
