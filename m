Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCy2MxudqmnPUQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 10:23:39 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5160921DD63
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 10:23:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACF20C8F270;
	Fri,  6 Mar 2026 09:23:38 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011002.outbound.protection.outlook.com [52.101.65.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C6C2C055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2026 09:23:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEV3F1lV17ERJDz3Z4kUgqJvOXtpla3aXRuDLYrvYv+G0hX497z7n9jHw0Aj8tc4lpii9AwG+MuuyhZ/Vg1eCRXcCEZIR3o8Sn33AGBd0nu/P8bDq1VMbgxtaJG+dqDInVqGWnJv/xHoVH8rg+dAmOvTj7Y152JGw5zjiryWYuJjfzmVUBfUiiN7ZUYfrdZBCDxx2bamJaJioFIoNX1I7UdHfLMu2/e1AHBX+tiGAuxmuHAY/dhizpo4L0RPry7fw+FdOeXmrL57mfsnO5zkZ2xsgUmGZrcIsNrT/MhnvIDvE1jjXQLjK/mya9E7MtJFxFXCmE4idck3f5c64lE82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qEkAVkQ/c6YeLmQyOJU4X42ztk2wfqHXPmx8hxBdYs=;
 b=caiXDXchIqWEYxPGqSuf26TuvWzdkrOLnZosTYgi50UOjnf4b8U23GuK9PD8dacbdU9rXhS60IQ8R+oFjKfoen2pIulrODAL3wWDe55h/T798vRRXJOzWOVKQGM4t68dXBb1FBHKE1/6O7JTmlPAA6harTMnCUfYdK2j1EkvKY6KEEeoMMAHMnqQHiMkl+cBiEw63x45yp0eUjcTXFKk7mUCsxDZdYt1B+43uDyWpzI6unpyJHOJGFjsPV+6ggg0zGOrMAqEaDCDxl+4Oe1P2dvgyW83mt3xpG52WlkDUJ7xWcGk9PgdkHyluGaegsGXx+3+bWt/u/tK9FhaLlG8dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=phytec.fr smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qEkAVkQ/c6YeLmQyOJU4X42ztk2wfqHXPmx8hxBdYs=;
 b=AKLCq2omRy4rMtPXlVWS/FBENQIbMaRhi3h3oQRtTeqEWN++d62lZbsooRaYT0n8GpWVID2dXzJ+3fR85174ktBPDIbJ2RNXq5pFd8R01Ge2o2RaUKXTjxzPemdu8e2jPzwJfAcZ8uge5bNhx97cy27FIjTyLEFRrZKkqkfxtNTZGpNALPRxi86Bq+P3ik6rpKhp2t9nod5I7hSx8FFvhRf2XVJCz5TaNJ5CfKMAmc+Mme+JNhqvrV+xb7/jKS3bh9+prPFKFCvGEPWIB+92aop6jrBqmmWkvNOcttifs5RzNqts0Z0e3AGWqVcjPKPM41U58z0k9L73+JAuHKNjpQ==
Received: from AS8PR05CA0029.eurprd05.prod.outlook.com (2603:10a6:20b:311::34)
 by PAXPR10MB5686.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:245::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 09:23:33 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:311:cafe::cd) by AS8PR05CA0029.outlook.office365.com
 (2603:10a6:20b:311::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 09:23:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 09:23:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 6 Mar
 2026 10:25:44 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 6 Mar
 2026 10:23:31 +0100
Message-ID: <e77be906-8f4a-43cb-b63c-f82416cc8356@foss.st.com>
Date: Fri, 6 Mar 2026 10:23:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe Parant <c.parant@phytec.fr>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20251210101611.27008-1-c.parant@phytec.fr>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20251210101611.27008-1-c.parant@phytec.fr>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AC:EE_|PAXPR10MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c7af214-089e-434a-8522-08de7b620974
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|36860700016|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: mieN9yVYhij2tRwYSGZhw/auQuJLDkWoLjys36BDmD3srjJjs8xaHpQ8j8GfrCBp+OquyRX2i3XjQeqoLygXelB4/VodnutafmmpWmaLOa0rniFSVDpNJ3cLo40gXzlcaiUtQ4xP+32CmVTZ5EB6Zmf4Qw0M/BeFl51G8qTcW8k1mzIlpwRVyODRSFU16CWIUogFJYW2exczdvxOUTk0eMfXsp57oJLBbPhKSl/l/D8CBtkJryDlaqVbe0SH1uo3IDE6LJobP/0UinwKMDciUxt14KAm04wMsZLG8RYy+n9dcZs9AHDDQs/sDjnnjf4+90uFEfxnvOojy+RZVH4DAFHXocPskxDDxwVvLaUTPgMedTtEfMqT+rFE6TkwrS41nflOD9velZlJI0hQxVC23V/nyonVNqemucBsIG8ZShJ98yE7CSOzySbWHjb1XMxcnP5ZK59R7DE6b9F+Es6x2xJLcoR4FQ4ft+hkSeFQ1Qb7RzspD409tOlm88VkfGITy3UkTsyMtKn7GGu5KMMLl5NZoS7Fo7yJPMAPRLGWqQw2EE3Oe6zgozp09so3tnvK6fPfT5BNRWCRy5k2qe6ViIdtO2dwDzk6ge8KxsrW/e8CW+xtVRp523f2QFhV6+5uzqEXhB586oBcOL8QmAF+n2qxjC5JGZf3Q9GL1tXt5EpBMIalk6Wjvx/IfCHxJSd52CC0BjElxfFev4y3+Yndjz1VK2FH8Y0QF/VzlD/YBHFAmlavCE+S1qLeJaWXWYjuW3G6GzHg7rMczT6n0n+Mug==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(36860700016)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0c4x0cNl1r8FOFFb/0MI9YrRuBsgviadmxZJRuaJiA2dGypQAKTLDKUDlODnsqKMuJFPsdyDyzbzxc7RZhQCy1GcMysdLEzXEnlNaxHFN8yWo63srmLnz2lIHmjYWwQU+MXwixmp0X8pAh2hipYr/znT4bvHr5hhhz+phZO+t0ofT5T6yYTAHpo1yEBEzzACsqxuJgwdZpJ1JJsfQBx0/nA+dKFGsSCf9OxnPxADly+i/qUJmD/CCwRxTs/HqV0infsV0QcIauDOyGZOQ+pF8gdt0Qcsa6QtpsPrPw6LO4EvQIOjRDUtfzAgtju9tQaqRFKgtFYXUNank6K9Ft/UySxIAsi9p6pncZZJ2ZX/aaCNzssmk9fa4BGtcI3fIidxiOpxnwGt498ZRxuQWzZHJX/jrPRWtOkwx3m9ZmiJMw9ec2rh++dVXPl1cSsMJTmE
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 09:23:32.8040 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7af214-089e-434a-8522-08de7b620974
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5686
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 upstream@lists.phytec.de, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RESEND v2 00/11] Rework and fix STM32MP15x
	PHYTEC dts
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
X-Rspamd-Queue-Id: 5160921DD63
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:c.parant@phytec.fr,m:devicetree@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:upstream@lists.phytec.de,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.phytec.de,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	NEURAL_HAM(-0.00)[-0.833];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Christophe

On 12/10/25 11:16, Christophe Parant wrote:
> This patch series rename and reorganize the STM32MP15x PHYTEC
> baseboard (phyBOARD-Sargas) and SoM (phyCORE-STM32MP15x) device tree
> files.
> Indeed, the current device tree naming and organization is not really
> consistent as it does not align with others STM32MP boards (use common
> dtsi file as much as possible, use one dtsi for SoM and one dtsi for
> baseboard).
> 
> The series also fixes some important pinctrl issues and minor one (coding
> style). Additional pinctrl is also added for the optionnal interfaces
> that are not enabled by default (FMC, LTDC, DCMI, PWM).
> 
> Changes in v2:
> - Rebase on v6.16-rc5
> - Rework Patch 3 (stm32.yaml): for board description, keep "compatible"
> string identifiers as before to not break ABI. But use "enum" type
> instead of "const" for the SoM and phyBOARD indentifiers.
> 
> Christophe Parant (11):
>    ARM: dts: stm32: phycore-stm32mp15: Rename device tree files
>    ARM: dts: stm32: phyboard-sargas: Introduce SoM device tree
>    dt-bindings: arm: stm32: Modify STM32MP15x Phytec board items types
>    ARM: dts: stm32: Add new pinmux groups for phyboard-sargas and phycore
>    ARM: dts: stm32: phyboard-sargas: Fix uart4 and sai2 pinctrl
>    ARM: dts: stm32: phycore-stm32mp15: qspi: Fix memory map and pinctrl
>    ARM: dts: stm32: phycore-stm32mp15: Add dummy memory-node
>    ARM: dts: stm32: phyboard-sargas: Move aliases from dts to dtsi
>    ARM: dts: stm32: phycore-stm32mp15: Disable optional SoM peripherals
>    ARM: dts: stm32: phyboard-sargas and phycore: Fix coding style issues
>    ARM: dts: stm32: phyboard-sargas and phycore: Add optional interfaces
> 
>   .../devicetree/bindings/arm/stm32/stm32.yaml  |   8 +-
>   arch/arm/boot/dts/st/Makefile                 |   2 +-
>   arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi   | 164 +++++++++
>   ...ts => stm32mp157c-phyboard-sargas-rdk.dts} |  24 +-
>   .../dts/st/stm32mp15xx-phyboard-sargas.dtsi   | 285 +++++++++++++++
>   ...-som.dtsi => stm32mp15xx-phycore-som.dtsi} | 344 ++++--------------
>   6 files changed, 525 insertions(+), 302 deletions(-)
>   rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp1-3.dts => stm32mp157c-phyboard-sargas-rdk.dts} (58%)
>   create mode 100644 arch/arm/boot/dts/st/stm32mp15xx-phyboard-sargas.dtsi
>   rename arch/arm/boot/dts/st/{stm32mp157c-phycore-stm32mp15-som.dtsi => stm32mp15xx-phycore-som.dtsi} (53%)
> 

Series applied on stm32-next.

regards
Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
