Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1hXVD0XXHmoaVwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Jun 2026 15:14:45 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C0762E5E2
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Jun 2026 15:14:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=LTbeSodt;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8652C8F273;
	Tue,  2 Jun 2026 13:14:44 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013037.outbound.protection.outlook.com [40.107.159.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1771C8F286
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jun 2026 13:14:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivQbeHdIVJzVvdDh0Bs21EGJozBVWvinQhiNerw0INVYqez4bdrA4i2pp82KBpeiC15RSyyklmRqahABoxUjQtBt5qHZ9BXMhmvy8FBluYqx/TileJOJJb05WoXkJquKEc2aEYYRKfEOMOx4OIL0iBEiWvuf8fl1JxPq5kSvfTfvay9r/ggBTokXmVzAOROmEMKwT/Lwr6PS+H+RlJF132ly+4FWTo+GVsUgiLlt4ZevRsHeQ+7IL32YcEfBoUSPBwSWdXwVw/pWVHGtXlzEBIw/L/+sH4/FJcaUmtN4TrGsXO0PL3vmzBDCb/uvYAKEQZ+99CQ3xnB7Kv7NBP7PWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OIr+Ol0Hv8QsnTiXbFuxu3dwRP80a5F0HF6qg8A0vs=;
 b=pkpOD9ZuJtzzqAikTecnGn7sUaezdWyyTm+psN99kHyEvTGu57Z1FBkb7DOqoK/3SXiiDOxz+J47Y6aTwLwjw5dfk3bw2chfyWaOPCRjwPINfblL8Vy17uh7Zu3Ol/oo3fXuryEJ/v0/O/qg2sZHTKzCOy0EdXmZKgsDhZUc+ZfWDRlK2RnIokbbfwVpeywY8G1ssJMUZ9l8wgq7oSBsT4pQ8waDsic5jahQG7o9TxI8dfcyNRZdzrie32hb9LfUckJAG4MUnllEn6FTROTuuI6l6TXvuHSDEjOTBcYzUZgQ82TbT0JthO0ADs7Px2kQLBs0z2cXYitvhejgUAjCUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OIr+Ol0Hv8QsnTiXbFuxu3dwRP80a5F0HF6qg8A0vs=;
 b=LTbeSodtY0PRZNxbib4By439eFfKEqSJhPXNMY/OyngwaWfbzkRqUOiUzcSQjUgC0HceG5GzolSNR4su8r3IWEI4DW3zm3x5kT6puxUk3Fyy7s7Cr4V5tP41dqAdqlUvkcvyDOIU2WGB4y/RKf7ZMNFzAePmaO7FWMQ+IGNuBKP61ldlw4NCtaNbYazwFAerSPo+W6/J18tNQ7hcoTuq5tUHLiMx5swYScxfDBOBQiIxfNiXKmjkP3bX/vkzr0GJ3BoU7jllCghmdtkfvqI1q/bgk89L++rndhHJLUMlxWuV1yIVGVH5QN6eXmKhoedx+5jFa/oqprg7oPPZa3ZNPg==
Received: from DUZP191CA0035.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::27)
 by GV1PR10MB5891.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:57::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 13:14:39 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::4) by DUZP191CA0035.outlook.office365.com
 (2603:10a6:10:4f8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 13:14:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 13:14:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:18:47 +0200
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:14:38 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 2 Jun 2026 15:13:59 +0200
MIME-Version: 1.0
Message-ID: <20260602-stm32-dcmipp-pixel-pipes-support-v2-2-3c76b5f93157@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|GV1PR10MB5891:EE_
X-MS-Office365-Filtering-Correlation-Id: a8d503bd-f0a6-4967-af29-08dec0a8e69d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|11063799006|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: gBzoa3/npbs9DFoBMT18qGInV7jbcd6P1OUkZKJinMJFBourm5DckkTtraSvh+Le9Cqn5zsjzHdUWo+nRRZQ5UMHT+UJWqGA6gVJNCiYpUhLd4M4s4JE0hX/jonQKGaAVdDvFyRuPzS8ng2FrK6SWzigpNwqQAvNkjJwMirafqljX3PqD6ThFfTgIp5b8NvD+WU1NO9DokfKnXUEtyxX+4sXcJNnIVjkDm7m45CEWbUVehFrr2XVJejI6QE77KzLHgsuFwsMvsDsl3+jvYrC2CcadCV7h/dbJRPCivUNeJbz7Keum+X74mxebsDJHOSaHD74Tc69GGaQP93HVQ8ls6xVEcDipKb5AMoqkR1ZUay/9FxLN5bK8oWwOdBWDt0nuPw8DtwhYrNqFW9/uNQTLJBB3Qpoyr8Ec/C6Wt4e1cjKXxnFuj1LrBGEjlYwhdbJCA1YVS/KB/HPeTmCD8iFLNgJ3oNSJUqZVME0lne4RT0lTjfBpXVGn1AlBNV7d8sryemAHxRB/u8X7kw/0JioSo5ZRylWquS1pod0THXszg1DWjB4EH3j5tUjpaZKGY1z7s7Va2UgJ7A7Fw62mfK2WjmguGHTf4DIK9UJDl+7VAo/rDFXFK3x/dG0V3y7Tm91vQBRo+P2/a/pGPvib6XWHu3JCD+TUyQIMsUMcW0X7NeD4K5L8Cl66PxX608gmUqm+81vsJge4U2vWcmKVff08LJJORqC75RyjRdGnBVKGPg=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(11063799006)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pAvsOskgSrWJpmjvS8QQBts3P1dXFbuDFxKOFhaPBi4omX8u7DQPFMrrZ5xls30oGsyzUNdg4EzlnzcFgksw7VlmdUeFYOIEL44SegHCp/mrj/TwNTMSq+t5ticB7ZBb5WeKRRg6dOzZlMKZG6qoPR5tNE73BxW5aG7ayNR+MRVH4MFoMdm6yNFBiU6RqXmYNlqzir2ljn8Qp2FGCHnTpqu5/VCWEP2cuD2W2vAqCTJqQ29yQp0QZ6/8diyTSyDTtU3t0W6UlfFocBe8Z7QW/X/kl8gZ3SDtoUeL7ehJQ2jKe5VKgkVjgJdhBKw8vxUIbSQ+bzCgaXiJ3ppVqZrZSxf5fCz5prJh6U+ZVRkPwBm1KB5+detX7OwShA5o//sH2+LYu+/ZN+YoIYxf8Du7+BEJ7Lf+q3yeTcbC0Sxuhhhzl334OAR6fXL6uryqrYXS
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:14:38.8243 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d503bd-f0a6-4967-af29-08dec0a8e69d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB5891
Cc: linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 02/13] media: stm32: dcmipp: make
 dcmipp_state & cmsr2 read common
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,foss.st.com:from_mime,foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st.com:email];
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
X-Rspamd-Queue-Id: 18C0762E5E2

In preparation of the introduction of the pixel pipes capture devices,
move struct dcmipp_state into common header and perform
interrupt status register CMSR2 into the core interrupt handler and
share the value with each subdevs.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c | 11 ++++-------
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h  |  7 +++++++
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c    |  7 +++++++
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 395c0ea72019..990bbaaf4bda 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -110,12 +110,6 @@ struct dcmipp_buf {
 	struct list_head	list;
 };
 
-enum dcmipp_state {
-	DCMIPP_STOPPED = 0,
-	DCMIPP_WAIT_FOR_BUFFER,
-	DCMIPP_RUNNING,
-};
-
 struct dcmipp_bytecap_device {
 	struct dcmipp_ent_device ved;
 	struct video_device vdev;
@@ -797,9 +791,12 @@ static irqreturn_t dcmipp_bytecap_irq_callback(int irq, void *arg)
 {
 	struct dcmipp_bytecap_device *vcap =
 			container_of(arg, struct dcmipp_bytecap_device, ved);
+	struct dcmipp_ent_device *ved = arg;
 
 	/* Store interrupt status register */
-	vcap->cmsr2 = reg_read(vcap, DCMIPP_CMSR2) & DCMIPP_CMIER_P0ALL;
+	vcap->cmsr2 = ved->cmsr2 & DCMIPP_CMIER_P0ALL;
+	if (!vcap->cmsr2)
+		return IRQ_HANDLED;
 	vcap->count.it++;
 
 	/* Clear interrupt */
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index e5c0eda8b18a..3c3996472e03 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -119,6 +119,13 @@ struct dcmipp_ent_device {
 	irq_handler_t handler;
 	irqreturn_t handler_ret;
 	irq_handler_t thread_fn;
+	u32 cmsr2;
+};
+
+enum dcmipp_state {
+	DCMIPP_STOPPED = 0,
+	DCMIPP_WAIT_FOR_BUFFER,
+	DCMIPP_RUNNING,
 };
 
 /**
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index dd784cfcaac8..b06a4931ae95 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -33,6 +33,8 @@
 	.flags = link_flags,					\
 }
 
+#define DCMIPP_CMSR2	0x3f8
+
 static inline struct dcmipp_device *
 notifier_to_dcmipp(struct v4l2_async_notifier *n)
 {
@@ -251,10 +253,15 @@ static irqreturn_t dcmipp_irq_callback(int irq, void *arg)
 	struct dcmipp_ent_device *ved;
 	irqreturn_t ret = IRQ_HANDLED;
 	unsigned int i;
+	u32 cmsr2;
+
+	/* Centralized read of CMSR2 */
+	cmsr2 = reg_read(dcmipp, DCMIPP_CMSR2);
 
 	/* Call irq handler of each entities of pipeline */
 	for (i = 0; i < dcmipp->pipe_cfg->num_ents; i++) {
 		ved = dcmipp->entity[i];
+		ved->cmsr2 = cmsr2;
 		if (ved->handler)
 			ved->handler_ret = ved->handler(irq, ved);
 		else if (ved->thread_fn)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
