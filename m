Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA98B1487D
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:48:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21C64C3F93E;
	Tue, 29 Jul 2025 06:48:56 +0000 (UTC)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2049.outbound.protection.outlook.com [40.107.95.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7F10FC3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jul 2025 06:20:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mO3gbgESHztCKM72C9qOCQjS1g5sDsu/YjwmThdKQ1JHjo+No2T/bKkUNriKYGsU5ZeaGirh0iCykdsb+m//GlIzyx8rXoTvfpbooMqQ5c7cDvzhzlalPGz0rSUQdKjI+JPuItoDTmIV76awlp10HaSP5aeLPRa2HtMACrMxktx+Q4k2My/LosiNaxJRc1UgRUwO8vPGMThHYr6ffa40RXxLKIWZd42CLR1CZip1nvH2Kmmr+J+VNp4956rlx3Mq2P/Opnb+dAYvSy+q1tSmVVFp+yGZFwe4nYQCf4IcCy41dj/SmSjlyZhsuMBVS+361CkVD5ezEMDHPVJmdGjuOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUH5yPJOzyGcVRMwAN/g6mtZE87dxJNkshIgQkbrXI4=;
 b=OAVTFSUBTB+zdJ++07fKajBWLk0SEuWFvLMgcHTQydbMdOMOELHPCArbTro8uOtjbOd+NwAdkEHoulvqrKuUz/Vu8/meXQ7SiTbiNHRAfLGNXJP5mzIq+H6myNDZ8UpMdxiPTODvBexhLMyT6DBbcE+hxIsEcg/ZIO7GsjyccOkMzFzfUu0i200ksfC8HE3o9mRwpz31Qs/3Y2SGUD1EQ2k44uwsN2MDLdOslUyxF3VAex+/3hAqBGExJAZZWeO+WajAV6E5V6uNtpsVo2eZsdk4dfm2cRgGdIc1AVgVSDtzD6wk5XyL4FyX3O52K78vy+10yrHBoUG6adO+HLP23g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUH5yPJOzyGcVRMwAN/g6mtZE87dxJNkshIgQkbrXI4=;
 b=d1D/fBgbqql8t/LYfHzPJJEnFSt/7q1dR/Nipm8NIlUjs+6EQ4D2HyR8bcqQcSCK4nMoNZR1UC4/Hsbr4QjOw+TeTbK3M3poT+IEkeJqkOA0nmLbGoYhyXj32Ur2EMZ1tU9Mv0zFdUN37Vt7glIouCLfDXByuBresfqJG9RKd1iXtw0TETWDx+hjwur5kMDG0nc0OZ24aGlyNdogEdZolPfwuSYoHJyba26cTXfykzE/4RG/laUqhvkxCcOojwOTrDUDdgV19ydBNXBW4fjmGYFonXC0rmPRX5Sh/6r0kizdEQgaJDEVOGm7GiGjVMOk75KD5W6t3nJaLkUVaVOoKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM6PR03MB5371.namprd03.prod.outlook.com (2603:10b6:5:24c::21)
 by DS2PR03MB8160.namprd03.prod.outlook.com (2603:10b6:8:27d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 06:20:17 +0000
Received: from DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076]) by DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076%3]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 06:20:16 +0000
Message-ID: <38d05790-eb4a-482a-89ec-8c17cf2e9680@altera.com>
Date: Thu, 17 Jul 2025 11:50:06 +0530
User-Agent: Mozilla Thunderbird
To: Simon Horman <horms@kernel.org>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-3-c34092a88a72@altera.com>
 <20250714134012.GN721198@horms.kernel.org>
 <9f4acd69-12ff-4b2f-bb3a-e8d401b23238@altera.com>
 <20250716082209.GH721198@horms.kernel.org>
Content-Language: en-US
From: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
In-Reply-To: <20250716082209.GH721198@horms.kernel.org>
X-ClientProxiedBy: MAXP287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::18) To DM6PR03MB5371.namprd03.prod.outlook.com
 (2603:10b6:5:24c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5371:EE_|DS2PR03MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c89833f-4828-4f85-7e1c-08ddc4f9ff3c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzdTVUE0dUpITkVmZ1N2VlpNYldQWUJPVFVKQW9zY2x4c1RzbFVtSm44Vnht?=
 =?utf-8?B?NlZTNVk5Ukh3M0kybFhNeXo0K1poV0c0WVNwRjl4bThiMGhhblhJREFsS0Za?=
 =?utf-8?B?MWpuWExSK1Vlajl0RGFTSitkWll1VXpZM0dQcnpEQzkzZFQ4aTJac3B2SW1R?=
 =?utf-8?B?UkxmZ0NpTm1uTW5wb1ZCdWJmR2gxZUl1TmlZMzJwaExSaTVYVXNsZFoxaGov?=
 =?utf-8?B?bUxkYmx5dHp4V0NwcDFwY3JQRnpYTHJCaEJYUDRVR2JKaEVLcVM0aTFZTjl2?=
 =?utf-8?B?bUZ6L1UyY05pdldOQVE2QVAzRWZJOTgrVy9uNHl2blY5S0UySFZ3VTR0SWta?=
 =?utf-8?B?VzJ0eTR0S2Z3UFlRWXFMR0s1VkNBaVBqRzBScXRPYkRQbVVPUFpUbFlYblNq?=
 =?utf-8?B?THQrL2pjUDZQSW5Pb3RSRWRqNVgxazFKdWZPcThGOXVvL0d3eXN0NDRBb0dx?=
 =?utf-8?B?MXdxUnJqeGpobHVIZkV0TWt0VzVlMEVIcTZmbG1PaHB0eTdkU01Qb1hDUm5K?=
 =?utf-8?B?RDllWStZa1NMS2xWbkxZT0FaVDhLSWZVdW9IZFk3cDYzZkdURVJ0RjVJMVc2?=
 =?utf-8?B?THVCcjY2TTkrZm85dGFoMG14VmUrMjY0MXJhQ2JLMEF6NTJhQmhEVVYxQmFp?=
 =?utf-8?B?V1hvWlp6djZ2dDJ2eTVvNmp5a0pQdGhMMlpWYlJ6ZmFiSFJ6V0ZRN2hSMFhM?=
 =?utf-8?B?RXNIajNqQjMxdCtnZXdXdWhZU3F4VDQ3Mk9FeE13MU9EeEJVRFZmTkc3dTJZ?=
 =?utf-8?B?aWFuTkhldnNKVFljaEEwQ0d5OWtCTzFqdkRSNXJ1eENRQU4wOXg0cVIvMFda?=
 =?utf-8?B?Y2ZlVFJub2JrMzdLUkRvWUJ3bmwzeUl3UmJ4YlhreU1GNGdjSktxcFBMay9B?=
 =?utf-8?B?RWhlTDFzUGdKRDZTYWhqQWkvZ1liRmY5TkY1dVB4cU4rVkhTRnRjTkIxME5v?=
 =?utf-8?B?TlJwbFFIb3haeGlhNzhJZ3dZb21BWDFtS3NKM1E1RFhDbmcydGcyQWg2ako4?=
 =?utf-8?B?dU9INTJ0RjdBUmRSOFV0WnhnNENzamthMFdHdnl6WFlTSFM2bTZSSnN1V3h1?=
 =?utf-8?B?UnNDZXZTRzFVR3ZlMUhOdnh2cnZXMGZBT1A5ZGJ4TXZlQ0lyWWlvTzJLc21J?=
 =?utf-8?B?SEg5RjZjYjl2N0poSysvMjIxa1c3SlRhY1NJWDVyNVRtOVU1aUxIRkswbzZp?=
 =?utf-8?B?TEcyYzh5WDFZRVowOW5QSWs3UUkxekNURkFlVmkyZG1xdCtiNXJqTFN5LzN2?=
 =?utf-8?B?dTN2ZmYxNGlneXhTYjFzUy9tYjJ3ekFKeWxKenRPVktJWStMbk4rT3ZOa0Fw?=
 =?utf-8?B?R1Z0QzlRdnUrbm4wVGxyUUt3eUR4b2dDODJUKzJmelZwaXdKelc0U1ZIQW1I?=
 =?utf-8?B?YWsrVE4rY09uNFFXd1dYSk1TUS9yNWdacXRyM0g5YUdtNktDYk9CYk4wUVZY?=
 =?utf-8?B?WUwveG14bGtaZjg3NnBHRzFhdGZtTUo0UHdRdVdHM1ZHZ2xmVDJTbmxXTTdS?=
 =?utf-8?B?eWhkT1hzQ0paci82WDF4R1pJL2FGbWVuZDhDMW9XdVdJcjlaU0tBTmFvN214?=
 =?utf-8?B?bEd5UlliWjBLbys2UnpLNFdPb2NRRTgvTnN1Z3dldW5IdHVReDRzMm5lUUpX?=
 =?utf-8?B?ejVCYjNLZjRJSmtkOVQvdE5sbEVFdVo5ZmhkNkI4bkRuMFRPaTBYZFdVWGY2?=
 =?utf-8?B?ZFpEaExRN25qNG9obEduQTN4T3VHT2JVQ3JmOXh2NDA0bGdUbEl4WGg5S1ls?=
 =?utf-8?B?dSt6cS84bkhRNGdJREhZbWNXcWR0WWNhNll6cHozcWdyVjA0bHI1V1ZpRWxy?=
 =?utf-8?B?bkRnT3ZybWxLQUtKTlRwaldzVE96eVRsYU1PUXpnSVZab2krY3FSZ0NWYjh5?=
 =?utf-8?B?Z0FKZytFdzVxaXYyM0JjOXZhQ1hrN096WWJqRUtrS3IyRmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5371.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDFJRVFTblB5MWQvaDUyRWRwclNTYWp2QU9mRHBKOTlDMUQwYTJCK1RtNDgw?=
 =?utf-8?B?NjZ4RHlYSDNGeHN3Q1A3ejVXdWhDUFlNOUExWXV0bDZPcjA3TTZUamNrTnVF?=
 =?utf-8?B?RDJOWitNalRzQ0oyeDVEenU1SVM4dk1XcWVxMDBkV0tJNnNlUVZDczRMbVlV?=
 =?utf-8?B?K2YxeGZkdWs4WnU1YVJ5eHEyWmJlNHdQamI5dTY3VkJudTN0UkxsYVNXbUll?=
 =?utf-8?B?ZmVLa0JoSHRvM1c1T0xIdjVYWnRhUzhWMU5KV1NidXZjR2pkK3hCK3ltRzNB?=
 =?utf-8?B?NGpMYjhONVpFemlxWCtwWlNqcm96ajBPSGZzMGRVUGlieXdjRlpySERnMVJu?=
 =?utf-8?B?N3RtQU1XcUNHWUNLRmVtU25rL3VBd1pEdU9yR29MQWl0bnhCTHQ0b0gyTEMx?=
 =?utf-8?B?cWcxVXNrMjNmdXA4UWVxandoMC9YRlpBdUdUcGVCUURZbTFIRDB2bXVEVUhv?=
 =?utf-8?B?S2hnRmQrRWhZSi9EOWtPRVQ0U3hpYVdQdmlzb3NGS3ZPdXlrZHhpVEJzZTFw?=
 =?utf-8?B?aXQ1aWt3S0JKZW9rVktHcFRiYjMzT3JLY3orWndRSVo2Rit3ZXMxVmdTazV1?=
 =?utf-8?B?ZlI1ZGJ3MEdML1RsQzFOT0FRbjFBMlRVRXZONnJpNlRCTkVPZFdmR3E5aDEy?=
 =?utf-8?B?NDVPa28veVZIbTkyc2YzcklVaVc2YVlaNFJWWXh5OS9PczVuUFIzQkdwREN6?=
 =?utf-8?B?cGdDbXZpUUQyNmdFZUtZSjNpUHJzQTZ6STR2bTJjR2MzM25rRllKRlZFclYv?=
 =?utf-8?B?clVFR1ZzMVRpZGprQnBSUGpvcnBYamxUdS9zdWR2WnJrb3dKTU9EajBlQ1dj?=
 =?utf-8?B?SEE2dHVJSVJFc0RSVmxqc0J6MzI5YjI0NitjeG4ycnFuT2V5ek9YM2UwenhM?=
 =?utf-8?B?OUphS3JBTitFNmxCelVhZUtiNzFnZ2xHTCtXRmNOVlEwbFNPSUV2NkduaC9X?=
 =?utf-8?B?UEZPckI2UHNWSTJHZmVUS1VHc3pFRnRXTDlCQmU5bkR5bGNHWTUxNEtnZkps?=
 =?utf-8?B?M2k2LzlzNVVRVnhyTnhJM2dKdmJmeVlNb0xkV3YyR2EwWSszRU5JSUpsTk81?=
 =?utf-8?B?OFJPRGNuMG8rcWZZblhEL01EOEVvUERRakJmQUQvNlUwUG51b0ZMQkRsVjdD?=
 =?utf-8?B?TjAwbzJhSEtWU3MwUFBSY1dlNm1CQWMveUsxanlXd0NiZ3ptUzZzWlAvSEx1?=
 =?utf-8?B?ZStSU0FhK1E4RmZkcWF5bFBVYWZBUmNmSXRvUTF4L2JxQm16QlhBWWFyYXJU?=
 =?utf-8?B?c0svWkJtOEtwY3F4M3orSW9XQ3ZhWHNPMTZlNU94Tm9CT1pHckkvclMrREtU?=
 =?utf-8?B?dWV0RC9QN25tMGlWZE5aMjZ2OFZGdW1IR3phN2dMYXlXWGs1aUdSenNXVU1J?=
 =?utf-8?B?ZGwrYjhNZmFqZU96cDFsWjg4aTFZOEZKT25kQkZhTnNzaXE0U0hNa2NKUTdV?=
 =?utf-8?B?TWFEM1ZTNmpkWldUVHBtdTJyZXRrZ01qRHIzbTRNVFp6NTRLWHF1NTA2WDN5?=
 =?utf-8?B?VGFXbTkyK0tseDl0U3RFUzdvNCtGSjVGaGJrKy9HaWN5ZjNLWm5XSmdVclQr?=
 =?utf-8?B?dHY4YjRSakpjZzZ3ZThPZmx3TnZVdGtQcm43ZGI2eGp6c1VBa0FPbmhqS1lJ?=
 =?utf-8?B?Q2RhVTlUY3BtRkI5RHlVa2hSOVJvTDRBQ0xqaHhrSkpVeWlqaHphRWk1VUJt?=
 =?utf-8?B?ZTc4NVlqY1I5emN6MnVJQzhHUysxMUdxWWNOWkZkaUx0YkY5VkgxL1RGY2k3?=
 =?utf-8?B?V3E5UGs4QnBSbGlPbkdFUVRzTWRYVjc0OWpYc0hhakNqWTBuMW8zR3Riclhk?=
 =?utf-8?B?eVo1TjVNOXlrQnlsYnVLRHN0QUZnd0RQTkMzQ01YUDRBc1RGaW4zWUVHdisz?=
 =?utf-8?B?WDZLMnZtWXEwcHZxdmdybGpCcTNxVXhOVEd5WnhkS3NkTGpwQ3BZN3V2MzhW?=
 =?utf-8?B?OC9yLy9PWS80YVM5c2UyUWd2eXQrTkdIbWVVUXQ5RU8zVmNaaEM4ckpkMjdZ?=
 =?utf-8?B?WG9JdmY1aEFMallleUNBM2UweE50R2FENFFBUElRZE5vVzMrczhBbWJPWXFI?=
 =?utf-8?B?ckhQSWExYmg5K3pFZWVjMWNBbU1hbklER29aK05nRVF0bDNndjRiejhpYXhM?=
 =?utf-8?B?eGlYOGJwdEVuWGIvTmZGS0o0WTVORjZ3akhXNjlFZEVSN2NBYnpLWi9qbHBS?=
 =?utf-8?B?cHc9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c89833f-4828-4f85-7e1c-08ddc4f9ff3c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5371.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 06:20:16.8178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bx61vz0cvfrB+rQ24xrk56jh0GeYWjvGq6t7ZIFeIfWCNgsXuDrv9d6Ehj53fhVVQSoxCGZa9C/dRE7VmTcBepEZJOm5OiYth4F4ezFgXyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB8160
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: linux-kernel@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Set CIC bit
 only for TX queues with COE
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

SGkgU2ltb24sCgpPbiA3LzE2LzIwMjUgMTo1MiBQTSwgU2ltb24gSG9ybWFuIHdyb3RlOgo+IE9u
IFR1ZSwgSnVsIDE1LCAyMDI1IGF0IDA3OjE0OjIxUE0gKzA1MzAsIEcgVGhvbWFzLCBSb2hhbiB3
cm90ZToKPj4gSGkgU2ltb24sCj4+Cj4+IFRoYW5rcyBmb3IgcmV2aWV3aW5nIHRoZSBwYXRjaC4K
Pj4KPj4gT24gNy8xNC8yMDI1IDc6MTAgUE0sIFNpbW9uIEhvcm1hbiB3cm90ZToKPj4+IE9uIE1v
biwgSnVsIDE0LCAyMDI1IGF0IDAzOjU5OjE5UE0gKzA4MDAsIFJvaGFuIEcgVGhvbWFzIHZpYSBC
NCBSZWxheSB3cm90ZToKPj4+PiBGcm9tOiBSb2hhbiBHIFRob21hcyA8cm9oYW4uZy50aG9tYXNA
YWx0ZXJhLmNvbT4KPj4+Pgo+Pj4+IEN1cnJlbnRseSwgaW4gdGhlIEFGX1hEUCB0cmFuc21pdCBw
YXRocywgdGhlIENJQyBiaXQgb2YKPj4+PiBUWCBEZXNjMyBpcyBzZXQgZm9yIGFsbCBwYWNrZXRz
LiBTZXR0aW5nIHRoaXMgYml0IGZvcgo+Pj4+IHBhY2tldHMgdHJhbnNtaXR0aW5nIHRocm91Z2gg
cXVldWVzIHRoYXQgZG9uJ3Qgc3VwcG9ydAo+Pj4+IGNoZWNrc3VtIG9mZmxvYWRpbmcgY2F1c2Vz
IHRoZSBUWCBETUEgdG8gZ2V0IHN0dWNrIGFmdGVyCj4+Pj4gdHJhbnNtaXR0aW5nIHNvbWUgcGFj
a2V0cy4gVGhpcyBwYXRjaCBlbnN1cmVzIHRoZSBDSUMgYml0Cj4+Pj4gb2YgVFggRGVzYzMgaXMg
c2V0IG9ubHkgaWYgdGhlIFRYIHF1ZXVlIHN1cHBvcnRzIGNoZWNrc3VtCj4+Pj4gb2ZmbG9hZGlu
Zy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFJvaGFuIEcgVGhvbWFzIDxyb2hhbi5nLnRob21h
c0BhbHRlcmEuY29tPgo+Pj4+IFJldmlld2VkLWJ5OiBNYXR0aGV3IEdlcmxhY2ggPG1hdHRoZXcu
Z2VybGFjaEBhbHRlcmEuY29tPgo+Pj4KPj4+IEhpIFJvaGFuLAo+Pj4KPj4+IEkgbm90aWNlIHRo
YXQgc3RtbWFjX3htaXQoKSBoYW5kbGVzIGEgZmV3IG90aGVyIGNhc2VzIHdoZXJlCj4+PiBjaGVj
a3N1bSBvZmZsb2FkIHNob3VsZCBub3QgYmUgcmVxdWVzdGVkIHZpYSBzdG1tYWNfcHJlcGFyZV90
eF9kZXNjOgo+Pj4KPj4+ICAgICAgICAgICBjc3VtX2luc2VydGlvbiA9IChza2ItPmlwX3N1bW1l
ZCA9PSBDSEVDS1NVTV9QQVJUSUFMKTsKPj4+ICAgICAgICAgICAvKiBEV01BQyBJUHMgY2FuIGJl
IHN5bnRoZXNpemVkIHRvIHN1cHBvcnQgdHggY29lIG9ubHkgZm9yIGEgZmV3IHR4Cj4+PiAgICAg
ICAgICAgICogcXVldWVzLiBJbiB0aGF0IGNhc2UsIGNoZWNrc3VtIG9mZmxvYWRpbmcgZm9yIHRo
b3NlIHF1ZXVlcyB0aGF0IGRvbid0Cj4+PiAgICAgICAgICAgICogc3VwcG9ydCB0eCBjb2UgbmVl
ZHMgdG8gZmFsbGJhY2sgdG8gc29mdHdhcmUgY2hlY2tzdW0gY2FsY3VsYXRpb24uCj4+PiAgICAg
ICAgICAgICoKPj4+ICAgICAgICAgICAgKiBQYWNrZXRzIHRoYXQgd29uJ3QgdHJpZ2dlciB0aGUg
Q09FIGUuZy4gbW9zdCBEU0EtdGFnZ2VkIHBhY2tldHMgd2lsbAo+Pj4gICAgICAgICAgICAqIGFs
c28gaGF2ZSB0byBiZSBjaGVja3N1bW1lZCBpbiBzb2Z0d2FyZS4KPj4+ICAgICAgICAgICAgKi8K
Pj4+ICAgICAgICAgICBpZiAoY3N1bV9pbnNlcnRpb24gJiYKPj4+ICAgICAgICAgICAgICAgKHBy
aXYtPnBsYXQtPnR4X3F1ZXVlc19jZmdbcXVldWVdLmNvZV91bnN1cHBvcnRlZCB8fAo+Pj4gICAg
ICAgICAgICAgICAgIXN0bW1hY19oYXNfaXBfZXRoZXJ0eXBlKHNrYikpKSB7Cj4+PiAgICAgICAg
ICAgICAgICAgICBpZiAodW5saWtlbHkoc2tiX2NoZWNrc3VtX2hlbHAoc2tiKSkpCj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZG1hX21hcF9lcnI7Cj4+PiAgICAgICAgICAgICAg
ICAgICBjc3VtX2luc2VydGlvbiA9ICFjc3VtX2luc2VydGlvbjsKPj4+ICAgICAgICAgICB9Cj4+
Pgo+Pj4gRG8gd2UgbmVlZCB0byBjYXJlIGFib3V0IHRoZW0gaW4gc3RtbWFjX3hkcF94bWl0X3pj
KCkKPj4+IGFuZCBzdG1tYWNfeGRwX3htaXRfeGRwZigpIHRvbz8KPj4KPj4gVGhpcyBwYXRjaCBv
bmx5IGFkZHJlc3NlcyBhdm9pZGluZyB0aGUgVFggRE1BIGhhbmcgYnkgZW5zdXJpbmcgdGhlIENJ
Qwo+PiBiaXQgaXMgb25seSBzZXQgd2hlbiB0aGUgcXVldWUgc3VwcG9ydHMgY2hlY2tzdW0gb2Zm
bG9hZC4gRm9yIERTQSB0YWdnZWQKPj4gcGFja2V0cyBjaGVja3N1bSBvZmZsb2FkaW5nIGlzIG5v
dCBzdXBwb3J0ZWQgYnkgdGhlIERXTUFDIElQcyBidXQgbm8gVFgKPj4gRE1BIGhhbmcuIEFGQUlL
LCBjdXJyZW50bHkgQUZfWERQIHBhdGhzIGRvbid0IGhhdmUgZXF1aXZhbGVudCBoYW5kbGluZwo+
PiBsaWtlIHNrYl9jaGVja3N1bV9oZWxwKCksIHNpbmNlIHRoZXkgb3BlcmF0ZSBvbiB4ZHAgYnVm
ZmVycy4gU28gdGhpcwo+PiBwYXRjaCBkb2Vzbid0IGF0dGVtcHQgdG8gaW1wbGVtZW50IGEgc3cg
ZmFsbGJhY2sgYnV0IGp1c3QgYXZvaWRzIERNQQo+PiBzdGFsbC4KPiAKPiBPaywgZmFpciBlbm91
Z2guCj4gCj4gQXMgcGVyIEFuZHJldydzIGFkdmljZSBlbHNld2hlcmUgaW4gdGhpcyB0aHJlYWQu
Cj4gVGhpcyBwYXRjaCBhbHNvIGxvb2tzIGxpa2UgaXQgc2hvdWxkIGJlIGEgZml4IGZvciBuZXQs
Cj4gYW5kIHNob3VsZCBoYXZlIGEgRml4ZXMgdGFnLgoKVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRz
LgoKWW91J3JlIHJpZ2h04oCUdGhpcyBwYXRjaCBpcyBhIGZpeCBmb3IgdGhlIFRYIERNQSBoYW5n
IGlzc3VlIGNhdXNlZCBieQpzZXR0aW5nIHRoZSBDSUMgYml0IG9uIHF1ZXVlcyB0aGF0IGRvbid0
IHN1cHBvcnQgY2hlY2tzdW0gb2ZmbG9hZC4gQnV0CkkgY291bGRu4oCZdCBwaW5wb2ludCBhIHNw
ZWNpZmljIGNvbW1pdCB0aGF0IGludHJvZHVjZWQgdGhpcyBiZWhhdmlvciBpbgp0aGUgQUZfWERQ
IHBhdGguIEluaXRpYWxseSwgdGhlcmUgd2FzIG5vIHN1cHBvcnQgZm9yIERXTUFDIElQcyB3aXRo
IENPRQplbmFibGVkIG9ubHkgb24gc3BlY2lmaWMgcXVldWVzLCBldmVuIHRob3VnaCB0aGVyZSBj
YW4gYmUgSVBzIHdpdGggc3VjaApjb25maWd1cmF0aW9uLiBDb21taXQgODQ1MmEwNWIyYzYzICgi
bmV0OiBzdG1tYWM6IFR4IGNvZSBzdyBmYWxsYmFjayIpCmFkZGVkIHNvZnR3YXJlIGZhbGxiYWNr
IHN1cHBvcnQgZm9yIHRoZSBBRl9QQUNLRVQgcGF0aC4gQnV0IHRoZSBBRl9YRFAKcGF0aCBoYXMg
YWx3YXlzIGVuYWJsZWQgQ09FIHVuY29uZGl0aW9uYWxseSBldmVuIGJlZm9yZSB0aGF0LiBTbywg
ZG8geW91CnRoaW5rIHJlZmVyZW5jaW5nIHRoZSBjb21taXQgODQ1MmEwNWIyYzYzIGluIHRoZSBG
aXhlcyB0YWcgaXMKYXBwcm9wcmlhdGUgYW5kIHN1ZmZpY2llbnQ/CgpCZXN0IFJlZ2FyZHMsClJv
aGFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
