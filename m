Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D109EA20B7B
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jan 2025 14:45:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FA8FC78026;
	Tue, 28 Jan 2025 13:45:19 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2108.outbound.protection.outlook.com [40.107.241.108])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C199C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 13:45:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZgvxP6gvZP/Ws4P+L9AVKzqhpwvNnubPCkhiQfe00dQ9rtAORWcFsRBetWTxvUV+8tzYIP/DJyEgRaTz2RKI0Khc1t4irk4S6Vs3fBpMSPam1h9QS4PIh8WQ0Mu1K8PcRM0KS9yBPJgW4ZBCKaSyFF5BOnprmT8X1nSgQ4DVaN0B/oPzxELlusM6/r+SwqC+Q8BAps7PrzOykXI+u4yw5g8yEW2w0dbXwbMqBHyY7qHwP+VFamznOKjKXVOAnEAGk0ZeNgvfjpyeW6M1xcQwnmgqoKyIUyoH0SGxt4yuJYSIg5yTXybPN8HF6wJDIUgneL+PWALjxBZLRRFjU+v9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWKawxFPsbcsj9BO2dlLhb8M6rOG1AbmwyROdp4lkyM=;
 b=vdmXAqQsf9jMWrNtll5EtMz7WmATWuInV8BQIayK95XCiC/fCXICNhYj3BGMmMcxNlNo3TiMrk3yPJ8neH5qrPloLE+wvRZN6NrLIhsnNnCb7jpcIrDqxNtPYOS2T4cw0GiFx59Le4cdSsp2c6g7HZDiG9FpDO8F0WjzHurYwdT83Ks3oJJ0/ZSVPqtqqsMTqv1W+GBCG1CaEFSJxxoTyuF27DqYDWumaMOqTummBwJkBnbo4kxy9p1v0c2ATLdUo2M3cqENTRcWHYZ/1NYwl804AnCsohtd6LpfnVd0fREwZugUy4JGhCB3O2A0xwbpObrAKJcc9Vx/0Ilp1CMSNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.fr; dmarc=pass action=none header.from=phytec.fr;
 dkim=pass header.d=phytec.fr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWKawxFPsbcsj9BO2dlLhb8M6rOG1AbmwyROdp4lkyM=;
 b=IdukvWKXhKPQFCTO3FwhqFNyiq9Stt6CiJNyAaiXe/6DRk97PAhZOQuSbmClWd4zwa8XA4CNfw/inXQGThuOO+ST2rZnZY3khU3U44Rq4cLGZYxn91/wtX0SNDib0SZA98M/mSYycSvEx/P768+cmgX/iJWzVJjmdnn5LiJMKEQ=
Received: from DU0P195MB2197.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:472::20)
 by AM9P195MB0885.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:1ce::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 13:45:10 +0000
Received: from DU0P195MB2197.EURP195.PROD.OUTLOOK.COM
 ([fe80::59ab:3743:c2e2:6e2d]) by DU0P195MB2197.EURP195.PROD.OUTLOOK.COM
 ([fe80::59ab:3743:c2e2:6e2d%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 13:44:57 +0000
From: Christophe Parant <C.Parant@phytec.fr>
To: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Thread-Topic: [Upstream] [PATCH 00/11] Rework and fix STM32MP15x PHYTEC dts
Thread-Index: AQHbY3CrF5yiNgLYnE6MYq3NtTsTSLMsTsAA
Date: Tue, 28 Jan 2025 13:44:57 +0000
Message-ID: <4325bcfd010ee1dc64a261438c9d14e2ce121037.camel@phytec.fr>
References: <20250110150216.309760-1-c.parant@phytec.fr>
In-Reply-To: <20250110150216.309760-1-c.parant@phytec.fr>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.fr;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P195MB2197:EE_|AM9P195MB0885:EE_
x-ms-office365-filtering-correlation-id: 6100416a-19bd-4f73-2f3f-08dd3fa1f430
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MEQ4ZUJKOHE0NlAzd3d5RjQ0K3B5cFZYbDh5aTVRODJVUi9uQ0lZR3ZBZlRz?=
 =?utf-8?B?dzRoRHlHU3I1cTNFTWZCSEJNV1F5aVZlaEgzcXIyTmVBcTFzY0JjL2ZENWhs?=
 =?utf-8?B?dVZxUDRIZEdyY0xLKy9ub3VJUHBTK2N0a2lxS0RESGlxUUg3SnpLa1o2ZUtz?=
 =?utf-8?B?dlZKUlFaMmRIQWNDOFB3Y2cvT2tqa1UvOUVjVTlXWEZUN2RyTWJJbDFBWU4z?=
 =?utf-8?B?ZHhFMVZUalk2Mm83eWZCaW9pOERMV21PTnp3Y1M1Y0JHMituSUdYVkZQSUtX?=
 =?utf-8?B?L3pQSWVHQklWQmJUNjVHSitwaXdKTGdSMHRxcS9ZZ2Y1TXlieVJUMXRIbXhy?=
 =?utf-8?B?UVlFN2w3VGJHRXFhR3BvTnFGbGlqWWJDb3dCMXJxWEV0QWpzcVF4OHV5dXUv?=
 =?utf-8?B?VDFTRlhHSmdGdGthR05jcGlteVl6N2F5RlprSGNSclhJdTArUFZBVlhBUytv?=
 =?utf-8?B?Y1BCQSs3U1F6Z2FRU1hHS2krU0pJY3M3MFlxV0p0YzBQUTVXWlFEVVlFeGFV?=
 =?utf-8?B?NVA2RngxSFVpR1MzbFlXRHdxZUoxNGZFeFNFM0RObG1nSHZZRFcyelNSTEtZ?=
 =?utf-8?B?N2pNY2JXOXZHb0hucGhkS09iL0xURzJGWFRYYlYrSzlGT01hSVBXZTdwVVdv?=
 =?utf-8?B?YVFPbjBMUHRObld1b1FyNnFSVThvVW1waDRzUmx5MGRnM3BkWGsyM1cxaHh1?=
 =?utf-8?B?aFZDWjdPSjJ0ZTIwbS9NdFFBdjczYm1ReE03TmlvNmxzVnBTcVhxdjRuNXNX?=
 =?utf-8?B?YmVSOUlJSGE4L1kvSk1HNUY0NnNiRDk4UDJESVdoM1pSNHFjM0F3RU82MUJX?=
 =?utf-8?B?UHFEM2NXa0ptaTNkUzZHYUIvdHlyWG5TNER5UTFneVp2bGpiTXlHZ2J6YURS?=
 =?utf-8?B?cFdqandTTXNQUmNCVUdyWXd2Y01sWG1IL1Qxc2xGbm1Wa1BoM1NLdFVDSFRx?=
 =?utf-8?B?ZmdjWFhlU09IWCtkMC91ZGFkbjcyd2VldzJ0UTdCL2pWbUVyV253VWV6dW1z?=
 =?utf-8?B?a1E4dHhrVFk1K3Rrek5oRCtQdW9yd0ZOaU4wWGRDeFpDSUY5d01nT2NzWGlq?=
 =?utf-8?B?S2gxaTNhNTVlYjZFU3pXVXV4anhPSmYzVjN1MEE4eVFVYmFsS21RcjM1bEdp?=
 =?utf-8?B?ZjlZTTloTEJPbGV4SS9Zak44dzlKc0haUUxSTm9idXVkMndQQlI5ZzRsU1Zp?=
 =?utf-8?B?WXZ4dHQwMjFqem5Bd2l4TkVUN1FlaVI1MHJxN3dBcHJDOWFEWTRLNjBuZzk0?=
 =?utf-8?B?Z2ZydzRQMGVJRVo1bmtydW84OHBnWXU4UExSZzNacmt1L2o0dTJTTGQ5NlZX?=
 =?utf-8?B?dXI3Y2xQVkdKdHJiTTJ0QXd2OW42NjF6NWMvbnY2UjZsMjlWbHVKU1J2amNX?=
 =?utf-8?B?ZHF5VjlxdEVWMXBZOW5aVGRKL2loYWs3R1BkeXFYb3o3c0hVeVpkc0Q5VWJu?=
 =?utf-8?B?VmpZSXMzVStUNVRQb2ZBbFRDMVM3UEJhNXlRZk9BQ1g3M2ZBM3RmdzRXUitD?=
 =?utf-8?B?Z3dTZkJyU0RWV0JjbWFTTHNnMlY1TURPSUxFTzkxMFh5aWF2TlJxaFVGcGVQ?=
 =?utf-8?B?VFBQKy9JVlRoTkRMMVBadmtrSnhvWnZOeU5PbEhZd28rNUY1K2huTll1Uk9B?=
 =?utf-8?B?ejdIYUNXNWNYejV2RHVRWExMRXovUEF3bnF4L2NRZnZkbm0xRG5NZm16QjFB?=
 =?utf-8?B?RHZmdXhyb2NIMjU3Z2U4Q04rOXdhUW5XR1dJUVRFL1hvRUtIL0N3dUtidzZ2?=
 =?utf-8?B?SUtqKzcyajJESXlKbUgvZzlZRVl1VUc5QkREK2t5WGJRVjAvc29uSVJ6RGdJ?=
 =?utf-8?B?Q1NQeTNYMWcydG1lTERhQ0dGcDVXcHRPK2RrQlhYWTFjU2NOdWpScVpadXBq?=
 =?utf-8?B?QU80VkpKSzhxdklJSWRybWdFMnZOZjZjTHJJbjFUaDJtQUtzSGl4bHc3VFNT?=
 =?utf-8?Q?yePHZf17WhlafzOx4LjJjr3oiFGHqWne?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0P195MB2197.EURP195.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDZ1MG9hRkVpZXVyVmJ3Q2hzTGxac2VEM1RObGpOZ2dZL3FuVHNPV1FUVzRt?=
 =?utf-8?B?UXlCem1QcXhzZFg5dXhVcERJY0pMZ0MwZENCZzZXcjRMVHBTT24zeWlnM1hz?=
 =?utf-8?B?aWdkOVZRNGRLZDRvRGlDb0hKMTJyeVJwRkVDWGJqYWV5Wks2VW54R2UzdnVZ?=
 =?utf-8?B?cG1KVHpXdkxrcmhDejlHMHJmNFhQdlBmMC9mUzNsU1d3V2ZKSEQ2VFJYb2NQ?=
 =?utf-8?B?NHRrNWVpOHMzZVh0SFJIS1ZpSzZQV2M1d2taaEY3N2dDdGJ0djJnNTNrMVhE?=
 =?utf-8?B?R3hBaDd5dmhYZm5aa3VYSUNMUm1MQW1hamM1M3NPaWo0MWdsUkFMTzhMamRQ?=
 =?utf-8?B?QnhteDFMd0lpMXNwMEJBZ2UyRGJPSXUzTjJmMWlXaFlPd3ZweXV3S1J3bWxN?=
 =?utf-8?B?am5aek1aUWx2UjVxMU1JMmxycHlsU1NnNmg0VGpNTlpXVStBTGdtOVZ6cEVC?=
 =?utf-8?B?R21wbEFNNGllemw2djdSSkFlSmNxb2hVVTBNMGIra0c2Q0twVmNHekRFWmRL?=
 =?utf-8?B?eW5pRVY2YjlMNTBvQm4yL0JIVDZLRTg2L2sydUpjMlBpNW04ZVZuMlgxZ0NR?=
 =?utf-8?B?dnh0TEUwSlNNc1FNdmN0cEpTaW4zRWd5M3d4c1VxdWJhRWIzWk1ERTB0bXF2?=
 =?utf-8?B?TjN6YkdyYWRuQTBGbkd2RnhDbW9pcmxDZENWNjU1eE1Ic1J6RUQ2cG12ay9H?=
 =?utf-8?B?UERneDFlb1Y5V0pIbHFZMngvdEpmTERpSVBDVGZSOHROR05rU0RnWXg5SEs3?=
 =?utf-8?B?N1BMb09lZER0cklCd1pOemxic3MxMlVFWkJQWlZBVXl2UStKQnFmMkg0Q2x0?=
 =?utf-8?B?OUNTc3h5NXkyZzVRTnZrWUVyZmZHNXV5bnllVkxXWDd4UnI3SHpTR2RHZk0v?=
 =?utf-8?B?YWZ6MmplQUh4Ny9majRCRDZHa0pLMjVMd2FTMklmTjZXbytXajVKZm1oTHFt?=
 =?utf-8?B?M3o1VFNsempBc0VJajdjVVowU0pUNVNXaG1xMmpVMmxwS1c5cDlzcGxLN2Fy?=
 =?utf-8?B?bFhkSXhGTWp5WHFCaVd3RldESCtJU2xxR3Y0a3M1MFIwVzM5a0l2UnFmS3VM?=
 =?utf-8?B?a3Y1ZGxJMnZmTEd3bmFhTVRvYTdVMmkwendNMEtBMzFlckhtRUFpRGVXT2tH?=
 =?utf-8?B?Q3hSSExaMGZ1MS9pUHRraDBmbmRDTmkwYlBtUTNSN0h3VktibE4zVkZuVXZz?=
 =?utf-8?B?WCs2cEV4ZXJ3Mnh4WnlNMHZ5NGFMVUJBYndicFVlT3RHUXZOd09PckRITXI4?=
 =?utf-8?B?RTg3MU9KdzRRenBkd2lJNVBkNktZb1hCMjdvYmtjQzRncWRGV2Q3ZmdvSVdE?=
 =?utf-8?B?bEJ3cFdRMmttdHBhNW1vUmcvMGdNZ092OHdTM2J4MVBHbXBtdzY4c2E2VmRG?=
 =?utf-8?B?WU45RTc4bjVia2ZaS2pIeklEaVhVVHp3Y3kvMVkwNENLQjdSNTlVNzE2S1VO?=
 =?utf-8?B?OWJGd1VZcW9EcEJ1b3kxanZNTXFFVWtZOE10NUhJZ0lTWnBXWS85ajZKQmNH?=
 =?utf-8?B?Vm9ZQk9HVURjVUZzMGxtb0lQTlVydStNcFYrcGFmVUZxbGIyeitmWktHRUNW?=
 =?utf-8?B?SzdUVC9GRVo3RXV2ckVxdk1RemF0ajJScG5YWERnWW9wUG9Ud1VDYTkzQWx0?=
 =?utf-8?B?UjNrcklPcUg2RklnUkJ5MlVqZnJBM2VNdXUyZzh2cTMxU0QrNi8wY3Z4Tmc0?=
 =?utf-8?B?QjlhelNwNWJ1TkloSzVDak5ZM2RlZmdtVmhQR3lHL2dEeUtxemJjaHA0QTBO?=
 =?utf-8?B?enZDN2FFMDVCeWU4MmtqTVI4UjIveGFGVCs4ZlE0NTZkSkp4SGFYYVlpajVG?=
 =?utf-8?B?ZUpkNE95cjdPb2dCUXlGcVJTZDFjbnNrdWJJdTJ5cXhqUmtURzFUakp0K3pp?=
 =?utf-8?B?Wm81TlI0UE1pZWFnbmxnNDV2UlphUnhZdDBuMTN5MmVqdFJvRVdySWo0OGk4?=
 =?utf-8?B?ZHo5bys0MHAyOUdnVE1hSy9OMng4QWVuNXBaYTF3Znk4WFhRVTA0djgrMU9s?=
 =?utf-8?B?Tk1KYjRWN3BXZUlFMDloUXRNdm5xUjV2MWhvTmFLeUE3Tkd6QzBYRkwrRXpq?=
 =?utf-8?B?bUg3cmFUaUppNEpubzB3T3JCQm5LMFo5SE1sbjkzTENHQUlxVWMzenJuVGEz?=
 =?utf-8?Q?WMf1IoK4qROKuUxOGkkiPFCpy?=
Content-ID: <3D3D6BA4A886A14DAB72DF8A2395C3C3@EURP195.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P195MB2197.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6100416a-19bd-4f73-2f3f-08dd3fa1f430
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 13:44:57.5119 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HAefUUUnPudxPdoMyFAtOiW4QWmPgEWvm2TBJVNPlEhTIXUWXVtX1yyQ7yWTeKIR2et9cxnKcMulzzZcNLnUrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB0885
Cc: "upstream@lists.phytec.de" <upstream@lists.phytec.de>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [Upstream] [PATCH 00/11] Rework and fix
	STM32MP15x PHYTEC dts
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

SGVsbG8gbWFpbnRhaW5lcnMsDQoNCkp1c3QgY2hlY2tpbmcgdG8gc2VlIGlmIHlvdSBoYXZlIHNl
ZW4gdGhpcyBwYXRjaCBzZXJpZXMgYW5kIGlmIHlvdSBnZXQNCmEgY2hhbmNlIHRvIHJldmlldyBp
dC4NClRoYW5rIHlvdSBmb3IgeW91ciB0aW1lLg0KDQpCZXN0IHJlZ2FyZHMsDQpDaHJpc3RvcGhl
DQoNCkxlIHZlbmRyZWRpIDEwIGphbnZpZXIgMjAyNSDDoCAxNjowMiArMDEwMCwgQ2hyaXN0b3Bo
ZSBQYXJhbnQgYSDDqWNyaXTCoDoNCj4gVGhpcyBwYXRjaCBzZXJpZXMgcmVuYW1lIGFuZCByZW9y
Z2FuaXplIHRoZSBTVE0zMk1QMTV4IFBIWVRFQw0KPiBiYXNlYm9hcmQgKHBoeUJPQVJELVNhcmdh
cykgYW5kIFNvTSAocGh5Q09SRS1TVE0zMk1QMTV4KSBkZXZpY2UgdHJlZQ0KPiBmaWxlcy4NCj4g
SW5kZWVkLCB0aGUgY3VycmVudCBkZXZpY2UgdHJlZSBuYW1pbmcgYW5kIG9yZ2FuaXphdGlvbiBp
cyBub3QgcmVhbGx5DQo+IGNvbnNpc3RlbnQgYXMgaXQgZG9lcyBub3QgYWxpZ24gd2l0aCBvdGhl
cnMgU1RNMzJNUCBib2FyZHMgKHVzZQ0KPiBjb21tb24NCj4gZHRzaSBmaWxlIGFzIG11Y2ggYXMg
cG9zc2libGUsIHVzZSBvbmUgZHRzaSBmb3IgU29NIGFuZCBvbmUgZHRzaSBmb3INCj4gYmFzZWJv
YXJkKS4NCj4gDQo+IFRoZSBzZXJpZXMgYWxzbyBmaXhlcyBzb21lIGltcG9ydGFudCBwaW5jdHJs
IGlzc3VlcyBhbmQgbWlub3Igb25lDQo+IChjb2RpbmcNCj4gc3R5bGUpLiBBZGRpdGlvbmFsIHBp
bmN0cmwgaXMgYWxzbyBhZGRlZCBmb3IgdGhlIG9wdGlvbm5hbCBpbnRlcmZhY2VzDQo+IHRoYXQg
YXJlIG5vdCBlbmFibGVkIGJ5IGRlZmF1bHQgKEZNQywgTFREQywgRENNSSwgUFdNKS4NCj4gDQo+
IENocmlzdG9waGUgUGFyYW50ICgxMSk6DQo+IMKgIEFSTTogZHRzOiBzdG0zMm1wMTU6IHBoeWNv
cmU6IFJlbmFtZSBkZXZpY2UgdHJlZSBmaWxlcw0KPiDCoCBBUk06IGR0czogc3RtMzJtcDE1OiBw
aHlib2FyZC1zYXJnYXM6IEludHJvZHVjZSBTb00gZGV2aWNlIHRyZWUNCj4gwqAgZHQtYmluZGlu
Z3M6IGFybTogc3RtMzI6IFJlbmFtZSBTVE0zMk1QMTV4IFBoeXRlYyBib2FyZCBhbmQgU29NDQo+
IMKgIEFSTTogZHRzOiBzdG0zMm1wMTU6IEFkZCBuZXcgcGlubXV4IGdyb3VwcyBmb3IgcGh5Y29y
ZSBhbmQgcGh5Ym9hcmQNCj4gwqAgQVJNOiBkdHM6IHN0bTMybXAxNTogcGh5Ym9hcmQtc2FyZ2Fz
OiBGaXggdWFydDQgYW5kIHNhaTIgcGluY3RybA0KPiDCoCBBUk06IGR0czogc3RtMzJtcDE1OiBw
aHljb3JlOiBxc3BpOiBGaXggbWVtb3J5IG1hcCBhbmQgcGluY3RybA0KPiDCoCBBUk06IGR0czog
c3RtMzJtcDE1OiBwaHljb3JlOiBBZGQgZHVtbXkgbWVtb3J5LW5vZGUNCj4gwqAgQVJNOiBkdHM6
IHN0bTMybXAxNTogcGh5Ym9hcmQtc2FyZ2FzOiBNb3ZlIGFsaWFzZXMgZnJvbSBkdHMgdG8gZHRz
aQ0KPiDCoCBBUk06IGR0czogc3RtMzJtcDE1OiBwaHljb3JlOiBEaXNhYmxlIG9wdGlvbmFsIFNv
TSBwZXJpcGhlcmFscw0KPiDCoCBBUk06IGR0czogc3RtMzJtcDE1OiBwaHljb3JlIGFuZCBwaHli
b2FyZDogRml4IGNvZGluZyBzdHlsZSBpc3N1ZXMNCj4gwqAgQVJNOiBkdHM6IHN0bTMybXAxNTog
cGh5Y29yZSBhbmQgcGh5Ym9hcmQ6IEFkZCBvcHRpb25hbCBpbnRlcmZhY2VzDQo+IA0KPiDCoC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1swqAgfMKgwqAgNyArLQ0K
PiDCoGFyY2gvYXJtL2Jvb3QvZHRzL3N0L01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgwqAgMiArLQ0KPiDCoGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNS1w
aW5jdHJsLmR0c2nCoMKgIHwgMTY0ICsrKysrKysrKw0KPiDCoC4uLi9zdC9zdG0zMm1wMTU3Yy1w
aHlib2FyZC1zYXJnYXMtcmRrLmR0c8KgwqDCoCB8wqAgNDIgKysrDQo+IMKgLi4uL2R0cy9zdC9z
dG0zMm1wMTU3Yy1waHljb3JlLXN0bTMybXAxLTMuZHRzIHzCoCA2MCAtLS0NCj4gwqAuLi4vZHRz
L3N0L3N0bTMybXAxNXh4LXBoeWJvYXJkLXNhcmdhcy5kdHNpwqDCoCB8IDI4NiArKysrKysrKysr
KysrKysNCj4gwqAuLi4tc29tLmR0c2kgPT4gc3RtMzJtcDE1eHgtcGh5Y29yZS1zb20uZHRzaX0g
fCAzNDQgKysrKy0tLS0tLS0tLS0tLQ0KPiAtLQ0KPiDCoDcgZmlsZXMgY2hhbmdlZCwgNTY0IGlu
c2VydGlvbnMoKyksIDM0MSBkZWxldGlvbnMoLSkNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1N2MtcGh5Ym9hcmQtc2FyZ2FzLQ0KPiByZGsuZHRz
DQo+IMKgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdj
LXBoeWNvcmUtDQo+IHN0bTMybXAxLTMuZHRzDQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
YXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LXBoeWJvYXJkLQ0KPiBzYXJnYXMuZHRzaQ0KPiDC
oHJlbmFtZSBhcmNoL2FybS9ib290L2R0cy9zdC97c3RtMzJtcDE1N2MtcGh5Y29yZS1zdG0zMm1w
MTUtc29tLmR0c2kNCj4gPT4gc3RtMzJtcDE1eHgtcGh5Y29yZS1zb20uZHRzaX0gKDUzJSkNCj4g
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
