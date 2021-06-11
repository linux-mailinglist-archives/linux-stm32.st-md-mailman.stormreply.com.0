Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3723A49CC
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jun 2021 22:05:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5AF9C58D5F;
	Fri, 11 Jun 2021 20:05:51 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF2BAC58D5B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 20:05:50 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id cb9so38484825edb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 13:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9aLb5MTiMiX+eIH3cIXkfteLFULp/N00+e1rMmviAS8=;
 b=Km1XT8H83tLT8TNyIdLMRFimyUb95Z0/elr91QOxZ5/pCz2ISBWGfpm29wY2XYnH7V
 L2AvEZo1tb3v3QMaggr3aXQ4vIjG10EYNX8mdYVKgMBw2woWqqukBPj1zx6azfFpleIZ
 ZygKuEZwjRACnhxVW8nACqSr8UmrJv2DHpWy6ki6GBvy/giHXciB8ZV69wiWpOZKktlP
 nLj4VPBujEw1s4KM/j/4k7VRrtY3jqPg+DM4trsgSOvZmBOVR0cADLNsZQ2Kw4gJjnPh
 0NlfqLzF7qLF95C8ypzYhUuXlL49LMiUAu8SWWX4ZJ503LQ3GOdYEXM4ZxkgOn2qV+46
 zH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9aLb5MTiMiX+eIH3cIXkfteLFULp/N00+e1rMmviAS8=;
 b=LkVhaVkOO0WeRG/NUmQWhK+TooiwqcwWvkfvHhWCykMzNEVipxXFzAOZjC3LZbn4om
 VIuvtQ9VUic2OK2+1935Abv7OFjPRigoBoj1+aBsh4VTtjBIZpRum45bJ1PK+aivg3Hi
 YbozklYSgdBR0mRSOuUqXe3nXXG+wUMPLx8sdRpE2O4tP7jnd8bUJP37xwXEDHtywOFx
 shCyJDWhk9VcR0NRPrgPJmDIo6MTWodoI/yNPk/eHWfRU7Y30CJ+KQuqLWWqADr+CIVx
 BVKipHMifiZ/ZZXgOCyZc6JZBgGFKMsbUlDUM8+2XuZEeAhEA1uXuf1K7WYcic0H5yt3
 poWg==
X-Gm-Message-State: AOAM533wMXkLId046UZWawVpkc/G5rfxUHke3XIj+a1ELubOYE1WelI2
 BGzuaMiNndOb47pMOhJezrs=
X-Google-Smtp-Source: ABdhPJzmu8weoHDB0sMFCwMDVFSD6la1dr12loV+A+iUkl97xaxZjnJz5nrydk6D8sqLXDXAxV3bIg==
X-Received: by 2002:aa7:d555:: with SMTP id u21mr5600674edr.84.1623441950434; 
 Fri, 11 Jun 2021 13:05:50 -0700 (PDT)
Received: from localhost.localdomain ([188.26.52.84])
 by smtp.gmail.com with ESMTPSA id w2sm2392084ejn.118.2021.06.11.13.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 13:05:50 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org
Date: Fri, 11 Jun 2021 23:05:21 +0300
Message-Id: <20210611200531.2384819-4-olteanv@gmail.com>
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
Subject: [Linux-stm32] [PATCH v3 net-next 03/13] net: stmmac: reduce
	indentation when calling stmmac_xpcs_setup
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

There is no reason to embed an if within an if, we can just logically
AND the two conditions.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
---
v2->v3: none
v1->v2: none

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index db97cd4b871d..975b90805359 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7003,12 +7003,10 @@ int stmmac_dvr_probe(struct device *device,
 	if (priv->plat->speed_mode_2500)
 		priv->plat->speed_mode_2500(ndev, priv->plat->bsp_priv);
 
-	if (priv->plat->mdio_bus_data) {
-		if (priv->plat->mdio_bus_data->has_xpcs) {
-			ret = stmmac_xpcs_setup(priv->mii);
-			if (ret)
-				goto error_xpcs_setup;
-		}
+	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
+		ret = stmmac_xpcs_setup(priv->mii);
+		if (ret)
+			goto error_xpcs_setup;
 	}
 
 	ret = stmmac_phy_setup(priv);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
