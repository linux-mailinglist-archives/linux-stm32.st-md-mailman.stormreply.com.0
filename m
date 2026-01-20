Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJSzM2a/b2kOMQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 18:46:14 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8AE48CBF
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 18:46:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12523C5A4C5;
	Tue, 20 Jan 2026 14:07:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20C1FC57B72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 14:07:34 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60KE4cfL3801853; Tue, 20 Jan 2026 15:05:32 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012014.outbound.protection.outlook.com [52.101.66.14])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4br0e99u2j-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 20 Jan 2026 15:05:32 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kz/JLsM2dy+eFECq3SQgPThhUc0acb6sUEVEl/3v52AW/Yij+hoqdsL1YZ2hMk9rXsCf5ZWvYzTeMBNF/1DLXxeZysJpzc+e+IZ8nSShMwu02Btnk0E0sgBZBDlUROAH3X8q+rl+GW4HJmFuG3GZdeSATZoszgm2PDkFhG0xEWlVXB16CPnHejH+FrWYLVE+Uy8jONUjdbRSEGFynTcWnT64ir2xDNv4MGMrwyhixR5NRvUnwRnWpPwQ/pVVA+Gqmqot1dqr7hEAbRy7S1swryweHGqoRKhCccLReAveJ29M4W+932X9REYgapN1jUjLXYLQtKlIU0loSd/JaaEa3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uK1rkJgbz9vrKgHFg7PMymhJ7f4ARW3zGyiDqMDQpmk=;
 b=zDIf/kSb2mbV2gf8nQjyhE2tdImBhRDChoN/LvAKmxEGEbLZ5F2KmSUJaZoKl25sIZlb9C+eATRCAZQpt62+cIC8oRfK2F/eLZjU5c8WTHZ31xTgKHDZoAg0KJRuj7OQR9Sc0i0p/d3eSEkc8byXTpBipsVTNvFdTdEwKw77tRf5oEiE+Ai5rpQ0oZUn8XjRDvkb00Dqxe4yvcmYJ0QTo5l1qiciAPKMz2uOE7FdUHsFO+qpJsGN1eLrw2l48N46mls9zR2V3fCZqHmEmaV5+/pH4+yr9ifxZd85Xapz18MSH91+S6Bd+T2CpvTyEL+Hqa5ctELlCko93I8U5WJUgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uK1rkJgbz9vrKgHFg7PMymhJ7f4ARW3zGyiDqMDQpmk=;
 b=OqcmWN9GLDwNoXfeDgZOvNRJ6T8dHw3W/MfBJc6hNVFw0qB3dUMARUSpTjQ25XctYu/8V8T1t23bYbemxRncz+7rlud6FTTPayH2B26mhLqld6jnhkDV1KysX2u4233UmmLTBPEK57W0DIZoMyC71SCzz964OyjO7A/E+n1tCi7a2cY7GJRPqtNv1zr1TB9/tkMTb/9rAs1nnn0qO9wKLAQQhNR4YE30JSkLmJ6tey+21kswOlBWrWa2IBpZQgF+7c9B8oWrfoEjGjTJ/K6TgjkgZiXTrfGn6jXeZPo9s9bZntBkdr7ct8oaBM8OSmFJKSxlRgZjEFqaSoJhZ9jvUA==
Received: from AS4P189CA0016.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::8)
 by DB8PR10MB3925.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:149::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Tue, 20 Jan
 2026 14:05:29 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:5db:cafe::13) by AS4P189CA0016.outlook.office365.com
 (2603:10a6:20b:5db::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.13 via Frontend Transport; Tue,
 20 Jan 2026 14:05:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 14:05:28 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 20 Jan
 2026 15:06:57 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 20 Jan
 2026 15:05:27 +0100
Message-ID: <310ab5ef-bd29-44a6-927a-f82239499e60@foss.st.com>
Date: Tue, 20 Jan 2026 15:05:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Linus Walleij <linusw@kernel.org>
References: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
 <20260114-debug_bus-v2-11-5475c7841569@foss.st.com>
 <CAD++jLmW5_xDnA9UtKynaSzdM8aC439sB_n6suFmLY1TJ0cYbg@mail.gmail.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <CAD++jLmW5_xDnA9UtKynaSzdM8aC439sB_n6suFmLY1TJ0cYbg@mail.gmail.com>
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A4:EE_|DB8PR10MB3925:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cdbe002-c766-4de1-84ba-08de582cf799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVB5NTFsTitiMVpEWXhpTU9GRTJ0WEpib0E5bURHZ0laTzBPaXlGQVA0Vy9w?=
 =?utf-8?B?Z3FPNkhuV0Nnam9VWG13NElMNDJxdld6bVFjQTliVUVkeXZiS3gxWkxDZFFk?=
 =?utf-8?B?aGF5azBQelN4R0RmaFhIRmRiK1JyQ21ocUVhS2VnY3pOdFRPQzdURHgvUlh2?=
 =?utf-8?B?cnR4ZFJObXh0TllSUHZoQjRTVmVrcFhXMWhDMDBvWFBWZG9VK1ZPVHVzc1NB?=
 =?utf-8?B?MFZTcG5kd2Vsa21FTW1nRlgxN3Z5RS8xZVRHZ3BmeXRPNVR0cXNHL2h1dWpK?=
 =?utf-8?B?ZWdCa0VLVlZCaFlQUDRrQ0ZVZDRxY1QwQlZWdU5nazcrL3pYZWNLRUVkR1V4?=
 =?utf-8?B?N0NZMTQ2S1Urc0toSmhKMHBSM2U5RTJQeFBXVFdLeWZEWjFVWm9ib2Z6WnBQ?=
 =?utf-8?B?VUdiTXFqc2ZaNm1lekZQaXAwUjRMTUtHYjFhRUNaUHFpSmFNNzhGSGN6OUhJ?=
 =?utf-8?B?ekhzMDRNNUlnWG5NRTFBbDZ4aWlkTStUNnJnZlliZ3V0akY1YlljcXV2YjRF?=
 =?utf-8?B?c2NmanU2VVZiNExQL21qUjFkTDJtWU4vSUVkNWZERGw5YlYrOGJ0WmRjZ3ZT?=
 =?utf-8?B?ZS9BazZTSGNVZWNOdnB1MUsxTkMxVGd3d21Cb0VDWnl3Qndxdm5ZQnh4cjUz?=
 =?utf-8?B?N2JKalhsUGJHWElhN1RhS2xGTFkzbkplQ0lsUUEvMEo2NHNvTks4Q2JDM1Rx?=
 =?utf-8?B?SFBhSkNTMkxldWk5VlptVUplUDlZY0F3c0xQZTY4Wkk5dmdDcGtwcHZIa3NI?=
 =?utf-8?B?ak10UmxtQjR1YmYyTThFNkNsUDNEcnhQVUU2L0ZMMFhKaHlRSVljZnZxOGFz?=
 =?utf-8?B?YUN2bU9tOFVRMVR3VkhTZ1pWL0V2RDFEQUZHZ0VnVFFkdHlyUFF1Ky9YNDlz?=
 =?utf-8?B?NHM1aTR4SVFCTW5qTE5wTE9qd3pDVDNrNXBtdDlrM25vSzBRcVFzTGN6WUhx?=
 =?utf-8?B?aTRXT0Y0VFVzL2x2OWhEcWNwY09ab2lIbE1zRHRnY0c2bHBuQmFBU3ZZdWhM?=
 =?utf-8?B?TDBUYTF0K3ZiNlRqbnFUR2pUUXNmTWJBaEtmVTdLVWZuOW1DWHBrVGNTVWpJ?=
 =?utf-8?B?QU5SUW9sRTBRaXZyRURESlgrQVRuUzdCa3JqeUtOS0YwVXU4RzZ4cUJKcHY1?=
 =?utf-8?B?aDJEMlBUTlZqQWd2SU43RDBxbEZmMUE0dGh6dCt1WEFOa0oza1J1c0liMFBw?=
 =?utf-8?B?WDVRRkh4dUlRQzdIRnlwRDJZRytUSEJFeDBvYTU1c0pvcTAxai9xMm1QcTVF?=
 =?utf-8?B?UEgvRnlBcVoybS9MdUdnN3hMQXVlbllGRThXdjN1TUg5YnlYVnR4ejI2N3F6?=
 =?utf-8?B?cFllKzQvUHdvZlZSaU9DWnpXNkk5bnR0bHYvV2Y4RTZoNXNQekFXT1M5NlZT?=
 =?utf-8?B?K2h4Q3ZJeXNGMk1MbXl5V3dySHoyY3RMbjRKeWRUcElMMFJpb2ZkQjhORDhm?=
 =?utf-8?B?WnBPT2Z5bHBKSXFRRi9kdEQvMVlQWDRpR0p4Zkgram5MR2lRQm9TcW1jckwz?=
 =?utf-8?B?TUdvQW5uSk1Ra0NDYlBNTWZuNEkvdnFxSkV0MWxnUnpmKzFvNE03UTBqZDJp?=
 =?utf-8?B?RkEzZkVWVHFHTVZpOU9ySFR1ak4yZ25DMFBlczFqV0NTZTdmenpDYzdjM2JO?=
 =?utf-8?B?L2Frck1kYlFWaVVTeWh5alZJcTJ6bG9yazJDL29tdHZmcEROUmJnNk40Rm5i?=
 =?utf-8?B?emNIdXd3N3RpUHVzVXFMejZVNzZPeTI2NkloamJQMU9mTTJVVEpkbVF3Z1dC?=
 =?utf-8?B?dVB1Q0Y5SGpwSXAxT1NHM29FMllLOTMzSG5kVnh1ZXNXNkozektlOTQvR0FC?=
 =?utf-8?B?VUJqMjdXbXM5QTRhTDE4dTdUb1JQUk04K2FIU3VUSUJOMG95ZlQxME9qc3Bt?=
 =?utf-8?B?aUZqQnB1SGlVV0tGOFVKQnlwQmdoR2ZnRUNLQVNnbWNUM2ZsRnAzb1dSKzZD?=
 =?utf-8?B?K3RWNm1QUHYyMjVqTDY4d0VBVU9ZeGsxYjlsMWxWK21pQ1V6UFJOYTY0dWpq?=
 =?utf-8?B?QzcrU0JHTHJRVmErMGpBVFR3N0I1RG9ZNXdTUUV4aFVFTjg1OFFxM3VuREZh?=
 =?utf-8?B?VE40ODd5aDlUZWs2V3dEN1lFT3NCUE9DSm5DanE0OEd3dGlmejZXUUNyMjZN?=
 =?utf-8?B?Y3ZKQXZJM3pxZWhkV1NmTjRHUGNWNitWS01oS05STldYcWw3Rnk1ZlJKdWZu?=
 =?utf-8?B?bVJ2dHVjVHFDSG9PL1VsRnhNWGc4MjJLNHNFVkYxL3BzaFN6WUZSRkFTL1Vt?=
 =?utf-8?B?MW5tQ1VLVml4bEtJdnU1S2c0aTNRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 14:05:28.8151 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cdbe002-c766-4de1-84ba-08de582cf799
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3925
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDExNiBTYWx0ZWRfXxm+6pC7CxBVP
 OYk8lW8t/HHboamN9aOICkBvQ7rEpl95w3P8lzt5NzYIzfyGOO5s5DiAbYIbHXv0+ryzZ9w24Dy
 Ld4J1grBA5jtIFmmWC+5zQUSyRZ7K5/50TZHxawOnc7MVLphieZCz/xVLUHpLEwz2JSp+2OccIA
 VxZaXJY40VhT75sdQhb1rXmSGuV4iq9kA5AX9lUlCTNSRQofHag1XZstg4BKk/OlBrQDtkQ5pBU
 H2/my5YLYbG15JEQnzSVh2b4ItoFxT1GpETGgUp/IlC96l8Ye/HSngfenujqS7rVtFRU5/lpw3J
 qZlJpV8FA/1OqJDDjLQWc7GwPRYcSyzbbJr/dGin2YKhhDxSRDn1gqch7svt3McDbdSL1TT7Rrd
 CovEor1lHYZfRnfuAzpDpKYbUeq5dtLqX7lGLWpg2GaUrbG+0oXao55iN9b2sd5shkVj3/5duZC
 u5j1K/ZxXzB2BWTrx7g==
X-Authority-Analysis: v=2.4 cv=ZOPaWH7b c=1 sm=1 tr=0 ts=696f8bac cx=c_pps
 a=eFpRzQyoWvhnAo4uHDxzFA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=3jc1UR8r757g_BjvJPwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: U9eIyakqq-U99iqUUeShNabjPYAAcFY_
X-Proofpoint-GUID: U9eIyakqq-U99iqUUeShNabjPYAAcFY_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200116
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 linux-gpio@vger.kernel.org, Leo Yan <leo.yan@linux.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, coresight@lists.linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, jens.wiklander@linaro.org,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2 11/11] pinctrl: stm32: add firewall
 checks before probing the HDP driver
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:suzuki.poulose@arm.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:james.clark@linaro.org,m:linux-stm32@st-md-mailman.stormreply.com,m:legoffic.clement@gmail.com,m:linux-gpio@vger.kernel.org,m:leo.yan@linux.dev,m:mcoquelin.stm32@gmail.com,m:coresight@lists.linaro.org,m:krzk+dt@kernel.org,m:jens.wiklander@linaro.org,m:linux-arm-kernel@lists.infradead.org,m:mike.leach@linaro.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,arm.com,vger.kernel.org,st-md-mailman.stormreply.com,gmail.com,linux.dev,lists.linaro.org,lists.infradead.org];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 5B8AE48CBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CgpPbiAxLzE4LzI2IDIzOjE5LCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+IEhpIEdhdGllbiwKPiAK
PiB0aGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4gCj4gT24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgMTE6
MzHigK9BTSBHYXRpZW4gQ2hldmFsbGllcgo+IDxnYXRpZW4uY2hldmFsbGllckBmb3NzLnN0LmNv
bT4gd3JvdGU6Cj4gCj4+IEJlY2F1c2UgdGhlIEhEUCBwZXJpcGhlcmFsIGJvdGggZGVwZW5kcyBv
biBkZWJ1ZyBhbmQgZmlyZXdhbGwKPj4gY29uZmlndXJhdGlvbiwgd2hlbiBDT05GSUdfU1RNMzJf
RklSRVdBTEwgaXMgcHJlc2VudCwgdXNlIHRoZQo+PiBzdG0zMiBmaXJld2FsbCBmcmFtZXdvcmsg
dG8gYmUgYWJsZSB0byBjaGVjayB0aGVzZSBjb25maWd1cmF0aW9uIGFnYWluc3QKPj4gdGhlIHJl
bGV2YW50IGNvbnRyb2xsZXJzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBHYXRpZW4gQ2hldmFsbGll
ciA8Z2F0aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5jb20+Cj4gKC4uLikKPj4gKyNpbmNsdWRlIDxs
aW51eC9idXMvc3RtMzJfZmlyZXdhbGxfZGV2aWNlLmg+Cj4+ICAgI2luY2x1ZGUgPGxpbnV4L2Ns
ay5oPgo+PiAgICNpbmNsdWRlIDxsaW51eC9ncGlvL2RyaXZlci5oPgo+PiAgICNpbmNsdWRlIDxs
aW51eC9ncGlvL2dlbmVyaWMuaD4KPj4gQEAgLTYwNSwxMCArNjA2LDUwIEBAIE1PRFVMRV9ERVZJ
Q0VfVEFCTEUob2YsIHN0bTMyX2hkcF9vZl9tYXRjaCk7Cj4+ICAgc3RhdGljIGludCBzdG0zMl9o
ZHBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gICB7Cj4+ICAgICAgICAg
IHN0cnVjdCBncGlvX2dlbmVyaWNfY2hpcF9jb25maWcgY29uZmlnOwo+PiArICAgICAgIHN0cnVj
dCBzdG0zMl9maXJld2FsbCAqZmlyZXdhbGwgPSBOVUxMOwo+PiAgICAgICAgICBzdHJ1Y3QgZGV2
aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+PiAgICAgICAgICBzdHJ1Y3Qgc3RtMzJfaGRwICpoZHA7
Cj4+ICsgICAgICAgaW50IG5iX2ZpcmV3YWxsOwo+PiAgICAgICAgICB1OCB2ZXJzaW9uOwo+PiAg
ICAgICAgICBpbnQgZXJyOwo+PiArICAgICAgIGludCBpOwo+PiArCj4+ICsgICAgICAgbmJfZmly
ZXdhbGwgPSBvZl9jb3VudF9waGFuZGxlX3dpdGhfYXJncyhwZGV2LT5kZXYub2Zfbm9kZSwgImFj
Y2Vzcy1jb250cm9sbGVycyIsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiI2FjY2Vzcy1jb250cm9sbGVyLWNlbGxzIik7Cj4+ICsgICAgICAgaWYg
KElTX0VOQUJMRUQoQ09ORklHX1NUTTMyX0ZJUkVXQUxMKSAmJiBuYl9maXJld2FsbCAhPSAtRU5P
RU5UKSB7Cj4+ICsgICAgICAgICAgICAgICBpZiAobmJfZmlyZXdhbGwgPD0gMCkKPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+ICsKPj4gKyAgICAgICAgICAgICAg
IGZpcmV3YWxsID0gZGV2bV9rY2FsbG9jKGRldiwgbmJfZmlyZXdhbGwsIHNpemVvZigqZmlyZXdh
bGwpLCBHRlBfS0VSTkVMKTsKPj4gKyAgICAgICAgICAgICAgIGlmICghZmlyZXdhbGwpCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+PiArCj4+ICsgICAgICAgICAg
ICAgICAvKiBHZXQgc3RtMzIgZmlyZXdhbGwgaW5mb3JtYXRpb24gKi8KPj4gKyAgICAgICAgICAg
ICAgIGVyciA9IHN0bTMyX2ZpcmV3YWxsX2dldF9maXJld2FsbChkZXYtPm9mX25vZGUsIGZpcmV3
YWxsLCBuYl9maXJld2FsbCk7Cj4+ICsgICAgICAgICAgICAgICBpZiAoZXJyKQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIGVyciwgIkZhaWxlZCB0
byBnZXQgZmlyZXdhbGwgY29udHJvbGxlclxuIik7Cj4+ICsKPj4gKyAgICAgICAgICAgICAgIGZv
ciAoaSA9IDA7IGkgPCBuYl9maXJld2FsbDsgaSsrKSB7Cj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGVyciA9IHN0bTMyX2ZpcmV3YWxsX2dyYW50X2FjY2Vzc19ieV9pZChmaXJld2FsbCArIGks
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBmaXJld2FsbFtpXS5maXJld2FsbF9pZCk7Cj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGlmIChlcnIpIHsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB3aGls
ZSAoaSkgewo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyIGlk
Owo+PiArCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpLS07Cj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZCA9IGZpcmV3YWxsW2ld
LmZpcmV3YWxsX2lkOwo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RtMzJfZmlyZXdhbGxfcmVsZWFzZV9hY2Nlc3NfYnlfaWQoZmlyZXdhbGwgKyBpLCBpZCk7Cj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmIChlcnIgPT0gLUVBQ0NFUykgewo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZGV2X2luZm8oZGV2LCAiTm8gZmlyZXdhbGwgYWNjZXNzXG4i
KTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5P
REVWOwo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0KPj4gKwo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgZXJyLCAi
RXJyb3IgY2hlY2tpbmcgZmlyZXdhbGwgYWNjZXNzXG4iKTsKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgfQo+PiArICAgICAgICAgICAgICAgfQo+PiArICAgICAgIH0KPiAKPiBEb2Vzbid0IHRo
aXMgd2hvbGUgcGllY2Ugb2YgY29kZSBsb29rIHZlcnkgZ2VuZXJpYz8KPiAKPiBQb2ludCBvdXQg
dG8gbWUgaWYgc29tZXRoaW5nIGlzIHBpbiBjb250cm9sLXNwZWNpZmljIGFib3V0IGl0Pwo+IAo+
IENhbid0IHdlIGp1c3QgYWRkIGEgaGVscGVyIGZ1bmN0aW9uIHN1Y2ggYXMKPiAKPiBzdG0zMl9m
aXJld2FsbF9vZl9jaGVja19hY2Nlc3Moc3RydWN0IGRldmljZSAqZGV2KQo+IHsKPiAgICAgIHN0
cnVjdCBzdG0zMl9maXJld2FsbCAqZmlyZXdhbGwgPSBOVUxMOwo+ICAgICAgaW50IG5iX2ZpcmV3
YWxsOwo+IAo+ICAgICAgbmJfZmlyZXdhbGwgPSBvZl9jb3VudF9waGFuZGxlX3dpdGhfYXJncyhw
ZGV2LT5kZXYub2Zfbm9kZSwKPiAiYWNjZXNzLWNvbnRyb2xsZXJzIiwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICIjYWNjZXNzLWNvbnRyb2xsZXItY2VsbHMiKTsK
PiAoLi4uKQo+IH0KPiAKPiBUaGVuIHBsYWNlIHRoZSBwcm90b3R5cGUgZm9yIHRoaXMgaW4gPGxp
bnV4L2J1cy9zdG0zMl9maXJld2FsbF9kZXZpY2UuaD4uCj4gCj4gSSB0aGluayB0aGlzIHdpbGwg
YmUgaGVscGZ1bCBmb3IgdGhlIG5leHQgZHJpdmVyIHRoYXQgbmVlZHMgdG8gY2hlY2sKPiBmaXJl
d2FsbCBhY2Nlc3MKPiBiZWZvcmUgY29udGludWluZy4KPiAKPiBZb3VycywKPiBMaW51cyBXYWxs
ZWlqCgpIZWxsbyBMaW51cywKClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjay4gVGhlcmUgaXMgYWxy
ZWFkeSBhIGZ1bmN0aW9uIHRvIGNoZWNrIHRoZQpmaXJld2FsbCBhY2Nlc3MgdGhhdCBpcyBzdG0z
Ml9maXJld2FsbF9ncmFudF9hY2Nlc3MoKS4KCkhvd2V2ZXIsIGEgaGVscGVyIGNvdWxkIGNsZWFy
bHkgaW1wbGVtZW50ZWQgdG8gd3JhcCBpdCB3aXRoIHRoZQpnZXQgd2hlbiBhbGwgZWxlbWVudHMg
c2hvdWxkIGJlIGFzc2Vzc2VkLCBhcyB5b3UncmUgc3VnZ2VzdGluZy4KSSdsbCBzdWJtaXQgVjMg
d2l0aCBhIHByb3Bvc2l0aW9uLCBsZXQncyBzZWUuCgpCZXN0IHJlZ2FyZHMsCkdhdGllbgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
