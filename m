Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BC7C195F5
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Oct 2025 10:31:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65D05C62D40;
	Wed, 29 Oct 2025 09:31:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4405C62D3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 09:31:08 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59T9Q0GS3058019; Wed, 29 Oct 2025 10:30:51 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013067.outbound.protection.outlook.com [40.107.159.67])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a3be3hfv4-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 29 Oct 2025 10:30:50 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yolgacaB+M1HUeCW3SwNP7DHU2TQKc0NqIu/3UNyqm5mkYYvDKr5lhis7fJ+dSmZcH+AU7MqL0k5A5Iu3Nm0XEdbvmm7bCz+JWL0RxuakEzy8ym6wQTvMkEafFGaZtfgFQynrjR/EWZgMgFvdjACNZw/T4Xwlf4wzJKZ6zU75PwJuVeo53jVUtZOkio9erFbUiRpR7TqVSoHN16sv5N/H9DGITJgS0mOTybaF/KhkbrqEtB5CgVcbIBp65HsKGBEL2TRL1MA13RMlN0jXgHsQzYJVoB89RTIC8KOiDcudS8ahM8JbxsNGZMpIxaz0CBLxQNRRddYTWI6/aTSb9msPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2erK7i8zozn+ZJDPHPEnAD8eq/np2AK2eHGnKTHDX8=;
 b=V0o5pnwEl3u9ZzPFAAZ4l6M14DbCtx3u7AG3ZnuzKS9A3uktwxZDP9BpZVX+xRgOJfKKzkhe22SVJiYwbjaXwCrjIT7HBIuxaEY/vDimVVPqq80/Hago0Rk/uqB8Qy0lYMLqyvlZXtnWDbu+Rfihi13mH098eAZWD3vhPqs3xlV5APUDVh0WOdp3xZ2Jr7MytUH7Tm9bNucdGM8o4A0uWxapSSh+7mKDvEll4L7vvUAi5CeqE1xt5UwQ00sHqEF1EEPuGChMK5N32tbgopTwuND4pTWVoZzEcdgdWhPQKflV1KMqrJLtwXqokIftm0sLzMbYKGEA1+ZS74R96WcOJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=iscas.ac.cn smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2erK7i8zozn+ZJDPHPEnAD8eq/np2AK2eHGnKTHDX8=;
 b=KqVUB7fvWk9S4YSyOUOUOSotCpztyOALIY1zROsjGxNWf9Amc3VxiH0zsgbsXFB8ApKlAKnTstPUFOyU/j/Pav3W1qFsYrYjZK7sxa/l4i4XReuh1Q5LBzIMgVHxGGPylyjhKFq/Akj9p/yvmlirqUTWp/z3Gne5vCfDkd6sV4veZljZyS74IyI8Zwtgxdc2hGRnn3MDoy9kab1erGPfpjOGOuShTefyozKQHUb+5Im3Lvmk+zMlGV/oq0Pck1arS9SvZ4rF7EIAPycnCvmFElqmFDGI/BITDubLl0cbbHEP0iWtE2qB1FJhXbAvTu/b9+mQMLTqgwBHFvr1g0PUgw==
Received: from DUZPR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::16) by PRAPR10MB5156.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:27a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 09:30:49 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::51) by DUZPR01CA0009.outlook.office365.com
 (2603:10a6:10:3c3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 09:31:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 09:30:48 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 29 Oct
 2025 10:28:32 +0100
Received: from [192.168.8.15] (10.252.10.43) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 29 Oct
 2025 10:30:46 +0100
Message-ID: <1ecb3859ae79fee2031e8aae5380f509629eae93.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Haotian Zhang <vulab@iscas.ac.cn>, <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 10:30:44 +0100
In-Reply-To: <20251029014252.178-1-vulab@iscas.ac.cn>
References: <20251029014252.178-1-vulab@iscas.ac.cn>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.252.10.43]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0C:EE_|PRAPR10MB5156:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee2212d-d625-440c-3dfe-08de16cdd800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkRHS2p3SHNEUnRUakNsV0UrRFlRTHdZYjNtZ2Q4QmVCMFdDZU9YeFRRQ2Z3?=
 =?utf-8?B?TmFFM1FidzI1azJiWFF4Mm95NjRkcWNCdGhTUlpCcWg5ZkZLV2ZVVWYvVWND?=
 =?utf-8?B?SjdkNmxnc0JicnlqMVk5cCs3QlRkR2V3bHZhWHdYSis3RTlUU2gzWHd4ZFEz?=
 =?utf-8?B?RE9KdDdEb3llWUZzQmJubGJCUExVNml5TnQwSy9BSnAvdWFMbnlYcVhTaVg2?=
 =?utf-8?B?enNxZklkZDI1aHpKVkVZeS9GWFluYmUzczd5VzJWNHp3OCtaRHdyTTR3YVVJ?=
 =?utf-8?B?VzVCMjA3UWF1eXFqT0hCM0k2UzF5SHVncktXdGlvb0NITEtoQW1OVE52R2Er?=
 =?utf-8?B?YmZIOG9OMVFiZWZHQ2pCMmxvRElieUxOWTI5bGViUlp1WEYyNFdYdCtRanhx?=
 =?utf-8?B?YloySDRGV2c1dFpUU1o3RDVJeXRFWEtlRUcySnQ1eU1GaVJMYUJ0UzR6YnR6?=
 =?utf-8?B?cWtScTJaVzkzM2dmU1R1YXZQZ1poaVpxYll4MnkxOHZYWjBpZmFiajFiSFBR?=
 =?utf-8?B?SkJWQ0wrUnljUUlhc3dXWkt6RTYyWm5DOXVHS2hkd2VvMHljN2U1c0Z0Z25a?=
 =?utf-8?B?cGVlc0hhNEhYRzhwbFpCWEhqYzh5dGE5WENjVUV0aVpkckNxd0RONnNpTm1j?=
 =?utf-8?B?bllIT081RXhRc0tSNFFjS29GeHJCL2ZQK3l3WU4zWTZpbW0vUnBNVUp2ZGNY?=
 =?utf-8?B?c2xvMDhjaXIrT2xLRlRRR0x6Zy9XNy9IY0M1NVhOSEh3dHIzQ1BqMkdIRTE1?=
 =?utf-8?B?N0dWMzFsNnZ1MmM1VThzak9QQ1lQaEpEU3ZUMXJ1cUZsSC9YUWhURHFyT1E4?=
 =?utf-8?B?dVdSNTJoVnBkcFJuQzBRNUZwRmNGNk4ra0FUL0RGMHdiUUc3aU9lRC9VNkhU?=
 =?utf-8?B?TTNuUDVuUTNqNTltZzlma0N0WXhaMWFldzI2T1ZOUXF1WnNWZlRLRGRLazBo?=
 =?utf-8?B?R2JTT29KaTVSeU0wMjhRYXM2S1Z1Vk5nVVNIckxPZHhrT0h2WUREOFE4RHcv?=
 =?utf-8?B?bHhEZTBMVXVLNldpRjczYUVwbHdiM0c4amRmWGJxRmxxVHBTSGdFQkpLUHhs?=
 =?utf-8?B?NkRWYXRmUmZES2F0L2Y4Mk1kN1RPZUY4Z3lHZkQyQTl6SW0vcmF6U1dwN2pw?=
 =?utf-8?B?R29CZThTTzR0aWpFR0x2aXcxdzV6WkJ0YnBMdG80YWJjd1ZEdTU4eEVDeW92?=
 =?utf-8?B?SEx3ODROay91TWwzV1NLRHQwZUpWdzVsUTNUOXpjMEFSVVl3Wi9BOWVpa1Ri?=
 =?utf-8?B?ODZJRlVNZVcyeGxhUGhaRjd5SmEwWXZUYmovb1o2YkxIYmZKdUtqTDlBSVc0?=
 =?utf-8?B?Y0I5TUdrcnJQUmJzdlA3NXFNQzFSQUVCSjFFNTVkZ1dKSmJINlhJcnlLTHFs?=
 =?utf-8?B?bWNUK09FRWJtM0hzNTVBZnJRZUVmbG54NnRFRGVxYnBxTlpvaVBlWm5IUlpH?=
 =?utf-8?B?ZnphcU1TZ0szUTNpRVh0aytyK2FrTFphUWg3b1hRTzhrNlNZU3dEdkVQdlBr?=
 =?utf-8?B?K3BuVTEzS3JxK2ZSOWYvcXJmZ0k3Ukc0d2toTCtETElKWE1qK2NlSDlQSUE2?=
 =?utf-8?B?Y3pxSnJNWTJlMCt2blcwL0NlblBVSGliMk83bDBKUEhtajZpeVdFN3AzMFJu?=
 =?utf-8?B?TlE5MW9XSmtEZjlKcVNSVEw0bEdkU0lOOFF4RThWMVNMSDB3VnNqZS8rS3ZW?=
 =?utf-8?B?ako0NllwOXFrUk5jUE05eW41ZlloREdvSUg0MjduUk1QaTdFdnRKRWRxd1gw?=
 =?utf-8?B?Z3RHWEY5dndFYzhPc2tXU0tuUUh2amNGbkVNeEhmdWtUMkNGaWY2MHNhZmhI?=
 =?utf-8?B?NHJzbG1hc3k1bUFoWUdlcVdQN2t4LzhudDFocVRaZGhiYnpRcnFyTHFvSmZT?=
 =?utf-8?B?UklkMXYrd3Q4WjRrT3JmVjBnK1dUMHQ3c3VNUS9XVzNYZFdTTnh2Tm9pSEV1?=
 =?utf-8?B?bmtmWDBaMDJaYmt4MS9OWVBOWXdiUkJ2UjBnS0NndHFZUVM4c055SWhUVno3?=
 =?utf-8?B?S240QWNBMnlqd3JZSm14OUtnSHltSW11c2VXcXNiUUhxSHJDZWZCSXlrQUtu?=
 =?utf-8?B?TEx1aWhWUEk3Ymg0S2pKbTJIYzRxbzJoaHErTm94c29kaDIwNnVBenJxeTF3?=
 =?utf-8?Q?PUmc=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 09:30:48.0069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee2212d-d625-440c-3dfe-08de16cdd800
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5156
X-Authority-Analysis: v=2.4 cv=JMU2csKb c=1 sm=1 tr=0 ts=6901deca cx=c_pps
 a=cvaVg/4otPnPD7Zi6DglXA==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=ALzHLXW1UqEA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=nUwpkMCGSNobtZIpiFoA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: -vFI1ErNwwSq5EhquIvK5WlndHr5K5YL
X-Proofpoint-GUID: -vFI1ErNwwSq5EhquIvK5WlndHr5K5YL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA3MSBTYWx0ZWRfX7oIzjong3MDc
 OP+0gkIoQryNhQvLBqpB6K+iSL/oQBRX6LXxFGnLZFLvR5pJ8/vZenK+r/lHccpgpO0wtls/tn5
 iO8MYbL2AlsNktMo29IVw7/JMGWPkpGs0qx6HRM/kWOIb0ZlZzgmtxg3C5TejVMPyMUBR/rrqTM
 ggsUq/jSOLb24qXntVSSkyt0cBu7NIThpMHmfGKjJ7fbJWVGesEXIPaZxp+hWrmX2yHHq0kNSlM
 FwGdET0FdI06+1393kAjAYgHPHjF/lFfikUs2C4mQLJyF7WaWbu0O4AURNFLcHDRdOKq8U8157F
 FmJHymSjyrWuHBwZ4Kr7Odd4liEWmoPa4L38cSsudx0O2LzUzkTCpI0nR7C6mYFi5uhXi617oLk
 LapriXyrjtbmS5D7MNBK1X1gAr6Fww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0 clxscore=1011
 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290071
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: fix hwspinlock resource
 leak in probe function
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

T24gV2VkLCAyMDI1LTEwLTI5IGF0IDA5OjQyICswODAwLCBIYW90aWFuIFpoYW5nIHdyb3RlOgo+
IEluIHN0bTMyX3BjdGxfcHJvYmUoKSwgaHdzcGluX2xvY2tfcmVxdWVzdF9zcGVjaWZpYygpIGlz
IGNhbGxlZCB0bwo+IHJlcXVlc3QgYSBod3NwaW5sb2NrLCBidXQgdGhlIGFjcXVpcmVkIGxvY2sg
aXMgbm90IGZyZWVkIG9uIG11bHRpcGxlCj4gZXJyb3IgcGF0aHMgYWZ0ZXIgdGhpcyBjYWxsLiBU
aGlzIGNhdXNlcyByZXNvdXJjZSBsZWFrYWdlIHdoZW4gdGhlCj4gZnVuY3Rpb24gZmFpbHMgdG8g
aW5pdGlhbGl6ZSBwcm9wZXJseS4KPiAKPiBVc2UgZGV2bV9od3NwaW5fbG9ja19yZXF1ZXN0X3Nw
ZWNpZmljKCkgaW5zdGVhZCBvZgo+IGh3c3Bpbl9sb2NrX3JlcXVlc3Rfc3BlY2lmaWMoKSB0byBh
dXRvbWF0aWNhbGx5IG1hbmFnZSB0aGUgaHdzcGlubG9jawo+IHJlc291cmNlIGxpZmVjeWNsZS4K
PiAKPiBGaXhlczogOTdjZmI2Y2QzNGYyICgicGluY3RybDogc3RtMzI6IHByb3RlY3QgY29uZmln
dXJhdGlvbiByZWdpc3RlcnMgd2l0aCBhIGh3c3BpbmxvY2siKQo+IFNpZ25lZC1vZmYtYnk6IEhh
b3RpYW4gWmhhbmcgPHZ1bGFiQGlzY2FzLmFjLmNuPgo+IC0tLQo+IMKgZHJpdmVycy9waW5jdHJs
L3N0bTMyL3BpbmN0cmwtc3RtMzIuYyB8IDIgKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwv
c3RtMzIvcGluY3RybC1zdG0zMi5jIGIvZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3Rt
MzIuYwo+IGluZGV4IDgyM2M4ZmU3NThlMi4uZDlhMmQyMGE3ZTZiIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvcGluY3RybC9zdG0zMi9waW5jdHJsLXN0bTMyLmMKPiArKysgYi9kcml2ZXJzL3BpbmN0
cmwvc3RtMzIvcGluY3RybC1zdG0zMi5jCj4gQEAgLTE2NzEsNyArMTY3MSw3IEBAIGludCBzdG0z
Ml9wY3RsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoaHdsb2NrX2lkID09IC1FUFJPQkVfREVGRVIpCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGh3bG9j
a19pZDsKPiDCoMKgwqDCoMKgwqDCoMKgfSBlbHNlIHsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcGN0bC0+aHdsb2NrID0gaHdzcGluX2xvY2tfcmVxdWVzdF9zcGVjaWZpYyhod2xv
Y2tfaWQpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwY3RsLT5od2xvY2sgPSBk
ZXZtX2h3c3Bpbl9sb2NrX3JlcXVlc3Rfc3BlY2lmaWMoZGV2LCBod2xvY2tfaWQpOwo+IMKgwqDC
oMKgwqDCoMKgwqB9Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgc3Bpbl9sb2NrX2luaXQoJnBjdGwt
PmlycW11eF9sb2NrKTsKClJldmlld2VkLWJ5OiBBbnRvbmlvIEJvcm5lbyA8YW50b25pby5ib3Ju
ZW9AZm9zcy5zdC5jb20+CgpUaGFua3MhCkFudG9uaW8KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
