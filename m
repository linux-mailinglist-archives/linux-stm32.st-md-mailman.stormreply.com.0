Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A92BB8F574
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Sep 2025 09:52:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A9B0C32E92;
	Mon, 22 Sep 2025 07:52:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67F67C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 07:52:36 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M7Kphd010884;
 Mon, 22 Sep 2025 09:52:28 +0200
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011022.outbound.protection.outlook.com [52.101.65.22])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 499kkxxtv7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Sep 2025 09:52:27 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rseilybiWFadiXLE3v+RpApIjaPeYH/AWwpbWoRYh0noWHv/9cIbdrnny2eO2YhJ2mC/fyO02is93Aepwnq/SvTjxnhxZZyDz9dazmrhYhYdw8w3CYySee+mnbZJPAiRF624c/NdmO4HeRtWo0XyyQVPRe+cOasrpFasJN6pBS4tCg2HP5IG+LmbMYPkWnXSVUPvDDjIddqICmBCyzrUZljEpMt2UT2CC4vCWqFT4jwDQs6Hqyiq9ZIskhjgpw8dy+F6kSpU0ChVSz3rvZfSpVUMbuNpkPJsrqerV0k4i2j1hDQnJ3O9/T3r+/edzxyLcHzdHUvNfk4ObyPgFxesvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Bf1iIBem3e4e8UNQB1BD3tDJECURo3kZ9TpjFAMz84=;
 b=ScjCruRFxOoAq3vjCXfDzya6/pDHUbQEBPbPkpX5FKwbi5Ti+L19otVf06B6qqEKPFlfWLwaz5+JwubVa8TjvOGZCwGBVm9EUhQl/y9JpAjKD05bhSfi2dTjyjquT8gHjijHTlE8nekCF/uVrdAu6E5JhWwMve13Qd+LwIzTr+tF3ZK1+QRYCFvZaVw299edpDhqbTkn3CKXyRybth51E5yBZWOfJixX6fqjdd1fcun0CZRJ/o6V8QGkJoSahvhkCtg9+Nd9Y6lDO5gofOmvPheg+1KcwnwBLWoVokP+BOO90yILDeRq0e68rGy4ToeW1Q9V/awbsv4Hyc/5ZV7AbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Bf1iIBem3e4e8UNQB1BD3tDJECURo3kZ9TpjFAMz84=;
 b=efztnReBPH+IuL0xBVdKgfCF9d4sB4nNgBhhBKoR2aYRRJ5AMHrMTzi7f1DGFLbMKmYNnUDqlFySYJ2zUtahMuYw5mGqOXf5C4Ll224oV2qSBYooJTlSPYRe1eU1s6XPEuJrb+IF/AED354H3z8H+KQbDxrtrLWIGiaGlr8WUqAm5bT2/i4QCMOGW5xELm5kgz9kYyhsvTPHuntso5sDaA6AQKKOCb+/dkedA5c/u0GPHXnK4r9QegTNsts/jVVDe6BRDq48Ta13U2xeoe/T11LYGvcfJjUsze/7IYKFrfOl5k1RXXd0cP87GQ1VCXq5KSzmHawISRUgDzPYG1J45A==
Received: from DU2PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:10:3b::30)
 by PAVPR10MB6985.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:306::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 07:52:22 +0000
Received: from DB1PEPF00039234.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::a3) by DU2PR04CA0025.outlook.office365.com
 (2603:10a6:10:3b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.19 via Frontend Transport; Mon,
 22 Sep 2025 07:52:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DB1PEPF00039234.mail.protection.outlook.com (10.167.8.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 07:52:21 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 22 Sep
 2025 09:45:00 +0200
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 22 Sep
 2025 09:52:20 +0200
Message-ID: <d7a4e6c6-6670-41e3-9537-4be705ca3805@foss.st.com>
Date: Mon, 22 Sep 2025 09:52:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20250916-b4-firewall-upstream-v7-1-6038cf1e61d8@gmail.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20250916-b4-firewall-upstream-v7-1-6038cf1e61d8@gmail.com>
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039234:EE_|PAVPR10MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: 54189be8-daa1-44e3-8e57-08ddf9acf5f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZUc5NHhoclNrMnA5OTBuUFVHNWoramdSblpjaHozN2J0NS85cUlMS2kza1c5?=
 =?utf-8?B?NXRyelB0TkozYXJDMExqRTZvZDlyTUlqSk9qUWJqRFk3MDFqL0dBSTlGNmtk?=
 =?utf-8?B?U21OWG0yUE9vTjhXRWMyclpuS1Y4c3ZNUDhuemdZMTJzNnF5eU0vMWZhQmc1?=
 =?utf-8?B?T2JISWRoUENoQ2UxU3d5aXg4NURlOW0xRW5SWjZaWW5SQmRkaDQwVXgyWitt?=
 =?utf-8?B?ZmZUbzNUd3FTZnIwYkFrN3c3bnYrZmVUeTdNWjQ3ZmgydVUzUE1nVmd1d1My?=
 =?utf-8?B?MlhGRjBCSm95SWNWMDlxS1MrbVFzbnZ6MGVKNFVleWNlNjRSaTRYT0ZvM0pu?=
 =?utf-8?B?dFIxRFcvOFBWOW9IUVlVeE8yclAyYTRrVVI1azlCaG1wNnQzK0ZwUFNVSFgw?=
 =?utf-8?B?V01NREQ0dC9EcHIvZmM1SFhvSk83d3Z2TEsyS2p3SHREeDlNZ3JNUzlEOTMy?=
 =?utf-8?B?cUp3UDNDbCtZNXRKWEN6VHlyQ2NlaFJqZFNDYVlYZGE4bUx0bXAwYTdhU1BH?=
 =?utf-8?B?VnY5clFManh4TXpTUE04ejVreFVkRk9WZkEyYS9iT1BmdW5aRTJ0SmhaWTFS?=
 =?utf-8?B?dTdoV0tMcGgvd3orUVM2OERxaE5OUVdrc1VLRGJ3QUxzNHIxcjVVOTBPVG1Y?=
 =?utf-8?B?VDdyWFF2bUpQeHBpT1VqaEVvc1NwVDhkL2xFREYyT3NSUElkbGFtK1F3OS8z?=
 =?utf-8?B?RUk2Z0VObldINkh3RmV5R0pOb1FzSmxNMVlGTXR4WjNtR0lVSy9JTnl1WlNi?=
 =?utf-8?B?R1VnUXJaNEZKQ3ltSktNME9mQ1BVMWs5UWJhZ0FYRzl1alNhRm90aWpLMHB0?=
 =?utf-8?B?cU43RmpxQ1JYOFdmRlgrSUt6L016UkU0dVMvcVVNNGtFS0dCVzBYNjB4TSs3?=
 =?utf-8?B?ekZGUExOMlFBMGd0NGhxc3pwRnZaa243YStPMzFpS04rdDdwTys0SVFpV2d4?=
 =?utf-8?B?V2Nra1JNUWFmb3pDWXFmZ2lHREZvTWQ5OFBQYWoyZXh0Z1p4MVNXeWk0c3lp?=
 =?utf-8?B?U0VXSGlYOUtSKzBCbFdDd1BqUFU1MGJGckJkNnFZNW1qV1RhM0hMT3FSNmdW?=
 =?utf-8?B?Y0c3ZGJQcmlYQSs0QmhOT2pUeUo0MnFkSzRmYm9LZ2Rnd2hTeUFKaEtQOFZF?=
 =?utf-8?B?WDFlVFMwQW9OQXljRTI1QmZGWW5WakdCL3FxYVlCV0FnYnF6a1l1WXFRaGRN?=
 =?utf-8?B?akhFNmJVVjUvek5LdzJvTGtBNDMxZUxNUEw0MFM5eUpXWnNBbUZVNG8wb2JK?=
 =?utf-8?B?TXBPeFJjMVJ6K3lQdmVsY1lwcnZoOEdpRVFOak1BSXBmTmxzUkxHcG53blRl?=
 =?utf-8?B?dXlxazdYaTlTNXA2d3FjaStJanBVWG9PMlpla0YyVmtuVU1qanRlU2syKy9Q?=
 =?utf-8?B?VmxDNWRjbytMcjRmbnJuUjNVU2NQVVhNTU5FZlhyaU9hVm1RUkNya2hYM3F6?=
 =?utf-8?B?SGdHdUM1M0JJS054OVp1cWdwV0EwOU85cW5RMy8xbXB6QWhBeHB4Ni93Y1Zo?=
 =?utf-8?B?NFZJcGJiZFlXUW9NUDdzZ1gyaXJQQTZ4YVVSdjFSNlRwVFFwbnNHR3lOZmtT?=
 =?utf-8?B?ZjRHcGVrbTdOa0tKaXJOOWRXOG5nWFJISWpHV2tXNDRCYzhHLzhNWWMxUkNn?=
 =?utf-8?B?SjcvdU1UbE9HL3lnSHZNLzRWVTVqRGhHM093bkJ3QW1aWjlpTFVrajFsWW9s?=
 =?utf-8?B?V3hMUFZWR1JmYVg5TUprbkQvckx1OStqc01odlFIcldrRXN2RVY2QmQwRHVZ?=
 =?utf-8?B?VENMZmF0OVMwY3ZpaDZCUUJ4eWIrWGZiWDIvdmRYODRYMUdseGRMTVhlcjFN?=
 =?utf-8?B?TFZ1OThCbk85aXZhRmw5N0FPZzRIdkEvdU1HQmdzR2Jxb2JCQXJGTUFNVlhx?=
 =?utf-8?B?M0VBd0l0WC9WQ2FaQkZsSGh6OUdWY0l0UmF3TktiaDZUR0laWlUwaXZmUVIz?=
 =?utf-8?B?ZFpDcEczRk5IaVNLVlNJVElkR2ZHdnJmcXcxdFp0TjdVWGJSemFRVUFvc0dm?=
 =?utf-8?B?cGlHVWN4UFovaC83VlBGTlA3Yjg4R2tTTVpHSU8rTnZzWjhxbnMwNlpYRU5y?=
 =?utf-8?B?cE1QVWJzSndQRlFobXN1RlduejhSMlNRNWdsdz09?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 07:52:21.1621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54189be8-daa1-44e3-8e57-08ddf9acf5f6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6985
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMiBTYWx0ZWRfX4HdaDKrFGV9C
 RgteYSCRsNnQg+bCApV55FXnWA34AlyTTPuuwFnCavCVCv976KjCIRDe8jONGh7o9moVF3IB/qP
 AE7bRbrvbB8g4ex3XrwS1PfI7IBB6onwiZUbVxddMkVadpXiAAsQB3+ez7zMoA9XxLmD+XRUa5M
 U6EV3EQaaMDIbVgfRTKHXHoJBS960rfxE5qM2ihfx+gouAmQyEJqxdNDKw1+0q1McbM7Tp1NiT/
 WyGT3RJHmVv1y1ZZhCgE0d+Z/8NAwusNJjOfA0uZ38HjsB8mFcBIlYOMXEwTQMO3U5l+P1bGoFs
 EtftsDJy/mcVW+681q0k9WmjvsJ/ZBWhbk8ZDHNFMtLSpArHZw9BapdFHNCAMmuG9hetcvZvZ1+
 wHhapsb5
X-Proofpoint-GUID: kEVihndhSV5h7Cum9OHKnr7ztqxLcT3M
X-Proofpoint-ORIG-GUID: kEVihndhSV5h7Cum9OHKnr7ztqxLcT3M
X-Authority-Analysis: v=2.4 cv=dY2A3WXe c=1 sm=1 tr=0 ts=68d1003c cx=c_pps
 a=qDHLbbvJlrr8V5LZr46qng==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=ei1tl_lDKmQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=8b9GpE9nAAAA:8 a=YYNlyAMbr1-TTnqoXNcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200022
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v7] bus: firewall: move stm32_firewall
 header file in include folder
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

CgpPbiA5LzE2LzI1IDExOjA3LCBDbMOpbWVudCBMZSBHb2ZmaWMgd3JvdGU6Cj4gRnJvbTogQ2zD
qW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgo+IAo+IE90aGVy
IGRyaXZlciB0aGFuIHJpZnNjIGFuZCBldHpwYyBjYW4gaW1wbGVtZW50IGZpcmV3YWxsIG9wcywg
c3VjaCBhcwo+IHJjYy4KPiBJbiBvcmRlciBmb3IgdGhlbSB0byBoYXZlIGFjY2VzcyB0byB0aGUg
b3BzIGFuZCB0eXBlIG9mIHRoaXMgZnJhbWV3b3JrLAo+IHdlIG5lZWQgdG8gZ2V0IHRoZSBgc3Rt
MzJfZmlyZXdhbGwuaGAgZmlsZSBpbiB0aGUgaW5jbHVkZS8gZm9sZGVyLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGxlZ29mZmljLmNsZW1lbnRAZ21h
aWwuY29tPgo+IC0tLQo+IFRoaXMgdjcgaXMgYSBzdWJzZXQgb2YgdGhlIHY2IGFuZCBvdGhlciBw
cmlvciB2ZXJzaW9ucywgc3BsaXRlZCB0byBzaW1wbGlmeQo+IHRoZSByZXZpZXcgYW5kIG1lcmdp
bmcgcHJvY2Vzcy4KPiAKPiBDaGFuZ2VzIGluIHY3Ogo+IC0gTm9uZQo+IC0gTGluayB0byB2Njog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwOTA5LWI0LWRkcnBlcmZtLXVwc3RyZWFt
LXY2LTEtY2UwODJjYzgwMWI1QGdtYWlsLmNvbS8KPiAtLS0KPiAgIGRyaXZlcnMvYnVzL3N0bTMy
X2V0enBjLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMyArLS0KPiAgIGRyaXZlcnMvYnVzL3N0
bTMyX2ZpcmV3YWxsLmMgICAgICAgICAgICAgICAgICAgIHwgMyArLS0KPiAgIGRyaXZlcnMvYnVz
L3N0bTMyX3JpZnNjLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMyArLS0KPiAgIHtkcml2ZXJz
ID0+IGluY2x1ZGUvbGludXh9L2J1cy9zdG0zMl9maXJld2FsbC5oIHwgMAo+ICAgNCBmaWxlcyBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvYnVzL3N0bTMyX2V0enBjLmMgYi9kcml2ZXJzL2J1cy9zdG0zMl9ldHpwYy5jCj4g
aW5kZXggN2ZjMGYxNjk2MGJlLi40OTE4YTE0ZTUwN2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9i
dXMvc3RtMzJfZXR6cGMuYwo+ICsrKyBiL2RyaXZlcnMvYnVzL3N0bTMyX2V0enBjLmMKPiBAQCAt
NSw2ICs1LDcgQEAKPiAgIAo+ICAgI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+Cj4gICAjaW5j
bHVkZSA8bGludXgvYml0cy5oPgo+ICsjaW5jbHVkZSA8bGludXgvYnVzL3N0bTMyX2ZpcmV3YWxs
Lmg+Cj4gICAjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvZXJy
Lmg+Cj4gICAjaW5jbHVkZSA8bGludXgvaW5pdC5oPgo+IEBAIC0xNiw4ICsxNyw2IEBACj4gICAj
aW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvdHlw
ZXMuaD4KPiAgIAo+IC0jaW5jbHVkZSAic3RtMzJfZmlyZXdhbGwuaCIKPiAtCj4gICAvKgo+ICAg
ICogRVRaUEMgcmVnaXN0ZXJzCj4gICAgKi8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvc3Rt
MzJfZmlyZXdhbGwuYyBiL2RyaXZlcnMvYnVzL3N0bTMyX2ZpcmV3YWxsLmMKPiBpbmRleCAyZmM5
NzYxZGFkZWMuLmVmNDk4ODA1NGI0NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2J1cy9zdG0zMl9m
aXJld2FsbC5jCj4gKysrIGIvZHJpdmVycy9idXMvc3RtMzJfZmlyZXdhbGwuYwo+IEBAIC01LDYg
KzUsNyBAQAo+ICAgCj4gICAjaW5jbHVkZSA8bGludXgvYml0ZmllbGQuaD4KPiAgICNpbmNsdWRl
IDxsaW51eC9iaXRzLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9idXMvc3RtMzJfZmlyZXdhbGwuaD4K
PiAgICNpbmNsdWRlIDxsaW51eC9idXMvc3RtMzJfZmlyZXdhbGxfZGV2aWNlLmg+Cj4gICAjaW5j
bHVkZSA8bGludXgvZGV2aWNlLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvZXJyLmg+Cj4gQEAgLTE4
LDggKzE5LDYgQEAKPiAgICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+ICAgI2luY2x1ZGUgPGxp
bnV4L3NsYWIuaD4KPiAgIAo+IC0jaW5jbHVkZSAic3RtMzJfZmlyZXdhbGwuaCIKPiAtCj4gICAv
KiBDb3JyZXNwb25kcyB0byBTVE0zMl9GSVJFV0FMTF9NQVhfRVhUUkFfQVJHUyArIGZpcmV3YWxs
IElEICovCj4gICAjZGVmaW5lIFNUTTMyX0ZJUkVXQUxMX01BWF9BUkdTCQkoU1RNMzJfRklSRVdB
TExfTUFYX0VYVFJBX0FSR1MgKyAxKQo+ICAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVzL3N0
bTMyX3JpZnNjLmMgYi9kcml2ZXJzL2J1cy9zdG0zMl9yaWZzYy5jCj4gaW5kZXggNGNmMWI2MDAx
NGI3Li42NDNkZGQwYTVmNTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9idXMvc3RtMzJfcmlmc2Mu
Ywo+ICsrKyBiL2RyaXZlcnMvYnVzL3N0bTMyX3JpZnNjLmMKPiBAQCAtNSw2ICs1LDcgQEAKPiAg
IAo+ICAgI2luY2x1ZGUgPGxpbnV4L2JpdGZpZWxkLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvYml0
cy5oPgo+ICsjaW5jbHVkZSA8bGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsLmg+Cj4gICAjaW5jbHVk
ZSA8bGludXgvZGV2aWNlLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvZXJyLmg+Cj4gICAjaW5jbHVk
ZSA8bGludXgvaW5pdC5oPgo+IEBAIC0xNiw4ICsxNyw2IEBACj4gICAjaW5jbHVkZSA8bGludXgv
cGxhdGZvcm1fZGV2aWNlLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiAgIAo+IC0j
aW5jbHVkZSAic3RtMzJfZmlyZXdhbGwuaCIKPiAtCj4gICAvKgo+ICAgICogUklGU0Mgb2Zmc2V0
IHJlZ2lzdGVyCj4gICAgKi8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9idXMvc3RtMzJfZmlyZXdh
bGwuaCBiL2luY2x1ZGUvbGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsLmgKPiBzaW1pbGFyaXR5IGlu
ZGV4IDEwMCUKPiByZW5hbWUgZnJvbSBkcml2ZXJzL2J1cy9zdG0zMl9maXJld2FsbC5oCj4gcmVu
YW1lIHRvIGluY2x1ZGUvbGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsLmgKPiAKPiAtLS0KPiBiYXNl
LWNvbW1pdDogNDZhNTFmNGY1ZWRhZGU0M2JhNjZiM2MxNTFmMGUyNWVjOGI2OWNiNgo+IGNoYW5n
ZS1pZDogMjAyNTA5MTYtYjQtZmlyZXdhbGwtdXBzdHJlYW0tZGZlODU4OGEyMWY4Cj4gCj4gQmVz
dCByZWdhcmRzLAo+IC0tCj4gQ2zDqW1lbnQgTGUgR29mZmljIDxsZWdvZmZpYy5jbGVtZW50QGdt
YWlsLmNvbT4KPiAKCkhpIENsw6ltZW50LAoKQWNrZWQtYnk6IEdhdGllbiBDaGV2YWxsaWVyIDxn
YXRpZW4uY2hldmFsbGllckBmb3NzLnN0LmNvbT4KCk5pdDogcGVyaXBoZXJhbCBuYW1lcyBzaG91
bGQgYmUgdXBwZXJjYXNlIGluIHRoZSBjb21taXQgbWVzc2FnZS4KClRoYW5rcywKR2F0aWVuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
