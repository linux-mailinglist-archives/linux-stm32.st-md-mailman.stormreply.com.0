Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +C4hK3baCmoi8wQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:23:02 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F7C5699A2
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:22:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A280AC5C842;
	Mon, 18 May 2026 09:22:59 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013031.outbound.protection.outlook.com
 [40.107.201.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 990AEC8F289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 16:21:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9HYphc26nKgm8bsLNR3w+ZgNiYPv9abXEWoUW6IHFI+bZiwOioCEPft5+V5M9IvccQV81+zS4GeZPWjpkMrPLfmJm7GHoJzGwW3IomBVdTYlHAzglJzCmlji/x1aHxYMAdL72C4CWOfHNdlEm8Pep+eUSdb7kkhICES+t6XQgBgGYSCTUSOODeiMTpVwYXheSandWZuaZM9ke6u2sjEvVbpYfvdJYjXCqzSkuvBKAtahzg6INLhIIhN9xPyWR0l9FebviVyX+roWL/DXUKU8BzwvFagmSHTZPv+bsIoW8kbkeu8QYzJWpCPrzszgix/IfIVHDdABMeQmN5i/yo8Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGlAdHN3po/lNXsgP53RPBEk/N60pGPyWPruKCyHYa0=;
 b=EGEIrxQs1V3wV1uwAoOU9VFS1KPKYvlyXmW914lAHJrNIZI+J573xy0eL11FrXXMWlW+xS4wl2kuT0TyV9Tip8nk/NadZ8ta2iclWgzTvkN0PGk4pat/M1wSRrnfk0giP9Bn9EjW+RKGu+a5ZvAgdWapOI2KBtdqK22iPx22zAOHeYrIr4wHUC6u9QJkD//BGGxgG8cwVJ481ymL+/w7PoPRVZEc8ffUF57huqR+GRcPrUTL3i7/6MKQI74tm4ROmTUE9b/pxc3Jjl2SdpEyUn0VHUw1QMs0CeOmb+vrrwBgiWzx7QFD3ZkvPOmLh/JQFz4QGN/RUIpRs2B2kPmsTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGlAdHN3po/lNXsgP53RPBEk/N60pGPyWPruKCyHYa0=;
 b=IW7Dvx5DiNoekyoSYX+LKiStkhasrva8FMo9jH/0b3oViAwKrzudMw5rAPOdv1+j+tpOHpQOgWkrGz436zjjP53IkZ9Dv6HGhBDqNS06ayA4RnDdhxjOuhbvOIuM6dYDg25FVj0N632gXQ+82L7RMeIdLQ6rcWgm3P9y0L53OV8=
Received: from BL1PR13CA0370.namprd13.prod.outlook.com (2603:10b6:208:2c0::15)
 by DS7PR12MB8369.namprd12.prod.outlook.com (2603:10b6:8:eb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Thu, 14 May
 2026 16:21:36 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:208:2c0:cafe::2a) by BL1PR13CA0370.outlook.office365.com
 (2603:10b6:208:2c0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.16 via Frontend Transport; Thu, 14
 May 2026 16:21:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 16:21:36 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 14 May
 2026 11:21:35 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Thu, 14 May 2026 11:21:34 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
 <linux-remoteproc@vger.kernel.org>
Date: Thu, 14 May 2026 09:21:28 -0700
Message-ID: <20260514162129.1504162-5-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514162129.1504162-1-ben.levinsky@amd.com>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|DS7PR12MB8369:EE_
X-MS-Office365-Filtering-Correlation-Id: a5685b77-166f-437a-3629-08deb1d4dec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: 5FWXrJifKcoh614oVYX5KaG7pOkqIFIvOED7natZ35A/5V4SDx8H2X5ado27WQb2jIW45AHaXuDpWia6t+GewwiYDwiVLPqqayrbt9TJIW4V4IAik5tZxYy0tFfZ6PNdTOCjVHd7z4dBF72rn6nIUkcO5vs2wTCAwLtJw29SvekwmmqEYVqcQr2hNltPf3Gxes81wFKARt8X+4rLqAEcTIhtpUKJ6g7R91mYziYYhd9YsvtwcDP5tzZhS+mvhpOYO+g2P4W9jtZIImv1L3gvdIJuTwrYH4TDdaeilqIbft/Qx/BNpCBtxUZz6S73/HUeb29h5p46pkUigHhFYz7mT27JvdSpt9dhQhWlOquLtSdiXav6PiEdBXMvwiFMYtLdF2VSiQ+FvmHSUhUm/+CkAdgodiPwZOHLZMsOlyFW2O53foi/4pFcHcoeLsIqAv8ySs1ZY6MvYEMKoEbmXZNP9jUpWKi/is+a3klCAxbywHuJ85PCe63wC6gRVBC43Ei641mZNep+MR/Fpvs9DltN2guRQUB5xZk8cAhniMPKMcKO6vYNXyXeOWDv2LYsL0c/+qhXXn7b8tBnwXB4H0p1TmjWk1elmCp2JEZhKfpEq7nPjtYrHGijc9HWB8lLODMZu17/VrTTkLCeeRn/Ujll5RktDeReoFcZYWQ1yQ+1sK1GrW9Zlo85uNvvrVQllMrSPtT2oHV/y2+hlA1S6+O/WbHCkMjIs4k+4GvgRlMYspE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kf1wi/+F+JV914SVV1r6LsKt13xJazdMmzoWPPUnVGGkqzRR8RwhnsKlc6luwyYN7Pnv+WAvtesdVV1t9G9cgn6VMrxOWHdYumaJKPdubpSwAtP8zkI3K4wIbXLDVPFFoj7YGR9+wS9uvsf+wuCKuEsDBqkELqQeOoRP7WmS+6zgK1EzbDQNgfOz4EW1ZbXpBKqLYxvEVexBxYnLnh+BJM71WrCOZnJ+alpjMFoGsiNjOib5zZenfzTUzxmIsJogEVFh0fj5g9HhrVmGZlwKGMmgqgQtmvsy8YEixklsfC2YdoYNnBO2YEIgSlja7/wQhh/GtdOwGRZxi2+WX7DEuAkl+UG99d9gxo+wX1qyvheW7Tc0+OLst4puyi/bcqwsALlOViHeFDFK4Ei/ecb42LKGC7rwxQOroRMLeZ/5leRDsd8WSC8cVhAgp3BpeJ63
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 16:21:36.1083 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5685b77-166f-437a-3629-08deb1d4dec0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8369
X-Mailman-Approved-At: Mon, 18 May 2026 09:22:57 +0000
Cc: daniel.baluta@nxp.com, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 geert+renesas@glider.be, tanmay.shah@amd.com, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, magnus.damm@gmail.com, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/5] remoteproc: add helper for optional
	ELF resource tables
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
X-Rspamd-Queue-Id: 72F7C5699A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[amd.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[amd.com:s=selector1];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[89];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-remoteproc@vger.kernel.org,m:daniel.baluta@nxp.com,m:imx@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelin.stm32@gmail.com,m:geert+renesas@glider.be,m:tanmay.shah@amd.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nxp.com,lists.linux.dev,st-md-mailman.stormreply.com,gmail.com,glider.be,amd.com,pengutronix.de,vger.kernel.org,lists.infradead.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[ben.levinsky@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.levinsky@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.770];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: add header
X-Spam: Yes

Add a small helper around rproc_elf_load_rsc_table() for remoteproc
drivers that treat a missing ELF resource table as optional. The helper
returns success on -EINVAL and propagates other failures unchanged.

Keep logging policy out of the helper so platform drivers can decide
whether a missing resource table should be reported and at what log
level.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/remoteproc_internal.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 9955e512f073..565b35256945 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -149,6 +149,15 @@ static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
 	return 0;
 }
 
+static inline int rproc_elf_load_rsc_table_optional(struct rproc *rproc,
+						    const struct firmware *fw)
+{
+	int ret;
+
+	ret = rproc_elf_load_rsc_table(rproc, fw);
+	return ret == -EINVAL ? 0 : ret;
+}
+
 static inline int rproc_prepare_device(struct rproc *rproc)
 {
 	if (rproc->ops->prepare)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
