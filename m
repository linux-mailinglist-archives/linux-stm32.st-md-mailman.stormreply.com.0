Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9103988BA
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Jun 2021 14:00:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27950C57B75;
	Wed,  2 Jun 2021 12:00:11 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 926DCC57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Jun 2021 10:18:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfXWcRvQA3OlENcxmCGK493dbM5o0qbV5YqzbAoKpe8qLUngeK1tnqa2hYvZQCtstVk8LgHxRUwdL7bZPAXWH4Qmoo62BhyGvomI1AG8PSLxsVJumW7nZLKSMkM+b2Ppq7Hjkn+jjGPoXI20Vn7n5+yLTYYbll5aOALZk6dK0GFiov36p9SjhXbJQ896I6PvGoJpTsUWctvmkOjT6cgFmb34B2u1IlMRgn+wwq2zoAcyQ9Tbepud0RMPAYc0EZSPqau9ztX2Kk78xr/kbE/GqYewuSVBqkaV9BQdFvTDx9/ATXbBqndyaW8gD970LLRRHti/mr3Es/edUDZEpJHSxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1jiXLTNKHtsVJvTHJF+LOE8sRibU18KXM63yzjE8aM=;
 b=Pn7JCsidYcIXfxpd97lB2ilOe+kS2FFiXmqmlJAp6kvkqKRVm/a8fHC5a9lyc9PFEErKS0Hq/ddKPDbAIDMuW9dCrwFYVh5TA+H6Ag2hWr0cZm9G+PUVAhTqmowaml8guHlHkmH9h6UnlZrqNTZUcXPvLMjS/2fIDETYKBWcZeheir52bAVNM7pjX6RD50nn1mGwTNp4qSQ7/r3BZkZz+uA+XVbhGgO37NJohVrWbPCI2PS/iabIiCcNRsOgjWk/7vmFzWcajCJEJmqm84VXqlZE5/R5zgUV2N5AeTk9EKQAjyrnsSozvd8+b0U1m8ICKNzbJScYOsYvdyAaHYim1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1jiXLTNKHtsVJvTHJF+LOE8sRibU18KXM63yzjE8aM=;
 b=lQef+Mwajocc0zeMNO7Xif6rY5mgAKmlRC0ErMkJOyb1T2MWsDWuecIOaLTZWrzRDz+dCi2iJZCnSHps138CcHwteFAf3WzcCj7pFI1koN92PfOjb36nSDNwj2Yr+EOqOMQXbhEwtVSfmMM/Ij7Ijaj6Snvnopepa4XYY/UXjCQ=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7934.eurprd04.prod.outlook.com (2603:10a6:102:ca::23)
 by PAXPR04MB8428.eurprd04.prod.outlook.com (2603:10a6:102:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 2 Jun
 2021 10:18:20 +0000
Received: from PA4PR04MB7934.eurprd04.prod.outlook.com
 ([fe80::1c99:498e:3e59:ea96]) by PA4PR04MB7934.eurprd04.prod.outlook.com
 ([fe80::1c99:498e:3e59:ea96%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 10:18:20 +0000
To: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
References: <20210601083813.1078-1-xiaoliang.yang_1@nxp.com>
 <20210601083813.1078-4-xiaoliang.yang_1@nxp.com>
From: Rui Sousa <rui.sousa@nxp.com>
Message-ID: <5d81bf51-6355-6b52-4653-412f9ce0c83a@nxp.com>
Date: Wed, 2 Jun 2021 12:18:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210601083813.1078-4-xiaoliang.yang_1@nxp.com>
Content-Language: en-US
X-Originating-IP: [88.168.142.79]
X-ClientProxiedBy: AM8P190CA0026.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::31) To PA4PR04MB7934.eurprd04.prod.outlook.com
 (2603:10a6:102:ca::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.28] (88.168.142.79) by
 AM8P190CA0026.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 10:18:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a443fcdf-a321-4f1b-57b4-08d925afbe95
X-MS-TrafficTypeDiagnostic: PAXPR04MB8428:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PAXPR04MB84289DDCB852B58577A10913E83D9@PAXPR04MB8428.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TMtNHZf5SGhVU6Fq7tLKcd1Ay/8VNVOtZQHfGAh7RFR49Z/446zSN9FxxPU1cl/BEIfhTjTlRX+NMKKsp2wZajHGVULfj3q2gbwnTK6Avj1NNIMZmXM7u4F/KvQxon3jIm/bmQkp7k8SnQUvwoJr4639p39u9JHVzaZdq6+2VuTb7piOv9d+ds/n81z4fjFz2TABy9QX1e5cKGEsSNghNpXMGnMOGe5w3ZqAWX2+5dMoH95XTAgpBV8jlN7GIUCJUx8v86fYTCAIq5o0G4SmcxsGTByy+ANiN+7+Ooyo0kIAYo48AeK3M43kQjmP1og8ZZ1hzB4U2pR+BxL4py3WRurCv9CtcwETjpsmbrowH0Kbhtm+KdviXRdBhNZ7gR+ZrisIdNRr61HQyS4C5zSms+oCmy78q57gAXHT2/0dlFCPLqW0siUit6YtssOB4ZY4W0z4hTLaRtsubVYm3hWqYj06/z2huIlKVlgIJlX4YnVTdJMkGdF2XGGE9ANZ/pn2eAOX/Vd3KTajIGbQFDA27ClSIFieFfruDE4fH9LKj0wVdOgcjtrpwiDQ82uUY6qm+ceILTIkzWMWpXcGs5FqZ3ATFyJ/X2NYGUhNBxSvx9Kq+74AFBgCJG4D52Zivf5O03iRQcQGjPBELyF5s5z86nbOYaXtTMi20yqa+/WbUS/d3LbL5qONDxIPnZhxvxC6bT+kqKqtJUYRZgekndmtVJNu19u7mpCX5e46987mzzud3yXDy6f7eU/kYVK3cVtv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7934.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(39830400003)(396003)(66476007)(66946007)(66556008)(6636002)(6486002)(83380400001)(44832011)(4326008)(2906002)(31696002)(15650500001)(8936002)(37006003)(38350700002)(38100700002)(16576012)(8676002)(956004)(6862004)(2616005)(34490700003)(53546011)(5660300002)(52116002)(508600001)(36756003)(26005)(31686004)(86362001)(6666004)(186003)(7416002)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZFo3UkxKNWJWaDVTK1Z3T0lOdnFpZ1o4eURGbU1NcXh4TjZpM0x6Y2RBR3pD?=
 =?utf-8?B?RC9CMDBDOXF6Q2Y4Rk5vNUZseG1HUnkvQk1VMis1eGVFQjNWaElObVBkTklO?=
 =?utf-8?B?aVp6WGZvQkZBZTNpQ2R2N3dMZXBnNlRDL1lZdThHQlkvNy9sR2VEZ1p3MUlu?=
 =?utf-8?B?eXlwSEdhMWUwbHUzeThHOXYrMnYxWm5pUzcva3k0K3JPK2k4bzFlMEt0WmJk?=
 =?utf-8?B?UFUzYVh1OVVHYy9TSjdzSHdxNENiclQ1N0VEbVpPb2FrQlpQNjM4R0tiNGxC?=
 =?utf-8?B?WVZWN0dtc09EQzFmN0hQdER0V1poOEZyeUNPQUsrZEpJcGhzbU1SSFp2MFNQ?=
 =?utf-8?B?cmRoZFlNRWM1cmVCZ2NXaFUzUldXd3REQUswZ0ZBNEMwZTlMU1U0aEE2dTVI?=
 =?utf-8?B?OE1FQjRGbmphRXFMS3haclg3c2N1U0VTaS9VclJqWlB3MVFJSU12OG5aeU5E?=
 =?utf-8?B?NVNLa1hna3V1NVVXNmZYL2FEZ01OVmE4TFlrUGVxMXpkV0N1VnBVeXlsaHdD?=
 =?utf-8?B?cG4wV0luMU5GM2xub3EzN0NISW9TNlVDRVNoU0RCSHBoT3hZUVlHNlliL2sy?=
 =?utf-8?B?WEZMZnZpWG5CWXBSNERGM2tMaENpMEU0di8rT1JFYnp2TSsyNUkzaWlPd1Mr?=
 =?utf-8?B?bndodXAxNjNGYUZQWXM3aGxIWUZWTHZ1bCsvM1oyYWRtT2dlSHF3Mk5VZmhk?=
 =?utf-8?B?VERrTE4wdVVrVUhUajBXVlowSktVdU9nUGN2STlJTnN3VTB6YU4yQjBhNnlz?=
 =?utf-8?B?VWt6RVQzNTVwdUltWkhrNDduQkVvMGtLQ0V2bDNkUEpyai9DL0tnU0NBeHE5?=
 =?utf-8?B?M2FRWk9CWHZvSjZiVXJ3SGZvVHE5VmxCV0V6bEpXWWRrM1crMkxhc2JEaDNH?=
 =?utf-8?B?SkZqVGNPaEFPS1pTOVlMYmIvNkpwY05SNG9qT3Z4b0dyaHpQMWkrK1Irc2dk?=
 =?utf-8?B?R1VzOUNuNUZIcXBKUzI4UTBnTDJYYmZjZkdhMHI3U3ZvajZRZDZoUWl0dUU0?=
 =?utf-8?B?U24yQUJ3R3Jla2luTTNXZEZ2NjM5bmZNdXZsWS96ZnlsdUN6Wi9kUW5TRE9X?=
 =?utf-8?B?MVUwV0tCWjB6QkcvQ2RtZnd3N3QwVDVuMHFESXRvTHJ6ZXZPY0lQUnJHVWNz?=
 =?utf-8?B?SENGUDVjVjZ0NWVaTWFxUzFlRjJvV3hGcTNtMlpyTFJTaUxkWE5rbWJNUEl1?=
 =?utf-8?B?N2FhcElMQlJReXJRYS8wVGJnMjdMc1Z2WVR5SXJ3L1RmTy9TdXRCRHpkOHlC?=
 =?utf-8?B?TkhBTk5FWVdsUzRqYnZZZU1qcFNsNTlGc2xOYWNBbitRSFhCY0lqczZJdTlv?=
 =?utf-8?B?NFhzQkZnM3RqSGdKeENnWjNwVkNLVUs1cEc0bnp5WHJtMEZGTDhPOEUyZGpP?=
 =?utf-8?B?MXMvNUlKQ3JzeTJITEwxYTdKMTlTaUJtMEdURk14OXFSL20vTWhBYW9aWnN5?=
 =?utf-8?B?NEpPQS9wMzUvbXVlU0w0MUduQ2hxSXQxV21zYzVHT1JXeEtnbWFLRDBpRUFZ?=
 =?utf-8?B?SkV2WWwzeVUyekh6cXkva0dZVGJqVjh6YjE5UjFPb0prUWJQenliZDBzRlFr?=
 =?utf-8?B?MWRyeUVRcVhYbHZlSDUyWFhJby9vSTNmWUtPeWVnWjdiWHp0VjZ6dXNNcERC?=
 =?utf-8?B?citLOWNrcVFxOUxjUHY0YlFPWmg1S0EyWDRMdUpIRlR3dEpmU0JGSlMzVENR?=
 =?utf-8?B?TERZcSt3b1VBek9VY3prclJ4aGIvMFdTOWJ6UFVlRnB4N0s3bTJnamdFSEoy?=
 =?utf-8?Q?D2HZJlYkRjZCwK3sK7RZvl9RAexv91s6uc5/vl+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a443fcdf-a321-4f1b-57b4-08d925afbe95
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7934.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 10:18:20.0143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jh566gqLtuKIB8anPxqD3qgS2/9pKbjLVugMp2hAv4m0LyjoLpGGbThYic2Hnenaa9JQk3ASa0wXpyTcyqjR3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8428
X-Mailman-Approved-At: Wed, 02 Jun 2021 12:00:08 +0000
Cc: joabreu@synopsys.com, qiangqing.zhang@nxp.com, alexandre.torgue@st.com,
 weifeng.voon@intel.com, davem@davemloft.net, vee.khee.wong@intel.com,
 netdev@vger.kernel.org, peppe.cavallaro@st.com, yangbo.lu@nxp.com,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com, vladimir.oltean@nxp.com,
 mohammad.athari.ismail@intel.com, mingkai.hu@nxp.com,
 mcoquelin.stm32@gmail.com, tee.min.tan@intel.com, boon.leong.ong@intel.com,
 kuba@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 net-next 3/3] net: stmmac: ptp: update
 tas basetime after ptp adjust
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

T24gNi8xLzIwMjEgMTA6MzggQU0sIFhpYW9saWFuZyBZYW5nIHdyb3RlOgoKSGkgWGlhb2xpYW5n
LAoKPiBBZnRlciBhZGp1c3RpbmcgdGhlIHB0cCB0aW1lLCB0aGUgUWJ2IGJhc2UgdGltZSBtYXkg
YmUgdGhlIHBhc3QgdGltZQo+IG9mIHRoZSBuZXcgY3VycmVudCB0aW1lLiBkd21hYzUgaGFyZHdh
cmUgbGltaXRlZCB0aGUgYmFzZSB0aW1lIGNhbm5vdAo+IGJlIHNldCBhcyBwYXN0IHRpbWUuIFRo
aXMgcGF0Y2ggY2FsY3VsYXRlIHRoZSBiYXNlIHRpbWUgYW5kIHJlc2V0IHRoZQo+IFFidiBjb25m
aWd1cmF0aW9uIGFmdGVyIHB0cCB0aW1lIGFkanVzdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBYaWFv
bGlhbmcgWWFuZyA8eGlhb2xpYW5nLnlhbmdfMUBueHAuY29tPgo+IC0tLQo+IC4uLi9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3B0cC5jwqAgfCA0MSArKysrKysrKysrKysrKysr
KystCj4gMSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFj
X3B0cC5jIAo+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3B0
cC5jCj4gaW5kZXggNGU4NmNkZjJiYzlmLi5jNTczYmM4YjI1OTUgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3B0cC5jCj4gKysrIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3B0cC5jCj4gQEAgLTYyLDcg
KzYyLDggQEAgc3RhdGljIGludCBzdG1tYWNfYWRqdXN0X3RpbWUoc3RydWN0IHB0cF9jbG9ja19p
bmZvIAo+ICpwdHAsIHM2NCBkZWx0YSkKPiAgwqDCoMKgwqB1MzIgc2VjLCBuc2VjOwo+ICDCoMKg
wqDCoHUzMiBxdW90aWVudCwgcmVtaW5kZXI7Cj4gIMKgwqDCoMKgaW50IG5lZ19hZGogPSAwOwo+
IC3CoMKgwqAgYm9vbCB4bWFjOwo+ICvCoMKgwqAgYm9vbCB4bWFjLCBlc3RfcnN0ID0gZmFsc2U7
Cj4gK8KgwqDCoCBpbnQgcmV0Owo+IAo+ICDCoMKgwqDCoHhtYWMgPSBwcml2LT5wbGF0LT5oYXNf
Z21hYzQgfHwgcHJpdi0+cGxhdC0+aGFzX3hnbWFjOwo+IAo+IEBAIC03NSwxMCArNzYsNDggQEAg
c3RhdGljIGludCBzdG1tYWNfYWRqdXN0X3RpbWUoc3RydWN0IHB0cF9jbG9ja19pbmZvIAo+ICpw
dHAsIHM2NCBkZWx0YSkKPiAgwqDCoMKgwqBzZWMgPSBxdW90aWVudDsKPiAgwqDCoMKgwqBuc2Vj
ID0gcmVtaW5kZXI7Cj4gCj4gK8KgwqDCoCAvKiBJZiBFU1QgaXMgZW5hYmxlZCwgZGlzYWJsZWQg
aXQgYmVmb3JlIGFkanVzdCBwdHAgdGltZS4gKi8KPiArwqDCoMKgIGlmIChwcml2LT5wbGF0LT5l
c3QgJiYgcHJpdi0+cGxhdC0+ZXN0LT5lbmFibGUpIHsKPiArwqDCoMKgwqDCoMKgwqAgZXN0X3Jz
dCA9IHRydWU7Cj4gK8KgwqDCoMKgwqDCoMKgIG11dGV4X2xvY2soJnByaXYtPnBsYXQtPmVzdC0+
bG9jayk7Cj4gK8KgwqDCoMKgwqDCoMKgIHByaXYtPnBsYXQtPmVzdC0+ZW5hYmxlID0gZmFsc2U7
Cj4gK8KgwqDCoMKgwqDCoMKgIHN0bW1hY19lc3RfY29uZmlndXJlKHByaXYsIHByaXYtPmlvYWRk
ciwgcHJpdi0+cGxhdC0+ZXN0LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHByaXYtPnBsYXQtPmNsa19wdHBfcmF0ZSk7Cj4gK8KgwqDCoMKgwqDCoMKgIG11dGV4
X3VubG9jaygmcHJpdi0+cGxhdC0+ZXN0LT5sb2NrKTsKPiArwqDCoMKgIH0KPiArCj4gIMKgwqDC
oMKgc3Bpbl9sb2NrX2lycXNhdmUoJnByaXYtPnB0cF9sb2NrLCBmbGFncyk7Cj4gIMKgwqDCoMKg
c3RtbWFjX2FkanVzdF9zeXN0aW1lKHByaXYsIHByaXYtPnB0cGFkZHIsIHNlYywgbnNlYywgbmVn
X2FkaiwgeG1hYyk7Cj4gIMKgwqDCoMKgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcHJpdi0+cHRw
X2xvY2ssIGZsYWdzKTsKPiAKPiArwqDCoMKgIC8qIENhY3VsYXRlIG5ldyBiYXNldGltZSBhbmQg
cmUtY29uZmlndXJlZCBFU1QgYWZ0ZXIgUFRQIHRpbWUgCj4gYWRqdXN0LiAqLwo+ICvCoMKgwqAg
aWYgKGVzdF9yc3QpIHsKPiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IHRpbWVzcGVjNjQgY3VycmVu
dF90aW1lLCB0aW1lOwo+ICvCoMKgwqDCoMKgwqDCoCBrdGltZV90IGN1cnJlbnRfdGltZV9ucywg
YmFzZXRpbWU7Cj4gK8KgwqDCoMKgwqDCoMKgIHU2NCBjeWNsZV90aW1lOwo+ICsKPiArwqDCoMKg
wqDCoMKgwqAgcHJpdi0+cHRwX2Nsb2NrX29wcy5nZXR0aW1lNjQoJnByaXYtPnB0cF9jbG9ja19v
cHMsIAo+ICZjdXJyZW50X3RpbWUpOwo+ICvCoMKgwqDCoMKgwqDCoCBjdXJyZW50X3RpbWVfbnMg
PSB0aW1lc3BlYzY0X3RvX2t0aW1lKGN1cnJlbnRfdGltZSk7Cj4gK8KgwqDCoMKgwqDCoMKgIHRp
bWUudHZfbnNlYyA9IHByaXYtPnBsYXQtPmVzdC0+YnRyWzBdOwo+ICvCoMKgwqDCoMKgwqDCoCB0
aW1lLnR2X3NlYyA9IHByaXYtPnBsYXQtPmVzdC0+YnRyWzFdOwoKVGhpcyB0aW1lIG1heSBubyBs
b25nZXIgYmUgd2hhdCB0aGUgdXNlciBzcGVjaWZpZWQgb3JpZ2luYWxseSwgaXQgd2FzIAphZGp1
c3RlZCBiYXNlZCBvbiB0aGUgZ3B0cCB0aW1lIHdoZW4gdGhlIGNvbmZpZ3VyYXRpb24gd2FzIGZp
cnN0IG1hZGUuCklNSE8sIGlmIHdlIHdhbnQgdG8gcmVzcGVjdCB0aGUgdXNlciBjb25maWd1cmF0
aW9uIHRoZW4gd2UgbmVlZCB0byBkbyAKdGhlIGNhbGN1bGF0aW9uIGhlcmUgYmFzZWQgb24gdGhl
IG9yaWdpbmFsIHRpbWUuClR5cGljYWxseSAodXNpbmcgYXJiaXRyYXJ5IHVuaXRzKToKYSkgVXNl
ciBjb25maWd1cmVzIGJhc2V0aW1lIG9mIDAsIGF0IGdwdHAgdGltZSAxMDAwCmIpIGJ0ciBpcyB1
cGRhdGUgdG8gMTAwMCwgc2NoZWR1bGUgc3RhcnRzCmMpIGxhdGVyLCBncHRwIHRpbWUgaXMgdXBk
YXRlZCB0byA1MDAKZC0xKSB3aXRoIGN1cnJlbnQgcGF0Y2gsIHNjaGVkdWxlIHdpbGwgcmVzdGFy
dCBhdCAxMDAwIChpLmUgcmVtYWlucyAKZGlzYWJsZWQgZm9yIDUwMCkKZC0yKSB3aXRoIG15IHN1
Z2dlc3Rpb24sIHNjaGVkdWxlIHdpbGwgcmVzdGFydCBhdCA1MDAgKHdoaWNoIG1hdGNoZXMgdGhl
IAp1c2VyIHJlcXVlc3QsICJzdGFydCBhcyBzb29uIGFzIHBvc3NpYmxlIi4KCj4gK8KgwqDCoMKg
wqDCoMKgIGJhc2V0aW1lID0gdGltZXNwZWM2NF90b19rdGltZSh0aW1lKTsKPiArwqDCoMKgwqDC
oMKgwqAgY3ljbGVfdGltZSA9IHByaXYtPnBsYXQtPmVzdC0+Y3RyWzFdICogTlNFQ19QRVJfU0VD
ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJpdi0+cGxhdC0+ZXN0LT5j
dHJbMF07Cj4gK8KgwqDCoMKgwqDCoMKgIHRpbWUgPSBzdG1tYWNfY2FsY190YXNfYmFzZXRpbWUo
YmFzZXRpbWUsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY3VycmVudF90aW1lX25zLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGN5Y2xlX3RpbWUpOwo+ICsKPiArwqDCoMKgwqDCoMKgwqAgbXV0ZXhfbG9j
aygmcHJpdi0+cGxhdC0+ZXN0LT5sb2NrKTsKCkhtbS4uLiB0aGUgbG9ja2luZyBuZWVkcyB0byBt
b3ZlIHVwLiBSZWFkaW5nICsgd3JpdHRpbmcgYnRyL2N0ciBzaG91bGQgCmJlIGF0b21pYy4KCj4g
K8KgwqDCoMKgwqDCoMKgIHByaXYtPnBsYXQtPmVzdC0+YnRyWzBdID0gKHUzMil0aW1lLnR2X25z
ZWM7Cj4gK8KgwqDCoMKgwqDCoMKgIHByaXYtPnBsYXQtPmVzdC0+YnRyWzFdID0gKHUzMil0aW1l
LnR2X3NlYzsKPiArwqDCoMKgwqDCoMKgwqAgcHJpdi0+cGxhdC0+ZXN0LT5lbmFibGUgPSB0cnVl
Owo+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBzdG1tYWNfZXN0X2NvbmZpZ3VyZShwcml2LCBwcml2
LT5pb2FkZHIsIHByaXYtPnBsYXQtPmVzdCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcHJpdi0+cGxhdC0+Y2xrX3B0cF9yYXRlKTsKPiArwqDCoMKgwqDC
oMKgwqAgbXV0ZXhfdW5sb2NrKCZwcml2LT5wbGF0LT5lc3QtPmxvY2spOwo+ICvCoMKgwqDCoMKg
wqDCoCBpZiAocmV0KQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5ldGRldl9lcnIocHJpdi0+
ZGV2LCAiZmFpbGVkIHRvIGNvbmZpZ3VyZSBFU1RcbiIpOwo+ICvCoMKgwqAgfQo+ICsKPiAgwqDC
oMKgwqByZXR1cm4gMDsKPiB9Cj4gCgpCciwKUnVpIFNvdXNhCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
