Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E49B14888
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:49:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEA38C3F93E;
	Tue, 29 Jul 2025 06:49:42 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0881AC36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jul 2025 16:03:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHXJITJxcoz66zltK9rLy6nDbGTJfyXj5fwbKLAZUpbmjsZJnmxOZwl7qpzb2YV/x0zOTKFaqgooyorWOT7cuiIFTt6INSTiizLbeY7aXWfSRwBcmgiTqrL/U5mIHokoVGfBOmnfyS1Zjvw6NETIQSOeKcWsLbOJSYqEeoi9ZT+5rd0RdmvDoK8y4IjNPt/bJK+i86BKckEf93cD3toGjjntsXhoTGfAXKCpQCBKNnS2c0jHTfGa1Q1IDmjg+mN2QEF0ouuDIn1Z1vV08S5AneJImY43m3rv+s+V/ROn3v89CmSByHK+0YNNlJwCutUdBbUzLKaUGnHPcBMvQePX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ETfItTPrRoFSfdQcOOFyNTU3n5fa4shJ/ocEvMf8Jrg=;
 b=ySDQ0eB9aNLbtMXE+ZTiq1rZ3XlMJPiJuFp+nbY2cX1qEdsOF+zEO7rGZ7p6It9cJn5p44woy+Dq4IWqOQ6ORzY2YzalKpZU6fJaCUZWuEm30Lc0VBdGSwLPvRK1uiZOmweCcXqUK9YyKyj5pCu1+Pajz7F2ZUBSgwBVQhnFoOyy1J8+HuQlprM8aa+0/B9oWtzUuXtgV/GlV2qNJe/D4Z3QFq/U9W/T39wpnMwc8a7fxKFvN2ROLnIHzkFSO2W9ELWCoQOURIvaiWjPZkcb/3XtPdDcweVvgh+zu+gdSN8BYNYjQFM6j4TpkMBW+o0KWUcj0xco8PtNa/6usPSTvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ETfItTPrRoFSfdQcOOFyNTU3n5fa4shJ/ocEvMf8Jrg=;
 b=RjDgJmz42AjqsyZWqAxgQrhECUc8eddY6MFtNznC++Ew9mtXNGlQQTV6CQDgUT6lio5Abd4cEkf3f7PGYe34S3fYwYv9yFk5V0r8c1ZpMO8I2CkBTVyYes7eU3WgQhGYH05cIhdC0whKbc6+Fa9cWt8J1LgaGs1nNgMdH2OH2kUTCoplB2KeWnCab+tnvOybYLrJR+1SHT6sR20fTP7gyyX/9MZvXAcQf+fUCFeDQYo4jl016Tbg9UeBKK0sGjQSBy19gGZguC5c3fFjlsKO6is0aq/7YfiTGUjlLRIzYoeJN4dWN1j+dRvcq0+JPUBdKwVlvPnMXqwekI5nyKIXOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM6PR03MB5371.namprd03.prod.outlook.com (2603:10b6:5:24c::21)
 by CH0PR03MB6195.namprd03.prod.outlook.com (2603:10b6:610:d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 16:03:19 +0000
Received: from DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076]) by DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076%3]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 16:03:19 +0000
Message-ID: <d51b710a-538a-4952-9be6-2c5e967e6d75@altera.com>
Date: Thu, 24 Jul 2025 21:33:09 +0530
User-Agent: Mozilla Thunderbird
To: Simon Horman <horms@kernel.org>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-3-c34092a88a72@altera.com>
 <20250714134012.GN721198@horms.kernel.org>
 <9f4acd69-12ff-4b2f-bb3a-e8d401b23238@altera.com>
 <20250716082209.GH721198@horms.kernel.org>
 <38d05790-eb4a-482a-89ec-8c17cf2e9680@altera.com>
 <20250718200602.GM2459@horms.kernel.org>
Content-Language: en-US
From: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
In-Reply-To: <20250718200602.GM2459@horms.kernel.org>
X-ClientProxiedBy: MA5PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::6) To DM6PR03MB5371.namprd03.prod.outlook.com
 (2603:10b6:5:24c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5371:EE_|CH0PR03MB6195:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e72a33-294f-491b-038b-08ddcacb9b5c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tk5Wd0tOMWpSNFIrdXZQSFFUT1dsRUw0WGlPWlZJZzlVeUQ3eGxsTXA2NEp0?=
 =?utf-8?B?dkI1Rm84TDFIMmRncXRMQkpibGx1YzV0ZFVVaVhidExrRGl0emM2dFZEMDFV?=
 =?utf-8?B?ZUZ2c3BrcEQ1RzgxTmZCK0tzanBQVXVZMGh4UkxHNGN5b05vUjl2cHZGNW9x?=
 =?utf-8?B?aGNyejhwSVBFV0lIRkRKUDFVR2NnZTBqaGtic2NJS3FKSER4QS9NOHdRSUpt?=
 =?utf-8?B?ZzlhbjFvaVdFNDJQajJEbDZ6ejZLZGpuU1oxWHl4dzdhbHljK0VJdlVMVC85?=
 =?utf-8?B?T1p6M1VITGFiZTAvazZWWFEyYzJzWXlmWGdMMzZGdU41TUVIK3VSMDJVNU1W?=
 =?utf-8?B?RUgwYVQ0R0NNa053WVMzc2tiSDFCMWp1dzRZWTJJSE9GT0cyMlYybkF1V1Vo?=
 =?utf-8?B?U2oyR1FVRDd1a2ttcmxIUUc3ZWdzNkhVQ29TcThyZVNLZ1FEWWdMbWp1K0pD?=
 =?utf-8?B?aHFEc3pkS1N3aFBtTTJFUjdVNG85bTcrREV1Z2o3OHNKVVg1RWJGdm11U2ZO?=
 =?utf-8?B?Z2s3MnRXd1gyT0RVNEdteG1aRC9leHZUVHRZeDcxRWE5ZmFpOGkzbFNUL2hV?=
 =?utf-8?B?dXEvZFIwWXBabnJWT2p6UU9IZ1g3b3QwUFROMkNKaE9JRXBwbDBRY293M0ZS?=
 =?utf-8?B?NUs2MFI2UXBSdGMwbGNjSFFLcmlSZ0FLWTI2bEk5ek92K2M5Znk3cW03WDRX?=
 =?utf-8?B?NERPMkpZeTRFZEsyUmRCeU1md1NkUkpnc25wd2VXZkN3VmpWY2VHcFZDanJa?=
 =?utf-8?B?eDZZYW9JV0ZaUmdOZ04wT21ROEdnMHVieXlFUmdUOFZkWmhFQ2ZTczVFWWVP?=
 =?utf-8?B?Z1VDR05zUHdHY0FxT3ZGUnA0YzdEVGd4UGhoYTlUbkJsUW9KNEp6YzZydXF5?=
 =?utf-8?B?eHZibi84ZVovNEdPS0NWMnA5TUtoZFNxRkt6cUJJRGV4WG9QREh2MmdYSTRZ?=
 =?utf-8?B?eUNZYi9xZi9UelZqMVVQUmJMaTB4dG92MURHa2JzMkM2cHBFcFB2VG5pbE93?=
 =?utf-8?B?MTBKSVNDL3gyUnBpUXNGUnhiWTJ6RUIvaGVsSUlWbC9EK3dLQlNZdEVCSmhZ?=
 =?utf-8?B?WUQwaDMrUmJ0VTVBcDJJMDZodXVPTEJSZnlHMWJHR3ZzM1JaVWM3WStuTmpx?=
 =?utf-8?B?cUNDL1R4end5VDNWTGl2YVdIdnBXYlBsSm00c1RkODJZV00yS0NQTjRUWTJR?=
 =?utf-8?B?MHNmU1JrcTdTMTZVTmY0bnhGU1ZGeUZOZzNrV2lLM1B5dkdmNmwzcnQ1ditF?=
 =?utf-8?B?NWY5SXBVNG41d0lwZ2dYN1ZJMnFWb3RPNUhKakFIWjkrQzJyOWVUTzI0cDZB?=
 =?utf-8?B?dkhFakYzbWRvQmlSVTVKRUJXcThHOUJGUnNLQW1JYmF6czBJa2habGg2Y1Bp?=
 =?utf-8?B?S3psUDNKSCtpNXF1dFI5TU1WWnVCTEEvWjkzVWVlYmFIMzhudTR6WHk0VHBD?=
 =?utf-8?B?VXg3Q0lZZENGY1ZxdjFYSjFMeFlyOHA0dmFTamdNT21aa3JSNUZ2aEh5UEFI?=
 =?utf-8?B?U3pyakcxR0FlSitxUVlnVGtmRm5nZE1MVFZWYzgzMVRMZ25Ga24wbXZTdkR1?=
 =?utf-8?B?cnhXTFFLbnRYTHlvYjFnaFlTT0VtK293TDNVZkszdlQzVHlDczRZTGREam9Q?=
 =?utf-8?B?cnBuUEM3WUxTQzBuTEF0dTErVDJoLzlhTmQ2OWlUZThiMllabVk1c3ROd3hi?=
 =?utf-8?B?VmNjY3liWkJldWhSQWxuL2dOMGg3a0hzTXFXSFBab1hIekFZaUVGY0pseFhR?=
 =?utf-8?B?NnVOYnl1ZzAyVm9uOWhnUFN2MWhzUUp1QlVlV2M0Umw1STRqRjVTZUVHTVRK?=
 =?utf-8?B?WFFxcFY2OFY4VTAwYVh4QmFYcjlPTVJzaVphTmREQm5XNWVhRk9JTmtCN1pE?=
 =?utf-8?B?R3lSUkVWL21kQWllQnBSRnRFTW0wMTZPYjByWExPV2wwcWtIV0tGd3pWOUVH?=
 =?utf-8?Q?CnmBYbOIWQc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5371.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXExUFYrT28vVTJLb01wOHdXejBUcW8wMjdRT2pFdytEYks4dFgvazZySVBD?=
 =?utf-8?B?Y2xaZllkRTZtMGZvcFRLTDY5V0FHcy9VVmVkK3c3Wk1IcVlqNGgvcWw0Tldv?=
 =?utf-8?B?VmZGcHVBZTNuTy9LYWtNTWhMQnNjZG85QitaT01TRFAwaTVxMXUvbjV0Lyt5?=
 =?utf-8?B?UVNKOFZLMXBDL0xSZ1grWllCenk2bENnTnVVQmxRUTRVbFZKUko4YmN6OXc1?=
 =?utf-8?B?ZU5NbnEyRy9JU2NmdlpsZUllZDN0N2kxRWZtVFY1M1lNVEdZYytzZ296dFVM?=
 =?utf-8?B?LytqNE4vSlc3c3V1NU9PZXVmOFowNTdLUUpoTWZkdVVNcVVIUWpxYnkzWTJJ?=
 =?utf-8?B?a0FvQUhiN0dqTXNZNHA4UlNQd3FBMGQrT25WZC9sS1lOS0I4a0dwSDdmNVBD?=
 =?utf-8?B?UkduTWllbU55TDBmWEcyV1o5aUUwNHRONERvL3Awa1ZRZWFzQzVhT2VXZk9u?=
 =?utf-8?B?WkhiRTYySklwZkJBZkpMZWdFcVFTK1h6SWZZZHdRTDhuWkM5QmdvNktmeDRN?=
 =?utf-8?B?dDJmNTBUZ1lUOFJ1d0c5eDE1VFRRRnl1aWRxR0taKzNOQTcwMHN1R3E2dlRU?=
 =?utf-8?B?dHhBazRpYUMyNFUyTldVdUE3WGt1VXFNNEhHc3dNcG5UM1puLytNdHdFclhy?=
 =?utf-8?B?NWpudTlaZEF6clRvMUFzM0tKeWhxam5waExZWWo4eU9rNWE1L3N6RWhUL0Qr?=
 =?utf-8?B?QnJqeENTZjhtVEhPWkVqMkpmRmxjR2hEUVFCaUhjamNJbXI1SWtXTlkvUUNq?=
 =?utf-8?B?UEoyMlZDQUpkUVRBc2lzbmY0T3FrbDc0K3NrVXhDT211VHp6VVB1ZlVlMVhr?=
 =?utf-8?B?VXFOaVRMQi9weEZySXZqZVltVFROK1FBMEhjTHRhQTlQK1dWeVBlZld6T0Qv?=
 =?utf-8?B?TlNpWDJlZTZmTGh3aWpmOUtuRFduVUVHbXhISVhGTFlucmE4K3VOcHpEYUg0?=
 =?utf-8?B?eVhNZDFBMGtSMHNSUi9OQzEwZEpPazlTamtaNzU3OXcyK3NyVGNmWFJxSGZs?=
 =?utf-8?B?UlJkSkU5dWxZODhaQklJdXdhV2ZYc0NQTlNSV3E2Ukc4ZjhkL2J5SHBDK3Vv?=
 =?utf-8?B?SnBxU1k4VG5IZGI2RDM5Mi85Mk9oSHgvekNDWE9WN3Q3NzZiM2xzNnppNVU2?=
 =?utf-8?B?QUtQUDdKK3paQ05CcTRya0tZYXUvK1p6M3phZTlaQVowV0JlVU5uRWllSTFx?=
 =?utf-8?B?TVRpZzVINUJDdEU0OG5DZno2N3NORERUMWR5NU9yUHRTWDBaeVBla1IwdEZl?=
 =?utf-8?B?bzRaUVIyd1ZKRDBhN3Z4SW5xUEcyZ3htL1N4SlEwRkM3VmFmVkd1RGcvSzRL?=
 =?utf-8?B?T2w5NlR4cHdXUC9FbExhS2kwajZQaWFteUlsREZSRGNPUjhDNWtOOGk3MlJZ?=
 =?utf-8?B?NEdkRVMrbkNGcWJ6aWVDMGd4REdIbkVlcGtKbkFaREM2S3h3Z1lJMGlOOGRC?=
 =?utf-8?B?eXprSW9TRjJqTjBvRW5rL2wrQkNlazhGcjFXRnFJTW16TVJXcGFhQkVWZ0JU?=
 =?utf-8?B?QUxMTmZ0WUVvdm0wSGpOd3M4WUJzZndYUzhJQW1yUWc0NGZha3FuVFlSNlNt?=
 =?utf-8?B?R2NtR05GSWVscjAwRjU4SGxrSDNVSkhJUmpPK3dVT3p2QnI3NXE2S3pQR0gv?=
 =?utf-8?B?dGx6YzlOZ3ZUdW9QSTZ1VWVuakR6UjRHZmFDaHJFQ0FEOUFKTzdpbHBWdlg5?=
 =?utf-8?B?OWFoQ0IwSVRQZ1VEMTZLTHRmS1lFdlVQR09iMXpVSW9YSERkL2xRR1pmeUN0?=
 =?utf-8?B?bWx4MjhsOE1JRjdYZWMvSnFIeGFza0NiOUxHMSt5amRyOTZyZWhWeFl0NFEv?=
 =?utf-8?B?c1h4c2RaaDV1Z2NUcW01bTRGNmhBdkhmc1M0Z2xDNWVWYi9NcTdBbXloRFRN?=
 =?utf-8?B?ZVNGQ2dyLzl6SnZlNG8rcTVmM3hNTVdieDBnU05ONW0rcGRNTlhHNkZCdUUv?=
 =?utf-8?B?cWFiU0Uxa05TYnEwSlB4TGlKeWI5dXpENThzN0VRWitpZTVWLyt3L08vZi9M?=
 =?utf-8?B?azVUZG5mN3c1MVNRN1dwdGtzNm1FS05xb29LcWdVRXJqYWtvd2RiSGF4MzF3?=
 =?utf-8?B?RlpoWTNzdjV5K0I1QUlYWlNvSFlpdElIa0VjOXRrTWZnZGZKT3UvVzN6aG1H?=
 =?utf-8?B?MGtmcnk4dklSMTlDdmhMWnpiK3grY0tXOGEvMkRoNVBQVFZBSkZncnhwSW15?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e72a33-294f-491b-038b-08ddcacb9b5c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5371.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 16:03:19.3875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9j28oxXUfELgKucm+K2+W9O1IV8Totp/B+v91g7544jHmK138lCVIK8pYFxOCP0rUSc4G7ZPs3f6UFSpNAkZOG0PvjQVpELBmyKerQdMoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6195
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 7/19/2025 1:36 AM, Simon Horman wrote:
> 
> Hi Rohan,
> 
> Perhaps I'm missing the point, but my thinking is as follows:
> 
> As this patch only addresses the AF_XDP path I think we can take the
> approach of asking "in which patch would a user of AF_XDP with this stmmac
> observe this bug". (Or some variant thereof.) And I think the answer to
> that question is the patch that added AF_XDP support to stmmac driver.
> 
> So I think we can use:
> 
> Fixes: 132c32ee5bc0 ("net: stmmac: Add TX via XDP zero-copy socket")
Hi Simon,

Thanks for the clarification. Will include the Fixes tag in the next
version.

Best Regards,
Rohan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
