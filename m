Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B915EB519C3
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 16:42:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C673C35E00;
	Wed, 10 Sep 2025 14:42:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B814BC36B3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 14:42:39 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ADfXFm004437;
 Wed, 10 Sep 2025 16:42:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 A/HosY8QdtI2YFkjE2rgp7mz75fjAZg8sUDW8DS6qz0=; b=we2tZ0p1NWExc+xO
 Ea4UK0GjFrjnS5Jcs8jhzcQ04q0HTqrDRwbBWhEVccWNfbF+zp1fvN1eSxmLmhqo
 OgHZPaz6qJzX9cGJzZBxVNUMHCRxrt5ofA9UOajOOjzqtFr1jsOIh2rGvMNeTa3p
 Ylsyk6a7fp41PI4Rq4Nc15J3NArR/VYlJ/09wmDLcYg1F80iOoYrkAtyVUXn5Sv0
 YVj8V/o3P6ErxvASszr/2YuuVLqQBIR67Yq2hWiE7kfTPDUo4K5KHcP1FSjEp4Na
 WHqqXtpvDAmfqYCI9W2n9RrHgljHBmMA9lIgNlkvsqLiE9WN5ln1T5RQy7HM+0Eq
 JjDzBA==
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011071.outbound.protection.outlook.com
 [40.107.130.71])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 492fr9ehrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Sep 2025 16:42:10 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jV0PlSzfdmaNoWSgzGc3BpTAlDCVbQIfKdW3k0EwfjtUTo0OKFEf5ow/PJTD1ijo686PWqieFHdanyOt1c4+C+ATaG5nt6KqusyA4q0EuiB6j4S8ojdSw3UA7sSsTYghdiWoAfL8dvMLOFegQYdDmOOl6I0n/sCLK2kAe4cstD7kVMSLr3GBCfbhmHvCkz2lYh0vrugato8TwlOcBMZibqJ9chZKdxOdh3WbBvrX5E+0HAm7/tSVwlB3lzfVpgLf2kprXNoDDlOl4bz1IXy+AAKnMwIjStZ13htV/8q1r5bvCmzgWDnPnhqw+I7QqjjwZX9qD0nuCTmBpsOWea5G9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/HosY8QdtI2YFkjE2rgp7mz75fjAZg8sUDW8DS6qz0=;
 b=XTDAlWzeb+EVMRmIJua2GfQh/+xHUKZbBq4hJDeMykjsZaYr8RjeeAUI6uHU/5C4J+PzUA+6h/M0PxhQs5hlcn13I7S6H0CoDNtmAPCMAxl/tyB/JZuql1efdSfUwCGlq5AB/fWPHmb29lt0HG4Wkf+sCOesxxPI2FtDaaO5YV20AuWicmuoV2BLog3YQ5zMpiqYkLxlzJ81VorYuTj2vaZTHdUoogH86PHfvfqyDzVoQo54YJ6OpZWMdERsOfFAkOMvctatjy/N8vlVx1cS3ghV4TmR40aewHO5jBafOFy7HnI5PtvKyGPw1ttJk1fV387XBa/R4oqFxpZhIGBAoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=armlinux.org.uk smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/HosY8QdtI2YFkjE2rgp7mz75fjAZg8sUDW8DS6qz0=;
 b=lxSywipVFDvIUwgOdm7wU0JCZvcOorW1XPOzHQCNpoO2+PemMpfsfcfNBj4cdwPm8TU5dQ9mQrX90x5wL9r1HxdrsjASRDA9dnI3mQjbkz5LnHisdX+JktlDD5kdf/q7oAs7cTWvemMinal8iwHa5g31RdJ3ryFQ0IHYqqWrlQA=
Received: from DUZP191CA0034.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::11)
 by DU0PR10MB5827.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 14:42:07 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::bc) by DUZP191CA0034.outlook.office365.com
 (2603:10a6:10:4f8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Wed,
 10 Sep 2025 14:42:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 14:42:07 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 10 Sep
 2025 16:34:57 +0200
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 10 Sep
 2025 16:42:05 +0200
Message-ID: <94e20b19-eb89-43c1-9a7c-3a529c60be8b@foss.st.com>
Date: Wed, 10 Sep 2025 16:42:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
 <E1uw1Vk-00000004MCX-38Zs@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <E1uw1Vk-00000004MCX-38Zs@rmk-PC.armlinux.org.uk>
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0D:EE_|DU0PR10MB5827:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e1cf05-e171-4368-12ae-08ddf078379b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2h0ZS9JQ1d3NEhDQWxXblhhY05GNzlabFFGOS8xTHg2ZjV4WXhnMEgzUnJB?=
 =?utf-8?B?SXp1SmFsd05BamxacTBqMnFnNFJDd0pCcEp1aTdmQXk2RHhHSlRvUzZIdkZU?=
 =?utf-8?B?SlpwQVBJZFRSUlkzTmNCOE1HcFIvdFIxQ0JNQUxyUXphdklBWnhTV0o2UlJG?=
 =?utf-8?B?ZTVXZWZJNmdUTWQ3Q1Y4NzVBY1V5MUNPQ2NTS1BVandVSFp3WjdJT3Ayb3ly?=
 =?utf-8?B?U2dXUytGN0pCb29la2JwSDliNFp2bldlYU5BUDQ5NUpMWFN3WW00Z2JxbUow?=
 =?utf-8?B?b2o2aHZOOUFhVGlVVUIvTHpuaUgzdDZNVTdPR0FRMEx3MFpHVTZmQjhTYTRi?=
 =?utf-8?B?cGlmREdmVUdGS0dRQnlmZ1pQejJrWlJERHhPSXpEa01ESFBJMkd5SHNwR1Rl?=
 =?utf-8?B?cnVUOEFvbzBlZ0s5WG9id1lpWWowc1p4SUNpM1haYWxKZXVPK3VEa1VVZU9x?=
 =?utf-8?B?eVI1OUhWdmgzYjl0aWduNEpkNnFDV0JoSzFtRGE0V3NnUWErdnRPaXloOFFV?=
 =?utf-8?B?NlViVU1id3poQ29PUmhVY2VYRGR1Sk1sWEFza1QyUktuMG93NEcrbVRHdVQr?=
 =?utf-8?B?RFRkRDJHOWR4cFF0MXhSTitNSnl6SHI5WTZ4ektFOEFUQ0p6U2hlV3liaFJv?=
 =?utf-8?B?cHZTdVA5cVZuc3RPMWtWdVIrZnRYdm4vbGtYcDlLazdjWUc2TlMvTXRacmhu?=
 =?utf-8?B?cXJ6SHJ5ZlMyWVFuSkxvZWJXM3kxSmhtN2tidm9IQWgrVU9WUGlGM0ZDYzJk?=
 =?utf-8?B?TVFNOS9WT3JJeVFxdnJZVk9BZzhnVktWZlNlV1VGN3Q1bVd0OHppQkRwRkQw?=
 =?utf-8?B?UjR6RHZ0c2U0RC9ndnFRMm9MWkw2L3l6aWZhOGQrMXZEaEVGMlRCL0ZMSnN2?=
 =?utf-8?B?U1NKUzBMZ2FWbmdZZVcyNElONTMvajVKZ0JQSlMwL0p2eTZLbzJvRmZJK1ph?=
 =?utf-8?B?ZSt0RXRtUHlwRDR1MmdGd2lIeU9odkxTZ0sySFNaZ2FJWVhwdlhrTFpvQVl4?=
 =?utf-8?B?RjVMWDE1bTBNWkk4SW0xZUgxbnlJN096bEhOZE1UTXRPQ2hJUUNsK05VUUhO?=
 =?utf-8?B?ZWJROHc3bjVOSmJpcTJ4VndrMC90djQ4cWd4dDd5ckREblFNU0VxVXJrZ05z?=
 =?utf-8?B?MU01S20zdUdOd25NZnFmRUNIWUsvK2IvaVFjSm9CK2trWXZBSzkzNGlOb0lq?=
 =?utf-8?B?dXcrQWlCQ2Zad0prdkZRSTI4TkdNVjRBMU9HWnFjdFJFbmF2emhsdmgxWSt6?=
 =?utf-8?B?TmlURlZlczJHaVpyaEdOU3lyQ2F2WXM4Nk9wcnZGWXNUQmQ2SnFlUTN2OEpR?=
 =?utf-8?B?djdpZ0Z1K1hjTXpXWFRoUkZmWXNXM0xNUXRORFoyOTJLUmV1V2xJb1ltRzVl?=
 =?utf-8?B?N3NOZnJ4ZE9NajNvc1kwbHc5b0lsenZDcW9FRzYzcHJ5Y2Q5Wk5XT0I3MzlV?=
 =?utf-8?B?OFFMdGZlTW5EWE9FeEdlQjRhQkphd3lXMXJ6dVN4SnJGQmxJWmtlREZHdU5i?=
 =?utf-8?B?WjV0VUVyYWdNdEY2bkpzTzVUYXJUWDdwclIzSStwekZjWkh5eTBWUkNQNWxD?=
 =?utf-8?B?TXdYaHdkVGZPYVAwOGFuOFpacG5yU2l4V1hjMFJkU0pkQi9kSFJzZEdCbG55?=
 =?utf-8?B?T21qbHE1b0hZVU8rdTMrYlV3N1JnUVRnT1oxU01uNU01T1ZLWENrOWxPZlNm?=
 =?utf-8?B?NExjb2piVCtNZFhBUEpYdUtteHhrNmhzQmJYYmZYNndNeG56T21rNmYxZlFF?=
 =?utf-8?B?ZzF4OGFxeVpUWDEwNyt3NWthdGw4aklVREExL1hSdHpMNEV6WnZqU0hiV2c5?=
 =?utf-8?B?Nkk4Y1hlVDhiSi9CNHB1MEk0dythSVU3R2d2eVlpTUVlRk4reWQ0NGh4KzY1?=
 =?utf-8?B?cnUxWHUxTjZQMnVmNG14b1gzSzJnNjR2bmZXbWdON1F1SStSTFo3bjdhaVoy?=
 =?utf-8?B?TEN6ekp1MXpCdHlNbDl1YXFIUXdSeFBOaEJRckdLR3NGZDVkM2RNZUlJVVFQ?=
 =?utf-8?B?eU85NitXeXlEYVlaWUpaajMvQkRVMlJIcDZ2NktXSE1CL0R0MFdldUNoMlls?=
 =?utf-8?Q?x1hOqN?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 14:42:07.5223 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e1cf05-e171-4368-12ae-08ddf078379b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5827
X-Proofpoint-ORIG-GUID: BrPVxs9SIdeHz8vATuujD2qPsJRu7ZHa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDA3MCBTYWx0ZWRfX3LOXBVD8jkBh
 pMNqMq7W+kDqGEmcP3IJ6GQV0q0/j15Sv4AflqMr3iGfj7fjbWAtt3gMOeRtCFegUTMowPBlPPz
 zRd6QJAgekXHAGKqddw3oye+Q1JxXICwWIc2KnObmDlgG0HNJppfZdl9ozEW9j26MrIonhiqEUf
 Zd8unjBhvt4l+3lXagGh978ESDJubek8F0f/EZSVUhMlUrdlDaSYxmK0SdfZ3rBxhvcFM7weJ+C
 aFG9m30jah6YpPIVYeLGNbAwIdc0o1FEka1jC6KlmkaD5aT1Qwh5cp6KxliGrkGfvrulR9YTegO
 mRMRL+0YEiN3qFarxKALIvcr2TvK430ezCVlSWKxgHAIYhm1gCIvtV8cJWUSJrrUxStpS660UwN
 2SlwQDS4
X-Authority-Analysis: v=2.4 cv=We8Ma1hX c=1 sm=1 tr=0 ts=68c18e42 cx=c_pps
 a=ng2v5I1XFi+PtHXJtWjLGA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=ei1tl_lDKmQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=PHq6YzTAAAAA:8
 a=HJyWv687w0HGLkmQ134A:9 a=QEXdDO2ut3YA:10 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: BrPVxs9SIdeHz8vATuujD2qPsJRu7ZHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_02,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 impostorscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509090070
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, John
 Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@fomichev.me>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 08/11] net: stmmac: rename
 stmmac_init_ptp()
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



On 9/9/25 18:48, Russell King (Oracle) wrote:
> In preparation to cleaning up the (re-)initialisation of timestamping,
> rename the existing stmmac_init_ptp() to stmmac_init_timestamping()
> which better reflects its functionality.
>

I agree it's mostly about time stamping but if the ptp_clk_freq_config()
ops is implemented, then it's not only about timestamping. Wasn't it
fine as is?

> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 716c7e21baf1..7cbac3ac2a9d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -773,13 +773,13 @@ static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
>   }
>   
>   /**
> - * stmmac_init_ptp - init PTP
> + * stmmac_init_timestamping - initialise timestamping
>    * @priv: driver private structure
>    * Description: this is to verify if the HW supports the PTPv1 or PTPv2.
>    * This is done by looking at the HW cap. register.
>    * This function also registers the ptp driver.
>    */
> -static int stmmac_init_ptp(struct stmmac_priv *priv)
> +static int stmmac_init_timestamping(struct stmmac_priv *priv)
>   {
>   	bool xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
>   	int ret;
> @@ -3502,7 +3502,7 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
>   				    ERR_PTR(ret));
>   	}
>   
> -	if (stmmac_init_ptp(priv) == 0 && ptp_register)
> +	if (stmmac_init_timestamping(priv) == 0 && ptp_register)
>   		stmmac_ptp_register(priv);
>   
>   	if (priv->use_riwt) {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
