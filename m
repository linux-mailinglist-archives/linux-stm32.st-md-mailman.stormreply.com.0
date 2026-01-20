Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGAsH+3nb2lhUQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 21:39:09 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 126874B6F5
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 21:39:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B663BC349C4;
	Tue, 20 Jan 2026 20:39:08 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B009C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 20:39:07 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4801eb2c0a5so38868645e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 12:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768941547; x=1769546347;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qrKCUKKckHcjjuwU+EHrOyUAQd4woAILl74Bd1qw4Gk=;
 b=I0Fp2Vg/K0DHkPCrVZKB/DBWfUYcNJPuxGGsZarErWLCjkWPpcLIQiupkURg8Xypjl
 QDnQWM4WktNeFGccVxiCS8gr6/JSnIJ5QQEJbZyYpgXoKcy9wvgxisQCWeQoEvDQiEqi
 23DpnwN4L8JXiE2c0GFxCc/94rz99Z4HL4CXbK6Szz+nUgDv9UxIFPgv9/mCSvySzqSQ
 b9bo//vajYAm3EgRi1dIKAM9j3Vl+60GMSUoPoqbUXwL/0wOB+yVnC+wjZrDT4NgQthv
 iJrRBWGtb8yIu/LZ6fmaClEAigmYnIQkfC+3ZUvsfg7VSvVGqMfbMbUasj4h9Gd38GrT
 Ualw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768941547; x=1769546347;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qrKCUKKckHcjjuwU+EHrOyUAQd4woAILl74Bd1qw4Gk=;
 b=bofcOR7m9+V5iVpcAEWoFCBXC4fZze66nEPUu5UcQgdnx74/xagMMfedNZfyrU3T93
 FeU5EbFfjRThJ6yf8VMiEK6gulgc5S6e38mae+ZO1N/UQ8McvqlvHI4l84F4jWB/9UG1
 zJsa2FK8xbd8rl6idGZjaGRFiqCaBxIuS1NlQmVfRTzpoBPsyCPW0PvQFxWFqVN6HcnN
 D3hyDRfpsJoNCjXA7AXnWnuOif8KTrdXMBN2T7SGWGw+jxiduea7S+HxPiTuzsjttqYk
 bDtFaekyUn+celoRoevnmGMRPs8JRTA2Ctc/p5mjU9VYFSBIPmK3z/sX41+tjZSvIAn9
 YWiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwnu8MS2d6gB8zqkk7r6H4ATky5eJRWTo1FHFsWrmUdcPz+pLBQTXxXL8lC/i8xLnK/h8nETI1GaDmMw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz+RZRubYM0qaFYO3ZVxvD/NEWedDny72XlGCISRuTu2LvptOw6
 Wr7imJQj4jyfBzjFbGyy6sW/PyD8C92AQOjLrWZPxV5eUK4aQyQfMbru
X-Gm-Gg: AY/fxX41Qo3GZjwrlIfq313w/6SIXUhX63PP79gMPykOx+c/qHI7SqFcKdNiAED2ij6
 ALCO5bZToKxi4JKlnKM/ANlNjUncNY8Cvd6fR4m6h01mfqti30ng5fTK55Sh4+qU7s6eKRQ5irs
 aOalNYKdIytWv1fl7KLp7gZ5rjGn6NX8l8Ly8Mrex8TKJJScXqH00+5wlaN0jwjBPBDXh3jPkkn
 +rIfNc1Hb7D63VCvsS67seNEl832LuSZGvDjXkGAtuSp3WlLU1VK6KZxSVSL78v3Q12jWTCce44
 FPERKfV7efTycmbkicuUZrTiitIMODEs/uHVq5WjZRTwnlYkxbS2/XGL+PdZ56pwd/wY/kiBzqd
 ST3YrtpgIpOup7sVDvqZPqQSiaTU7zxcBat6LEgnqAWqiq8+fInK4J1mdDnvLMSb27wDR9dcf6p
 rZy39Iy7Vi3G7gSHzg
X-Received: by 2002:a05:600c:414f:b0:480:20f1:7abd with SMTP id
 5b1f17b1804b1-48020f17c12mr160684545e9.31.1768941546639; 
 Tue, 20 Jan 2026 12:39:06 -0800 (PST)
Received: from eichest-laptop.lan ([2a02:168:af72:0:378b:c660:2f9c:b651])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48042c3a7c1sm850425e9.13.2026.01.20.12.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 12:39:06 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, linux-stm32@st-md-mailman.stormreply.com,
 maxime.chevallier@bootlin.com, francesco.dolcini@toradex.com
Date: Tue, 20 Jan 2026 21:30:01 +0100
Message-ID: <20260120203905.23805-1-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: [Linux-stm32] [PATCH net-next v3 0/3] net: stmmac: dwmac: enforce
	preamble before SFD for i.MX8MP
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:francesco.dolcini@toradex.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,pengutronix.de,armlinux.org.uk,st-md-mailman.stormreply.com,bootlin.com,toradex.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[eichest@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eichest@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 126874B6F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds a new phy_device flag PHY_F_KEEP_PREAMBLE_BEFORE_SFD
that allows a MAC driver to request to keep the preamble bytes before
the start frame delimiter (SFD) when receiving frames from the PHY.

This flag is set in the stmmac driver for the i.MX8MP SoC due to errata
(ERR050694), which causes it to drop frames without a preamble.

The Micrel KSZ9131 PHY supports keeping the preamble before SFD by
setting an undocumented flag, that was confirmed by NXP and Micrel. This
new feature has been added to the Micrel PHY driver for the KSZ9131 PHY.

Changes since v2:
- Instead of using phy_register_fixup add a new phy_device::dev_flags
  flag PHY_F_KEEP_PREAMBLE_BEFORE_SFD so that a MAC can request to keep
  the preamble before SFD if needed (Russell)
- Link to v2: https://lore.kernel.org/all/20260105100245.19317-1-eichest@gmail.com/

Changes since v1:
- Use phy_register_fixup_for_uid() instead of adding a new device tree
  property
- I will send the conversion of the micrel.txt binding as a separate
  patch series
- Link to v1: https://lore.kernel.org/all/20251212084657.29239-1-eichest@gmail.com/

Stefan Eichenberger (3):
  net: phy: add a new phy_device flag to keep preamble before sfd
  net: phy: micrel: add option to keep the preamble before sfd for
    KSZ9131
  net: stmmac: dwmac-imx: keep preamble before sfd on i.MX8MP

 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   |  6 +++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  8 +++++++-
 drivers/net/phy/micrel.c                          | 14 +++++++++++++-
 include/linux/phy.h                               |  5 +++--
 include/linux/stmmac.h                            |  1 +
 5 files changed, 29 insertions(+), 5 deletions(-)

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
