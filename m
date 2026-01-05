Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EEFCF2840
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 09:49:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55CBAC35E3C;
	Mon,  5 Jan 2026 08:49:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ABB22C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 08:49:46 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6058f1ma2140274; Mon, 5 Jan 2026 09:47:47 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010011.outbound.protection.outlook.com [52.101.84.11])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bes49cn6v-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 05 Jan 2026 09:47:46 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atLwhXyWsrkiPnw+n/2tb48IsKZ19JAHIQ/yGTjDROOa8HryReXXHRFox05XK3tsCapEDhBkzVMm7aTtL6aB2Vka0cZa43qU70xVI9J/qDBpdTaEkNhsbGTBXNiybD5zwcPo3dKutU5XX97pCftRbwvFG7cfC5oME8vlWcH6KO3Xe4tX839AH/TRAhCosM9u1PyMaYK3L4nIQgksWXEEf75ZTFHFfM1LXEDGqlTHcCfmNM1bKGCx19B6+63z1z1Hv6MoUc0DL0fLeTqnhjqtf9VqFAPxKvn2XCg8rUejdwaaqC83KTRmjlhBrtgkIVoz0WBuRNv74RcDnAILLjgWag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3xh52/XKjC0tF4Djvh3yy7jAWyZvoLKM3db4JuEmpQ=;
 b=PY8u0T26w6D4doBOn7GsXkjId6DOOcJRfNZnY7n3bDNotmApxSvS1jFk0Z4P3S9xZvsFIUtiDRAJqQH8Z63kvxTPfmnH3Y+810T6YSAYdbd0MNdNJqnTO9kjQ9reRtRTvJ55zy5hoePuhSrBLj4oALvmLTz2iVPOBllTv/olm2Ub3Y0Pry97vKhgdbGetqlsdQ8rmYZsNVV/GlvOruKzuT4CKhUzYxCzTCpwXD0rz46QBoj6I2koU0Cy1wy8Uk1sge3rNpe7ULLLaNpRaeDJFtzIR5KRTMvAWHqN9bp9O3dwQbtfwOST2XpP/REKkhgqZsGJcuO2tT6+3iCGZoNZoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=infradead.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3xh52/XKjC0tF4Djvh3yy7jAWyZvoLKM3db4JuEmpQ=;
 b=NObvD2wsewLhvUbGa0Z+MRSG55jUVxSW8rg3UEc6NfyiHHa9rCCSfwpsVRkkXZJioy+QAAXm0/CeNHjcS6zGe9/dOt2iHSp1nTCTf1f9RilAGvp8aEuyoFtKATzjw+O0OgIx0m1F3m5JaEtYzpzA7MmvgHCzHY1sAPEtrwWjzadJlmJSnZ+LJaW1Cz+A+gdHAELsw+yviV27LZ9LG3distgm5eyYqCJllxCri7jt5NUI9udAB9xY3Y9fP1SfYG6hs3qQpZLAwPP6AKgGPzNfa6s5bUNYNdeATFwBhdNBva1pKqk7gCLggdKAMulFy5Qww3BXghqB+L153xA98hB+SA==
Received: from AS9PR06CA0476.eurprd06.prod.outlook.com (2603:10a6:20b:49a::35)
 by DB9PR10MB6450.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 08:47:44 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:20b:49a:cafe::f3) by AS9PR06CA0476.outlook.office365.com
 (2603:10a6:20b:49a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 08:47:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 08:47:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 5 Jan
 2026 09:48:41 +0100
Received: from [192.168.8.15] (10.252.15.57) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 5 Jan
 2026 09:47:24 +0100
Message-ID: <8491c1e39e94af90bf3d281fd786535eecf0d37d.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Date: Mon, 5 Jan 2026 09:47:23 +0100
In-Reply-To: <eb7c246a-6c5f-4d8d-bc96-2a71ece2e042@infradead.org>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
 <5e335232-89b4-4c35-93bd-efad7e4d8995@app.fastmail.com>
 <0220ec0592b6ef8936c25cffbc6cbfa0539fb71a.camel@foss.st.com>
 <eb7c246a-6c5f-4d8d-bc96-2a71ece2e042@infradead.org>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.252.15.57]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A65:EE_|DB9PR10MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e4c786-d4dc-47d6-203e-08de4c3717f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnNVOVNNMnVpNkE1TlkyWERpNi9iNm9nSkJQd3VtdnNMUFZVMllnTDVGMXE4?=
 =?utf-8?B?SzEzRHp5cXhkaWhvS1R1NlZDRGRpNFRTdCt4amJxUHJ1T25ndUhZKzlQZTZK?=
 =?utf-8?B?eFpaMHdwZnYrZndIZUhWQU81bXFzM1ZtTTBRc2prVk1CRVM2c01tUkdQSDV5?=
 =?utf-8?B?WW1ibFFpNHBaZ3h4STVnT0szWU9jQjFEdDlaTlBVc2tJdFJQOFVEUjJucXhC?=
 =?utf-8?B?c2FKUnVNM3VkQ3ppa0JBWEFyTHkwVWpkYW00ZkwvNzhoRlpweElTWjJjS0VR?=
 =?utf-8?B?Wm52bk5NUmdhWjRuQld1SWpBc3JQeUZOcXk3eWQxU2xtc1RYV2sxSEY1Smw2?=
 =?utf-8?B?TzNuSTMxMklCZEl0TmlLN2VndUZrU2dwZWJqR0NIa0F6VFdGWksrd2VpWDVj?=
 =?utf-8?B?dm5FNVMyTzRZZXFlWjVkUFJTeGQzVFNnaExmSi95d3dEN2ZQdnI2d2R4WUpv?=
 =?utf-8?B?Z1dRM0k2NlR3VkZ1UDZTLzdVTzVXTTRYWWVZZ3g0bWt6OUFLYlZxZ2U2QUhX?=
 =?utf-8?B?TzEzVlUxVVBMSlpHekc5WG9LMWVwQkl1NE1mTUhlbEdxbVlpUE9KK2s2NFp0?=
 =?utf-8?B?Y0NzTkJCZnJmVS9Lejk3a1ZreGZZQmRSc0pFZUpmZnRZQUQ1STlYa1QyWDBl?=
 =?utf-8?B?V0dlRUZVVzhWc1gzTEYxVzV3N1dvQWF0dVdOTnI0RW4vUEVzdkdkVEltUWR2?=
 =?utf-8?B?RVFWQ1JSMUFTdWk5bjNSWVZKNlg5NHkzelRUVDdYckY5aFdrdU9XN0pPSy9w?=
 =?utf-8?B?am5za25qUVVpTkVGVVgvRTlhS1RVczJDdVpTbis5SkRnbzdGdGREeEJDeUlx?=
 =?utf-8?B?ZFc3R3FTUGhOb3FEQVhTcjF6ejYxM2RHemp0Snp5Y3o3Z1hKR2Y4ZXBhcjhm?=
 =?utf-8?B?eTN0VGtlS2c1TnNBTTVtajdxNWNGUHJnMkhab2Z6RVU2ZU8xR2xZMUdURHNi?=
 =?utf-8?B?TCthbngxOFZ5WGd6TXltZkFUalZtdmJTV0dvMmh4ejZ1amFkK0dLZmJ2VHYv?=
 =?utf-8?B?ODRBZGFQcW1iY1orOHVxLzg5akZUK3g0ZnFJOFpPdkRGRWJKNFZKZHJtVDhm?=
 =?utf-8?B?N1RJNXJzNlR0Q3VvWHB0T0hNUkU3WGZWK3VETFgwOUpJdmtaMGEwN21KbFZN?=
 =?utf-8?B?ZmtBWG1QNE85WEpoWkdyUUJvRjM5YUhudCs5ZE9DcFk5MzBjR2ZyVmVaUWtj?=
 =?utf-8?B?bFJ4dlJ6TjZyYVdDeWxqR2htZ3l4YkZVRDlVY2sybXZxVFJTR1o0b2hIbWE4?=
 =?utf-8?B?TE1OOFJVOUFVWjAxTWlaZnpUY3paSlJOVGNXMXdlSG5KRkVwUTRFSzVoTFkw?=
 =?utf-8?B?UGgvL2Q4TVBkc3owNi85UE9jbk5tZDM5aFl6TkgydWNCSndoRi9vcmVEeFlZ?=
 =?utf-8?B?VTU4ZnpjSEZXcHBsSDhlZk9MZTdlYTMxejFRem9SWjZ1MWQ0YjYvelhKUzJP?=
 =?utf-8?B?VEdZamtMb0lkQzdVSy9NUWpiMWl3NWE3SU1rZE80ckhjN3E5c0Q0cFVjQjBz?=
 =?utf-8?B?Mm1lVk1LWnZDelB0TXZyTitnN0kzZ05hM1Z6QnNMeHd5TGFsL1dqWW52RHlB?=
 =?utf-8?B?dkZBUUQ1clJPaXU1dXpnYlhCTm1ZaDBlZjF0Y1g4KzVQVE5pTDY3T0taSS95?=
 =?utf-8?B?L3g2dnFlbjgyTWR0cCsyVEhNOWs3azluU0kvNVV6Y2NDMC9PcCtySDlWUVY5?=
 =?utf-8?B?bG1XU0lYRnBaR3JyUVcxaWZXeHRKd24vVEVXaDZseFNZRzNVRVNmTkJWQzRy?=
 =?utf-8?B?TEVhak13dlAvWGZaUURibmpBbTBPeTNQR29qRER2Tmg2ODR3V05hSGxsWmxK?=
 =?utf-8?B?eUVHSVR5Y2k3NUtFNlpCbmpsQmlLeEE3UU1leXhoN3lXRXFhQk5VT1pWTTBC?=
 =?utf-8?B?VmRDSW1BNTFhSnVLMDhIeHhnYWtMSU0vei9CT2FYL2JKVXJjNVNWODNEcjU0?=
 =?utf-8?B?UzZobDJJUVJ4ZDRyRzRZK1h1ajJHMGNHb0k5dER2QzRBNThMYzRCS0tzOW94?=
 =?utf-8?B?NDRITGlXcnJuVFhkcG96bURjamJrdjFpNXlFZzlUTDZxbmYxY3FEZkhGT0lo?=
 =?utf-8?B?ZVIwdVV4MHNid0xrYmxqMnF0Y21WRXo5cGxnclNzZ2J5K3VpaXJTNXd0Ymlp?=
 =?utf-8?Q?lwx0=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 08:47:44.1505 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e4c786-d4dc-47d6-203e-08de4c3717f9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6450
X-Proofpoint-ORIG-GUID: Q2xKsimjn_8_SEndxbUNjFjJidJ8T85Z
X-Authority-Analysis: v=2.4 cv=SvWdKfO0 c=1 sm=1 tr=0 ts=695b7ab3 cx=c_pps
 a=BbQle/hX7okVSdMXVTYbXQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=mo3wKCK1YPMA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=6Atwf4u63_rCRDoeYiIA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDA3OCBTYWx0ZWRfX17JPRf1rRGFD
 RqZ6B16ua571ljquLm7pUgZITWEuUhXtIkChw39JOYsXQmKakuZwVkB3sRUsNBvHZy+GqAaaO5V
 JVR/pPLfSJWmvkK0vjy46E9eQCtfIXt8rnYoa0EwoQCYDOW1tSa3mBpzSkR2UpYL0QNFaXd9Ycb
 /zzpNIQ5BhNwbHzybgWefK3f3cR2kkjrg9iv/Z1hCl0+8goWI9Ufz0kJ1eK0tcPIRu2GsNN9jhd
 /YeEDdOQ840esuG2PNKhCzNE/j5BbD10z6+NL11asXGmXRjLjDc63Sd2y8LfnOlfIuDB3dx7GyB
 5vtuoMXd4y/bkNBfijOSCn9cfYO/WhWCIpNQM9S/GgZT4sRHWmiTqRKvQ+DVHuBPJHALMB7deMm
 25u4N/pelmmUTSONDJ8ic6XZkaYkRm2YVpTUfWVoV6Rtm3jJ2/yyCIxxYdq7fMM0JRuZ8xfoosu
 6m5ch5AUlS202tabLzw==
X-Proofpoint-GUID: Q2xKsimjn_8_SEndxbUNjFjJidJ8T85Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050078
Cc: Jonathan Cameron <jic23@kernel.org>, linux-sh@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 andrew.jones@linux.dev, Paul Cercueil <paul@crapouillou.net>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, openbmc@lists.ozlabs.org, x86@kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Kocialkowski <paulk@sys-base.io>,
 linux-sound@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mips@vger.kernel.org,
 asahi@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>, Matti
 Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [Linux-stm32] Kconfig dangling references (BZ 216748)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gU3VuLCAyMDI2LTAxLTA0IGF0IDE3OjE3IC0wODAwLCBSYW5keSBEdW5sYXAgd3JvdGU6Cj4g
Cj4gCj4gT24gMTIvOC8yNSAxOjQ4IEFNLCBBbnRvbmlvIEJvcm5lbyB3cm90ZToKPiA+IE9uIE1v
biwgMjAyNS0xMi0wOCBhdCAwOTo1NSArMDEwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiA+ID4g
T24gTW9uLCBEZWMgOCwgMjAyNSwgYXQgMDM6MDQsIFJhbmR5IER1bmxhcCB3cm90ZToKPiA+ID4g
PiBmcm9twqAgaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTY3
NDgKPiA+ID4gPiAKPiA+ID4gPiBUaGUgYnVnemlsbGEgZW50cnkgaW5jbHVkZXMgYSBQZXJsIHNj
cmlwdCBhbmQgYSBzaGVsbCBzY3JpcHQuCj4gPiA+ID4gVGhpcyBpcyB0aGUgZWRpdGVkIHJlc3Vs
dCBvZiBydW5uaW5nIHRoZW0gKEkgcmVtb3ZlZCBzb21lIGVudHJpZXMgdGhhdCAKPiA+ID4gPiB3
ZXJlIG5vaXNlKS4KPiA+ID4gPiAKPiA+ID4gPiBJJ2xsIHRyeSB0byBDYzogYWxsIG9mIHRoZSBy
ZWxldmFudCBtYWlsaW5nIGxpc3RzIG9yIGluZGl2aWR1YWxzLgo+ID4gPiA+IAo+ID4gPiA+IC4u
Lgo+ID4gPiA+IAo+ID4gPiA+IE1BQ0hfU1RNMzJNUDI1IC0tLQo+ID4gPiA+IGRyaXZlcnMvcGlu
Y3RybC9zdG0zMi9LY29uZmlnOjU4OsKgwqDCoMKgwqDCoMKgZGVmYXVsdCBNQUNIX1NUTTMyTVAy
NSB8fCAoQVJDSF9TVE0zMiAKPiA+ID4gPiAmJiBBUk02NCkKPiA+ID4gCj4gPiA+IFRoaXMgd2Fz
IGxpa2VseSBpbnRlbmRlZCBmb3IgMzItYml0IGtlcm5lbHMgb24gNjQtYml0IFNUTTMyTVAyNQo+
ID4gPiBjaGlwcywgd2hpY2ggd2UgZG9uJ3Qgc3VwcG9ydC4gSSB0aGluayB0aGlzIGNhbiBnby4K
PiA+IAo+ID4gWWVzLCBJIGZ1bGx5IGFncmVlIQo+ID4gCj4gPiBJIGhhdmUgYSBzZXJpZXMgcGlu
Y3RybCBzdG0zMiB0byBiZSByZWJhc2VkIG9uIHY2LjE5LXJjMSBhbmQgSSBjYW4gaW5jbHVkZSB0
aGUKPiA+IGRyb3Agb2YgTUFDSF9TVE0zMk1QMjUgaW5zaWRlIGl0Lgo+IAo+IGFuZCB3aGF0IGFi
b3V0IHRoaXMgZGFuZ2xpbmcgc3ltYm9sPwo+IGFyY2gvYXJtNjQvS2NvbmZpZy5wbGF0Zm9ybXM6
Mzc1OsKgwqDCoMKgwqDCoMKgc2VsZWN0IEFSTV9TTUNfTUJPWAo+IAo+IEl0IHdhcyBtZXJnZWQg
d2l0aCBBUkNIX1NUTTMyIGluCj4gOWU0ZTI0NDE0Y2M2ICgiYXJtNjQ6IGludHJvZHVjZSBTVE0z
MiBmYW1pbHkgb24gQXJtdjggYXJjaGl0ZWN0dXJlIikKPiAKPiBTYW1lIGFuc3dlciBhcyBmb3Ig
TUFDSF9TVE0zMk1QMjU/Cj4gSWYgc28sIEFudG9uaW8sIGNhbiB5b3UgdGFrZSBjYXJlIG9mIHRo
YXQgb25lIGFsc28sIHBsZWFzZT8KClN1cmUsIEkgY2FuIHRha2UgY2FyZSBvZiBpdC4KQnV0IHBy
b2JhYmx5IG5vdCBpbiB0aGUgc2FtZSBzZXJpZXMgZm9yIHBpbmN0cmwuCgpSZWdhcmRzLApBbnRv
bmlvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
