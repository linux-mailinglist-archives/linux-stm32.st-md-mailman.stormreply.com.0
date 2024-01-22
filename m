Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB7F8365C2
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jan 2024 15:46:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2D2FC6DD6B;
	Mon, 22 Jan 2024 14:46:21 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01olkn2101.outbound.protection.outlook.com [40.92.53.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 518FAC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jan 2024 14:46:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anxULeN9Eedn65Y3djIkLcjlLO+6Qrmh+mH53k/izRyp+BFMgot//kjb7E9Q+c0XWQUwbWAFKo9BhqY1l1pW+41ZjD+leMKLYaZhaVSSCVSltnDEb5h9xYdcHA3El8+CAiGI5iKEPW7PUUcoJ0SkMRYlw2jJhlN6KXPXxnmXkopWmPbmlnI4QclKaOi7Y1v0T6WbtFSWmViL3Qjje1TeAVixY8pQ8qKHO2Dlj3I6Ud9YCGsKE2eyzy3O8FEkmIw7lFCaujr5lmZ70eHQlltIWNBvgvowiJKEmIpScCS2GR7xxIu20aS51umyN7FSCzHPc7iFSjt+LbzPSIQMT6VuXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBsE+d7HnRRXH0y3oYTeyfKkPOtquEwVJ5KaCXbBAzo=;
 b=luuqhLSdTm44IZwFZ8RQxlCPtb0QGb4csWh+orJ+ApWw4uF86CEvcoOBRRo1L1l7yMDHIOccgFr2F++86XkQSDmcmo9maudOP2xC90eURB+lejgolg5yIT6u6ABzMQJnp4I3euB+KLPULZ+7bOlcH45F5rG2UiNUrjyj8Gc4Nrvh7NcN6hQFWspWeSCV8FjBvFZnRo8J4BMzsYO9nQ59TcBckebGEfstMpBJZP4iNj/QhNOVTxaUzLUvXOAIBwyEuJRx4zB3+lofXeiNJhxl9ZMZhJGwAlFv3ZeBJjxMfqdvKY/zbJc2SKPwz+Xhly4RcfeciLBlGzSXy3GCdLw64g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBsE+d7HnRRXH0y3oYTeyfKkPOtquEwVJ5KaCXbBAzo=;
 b=sgwprZirPbWrVIC5bXe0zONMiTr/15NuJr3NB3vZjbCHfElshFm0398GACavTlPFzggS1A5pC30gjt53uDplYjwEyGi1S5tJnXCAab2/ajkPw3ELPfT9FV5tE3WxLTIX8eSyA6+jsFg/0SrQgx5+CkOPxNMEE6LNAdZ9HeY30MzhoH/NI2vJ2/NlTa/h/7SIA9QPg9GZZFOZcTvmFDeCL8YcCBpxRpLfEAGmLeO47TDpRazQOuWIcp1qknhQNrjWL6h6QuTdi+2gsdbMcYQW9X1JECqpEkg13C0Rjk1Y59eySSqsRKGWZhVCkD6cTJpV5Rt5MG/OWIhe2aN1aB+A+g==
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9) by JH0PR01MB5558.apcprd01.prod.exchangelabs.com
 (2603:1096:990:18::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.27; Mon, 22 Jan
 2024 14:46:16 +0000
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::a639:b02c:5189:7140]) by TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::a639:b02c:5189:7140%7]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 14:46:16 +0000
Message-ID: <TYZPR01MB55568359B28ABD550C8ECCDFC9752@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Date: Mon, 22 Jan 2024 22:45:26 +0800
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>, krzk@kernel.org
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <830a2717-c7f5-4bec-83b2-be14ba59337d@lunn.ch>
From: Ziyang Huang <hzyitc@outlook.com>
In-Reply-To: <830a2717-c7f5-4bec-83b2-be14ba59337d@lunn.ch>
X-TMN: [bIcTYmDZQVsWO7qrmZ6wAKLe5DZDQAxE]
X-ClientProxiedBy: TYAPR01CA0070.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::34) To TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9)
X-Microsoft-Original-Message-ID: <42876a08-2079-40d3-9306-3faa86ad257d@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5556:EE_|JH0PR01MB5558:EE_
X-MS-Office365-Filtering-Correlation-Id: a5380066-748e-4f87-3bb5-08dc1b58e2e3
X-MS-Exchange-SLBlob-MailProps: Cq7lScuPrnozpoe5DD7mC3EAaljaQdX1WXrohiKbJ2I11XDaE2xxt2HE3PlY0xvsWBiKKO0GWyNtZdAYT07gBeqQVyzTnIc9P3cw8q272O7V97S8ak+3bHjSuLIdJRNajOBT+n8giyc+rszfPoywiR4VMHdAC1Eqhkc2W5nWXMEwKCQbLsXOAhmea21SRo0ao2JAQlS1pHw9tl7fMUkQnOB656g7QMG8PyPm6EcwW+Egy2rNZkzLRgjBl1DfvuiG7BYumQk8CcUedtXyvyDZ8zTqpz4KbMW/kQMUv00tPhLXF5Sw6atnKaeTStwNaT/Ka5rwugFtEE0Sh21gR1mHclC69X6zQzSDCL/AIDMc1tpxbMGkOrfCYynevM5FdgIbnMxBu/xlaXJwh0cDQ/01gLT6lzqzIBp7tEVByChBV85az5sfGZPhCb9R7AsbA55xiLyaKb1RnsWFHvtr4ggHVWTeW8uGNdKdAMfddYPlS5aVsl3bprXhvFKWjGWo6giJpS+nYHH6PKioUgvNgtDFy6cG7IdHv4IxOGrYKHODtRkqxc6003zJTdL054bEDKfKeW3pztqbL1pcdKjx1VJPTGR5dki2GtuDKyq7RHMeKZWAhY8lrMsgfNOG/kB6reI+5Nmdlf9r01wpy1aGLdxhadoqZV5wCOw6H8svGoau5wfRAbj6FtA9dECiXDBBmbmeAtZ9uQ0AwZ/O+41Qz1sZCLia42ExC/hEwV/EEUNBz2fIE27udquavPUkYiC1Xp6mDktXwQvkqC8=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tFazeITe/3j2hj/izMPo+h7f3BvW7/t251ZohJTbh8Grp+/Ny0DX3Ekqj+CD18/qcJne3TlEonwigFgNGAdPWXVB7bl995e8fJKTar46l/woqMG8rAqHfJicWg0hL44eVheGq5hfcJae6QSu3QLFN4YeTqcOKOGd+BkpR5smKrPn8irUuI2aD8bjDD882F4UDHeIxC8G4HZ0+PlYVb0tv4nxN3ApDOCbzYYBnuUDx5x726Vquzii0c8p3kxgcOBttVQZSXsDDlU7tyfk2G2rzWWFelih6sTSQZjlXj2UyO/zA2cmEjLJlSt8NdqyOKwI+Ny5tPVmPfjtKJ7Xpi/HgTeHp98r+KggGamaEQhhushQU5wBaIS9csYmw2o3UrCXY8GLVFAsX0JO5FqIO+CWmPjGcSEjpx7ndYfIG5VOK7X5XGnDCFiPd1UvAxREdvlb02zf70T0yU67rfB6Ml6mZP6sGoXeggpvJBmm5vIrSlbvUh26EZ2+4QSWyffWmg6hcippI4KokDQ1dwjybiH9dNi1OXi7+hRQPdoIFFdAZdXgSVh2tx3Im+Z0lYz+7aNA
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkRSeXVxNzNsRHpPVEVoVzBKTldqbTA3WVRWTzEzSGdwOFp0UDgweW9ENjZJ?=
 =?utf-8?B?QjNOSmlsTy9ZSElHZ3RNYlNra0l3RGlUUFplOVgwNTdBay8rb1E3emNySHBo?=
 =?utf-8?B?N0FFbDh5OXRyb2d0cTVhNTNlTzR1bjl6dUlmWTZ1OWVibmMwTzk1cmJBMDNP?=
 =?utf-8?B?dTc0cEpyLzd2ODVKV0hFVWpRTnloRFErS0taNytZWGRLOVQra1RxT2RJUDdH?=
 =?utf-8?B?VWNLdVNGcG1IRGdTMnNBWEZaZmhyV2gyaGZtVkRvSWRGeGdZV09wcXQwOWZC?=
 =?utf-8?B?MVFDSktQK2c0YnBVMXZRejArMVdxSDY2NncySjRWeGRkaURPb3J0OEZ1WFVm?=
 =?utf-8?B?TTU1cCtzRjFUWVpMYUVtS2x1SmZ4SEFoU2w3OW9wcmFsa0l3dW5mT0FyZ3ZI?=
 =?utf-8?B?dytXMUJBOEo1YSt0R0czUlFwdE9pZFAxZ1BXY2UvbHZWODRSM0hTSklmdldl?=
 =?utf-8?B?OEtrbmdScjVBU3lXMVFibzRPVkdhZ3R1VEw3VzhGVytsZE8wMUllT3c1bWhp?=
 =?utf-8?B?WDBwemFVbUpMbjRzc1YxL1gyVlo2MnR6Y3pyL0ZxM2YzOGZqSnlURldEU2Iy?=
 =?utf-8?B?eURMRHhlTGRNWFltRVp4L29Va3M4blExbmhERHRHNWUwKy9OWmtHYzNIalov?=
 =?utf-8?B?Sit6T1VYTGxNOUhBUWVnbVQ5UW5CYTNBV3F1YWxueGxWWExWSE5FT05GU3Zt?=
 =?utf-8?B?cUZJVGs2b1YrM0Y3eXlSWlgwQll6eWFxaEFtRGYxWDdJTmJpdzJnRUFoLzQr?=
 =?utf-8?B?eVVIeVU1MEsrZjF3WEVhbnUvTjcrWWFRTURRbDZnU3lyUGYwSkVHWEFmakVO?=
 =?utf-8?B?MzlMNnRUL1dxS0VadHhVeXNnejFvOG05akdBa3p1em00Z05ya0hYS0Racncx?=
 =?utf-8?B?SkZwODZNS1NxSllzUjFObGRjdCtNbUFLY1RGakdyblpOdFV3dWlUNm55UFNo?=
 =?utf-8?B?Qm9lSGh6cEpwMHdIbHE5ZFp2R0xjZzZOMXBKSktzaUVqSG0wQkRENkpYMlht?=
 =?utf-8?B?bndUdllsWklOSUJ0Mi9PbnNTb2RoT2Q5WVJnVlorVjdqekNBS3M2RDZEbHY0?=
 =?utf-8?B?WDJUaC9WT05WNmt3Q1h4dkVXMHArTXBpZFMxblp0enVnUmlQd2xBUTZ6V0Nr?=
 =?utf-8?B?bkN6eW54TTU2VDA1ZWdGTjlqb0hBSmc2VFVuVDdqTHJUWkYxYk45N0s2YVBJ?=
 =?utf-8?B?ZzJWczVsUU9tZUZXUmtXY2lzc2RJTlJwa0lFKzM4UytBNTJvbVZQS2ZiV21k?=
 =?utf-8?B?SER1elJqMFdYNlcvaHRCNm1zdlczblZVY2xmMmIyR3didXFqdUM3a2xDSXdY?=
 =?utf-8?B?S1pIS1F2V1RVaUtKYjhVM2s4VVFldUoxVUp0YTVocjFHWEQvL1g0Z2RMbXVS?=
 =?utf-8?B?UDRFMnVZeEo1M1JCWmQvNmZPTjQxRUFBVGZqWXFvSGZZS0xMLzRNZGpyUGlH?=
 =?utf-8?B?RFNsM25BNDdqOW9Kc0pvUmZ5SGNOSnhIcDZXVUpMODlHaXZEWWRWVWV2ZjJG?=
 =?utf-8?B?V1lFV255emRiQnMrejlGMlRQa09WOU00V1dFeGRqU3hxNGxCS0NYdWVHNHB1?=
 =?utf-8?B?LzlpMGsrSkp1V09RellmblByTFBUa2Y4Zi9hQ0xrWHhDWSsyR1RqMy9RTFY1?=
 =?utf-8?B?ZkRhV0FIL0xoREx0WkgwTG9OUWxIOXc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5380066-748e-4f87-3bb5-08dc1b58e2e3
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5556.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 14:46:15.9164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR01MB5558
Cc: mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH 0/8] ipq5018: enable ethernet support
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

5ZyoIDIwMjQvMS8yMSAyMzo1MSwgQW5kcmV3IEx1bm4g5YaZ6YGTOgo+IE9uIFN1biwgSmFuIDIx
LCAyMDI0IGF0IDA4OjQwOjM5UE0gKzA4MDAsIFppeWFuZyBIdWFuZyB3cm90ZToKPj4gRW5hYmxl
IGV0aGVybmV0IHN1cHBvcnQgZm9yIElQUTUwMTguCj4+Cj4+IFByYXZlZW5rdW1hciBJICgxKToK
Pj4gICAgY2xrOiBxY29tOiBzdXBwb3J0IGZvciBkdXBsaWNhdGUgZnJlcSBpbiBSQ0cyIGZyZXEg
dGFibGUKPj4KPj4gWml5YW5nIEh1YW5nICg3KToKPj4gICAgbmV0OiBwaHk6IEludHJvZHVjZSBR
dWFsY29tbSBJUFE1MDE4IGludGVybmFsIFBIWSBkcml2ZXIKPj4gICAgcGh5OiBJbnRyb2R1Y2Ug
UXVhbGNvbW0gZXRoZXJuZXQgdW5pcGh5IGRyaXZlcgo+PiAgICBuZXQ6IHN0bW1hYzogSW50cm9k
dWNlIFF1YWxjb21tIElQUTUweHggRFdNQUMgZHJpdmVyCj4+ICAgIGNsazogcWNvbTogZ2NjLWlw
cTUwMTg6IGNvcnJlY3QgZ2NjX2dtYWMwX3N5c19jbGsgcmVnCj4+ICAgIG5ldDogbWRpbzogaXBx
NDAxOTogc3VwcG9ydCByZXNldCBjb250cm9sCj4+ICAgIGFybTY0OiBkdHM6IHFjb206IGlwcTUw
MTg6IGVuYWJsZSBldGhlcm5ldCBzdXBwb3J0Cj4+ICAgIGFybTY0OiBkdHM6IHFjb206IGlwcTUw
MTgtcmRwNDMyLWMyOiBlbmFibGUgZXRoZXJuZXQgc3VwcG9ydAo+IAo+IEhpIFppeWFuZwo+IAo+
IFlvdSBmYWlsZWQgdG8gQ2M6IGEgbnVtYmVyIG9mIE1haW50YWluZXJzIGhlcmUuIGUuZyBmb3Ig
dGhlIFBIWSBhbmQKPiBNRElPIHBhdGNoZXMgaSB3b3VsZCBvZiBleHBlY3RlZCB0aGUgUEhZIGFu
ZCBtYWludGFpbmVycyB0byBiZSBDYzplZC4KPiAKPiAgICAgICBBbmRyZXcKCkhpIEFuZHJldywK
ClNvcnJyIGZvciBteSBtaXN0YWtlLiBGb3IgZWFzaWx5IGNvbXBhcmlzb24sIEkgYWRkZWQgdGhl
c2UgcGF0Y2hlcyB0byAKZ2l0IGluZGV4LCB3aGljaCBtZXNzIHVwIC4vc2NyaXB0cy9jaGVja3Bh
dGNoLnBsIGFuZCAKLi9zY3JpcHRzL2dldF9tYWludGFpbmVyLnBsIGFuZCBsZWQgdG8gd3Jvbmcg
cmVzdWx0cy4gV2lsbCBhZGQgY29ycmVjdCAKQ2M6IGluIG5leHQgcGF0Y2hlcy4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
