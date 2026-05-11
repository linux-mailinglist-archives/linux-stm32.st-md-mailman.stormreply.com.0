Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBObHO/PAmoJxgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 08:59:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADC751B650
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 08:59:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D9C3C8F299;
	Tue, 12 May 2026 06:59:58 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010010.outbound.protection.outlook.com [52.101.46.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71F64C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 21:18:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yx15Yro/e938xOHheUupdSccP+1eK/WSQuRI5CQFvYmA0/4kxaAUKBvAqZZ/Q2oiFHcclw/POQLVeUDHSpBV8sDyLnOLRBcavtkfyp6DhbjtSeyf/Qb8d4ZKm+ZTw1l5ox5QUGTvERiUs0pdVW/VKv91ILCIUBmXo7q4n8Xpnxk9Ib75ox2Y1sDSJgXWr1XguH6cage+pi2XzZK6ZJnz3uvHmD1t+OYNAEKC2V2YFhKHe1vG3CULR2xRpASHaofREp3gL8E0akvSpmjiR25wnXBPpP85z8jtKFzv5ORffG1bOmHEObQ+h8KisewOjtHIZdnb5GsXV9hOZtQT9yYY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hX2neu3NHufsNJB1jyj+MLov8FQRt2+V9eSNT5YdsI=;
 b=g33bpsphNBpZCNiCG17u4AKMlvPEEIcsEcTQ2vwcVuCrlj92rk8fKZr5s+911ECShUk5SnaS6Ly0aBUE46Zv5Y/jxpQifd0NCLC4sAfqe6j0sbVVSZ8GkBIjHxuZ0i4a7cdBQiIUmXkNDnmvdvsrtvHBMdfCOdOybWnvCsoZ8eb38Bioa21vQvtzw3ErrXT9ePdxjxsJHPI5K+hpGmhZkJP+YHaRw2UsCDDeyUM4IGLEdV0IvllCBidk8ObVIPyfcXptlX6AklBc8QgZGN5eFMhny8RX3C/rJdYcBqioZIxU5L0ni2RIgCjNnyhaPySsUCkYQnbyUR4Km/riXfS7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hX2neu3NHufsNJB1jyj+MLov8FQRt2+V9eSNT5YdsI=;
 b=eVm70cS7muIM7ezcODuIvjZC4D7w2Q6PyNeiKQon6H07UoZgo+yRDRsK48XDfdTRNuGfomEWFoB0icCiTBzcX0zW/9xdagH6Wcfm0A6kugs1fxiLIhlRAtxW/Hk9k0A/0JN7qw99+EOtzuAAEwkhIgQwO28K8wIRvnCySO2tVAA=
Received: from PH7P220CA0123.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::26)
 by DSWPR12MB999130.namprd12.prod.outlook.com (2603:10b6:8:36d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 21:18:43 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::56) by PH7P220CA0123.outlook.office365.com
 (2603:10b6:510:327::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 21:18:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 21:18:42 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 16:18:42 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Mon, 11 May 2026 16:18:41 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>
Date: Mon, 11 May 2026 14:18:37 -0700
Message-ID: <20260511211841.284809-1-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|DSWPR12MB999130:EE_
X-MS-Office365-Filtering-Correlation-Id: 77c62e2e-5e45-43df-66e1-08deafa2e121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700016|1800799024|82310400026|56012099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: zam02IVYasQhRVNQ/kBuJEjMcLrWZLRRkaMx5pfEt4mY+4SDeCAPsndNZm2i+tbB5FijfqF6D7SirEqtGYASa2vJy2YqLIC1UBVoqxJOef2kgM4Z0XYowvMdf5e9T7kvHmbvs3wFOjQfkTuot1f/m9YUhKMgeFi0zpZIbbgHLM6+EhQ16KKWCp1BzfnzdUoENlklqyS+eJ2+cN4lOiqZvS4g1mgzyKLED2EZvPOf49Q3BkHuq7cHwr4oC4xnCyT+2Ah9hmYij6xnl3Gp0uZ149RdCLjmblypf88mE4utzM4OTAw0fgkEBJZNreqCBRfJl5xgbs2j4tH8PIVw1U93Ike3DybZ4N+StWhT3+foT8tvOh9ySbt3RkT+0JcOlDPw5TTOcUD+EppRqxzTZggyn6cioj6GtJ8cFmA5gcLHyDP21Uye9UUIqcTSoPR+LXLFQAi4sydkNSVUQ9DrID9pkifIIXmoxlT53a4eHBj1Oava/vGgRn8/wFeNtO+jIWePMd4/1Y5KhCvttOs/ZutVzS2VXlbHuD+WXl6WNECyvSo3DJGczGG/DLHlRwp07J5Twu6fVTwVR1F4+Mnnls79mHbdP3+YVHMYGGGCnclLH2xpnxD8f8U5p0v30H2MUYvSk9GaPXzXraAnQC4uLwADTk9SjYXDY/2/01cnEn7JfDqXkPdcFzNpOxlgs6iJOAGCuUhU1/31CyTh3Rjyt8XkHqvj4CNkHP2SQZTRqVcfnHA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(82310400026)(56012099003)(18002099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iHHkAaCw9qD/3J7chpnwzvg2BJ3pGq/1PRQz6Lo46my7hQOExihNkyiLKHw/VL1Ao8VjwI37gOhK8BKZ7GH2ZG6H481To5gs5ExkIWFUsu7J12hpPhX/lMMkyiXvAttxs7j3n8Vh12j1mYqn6NsH3OpSoeORMMcGQjWo2lxKWM2zFSn9eYVx0I95+7dBa2jWppo5rpg4dduMtBtZeNJSCmlGgjAXJqeYJqorZaFc/4QJxPrp5oq/zf6TGC9oJ9JFIIcoGeF8U7LKyQnz1seAo/cY9zxw+rMLjlp6UmQqxHhcvxA35/s5pq6iPw/eMpniQaEHVWMPWHAKYeD9G9kmkBIEu/nUSuB5cFkgfZ6DNLCmnvfGvzCuL9V8wHhk0LZVz32GJKwmYhQK1h4oZgF5oS0QUz6bNobggDKVDELzDP6H0ZFFxMie7nTs0qJ8Lj2N
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 21:18:42.8940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c62e2e-5e45-43df-66e1-08deafa2e121
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999130
X-Mailman-Approved-At: Tue, 12 May 2026 06:59:56 +0000
Cc: imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, tanmay.shah@amd.com,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Magnus
 Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/4] remoteproc: cleanup shared carveout and
	resource-table helpers
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
X-Rspamd-Queue-Id: 3ADC751B650
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[amd.com : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[amd.com:s=selector1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelin.stm32@gmail.com,m:geert+renesas@glider.be,m:tanmay.shah@amd.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:patrice.chotard@foss.st.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,st-md-mailman.stormreply.com,gmail.com,glider.be,amd.com,nxp.com,pengutronix.de,vger.kernel.org,foss.st.com,lists.infradead.org];
	FORGED_SENDER(0.00)[ben.levinsky@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,amd.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo];
	DKIM_TRACE(0.00)[amd.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.levinsky@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.654];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: add header
X-Spam: Yes

This series is a preparatory remoteproc cleanup split out from review of
the AMD BRAM-based remoteproc series.

During review, there was a request to move the duplicated plain
ioremap_wc()/iounmap() carveout callbacks into common code and to
factor the "missing resource table is OK" ELF parsing path into a
common helper as well. There was also a request to send that cleanup as
its own patchset first, with the AMD BRAM series respun afterwards on
top once this cleanup is merged.

This series does that in four patches:

  1. add common subsystem-private callbacks for the exact-match
     wc-ioremap carveout case
  2. switch the in-tree exact-match users over to those callbacks
  3. add a common helper for drivers that treat a missing ELF resource
     table as optional, returning success on -EINVAL and propagating
     other errors unchanged
  4. switch the matching in-tree drivers over to that helper

For the carveout map/unmap cleanup, this series covers the exact-match
users called out in review: xlnx_r5_remoteproc, rcar_rproc,
st_remoteproc, stm32_rproc, imx_rproc, and imx_dsp_rproc. The zynqmp R5
TCM mapping path is left alone because it also clears the mapped memory
and is not an exact match.

For the optional resource-table handling, this series converts
xlnx_r5_remoteproc, rcar_rproc, stm32_rproc, imx_rproc, and
imx_dsp_rproc. st_remoteproc is intentionally left unchanged because its
parse_fw() callback also builds carveouts and is therefore not a direct
match for the helper introduced here.

Ben Levinsky (4):
  remoteproc: add common wc-ioremap carveout callbacks
  remoteproc: switch exact-match drivers to wc-ioremap callbacks
  remoteproc: add helper for optional ELF resource tables
  remoteproc: switch drivers to optional resource-table helper

 drivers/remoteproc/imx_dsp_rproc.c       | 46 +++-----------
 drivers/remoteproc/imx_rproc.c           | 45 +-------------
 drivers/remoteproc/rcar_rproc.c          | 46 +-------------
 drivers/remoteproc/remoteproc_internal.h | 38 +++++++++++-
 drivers/remoteproc/st_remoteproc.c       | 31 +---------
 drivers/remoteproc/stm32_rproc.c         | 44 +-------------
 drivers/remoteproc/xlnx_r5_remoteproc.c  | 76 ++----------------------
 7 files changed, 60 insertions(+), 266 deletions(-)

-- 
2.34.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
