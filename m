Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHZzHFaIwmkAegQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2026 13:49:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E362F3089F3
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2026 13:49:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76844C87EC8;
	Tue, 24 Mar 2026 12:49:25 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013007.outbound.protection.outlook.com
 [52.101.83.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22631C1A97C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2026 12:49:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgNxVsKoIUBN/RWgZPseDvz7/FY4w8iuTtqMyVSJlx8WC+nHjzCGWDm86InXnMxs+rGAuPawX8ISa0Pu9u4bC+Al2JYXdgHyFRHM0XY6pXvr+irzstXS2rj7/V2dfCazmP7ZVUlnTMj+qlCIVEkYQRl/Ukdc7Se5GC5MT0pvHZo3ZpOmCJuLLdpQyTPNS0QJN+wf9y6y1liZVL5Vz1iHWNIqR7SFLmOp409heyjg+zsiubejMPQI0GamiFrekseUfUkC8nrDrfGezd0rwLEvb7InPKQ6kr1tOr/DVBil8+TcB7XjZOzr1zVucRWaAWxQgqc22a/N03+MH5Z88C+WnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGfyINv00ftx3QqyAVQybhVl+jVfOI2p6vgCr3TNaGU=;
 b=kYPV9c7C4AVqNDUgyd7pNKuZe0XremJ8uEkc55Oah090dBLACF6leWM7iy42hnT1xF33fHlIYaMPTlCZgj2dXk8BQZMgC5AvGk1xYe9MdOcdiOGf10+/3Yev4vObkNbQU0dJPyzfUn3go8mIzbWkKjtXDouQmwq+NUTbTI1pkii+0vEKk0YeOIKGa/sEenBFdELBzx3ZhJe7ltAFJnnr3Y/lOnbwsyEaxdzZgKJGcoJkDnho4W5DBhu9iMNzM+FBb5IZJvvkIiKr6EZVnNetVLGYyz6oeaOyBBtjeCqQBRbkGA3dhLCSkSo5U+P02mHARCPw8OhNihpTpZe9m7+Iqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGfyINv00ftx3QqyAVQybhVl+jVfOI2p6vgCr3TNaGU=;
 b=D6pSxAFvODVvmw4PXBegoQjlNHKe1AW4GyJnFV4Xz/hee4MHRCjPMcWj9EnUtUsFvDMF/N4rf4yTrlxU3fI20GR47cilD4LPTqtC6LxZmeKUttJ66GVJe0+9gbkuGTyGqYzZefKnhlRccIuUNAmp128ps0BOVxc//fmLWXQ/YvMgZTkyCT4BOH2Jo5AlHSwwQwTZBkBsmPDTbh/mWkAZrY23OxJj/513RWlwO0gjNkgZgjYpwwufOoh/epsumc2LzCzZX0K33Q0RQhn3u0FKJbz0KEJ9HpZ8+TYnIlF5O8fL0ToG8nbcD7GTgKzB8b/tb3I0DH1LbN8LEm7TguRbqg==
Received: from DUZPR01CA0276.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::25) by PA2PR10MB9175.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:416::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Tue, 24 Mar
 2026 12:49:20 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::67) by DUZPR01CA0276.outlook.office365.com
 (2603:10a6:10:4b9::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 12:49:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 12:49:20 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Mar
 2026 13:52:10 +0100
Received: from [10.252.4.165] (10.252.4.165) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Mar
 2026 13:49:19 +0100
Message-ID: <a0009da6-0793-4a72-b183-1b4fc0782d85@foss.st.com>
Date: Tue, 24 Mar 2026 13:49:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mark Brown <broonie@kernel.org>, Jihed Chaibi <jihed.chaibi.dev@gmail.com>
References: <20260321012011.125791-1-jihed.chaibi.dev@gmail.com>
 <e4146fbd-3e2e-4d2f-b042-2af006bdfefb@sirena.org.uk>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <e4146fbd-3e2e-4d2f-b042-2af006bdfefb@sirena.org.uk>
X-Originating-IP: [10.252.4.165]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9F:EE_|PA2PR10MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bbdf3b8-c14c-4973-7672-08de89a3c4c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: +IWiWT4oW4iYkktHR6zp91h35cKF4NhBLywTDNKaslDtfCRcXTYtFY+cpNGmvRNfD9F8Akj9unqR2Gm4sZzN2MvCrU+t/lyi9aXF5UcbM131TaRVK3Q+IrHVBZh0xRl1F4bXOUEdm+5+NDso3B7M7bPIRo2W7Kvvvf1fL6vjcE5ea4JC+H7Mu6YzNp9+g1uEePw9rFQuVabb1PxjPYNME7fqVdYz7sEfKGEWy8eqFWD8IJatNpg4zdCNV3n2Zf6CQKjfYJ+0yeDRuxl1PABL1886qGLmdxubtRXE3ATloE8TdDUBPNohDZJkEBOJIx4OBAwuvcLEBXxTLGAjB3PrBZhs3lG1OcYgQOPgyCyiRt9SMI5PzJuKumieIInM/0OmUKQNyJY0H8k3C0pJPc9GxwrZjwPBiwC/O1WLqdQsgnnK99ie7MhE9T0bURjA6dBX16zb827mUw9eU4y9xreFq58tRfnVuvfRYHohqNltPgYKrfs1aMq2+LodfUERxg4IEIp1uzsUE3EpbZazv8qWyApjwnYJA1P0D7Qi1OdWivsVp2X+O20OOlGuPNSyJauSZuNYdQuCkGptRxyPN3BN62L8M4Gi/KlZ8ADRIZ5997GUq25tQgReCHVyEUnXU7Qu8Xa6QrD0ZO2hjM2DDQweo+wchIwHcQWfATjANop3/NypkxdYL4lOs/7xmNJRX9G11Oakrhuk5ziEwR5W0BTp2mTSHJMnPA8r1DA9gIZsV6zwX/wlmmt3pksvugPSSPL/G+KSd9pZqo1vYqr1xs6q9w==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2zNm8phL2HHhjfDamhVuQ8P5o7qHDKZEJo9xpfCkzEGq4AQJwwHC68VgIgLo5ID3tQrsIXUnHToEYjN8GTj7xwADCWbGuRLKrFgM+AZ0z+TEmmYsB21KTdszcmCf3gLCepj+ldMSvMtPkQPL43Bb4fUnZooJD8wNTdXUOdQHFtM4jMezmWSWOeNfPKih4u6jbMXquVxcsV2LiTpCVmq4jEiBcnExLJlojaR1FgZGKP+kmnTTQpJwGbi6WGDGTcFUHzl3kBhS0NBSRYGQrq42O//EOB9I47+wfghuQroZEqALKYEoALrF9EUBirbb/O25uOsRXDJvnVFt8pAGCRAWpQr9JtRVaDVfT1lT5XE5E+JC9oZGYCzQdc+mWZSStEkQQ2gmIypR3Bp0YcNM4wHFGsK4A7JJJHckpCEA9FSjZACQQ0YDW2tv8GasP/RDHjdH
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:49:20.5700 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bbdf3b8-c14c-4973-7672-08de89a3c4c3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB9175
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sound@vger.kernel.org, lgirdwood@gmail.com, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: dt-bindings: stm32: Fix incorrect
 compatible string in stm32h7-sai match
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:jihed.chaibi.dev@gmail.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sound@vger.kernel.org,m:lgirdwood@gmail.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:jihedchaibidev@gmail.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[olivier.moysan@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid,st-md-mailman.stormreply.com:rdns];
	DKIM_TRACE(0.00)[foss.st.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olivier.moysan@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,st-md-mailman.stormreply.com,gmail.com,lists.infradead.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E362F3089F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 3/23/26 14:47, Mark Brown wrote:
> On Sat, Mar 21, 2026 at 02:20:11AM +0100, Jihed Chaibi wrote:
>> The conditional block that defines clock constraints for the stm32h7-sai
>> variant references "st,stm32mph7-sai", which does not match any compatible
>> string in the enum. As a result, clock validation for the h7 variant is
>> silently skipped. Correct the compatible string to "st,stm32h7-sai".
> 
> A web search for stm32mph7 appears to show stm32h7 as the correct part
> number...  ST people, any confirmation here?  Are both valid?

The right part number is "st,stm32h7-sai" only.
So, the fix is valid. Thanks for it.

BRs
Olivier
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
