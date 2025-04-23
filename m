Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1587DA98E2B
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Apr 2025 16:53:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC161C71287;
	Wed, 23 Apr 2025 14:53:25 +0000 (UTC)
Received: from HK3PR03CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11021132.outbound.protection.outlook.com [52.101.129.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2AAAAC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 08:50:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPRjA7Ns3v+9OOmfWnXfohS94j4t/+8tTZKKsWpeZgcXwuzwK6j4daQa7xd4wGIbO5Ejae4cBP0T+ZGRXRitL8eyEj8xXL/6IkdGlPfWj+nrxjgH9wltjEsvTAtrxV2ASOgHHH4vBc2qhDakEc4mNfCnYkmWzdgeR2vXgxtIs1kMdp/Q0JdDCtlK7uXcg0j9kflixJTBBU24L3sUtO/yhrwgcafjuWHKkFNyG7GNa7s00BUAgsnvp5fQ0gMogJWgXSYELkVWp+jDb+7HNR3GW7pZEuMmRaGgSIOGqtmpqNSNtopR/l0FBg94PG8Gmt9N7iG4DXNJqF7TlwbA4J54Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0T1ldEsd8tcLjSBoVBE6pfs1p/NrAijx/0HDqAADhQ=;
 b=SEsPNRharstTlZVcTEiLCoOZaL0eZpm7pZC2H9T1PuvTKwHO6rjhUD410GEzY0jprkgJhzoWm0mtreWyDW61E43h7B32dhXZSNakaGkvWDszPCOwixUSVuUi3f9kXry1jHcT5/ZNeoPGVVN+dFAvX+Ovxnav0pLtkKzE+N99LZXLEP5jLyFLuDAJQryR9D35hrmWO5misbsRu78dIp9v7kNo5nJEPWUjDMJGiztSfjC1uWAugDFQCvtATfUXXA0c+ddvFjdlA+KJhylwjF5nax6VMHGglUVwYGS07cUqPij0HMzZ9LMtvG0+DHGSbmDScNGin5waNDGvTkzTxPqRjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB4715.apcprd06.prod.outlook.com (2603:1096:301:b6::9)
 by PS1PPF5540628D6.apcprd06.prod.outlook.com (2603:1096:308::24e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Wed, 23 Apr
 2025 08:50:10 +0000
Received: from PUZPR06MB4715.apcprd06.prod.outlook.com
 ([fe80::e2a0:7ecd:8694:bf1a]) by PUZPR06MB4715.apcprd06.prod.outlook.com
 ([fe80::e2a0:7ecd:8694:bf1a%6]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 08:50:09 +0000
From: Hans Zhang <Hans.Zhang@cixtech.com>
To: Christian Bruel <christian.bruel@foss.st.com>, "lpieralisi@kernel.org"
 <lpieralisi@kernel.org>, "kw@linux.com" <kw@linux.com>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
 <bhelgaas@google.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, "alexandre.torgue@foss.st.com"
 <alexandre.torgue@foss.st.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "thippeswamy.havalige@amd.com"
 <thippeswamy.havalige@amd.com>, "shradha.t@samsung.com"
 <shradha.t@samsung.com>, "quic_schintav@quicinc.com"
 <quic_schintav@quicinc.com>, "cassel@kernel.org" <cassel@kernel.org>,
 "johan+linaro@kernel.org" <johan+linaro@kernel.org>
Thread-Topic: [PATCH v8 0/9] Add STM32MP25 PCIe drivers
Thread-Index: AQHbtChhrch5nTp+iU+X7sglcKEOxrOw8FVw
Date: Wed, 23 Apr 2025 08:50:09 +0000
Message-ID: <PUZPR06MB4715A6E6E2452BEA648B99D29DBA2@PUZPR06MB4715.apcprd06.prod.outlook.com>
References: <20250423081051.3907930-1-christian.bruel@foss.st.com>
In-Reply-To: <20250423081051.3907930-1-christian.bruel@foss.st.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB4715:EE_|PS1PPF5540628D6:EE_
x-ms-office365-filtering-correlation-id: 0c8ca781-af0f-4731-d207-08dd8243da7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|7053199007|921020|38070700018; 
x-microsoft-antispam-message-info: =?gb2312?B?RVoxQ09kYmgwdXV0eDBtZUhTNmUvMUM3cGY2c3MwU2wvZTdpeTExTTludFFr?=
 =?gb2312?B?elZtbWxDa2F4b2FNTUV3V1F2MzYyVWUzZ1R6bzVwSTF5aVFYeGMxU3FqUGZM?=
 =?gb2312?B?dC9wZXUremQrYmRLZTE0QUpqN25qNmkrQlpGVkR4clYxV3ZISkRwNGdxWDZR?=
 =?gb2312?B?TGd3aFl4YTVOc3E2bHoreks3eStyREJvVHI4U1dDTzQrTlZMVzRCY3gwQytj?=
 =?gb2312?B?WCs5SHZVTUgzQ0VNQ3AyOTdOeDZTcVd3a3M4S1hyRUNaMitUdUFqenY0Wm5x?=
 =?gb2312?B?SS9ZUWE0Qi9qMURzTHNNc0t0NWxOLzMrL2lXWXVuNXVzYXhKdXhBbFIyVllO?=
 =?gb2312?B?cGUwTllHUHp5Wk8rNWtGUGQ4RFNLWXYxRUlKTHRtdENSRlZRdXduVFNuM3k5?=
 =?gb2312?B?Ym5nb1BlbDVYbEZsSVhMODhyUFdDNVZ3KzB3S3ZVOGRCV0ZLTDhSSjdEUnhW?=
 =?gb2312?B?b3d4UytxMlNmdFRDQmdleWFNaHF6UWdodWJGWUZycUdtVmxyeUFhQXJVckdr?=
 =?gb2312?B?Mmpia3NQRGNwejdlNDNkOU5CTnk4RmhBenNNeUdPSGxOYVRweFlMazdyWGRy?=
 =?gb2312?B?VmxIR3UreFBiR0tBSTV4RXJMeksrSkY1MXhwdmJqbVZySUQ5QVMyN3Y4T01v?=
 =?gb2312?B?bXF2eGxGc3p2b0p6a25qclZUMGRJb0djUDJUT1lyWEt1RGdQWHgwZ080ZTJO?=
 =?gb2312?B?OC9pcFl0V0FvY294THdjeW9sQXk2Mlh2SnFXaTdrQS9xNGNqK1lpV2hDOEFa?=
 =?gb2312?B?ak5iV3VZNkUwcndtZWdtVnh6WGJFdHRId1FrUHJESUVXWm9iUU9vZEx6QnpW?=
 =?gb2312?B?ZVlkSFNJc1JkWmNSS21sR3pLa1ZCekZFbGQ3UFVBcWdwYkVuT0Z2d29NSG1C?=
 =?gb2312?B?cktxcmJlbjZQb01xRmcxUFh5N0grRHFURXBGb2xmRCtCVGF4UHlRNUJLdVRZ?=
 =?gb2312?B?SGJuTnRpN0NzanY2QWlFeitRTTFGTW0yYWtVM214YnB5Vy9QbDFSYzE5dy9I?=
 =?gb2312?B?aEU5d0Jac3gyYVU1RHd4NFBZOEh1a2xtU25veHZmUEowTitHMklYZXEvSkgv?=
 =?gb2312?B?YWJGN25haFk1QnRLWERNdDJvY2l3dXpiN0lBY1VneGFINmxXb1Uya1dkdFdH?=
 =?gb2312?B?OU9mcFVoL1BkTloyeUpCY0FUdmozSFlYQXVVSUFSUUlWa3NFVWM0TEZqY2Vy?=
 =?gb2312?B?Vm1NL1BhblVUVXloRFFKaEZMRUlYcnhHVFdsTGVCaE03ampOMXFuUnI1eDM5?=
 =?gb2312?B?dURWSno5cEt4d0pZRnUwcHV0cXk5NlB6cmxoRXowUHVKRkVpTWJ1QXV5bHJU?=
 =?gb2312?B?VFlhdk0xa2lLRitlTFY5T04zMEhNNHZoRkp4Z0NxSytuNUNNUDhPc29FZE5z?=
 =?gb2312?B?UkNTWHY4MFhCUk1NU3M0bUhHbVlPVE9sVTRobU5reU91bEFuUXJtOEZ1YmJw?=
 =?gb2312?B?SjZYOHU5TVRhRXgrV3dVMHlMMkgyN1N4Rk1mQXVtcXlGNlFEbGVnMm5Ba3I1?=
 =?gb2312?B?dW50bkVGL2FYM2VjUEhQb0dwWHdKaHZMeGI0V1I5T3F5MkVJV0hHanpZRk1p?=
 =?gb2312?B?dEYrMGVjdEpBSTBDb2QxTmdtY0ltK01pQktqazBnVUFlR3dxMndZVjZjNnd6?=
 =?gb2312?B?R09LZ0JwQklDcVovZmphQU9VQ09nYnp3cnh5QVFxL3gzMUdqT0RadEprYlQw?=
 =?gb2312?B?YzhDNGk4SVRTcUxSRC9wdVBvVlE4WStLSG0yZUhlZzFrZ2RMRUVuY3lQM0tB?=
 =?gb2312?B?OFVmVG11Y1FFWjNseU9YaE5aZSt6d0tWdlBraDVobzBRZ3MvYWRiOE9kb1ly?=
 =?gb2312?B?NkIybjNOUmZiT2l3ZGZ1R2NiVm85andWWFhkZENmc0pnRHExS3J1NnVzOEtB?=
 =?gb2312?B?V0pnWWo5SUdOckpLenE2b29oSXUydjRwN0Jtbk1VYm9QQzBYREdOSmpubSth?=
 =?gb2312?B?Z0lscS9id2svU3VjMjFwb0o0Mzg4RCtscFpJTnhvS0x6MnlqT3oxOHZ2NExS?=
 =?gb2312?B?bURnN0gwN0hmSG8yVkVaNmF4Vkx4UWVqNmZWbEc1L1ZMeTZ4bjNnMzF4UnVT?=
 =?gb2312?Q?AzprIh?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:PUZPR06MB4715.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(7053199007)(921020)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?VjNTL1VXVWYvVWV3THpFSlM2RjJtdVNIQnh3RzNjclN6ZHlRQ085VDRLeUZp?=
 =?gb2312?B?V3VJL09XaXVhZWdiKzBCVFlqbUhKYUZYNHhMM1ZHdGc0Um9NOWJVZG9sWmlY?=
 =?gb2312?B?RDhkVTNyL0Q4Ylh2Z0o2ZjFrT3pHZTkxLy9Yb0dYRm0rUHFRcUNoVi9JY1p5?=
 =?gb2312?B?NDRaSXlvR1ExTnM0ZkNmK0JKY3BDVVNRck5Rdi9oVkhZVVYvdy9RaDRHVDBh?=
 =?gb2312?B?YUFCcWFFMkp3a1NqWlF2NmtzRkQ1VWgyOFNOb2t0ckFnSXJTdU9TVGw3WnZ5?=
 =?gb2312?B?TU9ualdFMWlxQU4rMm9KT2czbURHcEV5NC84WWhWZGZIMml3Wkh2M1NSRmVo?=
 =?gb2312?B?OWVZRFMzTnNhNjdPYWpSaHZlek5oRUNHejZCS1F6U05Xb3ZEZGpPRWx4LzVp?=
 =?gb2312?B?VGVnbHVVY2VxMzJhdU56WGNZZTBEbmJ2dmd0N0gzYlE5Qk44NzhCKzFKbDFs?=
 =?gb2312?B?M3VOaXV3YmdJZGljNTF3WWdkMDR2VDA0aEtScFh1ZmxScXN4amg4b3FUenVW?=
 =?gb2312?B?MDRGUWpNNGZrTDZYMUx3OHo1WHVPRGRETlczV0VKWlB4UTNlTUJZRE8vUG5N?=
 =?gb2312?B?M3lsVVZEL0djdVM2djlSSHpUVmZIQ1JWK1Y3ZHhuM0NtemRsTFNWYW9ia1ha?=
 =?gb2312?B?NVczYjFwMlNpTUdKcVFhNGozSU9hM1o4RS8xUU5VYmRpNXI2M3RJdmJnRGFH?=
 =?gb2312?B?QnZqK3Nsai9teFMzbEN2RnVVeW9SblZJV2pITUthc1J3ZWpGdjB4RXdiMElJ?=
 =?gb2312?B?WFpKMG4zbzRLd0pjN3hZa2FJQURjd3MvaDcxaXZnVExURUFhWWRNYzZibEhE?=
 =?gb2312?B?cTRTckx5enhON0daOUZvN2ttclpDWWtaQmVGeUdCeEZzQnIxaUNSUkVrbmpm?=
 =?gb2312?B?eDNQU2ZWRW4rSUh2ZHBhdEluME44eTlIbVhLb2xTclJPdC9BUW8xYWs5NVFN?=
 =?gb2312?B?WFFNQ3RkQ1hIcEo0cFRsMWo5endZODBlOGdpRlg4Q2ZHV09mU0Q4VCt3VkNY?=
 =?gb2312?B?TTZrUXVVUGpzVUZwL1dCcFNhazZ2SGdrMnp0NUZKZisxV2FMTXJFRk1IOUxC?=
 =?gb2312?B?cnlSdzRNRlZqUnVaWTd0YmV6eUthMStEUWI3ck81ZFhNbnUzaHAzWnl1Qmsx?=
 =?gb2312?B?T2VLUnB2RjNxLzkwTWRpSGtJNVhoT1laOUNlMUd5SVlIYk5YbmF0OUt0OUhK?=
 =?gb2312?B?QWZHdGtmcHh6MVF6NUxUS2c4OHFoTmcreTFERTFBMGF6SmtMNm5Td2tqb1BZ?=
 =?gb2312?B?bVVpSzZHbGxnY1JjNGZzTnhMRVl3QTQ2YXhZWGorcnBIWkcveUF1WUJ3UG8v?=
 =?gb2312?B?K1NYbnNXTFVoejNrbk5pemM0UE1sTC9rRFg5NHlTdG83dmVWbGw1RVU2dWZL?=
 =?gb2312?B?S3E3NFEzUzI4RUhHSGpGVk1YNUg2M2RiSWhGM2RDcStIYXU2Y3hERFNDaS9w?=
 =?gb2312?B?ZTVmc1Y2VUJDc1N6NVVKakZoTE1oZjZHcmI0ZlF1M2RVc25IelE5c0Q2c1dP?=
 =?gb2312?B?RXV3VEFQQmpqeVg3bnJsMVRjTC9XejJvRjkyYW1tckFxTjB2SE9OV3BZT1Bj?=
 =?gb2312?B?ZC9iMFdiVkNQRHBDU3JscEIrbzhFRDZYOHB2RXFsakVxbnpmOW5nSHFLVmZn?=
 =?gb2312?B?RlU2WnJkZUZ2NzNEaCtGL3BjSnZEQlM3YVlpRDRjT0RlUzU1a1NoMzFSekgw?=
 =?gb2312?B?dms4SlVtRUo1RXZseGlCN0pkNE9uMWtpajNhblNGNmMxR2VuRzNTTTdoZC9C?=
 =?gb2312?B?OGl2RWtXa1FLZEJhbXIyMGQwZTdLUHJDNjBrdXFyTDF5d1htM0xiZG9icG00?=
 =?gb2312?B?dkJJKyt5TDlEMWZNVXdjU09KclIrblBoeGtiQzJDUWxLUEVzREpwaytwRmUy?=
 =?gb2312?B?KzFsOGYvb2VZZVIzOWZXWG5XTmp5Mmc3OXpXaDZNOXlueUE0UVM5Q1JxY2xs?=
 =?gb2312?B?VFJ2RnF6cENJcnZWTTRrVElUQ2laUWsvQjhCaWxTSjhjSUFlZ0p6anZYZk9v?=
 =?gb2312?B?RTZtMGVqditIOUxsaXh2ZDN6dDN5akFoNm9zeWNpOEM0WHJoNXdTUWNFT2ZV?=
 =?gb2312?B?QzBkWjRpTkV1KzJkRVpQdjZpWWJnM1ozbUV6Y2FXV1FSZDJyVHltV21QSGRv?=
 =?gb2312?Q?oor8BCBWU8l3yBKM7DL+Q+c21?=
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB4715.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8ca781-af0f-4731-d207-08dd8243da7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 08:50:09.6206 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GGiamYnNBKZyp5pLAunNdMWbofrOqS3oGzhyV+UKpfD1nFimkzrq72r2CBJkrcpYzSqf0iI7OtnGpLpEwM873Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF5540628D6
X-Mailman-Approved-At: Wed, 23 Apr 2025 14:53:24 +0000
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [Linux-stm32] =?gb2312?b?u9i4tDogW1BBVENIIHY4IDAvOV0gQWRkIFNUTTMy?=
 =?gb2312?b?TVAyNSBQQ0llIGRyaXZlcnM=?=
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

DQoNCi0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBDaHJpc3RpYW4gQnJ1ZWwgPGNocmlzdGlh
bi5icnVlbEBmb3NzLnN0LmNvbT4NCreiy83KsbzkOiAyMDI1xOo01MIyM8jVIDE2OjExDQrK1bz+
yMs6IGNocmlzdGlhbi5icnVlbEBmb3NzLnN0LmNvbTsgbHBpZXJhbGlzaUBrZXJuZWwub3JnOyBr
d0BsaW51eC5jb207IG1hbml2YW5uYW4uc2FkaGFzaXZhbUBsaW5hcm8ub3JnOyByb2JoQGtlcm5l
bC5vcmc7IGJoZWxnYWFzQGdvb2dsZS5jb207IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRA
a2VybmVsLm9yZzsgbWNvcXVlbGluLnN0bTMyQGdtYWlsLmNvbTsgYWxleGFuZHJlLnRvcmd1ZUBm
b3NzLnN0LmNvbTsgcC56YWJlbEBwZW5ndXRyb25peC5kZTsgdGhpcHBlc3dhbXkuaGF2YWxpZ2VA
YW1kLmNvbTsgc2hyYWRoYS50QHNhbXN1bmcuY29tOyBxdWljX3NjaGludGF2QHF1aWNpbmMuY29t
OyBjYXNzZWxAa2VybmVsLm9yZzsgam9oYW4rbGluYXJvQGtlcm5lbC5vcmcNCrOty806IGxpbnV4
LXBjaUB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tOyBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCtb3zOI6IFtQQVRD
SCB2OCAwLzldIEFkZCBTVE0zMk1QMjUgUENJZSBkcml2ZXJzDQoNCkVYVEVSTkFMIEVNQUlMDQoN
CnRoaXMgcGF0Y2ggZGVwZW5kcyBvbiBwYXRjaA0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L2xpbnV4LWFybS1rZXJuZWwvbGlzdC8/c2VyaWVzPTk1MzU0NQ0KDQpDaGFuZ2Vz
IGluIHY4Og0KICAgLSBXaGl0ZXNwYWNlIGluIGNvbW1lbnQNCg0KSGkgQ2hyaXN0aWFuo6wNCg0K
VGhlIHN1YmplY3Qgb2YgZWFjaCBvZiB5b3VyIHBhdGNoZXMgaXMgc3RpbGwgdjcuDQoNCmUuZy4s
DQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtcGNpL3BhdGNoLzIw
MjUwNDIzMDgxMDUxLjM5MDc5MzAtMi1jaHJpc3RpYW4uYnJ1ZWxAZm9zcy5zdC5jb20vDQoNCkJl
c3QgcmVnYXJkcywNCkhhbnMNCg0KQ2hhbmdlcyBpbiB2NzoNCiAgIC0gVXNlIGRldmljZV9pbml0
X3dha2V1cCB0byBlbmFibGUgd2FrZXVwDQogICAtIEZpeCBjb21tZW50cyAoQmpvcm4pDQoNCkNo
YW5nZXMgaW4gdjY6DQogICAtIENhbGwgZGV2aWNlX3dha2V1cF9lbmFibGUoKSB0byBmaXggV0FL
RSMgd2FrZXVwLg0KICAgQWRkcmVzcyBjb21tZW50cyBmcm9tIE1hbml2YW5uYToNCiAgIC0gRml4
L0FkZCBDb21tZW50cw0KICAgLSBGaXggRFQgaW5kZW50cw0KICAgLSBSZW1vdmUgZHdfcGNpZV9l
cF9saW5rdXAoKSBpbiBFUCBzdGFydCBsaW5rDQogICAtIEFkZCBQQ0lFX1RfUFZQRVJMX01TIGRl
bGF5IGluIFJDIFBFUlNUIyBkZWFzc2VydA0KDQpDaGFuZ2VzIGluIHY1Og0KICAgQWRkcmVzcyBk
cml2ZXIgY29tbWVudHMgZnJvbSBNYW5pdmFubmE6DQogICAtIFVzZSBkd19wY2llX3tzdXNwZW5k
L3Jlc3VtZX1fbm9pcnEgaW5zdGVhZCBvZiBwcml2YXRlIG9uZXMuDQogICAtIE1vdmUgZHdfcGNp
ZV9ob3N0X2luaXQoKSB0byBwcm9iZQ0KICAgLSBBZGQgc3RtMzJfcmVtb3ZlX3BjaWVfcG9ydCBj
bGVhbnVwIGZ1bmN0aW9uDQogICAtIFVzZSBvZl9ub2RlX3B1dCBpbiBzdG0zMl9wY2llX3BhcnNl
X3BvcnQNCiAgIC0gUmVtb3ZlIHdha2V1cC1zb3VyY2UgcHJvcGVydHkNCiAgIC0gVXNlIGdlbmVy
aWMgZGV2X3BtX3NldF9kZWRpY2F0ZWRfd2FrZV9pcnEgdG8gc3VwcG9ydCB3YWtlIyBpcnENCg0K
Q2hhbmdlcyBpbiB2NDoNCiAgIEFkZHJlc3MgYmluZGluZ3MgY29tbWVudHMgUm9iIEhlcnJpbmcN
CiAgIC0gUmVtb3ZlIHBoeSBwcm9wZXJ0eSBmb3JtIGNvbW1vbiB5YW1sDQogICAtIFJlbW92ZSBw
aHktbmFtZSBwcm9wZXJ0eQ0KICAgLSBNb3ZlIHdha2VfZ3BpbyBhbmQgcmVzZXRfZ3BpbyB0byB0
aGUgaG9zdCByb290IHBvcnQNCg0KQ2hhbmdlcyBpbiB2MzoNCiAgIEFkZHJlc3MgY29tbWVudHMg
ZnJvbSBNYW5pdmFubmEsIFJvYiBhbmQgQmpvcm46DQogICAtIE1vdmUgaG9zdCB3YWtldXAgaGVs
cGVyIHRvIGR3YyBjb3JlIChNYW5pKQ0KICAgLSBEcm9wIG51bS1sYW5lcz08MT4gZnJvbSBiaW5k
aW5ncyAoUm9iKQ0KICAgLSBGaXggUENJIGFkZHJlc3Mgb2YgSS9PIHJlZ2lvbiAoTWFuaSkNCiAg
IC0gTW92ZWQgUEhZIHRvIGEgUkMgcm9vdHBvcnQgc3Vic2VjdGlvbiAoQmpvcm4sIE1hbmkpDQog
ICAtIFJlcGxhY2VkIGRtYS1saW1pdCBxdWlyayBieSBkbWEtcmFuZ2VzIHByb3BlcnR5IChCam9y
bikNCiAgIC0gTW92ZWQgb3V0IHBlcnN0IGFzc2VydC9kZWFzc2VydCBmcm9tIHN0YXJ0L3N0b3Ag
bGluayAoTWFuaSkNCiAgIC0gRHJvcCBsaW5rX3VwIHRlc3Qgb3B0aW0gKE1hbmkpDQogICAtIERU
IGFuZCBjb21tZW50cyByZXBocmFzaW5nIChCam9ybikNCiAgIC0gQWRkIGR0cyBlbnRyaWVzIG5v
dyB0aGF0IHRoZSBjb21ib3BoeSBlbnRyaWVzIGhhcyBsYW5kZWQNCiAgIC0gRHJvcCBkZWxheWlu
ZyBDb25maWd1cmF0aW9uIFJlcXVlc3RzDQoNCkNoYW5nZXMgaW4gdjI6DQogICAtIEZpeCBzdCxz
dG0zMi1wY2llLWNvbW1vbi55YW1sIGR0X2JpbmRpbmdfY2hlY2sNCg0KQ2hhbmdlcyBpbiB2MToN
CiAgIEFkZHJlc3MgY29tbWVudHMgZnJvbSBSb2IgSGVycmluZyBhbmQgQmpvcm4gSGVsZ2FhczoN
CiAgIC0gRHJvcCBzdCxsaW1pdC1tcnJzIGFuZCBzdCxtYXgtcGF5bG9hZC1zaXplIGZyb20gdGhp
cyBwYXRjaHNldA0KICAgLSBSZW1vdmUgc2luZ2xlIHJlc2V0IGFuZCBjbG9ja3MgYmluZGluZyBu
YW1lcyBhbmQgbWlzYyB5YW1sIGNsZWFudXBzDQogICAtIFNwbGl0IFJDL0VQIGNvbW1vbiBiaW5k
aW5ncyB0byBhIHNlcGFyYXRlIHNjaGVtYSBmaWxlDQogICAtIFVzZSBjb3JyZWN0IFBDSUVfVF9Q
RVJTVF9DTEtfVVMgYW5kIFBDSUVfVF9SUlNfUkVBRFlfTVMgZGVmaW5lcw0KICAgLSBVc2UgLnJl
bW92ZSBpbnN0ZWFkIG9mIC5yZW1vdmVfbmV3DQogICAtIEZpeCBiYXIgcmVzZXQgc2VxdWVuY2Ug
aW4gRVAgZHJpdmVyDQogICAtIFVzZSBjbGVhbnVwIGJsb2NrcyBmb3IgZXJyb3IgaGFuZGxpbmcN
CiAgIC0gQ29zbWV0aWMgZml4ZXMNCg0KQ2hyaXN0aWFuIEJydWVsICg5KToNCiAgZHQtYmluZGlu
Z3M6IFBDSTogQWRkIFNUTTMyTVAyNSBQQ0llIFJvb3QgQ29tcGxleCBiaW5kaW5ncw0KICBQQ0k6
IHN0bTMyOiBBZGQgUENJZSBob3N0IHN1cHBvcnQgZm9yIFNUTTMyTVAyNQ0KICBkdC1iaW5kaW5n
czogUENJOiBBZGQgU1RNMzJNUDI1IFBDSWUgRW5kcG9pbnQgYmluZGluZ3MNCiAgUENJOiBzdG0z
MjogQWRkIFBDSWUgRW5kcG9pbnQgc3VwcG9ydCBmb3IgU1RNMzJNUDI1DQogIE1BSU5UQUlORVJT
OiBhZGQgZW50cnkgZm9yIFNUIFNUTTMyTVAyNSBQQ0llIGRyaXZlcnMNCiAgYXJtNjQ6IGR0czog
c3Q6IGFkZCBQQ0llIHBpbmN0cmwgZW50cmllcyBpbiBzdG0zMm1wMjUtcGluY3RybC5kdHNpDQog
IGFybTY0OiBkdHM6IHN0OiBBZGQgUENJZSBSb290Y29tcGxleCBtb2RlIG9uIHN0bTMybXAyNTEN
CiAgYXJtNjQ6IGR0czogc3Q6IEFkZCBQQ0llIEVuZHBvaW50IG1vZGUgb24gc3RtMzJtcDI1MQ0K
ICBhcm02NDogZHRzOiBzdDogRW5hYmxlIFBDSWUgb24gdGhlIHN0bTMybXAyNTdmLWV2MSBib2Fy
ZA0KDQogLi4uL2JpbmRpbmdzL3BjaS9zdCxzdG0zMi1wY2llLWNvbW1vbi55YW1sICAgIHwgIDMz
ICsrDQogLi4uL2JpbmRpbmdzL3BjaS9zdCxzdG0zMi1wY2llLWVwLnlhbWwgICAgICAgIHwgIDY3
ICsrKw0KIC4uLi9iaW5kaW5ncy9wY2kvc3Qsc3RtMzItcGNpZS1ob3N0LnlhbWwgICAgICB8IDEx
MiArKysrKw0KIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgNyArDQogYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUtcGluY3RybC5kdHNpIHwg
IDIwICsNCiBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzaSAgICAgICAgfCAg
NTcgKysrDQogYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU3Zi1ldjEuZHRzICAgIHwg
IDIxICsNCiBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9LY29uZmlnICAgICAgICAgICAgfCAg
MjQgKw0KIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL01ha2VmaWxlICAgICAgICAgICB8ICAg
MiArDQogZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1zdG0zMi1lcC5jICAgIHwgNDE3
ICsrKysrKysrKysrKysrKysrKw0KIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtc3Rt
MzIuYyAgICAgICB8IDM3MCArKysrKysrKysrKysrKysrDQogZHJpdmVycy9wY2kvY29udHJvbGxl
ci9kd2MvcGNpZS1zdG0zMi5oICAgICAgIHwgIDE2ICsNCiAxMiBmaWxlcyBjaGFuZ2VkLCAxMTQ2
IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3BjaS9zdCxzdG0zMi1wY2llLWNvbW1vbi55YW1sDQogY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvc3Qsc3RtMzItcGNp
ZS1lcC55YW1sDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9wY2kvc3Qsc3RtMzItcGNpZS1ob3N0LnlhbWwNCiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1zdG0zMi1lcC5jDQogY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtc3RtMzIuYw0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXN0bTMyLmgNCg0KLS0N
CjIuMzQuMQ0KDQoNCg0KDQpUaGlzIGVtYWlsIChpbmNsdWRpbmcgaXRzIGF0dGFjaG1lbnRzKSBp
cyBpbnRlbmRlZCBvbmx5IGZvciB0aGUgcGVyc29uIG9yIGVudGl0eSB0byB3aGljaCBpdCBpcyBh
ZGRyZXNzZWQgYW5kIG1heSBjb250YWluIGluZm9ybWF0aW9uIHRoYXQgaXMgcHJpdmlsZWdlZCwg
Y29uZmlkZW50aWFsIG9yIG90aGVyd2lzZSBwcm90ZWN0ZWQgZnJvbSBkaXNjbG9zdXJlLiBVbmF1
dGhvcml6ZWQgdXNlLCBkaXNzZW1pbmF0aW9uLCBkaXN0cmlidXRpb24gb3IgY29weWluZyBvZiB0
aGlzIGVtYWlsIG9yIHRoZSBpbmZvcm1hdGlvbiBoZXJlaW4gb3IgdGFraW5nIGFueSBhY3Rpb24g
aW4gcmVsaWFuY2Ugb24gdGhlIGNvbnRlbnRzIG9mIHRoaXMgZW1haWwgb3IgdGhlIGluZm9ybWF0
aW9uIGhlcmVpbiwgYnkgYW55b25lIG90aGVyIHRoYW4gdGhlIGludGVuZGVkIHJlY2lwaWVudCwg
b3IgYW4gZW1wbG95ZWUgb3IgYWdlbnQgcmVzcG9uc2libGUgZm9yIGRlbGl2ZXJpbmcgdGhlIG1l
c3NhZ2UgdG8gdGhlIGludGVuZGVkIHJlY2lwaWVudCwgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4g
SWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIGRvIG5vdCByZWFk
LCBjb3B5LCB1c2Ugb3IgZGlzY2xvc2UgYW55IHBhcnQgb2YgdGhpcyBlLW1haWwgdG8gb3RoZXJz
LiBQbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRlbHkgYW5kIHBlcm1hbmVudGx5IGRl
bGV0ZSB0aGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGlmIHlvdSByZWNlaXZlZCBpdCBp
biBlcnJvci4gSW50ZXJuZXQgY29tbXVuaWNhdGlvbnMgY2Fubm90IGJlIGd1YXJhbnRlZWQgdG8g
YmUgdGltZWx5LCBzZWN1cmUsIGVycm9yLWZyZWUgb3IgdmlydXMtZnJlZS4gVGhlIHNlbmRlciBk
b2VzIG5vdCBhY2NlcHQgbGlhYmlsaXR5IGZvciBhbnkgZXJyb3JzIG9yIG9taXNzaW9ucy4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
