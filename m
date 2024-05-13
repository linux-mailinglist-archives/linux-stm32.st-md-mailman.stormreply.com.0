Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB0E8C56D3
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2024 15:18:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02630C6DD6B;
	Tue, 14 May 2024 13:18:51 +0000 (UTC)
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com
 [67.231.156.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BEAFC5E2CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 10:20:48 +0000 (UTC)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44D8X8Dx002142;
 Mon, 13 May 2024 03:20:22 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
 by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3y286jbw1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 May 2024 03:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yhsh11Ci1qdIZ8/qh8mdBTDZMaLWRMFR62VTAujHlKWyNF+A4nZePOmBMgx7GQnC45U/rwcK/bhi26Frp9dKAWHJcMSiS+mpfy/PBMXWhwjjNce0YufB97o8EA0V/Rq7ddbWUhyeNUaWwwPHQrlNqjA+JJYTXUzoX4BhAa7e76+M1BI3nqUTRdfb55cACVVb2eMk8jqNGLlk3B7rHJ+9uJ2uSmeLyqjGXY+lz3KDbDACn/I7U3usHIG1/acbnMpsR6S2j71mxmq4FfUn8lXzWbwVV+zHP/it3O0U3RhI9sSFexfZ8LOYZJ2UBloqM/Y9MQPCuhnazR7Lz67P1tCybA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXJM4d/+KDmRIfmo4CpPcvvv3WD8E3qRoMo9w64XoX4=;
 b=OsLEsXxnAkV0OFFKyZmvoqtAepzAkAHXD2ez4S9CBccOUo23YbbPG6NB6biF1KE93YzxERGp87zg1pktOTteSkKh60pQGJYmYdt10EdrJmAicI7H+gdkLlIRHT89qcNp/RHVerI7xaCfD+oICBIrzXDDWcgzbQrcaQWDrw1qvfIqK2vQpoDvvUFZAhZC8k6fP+MHiyByvwbGLHwUrKG8FVqVKaSSNOVBQ5Xt1tfmxOFaCuIQJ0obg8OSRYoNfFRuvwjgtCqkR2/We86g+1uhM7iXKzqZNXZnnDQOsDssBoS8owd9fHaQpD67smK/Vea9Zh9CU9ytRPrh4uPkVfuS9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXJM4d/+KDmRIfmo4CpPcvvv3WD8E3qRoMo9w64XoX4=;
 b=YGNFNn2jKwqyM/unObsshiU/q5AAehAidIvWKuGSaQslmFzKY7ANMBIuK6w2CmRfoAjjmJMEzcnEeTtVnXAF2EkTHmOMfbNQ9V3PQK0mzF675h4VmkwXkJoAWmpGLX8eMB1+TuxfPZFTEh72pB1oN80sgnz0ggc2HL4mgulNmoU=
Received: from PH0PR18MB4474.namprd18.prod.outlook.com (2603:10b6:510:ea::22)
 by MW5PR18MB5043.namprd18.prod.outlook.com (2603:10b6:303:1ce::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 10:20:18 +0000
Received: from PH0PR18MB4474.namprd18.prod.outlook.com
 ([fe80::eeed:4f:2561:f916]) by PH0PR18MB4474.namprd18.prod.outlook.com
 ([fe80::eeed:4f:2561:f916%5]) with mapi id 15.20.7452.049; Mon, 13 May 2024
 10:20:18 +0000
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
Thread-Topic: [PATCH net-next v7 3/7] net: stmmac: Make stmmac_xpcs_setup()
 generic to all PCS devices
Thread-Index: AQHapR8nerFgDK3YUk2EeNwqJJ0oyg==
Date: Mon, 13 May 2024 10:20:17 +0000
Message-ID: <PH0PR18MB4474E1287863A4E773861505DEE22@PH0PR18MB4474.namprd18.prod.outlook.com>
References: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
 <20240513-rzn1-gmac1-v7-3-6acf58b5440d@bootlin.com>
In-Reply-To: <20240513-rzn1-gmac1-v7-3-6acf58b5440d@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR18MB4474:EE_|MW5PR18MB5043:EE_
x-ms-office365-filtering-correlation-id: 5b322dfd-cfd7-497e-3c5a-08dc7336499a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|366007|376005|7416005|921011|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?bHRPRi9XcHNMMkhQQXdiNTJrYzRrdXBRRXVHbEhtcFVwQnVJUG1XYzhRWDFN?=
 =?utf-8?B?NlNTS0swMEllWWt3S1VTRUhHSHJFUHM5dTczRVJyeFRGMUhaTjd4T3lhK0k0?=
 =?utf-8?B?bThoRHJNcU5pdDVqR1dSbUhaOGViVm5NM2J0NFA3ZVN1OXg1dHdWVmxXS1JG?=
 =?utf-8?B?WG9CbnhtZkxzd1R0bklMZTFqcEpYRldHb2JzZlpKRWRxaThSQmJ1Qi9rZzVO?=
 =?utf-8?B?SGhBMHUybEt5eHMxSFIvSU5XbjJETTdSTERIa25CVnhwOHNaeGdWTmlwNmlp?=
 =?utf-8?B?WGtFU1RBbzNSTWxsSFVWZnIyZUlrcm94MUNvS3o3MzlBeG0vR1l5SWl4Y1g0?=
 =?utf-8?B?OHowWHNvemNWWjlIWmkxVldyd1cyQ0hnU0ZmaEFrTkRBREhaK3JCYlBIR1RZ?=
 =?utf-8?B?UnNFOWgvM3lWdmxhUFYwbldFazVnb21jZk1ZUDcrbUhQNHFsWjloVmwrVUdx?=
 =?utf-8?B?L2JScVI0aGpEUGtPSW9HYUlaSkNPYXptL2dFWGdiV2xsN0gzWGtNZXJocjVL?=
 =?utf-8?B?NEFyeEVjZTJDY0N5YTM1ZVJTb216dVhpeWFVT09JSzluOTZsQTFreGRTRDB5?=
 =?utf-8?B?VDRxczY0T0hwSDdiYTdST3BZaXQ4OXJVcHpFV1RYTUhBMkdkTVY5cGp6OFRL?=
 =?utf-8?B?cTI4R0JFZEIrcUlYczRMQTZqYXNWLzAvMXpuM2xwb3JBUEJUaC9SSmVDQ0lV?=
 =?utf-8?B?Z0N0ZjhGWnFsdHhHcmhROGtob0dxR3pqRzgyWEVUM3Y4OUEycVJsQWFvellV?=
 =?utf-8?B?bUNVZ28wWkpiY1A1VjhGU0R0aVA4V3dvYjRYVzNnN0drSENNWWhFWmN4RktB?=
 =?utf-8?B?UFkvNHBiL0Q1R29JSEcwVWxXaVRLVVR4V2xGT29XSXhsV3dreWUxTXpCeEhh?=
 =?utf-8?B?OGRSRjVWS2FSM1BKN1RSanFLYlZoZGFMUmJhaGtsSGc0cXBkaTVJNjZ3WVhC?=
 =?utf-8?B?R1VFRTFCRjJBZzc4c0tHV2NVRG1MK0poMm1YOWRncDRGTDVOMFBIZWlXUXRi?=
 =?utf-8?B?azFZMHc2NUNFazFiZng5TU9hNnFEd0E2c05lSlBSWlg3SVBVdThZdXpvcng1?=
 =?utf-8?B?VFVGbVNKU0JmV0NmcUcvUmFIaVZUY1ZQOUlPc0lpdnlPY2k3bHhyQkNjK0pD?=
 =?utf-8?B?TGs4SFZiNFBqMDVVWHhtWXFJQ0FSWm5hSmlRMVorSklPd2ZPVEJ6UGJDa0M1?=
 =?utf-8?B?cXo3cnRBOFhzK2VUaHJIWFNMd2U4SU14d3RiaFUyNktiRCtRT3VWWFpidDJS?=
 =?utf-8?B?MCtwcmUzK1ZUcDZIT25LZlVPRHRWUzNGWS9RSFVEMVVqNGVhZ3lmM3l3VHNT?=
 =?utf-8?B?VVlFak9YdDlmeUFBVHB1NHJDL3gzZUt5RFNiVnV4Q0VZQkpCVXR5cG9lUGtz?=
 =?utf-8?B?ZmRpY0h5WDJTaXNjdHlkK2xpUld1bzJ5TnhGZFdTY3Yzc3FodC9VYlRweXhu?=
 =?utf-8?B?ajl0ejFZL1lJZktEc1hRWXhaa21sZ0tZMWsxVnc2TDBKZ0FuMVhhVm94Ynps?=
 =?utf-8?B?dVk5Vk5zVnViTDRUVVpDS25ac1J5RGRrVERtSVRJSkVJdmlZSzlrSjB6Z254?=
 =?utf-8?B?c3J2WkJ2SnQ0MWdTS3ovUUg4amQ0THFMczdGdGxuajRmSGR5YmZaUTFtM2Uv?=
 =?utf-8?B?cWpjdUU3eXpDZUZWR3RUYmRmWlVkRUt2WkhLWVF2eFJiRlJMYld0eXk2OUpE?=
 =?utf-8?B?YU0vSTd0amlIdHo3WFZETnd5K3Z4Y1JGaVlzV083ZWZUUWRkNXdGSFp3YXRJ?=
 =?utf-8?B?N05rOVBMaThpTTBhb291YmlEckJycTJjTUhjd2U3aFZkUkpUd3MzV3EzaUdZ?=
 =?utf-8?Q?8M+GAOYxn0pXBAvZvYz8l7uPKA1rM3K/mS1hg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR18MB4474.namprd18.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(7416005)(921011)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1A0REp3REVIRzAxcHNyaUdUejY5aThiTEpGaTBJMCtOK3g3YkR4SWUxTCtF?=
 =?utf-8?B?WVhmT0J0ek9LTTVva3RXUm5od0tHaXFxU2dYMmQ0VndCR2JYeml4Z2ZCOGRl?=
 =?utf-8?B?R3BnbTNvWEJoY1Z6R1N3R2svR3daRy9kQXZCcEhiVC9XaXpGTm1NMnJGdkkw?=
 =?utf-8?B?eFUvdkRIbXM2ZThBZnIwMWtMYndvQ3RDdTNuWHVCcEY2WVRIbHQ5RlpjbEVQ?=
 =?utf-8?B?N0IvR2dxeDhlUC9vbWtZQUxYU1ZCZ2Foc1hueDhHR2h5ay95bHZoTkJJeUFs?=
 =?utf-8?B?UmYwcWZFcEo2U2ExSW5XaFhldmduU0JtcHcrKzhCVmdmbmNvQlVwd2kwN2VQ?=
 =?utf-8?B?QzFmRy9SbGlhODIyZU9BcEhaS1laTnRnakJHYkFOYjlxb1NCV2hkVExWK0lG?=
 =?utf-8?B?TVk4NUJOSzlMTDBYTmdKVzVTSDBJY2tWaXlOaXFtNVM2b0xaRXVzU0xMSWgy?=
 =?utf-8?B?QVpJb05rWkxKUnNSRW9CbTZMbzNjWS9UdUU2UDZwT0lDVnVyeDN2S2RKUldI?=
 =?utf-8?B?WXpJWm5JbUpqeHVock1wQWpxTlpxMjA4MXlYeTVJWHRuZjBITkp1VXFTaVFN?=
 =?utf-8?B?Y2d6a24raTA0ajZEcHpmTmF6UHpkbHFjekRSaDRpSW1SZFpJQ2JoQXBab3JU?=
 =?utf-8?B?UzhKSG41TTR6SjhDeXlmVHpINm94dndXNUg5QitEa0lwRjMzdGxCQWJvckQz?=
 =?utf-8?B?R3ptU3o4R3UwTmVGMkljM1h2Zzg1OWwvWEFEUnFwUER4WVZ4RkhyQlNkeUlO?=
 =?utf-8?B?Zzl4OVRablJML1lSL0FVV0l1NXFNc3p6QVk4ZEp0MWhjbnM1UG1UQk5nUEFN?=
 =?utf-8?B?YUpLR3I2WUd3ZzFwM1BHNUc1c2R0K3dBRFNERjNMN2NERGpkS1BVeFg1YWNG?=
 =?utf-8?B?aXVXQnI0cERBOXY3ajI0alh4NGdDVG81aERVS0VrODN2cW03amxMOEVoaDQy?=
 =?utf-8?B?bC9pREhDTjhwTDdIRUgyeGdyOVc2em5Odk5UTGt3SnhXZ3k2ZWpINzZHUkZw?=
 =?utf-8?B?dEpvVTV6c0xLQ09UeVp5d09kUkJnWWhyVk8xd1hPNXFnL3lrZktQU2dkZmNz?=
 =?utf-8?B?OHAyeGJ4L2syQ0ViR0F6aDBRRTUwTHgza29Kd0E4NGlBMnJYTytLZmdiazhG?=
 =?utf-8?B?SzdXVWloMC85U3ZFM1pUam9NcTBHanBwdnJqUG5XTG9Zamt6SENBVWF3T0pZ?=
 =?utf-8?B?UC9VcXlNajN3cSs5a2x5Qkh6SWdQS0UrSUo1MG9waWpTRzlyQjB3NGQzVW5j?=
 =?utf-8?B?VjVDT1hTclJzYk81My9OekRPK2RyRkp3aVluSHhEd0V1cjhQa3laM2M5WTdC?=
 =?utf-8?B?SURBL1BGNjc1cWp5Vzg4dGE5MmNWbkFuQWVWMTI5N21wZkxQc0JRbk45Ums4?=
 =?utf-8?B?Q1ZZWVFxMHRORzE1M0tZMngvRE44VjZNNWZmZVNNT0R3QXowRGoreXVYaVNE?=
 =?utf-8?B?OFpZTjRZZlAwMXVZZ2xuMk1iYWdNa0sxbm5HU0ZiZzJZS2t1THhKK09xeHZt?=
 =?utf-8?B?MG0zdUhxNmpBWUNjYXZUbjBvZEVKTXdKVmdQUW5UZlRIdTcvRlFLWUlMR2ww?=
 =?utf-8?B?SVJselBIVFR2U01IaHVQb201MTBENUxBVnc2K25QNjN6ZmlVMkNYMlE3MnVo?=
 =?utf-8?B?aDh2UnhNaGFmWHhSbGxsOWprSysvUjFpeGJ5WHlPSDQ1ejAyR0pua0dlVWx4?=
 =?utf-8?B?YzJnQnZybU1sQ25XOHkvRG9rWEoyZW5VQ0g3WFNzZU92TVZZTFdGdnFOQnBZ?=
 =?utf-8?B?dmp2bkcyd2M4QnFxZmNWbjhSMFhmMUgycnZTeG50NmUyUVR6bjBZb1VVUC9O?=
 =?utf-8?B?QlYvVjJWMnlGY1hRZnk0NXBVRFJ3ZGhxUUkyWWFibDJNekEvK2pvUnpvd2Jk?=
 =?utf-8?B?S3hqcEtYMUovZ2JQUkY3dUZxUlY4RENhMGZ6ZVYrWWg4dlJWS0ZCdWhoWlVR?=
 =?utf-8?B?dE5jVnhCOFJYQThOU0JMb3Y1WTdkT3lKUDNKOXZLSkYwdkduc2NCMnhXaTdD?=
 =?utf-8?B?SkRGNVFRTDh5MDlEeWswREoyYnBHK1VKMDAwbzNxNW5kSXdpbkQrYlYvbGdp?=
 =?utf-8?B?U1M1dkRtMW1jUWF2Y0FCNW45WU02KzV0em9EUDFYL2hWajhBQ2JpZTNuNHRW?=
 =?utf-8?Q?Jj/I=3D?=
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4474.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b322dfd-cfd7-497e-3c5a-08dc7336499a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 10:20:17.9748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CVykzIBP8KVA5Dq2I1OSKNKoIlvEUJ2rMSmA0kUuyYcE21D71C+fxzWyqGWUpvBkd/g352b/LrePd4h2kztCXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR18MB5043
X-Proofpoint-GUID: GNfRBGAAMHltgBYHFpPAXCzM364-C8ba
X-Proofpoint-ORIG-GUID: GNfRBGAAMHltgBYHFpPAXCzM364-C8ba
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
Subject: [Linux-stm32] [PATCH net-next v7 3/7] net: stmmac: Make
 stmmac_xpcs_setup() generic to all PCS devices
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



> From: Serge Semin <fancer.lancer@gmail.com>
> 
> A pcs_init() callback will be introduced to stmmac in a future patch. This new
> function will be called during the hardware initialization phase.
> Instead of separately initializing XPCS and PCS components, let's group all
> PCS-related hardware initialization logic in the current
> stmmac_xpcs_setup() function.
> 
> Rename stmmac_xpcs_setup() to stmmac_pcs_setup() and move the
> conditional call to stmmac_xpcs_setup() inside the function itself.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> Co-developed-by: Romain Gantois <romain.gantois@bootlin.com>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++-----
> drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 30 ++++++++++++++-
> --------
>  3 files changed, 23 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index badfe686a5702..ed38099ca7406 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -360,7 +360,7 @@ enum stmmac_state {
>  int stmmac_mdio_unregister(struct net_device *ndev);  int
> stmmac_mdio_register(struct net_device *ndev);  int
> stmmac_mdio_reset(struct mii_bus *mii); -int stmmac_xpcs_setup(struct
> mii_bus *mii);
> +int stmmac_pcs_setup(struct net_device *ndev);
>  void stmmac_pcs_clean(struct net_device *ndev);  void
> stmmac_set_ethtool_ops(struct net_device *netdev);
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 0ac99c132733d..ef285b3c56ab9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7754,11 +7754,9 @@ int stmmac_dvr_probe(struct device *device,
>  	if (priv->plat->speed_mode_2500)
>  		priv->plat->speed_mode_2500(ndev, priv->plat->bsp_priv);
> 
> -	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data-
> >has_xpcs) {
> -		ret = stmmac_xpcs_setup(priv->mii);
> -		if (ret)
> -			goto error_xpcs_setup;
> -	}
> +	ret = stmmac_pcs_setup(ndev);
> +	if (ret)
> +		goto error_pcs_setup;
> 
>  	ret = stmmac_phy_setup(priv);
>  	if (ret) {
> @@ -7791,7 +7789,7 @@ int stmmac_dvr_probe(struct device *device,
>  	phylink_destroy(priv->phylink);
>  error_phy_setup:
>  	stmmac_pcs_clean(ndev);
> -error_xpcs_setup:
> +error_pcs_setup:
>  	if (priv->hw->pcs != STMMAC_PCS_TBI &&
>  	    priv->hw->pcs != STMMAC_PCS_RTBI)
>  		stmmac_mdio_unregister(ndev);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index 73ba9901a4439..54708440e27b8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -495,31 +495,37 @@ int stmmac_mdio_reset(struct mii_bus *bus)
>  	return 0;
>  }
> 
> -int stmmac_xpcs_setup(struct mii_bus *bus)
> +int stmmac_pcs_setup(struct net_device *ndev)
>  {
> -	struct net_device *ndev = bus->priv;
> +	struct dw_xpcs *xpcs = NULL;
>  	struct stmmac_priv *priv;
> -	struct dw_xpcs *xpcs;
> +	int ret = -ENODEV;
>  	int mode, addr;
> 
>  	priv = netdev_priv(ndev);
>  	mode = priv->plat->phy_interface;
> 
> -	/* Try to probe the XPCS by scanning all addresses. */
> -	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
> -		xpcs = xpcs_create_mdiodev(bus, addr, mode);
> -		if (IS_ERR(xpcs))
> -			continue;
> +	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data-
> >has_xpcs) {
> +		/* Try to probe the XPCS by scanning all addresses */
> +		for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
> +			xpcs = xpcs_create_mdiodev(priv->mii, addr, mode);
> +			if (IS_ERR(xpcs))
> +				continue;
> 
> -		priv->hw->xpcs = xpcs;
> -		break;
> +			ret = 0;
> +			break;
> +		}
> +	} else {
> +		return 0;
>  	}
> 
> -	if (!priv->hw->xpcs) {
> +	if (ret) {
>  		dev_warn(priv->device, "No xPCS found\n");
> -		return -ENODEV;
> +		return ret;
>  	}
> 
> +	priv->hw->xpcs = xpcs;
> +
>  	return 0;
>  }
> 
> 
> --
> 2.44.0
> 
Reviewed-by: Hariprasad Kelam <hkelam@marvell.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
