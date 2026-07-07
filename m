Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w5QnCqu7TGqFowEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 10:41:15 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3416771939D
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 10:41:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=collabora.com header.s=mail header.b=Us4Uf9yT;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=collabora.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E529EC8F294;
	Tue,  7 Jul 2026 08:41:10 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84604C7A836
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2026 08:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1783412494;
 bh=1dCg8pFc9XqfKgUTzqT+2O3mSfD/gWA0nsp+ocjIwUU=;
 h=From:Subject:Date:To:Cc:From;
 b=Us4Uf9yTiKcVl9JfEZkqFaSNyWi63G1uipwB5nA3fNX+oYiTM9JC5IowXgbkvmXAB
 NG1bLgiEBUUQi/CZon5JujEsS+dwsR32GvH4G6KmXc/e9WwvJC6F4pkqfIuLdn1lKY
 Asc5WU/uPTjddUkq+vTy/1QEhbnm4vpbskwB7cwR6hX7pnfsRLZGOB0jZb68NWsRlg
 IxCT02c8T+WgadqZ9wwSghvWk7Ua/PcV5W6y5St5Xf/Uqdl7uG0padpVG+S/E8zY8j
 wGgGROyP3+SxnzbqRBYhFS0DS0SPrRhPJPyzTADUNeKEBi6Wpu12Lq+4RIeDdtTp9Q
 xad7J7XLd83Pw==
Received: from yukiji.home (unknown [100.64.0.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A42917E05E8;
 Tue, 07 Jul 2026 10:21:33 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 07 Jul 2026 10:21:18 +0200
Message-Id: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ7CIBBFr9LM2klKiy30KqYLhEEnBqqA2qTp3
 SXq8uXlv79BpsSUYWo2SPTizEusIA4N2KuJF0J2laFru6Ed2x7dOxiLgRybQjcMRQmlUTvjqdd
 K6qOAur0n8rx+uyeIVDDSWmD+mUSPZz0qf302mdAuIXCZGjlK6/2gBiU6mPf9A80RGkahAAAA
X-Change-ID: 20260703-dwmac-mediatek-mt8189-9dafe3984951
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783412493; l=1609;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=1dCg8pFc9XqfKgUTzqT+2O3mSfD/gWA0nsp+ocjIwUU=;
 b=e+32C+4XJDUfsZQY8e2rwjSW7HdSP714dRnVts/EQlC0dhvkhtffDhKEGVIPwRCzuPu8Ve+DC
 lzuzHJT50qZAQRqt8QF2yvd4f/ZQ/ftgWzF4lmhl2XqGfqKuIhk/fiX
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-Mailman-Approved-At: Tue, 07 Jul 2026 08:41:09 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, linux-mediatek@lists.infradead.org,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/6] net/stmmac: Add Mediatek MT8189
	support
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[collabora.com:s=mail];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[collabora.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,collabora.com,mediatek.com,foss.st.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:biao.huang@mediatek.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:linux-mediatek@lists.infradead.org,m:louisalexis.eyraud@collabora.com,m:kernel@collabora.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[louisalexis.eyraud@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[louisalexis.eyraud@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,collabora.com:from_mime,collabora.com:email,collabora.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3416771939D

This series adds the Ethernet support for Mediatek MT8189 SoC and its
variants (MT8371, MT8391). These SoC integrate a Gigabit Ethernet MAC
with RGMII/RMII/MII interface, with a similar design than previous SoCs
such MT8188 or MT8195.

This series is based on net-next tree (sha1: 474cff686812).
It has been tested on Mediatek Genio 520-EVK (MT8371) and 720-EVK
(MT8391) boards, integrating an Airoha AN8801R Ethernet PHY, with
hardware enablement series ([1]) and additional devicetrees patches
for enabling the Ethernet interface.

[1]: https://lore.kernel.org/linux-mediatek/20260701-add-mediatek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com/

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Louis-Alexis Eyraud (6):
      dt-bindings: net: mediatek-dwmac: add support for MT8189 SoC
      net: stmmac: mediatek: add PERI_ETH_CTRLx register offset in platform data
      net: stmmac: mediatek: rename MT2712 and MT8195 variant methods
      net: stmmac: mediatek: add support for TX clock output enable feature
      net: stmmac: mediatek: add support for TX deallocation adjustment feature
      net: stmmac: mediatek: add support for MT8189 SoC

 .../devicetree/bindings/net/mediatek-dwmac.yaml    |  77 ++++++++++-----
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 109 +++++++++++++++------
 2 files changed, 135 insertions(+), 51 deletions(-)
---
base-commit: 474cff6868129755cf889edf40d7f491729fc588
change-id: 20260703-dwmac-mediatek-mt8189-9dafe3984951

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
