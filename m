Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RixvAkvXHmolVwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Jun 2026 15:14:51 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B164762E601
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Jun 2026 15:14:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=UiuBpdPv;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 704DCC8F281;
	Tue,  2 Jun 2026 13:14:50 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011026.outbound.protection.outlook.com
 [40.107.130.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0BF9C8F284
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jun 2026 13:14:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRlGSN/5vJzM2DRZxtKgl2jnZKZIIgTtbRC/lPyC+XeE5pi//joCuYm4PLvrX2J+rCkMGCCrWJFbSsP6ppr9gxfUIsr3kftqCc6wbeU9BsVZYClwZBo31keUd2FaOXsaB/DdBGvxnBRXa995I0TIsoXgTiO31yWcaCvS1YT231qi4vJX1a08K0lDZ5tbo5EGNtAJKamiox85tTljeUDywxAziIKGZxfA67Km6e8dI7fcDSz0Dwv6bygvSiWpSS6aHpYvyIYzjEvs2oBSlJyuGybUnopgu87WVsqfXKxP4MBWHNvhPEcpPUAyHrEAxkkAMj43TZuvByi94Ra0tKvsmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9U9fAafd+i+cYvRGur2GDvAzfW7Bee4/R77/1AC/KB4=;
 b=iTTM1h0mcfGhPrE3QbtixMi8FoyfF4jQ3iHsCzyFznc9UUdV7MGQUZhvo/du5ZI5vp0rMvpkcS2U0UaEEunJ9Mbmoj5N3NnIMOVEjJX4LMTPZ54rHLGTIBpXjVNinLjzk6h40vov9jcC8aaKO96gvrmHAAZz7QWlFituWN3pIKuGF2iGYyRBJ3C0pv3Fvh3KF1TCcOd/1zPhBSOMxcMqR3Vlao6o7AXSWP16KZyB2LQV9eSRl4h0Ul0HFVQuwgrwdd85uAmAuuklfYG4Il+ukjmbx5rR6aVoDfZlQjzcIE8DK0aYl1Vqyevmdm3i2RHzkESAinWJB60IB/N1x0CVXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9U9fAafd+i+cYvRGur2GDvAzfW7Bee4/R77/1AC/KB4=;
 b=UiuBpdPvibVpnxpy8VsUSASoZHBrcyJMHVLQzD7nVSrsIW/Pu8fDgsnLwYAOVPtXmONCmc/WFSctHWwav/LkPvw56QKET5N/F+qzA7I3+X9t2kq5GZSflrZN3fYpUB2AKCH8owNHcmWgeAz0PsyzwJGWZhTQM6h+BzKjZGW2OzADh/MgkRT6xGemDmJVE8ernydvrQRhVPGdBQ4CGi4h0GbWliwdErpOigK6qv/7AX4Su7Lv4YlQjrwVrFBNXuAFRwP9cFe85uPhwXEK1H8h8vp+1WmhDwBXo4v2drJN9GK66Q+Bqzqu5IW3qRYb6DnsQhIXCj+qKmlFj/unrvS95g==
Received: from CWLP265CA0458.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d4::18)
 by GV1PR10MB6244.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:90::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 13:14:41 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:400:1d4:cafe::54) by CWLP265CA0458.outlook.office365.com
 (2603:10a6:400:1d4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 13:14:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 13:14:40 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:18:24 +0200
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:14:40 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 2 Jun 2026 15:14:02 +0200
MIME-Version: 1.0
Message-ID: <20260602-stm32-dcmipp-pixel-pipes-support-v2-5-3c76b5f93157@foss.st.com>
References: <20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com>
In-Reply-To: <20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000195:EE_|GV1PR10MB6244:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dc16599-d082-430f-1bf5-08dec0a8e7bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|376014|82310400026|22082099003|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: UAPhQMbepX6H7KIvaTEyNyPVn+G1OGCvSAunBeI6ewgq/WdOafSd0XddpM9/lpP5FPm2dyYUxJMvlX+aoSNEc8iyvGEFlhq2lpGtFXBg64f8jQovNPUuEB5U0hyGsSv9hAt49QYHpa7023hgJt2EJ1amr3HPXDylz1fyrKI68vzjAUYjNALZkQ6lAqrf0fwIrjRAsrmBKbLFgRTqZiR51quGUC92LXuu1zJib7jcZqYPQU6x8468CCfjktVwuSrRjy3mYoLYdsngEZaFCLUJlYZakMp1tLMdVmaTO/b34UE/qFdsWYDsNq+67ET9box3oHez6t8rUBCZgeIo84lxoswTn2qi+DvCRSTnpEW8juFgxHbNmpjWqmtVugVAEEClrb/tZPXrN70Coq6J78AhWf6ha6ud5Tx0X+S6suPFZmdSGGylTgLmEf99qukrQ/VOrA8OuBK4e8u0axYn2Y/n+IWwtfLYyBDgOtTJwmGM18fNtN0Pe6DL2OSjmQmJXWBr7wvnn2esq8NLA3Z+hcX7JQiCzIz994gV07/VAxKLrBT1GudxnaVlNGaJIFaI44k3nuVcVWY8Z2YK72ZGP+ykgcf52g3qPoFSw4+bF8uBhwYLZzVl+XAIMSCJquDKURPrQav4ZpRLVLXKhddtFwAy3r0xn8aEzHY6hbYH16kVsFAhQVZ+BrDyn6lomN/t9WtVSHRStx2hr2tEXPyPUxJpTES6326TPEFC5/meXFO14SI=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9MWW2gdTPJrkRF8SKelKN6VIySXjurehMUuFDGSpER5+6QXu+S0YlX4fBoGe+kpCJclYZKSqmGns4b1T0736LGW4+KIs61Wu47XDQU9yJG+QRUnK773XOh/GiJ49MypL77pcoBvDxE4PwVuBw6d0YexFaL6ALxBZNFJkbnkwxUcfWF510BoNl+9CNKlW6ArtP5586w9ZoRY22SaaOE37ZWZ7K4hxTMBj/12ccukMPqT9TvCZQjpB70dFOY1Hp1AI/y+6aD1MlinQP3A8zU38eJOnjuf4KBccaLGerywB0CKoYxs/ORUmev+DgkqCoeo08qQfGV1/1FbE+SpoCtDILWyda9WICJXj9FJK5rYZ2mH8ZALcHk+gcwGLJbCwmKTn0MYxAFdBeorCiNUlZ3JiEWKGCIZZAERTm+qWvjDQbVNBuCHxgxyoKnf2Ofc6mMl9
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:14:40.7163 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc16599-d082-430f-1bf5-08dec0a8e7bb
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6244
Cc: linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 05/13] media: stm32: dcmipp: correct swap
 in YUYV data with parallel input
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hugues.fruchet@foss.st.com,m:alain.volmat@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-kernel@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:from_mime,foss.st.com:mid,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B164762E601

When used with parallel input, the DCMIPP is expecting data to come
in YUYV order (for all DUMP/MAIN and AUX pipes).  Not doing so will
lead to bad color generated by the pipes when processing is done.
The DUMP pipe is also doing by default a swap since, while it accepts
YUYV data, it will by default generate UYVY data.

Current implementation is not correct for parallel input since it is
performing a cycle swap on the input side and since the dump pipe is
also internally doing a swap, the data captured from the dump pipe are
correct, while the data captured from the main / aux pipes are not.

To correct this, only perform cycle swap when it is necessary, hence
changing from YUYV to UYVY for example, and for all parallel YUV MBUS,
add the P0PPCR based SWAPYUV to put back the data into the ordering of
the input.

Keep previous behavior when the SWAPYUV is not available (such as
stm32mp13).

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        | 16 ++++++++++++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |  1 +
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |  3 ++-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 28 +++++++++++++++-------
 4 files changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index 5fcd5123136f..f61618e12322 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -25,6 +25,7 @@
 #define DCMIPP_P0SCSZR_HSIZE_SHIFT	0
 #define DCMIPP_P0SCSZR_VSIZE_SHIFT	16
 #define DCMIPP_P0PPCR	0x5c0
+#define DCMIPP_P0PPCR_SWAPYUV		BIT(0)
 #define DCMIPP_P0PPCR_BSM_1_2		0x1
 #define DCMIPP_P0PPCR_BSM_1_4		0x2
 #define DCMIPP_P0PPCR_BSM_2_4		0x3
@@ -428,9 +429,11 @@ static int dcmipp_byteproc_configure_scale_crop
 	if (!vpix)
 		return -EINVAL;
 
-	/* clear decimation/crop */
+	/* clear decimation/crop/swap yuv */
 	reg_clear(byteproc, DCMIPP_P0PPCR, DCMIPP_P0PPCR_BSM_MASK);
 	reg_clear(byteproc, DCMIPP_P0PPCR, DCMIPP_P0PPCR_LSM);
+	if (byteproc->ved.dcmipp->pipe_cfg->has_swapyuv)
+		reg_clear(byteproc, DCMIPP_P0PPCR, DCMIPP_P0PPCR_SWAPYUV);
 	reg_write(byteproc, DCMIPP_P0SCSTR, 0);
 	reg_write(byteproc, DCMIPP_P0SCSZR, 0);
 
@@ -451,6 +454,17 @@ static int dcmipp_byteproc_configure_scale_crop
 	if (vprediv == 2)
 		val |= DCMIPP_P0PPCR_LSM | DCMIPP_P0PPCR_OELS;
 
+	/*
+	 * Perform a SWAP YUV if input is parallel since in this mode
+	 * the DCMIPP will swap YUV by default
+	 */
+	if (byteproc->ved.dcmipp->pipe_cfg->has_swapyuv &&
+	    (sink_fmt->code == MEDIA_BUS_FMT_YUYV8_2X8 ||
+	     sink_fmt->code == MEDIA_BUS_FMT_YVYU8_2X8 ||
+	     sink_fmt->code == MEDIA_BUS_FMT_UYVY8_2X8 ||
+	     sink_fmt->code == MEDIA_BUS_FMT_VYUY8_2X8))
+		val |= DCMIPP_P0PPCR_SWAPYUV;
+
 	/* decimate using bytes and lines skipping */
 	if (val) {
 		reg_set(byteproc, DCMIPP_P0PPCR, val);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index 9e7b2434200a..2d26425b0b0f 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -118,6 +118,7 @@ struct dcmipp_pipeline_config {
 	u32 hw_revision;
 	bool has_csi2;
 	bool needs_mclk;
+	bool has_swapyuv;
 };
 
 /**
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 3a0a4df410d8..9aba16096d28 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -108,7 +108,8 @@ static const struct dcmipp_pipeline_config stm32mp25_pipe_cfg = {
 	.num_links	= ARRAY_SIZE(stm32mp25_ent_links),
 	.hw_revision    = DCMIPP_STM32MP25_VERR,
 	.has_csi2	= true,
-	.needs_mclk	= true
+	.needs_mclk	= true,
+	.has_swapyuv	= true
 };
 
 #define LINK_FLAG_TO_STR(f) ((f) == 0 ? "" :\
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
index 564f37e2e1dd..75421035cfad 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-input.c
@@ -80,15 +80,15 @@ static const struct dcmipp_inp_pix_map dcmipp_inp_pix_map_list[] = {
 	PIXMAP_SINK_SRC_PRCR_SWAP(RGB888_3X8, RGB888_3X8, RGB888, 0, MIPI_CSI2_DT_RGB888),
 	PIXMAP_SINK_SRC_PRCR_SWAP(RGB888_1X24, RGB888_1X24, RGB888, 0, MIPI_CSI2_DT_RGB888),
 	/* YUV422 */
-	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, YUYV8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, YUYV8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
 	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_1X16, YUYV8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
-	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, UYVY8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
-	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, UYVY8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YUYV8_2X8, UYVY8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, UYVY8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
 	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_1X16, UYVY8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
-	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, YUYV8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
-	PIXMAP_SINK_SRC_PRCR_SWAP(YVYU8_2X8, YVYU8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(UYVY8_2X8, YUYV8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(YVYU8_2X8, YVYU8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
 	PIXMAP_SINK_SRC_PRCR_SWAP(YVYU8_1X16, YVYU8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
-	PIXMAP_SINK_SRC_PRCR_SWAP(VYUY8_2X8, VYUY8_2X8, YUV422, 1, MIPI_CSI2_DT_YUV422_8B),
+	PIXMAP_SINK_SRC_PRCR_SWAP(VYUY8_2X8, VYUY8_2X8, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
 	PIXMAP_SINK_SRC_PRCR_SWAP(VYUY8_1X16, VYUY8_1X16, YUV422, 0, MIPI_CSI2_DT_YUV422_8B),
 	/* GREY */
 	PIXMAP_SINK_SRC_PRCR_SWAP(Y8_1X8, Y8_1X8, G8, 0, MIPI_CSI2_DT_RAW8),
@@ -356,8 +356,20 @@ static int dcmipp_inp_configure_parallel(struct dcmipp_inp_device *inp,
 	val |= vpix->prcr_format << DCMIPP_PRCR_FORMAT_SHIFT;
 
 	/* swap cycles */
-	if (vpix->prcr_swapcycles)
-		val |= DCMIPP_PRCR_SWAPCYCLES;
+	/*
+	 * Table dcmipp_inp_pix_map_list take into consideration that SWAPYUV
+	 * bit is available when dealing with 16bit YUV formats. If it is not
+	 * available (such as on stm32mp13), swapcycle setting should be
+	 * reversed
+	 */
+	if (!inp->ved.dcmipp->pipe_cfg->has_swapyuv &&
+	    (src_fmt->code == MEDIA_BUS_FMT_YUYV8_2X8 ||
+	     src_fmt->code == MEDIA_BUS_FMT_YVYU8_2X8 ||
+	     src_fmt->code == MEDIA_BUS_FMT_UYVY8_2X8 ||
+	     src_fmt->code == MEDIA_BUS_FMT_VYUY8_2X8))
+		val |= (!vpix->prcr_swapcycles ? DCMIPP_PRCR_SWAPCYCLES : 0);
+	else
+		val |= (vpix->prcr_swapcycles ? DCMIPP_PRCR_SWAPCYCLES : 0);
 
 	reg_write(inp, DCMIPP_PRCR, val);
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
