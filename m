Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNDpCFOopWmpDgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 02 Mar 2026 16:10:11 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEAA1DB80A
	for <lists+linux-stm32@lfdr.de>; Mon, 02 Mar 2026 16:10:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43809C3F944;
	Mon,  2 Mar 2026 15:10:10 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010071.outbound.protection.outlook.com [52.101.69.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BA20C35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2026 15:10:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nH7vHjswb7L+GhCBKqUPWoM6y18Z4Or+6u1LRa0FOjC//HvBp/+UeWu2u4qOQiexwr8cFPoJuuZiISS+roB+GrVczc1XTctbRnzHLTCIE9qBnudcZyBYggUVnp5EbMJzcPJrqxozr+5qvsj3TyBbZxjv9eJNF8U03r+f3Z7GoQdyHaKbdn4+bjaeJtGZzSADAr0CEaIpxF7rAdpPLSwcIHQeGP4RkFs1SP6DbzL3mKKkPTu2Usr3PYQoRL2o8cuQ3C6VHQxneK9NFwf434jfVEzEWpjYXU8UF57dbJfd1u3/F+zwHo87yauNU/ku8JjymMhQYbMr0std/XvRC0qAtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jwlvfs5SM7s2o/Ymy29yfn/oP0q6TH/NVjxbqqhxNlw=;
 b=xwVEY6ZeogALL+RUVBoCB2T2OWG7YNuqB/kdU3GOCrP/im94yNnm4IXoYgkiz98gdbLuOONNzK8aYG6EpVPkphab6xYUEwISxzIEZxpTXDdwVDZktO/8YinUU767AUV1WG6jiJ/fRL+uzyYNuBWDuwfKtJ8OUTFAkK0Vw9AzXosoty034TYt9zTb45Za08maiMi9PbuThMSryQw8qHi0icQL62X9XhhGpZB3J0jsqu0rMdUv27ssZwk8uVlbXw7Ggw9SIsVbsxn5139lMFiT89mAG+vF/yh1fLSmvht1/mj98w+0DCFAsqq3hiQ1O2aMyJ4pY7xfMMiwmRCKgnwuqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jwlvfs5SM7s2o/Ymy29yfn/oP0q6TH/NVjxbqqhxNlw=;
 b=M2cyZHRTQOwvSbO9uzOsuThHlcDL2vAapjkmkEaSZT0jcmaizlRlDnIUMqstWLbzLoY9GHPYsJxU/vTf3UBmoDG/KS3EuYgVtYKslmUUpnaoI9ECg2l06dJ+56vrhodo8XN8fWaNtyz6G/5/p174ZyQ+emzC9VrJU6ORrxyIPhO/NC1j1pMoljduTUJIfITRlqWcSZOTplscvIWR3Ir0EsZB13hq4kkzV/Rpqlr33BpQi/OkE8KI2up2t5FTcFnV3Vfj3ocpeSffZo87tXgabPIs0J/j0gitSBv8Hc/DzVHY3vDUk6Lh8ZXXwZSIVM/m/n51Gyd6FG820E5oWrUbtQ==
Received: from DUZPR01CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::20) by GV1PR10MB6291.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:91::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 15:10:01 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::8b) by DUZPR01CA0074.outlook.office365.com
 (2603:10a6:10:3c2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 15:09:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 15:10:01 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Mar
 2026 16:12:10 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Mar
 2026 16:10:00 +0100
Message-ID: <78be9de6-084d-4c3e-831d-a91fd0d1775e@foss.st.com>
Date: Mon, 2 Mar 2026 16:09:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
 <20260209-stm32_risab-v1-1-ef0b2b6a7e0a@foss.st.com>
 <ee9759a6-1779-4891-8716-24c36134198a@kernel.org>
 <516036b6-b825-4a29-a48a-5d3af3234968@foss.st.com>
 <ac793499-bebb-477b-b27e-089529f3ee4b@kernel.org>
 <66ecf6a5-cc1f-4872-971d-6bc32894dbac@foss.st.com>
 <fd73947a-289a-43f9-9506-573fee935d12@kernel.org>
 <ed0ab69f-7aff-423f-8b93-980e79705b6d@foss.st.com>
 <c588720a-6a7d-4179-afb5-bb7e89e0e7e1@kernel.org>
 <b535dfd6-e4a6-4831-a868-c152574144c8@foss.st.com>
 <ae9962a4-b611-46e0-b124-5910e8708a20@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <ae9962a4-b611-46e0-b124-5910e8708a20@kernel.org>
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E1:EE_|GV1PR10MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: fed0d8cf-7aa7-4444-3318-08de786dc694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: ALi26ahkP4DtULcaMIdN/WKSs2jhaRx/E0LlJ3AvaqFay8RH51aC1LNv0o6v9Zr3aAX6QUK07dYCCM3uTiWM6ycHm8fQ1w9QBw/N2llOAqH99hN4CDYQ+O3X3+f+pg3+cbu8B+4KeA6gcMt11haX1nlzY+6fo9qimJn3JGNAtIDlUQXbBzd0VO6aqajUyxYyA725BLz3r4Mt7CMaHDrHlKIribIEUNlwWyhr2oFV6I6apEvTTFkgq19eweLDnfruATAEmGXehx180ze6DxRbMYJAeUm9CpueqEXed2CWkRqhXqaPryeo7nq/KKr4HxuKcN6WBib8W/SjxAJbHQdw2YSbUisgWu9zaSum+3RRG8RurTCyJKXP60aNmQOeqSFAIbJ9qtHXFvVyU7WRR0m90EkdwIkM+/aXpmNm1/nev0zUFzpFzocEgcXDeO8D4ccX6w22tPiaa4cV/ABecTubjXez0c5/sQscCInUQxkTtZFMx7ZRVfw+vZ8eEhm5TutGqiVdnzw/CMRyaf+6PgXZrSzJ65UZ7tUgcaHVa5JgasK5S+nb9SvsFRojaMW5x6rFB6emKe0Hn2z7gbA/JAxXxunpWbyfabNDUwC6Tzg+kq1XEUKgJYlYbdiiiCFk7lgI6+MjmTyaS3vDZZIH36wsj9noi7kL49to++0xbjch8wxRNi0EIPei8g8fCPolSi2BVwLHvRg28H1n48+EGJHDx5KTTJxMD3FBGWX58EtWqLXIahkBG17o2mydIZd6EOoTbZvuhluDCbq4GUu705f+5U8B7ch/fztCGt9u8gbEBzhMbpctZmZhGyDxL5EBkbmJA4vmZmwLZq0RrYYCd8IORw==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: O44YjadYbQ6EJ5iJOEzUhZTy6Ey+w55CQ2Swzd4utCQUEwWl05SDmIVFXLf5zUA8Yb07h1THgQ7hadfFgLJr2NZq7HImkIaorMNQnAO1f3/P2VG7KunXdXEEAAd+spTb6J4Fw314gm4WajhDSkRiAcCLs0sTPxU7mhGNWu4CwL+MDYyY3zZci7KN58xJHqfZyBimzZlG4zrV275k1Z9zAnANwhqkuVuhOdmOSkKFW9jFt6Yvw/ncsPbMleyjpgPZaAHBJXxPS3zYYfeGS5WjVVEw3xpcQkweHBC70lH1Mc8Zi6o8n6Xa3y66g/c+J3p4IYvdOB54jF+F4HPlHm4gnYxx8DaoY4nABr29IF6NUbanvonJ521yFlP9RvSbVDLdk3qIe1Ay38ZiPKpz5BFBVAc+gU5/fj4aqZdD1iTUsuMmLHyjvHHwWJr+5RAlwLJ+
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 15:10:01.0295 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fed0d8cf-7aa7-4444-3318-08de786dc694
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6291
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/7] dt-bindings: soc: st: document the
 RISAB firewall peripheral
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
X-Rspamd-Queue-Id: 9CEAA1DB80A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	NEURAL_HAM(-0.00)[-0.965];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2/26/26 19:13, Krzysztof Kozlowski wrote:
> On 19/02/2026 15:02, Gatien CHEVALLIER wrote:
>> Just a small reintroduction of the issue:
>> We need to provide three sets of information to the drivers of RISAx:
>> - The registers of the RISAx device, handled through property "reg"
>> - The global range of memory addresses protected by the RISAx devices
>> (currently through the custom property "st,mem-map")
>> - Each individual memory range protected, handled through property
>> "memory-region" that points to children of "/reserved-memory". Memory
>> regions may not cover the whole range covered by the RISAx.
>>
>> To replace the custom property, I have explored a few ways:
>>
>> 1) Describe the memory range covered by the memory firewall as a
>> reserved memory: Cannot be done because, for the memory firewall
>> covering the DDR, the reserved memory would overlap with the memory
>> node used to describe the memory available for regular kernel use.
>> The memory node represents part of the DDR in that case.
> 
> But isn't this the entire point of RISAB on main system memory? You want
> to mark part of system memory one way or another. And now you say that
> overlapping would be a problem.
> 

Hello Krzysztof,

I explored a bit more the possible usage of a memory region to describe
the range covered by the RISAB/F peripherals.

To describe both the range covered by the memory firewall using a memory
region, I would need to have such node at SoC DT level:

  	reserved-memory {
  		#address-cells = <2>;
		#size-cells = <2>;
		ranges;

		/* Range covered by RISAF/B */
  		ddr: ddr@80000000 {
  			reg = <0x0 0x80000000 0x1 0x00000000>;
  		};
	};

The RISAF/B peripherals need to reference memory regions contained in
the range of the memory it protects in order to apply access rights
to these region's ranges appropriately. Therefore, adding regions like:

		tfm_code: tfm-code@80000000 {
			reg = <0x0 0x80000000 0x0 0x100000>;
			no-map;
		};

		cm33_cube_fw: cm33-cube-fw@80100000 {
			reg = <0x0 0x80100000 0x0 0x800000>;
			no-map;
		};

		tfm_data: tfm-data@80900000 {
			reg = <0x0 0x80900000 0x0 0x100000>;
			no-map;
		};
		...

at board level. These are regions that can or cannot be accessed
by the Linux kernel, depending on the access rights. Proceeding like
this would also force the usage of memory-region-names to be able to
differentiate the Range node from the actual memory regions. The
RISAF/B node would look like:

		risaf4: risaf@420d0000 {
			compatible = "st,stm32mp25-risaf-enc";
			reg = <0x420d0000 0x1000>;
			clocks = <&rcc CK_BUS_RISAF4>;
			memory-region = <&ddr>, <&tfm_code>, <&cm33_cube_fw>, <&tfm_data>
			memory-region-names = "range", "tfm-code", ...
		};

Notice that the tfm_code region here share the same base address
as the node used to describe the range covered. This would result
in the following error from DTC:

xxx.dtsi:109.21-112.5: Warning (unique_unit_address_if_enabled): 
/reserved-memory/ddr@80000000: duplicate unit-address (also used in node 
/reserved-memory/tfm-code@80000000).

In order to use it that way, I would need to force-keep the ddr node
disabled at all time and use it only to extract the reg it describes.
Which feels weird to have a node that can never be enabled.

Also note that, for our ecosystem, these 0x80000000 -> 0x84000000
regions are inaccessible so it was simplified to (I'd prefer to
describe them all BTW):

		fw@80000000 {
			compatible = "shared-dma-pool";
			reg = <0x0 0x80000000 0x0 0x4000000>;
			no-map;
		};

at board level (e.g: arch/arm64/boot/dts/st/stm32mp257f-ev1.dts).
That is completely up to the user to define its memory mapping and its
access rights per-region. One could use the lower DDR for some other
usage.

> You do understand you do not have to reserve the memory, right? You are
> doing only your specific mapping for that region.
> 

Yes, understood.

>>
>> 	memory@80000000 {
>> 		device_type = "memory";
>> 		reg = <0x0 0x80000000 0x1 0x0>;
>> 	};
>>
>> 	reserved-memory {
>> 		#address-cells = <2>;
>> 		#size-cells = <2>;
>> 		ranges;
>>
>> 		risaf_range: risaf-range@80000000 {
> 
> There is no compatible here...

There's no need for a compatible for a reserved memory?

> 
>> 			reg = <0x0 0x80000000 0x0 0x80000000>;
>> 			no-map;
> 
> And why no-mapping? Isn't the point of the block is to have it as main
> system memory?
Main system memory is described using the memory node:

	memory@80000000 {
		device_type = "memory";
		reg = <0x0 0x80000000 0x1 0x0>;
	};

this one is used to describe the possible memory range covered by the
RISAF, which can be superior to the DDR size depending on the choice of
the user for it's DDR, so we shouldn't map this region.

As stated before, I need a way to describe the range covered by the 
RISAB/F, which may not reflect what memory can be used or not by the
current execution context. Hence using a proprietary property to avoid
confusion in the DT and simplifying what is the range covered and what
are the memory region actually configured.

Best regards,
Gatien

> 
>> 		};
>> 	}
>>
> 
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
