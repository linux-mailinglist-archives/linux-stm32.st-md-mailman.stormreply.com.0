Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C35A4E520
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Mar 2025 17:11:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 852BDC78F68;
	Tue,  4 Mar 2025 16:11:14 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2085.outbound.protection.outlook.com [40.107.249.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87FD1C78F61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Mar 2025 16:11:12 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XoUab3Q0XzVJbU0+mfhOLdwKkhmiCdp9eTqPM+D6613fgYkFZX1DQxZ8/tEQt4OFE2IdoWAkIFmtbYTSlGzG8+VOrX3Z9T5D7Zzeh8VfvSONZEVvhrQJGdoGsXy20zVAaeXMcp/k5q6qUuwwONtna9/xtEcf0HeCU/Yg/9uDh68T4YblQKKAfGuKGDM0lB6gBVqyY9C+PY/uIWYExwyi0+9oxutsLNjWNupe77jMDJF1OalFWaL+37RLIx/4mLOzfXXfjlHJn2bMRYWU0np1rkxs8kRuGu3eRhZsoiM/aXjU0XYYz/fN3/P4MYmSRYGlSdLeDm8VzsxLlQCOSWhIPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZHmSVz6uK2uMfG+roJHK1PyFmS0ZcFG/mtG50FhAWY=;
 b=rpgBCOEf5FQpXA9vySZxgiNscEcMpnWc7PfdhZhwFvgPO+IQQrBa2gkYMAydWMJc5ges52Z8JBi0/q/hSJ9yPO+BquAyP7J9dycSUqe9rgHCyLjN7P+tfNtBRZba1lJGmNYcE0FZ2kesnn1+HOnatwLPeYDlepZmGXiIZ3vJCurp13Nu5OzRhKt2Ll0HX13Wbrz8uQJ4RuPhYCr7Tt0kQbPOhhiSIG9Lbjmz7dyQCUaoywTd1mfO8fIPicHh5C3ByAon21ci5hD8W4l3xPrMbfM1GeQ6GehQyvDecF2XNjWtPvsKIMvtWAqs2Fm/gkk8Yi37M9devD/x2K7S0otXpA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=arm.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=arm.com; dkim=pass (signature was verified) header.d=arm.com;
 arc=pass (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com]
 dkim=[1,1,header.d=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZHmSVz6uK2uMfG+roJHK1PyFmS0ZcFG/mtG50FhAWY=;
 b=nYXfU+CuTLJEmoC5dby8zYmZ809Pfxj9aTrjbX6N9rndbErMMc0suPmvE3rtW6Gu2i3ya8Emg2gCoUWiKAJpsNKV3LfrgopbJLLfD+U7UqNGg1UBBfUcPbvOsp3QnaMkdvKUadux4e9QqGbIxgZgRgvjxvmyBPGLZursKIQnmb0=
Received: from AM0PR10CA0024.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::34)
 by PA4PR08MB7410.eurprd08.prod.outlook.com (2603:10a6:102:2a2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 16:11:10 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:208:17c:cafe::88) by AM0PR10CA0024.outlook.office365.com
 (2603:10a6:208:17c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.28 via Frontend Transport; Tue,
 4 Mar 2025 16:11:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Tue, 4 Mar 2025 16:11:10 +0000
Received: ("Tessian outbound 0a056dca8bdd:v585");
 Tue, 04 Mar 2025 16:11:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ab2c3f558ed2b790
X-TessianGatewayMetadata: ZM1owvzes7hdsnGp3gAbWUwVEiC5DxCzzQcxxNNNG4R1ZUJSa+0udjexHLjlWbWlR0R1fhBgQyeS3STYMpV2iJ/EOJb7Rw9qaDqRRBdStut5bfY/OkzhbGJ7sPNr6UWHEmWdcKUHxQlYelUJH9Gffglrie16SXqUFQhlclKq5E0=
X-CR-MTA-TID: 64aa7808
Received: from Lcee1ae4d5ef6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E282C6D3-AF08-4B01-989A-80132F211615.1; 
 Tue, 04 Mar 2025 16:11:02 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lcee1ae4d5ef6.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 04 Mar 2025 16:11:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shtb1ZGgkHCCVQUB8fl7k0R8uwjmJEMTDnym2AYaIEMgnkxOpZmkUMpNVO2tcZ8cmM74w8BH6VE6ASmeBpLiefT4E2VpV7lR6aQNtHm6gMgpoWvmREmAe3Lv440JmBmTf3ff5P8dHSj+qiYphregJ9aD/CGEidljo9XxC9NSDjW0YbHkcYj1ZVeKl29L/tycf5yAKvjs9mqvcuwiRGQvupGGos6tDXMcNdFUn5WJ2+cYuoCZk2PgWbj3tRy4YU1YKvjBPQ23uRSeb4/ackZ8/a4vUVL+NlYlNmjkZyPR3COJCKi84mnTU2rqujKy+0aI3sLEsUwSDATwqgxTPQmxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZHmSVz6uK2uMfG+roJHK1PyFmS0ZcFG/mtG50FhAWY=;
 b=K0uA/rNaHp9WYSoJyDpMuIWvY4WRXtC1dN2PEQATFDd3aNFV1iTcXIHN/phgF3TH/8rKdPbZCNL7fZoQyslQgZezO0Xtu9FhMNIfjkQaxhnmPagKv/jCWigfLnkL9NlAT1cmgxg8I0vymGV6s7m/znJqZkm3d2CDV8aXIg2FMDj3oXHAI9QUEOsLsaQ2pRKMnGuDNYAvsMTKEfBZt9M1ICzYi71cOnfsChBwl+ZxvGZ3DpWpBZTG+tGoXO6D2JZ/jhMI7I1qgRBhDdOECSj9myPf+G09Rt66ys4aQw/cbu0UdvUn/f9VZGIAukr+8C1WNAZYY55iK71c/9Uo19oaDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZHmSVz6uK2uMfG+roJHK1PyFmS0ZcFG/mtG50FhAWY=;
 b=nYXfU+CuTLJEmoC5dby8zYmZ809Pfxj9aTrjbX6N9rndbErMMc0suPmvE3rtW6Gu2i3ya8Emg2gCoUWiKAJpsNKV3LfrgopbJLLfD+U7UqNGg1UBBfUcPbvOsp3QnaMkdvKUadux4e9QqGbIxgZgRgvjxvmyBPGLZursKIQnmb0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GVXPR08MB7727.eurprd08.prod.outlook.com (2603:10a6:150:6b::6)
 by VI0PR08MB11061.eurprd08.prod.outlook.com (2603:10a6:800:257::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 16:11:00 +0000
Received: from GVXPR08MB7727.eurprd08.prod.outlook.com
 ([fe80::9672:63f7:61b8:5469]) by GVXPR08MB7727.eurprd08.prod.outlook.com
 ([fe80::9672:63f7:61b8:5469%7]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 16:11:00 +0000
Message-ID: <4e0959e7-cb66-41f1-b686-a274b6cbfd2e@arm.com>
Date: Tue, 4 Mar 2025 16:10:58 +0000
User-Agent: Mozilla Thunderbird
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Jie Gan <quic_jiegan@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
 <20250303032931.2500935-5-quic_jiegan@quicinc.com>
Content-Language: en-GB
In-Reply-To: <20250303032931.2500935-5-quic_jiegan@quicinc.com>
X-ClientProxiedBy: LO4P265CA0065.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::19) To GVXPR08MB7727.eurprd08.prod.outlook.com
 (2603:10a6:150:6b::6)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GVXPR08MB7727:EE_|VI0PR08MB11061:EE_|AMS0EPF00000195:EE_|PA4PR08MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 115c1cde-48d4-4938-bf69-08dd5b372dab
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?aVFGbURoV2RjODI4a0hra2NIRFFheUE2NFlOS082TUxrdzhPMFJUMFJXRTdn?=
 =?utf-8?B?WVhpZTlPZVVKazdaUTRZc2d1dnZvOERPQ1A0YnZwWklYdjVZVjlqOTd3UGUv?=
 =?utf-8?B?L24rakQyR2l4c2lvdVMrNEdmOFFuZE9TV2tKNm5SWmVVUG8vTlVLMFAwZGx6?=
 =?utf-8?B?UDlVNzYrQk5WRVhEek4vdlRMS0hQcEV4ZUs2UDM0NGw4M013NUU3c3ExVTV5?=
 =?utf-8?B?ZE90ZjFXcllUcU8wTE9vT0hpQ3lRMTBRWm8yUVFFQS9SZDJYUEhjYURFMjk4?=
 =?utf-8?B?b3phWFZ5bEFSTXVUMkFZYVJuWkZnbmtrUkY0TEdoZTFZYjMrNXoxWlNNZ1lO?=
 =?utf-8?B?YVJKT0ZuMWlIRWRBem93SFAxZGppc0VEVDdnbHo5SkFNZ2QwdVk4N2hwYTVP?=
 =?utf-8?B?SEpJUTgxakZLVUFJY0thaU1RYlhiSVRQa1llRmRmTlFUMDMvVFNZV2lzaHdt?=
 =?utf-8?B?c2E3QUtsb1lpMGZrU1ZLOVlqNlVjRHNWZlZDQ0pYTG51K1Z0R0xNT0ZobnFv?=
 =?utf-8?B?cTNaVXRnUjRCVm5iT3E0WnlObDc4WEluem5rZ0IrdTc0bnJ0Y2twMU5HTXFB?=
 =?utf-8?B?dFR1NVJqanB0b2htNFBka3NSeENQZ1FBWFY3SzJkUktMRk5DTVY3UXJXSlQv?=
 =?utf-8?B?bnI2YmZxdWk1R2dKdFhCRWwxTUdsa3FWcW5pVGkveWtFWUZDclg0Q3MxV01y?=
 =?utf-8?B?VnNhMWxRc1Y2cGJydzNmQmQ0RUFTMXVxZGlrcnhQZFQ4MG5US2FKV0tKV2FY?=
 =?utf-8?B?b0RJWnhZWmtHK2h6SThncVVGNVhlbG9tbDRvL0FSWjJpVTFtR3ZlNCtDZFFk?=
 =?utf-8?B?dzR6R1N0eGc3NHNVczdwMmtpN1VKaHlNVGMwcEVhK1U5aEZtTitELzNZY01G?=
 =?utf-8?B?TnRFS3ZLZjAzTEVvaTdxVVRVWHRnR0lDc0pUM2NiZTgyRzJpTDhzTGZOaTEy?=
 =?utf-8?B?RHhqZ3NoeG5YU3JETWVSaWxrdmNzVHFWNDBCMFNjdzJGb0tOdjkxam0rVWhR?=
 =?utf-8?B?OWRZcEhpU2xhR3JzbWhTUXdKMHk1MndKbTV1TkJBYzBIZ3NaV0JFVU91SlpN?=
 =?utf-8?B?dTQyNTczcTNGUnE3UVJ2cU5hMHVLMlpQdmZDWm5FV2ZqNFF5a3R5bVNWSGlD?=
 =?utf-8?B?dDBUcGxmSUNBdUl3RWdKYXhFTnJIc1JlWHh3bGZoc0ZweS81UG5FTDZWdDVN?=
 =?utf-8?B?SlBpZFcydEgzRm5iVzlkUWVKU0U5T1M2YStLWjZnQ3FMR3E3b3R4bGZrQnQ1?=
 =?utf-8?B?d1JVTk14YTA3eGU1OWpvV2xkVWQ5WnR0Q3lHTWoxcTlodUNNdnljcjJaOUJK?=
 =?utf-8?B?bU8xcm95NE8rMk1JS3ljT1dubmZScHFXall0Z25HZ2lJdUpsQXI2dGVTQlRO?=
 =?utf-8?B?NEgzQzh1bEVOMHhoRVJkOHNkS3hKK1FxQVJVTUZETXpEWXAvdDB6VTFYeHJr?=
 =?utf-8?B?Z0ZSek5ueTVWK0VBV3QwN0lwTVFmVmdDTUdONVRuTWtQQmFCR2RrYXcrRW5i?=
 =?utf-8?B?dnRzV1JJZ0l2czdXUTV4eFdNWmtNeGlnTFFWanlqZTcrL3U4S2RXc0tsbWkx?=
 =?utf-8?B?K0QvRWpTemVvdVQ0SWlUOEtRUFBlUmZoeUdoT05JZHBWQ1VqSk1tb2hwcTY1?=
 =?utf-8?B?VUNRbXBlR0xkcnBORHlESkdLRG9pWTNZZC9UQS9RNlVBaTNUdkh6RTZ3VVQr?=
 =?utf-8?B?amRsSkZIZ3UwZGg5bmY1MUJsNVRUcDhsQTg3dW5hWlNBRUk1YndseExscG55?=
 =?utf-8?B?SllBYzd0cVBnZTh1WmUrNEVWZlFFN2F5Z3Z4YWI1NDRFTEEvcnJDVzB6NGZ0?=
 =?utf-8?B?RU1LMXMwdVdReTdrMEVOVitzejFlTmFWV3V3UTZZQ0xzRVZTN1VUSE95TUZE?=
 =?utf-8?B?ekpKaEdnZDdkYWx5bkdmNTl2bUtQamNRVFZuaFB6bDBRdE1pZGV4MEw3cE1R?=
 =?utf-8?Q?8b/bhDw2LIo=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:GVXPR08MB7727.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11061
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:6b::6];
 domain=GVXPR08MB7727.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d796dd75-28b9-4788-a101-08dd5b37279a
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|1800799024|82310400026|35042699022|36860700013|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1pKL2ExUlRFTVJMdWU2TEdSZVRqSTduaXZNbDFVWXZwc3JBdmlzSVZkZUt4?=
 =?utf-8?B?V0ZGajl1WDJOLzc0OFJ3T2lsRXZ3L3pXRmkvUjdDQjhjVDM4MHV0bXJZYWZF?=
 =?utf-8?B?VG5RRWdHYkUrL3dBWitONVcxaDFqL0Jibzh2QTRqQi9yeTBOczhGS0s3a1Ur?=
 =?utf-8?B?eUtYSFR3aktWMGNZYTc1SmFTTXN5U1dheXlwTnZyWEU0dGtIRzRLTmxnVDBF?=
 =?utf-8?B?cWZ6YWg1eXJ2MlhtdlE5aGlIYVlnTSs4SnNiTkxhMEJBbVcxQ3VOMmJuVCtT?=
 =?utf-8?B?RXN4ZTFFT0krczJ0T0hoeGUraG1DUHN1QjFyV3RrWFo0M0NsRkliK3NmdkNi?=
 =?utf-8?B?c25RaGgveTVlS3dUeG52WFJoYWpGSURnWTlNMTBSTWk3ZzRjaWY5eXJnOUo3?=
 =?utf-8?B?azN3VW9HVy9zKyttSTRHYjZPWDdqcEpRRlNSZjN6em85RU9VWUxIbitsc0lq?=
 =?utf-8?B?T2ZQMjdjSUtnakRPTUNRbzB2d1k1TEt3Z0E4dk4wZVBucmo4aGtvZG9aRTls?=
 =?utf-8?B?MVZ2eHNhOFNyc0hLZ2Nndmp3YU1oSlViM0V6b0Vvemw3WmlWR01IS0Y0QW1u?=
 =?utf-8?B?VkNJaTlFUnhOR3hXcmlJOGpYeHhTVFFsaklNaWhZcDg3UUpMRFlYZlhIN1Q5?=
 =?utf-8?B?QmJBNFBwck9RM2IzRU80aWFKbSs1N2lZbTZkTEsrVS90cmYvOHY0OWZ4WTVN?=
 =?utf-8?B?OExxUEQvdGdodGFKWnU3WmRXRC9ieWIyVjBVSklPbUtoL2psNnF3bFpXVUlJ?=
 =?utf-8?B?cXljZ0RONi90TGkvNGt6SlVsa1BsVU9HanZrYjdGTVVSaXRVVnNSZFpSb2s0?=
 =?utf-8?B?UDR0bmZCR0U4cDcrUUlMUEV1VW9MZlIrV2k4dWFOZVptSEtVcDBoRCtDaWV2?=
 =?utf-8?B?N0dML3paaEVOcWxmbDFDMHBFSXl1OTVjb1lLaUhQaUFxTlJqOS83aHFWemlz?=
 =?utf-8?B?Q3BCYW50Mi91SkhKejFiSzhSVEtNUmt5d1pPL0UydkZXcnN2SzJtRmpmV2RX?=
 =?utf-8?B?OG42MXJMaU8yaFJmRWZVQVhiOGo1V1Vkd1dvR0lBZGxzSCs1anFEQ1pCSjZz?=
 =?utf-8?B?bnJ5aGpBRitYQkkwQ2s0Yy8yM1JRTWFrRlNPdDcvU0RZZFFQc3EvRk5MZzRZ?=
 =?utf-8?B?LzRWWTY0TFp1azdXSDgvcFY4WW1jM0xBN2thQWZEMjNVb2dPN25YaXcyR3RR?=
 =?utf-8?B?YU1hcWUxNlkxdmcrL1g2cncxczRNWVhSMjRMajFPWW52bW9MMDQ4eGFqUFdO?=
 =?utf-8?B?Sk41cEpzM0c1aytHanY2dUFZL1d5RGFheSs0VjhGZmZhblBpcnBpb3VGR2VM?=
 =?utf-8?B?dy9pM05PdkJsd0x2Ymd3RUFrbEVnSmZJUUpmY1JKYTd0SUFYUVV2bzVSeTJZ?=
 =?utf-8?B?ZXJRdTliS01LbW1BcC9iU1huMW5JZGlCYzJ0RVJXTFZDcmZqcWlmdDZMS1BT?=
 =?utf-8?B?eGNjeVQyMlJjWThRN1VXeCs1NTZvTGNJMW44M1NGZXQ1RGIxL0dRVU5pS0pl?=
 =?utf-8?B?TXVZd2gzY0JGYTF0VTkyYnp4dkdGNzlYYnF4L0VIQ3lBTG9EanhMZjBaVkkz?=
 =?utf-8?B?WjJ0c1RpeXdhWTlFVDBES3JQVVRlT0hrN0RCa29wRWxON0RmRU5kS3d2RlpP?=
 =?utf-8?B?S1pPdFF0blhobGtrUi8xNG91QkNRaWRnSG41a0dKLy82bVE4OVFka2NKeEpt?=
 =?utf-8?B?OWJ4MWczUXBHTUoxUldNaklYTE9YREhiUkd3Q2RydHZlZnJBeGQ3d0ZLWHBw?=
 =?utf-8?B?QmFIV012ck42bmV0MVdlT3QxbXZDZS94L1gvY1ZsZ0dSaFM3V3l6STZnVjhZ?=
 =?utf-8?B?cktIU2xOaFRrT2dLVFJxK2tpUGpybVBLRWMvOW9OUFQ0RkpMQytrNHUrdmJl?=
 =?utf-8?B?Z1BYNUMrUFd5Y2gwaGFkdzNNdEF4bGtTQWFNYmVGcng0L082UXVxWWdzRXRr?=
 =?utf-8?B?a2VNZVA2MlhEcjhCS3J6cFB6ek5aQTMydFNaZS9SNWdXRmtmQ2MxcHRtQjEz?=
 =?utf-8?B?YklwTUlWNTNMK25Ya3czYzNITlYrVUhKYlNmbzN0VU8yRW5NVnNDYjM4aEtJ?=
 =?utf-8?Q?colB/I?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(14060799003)(1800799024)(82310400026)(35042699022)(36860700013)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 16:11:10.3412 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 115c1cde-48d4-4938-bf69-08dd5b372dab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7410
Cc: devicetree@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v15 04/10] Coresight: Introduce a new
 struct coresight_path
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

On 03/03/2025 03:29, Jie Gan wrote:
> Introduce a new strcuture, 'struct coresight_path', to store the data that
> utilized by the devices in the path. The coresight_path will be built/released
> by coresight_build_path/coresight_release_path functions.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c  | 16 +++++-----
>   .../hwtracing/coresight/coresight-etm-perf.c  | 30 ++++++++++---------
>   .../hwtracing/coresight/coresight-etm-perf.h  |  2 +-
>   drivers/hwtracing/coresight/coresight-priv.h  |  6 ++--
>   drivers/hwtracing/coresight/coresight-sysfs.c | 12 ++++----
>   include/linux/coresight.h                     | 10 +++++++
>   6 files changed, 44 insertions(+), 32 deletions(-)
> 

...

> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index ce9a5e71b261..67cf8bdbe5c0 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -329,6 +329,16 @@ static struct coresight_dev_list (var) = {				\
>   
>   #define to_coresight_device(d) container_of(d, struct coresight_device, dev)
>   
> +/**
> + * struct coresight_path - data needed by enable/disable path
> + * @path:              path from source to sink.

This doesn't match the actual variable below.

> + * @trace_id:          trace_id of the whole path.
> + */
> +struct coresight_path {
> +	struct list_head	path_list;
> +	u8			trace_id;
> +};
> +
>   enum cs_mode {
>   	CS_MODE_DISABLED,
>   	CS_MODE_SYSFS,

Suzuki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
