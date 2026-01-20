Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNaDEvLnb2lhUQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 21:39:14 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3501D4B71A
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 21:39:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F142AC349C4;
	Tue, 20 Jan 2026 20:39:13 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E2D5C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 20:39:12 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-48039fdc8aeso10332995e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 12:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768941552; x=1769546352;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FS2abDDltV4uyJ83wWZDF+in02lUwUwLBKewiaizUbw=;
 b=epGuOPHsDzzf0nWCbnFQyv61E8ydqkxwqKh7xWc6cqDvROAvj09cYQa6RHLGrIE6Gd
 tnf1V8wZCxbLXdaCNPFNiFKrE2h/HhzjiS4wU+vdZcpRL12O1c3uxmxtyJpYpFuhUR9Z
 RjfSbviLszGdhRydkBCZmDHGWkKZM4An9DafEUAk+DqIFnqfOQR5M/X6EuALHYMpTx8V
 5pi74M9jH2NBKyAs+NK146iRy1LEEtjH/jriByuwTKxi9kWggVN/gyTJ/APa3KEiay8/
 UTjw4XgzdsGuawuEYpFuDpGLhm32gpI8QTQ3EKxplT0IIeyetfsypnHHlhJIViSeZNsV
 9R5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768941552; x=1769546352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FS2abDDltV4uyJ83wWZDF+in02lUwUwLBKewiaizUbw=;
 b=Z5N3kSPVI4zY24UhuPmvvfzPnr1dBpEoHWE4ZClIf0CWgBpA1P6gSD3Gsbynx+qIro
 ZRmOhfaq1HjorTvCxg5T8xLvQse2bbJ8eXS0DA8i0XEZmczgPEOGBNEn70nGeF8OR9xY
 rmgGWGSTH+GSRDY25YNmPey2DNIZH4VD/mfoBo2VQ2ue4aGrY3SQWz3Utp2ZFCvoR74a
 W7ybdnuoAbxhN+HePuEmNceYX3FJDqj8SFwbzxSi1Cak3H5HrYzKviZCD2s5DQp1rKqY
 fCogOjRkSBOUx96XdZzQysGYsJ8r7py86JGUBq/qfFoK7TNBHYSMYNHSka7Zy79S2NDD
 JcBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYT5+IvC112k+fxrM6hxr2S6i30dV9dua+ZD5DLWfghP1zVgXy1CWd6REgnfUynyLwf6bmtLnvbApXxA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YylvcFWv4+AbkDfjRpgdh9PNpD/JKKocGw0j/l3W5WSGt6ey9lo
 CkMUFAeMx/RuoEXxOxa6/2b1WP+1JVxnVGm1gwydC5RfC5kT7D8fHhuZ
X-Gm-Gg: AY/fxX6MCtTN7yWdzpPTz5JeNcTG4DSkmN6gqmosEp9aU6vfbqVnS9zOVJddR+ggk0m
 C0QwZoqYkvpYL9ZyszdVTa1iDFCqfe/nSSnrc33UW8EGSjOEUJa7WViOBBMl9SQW8BQ2LkDUsrm
 eXd1cqOhtdCdXbxi16zBDtGsOboUqitq7wZs+iyqzOnSparIpTX0rIGztLxJdNb3cR2Su/2bKlT
 ffh+TfenRrnBkmKM8N1B3eFI/UKI5GCDLQaJP5XpC5mhs54anuHkGfwFlRqWZHYgu+yNsO6bkyl
 VpF3MK41BIUXh1m9aE2VTizdBZJvhk2DEHnyeLgBeOC9ZqIii/KMtrzlTSrgsQUxZKwXNLm/CPb
 yhtf4GTAT8BfrnfSr4y8uwUPLRPMQ2lVjzT3kYNsJ4xVmiEtkx3ZwnUJ2PpzKHYEGcBDy7TlIKC
 T+zQ9ay7YQp6Etn5Ko
X-Received: by 2002:a05:600c:190d:b0:477:abea:9028 with SMTP id
 5b1f17b1804b1-4803e79bbbamr44181875e9.6.1768941551414; 
 Tue, 20 Jan 2026 12:39:11 -0800 (PST)
Received: from eichest-laptop.lan ([2a02:168:af72:0:378b:c660:2f9c:b651])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48042c3a7c1sm850425e9.13.2026.01.20.12.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 12:39:10 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, linux-stm32@st-md-mailman.stormreply.com,
 maxime.chevallier@bootlin.com, francesco.dolcini@toradex.com
Date: Tue, 20 Jan 2026 21:30:04 +0100
Message-ID: <20260120203905.23805-4-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260120203905.23805-1-eichest@gmail.com>
References: <20260120203905.23805-1-eichest@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev
Subject: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: dwmac-imx: keep
	preamble before sfd on i.MX8MP
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:francesco.dolcini@toradex.com,m:netdev@vger.kernel.org,m:stefan.eichenberger@toradex.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,pengutronix.de,armlinux.org.uk,st-md-mailman.stormreply.com,bootlin.com,toradex.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[eichest@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[eichest@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,toradex.com:email]
X-Rspamd-Queue-Id: 3501D4B71A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

The stmmac implementation used by NXP for the i.MX8MP SoC is subject to
errata ERR050694. According to this errata, when no preamble byte is
transferred before the SFD from the PHY to the MAC, the MAC will discard
the frame.

Setting the PHY_F_KEEP_PREAMBLE_BEFORE_SFD flag instructs PHYs that
support it to keep the preamble byte before the SFD. This ensures that
the MAC successfully receives frames.

As this is an issue in the MAC implementation, only enable the flag for
the i.MX8MP SoC where the errata applies but not for other SoCs using a
working stmmac implementation.

The exact wording of the errata ERR050694 from NXP:
The IEEE 802.3 standard states that, in MII/GMII modes, the byte
preceding the SFD (0xD5), SMD-S (0xE6,0x4C, 0x7F, or 0xB3), or SMD-C
(0x61, 0x52, 0x9E, or 0x2A) byte can be a non-PREAMBLE byte or there can
be no preceding preamble byte. The MAC receiver must successfully
receive a packet without any preamble(0x55) byte preceding the SFD,
SMD-S, or SMD-C byte.
However due to the defect, in configurations where frame preemption is
enabled, when preamble byte does not precede the SFD, SMD-S, or SMD-C
byte, the received packet is discarded by the MAC receiver. This is
because, the start-of-packet detection logic of the MAC receiver
incorrectly checks for a preamble byte.

NXP refers to IEEE 802.3 where in clause 35.2.3.2.2 Receive case (GMII)
they show two tables one where the preamble is preceding the SFD and one
where it is not. The text says:
The operation of 1000 Mb/s PHYs can result in shrinkage of the preamble
between transmission at the source GMII and reception at the destination
GMII. Table 35-3 depicts the case where no preamble bytes are conveyed
across the GMII. This case may not be possible with a specific PHY, but
illustrates the minimum preamble with which MAC shall be able to
operate. Table 35-4 depicts the case where the entire preamble is
conveyed across the GMII.

This workaround was tested on a Verdin iMX8MP by enforcing 10 MBit/s:
ethtool -s end0 speed 10
Without keeping the preamble, no packet were received. With keeping the
preamble, everything worked as expected.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   | 6 +++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 +++++++-
 include/linux/stmmac.h                            | 1 +
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index db288fbd5a4df..c722ff2dc1fcb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -320,6 +320,9 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 	if (data->flags & STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY)
 		plat_dat->flags |= STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY;
 
+	if (data->flags & STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD)
+		plat_dat->flags |= STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD;
+
 	/* Default TX Q0 to use TSO and rest TXQ for TBS */
 	for (int i = 1; i < plat_dat->tx_queues_to_use; i++)
 		plat_dat->tx_queues_cfg[i].tbs_en = 1;
@@ -355,7 +358,8 @@ static struct imx_dwmac_ops imx8mp_dwmac_data = {
 	.addr_width = 34,
 	.mac_rgmii_txclk_auto_adj = false,
 	.set_intf_mode = imx8mp_set_intf_mode,
-	.flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY,
+	.flags = STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
+		 STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD,
 };
 
 static struct imx_dwmac_ops imx8dxl_dwmac_data = {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index da206b24aaed9..08a6082fc0c02 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1205,6 +1205,7 @@ static int stmmac_init_phy(struct net_device *dev)
 	struct fwnode_handle *phy_fwnode;
 	struct fwnode_handle *fwnode;
 	struct ethtool_keee eee;
+	u32 dev_flags = 0;
 	int ret;
 
 	if (!phylink_expects_phy(priv->phylink))
@@ -1223,6 +1224,9 @@ static int stmmac_init_phy(struct net_device *dev)
 	else
 		phy_fwnode = NULL;
 
+	if (priv->plat->flags & STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD)
+		dev_flags |= PHY_F_KEEP_PREAMBLE_BEFORE_SFD;
+
 	/* Some DT bindings do not set-up the PHY handle. Let's try to
 	 * manually parse it
 	 */
@@ -1241,10 +1245,12 @@ static int stmmac_init_phy(struct net_device *dev)
 			return -ENODEV;
 		}
 
+		phydev->dev_flags |= dev_flags;
+
 		ret = phylink_connect_phy(priv->phylink, phydev);
 	} else {
 		fwnode_handle_put(phy_fwnode);
-		ret = phylink_fwnode_phy_connect(priv->phylink, fwnode, 0);
+		ret = phylink_fwnode_phy_connect(priv->phylink, fwnode, dev_flags);
 	}
 
 	if (ret) {
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index f1054b9c2d8ac..e308c98c7bd33 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -191,6 +191,7 @@ enum dwmac_core_type {
 #define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(11)
 #define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(12)
 #define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
+#define STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD	BIT(14)
 
 struct mac_device_info;
 
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
