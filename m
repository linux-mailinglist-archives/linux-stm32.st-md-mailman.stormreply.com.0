Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D6B3A49C8
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jun 2021 22:05:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A03D4C58D5C;
	Fri, 11 Jun 2021 20:05:47 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 014F7C57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 20:05:45 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id i13so38455178edb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jun 2021 13:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ll27mDkR2Nn4CAVr/nM06w1iVZSiEYp0rZ5xtbtYd4U=;
 b=dzZBGpG+d5zXDBADJKaPJ9kRBGj3zlm2aKmxo5Xm+bWyxje6+MCpr/BDnD+EDH/UVU
 cGYaj2we1IsvSTRA4cQ5eoSQi0nGR6VjXJRgKhf5uvnAFesDrxAZadyUwyrHWQrRiM0E
 Xad3oOqKBEj3siYiVPHb9HCyqm9GiEC/72ttmmh24gLMgQIwRhVRvT4wAK41OkyuwD8t
 tgXx1AnLPGMDd6YXvvzi3TKCCjoyg9eVaSPp0riZ218m5656JO0fzB1QWJ9e/wpOLXt1
 1igOBIprpg4qx4hyl6lXtG53Y/fZnxVBRSbvvjxqCwvEdxuofI0D2W42Un0vEjKckAqc
 JXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ll27mDkR2Nn4CAVr/nM06w1iVZSiEYp0rZ5xtbtYd4U=;
 b=P7Z2MFN+EuQ4b6kifTxdX7tzhpUdlHbrwOdaXRPBzjzkOQBWbDbbZKHKefo8kogrvl
 mN9FHqxm3rWLpL+xJJ3FF9tpIQCcFFhR3NszIn4RSQvtPyOYPQv0U9unQfqnlASlqbD8
 Tut1jl3FGyv6yAG/nY6zPwhul+4cPQ3106OUJvaI5hVQWhkveQdYSp+EHLMaJ7fEydDo
 c4mGqcPqnZzEkSmCy6NubycO+XPuzUR9g2RD0nfNs/XfQdSqZqMuAJ2fR/Lb+qeZke20
 ByIwF0Qj7dLk405UnB69Snrt3k3fhtHlLb2b2kR2RN7nAxBFDvzou8BhD7UB5ZUJEzVu
 fNAA==
X-Gm-Message-State: AOAM532OP4R9uCy/GXOuZZmnHBVHjxv10OBxkLgOapBSggkyj1qPDlzL
 02tr3VL6oqXbo/536QXlqv8=
X-Google-Smtp-Source: ABdhPJzunxNNjjyMF0VXDIesSOjh6QPhWVlV3iNn5LUCNKqbbCDbVQdrLvN9Jmj25SjP5YdpqxWViw==
X-Received: by 2002:a50:f403:: with SMTP id r3mr5380022edm.101.1623441945575; 
 Fri, 11 Jun 2021 13:05:45 -0700 (PDT)
Received: from localhost.localdomain ([188.26.52.84])
 by smtp.gmail.com with ESMTPSA id w2sm2392084ejn.118.2021.06.11.13.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 13:05:45 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org
Date: Fri, 11 Jun 2021 23:05:18 +0300
Message-Id: <20210611200531.2384819-1-olteanv@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Subject: [Linux-stm32] [PATCH v3 net-next 00/13] Port the SJA1105 DSA driver
	to XPCS
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

As requested when adding support for the NXP SJA1110, the SJA1105 driver
could make use of the common XPCS driver, to eliminate some hardware
specific code duplication.

This series modifies the XPCS driver so that it can accommodate the XPCS
instantiation from NXP switches, and the SJA1105 driver so it can expose
what the XPCS driver expects.

Tested on NXP SJA1105S and SJA1110A.

Changes in v3:
None. This is a resend of v2 which had "changes requested" even though
there was no direct feedback.

Changes in v2:
- fix module build (pcs-xpcs-nxp.c is not a different module so this
  means that we need to change the name of pcs-xpcs.ko to pcs_xpcs.ko).
- delete sja1105_sgmii.h
- just check for priv->pcs[port] instead of checking the PHY interface
  mode each time.
- add the 2500base-x check in one place where it was missing (before
  mdio_device_create)
- remove it from a few places where it is no longer necessary now that
  we check more generically for the presence of priv->xpcs[port]

Vladimir Oltean (13):
  net: pcs: xpcs: rename mdio_xpcs_args to dw_xpcs
  net: stmmac: reverse Christmas tree notation in stmmac_xpcs_setup
  net: stmmac: reduce indentation when calling stmmac_xpcs_setup
  net: pcs: xpcs: move register bit descriptions to a header file
  net: pcs: xpcs: add support for sgmii with no inband AN
  net: pcs: xpcs: also ignore phy id if it's all ones
  net: pcs: xpcs: add support for NXP SJA1105
  net: pcs: xpcs: add support for NXP SJA1110
  net: pcs: xpcs: export xpcs_do_config and xpcs_link_up
  net: dsa: sja1105: migrate to xpcs for SGMII
  net: dsa: sja1105: register the PCS MDIO bus for SJA1110
  net: dsa: sja1105: SGMII and 2500base-x on the SJA1110 are 'special'
  net: dsa: sja1105: plug in support for 2500base-x

 MAINTAINERS                                   |   2 +
 drivers/net/dsa/sja1105/Kconfig               |   1 +
 drivers/net/dsa/sja1105/sja1105.h             |   9 +
 drivers/net/dsa/sja1105/sja1105_main.c        | 186 +++----------
 drivers/net/dsa/sja1105/sja1105_mdio.c        | 255 +++++++++++++++++
 drivers/net/dsa/sja1105/sja1105_sgmii.h       |  53 ----
 drivers/net/dsa/sja1105/sja1105_spi.c         |  17 ++
 drivers/net/ethernet/stmicro/stmmac/common.h  |   2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  10 +-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c |   6 +-
 drivers/net/pcs/Makefile                      |   4 +-
 drivers/net/pcs/pcs-xpcs-nxp.c                | 185 ++++++++++++
 drivers/net/pcs/pcs-xpcs.c                    | 263 +++++++++---------
 drivers/net/pcs/pcs-xpcs.h                    | 115 ++++++++
 include/linux/pcs/pcs-xpcs.h                  |  21 +-
 15 files changed, 772 insertions(+), 357 deletions(-)
 delete mode 100644 drivers/net/dsa/sja1105/sja1105_sgmii.h
 create mode 100644 drivers/net/pcs/pcs-xpcs-nxp.c
 create mode 100644 drivers/net/pcs/pcs-xpcs.h

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
