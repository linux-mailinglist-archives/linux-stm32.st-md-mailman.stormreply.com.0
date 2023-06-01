Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DC3719CC0
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Jun 2023 14:56:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59BDEC6A61D;
	Thu,  1 Jun 2023 12:56:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A136C6A617
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jun 2023 12:56:46 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 351AMR1m001514; Thu, 1 Jun 2023 14:56:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=JQ0kfx9VUWWYp2Ft7jhJJpojRruoIIXUVCJVyqkcl3w=;
 b=iyTeWPzelB4xvzqS0Mj3XisrB4s74iPUWvqEqm/RXN853fGlEOcqwXtNd523y9ZNWS9I
 K6S7APdseD6blX+7BwTW69LoHTIrzb3B/1CdmcXTrTR5HRSHZHG954nEWtr2rhR/bPm1
 NzbCnaVgUpU7xUVAJEIs+aU9xFDn17cQJU0+KYSTHnqoSaNEaI2QEWLkFZGM172N7KfC
 Yx0Q6dbY6aTwEmn4CRqya80B9ItASjeEVuE4KEP/ZtGXpyngs4x8IKiORUXUqp8eT4qp
 QynMy6y4GjkONCXbdY5voYQSnXZiGZOQsIjWMFRNSFFKmf225+Rw17kDB5l1Rp36ALXA HQ== 
Received: from eur02-am0-obe.outbound.protection.outlook.com
 (mail-am0eur02lp2235.outbound.protection.outlook.com [104.47.11.235])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qweqefyjv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jun 2023 14:56:18 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+GeA+qeAF0snGJPPD70e8VUl+mwBrGdjXnAH17CboDWZSTUF3rw91ipyJlXJQqy2g5d6CDZfbSWYUjgZ7u6Vpzw2mcUcV8bhegyNofhMrm6c1DYiQ4YF1PMnWNbbCEWtF/pqWXxV7teQaDhirmWTLKVW9CqoTl38tFLL/u3Wan9WBw5S2DbA+OLE2bT8U6PoN6x9YIY7KrAmYl4bdqqAAQovk6lrR2MobEd+jCZfAbJfdrEgVmOEPn9Qt8I3cTucPrss45oxdZkfL0h99DWP2oTN6ZzbcBlsTNWzrHmWg9rdExO7wXhs2svXPEGLg/1zA9GgayMYgOmIWG2AYaF6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQ0kfx9VUWWYp2Ft7jhJJpojRruoIIXUVCJVyqkcl3w=;
 b=kO9Al7xsCzLTbnY7IKRs0fgFvYVgSj0Pk+uDaknuJ1PJ/eXgRM8RUiuY8k1jAo3Yib69ipxklHRGi7gBD3UpwnP9zVPTEla/WpmS5KeMtykbXfTBNex7FhyxyfMxGbOWvTbzSxaMKPjNztSFpZNLKC/GHeeczd5Hsg9X/s5HKMMTqqcMsHbcG8cuZZhTdZos/q7gzlevQxmBy+X+uqku5Guu1yj6Pw2ol6yaSFyuqVVmrpH1CoOI0YMFptMFLvhzcRLIVuDvNcbZg3TpQZUjOaP+5PdHgLgZrImWX3K8sBFz1UD11F/W+WhJxHy7nrBxO1TUVj/4MVBziOdBN+jU3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:158::12)
 by AM7PR10MB3158.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:106::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 12:56:16 +0000
Received: from PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::624f:2b21:6c2d:b5bb]) by PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::624f:2b21:6c2d:b5bb%6]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 12:56:16 +0000
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
To: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Thread-Topic: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: Add missing detach
 mailbox for emtrion emSBC-Argon
Thread-Index: AQHZkuz842ysAt4Sc0yUqaQH1WPTlK911U/w
Date: Thu, 1 Jun 2023 12:56:16 +0000
Message-ID: <PAXPR10MB4718D37242FF00D47DF0CEF1F1499@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
References: <20230518011246.438097-1-marex@denx.de>
 <PAXPR10MB471850924065C987981634C1F14B9@PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM>
 <133c8b4a-8680-f613-807a-2d7931d0a186@denx.de>
In-Reply-To: <133c8b4a-8680-f613-807a-2d7931d0a186@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Enabled=true;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SetDate=2023-06-01T12:56:14Z; 
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Method=Standard;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Name=23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SiteId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ActionId=1051d88d-a910-4803-a975-0600bbf2fabc;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ContentBits=2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR10MB4718:EE_|AM7PR10MB3158:EE_
x-ms-office365-filtering-correlation-id: 6d18d6f1-d319-42df-62ca-08db629f9697
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EhskDccuBsiUd1H8j3LoruXRMmkZWSiPSGfBZJqx+X7Ooyq0asOVIg6iFwdDOSNeunmGe5wd5pyz4+5B/yj2QbG/lTlLl1tK2JZhorBcW6PTYfxyH/IXH/pyupjCGfIrzxm3HzBarr54/sJ+HlS0kxmg7h27gtLdm/SvECUnjrDOupKLM+AH9lQDMcJoJS1xr3S9wJABfcbpOG5l6gV+88yjbDPElCo6YLTNBeMgCjFad3S53YVroLs4zaYVSEC0cNTzkSN+1nrW4OGupE1j44qyZJETsnFWksOXUcwxJfUSvW8/0iB+YfL0BtfOIv6MLzoMuUOIwf0PKdpHZdRLJxdPu0ftUF8edAL3HDiWHsMFGehWVOM/DTQIztLSAu6L/9GH7DrJlm5O6z9jzZpas3WWSFfFL3fYBFh28K9nfoyfmkIaYxxalQ9GagxM23wu+w3CbbnAAalNNkR7Wu0Gnif2Nz5baGpsMzhITfXwhvrVinG4oGc9muek3UfpNyy76B3eDFzKjIoQwAl1GuMAMjmdq+I47t9TKNonBR/82YQDAGpQSA6eDPD5GPn0vnFwX5fDyXSSVa5onRSZlf6iV5isuh+S78I+60Vnm+A9Upo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199021)(38070700005)(38100700002)(122000001)(55016003)(33656002)(86362001)(7696005)(26005)(9686003)(6506007)(55236004)(186003)(53546011)(15650500001)(8936002)(5660300002)(8676002)(2906002)(41300700001)(76116006)(71200400001)(66946007)(7416002)(316002)(52536014)(54906003)(110136005)(4326008)(66446008)(66476007)(64756008)(66556008)(478600001)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFY4S1A1STBIYVpONTRWOEFVMWUreFZHRGg1VFYya2xReUF4NXkxc3lRTmZP?=
 =?utf-8?B?R3NWaTZTL1pxMnRaVzh4aHcrUHdCQkxCNU5MRTN2Mm9EZnpHQ2V5MDVYL0hJ?=
 =?utf-8?B?ZjBGenUvRTVPaHAxMm5XcUdMV09TYUMrdTZHR0FjVVJOcnZwLzdwWGJha2NF?=
 =?utf-8?B?ZFBEK2c0NHdDUkJsUG5RVm1DdEhIUEtwTVNpelRLcWloYk1BdHFobEQxNUFL?=
 =?utf-8?B?akx4YXFxdmdYbjZxVXdocVRrSTlXblUwU0IxNjlkQ3MxUTJKb1lhYUh0WS9V?=
 =?utf-8?B?UTlXWTVNRGluWEN0OGxzbGY1RHhpeGh4amE4OHMxZmZ1M2NyTDcwZ0JXWGds?=
 =?utf-8?B?aEdxemlaREtlMmFFcEtKamhJenFzUWx1dWVsMUtDRytPQlllMy8yaThMV3pV?=
 =?utf-8?B?NEdpU2tyNHhyR1RtVU5uK0pkWkxWSTA1TmhWWm5hb3U2WjU0YWlSbko5dkFM?=
 =?utf-8?B?QzJPTHlMaEpKVGFrN0hYc2E5OWI0RUpkeWhyYlRaRmYvcnN5STBtYkhBQi81?=
 =?utf-8?B?YmxYNmJ3M3ZZbGkwTXZJbFZDZWUyUFRhR3lacWljNXAvZXVLZDc1N1puMnpM?=
 =?utf-8?B?MWdtYmRVdnltZ3ZuWmRMNGV5U3BqY09tRGZpRnZmdGtlLzhWSU05OW4rWjN0?=
 =?utf-8?B?NFdHdEp2NUwwMUx1ODRxMTUvZnNaK0hXejF3Q0c1Z2FZbnFYT3NQQTFFazVa?=
 =?utf-8?B?elBreGVkN0NlQkNzc0lPOEViRXdlcTFWeUx2MGU1OUZFc005cHV5ZnhjUWpo?=
 =?utf-8?B?TFJnQ2ZnKzBBVzI0dVZObGlyeHNBR0ZZUGt6TzhMN0NXYmNTR3FDV2ZpRlRE?=
 =?utf-8?B?RmFIMlljdDJyRnVvWVF2RTM4RWY5YjNxZFRhbUNkMzJLK2FCNXZXSitPS3JD?=
 =?utf-8?B?Qi92NTVQM08xem9qeG82RHdDUnhJTVZTWEtyL0pSNGJmMVBEUkE5UUZPK0xy?=
 =?utf-8?B?QURVUmY3NGdJbXZ6YXZGYVJ1VkFZcnFXRG8yMk42U0JMMEhhQVc4cFhPNFF0?=
 =?utf-8?B?MTFoV0FQUVArRXhDRlE5dmI4dEhWeUJEYWsvUVR6aDBGMHgzT0c5d01uQTJP?=
 =?utf-8?B?cUhxLzhEUWJLUFVJMmdlM0pGZi9qRzgycXR4QmNuMmQwK0RIV0RiY3JMZUxz?=
 =?utf-8?B?WThRRVh3MmdhcWd3Y2k4L2hMSU1TUSs0T21zOFR6MlJUZ3BOdU14WHF5NFRM?=
 =?utf-8?B?WGIvNHVtSnE3RHpVK2JCZC85QnJIQWgwdHo1S3Uyc2oyVnI4enhpVHV5Ky9L?=
 =?utf-8?B?ZTArcXU0eTJiMnlGUkRLTzkySGlQcnJ6cjVmSTU4NGVIaFJnbmNaQWRmNncw?=
 =?utf-8?B?eThDcENjZ3g0SmhNNWY0WWoyWFJ4MURHZzRqaS96UDdLVlRFSlV1cWNuc2FV?=
 =?utf-8?B?OExkVjRrTVFOQVZtRXJMblp2c1puZ1daRjJOQytpbllwMVphdGN6cEZOWnhi?=
 =?utf-8?B?K0tQNTJpYzFMeUMycmNwY2VYQ2l2YTZwWllybDBodjdtU2ZwbXVxRzkwajhr?=
 =?utf-8?B?Wk5wN0dVcE1lWk9tdjVJM21MZXpqTzYyUHNDMzZybWZFWndNSllEeHY2M1RY?=
 =?utf-8?B?aEt3MHBQcjBtVnJiZmZoMGt3OWhHU3REcTZUSEJ2bUxCdTZWRUwxQXNJdU9Z?=
 =?utf-8?B?K05jcCtPR2kwZDNJby9JcFVwL1c0amdEQjlzZXp4MHdVYlZ6UG5zN2ZONXpD?=
 =?utf-8?B?dDF3TFNYNFNpa2J4RGhFZUZkdkZjcFRLN1drelowYlQ4N0k3Um0zcG5UWkpp?=
 =?utf-8?B?NTJURUpMZXpDUjFxamljYUNHVW5oWG82ME1Na2ZId0Z1YnlXSEVQTGprZSs4?=
 =?utf-8?B?RWREUHBiWmQvcjF6QnA0dWRRVlBaU21Zd0VTSFBzMVR4bllON0ZwQWxSaFdX?=
 =?utf-8?B?NHRCUVFoQ1VvcEJtcFdtLzM3NThnV3pIUXFja3NBdGEzUWM1bEpNWnJCbVg4?=
 =?utf-8?B?aHZXVW83Q0N4dWtlZjYwaGJ1UlZmKzVpODZFd3dFc1kxRUlia0JJYU0wWEN0?=
 =?utf-8?B?eVloRWlLRXVpOHpFYjVTZFdMR25tMSswSTl0VFZrZG1JUS8rQTZzbyt4S2dM?=
 =?utf-8?B?b3VpVWlURGphejMrcG44QWE2OUFWMmhhOG5ZOGlORzdDYU9nTnAybGp2WVk3?=
 =?utf-8?Q?U/CHvJK9DOiahU3gA4sM5vn/y?=
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR10MB4718.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d18d6f1-d319-42df-62ca-08db629f9697
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 12:56:16.8346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mbdnEkS/VI8r+7pEK6gmZf4IR1TMA6GGluQQ0WU+ydm4bVDIf8y+d2VwjiwRxqXNcVAuEVjWYXyGER0gz0j2aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3158
X-Proofpoint-GUID: d9Y-9nBdUMLI8GjIlz1SuYPyn_V4CzL_
X-Proofpoint-ORIG-GUID: d9Y-9nBdUMLI8GjIlz1SuYPyn_V4CzL_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010115
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




ST Restricted

> -----Original Message-----
> From: Marek Vasut <marex@denx.de>
> Sent: Tuesday, May 30, 2023 1:51 PM
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
> On 5/30/23 10:43, Arnaud POULIQUEN wrote:
> > Hello Marek,
> 
> Hi,
> 
> > ST Restricted
> >
> >> -----Original Message-----
> >> From: Linux-stm32 <linux-stm32-bounces@st-md-
> mailman.stormreply.com>
> >> On Behalf Of Marek Vasut
> >> Sent: Thursday, May 18, 2023 3:13 AM
> >> To: linux-arm-kernel@lists.infradead.org
> >> Cc: Marek Vasut <marex@denx.de>; devicetree@vger.kernel.org; Conor
> >> Dooley <conor+dt@kernel.org>; Krzysztof Kozlowski
> >> <krzysztof.kozlowski+dt@linaro.org>; Richard Cochran
> >> <richardcochran@gmail.com>; Rob Herring <robh+dt@kernel.org>;
> Maxime
> >> Coquelin <mcoquelin.stm32@gmail.com>; linux-stm32@st-md-
> >> mailman.stormreply.com; kernel@dh-electronics.com
> >> Subject: [Linux-stm32] [PATCH 1/5] ARM: dts: stm32: Add missing
> >> detach mailbox for emtrion emSBC-Argon
> >>
> >> Add missing "detach" mailbox to this board to permit the CPU to
> >> inform the remote processor on a detach. This signal allows the
> >> remote processor firmware to stop IPC communication and to
> >> reinitialize the resources for a re-attach.
> >>
> >> Without this mailbox, detach is not possible and kernel log contains
> >> the following warning to, so make sure all the STM32MP15xx platform
> >> DTs are in sync regarding the mailboxes to fix the detach issue and the
> warning:
> >> "
> >> stm32-rproc 10000000.m4: mbox_request_channel_byname() could not
> >> locate channel named "detach"
> >> "
> >>
> >> Fixes: 6257dfc1c412 ("ARM: dts: stm32: Add coprocessor detach mbox on
> >> stm32mp15x-dkx boards")
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> ---
> >> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> >> Cc: Conor Dooley <conor+dt@kernel.org>
> >> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> >> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> >> Cc: Richard Cochran <richardcochran@gmail.com>
> >> Cc: Rob Herring <robh+dt@kernel.org>
> >> Cc: devicetree@vger.kernel.org
> >> Cc: kernel@dh-electronics.com
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Cc: linux-stm32@st-md-mailman.stormreply.com
> >> ---
> >>   arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
> >> b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
> >> index b01470a9a3d53..82061c9186338 100644
> >> --- a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
> >> +++ b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
> >> @@ -366,8 +366,8 @@ &iwdg2 {
> >>   &m4_rproc {
> >>   	memory-region = <&retram>, <&mcuram>, <&mcuram2>,
> <&vdev0vring0>,
> >>   			<&vdev0vring1>, <&vdev0buffer>;
> >> -	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
> >> -	mbox-names = "vq0", "vq1", "shutdown";
> >> +	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
> >> +	mbox-names = "vq0", "vq1", "shutdown", "detach";
> >
> > Why do you want to add the detach mailbox?
> > It looks to me here that you want to clean the warning message, right?
> 
> Yes
> 
> > The detach is used in a particular usecase where the main processor is
> > shutdown while the coprocessor is still running.
> > I would prefer to not enable it by default as it need a specific
> > coprocessor Firmware.
> 
> Why is it enabled by default on ST boards and left out on all other boards ?

Mainly to be able to test the feature on the K2 board . And ensure that the generic
Implementation proposed was compatible. We do not provide demo in the ST
Distribution. Remove it could be an option, but this could ipact legacy some M4 firmware.
 
> 
> Surely the ST evaluation boards can load and run both types of firmware,
> ones which do use the detach mailbox and ones which do not use the detach
> mailbox , right ?

Yes,

> 
> I assume that if the firmware does not use the detach mailbox, then the
> detach mailbox is just ignored and unused, so there is no problem with
> having it described in the DT in any case ?

Yes, The aim of the ST evaluation board is to provide a DT  to a support
different firmwares for demo and tests.  But it is not the case of all boards...
If your boards provide demo using the "detach" it is justified.
If you just add it as a workaround to mask the warnings, you just mask the issue.

> 
> And if that's the case, then I would much rather prefer to have all the boards
> describe the same set of mailboxes, so they don't diverge . What do you
> think ?
> 

I would avoid this.  It is only a configuration by default for current demo.
The allocation depends on the firmware loaded on M4, so depend on the project.
For instance, a work has started in OpenAMP community to implement the vIrtio Services
For the IPC.  Each virtio services would be associated to one or several mailbox
Channels.  In this case we would need to arbitrate allocations.
The result could be that we propose a virtio channel for rpmsg + some other virtio.
More than that we probably manage the mailboxes in sub node
Here is an RFC on the topic (https://lore.kernel.org/lkml/20220920202201.GB1042164@p14s/)

That said, fixing rpmsg virqueue and the shutdown mailboxes in the  SoC dtsi, seems reasonable as it
provides the default expected implementation.
Do the same for the detach that is optional and mainly unused, I'm not fan.
Adding the detach mailbox in the DT to mask a warning issue, I'm rather against it

> > Rather than adding unused optional mailbox, I will more in favor of
> > having a mbox_request_channel_byname_optional helper or something
> > similar
> 
> See above, I think it is better to have the mailbox described in DT always and
> not use it (the user can always remove it), than to not have it described on
> some boards and have it described on other boards (inconsistency).

Adding it in the DT ( and especially in the Soc DTSI) can also be interpreted as
"it is defined so you must use it". I would expect that the Bindings already provide 
the information to help user to add it on need.

Regards,
Arnaud
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
