Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2429F8725B6
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Mar 2024 18:33:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDFCBC6DD6E;
	Tue,  5 Mar 2024 17:33:13 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2074.outbound.protection.outlook.com [40.107.14.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A32C9C6DD69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Mar 2024 17:33:12 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=N+dqfGUBfTbC6UpmkwwgFflOoNbaqaepsG1Trs9PsQJfqcEJwF+Pr9zD75xyVz9xjW/iqHBM0a9Q9UCydK9DxMFe+m6R1p7aZMAP4SEqr3yPFlSN0FIEo98f/vUQsYbQ7ASnkqjsG8hdrLzC/kYa3wMRn+amhBllyXmm2OeeBcfi4cp+NIwX9vzkDln9ixro0lvU1ZCRHzFwKyyE12JPcFk/QWjIm9AYRhM1eSeSxHvTOMYWTHAoaT5hUloSc7b9H4ci7WPM80p4yILTmYqYnJYKbOBamr9XV0Gtrk2pL8L6XYHYKoLDvcfmUc6vGCE4JJ1ARv+WoQ08h7agjXt2gg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1v8CSuXEdgJ04l4eszcrH8LdoeH5wX7jhLvkfapVtWc=;
 b=RguY51+g6+5hA/Uu+2bDfhogwqMaZif0+RpQTkKyifdzuQc6C96Z6NBTB0DNQXnL06vsudSKS7XMNbbrttaVlHA/lCMlSgxO/8z7PyJkSuaQv2l+7mVBblKweSb1UpnHfcAA6j9LI4dwDr8SGk84yHF7Q9V7WuS1dpJX+D27xU6jGVHIHeowJ+bdeNvWsvls1e73HkzWPxaRoeqZGQZy0UKmPggTuW8lLSPet8Zv7Gy/RdGG3CjYbwsqLEA5TInH+u9nCk0jrSbGGlDpI2Q5h1WzpMXngdKhDCjcBzqjfxJARUzDdskLIiVpwGrN5FyESatnJfs6MOMJGko0pAX/9w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=arm.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1v8CSuXEdgJ04l4eszcrH8LdoeH5wX7jhLvkfapVtWc=;
 b=9qwmCSHbNVWpPIGLhgvPSIh8qJ1mTUfBOsgoIMs+tI7bvlBV0TKxzWkM3swfgRTSoGmSDw4jzjJ7BsGUaN+8PJx+SC2Qhs+FsiH7UWl1eucZTRiuEchnkgKZwZgfGx7nSQN8Hg4lvnOL+jeJ+jPOc8SP+vf7sZVjFUpnv4D1xss=
Received: from AS8PR04CA0208.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::33)
 by DU0PR08MB9511.eurprd08.prod.outlook.com (2603:10a6:10:44d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.37; Tue, 5 Mar
 2024 17:33:05 +0000
Received: from AM2PEPF0001C717.eurprd05.prod.outlook.com
 (2603:10a6:20b:2f3:cafe::fa) by AS8PR04CA0208.outlook.office365.com
 (2603:10a6:20b:2f3::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Tue, 5 Mar 2024 17:33:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C717.mail.protection.outlook.com (10.167.16.187) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.11 via Frontend Transport; Tue, 5 Mar 2024 17:33:05 +0000
Received: ("Tessian outbound ca5b6496b02a:v276");
 Tue, 05 Mar 2024 17:33:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c8702db99916f0f8
X-CR-MTA-TID: 64aa7808
Received: from 988199c58817.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9C5296A8-98F9-4747-9FEC-C0A714726988.1; 
 Tue, 05 Mar 2024 17:32:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 988199c58817.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Mar 2024 17:32:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFc6CZZs5c5gObvm78L+PPHiW0xE/ymLi/THidml35OLaSVaTavEU0sHSce9arhKXP9WCJmGTVB4GGUC4SZEDlAid3kVrD+l+bx9rnR0/Aa9G+I35Dyqtq8sNaA9LL8a9qByphXQdaRmUvhlOzXvMXs0SkxEWcrzx4HvWRWZBs9hbSE5N1e5qcCOqQp/vh0SwGKiXoMc5li5yGZud7DDB0NXcADCtjlkMgGHsqTLRTn9iXJtSfRi+YB9193aYSCQKV+2eIQ5Z9qWVa0j0mFW6TBEaGNp/UzvXAixMTK1KaDIhQUeGmwc6TRll8z26NNO3XP7ptVLR63+kFFb12VWRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1v8CSuXEdgJ04l4eszcrH8LdoeH5wX7jhLvkfapVtWc=;
 b=SCrVUNhMeGIosMyz0ArLluc3GmN6yejrDlNbZPKXta+p8bNHN+pETAwO3mtB5fW0NnygDXpr/0p6nWd89uj6EnPKtUgu41dbEo0oBCX5bHyQP+DeNYXaLxzGbBBkFVBSy45lE4yWMNtFAc8hsJaPdUqCUJrcSnCeNqlWpmTvEfUtABG52uwCGhRcRXEHMUYKfRG+mxCqAoMNJwbnH4Q0AU+HLFT7Xru3+wjeFUz9sqIM+JPimL9NFdPVFO26WQSuWKVjtr/l+8DUkm2OziMftc00RZG0x47hWLXu6T/1j7BECddqjaQ9dOt2oee+puq2M+3ypFKATmXNbEyNBCewIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1v8CSuXEdgJ04l4eszcrH8LdoeH5wX7jhLvkfapVtWc=;
 b=9qwmCSHbNVWpPIGLhgvPSIh8qJ1mTUfBOsgoIMs+tI7bvlBV0TKxzWkM3swfgRTSoGmSDw4jzjJ7BsGUaN+8PJx+SC2Qhs+FsiH7UWl1eucZTRiuEchnkgKZwZgfGx7nSQN8Hg4lvnOL+jeJ+jPOc8SP+vf7sZVjFUpnv4D1xss=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GVXPR08MB7727.eurprd08.prod.outlook.com (2603:10a6:150:6b::6)
 by AS4PR08MB8143.eurprd08.prod.outlook.com (2603:10a6:20b:58e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 17:32:57 +0000
Received: from GVXPR08MB7727.eurprd08.prod.outlook.com
 ([fe80::596a:30c6:4046:6349]) by GVXPR08MB7727.eurprd08.prod.outlook.com
 ([fe80::596a:30c6:4046:6349%4]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 17:32:57 +0000
Message-ID: <c43fcd3a-9813-4e1f-adb3-25cc32c54438@arm.com>
Date: Tue, 5 Mar 2024 17:32:54 +0000
User-Agent: Mozilla Thunderbird
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240222082142.3663983-1-anshuman.khandual@arm.com>
 <20240222082142.3663983-8-anshuman.khandual@arm.com>
Content-Language: en-GB
In-Reply-To: <20240222082142.3663983-8-anshuman.khandual@arm.com>
X-ClientProxiedBy: LO4P265CA0189.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::15) To GVXPR08MB7727.eurprd08.prod.outlook.com
 (2603:10a6:150:6b::6)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GVXPR08MB7727:EE_|AS4PR08MB8143:EE_|AM2PEPF0001C717:EE_|DU0PR08MB9511:EE_
X-MS-Office365-Filtering-Correlation-Id: a231c068-dc16-437a-b620-08dc3d3a511e
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: IIljz9xsUnKRQFRuyCcDmFbMJYVxF8QIjHn/JyiYUNOFflMRAfT8gOlhLe4uvDYSytxATIJMU+IpcgHAI8moT9BhH2HsWFztR7MLbobshvj5s8UnlQgaurm/jJzoWTtCYNYchpN4DxjihjlJ4jmOL9t04RBfAFhK3mX5gPJUM7m41ArN2mYS6tvDTfdyLT6XqipvFEuMLNFnW1qXpe4WaEQQ8PYS48x6/rovXBNjRD5l6SeUkHq1AkEp9X/8UxEZvZ3n2HnQFSL33MUZOjcu4ygc3P8cKXfSYnYeg0d55y2as3m+HLvH0/Lirs9cpx6M26Gvm8t19jJoNgkeBEgHjW6bUYmmj5mbaQblshAO7ri7nebCZy1nR5YoFPGKAlM50KwSBwStBnATMlZ9qJnBbV9AQoHaiV1yFxwwmLxwwrlt39+yJKt47AVZ4pXN2Xi75xVUo/Rz7KCHSTRgT1A7xxr89LKyJdS2/RnK7g90QHzYHXI4tleobVJoFwmqoZ9TXHWz9m70DuWc827jKwrSQ7dUp+thIXvd8RzPHQiTq5SK533RPeoqdWEZlV6JlqSil6mhAWWyqrJt8x3rxj/I35CxTgUGxYor1R5TKuu0KE0DEOnGQlN3PfnkZ+eUCuNBWczQZHEgA5FBiyzkdMCVt3j5KwTdb2MHAmtCULt7ajo=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:GVXPR08MB7727.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8143
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C717.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b8acd810-58e4-4ed8-84e2-08dc3d3a4bb5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6rrRrRxvlzmm7IWQFgm7dool8eqieTW8oobshXBe6/2vdu9ERSgRCR+3GuUlv+8+q6UQa8Wbh8y4XDwJTfvjvC/1UtMGuB4T3ivF4x5e7IaQLjpa/hfZ+fIQq0Yhj8/NsCsltbRlxdFX4v+J67tilezwOZfVoNtTzjsuYfpQZaFFAjF+IOJ0ohIpxNC/eYZ+v1wGLR4xv9rtFfau6Ntk03U7E4N376dxhwb4RkzjqxX88agArMxhcNZl7zClFzY0KemCTxajSqLKUf80+RAjZZmTlVws9C0hFPRc7cqCGhTyugF0flyegUiFSvXkmMIMUzwa/gWbwZViid8ehZr5jY83KNKSwsoF7qG41TllaUOlCZACZHmn1Cg2R0He+FMdDOqpxE1MnFbfRChlvExU7ALF1klOBfbOByze/DCLyb4KUrA867M8OUaaA1Tmh0sJNMKHznrzYhsWMYVgbjSuqK84F8QUfu56JqY27SKPljDYvHpwrbXn0102X4h0ueHHB60kA+nblNVDs81UfVryTIXH1MJyEJROZG+0rO2yt4NnfpLFwcRLHCJtQp9UFigmu1d7h8hVbvAn1WMbntPdy30dBBPKqsYiU7+AcKnGH/hPdFhYw1go0720UwLue2VgtALWBZYudprWe7GO3UTd0KgP9s2NP7zk5c6582+GAhim5O1hhaFefPHpGc5Oh2WZEqlaXaSbRm7vyCJCaLd0nYSn0oRiHz4R3eo4TeVxAOwxP3BrEjj2kWVW3gQzufvY
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 17:33:05.7507 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a231c068-dc16-437a-b620-08dc3d3a511e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C717.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9511
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V5 07/11] coresight: catu: Move ACPI
 support from AMBA driver to platform driver
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

On 22/02/2024 08:21, Anshuman Khandual wrote:
> Add support for the catu devices in a new platform driver, which can then
> be used on ACPI based platforms. This change would now allow runtime power
> management for ACPI based systems. The driver would try to enable the APB
> clock if available. But first this renames and then refactors catu_probe()
> and catu_remove(), making sure it can be used both for platform and AMBA
> drivers. This also moves pm_runtime_put() from catu_probe() to the callers.
> 
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Mike Leach <mike.leach@linaro.org>
> Cc: James Clark <james.clark@arm.com>
> Cc: linux-acpi@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: coresight@lists.linaro.org
> Acked-by: Sudeep Holla <sudeep.holla@arm.com> # For ACPI related changes
> Reviewed-by: James Clark <james.clark@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> Changes in V5:
> 
> - Updated commit message regarding catu_probe/remove() refactoring and renaming
> 
>   drivers/acpi/arm64/amba.c                    |   1 -
>   drivers/hwtracing/coresight/coresight-catu.c | 142 ++++++++++++++++---
>   drivers/hwtracing/coresight/coresight-catu.h |   1 +
>   3 files changed, 124 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/amba.c b/drivers/acpi/arm64/amba.c
> index afb6afb66967..587061b0fd2f 100644
> --- a/drivers/acpi/arm64/amba.c
> +++ b/drivers/acpi/arm64/amba.c
> @@ -27,7 +27,6 @@ static const struct acpi_device_id amba_id_list[] = {
>   	{"ARMHC503", 0}, /* ARM CoreSight Debug */
>   	{"ARMHC979", 0}, /* ARM CoreSight TPIU */
>   	{"ARMHC97C", 0}, /* ARM CoreSight SoC-400 TMC, SoC-600 ETF/ETB */
> -	{"ARMHC9CA", 0}, /* ARM CoreSight CATU */
>   	{"", 0},
>   };
>   
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index 3949ded0d4fa..a3ea46b53898 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -7,6 +7,8 @@
>    * Author: Suzuki K Poulose <suzuki.poulose@arm.com>
>    */
>   
> +#include <linux/platform_device.h>
> +#include <linux/acpi.h>
>   #include <linux/amba/bus.h>
>   #include <linux/device.h>
>   #include <linux/dma-mapping.h>
> @@ -502,28 +504,20 @@ static const struct coresight_ops catu_ops = {
>   	.helper_ops = &catu_helper_ops,
>   };
>   
> -static int catu_probe(struct amba_device *adev, const struct amba_id *id)
> +static int __catu_probe(struct device *dev, struct resource *res)
>   {
>   	int ret = 0;
>   	u32 dma_mask;
> -	struct catu_drvdata *drvdata;
> +	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
>   	struct coresight_desc catu_desc;
>   	struct coresight_platform_data *pdata = NULL;
> -	struct device *dev = &adev->dev;
>   	void __iomem *base;
>   
>   	catu_desc.name = coresight_alloc_device_name(&catu_devs, dev);
>   	if (!catu_desc.name)
>   		return -ENOMEM;
>   
> -	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> -	if (!drvdata) {
> -		ret = -ENOMEM;
> -		goto out;
> -	}
> -
> -	dev_set_drvdata(dev, drvdata);
> -	base = devm_ioremap_resource(dev, &adev->res);
> +	base = devm_ioremap_resource(dev, res);
>   	if (IS_ERR(base)) {
>   		ret = PTR_ERR(base);
>   		goto out;
> @@ -567,19 +561,39 @@ static int catu_probe(struct amba_device *adev, const struct amba_id *id)
>   	drvdata->csdev = coresight_register(&catu_desc);
>   	if (IS_ERR(drvdata->csdev))
>   		ret = PTR_ERR(drvdata->csdev);
> -	else
> -		pm_runtime_put(&adev->dev);
>   out:
>   	return ret;
>   }
>   
> -static void catu_remove(struct amba_device *adev)
> +static int catu_probe(struct amba_device *adev, const struct amba_id *id)
>   {
> -	struct catu_drvdata *drvdata = dev_get_drvdata(&adev->dev);
> +	struct catu_drvdata *drvdata;
> +	int ret;
> +
> +	drvdata = devm_kzalloc(&adev->dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	amba_set_drvdata(adev, drvdata);
> +	ret = __catu_probe(&adev->dev, &adev->res);
> +	if (!ret)
> +		pm_runtime_put(&adev->dev);
> +
> +	return ret;
> +}
> +
> +static void __catu_remove(struct device *dev)
> +{
> +	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
>   
>   	coresight_unregister(drvdata->csdev);
>   }
>   
> +static void catu_remove(struct amba_device *adev)
> +{
> +	__catu_remove(&adev->dev);
> +}
> +
>   static struct amba_id catu_ids[] = {
>   	CS_AMBA_ID(0x000bb9ee),
>   	{},
> @@ -598,13 +612,103 @@ static struct amba_driver catu_driver = {
>   	.id_table			= catu_ids,
>   };
>   
> +static int catu_platform_probe(struct platform_device *pdev)
> +{
> +	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	struct catu_drvdata *drvdata;
> +	int ret = 0;
> +
> +	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->pclk = coresight_get_enable_apb_pclk(&pdev->dev);
> +	if (IS_ERR(drvdata->pclk))
> +		return -ENODEV;


---8>---

> +
> +	if (res) {
> +		drvdata->base = devm_ioremap_resource(&pdev->dev, res);
> +		if (IS_ERR(drvdata->base)) {
> +			clk_put(drvdata->pclk);
> +			return PTR_ERR(drvdata->base);
> +		}
> +	}

---<8---

The above section seems unncessary as we already try to map the base in 
__catu_probe ?

> +
> +	pm_runtime_get_noresume(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	dev_set_drvdata(&pdev->dev, drvdata);
> +	ret = __catu_probe(&pdev->dev, res);
> +	pm_runtime_put(&pdev->dev);
> +	if (ret)
> +		pm_runtime_disable(&pdev->dev);
> +
> +	return ret;
> +}
> +
> +static int catu_platform_remove(struct platform_device *pdev)
> +{
> +	struct catu_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
> +
> +	if (drvdata)
> +		__catu_remove(&pdev->dev);

I don't understand the need for if () check here (and on all the other 
drivers). Even if we have a drvdata != NULL, what guarantees that
the drvdata->csdev is valid (which is used in xx_remove) ?

Suzuki

> +
> +	pm_runtime_disable(&pdev->dev);
> +	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> +		clk_put(drvdata->pclk);
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM
> +static int catu_runtime_suspend(struct device *dev)
> +{
> +	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
> +
> +	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> +		clk_disable_unprepare(drvdata->pclk);
> +	return 0;
> +}
> +
> +static int catu_runtime_resume(struct device *dev)
> +{
> +	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
> +
> +	if (drvdata && !IS_ERR_OR_NULL(drvdata->pclk))
> +		clk_prepare_enable(drvdata->pclk);
> +	return 0;
> +}
> +#endif
> +
> +static const struct dev_pm_ops catu_dev_pm_ops = {
> +	SET_RUNTIME_PM_OPS(catu_runtime_suspend, catu_runtime_resume, NULL)
> +};
> +
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id catu_acpi_ids[] = {
> +	{"ARMHC9CA", 0}, /* ARM CoreSight CATU */
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(acpi, catu_acpi_ids);
> +#endif
> +
> +static struct platform_driver catu_platform_driver = {
> +	.probe	= catu_platform_probe,
> +	.remove	= catu_platform_remove,
> +	.driver	= {
> +		.name			= "coresight-catu-platform",
> +		.acpi_match_table	= ACPI_PTR(catu_acpi_ids),
> +		.suppress_bind_attrs	= true,
> +		.pm			= &catu_dev_pm_ops,
> +	},
> +};
> +
>   static int __init catu_init(void)
>   {
>   	int ret;
>   
> -	ret = amba_driver_register(&catu_driver);
> -	if (ret)
> -		pr_info("Error registering catu driver\n");
> +	ret = coresight_init_driver("catu", &catu_driver, &catu_platform_driver);
>   	tmc_etr_set_catu_ops(&etr_catu_buf_ops);
>   	return ret;
>   }
> @@ -612,7 +716,7 @@ static int __init catu_init(void)
>   static void __exit catu_exit(void)
>   {
>   	tmc_etr_remove_catu_ops();
> -	amba_driver_unregister(&catu_driver);
> +	coresight_remove_driver(&catu_driver, &catu_platform_driver);
>   }
>   
>   module_init(catu_init);
> diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
> index 442e034bbfba..141feac1c14b 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.h
> +++ b/drivers/hwtracing/coresight/coresight-catu.h
> @@ -61,6 +61,7 @@
>   #define CATU_IRQEN_OFF		0x0
>   
>   struct catu_drvdata {
> +	struct clk *pclk;
>   	void __iomem *base;
>   	struct coresight_device *csdev;
>   	int irq;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
