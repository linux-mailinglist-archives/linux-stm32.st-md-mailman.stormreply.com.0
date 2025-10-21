Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B629DBF6278
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Oct 2025 13:49:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB658C57B6C;
	Tue, 21 Oct 2025 11:49:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1625C349C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Oct 2025 11:49:57 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LBVNF3001081;
 Tue, 21 Oct 2025 13:49:41 +0200
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013008.outbound.protection.outlook.com [52.101.72.8])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49v1seumqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Oct 2025 13:49:41 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcC+0fvRJ+GSQ2KQbJmpoTGBBflmfzPtjeDiekYpdP6BB7wZwBVQI0PVQ/aYS82F8EMB2zonF1R2WEXg4gJhEWImToibuszn9wu1xkGfhdihAz9hk11KqVnQNgaP7aMNihnhJqSi9K+Ece1iFUTWlAYgmv+1RYTLgzHZ06L+dQ5RjzkbCwFiNswN9jBnSJRrsv3UnshT0kFxTIpHNCdAtm4qHlio2831fd3AtQTr/9OunhpXmmGAlaf3vFucYEwsT602uce0t3ISkteoQA1HGVnkpkcOIQJo68+vyryzJaQXRvyL5SWtDbavHGz9ACX+KEREyTLNDm9op66kvbCBkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnQNvLJwRwg17ohc1A/bKz0hXqJ23TJymLF5dvi4ow4=;
 b=N/K5SNm7z7M13qA52MnIdWIZwzsdWb9WtESwM3LK38IXF1NHs194b4AW2L0LkEzS1v0Q8BNyprBbEOjAJy8oVr5U6ARVeCuS5zb4pwzI/1anG+6XqihBBPAXh1qnub2WpM65U8tKrGt5pOqdVd+B/q7gD97c2ArvVfjBzVIvrNv9JUxhrL49yrPb+xz5QkHD3KSBFVLoR1xkmaHx0CuT1vCpA4yZ/rhURS0XxiHqXfUWo6gS4APoQJ2mGYx8umV+RrCH3j1PGS/v9Ue+JlSCZ8CTlwbc+TZWjAK52arhHIvNH6mVPlaGZ2qIOykh51mGa/Rua+WLhwqRZf1Ynu7QZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnQNvLJwRwg17ohc1A/bKz0hXqJ23TJymLF5dvi4ow4=;
 b=DeC5j07gV1aOGWl41WeKtDGnNuxeYU9nv4Q1wFKk1tu9mQZ4OIZrhpVGvCHvIR+4vEz8MjYnV7RI8U5e0UIPWNNRt8qXiuIA40nJ0NRHg3ZW9CUXyNycaLkiVBvuO5C4Su52J3Wad5mzOHB1vXzI6jNpPnL/bZcPTj7e3ACw192zncz/TaJrSmBuPRUhdPEg5ECYyTRGkWNg5MfxXVStHMUlx7qMTyWPSf8nGJf90aB0iXcuctzUKdGs5e7N580JT7IVzv/bVRkZ429F4/z9I9fjqg+0wVd5HSmX3SFeNgFkQRZQH+WZpBBRlHoMpKS8oSB0Wmp8f+KnrjBaISub7w==
Received: from DU2PR04CA0036.eurprd04.prod.outlook.com (2603:10a6:10:234::11)
 by PAVPR10MB7164.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:312::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 11:49:38 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::20) by DU2PR04CA0036.outlook.office365.com
 (2603:10a6:10:234::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.12 via Frontend Transport; Tue,
 21 Oct 2025 11:49:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 21 Oct 2025 11:49:37 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 21 Oct
 2025 13:47:13 +0200
Received: from [192.168.8.15] (10.48.86.11) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 21 Oct
 2025 13:49:36 +0200
Message-ID: <9dfdf02b7e5a99c515aff3c6528e2d5f70517201.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 21 Oct 2025 13:49:35 +0200
In-Reply-To: <CACRpkdbeaiNGfOFfVfDNZ=u=4yhCykcdSdHUv-td_DVyr3aWaQ@mail.gmail.com>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-10-antonio.borneo@foss.st.com>
 <20251014-affection-voltage-8b1764273a06@spud>
 <b4eca95eaa0e6f27fc07479d5eab2131d20eb270.camel@foss.st.com>
 <20251015-headstand-impulse-95aa736e7633@spud>
 <0826a055f6b2e3e6b50a5961e60d1b57d1d596c6.camel@foss.st.com>
 <CACRpkdbeaiNGfOFfVfDNZ=u=4yhCykcdSdHUv-td_DVyr3aWaQ@mail.gmail.com>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.86.11]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EC:EE_|PAVPR10MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: 36a0ed8d-b0aa-4d57-666f-08de1097e9a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEdKcmxPVlArdWpHY1RXNFZYRkpVZUw2OG5qOXN0VG1md3VuWi9JUUdHRDgw?=
 =?utf-8?B?Q0k3MFdER0x5czhYWjZRSjhSOWhtcE9wcWFCVEppMmtUajRXZWlXRHJoMmNY?=
 =?utf-8?B?VHBtMXg0cnF1SkpXUW9BZTJSUmJYNjI0S21iOW1wdUhPVk44NXZhTGk1ZlVu?=
 =?utf-8?B?VGhHaU5PWWhOZG5WRG1qL3RtYklDcktZTERaRHpiMU5KWUswb08wVTVRUDFk?=
 =?utf-8?B?NGt6TG9YajBGdjJqVXFyUVFLS2NLdW9OOEowMlVxZnN5SUVPdzBSODlHbG04?=
 =?utf-8?B?eWlqS1RTTDZ3ejlrUDdNeXFlcjBEUHlWbUNobGNSaHZkZVJPMlB3RXREOC81?=
 =?utf-8?B?NEI3bGozQk0xcnE2UTNDZWE4bk90RnF3Zy81ZTAvSjJ3SXdELy82WFlPNHNt?=
 =?utf-8?B?SDVudmhCVTd5L2x2T1BWekZwYjZ1OHFpbmEzZU1LckliMU5MWlg0Z1Q3dERj?=
 =?utf-8?B?c2JKTVorRmtuWkw1QzFLd0xiSU5YYkhsM0RoQXhRMW1XTkZwenhIdnpGb1I5?=
 =?utf-8?B?UEtuM1RWWlBEYnNBbUNHeThTeCtweFZFcWpsTjdlVjQxUit3Q3V5cXVRMnZO?=
 =?utf-8?B?alpBY0NOOUQyb0tHSEFPdENzQ1JKMk9wZFp5MTZaeUFyTlBnUHBUa3dPd3ph?=
 =?utf-8?B?a1c0Q0Z3eDBkcUxGT2x4RWR3bE5MRURDU25nSkhVTmFGOHNHMVRLS0lyMVRh?=
 =?utf-8?B?SjJ1cGZFOCtTeFllV0dDNmJCWkttZDk0WGdaWVlTSFZ0L0htVnhFdEJEUnZv?=
 =?utf-8?B?QWVOc2YxdzNwNXZNZGF6MzcxM2FqdERNSWEwNEtnU2luUnlaK201M0NrODF0?=
 =?utf-8?B?b3ZCRlZBWTAxUjNSa2x2M1VVQUtjZy9lRWl5d3BWL2gyVm9rakhMTkxFYm42?=
 =?utf-8?B?TmpSOWF6c1c3ODhubThRSHJXZzhWYjNGOEpqbDVBdHBXR1l3Z3Y0T1QrQXFZ?=
 =?utf-8?B?WEtURWtaa2loY3U2eWljcGl2TVRhNE51UW9nRndRNy9EUWRiR29XZ3NtdVU4?=
 =?utf-8?B?b1dWQ240Ym9tSEE5cEFTVUkxTk0yY3NvN3dXcWI2RTFQM1FNZDNlLzBneUR6?=
 =?utf-8?B?RFFsTGwzWU9TRWZReU0rY2xhMGFXcDFNeUF3cDdLb3JzYXJLYUkrT0t0K1Fx?=
 =?utf-8?B?eHVvYmUxQklGVldQU0IzSWFiNlExNVJ0alZMUXAwemkxMEt0bkZVL3VZYUVx?=
 =?utf-8?B?eUxva0loUmIzTTFPWkRWWnZFWGtXeUxSQ1BsTGlFcUNBUmV6US9DVVdKNXZl?=
 =?utf-8?B?VjlZTkdYdEd6andQL1pEU0Vwc0FtdzhzZGxua0FqVlZoSE52b1dwdmo0dE90?=
 =?utf-8?B?REdoUTMrbUZsN1d0N2hyemN5UkhMQytPMGJlRkZDa1JaZGhaRENrNThqOFI2?=
 =?utf-8?B?NzZEaFNKTnlPNmxrRVRCQ1JiSHBsYVF3VTY1Y2VIWjJWaDJUNXJya1hMemxk?=
 =?utf-8?B?bzVxSUZYL1VWcGk1TWVlMU1UdnovdFZ2YXl5TGR5NVhmMkdMR1VKZnl4QVBt?=
 =?utf-8?B?Y3c1NTdiUXo1enNwQVlPZndreTlHSmgzTlJvOHVRNDVPQ21HRnRvNmtrT2dN?=
 =?utf-8?B?ZXRZZnpOOTR6Rk1BYkFZaXdlWmIxWldwRUsrQlI1MmZEeTgyMXJmNkJDbUVS?=
 =?utf-8?B?R1FZeWdUY1lXa3dZSG8vbm94cmNZUzBSdUFUUlI0L0MvRHhQcG9BWGdjYVQz?=
 =?utf-8?B?SUc3Njd6c2tzcFIxMEZGb1U1WnZnSDU5VUNNTlZ5RDViWFpTbUdXTVZDbG9C?=
 =?utf-8?B?bmtvZlRyUVFsZXkvYkI2RVRLVnk1aWFnR2tHeklrdDlKSlVDeDVpU0JwWVJB?=
 =?utf-8?B?anBUV3dvVDVwTEFUNkpkNDk0Zm8vSVhmcHdFQUwrdnN0MWZWaVdaMVpDbzBZ?=
 =?utf-8?B?TWdPTXF4Z0lKdTZNZ1hkOCtQcmxybGJlZnpXZkxnNVV1dTNIQ3Zna0xuMFlr?=
 =?utf-8?B?L3FrK3BvanhzZFBjckUzV0lGNTU4QTlCYmZ5YUFLRVF6NURWdWZIdnFpVUQw?=
 =?utf-8?B?cGtiWmVNRkZaTEUrZEdKRXZvNDFYMzNWOXR5RWlldDJuc3BoZFRQalRFbnZS?=
 =?utf-8?B?eGllN0tQNlhNZWxTQnMrZzN0RmhJc0F3ZVErV1FPV3RIOEZJcVdtaE8vS2JK?=
 =?utf-8?Q?cqlI=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 11:49:37.7775 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a0ed8d-b0aa-4d57-666f-08de1097e9a5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7164
X-Proofpoint-GUID: SLkINDrbIRH9ZK9mXS3d-41MqtyBMDrD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNCBTYWx0ZWRfXxmr52QH5eMlS
 hIbVovuieNZclascfu0NYUE8F43zXCwSa4UhkS47UcXtJ6Uqc78zGlV1onRJCbvHzlz1d2EsPZb
 zvitrBkIFkdXVn+81DbewBrt7j0etR2viNPXlqyype4B1YgIf1RHFMuECTuuoqSC87zoyVYx5ae
 Ic/ihh6OS6sWjTtBUOiuMwgy97HtPxk7hV6wvTfL5+XwUI9yxH+bJrBIzY/74SmqmkFBfsM3V/I
 V09eRA8sKqAWQYg8wvkBHFGfgC8l3m9zoGu8TZ/KkFxa9j7bOFaqX+xYxYMqEhbtGEI0S310z4y
 GSWUDZkXroJ0w7rJ0RqNT9udQ+nRKzyb3WgY9xLWG0Aa/gg03anXN0PSBCAJM2JBCbRcowrLTHX
 3YBF0J9bsHKP7DQMWk++iBBE+t/4Mw==
X-Authority-Analysis: v=2.4 cv=GPoF0+NK c=1 sm=1 tr=0 ts=68f77355 cx=c_pps
 a=6Kf4RVHJovTFG9veQ3L6kA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=RD6kGg7K_GLYrIKZGgUA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: SLkINDrbIRH9ZK9mXS3d-41MqtyBMDrD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2510020000 definitions=main-2510180014
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v3 09/10] dt-bindings: pinctrl: stm32:
 Support I/O synchronization parameters
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

T24gVHVlLCAyMDI1LTEwLTIxIGF0IDAwOjA4ICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+
IE9uIE1vbiwgT2N0IDIwLCAyMDI1IGF0IDU6MDnigK9QTSBBbnRvbmlvIEJvcm5lbwo+IDxhbnRv
bmlvLmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cj4gCj4gPiBwaW5jb25mLWdlbmVyaWMgb25s
eSBhY2NlcHRzIHBvc2l0aXZlIG51bWVyaWMgdmFsdWVzIGZvcgo+ID4gYm90aCBnZW5lcmljIGFu
ZCBjdXN0b20gcHJvcGVydGllcyBpbiBzdHJ1Y3QgcGluY29uZl9nZW5lcmljX3BhcmFtcy4KPiAK
PiBEbyB5b3UgbmVlZCBpdCB0byBzdXBwb3J0IG5lZ2F0aXZlIHZhbHVlcz8KCk5vLCB0aGUgcG9p
bnQgaXMgbm90IHRoZSBzaWduLCBidXQgdGhlIHZhbHVlIHRoYXQgaGFzIHRvIGJlIG51bWVyaWMu
IE1vcmUgZGV0YWlscyBiZWxvdy4KCj4gUGF0Y2hlcyB3ZWxjb21lIQo+IAo+ID4gUGx1cywgSSBo
YXZlbid0IGZvdW5kIGFueSBleGlzdGluZyBkcml2ZXIgdGhhdCBtaXhlcyBwaW5jb25mLWdlbmVy
aWMgd2l0aAo+ID4gY3VzdG9tIHN0cmluZyB2YWx1ZXMuCj4gCj4gTWF5YmUgSSBtaXN1bmRlcnN0
YW5kLCBidXQgcGluY29uZl9nZW5lcmljX3BhcnNlX2R0X2NvbmZpZygpCj4gbG9va3MgYXTCoCBw
Y3RsZGV2LT5kZXNjLT5jdXN0b21fcGFyYW1zIGFuZAo+IHBjdGxkZXYtPmRlc2MtPm51bV9jdXN0
b21fcGFyYW1zIGZvdW5kIGluCj4gc3RydWN0IHBpbmN0cmxfZGVzYyBpbgo+IGluY2x1ZGUvbGlu
dXgvcGluY3RybC9waW5jdHJsLmgKClRoZSBpc3N1ZSBpcyB0aGF0IHBhcnNlX2R0X2NmZygpLCBj
YWxsZWQgYnkgdGhlIGFib3ZlIG1lbnRpb25lZCBwaW5jb25mX2dlbmVyaWNfcGFyc2VfZHRfY29u
ZmlnKCksIG9ubHkgdXNlcyBvZl9wcm9wZXJ0eV9yZWFkX3UzMigpIHRvIGdldCB0aGUgdmFsdWUg
b2YgdGhlIHByb3BlcnR5LgpDb25vcidzIHByb3Bvc2FsIGZvciByZXBsYWNpbmcgbXkKc3QsaW8t
c3luYyA9IDwwPjsKd2l0aApzdCxpby1zeW5jID0gInBhc3MtdGhyb3VnaCI7CmRvZXNuJ3QgZml0
IGluIQoKRm9yIG15IHVzZSBjYXNlIEknbSBnb2luZyB0byBleHRlbmQgcGFyc2VfZHRfY2ZnKCkg
d2l0aCBmd25vZGVfcHJvcGVydHlfbWF0Y2hfcHJvcGVydHlfc3RyaW5nKCkgdG8gZXh0cmFjdCB0
aGUgaW5kZXggZnJvbSBhbiBhcnJheSBvZiBzdHJpbmdzLgpUaGVuIHN1Y2ggaW5kZXggd291bGQg
YmUgdXNlZCBmb3IgcGluY29uZl90b19jb25maWdfcGFja2VkKCkuCkRvZXMgdGhpcyBhcHByb2Fj
aCBsb29rIHJlYXNvbmFibGU/CgpJIHdpbGwgc2VuZCBvdXQgdGhlIHNlcmllcyBzaG9ydGx5LCBh
ZnRlciBzb21lIHRlc3QuCgpSZWdhcmRzLApBbnRvbmlvCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
