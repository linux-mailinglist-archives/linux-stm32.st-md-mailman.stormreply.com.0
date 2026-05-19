Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBX7LhoxDGpuZAUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 19 May 2026 11:44:58 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C9957B87F
	for <lists+linux-stm32@lfdr.de>; Tue, 19 May 2026 11:44:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06037C8F294;
	Tue, 19 May 2026 09:44:58 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5EE4C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 09:44:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7/A5qsSXz/gtCz0oW1DEhSOhhVQSdbsvuizSF71DtQK/4e6wGlZ0zvK6w5xDdf+otqOYMsc7WZ0uaUaCZ4PhIr+KhJHuymvHlaENo/AJsZcl6mxlkI2m6xSCFFpkAkV6v1sbIfx7V6lB2BSrfRcICqoZehNVhH3fOq+5igPIN+MJJ8HzP8EhYMe5bGXaaKHoJNfF8Ge1srbaC4y4M4wLC/rIwVUiSCtcmQ67UP7zlnST2o0DbDCUaCPbSshy9B2rZqe2oX6oHsti4ractsMBC79NkkYwH6bGZpb6SCtWarxvtLzA76IzxjFLFMreahEQDC9EnrIG7i2c/SCMVP7wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgSRh1FfKHsM9LdjlVge12tmSBSbx+UxJlgcC/kBykA=;
 b=QYknUqBKia5SvJ0PLKGAmsyh523LRSrYp6XW9rKrs6RPiglNu3qP579+AkQCsy5Ttb3gnW7cMLFBHtpyGNT8vEmiB249rKmo1yeAKfd5s96Zw5cn0cuA9Ut1mtuBkHWNd8MZB/STn7ComPGUd6Mn2J01EM3xcTevak0OZa1CvjS8vRtqXE1nNKe+BOLDEZROmD9wXg30rJQczzn5mjhXaRw4leaAmhSzA1/+wYz3dj0LLn1nZ9WsGvycGAPv9Gs6er9Rd2SQFXOxqD/ny+1msTiWukpBzVqYpbygO5zN/xRZceo1Nkm4QPieiQoUe5cNgExpRSF7xgLM1OZMOfCVQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgSRh1FfKHsM9LdjlVge12tmSBSbx+UxJlgcC/kBykA=;
 b=l7ML3shvEk18GDIz+fYwpasXXQ9kwyqhvFkHNFDLiEI5JmNzNBwjCpVDrHVoJRTziUlcxoKp1i5/psP3Wps0jrpbxfzQViPR8pqyFt4iuDg3hGeh1EIftZPIM3ui6Zbch5+159zXdb2u4FpbftjLBZJ+NkS00V2a5IGQabWhSb3vXmJrpYvY2w+sbBhvGdRDYAFIHm6xSCvU0GveUGkY3i2++W2kmkMpzW8syJRrjjqqdYfCanP9vbZx5yh8LI+PeaRVuTzw8BXzCNq5NMP4q+/3aJJnFwrqUqryQctgkvvLQg4jRFWbflxZjW7KMHsPvlgwv4n0DwppO8CMrb9TpQ==
Received: from DU7P251CA0009.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::29)
 by VI1PR10MB3503.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 09:44:51 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::36) by DU7P251CA0009.outlook.office365.com
 (2603:10a6:10:551::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 09:44:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 09:44:50 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 11:48:43 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 11:44:49 +0200
Message-ID: <81ef6f52-0127-40d9-bd34-1ff501153fe9@foss.st.com>
Date: Tue, 19 May 2026 11:44:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20260318105123.819807-1-o.rempel@pengutronix.de>
 <afwfpST_NNAWSo1l@pengutronix.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <afwfpST_NNAWSo1l@pengutronix.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009528:EE_|VI1PR10MB3503:EE_
X-MS-Office365-Filtering-Correlation-Id: 43e040ea-af87-4495-cc03-08deb58b45d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|4143699003|11063799006|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: l4dTY11ExQrwwApWU5xE4IiGGE7fwCMAOgMHEm/9GXP2IXnOXqarXDN70BtPN4ZGVyyTxLU0Sp5r8Sl4b4GaEjNTdJmpYI4tOG7PROXwSHe5by0VHL+zhBSeXJf8hYMRxHWwyB+F7KzWqUhrQAgIsqwXwxQJcloqA1Zm4gqpQ8HNk5+l0SbqzwdUML4f8CRyhjvgWIAtq6vjVD1a7BgzXOVBOJhzJl/6dUO70vhPmH3X81zRi2WSNn+I3d2JDivgDIqbCCjmtdI65sW0qcaGa2O2e6d9cna4Dp9Nynhk1sheuLaZHw9Xc6FqJMRtEz027Z3QOcQWIQaLq6msWjyASlX5fpARBUu10hndt+LQUfc9PIZu3hCcDA1gKeFdoYhrWh7Jo/Z6wom1u4FnxArH8KjG0B6ko/D44h/H4yl/5XlFSD9bbD3Zfc3K1u1Jkw+gMJcwthAYFPVvtFSEJxVwVD/Kn5fMzuIzWcaPVnlozMqkr41rqBfDEH6VqGewUY+W7GytPHgp81vgz10KWERWh0mQrwvdjYgiyyrKKKno7OEQIR5hf4zwh1w5HWhkLJMuXxTtC/pdP8gakzCa4LMxDEFfqOCnRY33ZOmnaMdkgBqwGjJRZSIJztQE22aISSyeaNJyvVeoWIOOWfF2UJvPcKiCsT6/Fiz2J0MhEFWUnhH+cIHHbLrbvilpkUC/WyaZHDholBTj6gZK9XYInJ85+g0uxOTep2Phgr4c386+/Ss=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(4143699003)(11063799006)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7HroAz8CJ2rI64ME4DBjusbmhmNNrLwUhZzl7VK0hmKmsDnSsZndaAnOj+ljtrKk0lj0TqaGRZMTBUmURCp1MfoWtbGUw3m77sx/juHDf9fHPSd6U33F5uni9a8GCnLV5FTb6DFz/WvWgVPoQVvdqFnEZ9JuFJUNBpPjj50iO/o5ec48Yen/rQ01W8CfhpdCo3EbnCz2dRdwLtsKKtNArUjstjkamZYi228kOgMzuqdgA9qW+XScEm+IUxPE5M7QV3kU0RFGbkhw6FfIrrxGSkeNFrEv3zgw3zbq6/MTwCJIVXoPbgnYbPMaxLqkKI4NrrfOHUzuwu240sK2Wrc1IKMKDeAtNcGH7SpmsrQMrkETU/E5RfkKkACLQmMwPcy0+L3y8CdiyzXpjH1Xx/g5MpJW4A5PR++8TUW0EYB56XzlyYvJlwni3AwZThOZcTi2
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 09:44:50.8919 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e040ea-af87-4495-cc03-08deb58b45d7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3503
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v1 0/7] ARM: dts: stm32: Fix mecio1
 hardware revisions and ADC/GPIO mappings
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
X-Spamd-Result: default: False [2.89 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:o.rempel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:kernel@pengutronix.de,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,gmail.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 59C9957B87F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Oleksij

On 5/7/26 07:14, Oleksij Rempel wrote:
> Hi Alexandre,
> 
> Can you please take a look at this patch stack :)
> 
> Best Regards,
> Oleksij
> 
> On Wed, Mar 18, 2026 at 11:51:16AM +0100, Oleksij Rempel wrote:
>> This series updates the STM32MP15x MECIO1 device trees to properly
>> account for the physical hardware changes between the R0 and R1 board
>> revisions.
>>
>> David Jander (7):
>>    ARM: dts: stm32: stm32mp15x-mecio1-io: Enable internal ADC reference
>>    ARM: dts: stm32: stm32mp15x-mecio1-io: Fix ADC sampling times
>>    ARM: dts: stm32: stm32mp15x-mecio1-io: Move divergent mecio1 ADC
>>      channels to board files
>>    ARM: dts: stm32: stm32mp15x-mecio1-io: Fix GPIO names typo
>>    ARM: dts: stm32: stm32mp15x-mecio1-io: Move gpio-line-names to board
>>      files
>>    ARM: dts: stm32: stm32mp15x-mecio1-io: Fix expander gpio line typo
>>    ARM: dts: stm32: stm32mp15x-mecio1-io: Move expander gpio-line-names
>>      to board files
>>
>>   arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dts | 128 +++++++++++++++
>>   arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dts | 144 +++++++++++++++++
>>   .../arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi | 146 ++----------------
>>   3 files changed, 288 insertions(+), 130 deletions(-)
>>
>> --
>> 2.47.3
>>
>>
> 

Series applied on stm32-next.

Cheers
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
