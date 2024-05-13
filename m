Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6348C56D2
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2024 15:18:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6FD1C6C855;
	Tue, 14 May 2024 13:18:50 +0000 (UTC)
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com
 [67.231.148.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57680C5E2CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 10:14:08 +0000 (UTC)
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44D9gWo7015207;
 Mon, 13 May 2024 03:13:47 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3y3gf4g2gn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 May 2024 03:13:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mn/aFbrILaWQ/n9/cuDG0Orqzon0skMW6UJbgDn/04xtXCt2pO9ZGlAVAb/zwQZWaQAA5Fcx0WedP+3tgNqzYl2sr7msCb86AILrHW5Eo0Pt6F4C7ZymA5/7wo9gmagNznpjQUaRuMjg1GxCfUznLKNU4G3SBMV6JklUcljmPipDPlgIkLZRrijm0LdPx24JTPq3SNlgfttLAXpxyAVBZdDTPi9i94rr5cpqZ18+5jcvLa6L0Wf5RwSBUUfX9C6hpttXSL6jkKUGqcuMnkWHLRvA9ebxpzsFYWvNwYC8RVBFaogGXH+k4RvqFjJn7bZ3Hmz04Z+wFtH7W2CevbeSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmAuxmBTPy9/glKeFNanEQWpl7liFQnh93+mkcx2KgA=;
 b=EML2OBgbun1UB/WJgg78QqgQfIXlgszL3fHyZtYU/GeUa3SVP7pYVY9WQ6/c0ny7/T5Q07G7F9paWuJPIo1U3D/D/Aoxhd7mC7sa2oFDjGb1TWmIovxi8RNrIaDb++G6x6l/dCjB7Eu/R/h4km8XAVyoLdA9e8OTnQcp7lV4QR7PmU59PFgxXKZBzrJ9/WXDmHEvcDblvWicSbMLESdAAFiF3xudXtyeSWcvRhArXaq3ukuIjQQMebo2JXaB+A6n+ftxZN9HTedchucxsz543/qS03ZReEZqpTIqP7P733DdZMB9z24pz1bYmsD81U+DTDRbKW7eMLsnDnQO1M0MFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmAuxmBTPy9/glKeFNanEQWpl7liFQnh93+mkcx2KgA=;
 b=rH96d7W7G6HwcdMPSjwtImAK9IX6lZxlCpJC9y9yJiHIgc53FZb2NHlmEicTP1fnj6OwiCoBqb4KSY9F2Fjs55CKbzyqgWqrxJl556Ko/RaCDbLfUTRRzzXDpq/lyPNk+Jqy8fIQRBwrmssmlIpVaJ28pdJP7G/fQh+5p6QuV78=
Received: from PH0PR18MB4474.namprd18.prod.outlook.com (2603:10b6:510:ea::22)
 by LV3PR18MB6219.namprd18.prod.outlook.com (2603:10b6:408:272::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 10:13:44 +0000
Received: from PH0PR18MB4474.namprd18.prod.outlook.com
 ([fe80::eeed:4f:2561:f916]) by PH0PR18MB4474.namprd18.prod.outlook.com
 ([fe80::eeed:4f:2561:f916%5]) with mapi id 15.20.7452.049; Mon, 13 May 2024
 10:13:44 +0000
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
Thread-Topic: [PATCH net-next v7 2/7] net: stmmac: Add dedicated XPCS cleanup
 method
Thread-Index: AQHapR48+TFK6SOwSU6rHILy2zg+Zw==
Date: Mon, 13 May 2024 10:13:44 +0000
Message-ID: <PH0PR18MB4474A17977EBE99532E6282ADEE22@PH0PR18MB4474.namprd18.prod.outlook.com>
References: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
 <20240513-rzn1-gmac1-v7-2-6acf58b5440d@bootlin.com>
In-Reply-To: <20240513-rzn1-gmac1-v7-2-6acf58b5440d@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR18MB4474:EE_|LV3PR18MB6219:EE_
x-ms-office365-filtering-correlation-id: a3418cbf-49d1-4a3f-2270-08dc73355f1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|376005|366007|7416005|1800799015|38070700009|921011; 
x-microsoft-antispam-message-info: =?utf-8?B?NDZvQ1lnNTlQT01ObHhZdm9CMjJSZi91ZnpUTzRrS1VGNFdFSVFBeE5Wdmdu?=
 =?utf-8?B?a045S1ZmUkJXK1BrTHJnbkZobStFVFFEVVBmbGJFc2J3a2FmR1JHZ29KMy9D?=
 =?utf-8?B?RzVvZi82cjlNSWUycURqbDVKTk5Oa29FOUVxWldVejQ3YlRYQXBIOWoraUtG?=
 =?utf-8?B?c3BVSkVOVTFUWEU5ZjI1cTd1OWdYdEpyNmgwK0RjL3FkWlV5OGI2YTVJdlhV?=
 =?utf-8?B?RFEycjh1MHZseDNQZW91QnlxQW9QWktqcnd3N0hINmtVdStCcG9oU3lUVCtK?=
 =?utf-8?B?UGo0Lzg3c21WTEdYWS9vU3FadDduR2h0bjlTb1pwTDhaQUhHbUZDWGZxWFZm?=
 =?utf-8?B?T1gvMjhmdjBqOHhQa01icG1JS1RNS1Z4NUF4S2VEM1VSUVhGT3ErUno5MFVL?=
 =?utf-8?B?OE5LSXBUOWFTdk9DOFBENDJmRGhuY0UvcnlwUEdFRC9FeTkwSVdsSkVHVG9J?=
 =?utf-8?B?UzU3bjhBaktiUlRnenRnaE9uRmRMaFB6OEdHQk1ldUlSUzFGM05IYWlHNHo1?=
 =?utf-8?B?Y2VEM0NwU2twRkVXRUl0OWI0SjhPU3hjUjNOS2xuZ3I2cDdQTVFnbDl2SHNE?=
 =?utf-8?B?dXlyNDJWLzVycE16N00vTjNtOEVWMmFNRVRrNzF6WTlHS3pVc3FkM2xGMFZX?=
 =?utf-8?B?VHNsWkI1Zm5vTE43R3RoUWtPdmU1Y3o3Z0dVdmZhcUNTNmVNVGllenZvcHo3?=
 =?utf-8?B?RlB2OWhZZmhuSytYYWluK2hVYnU2MGFsVWJXOHp3TlNiTHdFRVJTNUJBVGJz?=
 =?utf-8?B?TXUwbkpsdENkbUJIT2lDVVgwT09YdGNYWmRUekRWMUZoUEhZd2hNZnBSZlJy?=
 =?utf-8?B?bHdyOGJ2VVpvendQV3JTeXZVZXZ6Tnd1L2ZNcm0vdHY3SzBvMFJvU21XQjJh?=
 =?utf-8?B?SHcwbkpEVkR2RkhxYk5EdjIxMk83WFR2QmE1aFVwM1pLRThqZkNzSGkvaU0z?=
 =?utf-8?B?b3VlNTdLSzdXY1pHdjJnVHY2OFMrTTZjbHMyemFVdEZnc1RkdEVHcC9DdDlr?=
 =?utf-8?B?VHNrdFJpdEEzYUVGbk9MSFYyeWRXcyt5ZzVrSUpDLzUrUkYzQlRhcmJxc2tw?=
 =?utf-8?B?c1ZhNVAxNGMvMkMvZHdWRHgyMFJTY3RTMWVhT2NWY2ZQTERWRUY4eEdIa1Bz?=
 =?utf-8?B?RytmZmNmeXltNUlIaXN5UVorT1RzRlh3RGo1MXp3bTlvc0Z0YUdnUDhiR2hm?=
 =?utf-8?B?MDIwQlVHQ0loVjMvVTh2bUZiVjFKM1JzVE12Y3JxVGtZSEpUVlBTa2ZRZmpp?=
 =?utf-8?B?SlVkWEJMNjVuMnZBUm9vQWRDUFVyTFRrZW96MDF5RFpqNFAyc3MvdmEyR1F1?=
 =?utf-8?B?d01aS1RSQ1NkZWtOMERQZERhME55MFdQMURwZ3ROLytBcVRRWlR3eUY1UGRW?=
 =?utf-8?B?dHJPUGVyM2tUSjAxRFJSVXhWS2orQmN2TjlXa3lJRy9ubnJRNlZVdm5vYVh3?=
 =?utf-8?B?d3RnYndSdkJDT3gvUTltRjJyK3ZyS2g2SFFiM0tTcUVNUjhnMVIrVENWZTU2?=
 =?utf-8?B?S1lJZ0QrbzI1YnpCSHRZLzRGbFRiY0JBbUZrSEJLVE5VRDNaQjhMWFlNSEFi?=
 =?utf-8?B?d3lsSVZLY1k4TStld2pIQ3MyS3d1bTRvY3A4d1JqYk9yb0orcGlIT25BcEpJ?=
 =?utf-8?B?aHJ6MkhId1R5YnkyTUJuV0VYNE1XbjU4NzAxTUkzYjhDNE5GR05sLzhlV3Jp?=
 =?utf-8?B?NmRZRlI3VVNxQmhRQUVIQVZiMjJoTld2L3ltaENLMTBOR2MrSytiZXQvOGFy?=
 =?utf-8?B?YmFIWFhab3E1cnZSN0FrakZnOFVmcFJybDdpVC9DUGhpYlU1K1NyZ3FTMHRG?=
 =?utf-8?B?bWM0UkJDWTE4L0dQUGp5UT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR18MB4474.namprd18.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(7416005)(1800799015)(38070700009)(921011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWxNZHJFSUo2dmxLYkVlOGJndmZmblVrb1h5UGtBbld3QW5uQnN6ODdWcWpR?=
 =?utf-8?B?UW9USEltMy84Rk5vWDFielpYcmxldzRETWFoc2JZTVh4RHNqL1ZtOWQvT2xQ?=
 =?utf-8?B?UVptWWZwOW1ZdGJxOEkxYk9tUm5WZ29RNDdBT0lTS2x2RzlMREhjclBGRmRZ?=
 =?utf-8?B?UkdhTW96T1JGMjRZRWpNdzlrYnFMaWcwSnB0NmZKZ0I1VDlYUlA3WGxGcEdT?=
 =?utf-8?B?YnAyenhubldJbFdkcU9wd0UxK1RKWUs1WHJ2SXBqbUJQTk0rVHdPZXVQd3Fx?=
 =?utf-8?B?b2FqT1hNMU0vTklOZWVDQ1lqVEt2MnVjOXpCU3hrOWljc3p0YWw4aTRDUkZN?=
 =?utf-8?B?ajQvanRyZkJvVWdWb1VPM055dnBzdFNkVy9OREN0amtwdlUwRVlac3Fmb3NW?=
 =?utf-8?B?YXAxUk91QkV5bzlqUSt3RWcwU2V1NVUyWFNCMHJ1MXJtM2xZelBwMW04MTNq?=
 =?utf-8?B?LzZESXV6SCtnUk94bHRMRmhrY1VZdXg4L3AxeHh5T2grYmdHSDk5cG1vd3Nv?=
 =?utf-8?B?ajN4c3hIOHk1UlJyN0JDN2JvUThsRGlUKzdqb3ZmY1FIb29KbVIzVjl0dE5Q?=
 =?utf-8?B?RytRaGNBYnJKd2doTmZPdTJHYnFza0dSS1Boc0hya1BKOGZBdEJlVk9rTk5R?=
 =?utf-8?B?bktjMStpbmNRK2MzVEZJSSsrQ0hkalAvVjhGQmp3cW5NV1EvZU41aXpicEVQ?=
 =?utf-8?B?SzREdGVJNmlnQXo1RU9NOUtTOGVodUdYd01reDRYVTZiL2ZLb3U0K3IxT2M5?=
 =?utf-8?B?cnVueWFKVnJVRVRreWtxYzNINkVjM3lRZThURTNtTG5ubXhxWlNnK1JGWmZx?=
 =?utf-8?B?V3V3ODhUVXl1SjcwQWllaStXV3NaUzE3VzExMmc2OGhsS29LNmkwNERXYlBj?=
 =?utf-8?B?RG13S2dSYkJkZXpjbVgvcWFNSlZuY3FQSCtpOVJvRmdUZ213amhsSXRkcHBj?=
 =?utf-8?B?Y0pGUnEyYTNDRFRzSkVQQ2JJeGtGa0VDVmNHa2ZiY3B3eVFuS2F6Z01PR0Mv?=
 =?utf-8?B?VlhGYmVlVEN2YTd0L0dxQXpnSHgzREhQZVZRZnBVNVpOY3hQUHlicHlRZllX?=
 =?utf-8?B?Y0g1dTlCWDFKaVZxRjlRYWw0cG5DeUJ6bUc4T3BVdFpkWnp2QWQvRDV1Lysw?=
 =?utf-8?B?Z3ZWRXpxbmlEbzUwUmtVWUlZeDFzYmFubXduL2FObE5ESDM5Z2oxRVBTWlBS?=
 =?utf-8?B?VDRhYlhNbk01UEdNQ0llcjQwTFhjbjMyNDJjMnNxN2szNDJId3RGWnM3aGY1?=
 =?utf-8?B?S2pZM2M3eW1Bak5DcWJOVi9MaS9JVmpZSFo5VVNYRVZuMi8vU0pOUDdyZTE1?=
 =?utf-8?B?SSswYzdFdVF6UlVOTG9xMGV3ZHAyMy9JTnJaWlQ4T3RjeUw3QnJLWk5Hdmx4?=
 =?utf-8?B?SkZDR0FIcit5WTFnZ1VEa0YwSWYxZzI1UXJSRk82WjZqemR6TnBDaUhrTmlJ?=
 =?utf-8?B?YVBSK3c3aUhnVG13WnQ4ZTNlYXVKaXUvVVNCNHc5Y2w2UjZHZVJmUDFvSGs2?=
 =?utf-8?B?SWlRQmQvbVhYcnhVdExwNnV4SHo2R0ZPZUVDQjVsTkVOU01wU2JmcG4xZ3Nm?=
 =?utf-8?B?ZTUzdXVyalJvSWJMQ3lldm96UzF6eTl1VE1FK0V4M25aRWoyaTJxNTcxZnVF?=
 =?utf-8?B?VXJmSGRya1Y5cmJJdVk3VSs4VEdEYmZTSzhXRXVPdXZzU3l5Sy9oOFFBVk5F?=
 =?utf-8?B?bHFxL0R3UlJsL1dQbjQ3Y3ZwQ0Nrb2tVWThkZU9vczB2d3VHLzVaamkvS1pu?=
 =?utf-8?B?VktlRTJzbUVPTyt2Um1hSVB3eWV0SCtPSngya1hHSmVzVmxiRHZURmswTmlm?=
 =?utf-8?B?NkFxbVNvaC9SM0piQTdBZEpIbXVHS1RSR2pXY2wzRkx3ajUvbVNKajQvV0Fn?=
 =?utf-8?B?TElnbXpUSFYrNEs3MVBtT1RFTjNQVHhUejcvdUdpQnllTS82K01oN1EwaW9J?=
 =?utf-8?B?TnVSbGhLb1B1Ky9ES0M5QUJFaTRlMEJ2NWhiM3N6dTBGelFQaGN0clE4U3Bv?=
 =?utf-8?B?cGZJR3Yra1NZcHVORnpwMUN2TFdvS0RQdXFNanhiWDNBckh0WS9zRXVyVUFU?=
 =?utf-8?B?ZEVUL0c4Y2F0VTRUTkZJWUV1NXUzb0ZvcVJKbzd4a3VnUDRhVmI5RlVCTzF1?=
 =?utf-8?Q?JdMA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4474.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3418cbf-49d1-4a3f-2270-08dc73355f1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 10:13:44.5794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lsAQ8p6YYNtRjUIeX/uiKPgYd462AYiDt9uCcfCCPqFhgdi2hEphi1wvFPr7uvCjI2yjgvIjaYC6so4h/9wJAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR18MB6219
X-Proofpoint-ORIG-GUID: KsA8zPL_jDDjYsXWeaEqVZVr-uI-N1An
X-Proofpoint-GUID: KsA8zPL_jDDjYsXWeaEqVZVr-uI-N1An
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
Subject: [Linux-stm32] [PATCH net-next v7 2/7] net: stmmac: Add dedicated
 XPCS cleanup method
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
> Currently the XPCS handler destruction is performed in the
> stmmac_mdio_unregister() method. It doesn't look good because the handler
> isn't originally created in the corresponding protagonist
> stmmac_mdio_unregister(), but in the stmmac_xpcs_setup() function. In
> order to have more coherent MDIO and XPCS setup/cleanup procedures, let's
> move the DW XPCS destruction to the dedicated stmmac_pcs_clean()
> method.
> 
> This method will also be used to cleanup PCS hardware using the
> pcs_exit() callback that will be introduced to stmmac in a subsequent patch.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> Co-developed-by: Romain Gantois <romain.gantois@bootlin.com>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  6 +++++-
> drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 14 +++++++++++---
>  3 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index dddcaa9220cc3..badfe686a5702 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -361,6 +361,7 @@ int stmmac_mdio_unregister(struct net_device
> *ndev);  int stmmac_mdio_register(struct net_device *ndev);  int
> stmmac_mdio_reset(struct mii_bus *mii);  int stmmac_xpcs_setup(struct
> mii_bus *mii);
> +void stmmac_pcs_clean(struct net_device *ndev);
>  void stmmac_set_ethtool_ops(struct net_device *netdev);
> 
>  int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32
> systime_flags); diff --git
> a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3d828904db0d3..0ac99c132733d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7789,8 +7789,9 @@ int stmmac_dvr_probe(struct device *device,
> 
>  error_netdev_register:
>  	phylink_destroy(priv->phylink);
> -error_xpcs_setup:
>  error_phy_setup:
> +	stmmac_pcs_clean(ndev);
> +error_xpcs_setup:
>  	if (priv->hw->pcs != STMMAC_PCS_TBI &&
>  	    priv->hw->pcs != STMMAC_PCS_RTBI)
>  		stmmac_mdio_unregister(ndev);
> @@ -7832,6 +7833,9 @@ void stmmac_dvr_remove(struct device *dev)
>  	if (priv->plat->stmmac_rst)
>  		reset_control_assert(priv->plat->stmmac_rst);
>  	reset_control_assert(priv->plat->stmmac_ahb_rst);
> +
> +	stmmac_pcs_clean(ndev);
> +
>  	if (priv->hw->pcs != STMMAC_PCS_TBI &&
>  	    priv->hw->pcs != STMMAC_PCS_RTBI)
>  		stmmac_mdio_unregister(ndev);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> index 0542cfd1817e6..73ba9901a4439 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
> @@ -523,6 +523,17 @@ int stmmac_xpcs_setup(struct mii_bus *bus)
>  	return 0;
>  }
> 
> +void stmmac_pcs_clean(struct net_device *ndev) {
> +	struct stmmac_priv *priv = netdev_priv(ndev);
> +
> +	if (!priv->hw->xpcs)
> +		return;
> +
> +	xpcs_destroy(priv->hw->xpcs);
> +	priv->hw->xpcs = NULL;
> +}
> +
>  /**
>   * stmmac_mdio_register
>   * @ndev: net device structure
> @@ -679,9 +690,6 @@ int stmmac_mdio_unregister(struct net_device *ndev)
>  	if (!priv->mii)
>  		return 0;
> 
> -	if (priv->hw->xpcs)
> -		xpcs_destroy(priv->hw->xpcs);
> -
>  	mdiobus_unregister(priv->mii);
>  	priv->mii->priv = NULL;
>  	mdiobus_free(priv->mii);
> 
> --
> 2.44.0
> 

Reviewed-by: Hariprasad Kelam <hkelam@marvell.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
