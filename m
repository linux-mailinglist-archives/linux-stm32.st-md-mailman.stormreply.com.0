Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 387188C56D1
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2024 15:18:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC469C6C838;
	Tue, 14 May 2024 13:18:50 +0000 (UTC)
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com
 [67.231.148.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDAEAC640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 10:11:21 +0000 (UTC)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44D9g5qK015038;
 Mon, 13 May 2024 03:10:50 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3y3gf4g29f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 May 2024 03:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuKfjVdW6fGXzt+AGnYAdxfrUFyFLZLVVdeJexJzNUS1NljtnPsGe6yrjWsRn7a/LGiQOzVOBi8NdWjpdWFCdilduMVmLcHMCYFnS/MdQws2iTr6bB2oLPl+GI0rJnv8sMk/H6yWCxKPz7mLQPRu/laxEeRL+n8eJsAy2L/Zuq03Xz6m/3SUnwxhw4s4hHCnBtXfRPsRnXAha6pu7Ok3wE4X3s/kc0paGyHM9TghUhIyJYwToz2atXhRX8b+41hZY52V0wnuS8CFLg+Zh+34Rmo8Q/sT7C6WQHChpsSbZ6AvKNJ2sw3NYskQES7ansWLSw+oRd9sZTzOcOF7QSEryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lwU3Q9TNX95ME7Wjmu7rWW70kWrhPt2/7/4h+mJt3s=;
 b=jqGM6m3eaLVoQ6Oj4FnMWGsgwzW78eJb04Dl0b63P2Q5Cmj3c+BhttxK7ZyLPWKHmfcAEDaeQf8DvAVbwqSFpBvM9rH9XmL726SJaStX1BWORudy9Hn3FeXkKia0N6WkdAa2BY4b4GUogIWD/JblcSkzIJK89vRRuJ4KIvOJCrJL9rkww9LYMvHznnk9Hq6k7n5+YTDVKJG9HD/93+pwxv2HAjUX/9eLbIRw5MvYa6p6ZeHx43PPz39+xLwwN3TWM1SGZDUAIZfpVcePnKZoMEpYV51vmqhgOTTuLuQDyu+Cl375IGN29vAPvo90PqdUXvt+B8wDR/em/HdyxJvMpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lwU3Q9TNX95ME7Wjmu7rWW70kWrhPt2/7/4h+mJt3s=;
 b=Usr/0oZ2I1n38jyzrrk+BQ/3CX7EXOFjOukcitERXLr5qBj2xKmLLCVEC1E3qWZZW9FIilrMiWu6LgSm5CahrfOdZOOVRIwFd1S5qyKkUBIROuJH8M50ZnlJAsgmXPUguUhX7LHXyiakYMJfLcCOB+/2BpRXu2tmk8hoFCMhoQY=
Received: from PH0PR18MB4474.namprd18.prod.outlook.com (2603:10b6:510:ea::22)
 by LV3PR18MB6219.namprd18.prod.outlook.com (2603:10b6:408:272::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 10:10:47 +0000
Received: from PH0PR18MB4474.namprd18.prod.outlook.com
 ([fe80::eeed:4f:2561:f916]) by PH0PR18MB4474.namprd18.prod.outlook.com
 ([fe80::eeed:4f:2561:f916%5]) with mapi id 15.20.7452.049; Mon, 13 May 2024
 10:10:47 +0000
From: Hariprasad Kelam <hkelam@marvell.com>
To: Romain Gantois <romain.gantois@bootlin.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King
 <linux@armlinux.org.uk>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <clement.leger@bootlin.com>, Serge Semin <fancer.lancer@gmail.com>
Thread-Topic: [PATCH net-next v7 5/7] net: stmmac: dwmac-socfpga: use
 pcs_init/pcs_exit
Thread-Index: AQHapR3SDYCXOY+HUkuDYtV14kKYeA==
Date: Mon, 13 May 2024 10:10:47 +0000
Message-ID: <PH0PR18MB44748E7BC1D2C669E3CE0D1BDEE22@PH0PR18MB4474.namprd18.prod.outlook.com>
References: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
 <20240513-rzn1-gmac1-v7-5-6acf58b5440d@bootlin.com>
In-Reply-To: <20240513-rzn1-gmac1-v7-5-6acf58b5440d@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR18MB4474:EE_|LV3PR18MB6219:EE_
x-ms-office365-filtering-correlation-id: 5ebad349-b2c0-47b4-65b6-08dc7334f570
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|376005|366007|7416005|1800799015|38070700009|921011; 
x-microsoft-antispam-message-info: =?utf-8?B?ZUQrWkJSRXBQMThXUE9tZ0NsZHR6d2MvdXBZNTcxdVNPdUtMZ0FRdW51bjds?=
 =?utf-8?B?T0hJdUNvYjVQazl0SDM4ajdncXFIUVVDK0FDVlhwNlcwdGVQSHM5VHZQL0hi?=
 =?utf-8?B?TVpnam9FZXdCS2xCNEt2d0J4c056RDBURFo3NG5TelNrNFhrMUF6cXdvbnIv?=
 =?utf-8?B?cHNGekRjcDVmOG44V1ljK1AyRUxjNFA5Y2JNTUhRRnc0TEZIT1JEUXZlcWZZ?=
 =?utf-8?B?VUd5MVVnT0lMRjM0ODZJNUNybWpPQkQ3WWZiMFJkL1p0Z0Fzb3Zzdno3NDNX?=
 =?utf-8?B?SFlCL2FjRmtENm42NUdncmdjVXd1cUUzanlRMGlUQUFhcjVabG5aRFdVZHdB?=
 =?utf-8?B?NTBrVEYvNVBscit1R2xvYUY5MnlhKzR5R3ZqaEtqTjJKTTg4dEtOZ0ZVaitw?=
 =?utf-8?B?M2lhQktsUFg2Z3Bmejd3aGxpc0NqczhTZ280VHZtSnhvZm9lWFprSHJPOWhy?=
 =?utf-8?B?TUxHZ3pMcUwxRXRVMkVyKytMTEtydWFEb2UyRkF5TEhvbExIcysrdUNieVYv?=
 =?utf-8?B?NWw2YlZhSVZiankwWnMyRC9FK1dGU2VqMlVJZWVmNUVWRWZIRUwxUXd2Wm5F?=
 =?utf-8?B?NEprSDQwZDNoKytiN045VGlWeFNvQVFjVTY0SW80UlVYQzNqb3oyQkNHVFFL?=
 =?utf-8?B?NGFSNWFsM1QybDZacVprelIxQ2tLbUF0RUxONnNQWjMyMG1sQnhmT1NjL1ZG?=
 =?utf-8?B?QUtiTkZyY0NtSWdWR0FRL0tqNlhyeDZYNXdKbWZCajJ1ZHE5U2h0dWhjMmNz?=
 =?utf-8?B?SkFFZ0tlaXd1TzdqU05ZUFM5V2o3RVhpTUNxaW9PYktiYys0YzArbjNIYlRR?=
 =?utf-8?B?SVZyRE9RcUNjVXIzeFkyLy9TUVhRVzVCVnloazdsNVc0VnlZYi8wcVB2WHBp?=
 =?utf-8?B?dWppaUN0R0RQTU9GM2t3QVQzMWcyNDZEZXBYUmtldy90cGZ1d2Y0Y0NTRVFT?=
 =?utf-8?B?R2JHRHVLc2VKaW1wUkpKdXlXQ0xSbUlZTmZ3RkdpcXdzTXY4VDFhSjVtOHVj?=
 =?utf-8?B?OE5jaXg2ZGtRczdmcnB5ZkJnbHZpM2dkc2p1RmVIUnppVk9ySkw1Z2theTJs?=
 =?utf-8?B?SndsSlQ2d01LTXViZUVsZFRUaDRaRmFnclh6MmNmU3ZiQ1lRZ1VsSThNQkQr?=
 =?utf-8?B?aFNyZW11TlFDdjFqOHB0bGdLRDNVMnQ4UnFYaTBnKzJHVkpaTHMveVpZT292?=
 =?utf-8?B?Y0dMeVhXZFYrNmZSWHhtaDZJREhQaEswbm9MbzNuT25jMkF0ajBPM2p6VHkx?=
 =?utf-8?B?eTM4ZWphVVY2RUd1TS83SHc4UEZwWTRTQ2NTc1N1NWIrU0laSkZsQmxGemRE?=
 =?utf-8?B?RnIzNWRta0QyMVQvb2oxdVVVb3Z0R25Fc2hycEVtekxRQS9SQS9PSDlGS1oz?=
 =?utf-8?B?TWxMMzEzcHlRWFZ1NGFERnRDQTBvUjJ4SGs5d2RHR0d4RG44MGRGMVhBNnJj?=
 =?utf-8?B?a2JFV2RPb3hBc1pnbGN3M0pQazZtYzBCdXFDRXJSRVRBWVA5TFk0QThSTDNE?=
 =?utf-8?B?VHNCUHUzUmk4QTBxeTE4dVBJbjhKNnNYVU1iR1RQbzRmanBQZkVpTDNURmVa?=
 =?utf-8?B?dm5IUStMbnZTNHRMS0tRdUFYdVJxZ25OL2Z4SXRQK04yeENIMW1JTThYRzVN?=
 =?utf-8?B?dEoxM3h3WVZCN1Rtd2VCekR4UjAxbWNVWG1heUVveDBUdWNqQlpDUGJJUFVO?=
 =?utf-8?B?T29UenNwc2J4bFpHZ0xDVnZUV1dNYytFd0ltU0JXUWpwZmQ4NjhrVTY0Ykhj?=
 =?utf-8?B?NUJUMk85SXBUZVBtdGJtZFg4MEdDVEx3eE9Vc1hpTmxlMWdUeEVoem9tQUhR?=
 =?utf-8?Q?VafORoylx0MXYJ8MyJ0ozM5mvwvLc91ZuxLtc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR18MB4474.namprd18.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(7416005)(1800799015)(38070700009)(921011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1V3WmVaQkZXb1hVWFNHbXRWYnRGdG1ZRGNFV3F0b09QQUV5MUQyVDVWSVJj?=
 =?utf-8?B?SC82dkxBY1pBUmJNTGJ4RGxhbXZvL0pDRmsyRXNmbjFjUmxvQ0tIOVFQcXps?=
 =?utf-8?B?QXdjeUZya3E1SXRHay8rdGE4VTZaV21lL2dhMkxjS0x4c2RXLzYwenVYK2VT?=
 =?utf-8?B?bVNINy9yY0pvVmU2VjBDVEZ3bkxMbldUZ3VKZHM4YnJtelNtQmdaWkpkVVRS?=
 =?utf-8?B?OEtoelFLbnV3Zm40MXZiRmJhVGR5KzhkeWVXTkNiV3NZQytGY1BGcGJkOW8r?=
 =?utf-8?B?ZisyQ0hTYlk3Yi9ocmphdUw0TC9KSXVZOGJOUUtBQk9rUnNMYmM2NzlmYkE4?=
 =?utf-8?B?MVlMTjIxckJ2aFRjQVUxMHVKK28zRU01cEVZSElIc2I0YlB6UXY3SWwwM0R0?=
 =?utf-8?B?c2hqNVI5VzN5RTVuRE9SR2RhWHZ3NTNKb3RueGlMaWpqUHlDa1piMTQ4UkhI?=
 =?utf-8?B?TnBNbDd2bndNVndWS3JieXRHWnZJWmZjdW5FNDV3eFZvQnRvMXBZcUVSajcy?=
 =?utf-8?B?NnJELzVFc3FNVTlDVmRLMzF6dzF5SVI5ZklMcWJiSGN3NlNUdzlOWXFqR0pH?=
 =?utf-8?B?MTJTNTVaeVlnbDdrenMyd09sbkdmVWtFU3BQbllERVgrWHFqQXFqa2R4L1B3?=
 =?utf-8?B?ZUFiYmMxd214cGJ1bWdlTHRtcVJSdSt1RUxKTjZCVFlOV21GSlNTWDNqVU9n?=
 =?utf-8?B?ZEgxcUk2VnNYQ01BM2tkWDlJNnpoWDFNY2hZNnpvSEpGeDhHVzdqUkZzamNH?=
 =?utf-8?B?dVBEZytOdEtodFZSUlk3dmExUDFmeE96UE9CUE5OVWhpWjRoMS85blY4aVpz?=
 =?utf-8?B?bFlyVlYyc043Nm85Tjc2L2tGeThNUlF6THpvOTh2anJYUUJNOGVibGRneGlz?=
 =?utf-8?B?QXFrRzVuaXRoZ2x0dndhclMzVEFLYXJhTldXMnIwZ2ZwM1BQM0MwbmUrUDk3?=
 =?utf-8?B?aGk3K1RJZGlGaDBkSDkwZ01QR0tnSWcrT2wwV2pXMG9udTVUZ2QxcUphKzdq?=
 =?utf-8?B?NFdWVS9hd0ZoNDJUNnB0ZHdjc2hGM3hXUE1sZ1J3UzBJdVdIeEU1WU1hM1lh?=
 =?utf-8?B?bWtDa2UwL1JtWUlWdWFib1NldnIxTzVTWnZWdi9vdmpvRTNxMHV4cXFsVVlt?=
 =?utf-8?B?Ymx6d1pqOHkwdlljeDlVZytUWTVwVmM5TDhxY2ZZbHZYcjZLTGE4aWNmRXNY?=
 =?utf-8?B?YUJlY05Jc1o1Q3gvdGFzT3FxTTZDRnNiR0tjcVFoUCt2Q3gxL1gzR1NackNy?=
 =?utf-8?B?NEtkNlBRelcvZUI4UWlGTVo0ZWZZeWVMbDlwN3cxbldpUVRiK3o0ajkxRWZK?=
 =?utf-8?B?dUJVYmJvUVBmMzk5SVk2MlV5QStyQzlmMlIzRlAreklhWXRHV3Z2MnhsdDRS?=
 =?utf-8?B?Uit4NmpPUGVRY1BYdEtyS00zUklobG81bzVENVZndUZmdS9McS9vbEFUcGg1?=
 =?utf-8?B?VzNqNHg4Q0owOUF0cHlqbytlNFBTdDhNeE1LaEVLcXV2TlVGcUlrbGhIeFdn?=
 =?utf-8?B?d3o1eFJKT0FEbEhGUTRjQlFwMlV1MVV4NDlibDdCM2p3dUNkNWRzUk9SMlNu?=
 =?utf-8?B?dG5HR2RHT3R0UjJCVHJjYjVLbXRLRkhEUlVnSWZtTGdwcDlLUDR4T3NybXVW?=
 =?utf-8?B?RTN0c0YzVjRLZVhrRmt5RUVRb08xblhoblJUTXZEa3hhWU1EVXZLTmRyY1B4?=
 =?utf-8?B?aFZyZUtYOXRVV0pjcVJERnYveW8wUWZIL0Z2NWtwWlhnTm5IMGhaanp0L0lW?=
 =?utf-8?B?S0I2RFVTUGs3aEkvMmdBV3pkUHJnaFpJRis2cXJpcW4yNWpuVG5VNjhzSkZD?=
 =?utf-8?B?MHBZUGNRWHhSK1l0WWZ1dHZreUJzbXdwdEdBWENFeHJhN3psOUJrc04wUTNJ?=
 =?utf-8?B?Nkh1VzYvNnhKWDlyOCswUkJWREM3TG9YLzlnZitMSjRHTzNZSE5Kais1M3dC?=
 =?utf-8?B?ZW8wakRCYzRkUk5tZGJncDA4TjlxYXVhTmJ3TTgwNzkyYndBZHRXYVRsNmRP?=
 =?utf-8?B?M0tnOEFLSWRQZkV5SnczbTlDUmtPbWs0Y09jbGF1RUsxSnE3aERSNXNSYWZN?=
 =?utf-8?B?bDBLSHBJK2g3VlVFMDUrUVFaSHBZZDFGNDFWM0lMbVp5N1NYMEs5YmZ0WXRY?=
 =?utf-8?Q?DRB8=3D?=
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4474.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebad349-b2c0-47b4-65b6-08dc7334f570
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 10:10:47.2476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: scFI2i0TmzoA9rYFbfKG+GT3FI+9Etvd+Xjessx6l3UhLBAyHCRE3i/PKuo+m6mB69bIJHgElsFOPb1PdttFQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR18MB6219
X-Proofpoint-ORIG-GUID: 46xreV2P9pxYnAgE1bdDjuJ9lLOa8BWi
X-Proofpoint-GUID: 46xreV2P9pxYnAgE1bdDjuJ9lLOa8BWi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_06,2024-05-10_02,2023-05-22_02
X-Mailman-Approved-At: Tue, 14 May 2024 13:18:49 +0000
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH net-next v7 5/7] net: stmmac: dwmac-socfpga:
 use pcs_init/pcs_exit
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> 
> Use the newly introduced pcs_init() and pcs_exit() operations to create and
> destroy the PCS instance at a more appropriate moment during the driver
> lifecycle, thereby avoiding publishing a network device to userspace that has
> not yet finished its PCS initialisation.
> 
> There are other similar issues with this driver which remain unaddressed, but
> these are out of scope for this patch.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> [rgantois: removed second parameters of new callbacks]
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 107 ++++++++++-------
> ----
>  1 file changed, 53 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> index 12b4a80ea3aa1..b3d45f9dfb556 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> @@ -379,6 +379,56 @@ static int socfpga_gen10_set_phy_mode(struct
> socfpga_dwmac *dwmac)
>  	return 0;
>  }
> 
> +static int socfpga_dwmac_pcs_init(struct stmmac_priv *priv) {
> +	struct socfpga_dwmac *dwmac = priv->plat->bsp_priv;
> +	struct regmap_config pcs_regmap_cfg = {
> +		.reg_bits = 16,
> +		.val_bits = 16,
> +		.reg_shift = REGMAP_UPSHIFT(1),
> +	};
> +	struct mdio_regmap_config mrc;
> +	struct regmap *pcs_regmap;
> +	struct phylink_pcs *pcs;
> +	struct mii_bus *pcs_bus;
> +
> +	if (!dwmac->tse_pcs_base)
> +		return 0;
> +
> +	pcs_regmap = devm_regmap_init_mmio(priv->device, dwmac-
> >tse_pcs_base,
> +					   &pcs_regmap_cfg);
> +	if (IS_ERR(pcs_regmap))
> +		return PTR_ERR(pcs_regmap);
> +
> +	memset(&mrc, 0, sizeof(mrc));
> +	mrc.regmap = pcs_regmap;
> +	mrc.parent = priv->device;
> +	mrc.valid_addr = 0x0;
> +	mrc.autoscan = false;
> +
> +	/* Can't use ndev->name here because it will not have been
> initialised,
> +	 * and in any case, the user can rename network interfaces at
> runtime.
> +	 */
> +	snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-pcs-mii",
> +		 dev_name(priv->device));
> +	pcs_bus = devm_mdio_regmap_register(priv->device, &mrc);
> +	if (IS_ERR(pcs_bus))
> +		return PTR_ERR(pcs_bus);
> +
> +	pcs = lynx_pcs_create_mdiodev(pcs_bus, 0);
> +	if (IS_ERR(pcs))
> +		return PTR_ERR(pcs);
> +
> +	priv->hw->phylink_pcs = pcs;
> +	return 0;
> +}
> +
> +static void socfpga_dwmac_pcs_exit(struct stmmac_priv *priv) {
> +	if (priv->hw->phylink_pcs)
> +		lynx_pcs_destroy(priv->hw->phylink_pcs);
> +}
> +
>  static int socfpga_dwmac_probe(struct platform_device *pdev)  {
>  	struct plat_stmmacenet_data *plat_dat; @@ -426,6 +476,8 @@ static
> int socfpga_dwmac_probe(struct platform_device *pdev)
>  	dwmac->ops = ops;
>  	plat_dat->bsp_priv = dwmac;
>  	plat_dat->fix_mac_speed = socfpga_dwmac_fix_mac_speed;
> +	plat_dat->pcs_init = socfpga_dwmac_pcs_init;
> +	plat_dat->pcs_exit = socfpga_dwmac_pcs_exit;
> 
>  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>  	if (ret)
> @@ -444,48 +496,6 @@ static int socfpga_dwmac_probe(struct
> platform_device *pdev)
>  	if (ret)
>  		goto err_dvr_remove;
> 
> -	/* Create a regmap for the PCS so that it can be used by the PCS
> driver,
> -	 * if we have such a PCS
> -	 */
> -	if (dwmac->tse_pcs_base) {
> -		struct regmap_config pcs_regmap_cfg;
> -		struct mdio_regmap_config mrc;
> -		struct regmap *pcs_regmap;
> -		struct mii_bus *pcs_bus;
> -
> -		memset(&pcs_regmap_cfg, 0, sizeof(pcs_regmap_cfg));
> -		memset(&mrc, 0, sizeof(mrc));
> -
> -		pcs_regmap_cfg.reg_bits = 16;
> -		pcs_regmap_cfg.val_bits = 16;
> -		pcs_regmap_cfg.reg_shift = REGMAP_UPSHIFT(1);
> -
> -		pcs_regmap = devm_regmap_init_mmio(&pdev->dev,
> dwmac->tse_pcs_base,
> -						   &pcs_regmap_cfg);
> -		if (IS_ERR(pcs_regmap)) {
> -			ret = PTR_ERR(pcs_regmap);
> -			goto err_dvr_remove;
> -		}
> -
> -		mrc.regmap = pcs_regmap;
> -		mrc.parent = &pdev->dev;
> -		mrc.valid_addr = 0x0;
> -		mrc.autoscan = false;
> -
> -		snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-pcs-mii", ndev-
> >name);
> -		pcs_bus = devm_mdio_regmap_register(&pdev->dev, &mrc);
> -		if (IS_ERR(pcs_bus)) {
> -			ret = PTR_ERR(pcs_bus);
> -			goto err_dvr_remove;
> -		}
> -
> -		stpriv->hw->phylink_pcs = lynx_pcs_create_mdiodev(pcs_bus,
> 0);
> -		if (IS_ERR(stpriv->hw->phylink_pcs)) {
> -			ret = PTR_ERR(stpriv->hw->phylink_pcs);
> -			goto err_dvr_remove;
> -		}
> -	}
> -
>  	return 0;
> 
>  err_dvr_remove:
> @@ -494,17 +504,6 @@ static int socfpga_dwmac_probe(struct
> platform_device *pdev)
>  	return ret;
>  }
> 
> -static void socfpga_dwmac_remove(struct platform_device *pdev) -{
> -	struct net_device *ndev = platform_get_drvdata(pdev);
> -	struct stmmac_priv *priv = netdev_priv(ndev);
> -	struct phylink_pcs *pcs = priv->hw->phylink_pcs;
> -
> -	stmmac_pltfr_remove(pdev);
> -
> -	lynx_pcs_destroy(pcs);
> -}
> -
>  #ifdef CONFIG_PM_SLEEP
>  static int socfpga_dwmac_resume(struct device *dev)  { @@ -576,7 +575,7
> @@ MODULE_DEVICE_TABLE(of, socfpga_dwmac_match);
> 
>  static struct platform_driver socfpga_dwmac_driver = {
>  	.probe  = socfpga_dwmac_probe,
> -	.remove_new = socfpga_dwmac_remove,
> +	.remove_new = stmmac_pltfr_remove,
>  	.driver = {
>  		.name           = "socfpga-dwmac",
>  		.pm		= &socfpga_dwmac_pm_ops,
> 
> --
> 2.44.0
> 
Reviewed-by: Hariprasad Kelam <hkelam@marvell.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
