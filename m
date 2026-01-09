Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09825D09B92
	for <lists+linux-stm32@lfdr.de>; Fri, 09 Jan 2026 13:34:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57A5AC8F286;
	Fri,  9 Jan 2026 12:34:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99417C8F27B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jan 2026 12:34:55 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 609CVHcs3880014; Fri, 9 Jan 2026 13:34:34 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012041.outbound.protection.outlook.com [52.101.66.41])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bjqctt7v2-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 09 Jan 2026 13:34:34 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBTYd3rdZKVWFvPwgQEqGHKWrLFwFRnYkM5V0C6pyjzhgWtHZFDQb6V0GRQ1BoUDX6hYlZTOdlgviFNYlEJ5dvp4TeI2CXGMTX8ljSx9HpG7t0ji4YxCOLPioCfGEYKZCFwutsr5a0JGv9hTPeKd+DHHlTw7JymWoaISswq47cyDs5eyPr6n5R/Y9u4uahIQUCrca9wF/Ch1+2BOSGpIARPp1hzEtcmrJVMJvFaMyYjf28RYldwV7E1b4hLWVW1a/MRqYKX1hNOl3abM7+iPEdWmFHZbgS8epUTa/nUn07LQ/CGcnHUe8arc1wm2eP50eq7QG0evlJpHWLeZ/H9zoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynJGk2UFrGUmLWBjx7UGUFmhWxRrGX8HO1Stc99QgWY=;
 b=Rfb1gPtGMp0YNPZjsXNvtmKC0AUcJyBAtUOEIpJLPbE08G3rYD/4L96tPxb8CkT3PLYTz+jDCVq8typhjwcV2gQZSJ/THMcx/f1O8UvqmvPGJWawu60ygqCdtTw3HhGnM0sMocVawUnmUqeXMemwRhG/WwfS9n5ZBEa22/2FteindPUFtufeYW9moL/rpZaG9AVhzxW1SNbPwHHpzPUx1GkXNpJlVb7DSYtQ6OU8R5W8pWveOdf/nS/Ti+0F+vMW3Q7h3z1G1WDYtphk58nswA36SgdLvtiQ9atDgfxKAQFmTOLLn+rJkw52C13uGRXRmhq4GcNEREDQvfO8XAP7GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynJGk2UFrGUmLWBjx7UGUFmhWxRrGX8HO1Stc99QgWY=;
 b=efISTupxRu+MCtswvcwI+ghExbvBgCjrXjOGX0F0kXvHXss0XnHHHbf7CWNRWMvFvaS8RhNRvh/uV66fe1SOkb3oM0iNEFF92UVI//aHN1H65pJm7jag4fP9A10I+ksXy6fQgSks0muTDXow/AyUAZZuMU0jj43jk6LSh1FDKyBHZocyeuDMjeKk4Fzbnpxx/q4DvUfU7MH/YIEx1VUcCyArMYNrAFSDXof72NcX7rlqDQpcNTUKPjDSExF5ZeD/fhGayWflI5TOcCIcV/3Ux6Hbx9cEG9RHrFAKzl3jEOamw3DfFtcMsDGdnY5He15j5AkPJSsXqk9DSCTIPYDByw==
Received: from AS4PR10CA0023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::15)
 by AM9PR10MB4037.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fe::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 9 Jan
 2026 12:34:32 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::ba) by AS4PR10CA0023.outlook.office365.com
 (2603:10a6:20b:5d8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 12:34:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 12:34:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 13:35:48 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 13:34:30 +0100
Message-ID: <cd8fc344-37a0-4281-b3c0-29514b97f5f3@foss.st.com>
Date: Fri, 9 Jan 2026 13:34:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, "Bjorn
 Andersson" <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260105143657.383621-6-krzysztof.kozlowski@oss.qualcomm.com>
 <fe8bdea9-4bd2-4200-8b7c-3c231dc6dcb2@foss.st.com>
 <ccebe9a6-34e7-4699-a4ff-1ee925f9c150@oss.qualcomm.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <ccebe9a6-34e7-4699-a4ff-1ee925f9c150@oss.qualcomm.com>
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5D:EE_|AM9PR10MB4037:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c8c8c8-37a9-48de-e504-08de4f7b7057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDBpVkhvblRZZ0xWTUlCVm4ybGEyOWRqdUVLcW5TaEt3U2ZVTFhXMy81Qklr?=
 =?utf-8?B?U2Qxb01zZ29hNk1DTzhldE05OVNPb0dNSGJwQUQybEdVUE5TN1A2a1JDdXJQ?=
 =?utf-8?B?ZlNzSVNmeVFiUTE2bkNhdFdVRU9uMDVQYTJHRzJhQlpzY2RtWmQ1YlFlUW4z?=
 =?utf-8?B?bGJTYWh5Q3lXYkQzd3lVSHVSV3RkbVFOemhjRkxwdWZXN2grTW54WkE3QVpH?=
 =?utf-8?B?WER5RU51YU5IS0lsOXJVSGJUbEt1WkpibHg2M050NGNXZGxTc1BWemJvSVpY?=
 =?utf-8?B?bS9NRHZVNUlFZXFLdG9TTldPQ3lmVHNJTDFUSzNlbTRobE04M2xDb3RRQ0wy?=
 =?utf-8?B?UjY3a2ZsS0JYamU4aVZFbFRaRnZtS1p1QmN4OG9YYmdZUXk1ZXZxV2M1aEJ0?=
 =?utf-8?B?dGVkSjRnUVVSbDEyd1lwY2NUMHhsZXpUTDEzeThoQ1lCaytpN1FVdFNYdnZn?=
 =?utf-8?B?VjFwbGlxbUZYdFRIaDVrT0RKNy9aK2tJdXY5bEFUeU5QUERsUkdtTnF6K3pQ?=
 =?utf-8?B?TEM3V29EZ2U0TlNzek1NT3V2dHhYU1FoS3kybmR5R0lQaUg2amMyZFg2L0or?=
 =?utf-8?B?WGJIaDJ0S3lzbUN0YmlvYXZGcGNKRWZmUVJtNWY4WHRBa0xjQ2wvZzdHTFht?=
 =?utf-8?B?NlArRUZMY2kzdXN1M2R0QU9aK3pza253SmJBdlZyQmRXK0VxRkk4VzdJVGVo?=
 =?utf-8?B?dVJOZGZ4QW1WN3VpeXlmbkZNczlhbEJCL3Y1c0U4WmhPb3ZuN1dTcHJZRWZq?=
 =?utf-8?B?aWFtWFpDamF4YWhPSWhSa3gxbDREWjJSTUNxTlIvb0wvU2x1NnNKU0RTUEFO?=
 =?utf-8?B?NnVVVlpOZzA3VVpIYS80NmF4M05sRjI5UDRUYzJZV2tqeHpTOUhtTlV0bkN0?=
 =?utf-8?B?S2xpaXVUSm9nMlAyS0VZNURYUGFkNkhwdE40bHJES3RxVUV2L1BSaWVEUlVy?=
 =?utf-8?B?UHlRYlFPSUlEK09nWFNuNDZoZVY4MVFNc0dpNWc2VUMwM0IrcENURGo2TkJn?=
 =?utf-8?B?dU5nK05EYjhGV1Z4Z0ZxZXRpNjNxU3hUOGV3ZXhPbWlhV3hnYm90V3NqZGtm?=
 =?utf-8?B?VE5mS2FSMnp1cDVoU3F3bW5CMzZyZzJpdFVqa0tya0xKcTY2aHNyYXRoUGRT?=
 =?utf-8?B?eHFyWi9hS2htczdlZS8rdThMVFkySHpsSHkwVHNxS0o4d3ZEUGtUclBUdGtE?=
 =?utf-8?B?dmdob0tXcXZJZEdMNS83SDU5WjlJQzNYb0JZbFoyS0FHcjZjNisrYWFxS0x2?=
 =?utf-8?B?Z2hqS0tOam9FdVEzQmxxK29JS1BWZWllOXlwRjdCNlNiY1NiOWhSQ1p5RmFX?=
 =?utf-8?B?NXpxR2JwM3hNbGRuNkJMZkI5dHpESUYrZ2pWTjBVejFVN09wcCtpa1NyLzFU?=
 =?utf-8?B?MWg2M1p3WHMxUmZCZitMR0RmV1AxZWp2WmxlYU1KM3luTkxvWWdWWjdBcXY1?=
 =?utf-8?B?aml0M1hPT2p1SjExWWtiRi9mTURoZUxLWVB6UUNlTjdLYlRwS3lKdTl1MnVq?=
 =?utf-8?B?b3BOL2lYd3k4elE3M3BCNXlOU2dGOHdZSTRZTzhWaWVjWVp1ZlR4cGZITEZn?=
 =?utf-8?B?ckFMcjVqSGFsNmNDQ0FUSHc1SlYrajZJMkN6QldJUXBOVjl0RGg5SExuUDNi?=
 =?utf-8?B?bm0vVzdVTnh0UnlXUDFOeFNrY205R2dEL1FhQXFtbC9rYklKa3BmVUNGb3Qw?=
 =?utf-8?B?ZlV0ajZXdGFlY094RElTMUdBVU1jQ1E0eVQ0MlRtUWU3ektUaTJ3Z3dEY3pQ?=
 =?utf-8?B?a1BmRGR2Zk5HaVFTMHdIaEtEN2FwN210TFc1Zm83MVR4N2VQWGlmZ2JuZnVC?=
 =?utf-8?B?Z3IzMmJtZnNtbFYzK1dkTDZtb0dNZXJHOW81d0huc0tNdDZsRFZDZXpPSkl6?=
 =?utf-8?B?TjBSSmdEeVlEcnRNYWNLUFZSc2xaWkpER2pTREhLQThDZE9nT0F1dUpKR1lF?=
 =?utf-8?B?OTFEbkJReFpLbTFZM0FieUg2ODNEMGo5N1NWcVNmMzIvdVN0eGpVY1hXeWhM?=
 =?utf-8?B?ZUg3MG1mS1kvUXprYVdIQStnQTRJMWFERURpUE1LSmZQbk9sMDdEQU81SnZO?=
 =?utf-8?B?UGtGSFFiM0ZxRmEzbnc3a2pOcTFqdGl2U2FnKzRkNHRKTzE1T1BXRkJ1clZw?=
 =?utf-8?Q?J2GA=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 12:34:31.6803 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c8c8c8-37a9-48de-e504-08de4f7b7057
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4037
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5MyBTYWx0ZWRfXwnKCUu6TdhCA
 T/NZMpJycRnSsfZwynhl/LePWEfGGhdPjuZBLEot41aj2g5l4V0Jo7iWEJ+0hl+YIuwHSjuJ6Kj
 Ro1un6AgelYJY4ZAAO5msRz2+Q994Um6bZJ4UzgAlHLiY6OAaDKVIuCw93ephVqpQL/DNWhXKyO
 fdhyfHjzLvpQT/vbEUqGasCNNV1MMHVSeqRloDKVar65f2jCRntivXYRQ6Kpb2Dq9siK6Sm6bEc
 TwKopQRbHEQxj2HRkFAj3V1ZCoM0lasED1XM4GmMMOrS+v3AA3Ak7Z2wiy2YdkquROmwtJCeiGr
 YD5s9j260ROeoyKSiUq0jlfTjL1RQ1H71xAOGMO/dZxQM9ZXmltUBG4dQZbQyvlu+PkSDkA1P/q
 WH2s54bK8t0Y1yDlgB09PrQNvqWPb8+12QqwAlpahLQyr1aTON257MTXcqccrMiXDjabX+fP00B
 5ZVgH57oTTwiv28+psA==
X-Proofpoint-ORIG-GUID: HwrwR1O26mhR_vCxfX5tq6r0puxYXG11
X-Authority-Analysis: v=2.4 cv=RubI7SmK c=1 sm=1 tr=0 ts=6960f5da cx=c_pps
 a=GxenEFv9DmgebrKzBBA+LA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=8b9GpE9nAAAA:8
 a=MNamDEBCCk8IJXUJmIkA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: HwrwR1O26mhR_vCxfX5tq6r0puxYXG11
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090093
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] bus: stm32_firewall: Use scoped
 allocation to simplify cleanup
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



On 1/9/26 12:55, Krzysztof Kozlowski wrote:
> On 09/01/2026 11:37, Gatien CHEVALLIER wrote:
>> On 1/5/26 15:37, Krzysztof Kozlowski wrote:
>>> Allocate the memory with scoped/cleanup.h to reduce error handling and
>>> make the code a bit simpler.
>>>
>>> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>
>>> ---
>>>
>>> Changes in v2:
>>> 1. New patch
>>> ---
>>>    drivers/bus/stm32_firewall.c | 10 +++-------
>>>    1 file changed, 3 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
>>> index fae881cea9a0..92414a4c7bb1 100644
>>> --- a/drivers/bus/stm32_firewall.c
>>> +++ b/drivers/bus/stm32_firewall.c
>>> @@ -240,7 +240,6 @@ EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
>>>    
>>>    int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
>>>    {
>>> -	struct stm32_firewall *firewalls;
>>>    	struct device *parent;
>>>    	unsigned int i;
>>>    	int len;
>>> @@ -257,15 +256,14 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
>>>    		if (len <= 0)
>>>    			return -EINVAL;
>>>    
>>> -		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
>>> +		struct stm32_firewall *firewalls __free(kfree) =
>>> +			kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
>>
>> Hello,
>>
>> I'd prefer to keep declarations separated.
> 
> Separated how? This is the coding style of cleanup (which is quite
> explicit around other styles)? Or you meant one line without wrapping?
> 

I found odd to declare and assign a variable mid-loop but I found
multiple occurrences of the same kind of cleanup.

You can drop my comment, I'm fine with how it is. Thanks for the
cleanup.

>>
>> Otherwise:
>>
>> Tested-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
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
