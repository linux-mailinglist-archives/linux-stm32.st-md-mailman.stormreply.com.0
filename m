Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9888B1488E
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:49:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 853C4C3F952;
	Tue, 29 Jul 2025 06:49:43 +0000 (UTC)
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42382C3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jul 2025 09:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com; 
 s=default;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dsr9dRbVAldNjV8JKgEZYv9SvaMuV8zTMgrBYyOwtvE=; b=Ne0VSSo1FLMDjFtkk3AAUBO5xK
 pTqhbA0WtSEWXzGsjQ9zMWPhGJPBdZs0rj5gEFVGGscS0TVlWNbFMQna8knEIof9bjUXTMcpoFAW9
 s+XZji/MfUzftQXCOFDAAebFBP60xagu34eHu5Pcoi7RvfnesdqDwk1GiARfXnyzOE21NGOdmjAaz
 ahO/BCLMzXImHsBQi6pJYKKNaKBZCDwsEhuTRoOlYrRMO3ct1crtcglsT5jvA/XuuOSYKC8QN6um4
 iGPGgbcgZOkMSbCEbbOgRvT/JyUNDjBLHYkEsm4K6DgLKcHWvshJAds9DcSVCu0g7pJy2hFKLCtpm
 4JxFgFDA==;
Received: from [89.212.21.243] (port=53282 helo=localhost.localdomain)
 by cpanel.siel.si with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <primoz.fiser@norik.com>) id 1ucKTp-00DbO3-1Q;
 Thu, 17 Jul 2025 11:00:40 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 17 Jul 2025 11:00:35 +0200
Message-Id: <20250717090037.4097520-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id:
 primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, upstream@lists.phytec.de,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/2] Populate of_node for i.MX netdevs
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

Recently when working on predictable network names for i.MX SoCs, it
was discovered that of_node sysfs properties are missing for FEC and
EQOS interfaces.

Without this, udev is unable to expose the OF_* properties (OF_NAME,
OF_FULLNAME, OF_COMPATIBLE, OF_ALIAS, etc.) and thus we cannot identify
interface based on those properties.

Fix this by populating netdev of_node in respective drivers.

Result:

$ ls -l /sys/class/net/end1/of_node
/sys/class/net/end1/of_node -> 
'../../../../../../../firmware/devicetree/base/soc@0/bus@42800000/ethernet@428a0000'/
$ ls -l /sys/class/net/end0/of_node                                                                              
/sys/class/net/end0/of_node -> 
'../../../../../../../firmware/devicetree/base/soc@0/bus@42800000/ethernet@42890000'/

$ udevadm info /sys/class/net/end0
P: /devices/platform/soc@0/42800000.bus/42890000.ethernet/net/end0
M: end0
R: 0
U: net
I: 2
E: DEVPATH=/devices/platform/soc@0/42800000.bus/42890000.ethernet/net/end0
E: SUBSYSTEM=net
E: OF_NAME=ethernet
E: OF_FULLNAME=/soc@0/bus@42800000/ethernet@42890000
E: OF_COMPATIBLE_0=fsl,imx93-fec
E: OF_COMPATIBLE_1=fsl,imx8mq-fec
E: OF_COMPATIBLE_2=fsl,imx6sx-fec
E: OF_COMPATIBLE_N=3
E: OF_ALIAS_0=ethernet0
E: INTERFACE=end0
E: IFINDEX=2
E: USEC_INITIALIZED=5227083
E: ID_NET_DRIVER=fec
E: ID_NET_NAMING_SCHEME=latest
E: ID_NET_NAME_MAC=enx502df44dbd5e
E: ID_NET_NAME_ONBOARD=end0
E: ID_PATH=platform-42890000.ethernet
E: ID_PATH_TAG=platform-42890000_ethernet
E: SYSTEMD_ALIAS=/sys/subsystem/net/devices/end0
E: TAGS=:systemd:
E: CURRENT_TAGS=:systemd:

$ udevadm info /sys/class/net/end1
P: /devices/platform/soc@0/42800000.bus/428a0000.ethernet/net/end1
M: end1
R: 1
U: net
I: 3
E: DEVPATH=/devices/platform/soc@0/42800000.bus/428a0000.ethernet/net/end1
E: SUBSYSTEM=net
E: OF_NAME=ethernet
E: OF_FULLNAME=/soc@0/bus@42800000/ethernet@428a0000
E: OF_COMPATIBLE_0=nxp,imx93-dwmac-eqos
E: OF_COMPATIBLE_1=snps,dwmac-5.10a
E: OF_COMPATIBLE_N=2
E: OF_ALIAS_0=ethernet1
E: INTERFACE=end1
E: IFINDEX=3
E: USEC_INITIALIZED=5370305
E: ID_NET_NAMING_SCHEME=latest
E: ID_NET_NAME_MAC=enx502df44dbd5f
E: ID_NET_NAME_ONBOARD=end1
E: ID_PATH=platform-428a0000.ethernet
E: ID_PATH_TAG=platform-428a0000_ethernet
E: SYSTEMD_ALIAS=/sys/subsystem/net/devices/end1
E: TAGS=:systemd:
E: CURRENT_TAGS=:systemd:


Primoz Fiser (2):
  net: fec: fec_probe(): Populate netdev of_node
  net: stmmac: Populate netdev of_node

 drivers/net/ethernet/freescale/fec_main.c         | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
