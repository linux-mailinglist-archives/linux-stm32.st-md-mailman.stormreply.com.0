Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3045B0FC2A
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 23:32:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80A57C35E3F;
	Wed, 23 Jul 2025 21:32:58 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0B93C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 21:32:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYUP5LiMZolSlsPTEF3w4jHDebL0zkJ0lB11FBnGJysBZVQR8aKK+b10wFpOiRQcuxhk62HNXGvyWxnv4r7MfclO2PjUffRyNzVmulzC0Epb4R+fuhPbCblrIT261+swuFDA2yl1ExeDvaZbR6CPUjmUI8TSPFCNNFHHw1qRStM0dSHynpcNBeC6PUHDjZo5ONjppnsjmwdbYwzLt5dirWgeIqcvI0pezoTyo/gTnEqdaMB7q24ChDx+TzBAcclUNSNDCwF0bjm0mz5WF/IIVK5FyqjCm/4srjPJiZ1x0foh+2rYOi0eXd7C2PObeVdiLvmuv53x5a6FMKCTrrV5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fE+D7HR9/rxEDNeLRlClLRv1xh1ncx6Ecuin0p65D7k=;
 b=x84kmd+Vp6DAvsPWna3lysa0qyhLQfu/AP2HfvXfZy78+jUADCIllU25Iku9Aq5d1x5gtRJzoXVM17/Z3IxX7diQhsAhbKdoLt+CIQz//Hlf5jAzEyrmHGvHwfHdN32s8ny+Rnijm7tezyd35JgvgfaF5CddIsSgf0Ftrw6aTZaCUeICz1HrQXxrpOuMn/pahjdb2o7GUTEGY9g/JUiaVX6+EwivLIk6ROGF8dJ5Kw082nodhTL33gJvA11CVFWrFh4Tn3ICYiH9C4Y2cXaQk7498DD3CAVNUdyJ8pzFu7Povuv4M1WoEUdIpKd8d3NxNqfwOX95lh7PVPGmzEpf2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fE+D7HR9/rxEDNeLRlClLRv1xh1ncx6Ecuin0p65D7k=;
 b=gJHAYEcDtcadwupGpbzud1NdXhRk2Cwe5x5nmdc0gRfzzaJQf3fL2FyqZNQ6IAN/DEWOzI0Ny1DguhNstkfYgHC+sx1fsSVjWAw/eYS0p2qU460HWdm0c5m0wCqvRiVxphTfwVMTQN9n5r0uVYh03t7qcR41v3PKG5DeJv7vcLQbco0tFWJm/VDmwko3o4XByOnInokHW4MafQlivX+hlmockWWZ3m8i4ENL3hAABi907Eni1yF1g0HLTQXvQFwieQz3NnsgQmchlxkBDuPm9Bqe/Ylo4pZgnSQ/UXW3lNx0/hon5Poq/QBGoaxwmjIe2jLwz+w3bdjU4fKA7lw/AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BYAPR03MB3461.namprd03.prod.outlook.com (2603:10b6:a02:b4::23)
 by SJ0PR03MB5552.namprd03.prod.outlook.com (2603:10b6:a03:288::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 21:32:54 +0000
Received: from BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c]) by BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c%6]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 21:32:53 +0000
Message-ID: <a41072e1-512e-4089-8cc0-27c863eec348@altera.com>
Date: Wed, 23 Jul 2025 14:32:52 -0700
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20250714152528.311398-1-matthew.gerlach@altera.com>
 <20250714152528.311398-4-matthew.gerlach@altera.com>
 <de1e4302-0262-4bcc-b324-49bfc2f5fd11@lunn.ch>
 <256054d7-351a-4b1c-8e1a-48628ace091d@altera.com>
 <86e1e04a-3242-482c-adb0-dde7375561c1@lunn.ch>
 <baed95d4-c220-4d3b-8173-fc673660432d@altera.com>
 <434a235b-7e33-499f-a9ab-99166297012c@lunn.ch>
Content-Language: en-US
From: Matthew Gerlach <matthew.gerlach@altera.com>
In-Reply-To: <434a235b-7e33-499f-a9ab-99166297012c@lunn.ch>
X-ClientProxiedBy: SJ2PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:a03:505::22) To BYAPR03MB3461.namprd03.prod.outlook.com
 (2603:10b6:a02:b4::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3461:EE_|SJ0PR03MB5552:EE_
X-MS-Office365-Filtering-Correlation-Id: 93c12ab5-9636-4be9-3c50-08ddca307b8b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enhWV093dURkbGFvOGRyY2RDZDFLQU5RVWVEbDcrcDd6bnRQcm1WenFrb1Ey?=
 =?utf-8?B?Z1NuSkNjTzJZN0hkUjh1NUFSMzBpOWhPR1g3R2ZUa2RXZUdUc3ViVDQyZ3lC?=
 =?utf-8?B?OWRCMFBsQ2lOdUdvbFdOZzhXQldjNVQvMmcyT3QxbHJoZGtrQnFYN2NWZnVo?=
 =?utf-8?B?cHFZK21oTkhQM2dTdkFkMDE5elE3aUFjVTZOK3FvQWx3UlU1UEg4SVBvOVAz?=
 =?utf-8?B?cytDNmtuT2VWV01kUEtpa3hyMWg1YjVZWE91VmRyOGo3aktNQS95NVJPbFNP?=
 =?utf-8?B?UDdYRDVnYmJEajRQSW9vcXF2clM4ZHpiQkVHZDQzU3pSV3lXbjE2K2F2cDZE?=
 =?utf-8?B?SWRabVdSQTMydVhCdVY2RHNtUU9WT0Jpa2x3bWNaNmxiSHZxZHVWYjY2ZFl3?=
 =?utf-8?B?T2F2cWNrNDMrbHMxYXhUZm5pQ3ZNdHNiSExGUGViMFAzaXBXV3pWY3lQczNw?=
 =?utf-8?B?b2laRkRESENZZTJlQlBvODZPeFdETVlEQkE5VjFoSXNhWDlkZDE5aEd6UVp4?=
 =?utf-8?B?bS9jaUlKb3I1bTJ4RjhUTUQwZnRDQWhIMElSUWRickxNWWthbXdtTFFSYWZp?=
 =?utf-8?B?bHpjemJydmdnOEdaOFBpRWcvUG9WTWNBVUpEb1JQZU1FMnc4R1p2MDF3bkFW?=
 =?utf-8?B?K1JTN0RYRFN2ZUxuTU5UbHRicjlkOG1ENGVxc21UWHR0MGJUSEI1d21IeFJp?=
 =?utf-8?B?UkJ1R0U0N1VJbnNmUHFoazVVQlF1bDlmZmxGR2J0WGNRZ01QVDIvQklWT1JF?=
 =?utf-8?B?YjRwWTArd3BQOE5EWTIrd1JPdHFKQXFQSGM4bDJGbFNSOTJoRDNwTnFhZ1I2?=
 =?utf-8?B?YkxVRGIxemJOWHBGT1Fkc2NrNldETjdhSEpPWS9vMDMxL3pWeEl6RVpFN212?=
 =?utf-8?B?VEw1WjF3VmdXNnJoVkw5M1dCNlBxNlhUSE5qZUt0czZ5ZHcwZE1vaTg5SVJT?=
 =?utf-8?B?ckpzZm1yTTlJb1JhWnlVMTgyMnVPaDJ1UExzOXZnWWpDYmsxa0YvRWhuaVNW?=
 =?utf-8?B?STlrZXRwdFhPV2hWVktqWkFFWUNZQWhYa1RqV3BtWXR0bGQvRStkalZ6SWZz?=
 =?utf-8?B?S0FwV1BvZUNLM3BFWWdhTTlPRjh4SjErbTlqaStxdEJFY1ltZEVxbUZDdkYw?=
 =?utf-8?B?ZkpGejNENEFnMTZhT0g1UHFGeUpoMVdnbTJkbWJ0U2VUSzFvMHRsbER5bXp1?=
 =?utf-8?B?dDY2QXZsd3hKSnRneUsvTnBod3Y5bzFMTWJPNXh1Q0ROMTg1eWt4SmhDWUVV?=
 =?utf-8?B?ZmV1VUY4MUYyNndUWW1HMXhLcEs3VEpnM0dmV0o3Y3JkTlBnQmNyc2tkOGYw?=
 =?utf-8?B?NUNYVU5HWWdMTmZpbUtKdVFWelkrWDAyWktDV2hjbE5KQTlNcTl2R0ZwSXN3?=
 =?utf-8?B?YjBsZmJyK0t1S0tacWZvSi9ycnFpcHVxUUY1M3FKdTR1R0ZmTkFlRXJoWkxJ?=
 =?utf-8?B?ZzlFSjZBeHc2Z2FrRDZEZzVDalJaZytESDQ1elFIVTJDdlVISFhHSGlwRzNS?=
 =?utf-8?B?dnhtQzNPdGNKYnZ5VEhPL2pPQVFTYXY1Wm1SRWpqOEViT0pxTGV4REYyS2dl?=
 =?utf-8?B?MFE0dmpKTG83S1NZQlJiQmlOQVJib0lTNmZCQXNHamkwQzc5ZWFmMmhpTFFH?=
 =?utf-8?B?QmJFNzBiVEtCM1hvaVFOeU1BVFl4T25jZmFmVjRTVEg1c3JxUjQyN3FmS09p?=
 =?utf-8?B?Q0t1SU9WNHdwWkRPOThLd2wwTmQzTHJDVVVvQVRkZkM3bm5BZUk0Mys0OFc3?=
 =?utf-8?B?VXYyUi9UT3I2K0VaV01OQkVLODZ2U3orTVdJMmhmV2hhUEV3OW03R1ZBeUQ1?=
 =?utf-8?B?R3pKRlpEZk9aaCtPM3REYnFTSGFUcjUxWU0zaUcwbEo0amo1OUxTeUsrcW84?=
 =?utf-8?B?OUd1dHV0c2xOeDJTaDFrWFdHU01GSEJoRFVKa3VwK0dMWGVoMXVpYUlqR3g2?=
 =?utf-8?Q?EcpD10O8/Gg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB3461.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlhlZUQveUVpbGlEWXdJNU1ic3ZLUUJXckU1SEw4RWc4RlBBL3J3TW12YXFm?=
 =?utf-8?B?OHZTY3BydC8zR1NkK1ZvU1VYdExHczlCL21iNEd3S3loS3NtOUZCZE5ueTNw?=
 =?utf-8?B?eEZ5TEw4TzRNOTlwSlZYTUFmNnhZVXBRaE0ycVFvMDlmVXJqK0JoMTNxUVo4?=
 =?utf-8?B?S2VuM0xDUEhFeHVGNGJPVTROM3VOVEJFb3BuV2hTaUxRcUJScnlNcmROMmdr?=
 =?utf-8?B?TTNRb1AwUFpmM3E5RTl4dFJmcmFsODRjdXUvZ3FCaldKRWdCVXgwZkZHQUls?=
 =?utf-8?B?Vng0S0VGVWdoU1ZpVDdDWEdWeGRCb3o2U1J4VnBWQXQ1OUdQakloVTNlS2Yr?=
 =?utf-8?B?MjhBU2hpQU9XVTVXOHY2ZmVOSHpaTU1HSGFyZWE4V1pUd0JVYVR5SnFsNXdI?=
 =?utf-8?B?SUM5TjlpUzFIVUNQTEd1clF6OEl3b0Q1bFVZYUxYUHppWk1wWktZVUc0V0h3?=
 =?utf-8?B?Tld0MWx5SW1xRXJhZlZBZ3RjencrbCs0ZmJFR1NkR245cE0xWTVPbjZwTGpp?=
 =?utf-8?B?aUNzOWgzTEhnUkk2clpvYWwxNGNsemllZy9xejhYVzl4TjVjU3pTeDN1Mk1p?=
 =?utf-8?B?WnFIRFJ0NVZ3dm1zelZxenRWUGNDUGh2RDVaNGg1aUJ4QzFFWWlkVkdoTXU1?=
 =?utf-8?B?WmpIN3AxU0U3TjMzK1d1R29OVEpmU1NSTHVSbG5iWmpsUzZKQkpUQkhsTVds?=
 =?utf-8?B?UEpOUWVqTlFJanVVZXcxdUhXc3BOS2xOTFVsVmczN0hJV3hrTFV4VXViazlU?=
 =?utf-8?B?QjRVTUR6VTRsRUt5dTlFekc1N1JMRVVwNloxZURlSnFUM1NIdDgwZzVtbUVi?=
 =?utf-8?B?RjA0OVJEMGVvc2RXYTVraW9nemlzQjNIOExBVGFjYmtjLzNTZjRsQzBLSG0w?=
 =?utf-8?B?ZWlnRWxzNWFoNWRnUFdja3I2ZzJvbUJCUmF1RHpIVTl5aFZmV2FFa0REQUl2?=
 =?utf-8?B?dmRKUW92QUtjWGFPNHl2ZGw5c0sxSXJ6andETFd1Q0dkL1B6aGdDdUFFMVM0?=
 =?utf-8?B?eTE1ZDZ5VmxiV1NFbXRnVWZCajlobFUwbDhPN1VXK3F1NllCTm83L2QrdDhN?=
 =?utf-8?B?ak9JWXFZbE43ejZaNE5CdUlLZDBzbTdDU2pJbTBpWG54RjFVOStNc1JCSkNZ?=
 =?utf-8?B?bUlXVVpDVUFxSzE0MHlrUlQrdFhDTkRDK3lwZWFlaS9wSXlxOHRsRWx3R1JB?=
 =?utf-8?B?ZjhUbjkybC9HK2Zra2VlSzRVOW92akVWTlVQSHlWVjFheWNxVmxHNWEwdjRt?=
 =?utf-8?B?RitnekhPYTZsOElLOE5Ucm5ORjZpSHRtaUUrc21oSHI1dkVRNE1LZy9lS0Uy?=
 =?utf-8?B?WElGZW1TVEw4ZHdJdjhkclFUL2h4SEFUc1Zud1g0VXNSL055aTNoZDk1K3Ju?=
 =?utf-8?B?VU9iYmlZWUVSei8zeWYvYjc3VjFEcHB2K1JJRGZPc2FDMUtrb2V2R2twamdh?=
 =?utf-8?B?ZVF2VjJOUlhTbHlDRnJocXVTR2h2dHZsM0VRT3YvY3Z0UktYeitiTk1DY255?=
 =?utf-8?B?eFlLV3lJNFlEWmlUZEp4aWRSQ1BEbVZsQlpQTmNSelVDdCsrMEVOdTkvL25H?=
 =?utf-8?B?T0dqNEtFVVJtR09QT3BqWGk2UnhlRUNpS01ML08wWXQ5c1JXbytzQ0ZSMGFl?=
 =?utf-8?B?QjlMOWhKZk8wMkhCS1IvMjNJQUMyZWprNDVmTXNxTS9WUGJsMHhhYi91ckhl?=
 =?utf-8?B?NVNxUWVuRWFnU3hvekx3Q2JTVUpVR1JYVVlTRzhpZ2VZa2h2WHZRM0VtMTdw?=
 =?utf-8?B?U2FKM2N1MmJKZXo3MFZHQUYxKzVlckNrS3BoenNCSHZIYlJ6NEdvdDd1ekNw?=
 =?utf-8?B?d1dBaUYxWWNiWGVyVUR1NzdxWUM4bXRMUi9GNnlTUGo2Wk54dUJ1STgvOUlC?=
 =?utf-8?B?TGQ4UFYyUmpzc1UwRWNFWDluK3NIblk1QzhsNkFsbzliZk4vb2VTRUk0YnJG?=
 =?utf-8?B?MXdOMjJneWhzdzNLWCtJOXRWcnRaZ3hIa2dnVlhaSmlYSG1EbjMzYWk5U2o1?=
 =?utf-8?B?WkNna1ZUejZSOHN2U2ZoTEVZT3pBR1FKVTI1emFTbDQ0SUNmcmFTNVMzWUdR?=
 =?utf-8?B?WHJOTkd5aDNsM201Z0VUd2NKYUZyQ3ZhSXNiVGR6MnhqNjBGTzdBU3AxT3k3?=
 =?utf-8?B?dWFWanlYaEpsSVNpd0Y0UHd4N2hOTGRycUgwaUI1MlFxU3BxZmd4Qzd2YzBy?=
 =?utf-8?B?M3c9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c12ab5-9636-4be9-3c50-08ddca307b8b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3461.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 21:32:53.8497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1eyq5BAmNw1WY8YH2yLaFXLJOWonYiyYi/II0z+dkPolJF1lUv0paIwC25UjyA72yPeGYUmzaL2+lSDbRGCtu83/D7vl+Q90ipEpS0DHIrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5552
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 dinguyen@kernel.org, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, krzk+dt@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 3/4] arm64: dts: socfpga: agilex5: enable
 gmac2 on the Agilex5 dev kit
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



On 7/14/25 3:50 PM, Andrew Lunn wrote:
> On Mon, Jul 14, 2025 at 03:29:21PM -0700, Matthew Gerlach wrote:
> > 
> > 
> > On 7/14/25 11:52 AM, Andrew Lunn wrote:
> > > On Mon, Jul 14, 2025 at 11:09:33AM -0700, Matthew Gerlach wrote:
> > > > > > On 7/14/25 10:25 AM, Andrew Lunn wrote:
> > > > > > +&gmac2 {
> > > > > > +	status = "okay";
> > > > > > +	phy-mode = "rgmii";	/* Delays implemented by the IO ring of the Agilex5 SOCFPGA. */
> > > > > > > Please could you explain in more details what this means.
> > > > > > > The normal meaning for 'rgmii' is that the PCB implements the
> > > delay. I
> > > > > just want to fully understand what this IO ring is, and if it is part
> > > > > of the PCB.
> > > > > The IO ring is the logic in the Agilex5 that controls the pins on
> > > the chip.
> > > > It is this logic that sits between the MAC IP in the Agilex5 and the pins
> > > > connected to the PCB that is inserting the necessary delays. Technically the
> > > > PCB is not implementing the delays, but the "wires" between the MAC and the
> > > > external pins of the Agilex5 are implementing the delay. It seems to me that
> > > > "rgmii" is a more accurate description of the hardware than "rgmii-id" in
> > > > this case.
> > > 
> > > Is this delay hard coded, physically impossible to be disabled? A
> > > syntheses option? Can it be changed at run time? Is the IO ring under
> > > the control of a pinctrl driver? Can i use the standard 'skew-delay'
> > > DT property to control this delay?
>
> > The delay is not hard coded. It is a synthesis option that can be disabled.
>
> Is there a register you can read which tells you if it is
> enabled/disabled?

There are a collection of registers that could be examined to determine 
if delay has been inserted by IO ring.

>
> > The delay in the IO ring can be disabled, but implementing the delay in the
> > IO ring allows for RGMII phys that don't implement the delay.
>
> All RGMII PHYs which Linux support have the ability to do delays. And
> we recommend the PHY does the delay, just to keep all systems the
> same. There are a few exceptions, mostly because the MAC has hard
> coded delays which cannot be disabled, but i guess 90% of systems have
> the PHY doing the 2ns delays.
>
> So, phy-mode should be set to 'rgmii-id', since the PCB does not add
> the delays.

Understood. The PCB is not adding delays; so I'll change the phy-mode to 
be rgmii-id.

>
> Ideally, you want to read from the IO ring if it is synthesised to do
> the 2ns delays. Assuming it is enabled, you then mask the phy-mode
> before connecting to the PHY, so avoiding double delays.
>
> 	Andrew
>

Currently, the registers in question are considered secure and only 
accessible by
Arm Trusted Firmware (ATF). I will investigate implementing this delay 
detecting
logic in a future patchset.

Thanks for the feedback,

Matthew Gerlach
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
