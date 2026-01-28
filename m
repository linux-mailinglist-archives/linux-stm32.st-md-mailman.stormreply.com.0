Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HmiF7fmeWl60wEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 11:36:39 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EBB9F904
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Jan 2026 11:36:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A11DC555BE;
	Wed, 28 Jan 2026 10:36:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E25FEC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 10:36:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60SAVIkj2363797; Wed, 28 Jan 2026 11:36:33 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013059.outbound.protection.outlook.com [40.107.159.59])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bxpx3np92-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 28 Jan 2026 11:36:33 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqEJpvIQa4gjKHdYMj1tk8lWV4iG5o8R7AmaayRmY0k2a27lA5FwvSCSL0d+2KoVWsh+xw0ZKPpCLsAjnEaDmOikX00gev/CH6e2LMnAmHwfmjYBPgGea5CJbvoe6KV7UHOViTfqmSdwfdzJGBe5tuIhezU4pQUQdnIY/lIAiK7GnEpgwEouTnMCexsTI52VYZY4Xcqd/aQbmgHMPw8ta8oncwFRksNO5y2qiqTPshGtvUtAmvozkggVcIghhclB5KZY4AC3lcngccZWMzSw9Z7Ndug9TdfNKMKV3JGxXkP2JndN1QKchDP135Bv6khKUR/MCFbRJnBstr6+9Nr3bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlaE+07dXlPq+BZ5VheZ/M00No/+JHv8SyqC3pXU+Xg=;
 b=YdyQdBPItJzC2/sl2V0cfGkn7mFpENvPPXickjGa0K7XbQsK2CHL0YFyNkClrMQ49JR6yKtRDohsJnN2X1pCOQM3A62RGf5Tmx2c2bKyJIOCzRRLpuriiO2R2li1ZcNgDbW0JbEPnQ9jFa3R2eOD9FJCelovlA6zyr/ynX+U7vQlSaMS7iqXkQ8iP3W0ekkMD/HVZVFl79Ub/XYXeAiAnYPVD1EOW6ZM2F4iXYn77xCAF2nApJjurj+wrGQN+/QquNLbUpgNDEBjTkjhyBvrZxszs6t3iUGL4VVbqNWJRgOztjAIedJ+pgplShO20/SWO7DQ55QbpBNlABNOM4URcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlaE+07dXlPq+BZ5VheZ/M00No/+JHv8SyqC3pXU+Xg=;
 b=muLKINoE0FAeMZ5w1wipcWrWrJWKCtSDG3MRJXec2Xd6OEz6roEAVoFcEQZE66iXe0OEzQn7a1BdAOZwNb1km3rAyTSX3aQEqS3oHXQKSV1IaOSyyf+vaR5Bbax2VcDsydciYAAcb1Bzu3C35jvl/PhBt/5nCrFTzUl87gQcGiz+C8gU40zyyPa96zIQFgNA3lQh1haok2qqmrZkFFBceURlm9A8FCFRGl3cTPoyIqpZ9RGpIDSZ02yC1ZkVFrWZ2cDO7aP+Gm5PG6Zdu18kqR3T95PFpCvzRJVk4xbaJDHh+zxLLHuKtxkwWMlAtjrdc1TJA8ixMF1KOtXu3YmvZA==
Received: from CWLP265CA0508.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::6)
 by VI1PR10MB3725.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:138::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 10:36:31 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:400:18b:cafe::26) by CWLP265CA0508.outlook.office365.com
 (2603:10a6:400:18b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Wed,
 28 Jan 2026 10:36:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 10:36:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 28 Jan
 2026 11:33:04 +0100
Received: from localhost (10.48.87.127) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 28 Jan
 2026 11:31:28 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Date: Wed, 28 Jan 2026 11:31:18 +0100
Message-ID: <20260128103118.3630078-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128103118.3630078-1-arnaud.pouliquen@foss.st.com>
References: <20260128103118.3630078-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.127]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|VI1PR10MB3725:EE_
X-MS-Office365-Filtering-Correlation-Id: bc1967d8-e87f-44c3-fc3c-08de5e591984
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?axbYQgK8eulFcGiY1pGexG2u8D/vf/JnZ3l8x/OH46VrcLx5xKRdLyBX28Ap?=
 =?us-ascii?Q?ziSO/VxjDIGBg4Suowj6kiyDzSyEq0bVgeOzuhtz2e8N2lU4CPlAJe7vrj4t?=
 =?us-ascii?Q?zVYY077wrYte6gvkOT5bpnNm5HHHvjvl/ivBjAqt07KCdYVm+S6FSsCS4JDp?=
 =?us-ascii?Q?ChaYYR73o9+FWNgJvxAYwsCs3g1p0hSk4Mrb1BZb6JymCxMIgeMMScBv9wW9?=
 =?us-ascii?Q?v7eFcd12Wl/C3ji6OYslm63/S33JtULW9KTTnihf845Vghavt9rIRF93xlZu?=
 =?us-ascii?Q?o15FMC5ZEMBiFFbr7GWwPsXbiRi3O7tD/LjQDOG6Wn9KwnNHafNfeaaX8lz8?=
 =?us-ascii?Q?Je+p4z66qXcsRD+osh07PqKWfJVhGkwlQnb1Z8IMKqc7dF/PVlvSI+yfn7Xr?=
 =?us-ascii?Q?F6ozhb1V8ddGUJ0f72XwGQflq8C1g503y5jwwmBJ7dM2Ptnbv3ubGbEI3sZj?=
 =?us-ascii?Q?NcKcgtM0F71hn5CrPuBNxGaWKem6nSaDJEiRfGyJ4Ir9SqZKfzjj47pI1Rrh?=
 =?us-ascii?Q?R9T3B36MBcsY/ZU3n0xpv32LF+seeLzydxZiqYF+TiVUDGagDJQZcokbGrag?=
 =?us-ascii?Q?w3lbS2smyC4sDYM62mMZYk5W7yw1oC4vrvBTgyhG7Z/kVwwfzu0Vzk4ZO3Wo?=
 =?us-ascii?Q?5vXXWeKjKWiwcSIuhMaj9NxlFnjFfaDXDjkskL5QU6P9qGhCwTrchEiXUbls?=
 =?us-ascii?Q?9gBMU5AW1kzE2nt7vnECjVO1RIZfYgiX55/xWFHfjC7TP1dRXASxZl9Mhegg?=
 =?us-ascii?Q?e4ywG6bIL8yWHAdp1R9naCEo2KPVIWEO2e1lcDQUn331Mjot6wB0WpYaRoAz?=
 =?us-ascii?Q?DW5cDUilxg2CmJdvqVEEWhtWQDuKZJPHhwEjpW/X6S3dS4ueWccNbwS7jcy9?=
 =?us-ascii?Q?kWMne5bDgOYhx8K9su1mD8mXpkQSy+lTWtd9Ltm1wagAjqyCKtDk9lhvQGBn?=
 =?us-ascii?Q?rT/ID3BzdyX8jNPF96geZZEdYXMJqakv5Uorw3gVayJsA/N+/uh915D11k7j?=
 =?us-ascii?Q?zUU4H5ZEsYzQiexkkimLnMbPmzPdK1jmjDiVp3R6CredTqYMvoNAhmOT291S?=
 =?us-ascii?Q?5vq7H9WnXgN9rzabKB7q9nbj/FZzozomwH6TY9CyU0t3U89o/Tvd3CDzls6o?=
 =?us-ascii?Q?GmlsX+vel6bgOcKS9wKovFUaEIvJGP0EHZUHVBJbAGdI3FlPkZLtfhVtMMql?=
 =?us-ascii?Q?vJ1tJNEyDoigidOzZ5oSL2FO5w7MF70Gvvx5JlHq03325dwMxMRcPDmoDCta?=
 =?us-ascii?Q?xNVGyEuhXM/BcCASNcmWvlqnFdARlncc/69alm1nYrVeYn3aNxTXrxsG2fYU?=
 =?us-ascii?Q?yVJuP6uNyR64OzbJw+FNym8p0oFQwvlLZLeExBZF//+h9XsuSkuG0xt9pmnl?=
 =?us-ascii?Q?IZ4Z6I4zY+6ufrRB4q9pswerN2CRLD6uwHmklqJSD4NWRjE2hYIih3zGBNvt?=
 =?us-ascii?Q?+jL+IrAdRbM+/ZaFfg/HrticKZiwvEFRjCx6j95al4b6eo+j8xeJMHS3NCJ8?=
 =?us-ascii?Q?use19iuTFvzGrX+n7Uc7TeRZEl3OE6nO8TX+J+3wN54hliYoWbTG7WvH89Ss?=
 =?us-ascii?Q?Ad5FkNk96KI5AYQpeBjJzCCFdod8kAJzgWnszb355vinHob3ZuHNzY6xlzCz?=
 =?us-ascii?Q?6/AdMdf7GtQ7kzFvjbnt6c/wi0dPkwWGcIpNmTaYJ++Xyd2G4KklP5DOsIyA?=
 =?us-ascii?Q?+6jAsQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 10:36:30.5649 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1967d8-e87f-44c3-fc3c-08de5e591984
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3725
X-Proofpoint-ORIG-GUID: HNXie2d7XsCGck-g38bn2y2E6tnw2HEu
X-Proofpoint-GUID: HNXie2d7XsCGck-g38bn2y2E6tnw2HEu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4NiBTYWx0ZWRfX+2dFRBuJmdRG
 F9Qu5kFSNW5hkhn2JLNNh5I1+Qa5HaazTDnJSK50QY7/DhKFnXxzVLKraXdHZJbjJLUQSGVgNsd
 vdF8GNUza8U5pJA0FUwjfWggAvLlKLCtbuOYjYa129irI88xr/akQhRYg3U79hjHQq34GF8k81W
 2qWwmeRYj+ptvzcNx7DQhoHQjTYsMcuQmOcU9woxK1StOBRPkTvwGRjOZK6yBBw9Dhj29p0Wtj7
 qjFsI1bXMd/8gc5oM+BC9/0Zhl/jzf3pUXczNgh9uEKdYRrXv06iMkS7iWVHi5UextBKtSygOKe
 pUd0d0LAntjBGHBO6zyLAGor6FzFfgFL4oDP3978o+JhdwqA4dhfEN9ftOQdJw9uAPfZXjkj0c+
 IbUO6TE3eGsfPP8P5w3KZdD7onc9bDLkXfTOKSstYNeS4gLAq7C6jQPJYhcVSVywV5stwg/WeAJ
 bcs75hWN0jvq2BdLQGQ==
X-Authority-Analysis: v=2.4 cv=DtxbOW/+ c=1 sm=1 tr=0 ts=6979e6b1 cx=c_pps
 a=wn3I2JnDdEmzcqpN0poLFw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FOPVHIcnkjUA:10 a=vUbySO9Y5rIA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=S7MTHWEomJz8aAjC18oA:9 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280086
Cc: Andrew Davis <afd@ti.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 2/2] remoteproc: keystone: use RPROC_ALIAS
	definition
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.89 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:afd@ti.com,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A9EBB9F904
X-Rspamd-Action: no action

The RPROC_ALIAS definition was introduced in remoteproc.h.
Reuse it for of_alias_get_id()to to align alias handling across
the code.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/keystone_remoteproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 4d6550b48567..cf8288d17afd 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -378,7 +378,7 @@ static int keystone_rproc_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	dsp_id = of_alias_get_id(np, "rproc");
+	dsp_id = of_alias_get_id(np, RPROC_ALIAS);
 	if (dsp_id < 0) {
 		dev_warn(dev, "device does not have an alias id\n");
 		return dsp_id;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
