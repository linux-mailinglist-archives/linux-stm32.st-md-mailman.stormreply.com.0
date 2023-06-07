Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFECD725B17
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 11:53:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C9AEC65E70;
	Wed,  7 Jun 2023 09:53:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D684C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 09:53:55 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3577Pig0013505; Wed, 7 Jun 2023 11:53:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=nnkgZDlRBZOm2JqUt3Fnjz4xBDr6P5ZpTSYDch0XxEg=;
 b=vgKKA/VaMzl035Zclz6xxeG3iTQcttZdkP83a/tpHPWrw6x/tQ53jpxIC/Y5AmtZ9if3
 8t3F1PzdJk7LB997kwaeOxPmSnRjw+sjZqIcvXTP5KDP4Bsx4CMQUH3JuEkvSk7N1idB
 FCPVJZC7Uv3GIajg+MYeeIvFNuNSA2aPpbQyp2358R+ihqncUfOqzOTUqCjXaSSoKTVo
 4JBxhKCHQR/dXUDZKzAwUOlFJERvw4IV8Jpp384m9yqJdVtXojThBCsCMf3P60CwHeC9
 TA5bHcEoxk7uUiQIBfB0aYBEn6X1Gn2awVsiW45d4m5W3rb0XJBS4VXOTrtj8oUOmWxd kw== 
Received: from eur02-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur02lp2049.outbound.protection.outlook.com [104.47.11.49])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r2a7u50k7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jun 2023 11:53:28 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZ+4I83cwztldmApf16TEuLcU7mt/7jmCUEeRmEG6cTzRh9UqeNnpC4CSACKQ73rdxpeDLTh9I2C1Pa4y5RhH46LECycpyS25R6RDY3lACyWiubGDJuOXLWPDjTjqt3q6YguhvlwL34upA/5UFwK5fqH92YwYqQbISnvph1EPqjyaO8hdoshZIn25bFI0o22NARa2FQYQhBzTbIGG6qHo8ITZ1CiGZjyCYgshjwUhSZK6R4vt9Q6Yv0nSx3Z1mRGaxEPTwWZybYqcS7ayp/lojuB4rV8UDAJmnwyG7RVoAEGXYtcPCaTecxYBRjFPxc9A/Qspxmuwdop1QzIGDWGYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnkgZDlRBZOm2JqUt3Fnjz4xBDr6P5ZpTSYDch0XxEg=;
 b=Y+1N6c5gksbCUUxClGUOCHD/j3CGgBehj4BcUdMAUY75F327pPUxUSziUDhnA1bjwi0r+x6O+tQvpKr+NXXU9j+owXP8jskEIFJOVUxhgE+Ja3FCW+PTmOAR06i350U1VQEkHKQBiyQ8ItZHleT/CxoKZ0niS237EiquMeDi938xqCuL6JOnqtPoKT26wn3XyVrhf7PRbXKM/w2Sa3U7Be9ewJK5vRJ6sHrcChFaWLWFKKSyWg2mzZSemvTz3NGfZr/XdJzsbl4mtv9GpV2s/+bUIK4arO3gChbeHotZ0ALyepXoNTH1lkjgNJSRLNK135ib6xRvwJ8g4gNMD15PXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:158::12)
 by PAVPR10MB7138.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:314::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 09:53:25 +0000
Received: from PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::624f:2b21:6c2d:b5bb]) by PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::624f:2b21:6c2d:b5bb%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 09:53:25 +0000
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
To: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Thread-Topic: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: Add missing detach
 mailbox for emtrion emSBC-Argon
Thread-Index: AQHZkuz842ysAt4Sc0yUqaQH1WPTlK911U/wgAD6pYCAByfNcIAAGvgAgAD+oKA=
Date: Wed, 7 Jun 2023 09:53:25 +0000
Message-ID: <PAXPR10MB4718E8CE58A881DAE3983A27F153A@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
References: <20230518011246.438097-1-marex@denx.de>
 <PAXPR10MB471850924065C987981634C1F14B9@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <133c8b4a-8680-f613-807a-2d7931d0a186@denx.de>
 <PAXPR10MB4718D37242FF00D47DF0CEF1F1499@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <81f4574d-38c2-21f2-b947-d13e5fc99c60@denx.de>
 <PAXPR10MB471825B145645894D626F070F152A@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <0d304968-74c8-47ce-f87a-127449f36f4b@denx.de>
In-Reply-To: <0d304968-74c8-47ce-f87a-127449f36f4b@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_Enabled=true;
 MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_SetDate=2023-06-07T09:04:31Z; 
 MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_Method=Privileged;
 MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_Name=cf8c7287-838c-46dd-b281-b1140229e67a;
 MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_SiteId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;
 MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_ActionId=6fd8ac40-ddf9-40dd-b167-f6c44297805a;
 MSIP_Label_cf8c7287-838c-46dd-b281-b1140229e67a_ContentBits=0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB4718:EE_|PAVPR10MB7138:EE_
x-ms-office365-filtering-correlation-id: 65ce8bf8-eecc-43c7-e5a3-08db673d09bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ilI2dSLXLmxhaoQqFJin8IXKfkhkKMcGmbmtGHarJ/9vdhV9GJY1CiEXB5KsHuL1bmtoRc1T7J913g/avXiFab7FrXAiNilO58JARnxr+3BEn8cqLTSekHXroYSETv4xjcW65NrC+TFWlJFpG9/smU/F+ybLzx1wLG6vz4bZtx/HNfbejJX+sLmxnW5jcK5JbV32HYoUoG+9pQaEwdgsFaObkb6YDFXsFjgnq6ugwUctDaU0b5VI3Gci2DnpDK4HNIBac5bFNcz90cF7D3oulwcI531XKRHocu4Vssi1iaddya0i9p+bd3dVFxPdvw+NPT7Aa8NtWxTThgrZIvpsrA75r8X6s3gTtAihmf1goG+U4xZWvAkidEAUEQ1z+oBGQ/pFX60o3SeOMNdrKplH4e8B14ntCZRY7eDCymxDcmq5halVaq+0I8vE0xwpBG2TJt/V7z2layNOLxeI14FH9xzGa1aHOPkyKWbZwO9wS4WJYGFpYzQQaym7c9vWOk72My1b+XeoQlUyreX7P9VFtDG3muVHzQZas00BQ2dEyVhQDy0QpyUfHcFE+qX3pGo5kS0Fi4xFO4l2sMTtiO5fr3+mui4GHhwaLm9dDzexauSC3K6gvqL7m08bSqyrkmtN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199021)(2906002)(83380400001)(38070700005)(33656002)(86362001)(38100700002)(122000001)(55016003)(53546011)(7696005)(316002)(41300700001)(52536014)(5660300002)(110136005)(8676002)(54906003)(8936002)(478600001)(66946007)(66446008)(66476007)(71200400001)(4326008)(76116006)(66556008)(55236004)(6506007)(26005)(15650500001)(9686003)(186003)(7416002)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3MxRW0xVkVFOXUvUm9HRXE2MG1vTE9hZXlvUHozTWVzQ2g3dm82bmZXaTQz?=
 =?utf-8?B?Nmg3Z0dCYXMyeXhhWklLYUhXdFpkc3g3bmY4RUtySVpQTitMamdjbGNWRTZO?=
 =?utf-8?B?M3NraEVKZ2F5ZUo2NkJ5dmNOVlJJM2RPUXNZYlExQXRHLytmakp1cm1vMVJt?=
 =?utf-8?B?M1BwcWl4dXQ3YmJHT1JqaFptdHBITEg1SFZhS3lNM0NNWnU0OTlWWGtjcWty?=
 =?utf-8?B?KzlGUmVaZzdHM2dCSFA3dC8wZkh1QjM1OEpFSHlTSnlteGhMbC9icGp6ck05?=
 =?utf-8?B?TFVYYWJKZXNuOWhWaFdEdkdZT2NZcTdZZVZHVk5DVjdXa0Y3Q0piRFcvbVM3?=
 =?utf-8?B?OGJRbjVwSTdoQkwyR2FoNUxvTlFVcXB6VU9ZSVF5U0I4YUEweWtmQmd0cllF?=
 =?utf-8?B?Q1RobkZuQVBiLzZkUm5kY1FnNVVMYnpBTEpHdjB3Y2Y4dzR4OTBWZTZNZy9i?=
 =?utf-8?B?R0EraWFXRnh0amxvaUNXVHNla0orVXROcitGYThNOTdUQjEzRjQ1Z2p6VUNO?=
 =?utf-8?B?VjYzTlJ3SENLMGJYRWhsOTdyeVdQcHZjUm8zbTE1dXhjSTNDVXQzcHFaNlpy?=
 =?utf-8?B?eFI2V0tEUmZiM0wrU0h3RHRabk1uUTc3U2lEbmFOUzJKUXdTMldmbElRWGNx?=
 =?utf-8?B?U3hKYitnZytOb0g4aVlFSWc2TTJDM2xqN0ZEQ0FnaUhQL2lXSlpLK3JkSThj?=
 =?utf-8?B?a1FQRVdEaS9KYWp6N3kwNHowRGNBcjRyVVZMMTFnODI0TTA1OGxnbWJjNGZ6?=
 =?utf-8?B?YmVvc1lrUHBHOVljYjgzbC9MN2o2QUJJUUFLS1NhS0krSm8xYkdBZ0ZVLzlW?=
 =?utf-8?B?UU1NZWpsR0t0U3o4VUNxdmZlbytNeVIyWHlVbG5PeTcyMVVUcXFnbHd4dWVV?=
 =?utf-8?B?QXJiZ2RxR0dIckx5VzBEbTJUL2k5ZkZQand1SXZlbDc2em11U1FPS1pTRU1R?=
 =?utf-8?B?RjJVOU1IWWpLSDdrUG9xM0RnU09YUE1VZlNXbjE3Tk5Tcm5Rb0FFNFFQQU85?=
 =?utf-8?B?WmJmK0VqZHRndXpvYlkramN4WWpZdTRPQUIvR21jUklva21CMyt5YlVUM1pm?=
 =?utf-8?B?ai9CaTFIQXFUQVNrZDdaeUt2VkhjTk1GWlN5eDRaRGtaUGF1aEhzSkVYOEl0?=
 =?utf-8?B?YzFpanVBaFF1b1VxY1J1Q2d6NnpacTRZc3pHckZDTS85RTh5MTZxUHhkc0lx?=
 =?utf-8?B?b0VOOXlQWWhpdDNaNWtuRjZiVXNjaDZzMVFwVktFZktwajd2V1JRMVVuMU9F?=
 =?utf-8?B?OE5WR3lNTS8rLzdjK0xoYVlpeVVPRWdFc0J6S3VUelhqNy9ZYzdwWnhFN0NM?=
 =?utf-8?B?U2lxcDVpSERDOXpxL0RqVkF0aDBoWVlscm56YnFKNVhubE96SGE4YkVuWVB3?=
 =?utf-8?B?WWNPUWIxR2UwS1h4S1ZWTjJ6SnpJRU9tbXFUTG9CWFJSblRobFVLVC9hVFR6?=
 =?utf-8?B?eXpidFFGcERtZWdzL1J5WmFldXlFRHNKakhOdjc5Yys0VG5HOVZ2aWFBWWpQ?=
 =?utf-8?B?RjJsY0VxVTVtMnJuUFBjQjZ5amxsWFVJSlp1Ri96cVp6YUlZZmpUUnBCdHZy?=
 =?utf-8?B?NmtqczFyQStoM3ljdklrL0w2NkRHemxJcGxnR3NObUFoRG9aZ3kyT3VVb3RO?=
 =?utf-8?B?dkNhV3M4QUt2UW12ZWlxWEVXL1NLOXBFdU5LL1hIVUhhUGVyYlY5N3lKbmdo?=
 =?utf-8?B?WXg1cS9jVGRjNmdSQXhkU3hqSlQxekxaN3V6cFVZakFTMklIVzdjZlVBMTdI?=
 =?utf-8?B?MzVJMmlydEtFbXpNMjYxYUU2N1FwRUQrb2tqbmZseENBQjNLV0lQMXhmK0Rm?=
 =?utf-8?B?eDlQK0lDdmp0akkyK1ZFYkxPU1Z6QlMyeWs0ckhmdUVhTlQ2RmNNb2UzYmJu?=
 =?utf-8?B?T0RWRlhjMDljOVRBTmV2dHJpcTJ4QTdQZ2QwMStQTDFmaXQ0aHFhOWVKbm5F?=
 =?utf-8?B?R0QyOG9DeFpYeVFTamFES2NTb1JKVTczVXg4QlZrVHVvbExKU3IwZkZiSHlp?=
 =?utf-8?B?bmlyczNCVzBoSlVQMUl2b0NrVXg4VmlUMFdQSkdsamFid29RU05Yc3JldXE5?=
 =?utf-8?B?ZGVJZzZiOUNUeGtVYmVsNTFSaVFZbU5RTTlpb1ZMT09ocnpyOC8wUWR5c2h6?=
 =?utf-8?Q?UL9vWea4QActmWlTBdjWI3jzj?=
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ce8bf8-eecc-43c7-e5a3-08db673d09bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2023 09:53:25.6966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: napYM6jgQX/BKG9dA/a2+N3fhx5fSQJcxhoIWw2ybauT/YOzFD+DRhO+xJz0B4bL+WXDLCDw7cZCKCFFnXdrZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7138
X-Proofpoint-GUID: V6QIhxVs1JrD7a0lhDRaSwLtXbwbwW6x
X-Proofpoint-ORIG-GUID: V6QIhxVs1JrD7a0lhDRaSwLtXbwbwW6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_06,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306070079
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "kernel@dh-electronics.com" <kernel@dh-electronics.com>
Subject: Re: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: Add missing detach
 mailbox for emtrion emSBC-Argon
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



> -----Original Message-----
> From: Marek Vasut <marex@denx.de>
> Sent: Tuesday, June 6, 2023 7:28 PM
> To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>; linux-arm-
> kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org; Conor Dooley <conor+dt@kernel.org>;
> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Richard Cochran
> <richardcochran@gmail.com>; Rob Herring <robh+dt@kernel.org>; Maxime
> Coquelin <mcoquelin.stm32@gmail.com>; linux-stm32@st-md-
> mailman.stormreply.com; kernel@dh-electronics.com
> Subject: Re: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: Add missing detach
> mailbox for emtrion emSBC-Argon
> 
> On 6/6/23 18:21, Arnaud POULIQUEN wrote:
> > Hi,
> 
> Hi,
> 
> >>>> I assume that if the firmware does not use the detach mailbox, then
> >>>> the detach mailbox is just ignored and unused, so there is no
> >>>> problem with having it described in the DT in any case ?
> >>>
> >>> Yes, The aim of the ST evaluation board is to provide a DT  to a
> >>> support different firmwares for demo and tests.  But it is not the
> >>> case of all
> >> boards...
> >>> If your boards provide demo using the "detach" it is justified.
> >>> If you just add it as a workaround to mask the warnings, you just
> >>> mask the
> >> issue.
> >>
> >> Then it seems there is no issue with the boards modified here,
> >> because as far as I can tell, those are all general purpose SoMs and
> >> evaluation boards. With such systems, you cannot predict what the
> >> user would like to use those for, that could include whatever ST demo.
> >>
> >>>> And if that's the case, then I would much rather prefer to have all
> >>>> the boards describe the same set of mailboxes, so they don't
> >>>> diverge . What do you think ?
> >>>>
> >>>
> >>> I would avoid this.  It is only a configuration by default for current demo.
> >>
> >> That current demo is restricted to ST produced boards only, or can it
> >> also be run on development kits manufactured by other vendors ? I
> >> think it is the later, and I don't see why those should be kept
> >> out.[]
> >
> > ST Demos are boards dependent.
> 
> I was under the impression those demos can be built from this CubeMX stuff
> for any board, all you need is the CubeMX BSP ?
> 
> [...]
> 
> >>>>> Rather than adding unused optional mailbox, I will more in favor
> >>>>> of having a mbox_request_channel_byname_optional helper or
> >>>>> something similar
> >>>>
> >>>> See above, I think it is better to have the mailbox described in DT
> >>>> always and not use it (the user can always remove it), than to not
> >>>> have it described on some boards and have it described on other
> >>>> boards
> >> (inconsistency).
> >>>
> >>> Adding it in the DT ( and especially in the Soc DTSI) can also be
> >>> interpreted as "it is defined so you must use it". I would expect
> >>> that the Bindings already provide the information to help user to add it
> on need.
> >>
> >> Why should every single board add it separately and duplicate the
> >> same stuff, if they can all start with it, and if anyone needs to
> >> tweak the mailbox allocation, then they can do that in the board DT ?
> >> I really don't like the duplication suggestion here.
> >
> > I was speaking about "detach mailbox. Here is what I would like to
> > propose to you
> >
> > 1)  move all the mailbox declaration in the DTSI except "detach"
> > 2) don't declare "detach" in boards DTS ( except ST board for legacy
> > compliance)
> > 3) as a next step we will have to fix the unexpected warning on the
> >     "detach" mailbox.
> 
> Why not make the mailbox available by default on all boards ?

It has been introduced mainly to test the detach feature,
on a second platform to help remoteproc maintainers for the review
process. But the feature is not fully implemented on stm32mp1
( auto reboot of thye M4 on crash, appropriate resource table clean-up,...)
I would prefer to remove it in ST board DT than add it in the DTSI.
That said as mentioned for legacy support, better to keep for ST board.

> 
> As far as I can tell, if the software is not using the detach mailbox, there is no
> downside, it would just be unused. User can always remove it in their DT if
> really needed.

The inverse it true, User can add it in their DT if really need.

> 
> I believe once can build demos using the detach mailbox for boards with
> stm32mp15xx not manufactured by ST, correct ?[] 

Everything could be possible...
Once can want to replace the shutdown mailbox by the detach. 
Once can also build demo using the detach mailbox channel for another purpose.

I quite confuse why you insist to declare this detach mailbox in the DTSI?
Is there a strong constraint on your side?

Regards,
Arnaud

> 
> [...]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
