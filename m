Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6C33AA22A
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Jun 2021 19:12:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 345B5C597AE;
	Wed, 16 Jun 2021 17:12:12 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60073.outbound.protection.outlook.com [40.107.6.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52798C58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Jun 2021 17:12:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mn2MwcGKWko3olNzqYzRP1vzQWoTwgp8pqhFMMghsMIa5RhGP2gR0lw7ELs/qeE0j+r/esDpniR1udvg+4JL0aiBzrq9eLKs9bYmCUHTWW6g61TXpFxqrLy2YQi1wDpQAvJ0G+I4lp79Zq93ZeMdm23WPrjz6A8qqM0bM3t280frCFmUVUzrkHUxUmCOtU/xdXCIikVEj1YXxAwga8CZ7yzXWOKqaKn3/fWMBBA0+tqgp/vPw8m8bNzPdydiz48I0biyU3pDC9ZKfHvKHVF/x98HUIavCh0N49eWinLN+hTEp7zhQs6zCahXKo3itK7JV1Maqaj328NdwkRCxqLBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Admmg5eUVdaS0UI9zhs+Xap9sIVkCINJROFvudfIFp0=;
 b=nuLSskziK6Yd4vzI+Nnhasn/0Gx+9tOXaHQTNGFSlSEtZ1bhfhZjPJ2oc6+CygLrocf70pyPXK2MiGmQAs8V+zyvHDqBmW/ROsY2dzD7V46qlhD6wafhm8MgM6Eb4ywQE8yEVBICXkFoTymkQNOtBdJtkHshSqgvmELvJzRjQzMudovmtwc0CYg6VESUDhqjbBWqzsEQhfWYcck+Qw9AoAyaKyOBc+9rhHhgrfGhd1DRaw89pivTFAHAQ8tT4vy0NUb/e54V9TOv3ia1K0DDxK7ICLbx30b00UKEGp1oSGGYyh6x3IUyVnPbl6tF6Ohuis5BeNuM+EX+tgSnuXmUKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Admmg5eUVdaS0UI9zhs+Xap9sIVkCINJROFvudfIFp0=;
 b=OP3ko2H3eKdZkMYfMwymfNnVUQwqtMzJ4Lu7MLeN9ek07nfwrsOG3lg0ZsOID8BTxEui4FAYpblfmAfQ8rOGj8mPoNxIC5NUMTUEv4R5nhI8EC3F3Cwju0bbNW4axu4uB36YXsYFemBcj6ubJRXc78qZ/94eVHbUmDbs+ECLNio=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7934.eurprd04.prod.outlook.com (2603:10a6:102:ca::23)
 by PAXPR04MB8143.eurprd04.prod.outlook.com (2603:10a6:102:1c4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Wed, 16 Jun
 2021 17:12:10 +0000
Received: from PA4PR04MB7934.eurprd04.prod.outlook.com
 ([fe80::cd49:b79:2a9d:3b7c]) by PA4PR04MB7934.eurprd04.prod.outlook.com
 ([fe80::cd49:b79:2a9d:3b7c%6]) with mapi id 15.20.4242.019; Wed, 16 Jun 2021
 17:12:10 +0000
To: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
References: <20210601083813.1078-1-xiaoliang.yang_1@nxp.com>
 <20210601083813.1078-4-xiaoliang.yang_1@nxp.com>
 <5d81bf51-6355-6b52-4653-412f9ce0c83a@nxp.com>
 <DB8PR04MB5785F472AC4F8ED66B9E128CF0369@DB8PR04MB5785.eurprd04.prod.outlook.com>
From: Rui Sousa <rui.sousa@nxp.com>
Message-ID: <358c70d1-f472-8eb1-c07c-823ba1074c60@nxp.com>
Date: Wed, 16 Jun 2021 19:12:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <DB8PR04MB5785F472AC4F8ED66B9E128CF0369@DB8PR04MB5785.eurprd04.prod.outlook.com>
Content-Language: en-US
X-Originating-IP: [88.168.142.79]
X-ClientProxiedBy: AM3PR03CA0072.eurprd03.prod.outlook.com
 (2603:10a6:207:5::30) To PA4PR04MB7934.eurprd04.prod.outlook.com
 (2603:10a6:102:ca::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.28] (88.168.142.79) by
 AM3PR03CA0072.eurprd03.prod.outlook.com (2603:10a6:207:5::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Wed, 16 Jun 2021 17:12:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71811e0c-7ec2-466f-fd28-08d930e9e071
X-MS-TrafficTypeDiagnostic: PAXPR04MB8143:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PAXPR04MB814385ADAF6BA77D71313DEDE80F9@PAXPR04MB8143.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PIODT06EyOyd+jWMtjw6l506izYrThgybl6jV6uROo2hU1hUD4byyEcAKEhHuV8OVeC8wfJnTEHfM3+8elCRVdtqd+DI8Dq2ViuaezAi+1EPKl8s9rldLg4xzRmeCc5EvxG02Cq7smCXH9+RvzCnRMVJsBSPkQKSDwv97Rja1TtpWWaemjIGyJxRFRzjW5fcLGFwYq9qucRbW67sLZjcNYMXfaCXXRlDBJqNlXfLamxeGc15rXfYxlDM0ZqNJqBRZ6Cy1ciKdMfwgzLk05bu5B3HEDh3R7g9AfRduWPYPJDgMOz8ee3RhkZDm1bk8EdZ+faf5nYjZlJI21fBexZOXBmwojJpwhjTVQQlIrtndoF0OPHKfnJb77Rq8dNNdRPy3c4MAn2UP0UH8uPgex/uqTIajjCvkHGlfUBo3QS3dbVgJDDiG9nc+hNmHLkFJsxDQGJL7AokfvdG9wYHzH8IEiLtwV9qNNghprxnMh8KjjgqUohgbQ9bgoM+u5L7INzw0vxAr3ccOfOqc3o39dL7iYB3xIKMgP0QuZTRP/kET28EnMfvizs2VhKf09j1yCRg4nzi9ejR7Fo7+sEhnWzIYdET5eHbIpGaA0ALhGuJnqhmz+tPsclwI7lTSK7IPHhVKcoDg4lm0KTLqKyZ8lbKxfOspRkVkiA0mSZlm2tZUm9zLG7HgeucM4SmjtYYaCAUsecxtTH9VHp/B9UAup/KPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR04MB7934.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(5660300002)(15650500001)(66946007)(4326008)(6862004)(16576012)(6486002)(37006003)(2616005)(7416002)(66476007)(956004)(83380400001)(52116002)(498600001)(38100700002)(86362001)(54906003)(53546011)(38350700002)(66556008)(8676002)(44832011)(6636002)(2906002)(31696002)(31686004)(186003)(26005)(8936002)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2N4ZFBJK3lMQWQreFRRcFNONTJ2cjFnK1ZQSENyVUd0bHF5cm84SUdmd0M0?=
 =?utf-8?B?dTUxT1ltUEE0RmlKVUhSR0liL3V6NHhqL3RrT1cvUHRVcDdQK2xrOFZZeDdv?=
 =?utf-8?B?bVQ4YkF0OGNLcW8zRVAxSnJiTHdBZ1RvUG5qWXNOUGxzTWpmL2FhNkcvZ3Rq?=
 =?utf-8?B?ZUVsSnp5d3dpem9IK1luL3oyUyt4cEFFcUlNWStUTS9XdjF6M2JyZkttUnMr?=
 =?utf-8?B?cFgyRVVBalF3eE56VmRSTEk2cURIVGFGZEkzN0ZnTkVpRjV4a1kxVjg3WVVq?=
 =?utf-8?B?NXEySFRQK0hIZ0tOWWtSV2EvdHBsSW02TVdKdUVGK1Y5OWVOTWJBQkM2WGZT?=
 =?utf-8?B?a3BRSUhwL28vUkY2MkRDL3lVNE40aTNENGdtWnVSVUdxbmRjelBVNVg0b1V5?=
 =?utf-8?B?aXFBbGI0MTZPeGI1UXU3dllpemVUMyt1Z0FIZDVrd29ubHRYZllOclJTN0hy?=
 =?utf-8?B?WXhnK3BqcXcrKzcrYlFqa2d5TmQreFVjRFBYaG1VN1MrR0JPdHgvTXZJYjRn?=
 =?utf-8?B?T2dFRGd6alYxUlRYUTBHL29tN1NpeWJEWGhneVl1MTljTUxVWUVza0lmWWZZ?=
 =?utf-8?B?QWEyMGlSdnBKSzQ3aWhnaFBsbFFrUGRkck5wZmZETVhPQWRRb1VDaEQvZWVa?=
 =?utf-8?B?RWhpb2tzemYzaU1wTDRhZjNUdThZRVVKRG1OUUZZclhwWlJmN2JLYklXak5Z?=
 =?utf-8?B?dWtvZ3g2d2h5bmEzUGFYU29EMGZTT0ZwZUZIMEk3VS9heGowcyszbVV5NnpR?=
 =?utf-8?B?bnViYzZQWG9hRkRxa1VFdDhsS0NIS0JQWUo0MjRGaGMzakNHaVFWSklLVVp6?=
 =?utf-8?B?VTJDMkVIdEplRm95RHY5WlZ0Q0dhUFFNdTBiMDhMcVh3RzNDMHFtRHVFRjd4?=
 =?utf-8?B?NVR5TlhDbUxIQ3hQcDNHeHA1NUxrTVJpVEplalNxaUZyakZWZUhVWDJiRXJ4?=
 =?utf-8?B?SVJFODRrWDEvQW9aR2tNVUoyNDVnWi8rYmpGQlNCRmR1ek0xMytsUTNjRUJZ?=
 =?utf-8?B?YWYwZGdlaEVEYU5wV3ZaQy9XS0YrOHV5S0ZvVnlZUklJdWpjMEQxUHhMaGZ5?=
 =?utf-8?B?VXlYRWVNS2FhOGFWSExqcEtZUWFtWjhYa0t4MFJqR3VxOURFQmsyeitWaGl3?=
 =?utf-8?B?cXYveGhNdGVIZlJTa3lKcmZOdVNOMUVlS3hiak11TGRtYi9OZGZZSGlienBp?=
 =?utf-8?B?MzBtRExBb242TFRQQkJtbVV2QmZUOG5FK2dpNTBRRS85QjY4WUppT3J1cVVQ?=
 =?utf-8?B?aitYaXFBTTJldDFuM1lJbDFXY3dFd01USHNBcUM2aC9qR1ZDdHplbHR5TURo?=
 =?utf-8?B?MFZjZkRObWw0SDdJR1hHTWx3amQzSUlTWldBQ2NMYU1FcmtjbWRJVHdRbmdO?=
 =?utf-8?B?R0taeDVXajNTSzBVSzVEYjQxbGR4aWhLWjNBRjVXbmlRa1pBOU1PWkZPV0NW?=
 =?utf-8?B?VHNBb0JPUXQ5QUJOcUdBN2FFdjUvbCtTVGFZM3N0UVpOeTQrbldXRzgwbzRl?=
 =?utf-8?B?RUhNcnhYcTUwNkhNM2pFVjJESkQrYVZTeURyeFhOR2JCRlFVa3hkRHBOYXJS?=
 =?utf-8?B?OTg5d3FoMnNVbWZQQk0yc2tncFFDdU1GbFhyUGg5d3Q5bXhUZmR5QVJSb1ph?=
 =?utf-8?B?dnRUZm5VVmtpbFp3bVVYY2pjQWZHT1VsYTVSbXBOREdVOGZyM0dOUkJjZFB2?=
 =?utf-8?B?UlpvVHJXS1dFVlFEMU5MelhGeUZNUk1ka0kvNURJcVBwaDJYc2V2OUR4QzVW?=
 =?utf-8?Q?rO66lN3gpMi8n2kaKjjUdAiX/c5/25uN2B3e4fE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71811e0c-7ec2-466f-fd28-08d930e9e071
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7934.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 17:12:10.3115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h29e9UPsnIBdjcid9Yp/Gaf+/VyHktZC4tX7jMHuqGUpZJ8sQHSPHGpoFUsXlwQT9qX9hmJJx+aE29jcVP1B7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8143
Cc: "joabreu@synopsys.com" <joabreu@synopsys.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "weifeng.voon@intel.com" <weifeng.voon@intel.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "vee.khee.wong@intel.com" <vee.khee.wong@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "Y.b. Lu" <yangbo.lu@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 "mohammad.athari.ismail@intel.com" <mohammad.athari.ismail@intel.com>,
 Mingkai Hu <mingkai.hu@nxp.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "tee.min.tan@intel.com" <tee.min.tan@intel.com>,
 "boon.leong.ong@intel.com" <boon.leong.ong@intel.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

T24gNi85LzIwMjEgMTE6MDMgQU0sIFhpYW9saWFuZyBZYW5nIHdyb3RlOgo+IEhpIFJ1aSwKPgoK
SGksCgo+IE9uIDIwMjEtMDYtMDIgMTg6MTgsIFJ1aSBTb3VzYSB3cm90ZToKPj4+IEFmdGVyIGFk
anVzdGluZyB0aGUgcHRwIHRpbWUsIHRoZSBRYnYgYmFzZSB0aW1lIG1heSBiZSB0aGUgcGFzdCB0
aW1lCj4+PiBvZiB0aGUgbmV3IGN1cnJlbnQgdGltZS4gZHdtYWM1IGhhcmR3YXJlIGxpbWl0ZWQg
dGhlIGJhc2UgdGltZSBjYW5ub3QKPj4+IGJlIHNldCBhcyBwYXN0IHRpbWUuIFRoaXMgcGF0Y2gg
Y2FsY3VsYXRlIHRoZSBiYXNlIHRpbWUgYW5kIHJlc2V0IHRoZQo+Pj4gUWJ2IGNvbmZpZ3VyYXRp
b24gYWZ0ZXIgcHRwIHRpbWUgYWRqdXN0Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFhpYW9saWFu
ZyBZYW5nIDx4aWFvbGlhbmcueWFuZ18xQG54cC5jb20+Cj4+PiAtLS0KPj4+IC4uLi9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3B0cC5jwqAgfCA0MQo+PiArKysrKysrKysrKysr
KysrKystCj4+PiAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9zdG1tYWNfcHRwLmMKPj4+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
c3RtbWFjX3B0cC5jCj4+PiBpbmRleCA0ZTg2Y2RmMmJjOWYuLmM1NzNiYzhiMjU5NSAxMDA2NDQK
Pj4+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19wdHAu
Ywo+Pj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3B0
cC5jCj4+PiBAQCAtNjIsNyArNjIsOCBAQCBzdGF0aWMgaW50IHN0bW1hY19hZGp1c3RfdGltZShz
dHJ1Y3QgcHRwX2Nsb2NrX2luZm8KPj4+ICpwdHAsIHM2NCBkZWx0YSkKPj4+ICAgwqDCoMKgwqB1
MzIgc2VjLCBuc2VjOwo+Pj4gICDCoMKgwqDCoHUzMiBxdW90aWVudCwgcmVtaW5kZXI7Cj4+PiAg
IMKgwqDCoMKgaW50IG5lZ19hZGogPSAwOwo+Pj4gLcKgwqDCoCBib29sIHhtYWM7Cj4+PiArwqDC
oMKgIGJvb2wgeG1hYywgZXN0X3JzdCA9IGZhbHNlOwo+Pj4gK8KgwqDCoCBpbnQgcmV0Owo+Pj4K
Pj4+ICAgwqDCoMKgwqB4bWFjID0gcHJpdi0+cGxhdC0+aGFzX2dtYWM0IHx8IHByaXYtPnBsYXQt
Pmhhc194Z21hYzsKPj4+Cj4+PiBAQCAtNzUsMTAgKzc2LDQ4IEBAIHN0YXRpYyBpbnQgc3RtbWFj
X2FkanVzdF90aW1lKHN0cnVjdAo+Pj4gcHRwX2Nsb2NrX2luZm8gKnB0cCwgczY0IGRlbHRhKQo+
Pj4gICDCoMKgwqDCoHNlYyA9IHF1b3RpZW50Owo+Pj4gICDCoMKgwqDCoG5zZWMgPSByZW1pbmRl
cjsKPj4+Cj4+PiArwqDCoMKgIC8qIElmIEVTVCBpcyBlbmFibGVkLCBkaXNhYmxlZCBpdCBiZWZv
cmUgYWRqdXN0IHB0cCB0aW1lLiAqLwo+Pj4gK8KgwqDCoCBpZiAocHJpdi0+cGxhdC0+ZXN0ICYm
IHByaXYtPnBsYXQtPmVzdC0+ZW5hYmxlKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgZXN0X3JzdCA9
IHRydWU7Cj4+PiArwqDCoMKgwqDCoMKgwqAgbXV0ZXhfbG9jaygmcHJpdi0+cGxhdC0+ZXN0LT5s
b2NrKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBwcml2LT5wbGF0LT5lc3QtPmVuYWJsZSA9IGZhbHNl
Owo+Pj4gK8KgwqDCoMKgwqDCoMKgIHN0bW1hY19lc3RfY29uZmlndXJlKHByaXYsIHByaXYtPmlv
YWRkciwgcHJpdi0+cGxhdC0+ZXN0LAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcHJpdi0+cGxhdC0+Y2xrX3B0cF9yYXRlKTsKPj4+ICvCoMKgwqDCoMKgwqDC
oCBtdXRleF91bmxvY2soJnByaXYtPnBsYXQtPmVzdC0+bG9jayk7Cj4+PiArwqDCoMKgIH0KPj4+
ICsKPj4+ICAgwqDCoMKgwqBzcGluX2xvY2tfaXJxc2F2ZSgmcHJpdi0+cHRwX2xvY2ssIGZsYWdz
KTsKPj4+ICAgwqDCoMKgwqBzdG1tYWNfYWRqdXN0X3N5c3RpbWUocHJpdiwgcHJpdi0+cHRwYWRk
ciwgc2VjLCBuc2VjLCBuZWdfYWRqLAo+Pj4geG1hYyk7Cj4+PiAgIMKgwqDCoMKgc3Bpbl91bmxv
Y2tfaXJxcmVzdG9yZSgmcHJpdi0+cHRwX2xvY2ssIGZsYWdzKTsKPj4+Cj4+PiArwqDCoMKgIC8q
IENhY3VsYXRlIG5ldyBiYXNldGltZSBhbmQgcmUtY29uZmlndXJlZCBFU1QgYWZ0ZXIgUFRQIHRp
bWUKPj4+IGFkanVzdC4gKi8KPj4+ICvCoMKgwqAgaWYgKGVzdF9yc3QpIHsKPj4+ICvCoMKgwqDC
oMKgwqDCoCBzdHJ1Y3QgdGltZXNwZWM2NCBjdXJyZW50X3RpbWUsIHRpbWU7Cj4+PiArwqDCoMKg
wqDCoMKgwqAga3RpbWVfdCBjdXJyZW50X3RpbWVfbnMsIGJhc2V0aW1lOwo+Pj4gK8KgwqDCoMKg
wqDCoMKgIHU2NCBjeWNsZV90aW1lOwo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHByaXYtPnB0
cF9jbG9ja19vcHMuZ2V0dGltZTY0KCZwcml2LT5wdHBfY2xvY2tfb3BzLAo+Pj4gJmN1cnJlbnRf
dGltZSk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgY3VycmVudF90aW1lX25zID0gdGltZXNwZWM2NF90
b19rdGltZShjdXJyZW50X3RpbWUpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHRpbWUudHZfbnNlYyA9
IHByaXYtPnBsYXQtPmVzdC0+YnRyWzBdOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHRpbWUudHZfc2Vj
ID0gcHJpdi0+cGxhdC0+ZXN0LT5idHJbMV07Cj4+Cj4+IFRoaXMgdGltZSBtYXkgbm8gbG9uZ2Vy
IGJlIHdoYXQgdGhlIHVzZXIgc3BlY2lmaWVkIG9yaWdpbmFsbHksIGl0IHdhcyBhZGp1c3RlZAo+
PiBiYXNlZCBvbiB0aGUgZ3B0cCB0aW1lIHdoZW4gdGhlIGNvbmZpZ3VyYXRpb24gd2FzIGZpcnN0
IG1hZGUuCj4+IElNSE8sIGlmIHdlIHdhbnQgdG8gcmVzcGVjdCB0aGUgdXNlciBjb25maWd1cmF0
aW9uIHRoZW4gd2UgbmVlZCB0byBkbyB0aGUKPj4gY2FsY3VsYXRpb24gaGVyZSBiYXNlZCBvbiB0
aGUgb3JpZ2luYWwgdGltZS4KPj4gVHlwaWNhbGx5ICh1c2luZyBhcmJpdHJhcnkgdW5pdHMpOgo+
PiBhKSBVc2VyIGNvbmZpZ3VyZXMgYmFzZXRpbWUgb2YgMCwgYXQgZ3B0cCB0aW1lIDEwMDAKPj4g
YikgYnRyIGlzIHVwZGF0ZSB0byAxMDAwLCBzY2hlZHVsZSBzdGFydHMKPj4gYykgbGF0ZXIsIGdw
dHAgdGltZSBpcyB1cGRhdGVkIHRvIDUwMAo+PiBkLTEpIHdpdGggY3VycmVudCBwYXRjaCwgc2No
ZWR1bGUgd2lsbCByZXN0YXJ0IGF0IDEwMDAgKGkuZSByZW1haW5zIGRpc2FibGVkIGZvcgo+PiA1
MDApCj4+IGQtMikgd2l0aCBteSBzdWdnZXN0aW9uLCBzY2hlZHVsZSB3aWxsIHJlc3RhcnQgYXQg
NTAwICh3aGljaCBtYXRjaGVzIHRoZSB1c2VyCj4+IHJlcXVlc3QsICJzdGFydCBhcyBzb29uIGFz
IHBvc3NpYmxlIi4KPj4KPiBJdCBpcyBub3QgdGhlIGNvcnJlY3Qgb3BlcmF0aW9uIHNlcXVlbmNl
IGZvciB0aGUgdXNlciB0byBjb25maWd1cmUgUWJ2IGJlZm9yZSBwdHAgY2xvY2sgc3luY2hyb25p
emF0aW9uLgoKVGhlIHdheSBJIHNlZSBpdCwgYSBwdHAgY2xvY2sgZGlzY29udGludWl0eSBtYXkg
aGFwcGVuIGF0IGFueSB0aW1lIAooY2hhbmdlIG9mIGdyYW5kIG1hc3RlciwgZ3JhbmQgbWFzdGVy
IGRpc2NvbnRpbnVpdHksIC4uLikgb3V0c2lkZSBvZiB0aGUgCnVzZXIgY29udHJvbC4gU28gaGF2
aW5nIHRoZSBkcml2ZXIgaGFuZGxlIGFsbCBjb3JuZXIgY2FzZXMgbG9va2VkIGxpa2UgYSAKZ29v
ZCBzb2x1dGlvbiB0byBtZS4KCj4gQWZ0ZXIgYWRqdXN0aW5nIHRoZSBwdHAgY2xvY2sgdGltZSwg
aXQgaXMgbm8gbG9uZ2VyIHBvc3NpYmxlIHRvIGRldGVybWluZSB3aGV0aGVyIHRoZSBwcmV2aW91
c2x5IHNldCBiYXNldGltZSBpcyB3aGF0IHRoZSB1c2VyIHdhbnRzLgoKSSBtYXkgYmUgYXNzdW1p
bmcgdG9vIG11Y2gsIGJ1dCB1c3VhbGx5IGEgUWJ2IHNjaGVkdWxlIGlzIGRldGVybWluZWQgYnkg
CnNvbWUgY2VudHJhbCBpZGVudGl0eSBiYXNlZCBvbiBhbiBhYnNvbHV0ZSB0aW1lIChub3QgcmVs
YXRlZCB0byB0aGUgCmN1cnJlbnQgdGltZSBpbiB0aGUgZW5kcG9pbnQpLiBTbyB3aXRoIHRoaXMg
YXNzdW1wdGlvbiBJIHdhcyBjb25zaWRlcmluZyAKdGhlIHRpbWUgc3BlY2lmaWVkIGJ5IHRoZSB1
c2VyIGFzICJjb3JyZWN0IiwgaW5kZXBlbmRlbnRseSBvZiB0aGUgCmN1cnJlbnQgbG9jYWwgcHRw
IHRpbWUuCgo+IEkgdGhpbmsgb3VyIGRyaXZlciBvbmx5IG5lZWRzIHRvIGVuc3VyZSB0aGF0IHRo
ZSBzZXQgYmFzZXRpbWUgbWVldHMgdGhlIGhhcmR3YXJlIHJlZ3VsYXRpb25zLCBhbmQgdGhlIGhh
cmR3YXJlIGNhbiB3b3JrIG5vcm1hbGx5LiBTbyBJIG9ubHkgdXBkYXRlZCB0aGUgcGFzdCBiYXNl
dGltZS4KClVuZGVyc3Rvb2QsIGJ1dCBmcm9tIHRoZSBwb2ludCBvZiB2aWV3IG9mIHRoZSB1c2Vy
IEkgdGhpbmsgdGhlIGNhc2UgeW91IAphcmUgYWxyZWFkeSBoYW5kbGluZyBhbmQgdGhlIG9uZSBJ
IG1lbnRpb25lZCBhcmUgdmVyeSBzaW1pbGFyLiBRYnYgCnNjaGVkdWxlIGRvZXNuJ3Qgd29yayBh
cyBpbnRlbmRlZCBhZnRlciB0aGUgY2xvY2sganVtcC4gQWxzbywgbXkgCnN1Z2dlc3Rpb24gc2lt
cGxpZmllcyBhIGJpdCB0aGUgY29kZSAobm8gY29udmVyc2lvbiBmcm9tIGhhcmR3YXJlIHRvIApr
dGltZSksIGF0IHRoZSBjb3N0IG9mIGFkZGluZyBleHRyYSBkYXRhIChzb2Z0d2FyZSBiYWNrdXAg
b2YgdGhlIApvcmlnaW5hbCB1c2VyIGt0aW1lKS4KCj4gSSBhbSBub3Qgc3VyZSBpZiBpdCBpcyBh
cHByb3ByaWF0ZSB0byByZXNldCBFU1QgY29uZmlndXJlIGluIHRoZSBQVFAgZHJpdmVyLAoKSSdt
IG5vdCAxMDAlIHN1cmUgZWl0aGVyIGFuZCBJIHdhcyBob3BpbmcgdG8gc2VlIG90aGVyIHBlb3Bs
ZSBjb21tZW50cyAKKGFuZCBJIGhhdmVuJ3QgY2hlY2tlZCB5ZXQgaG93IG90aGVyIGRyaXZlcnMg
YXJlIGhhbmRsaW5nIHRoaXMpLgpUaGF0IHNhaWQsIHRvIGhhbmRsZSB0aGlzIHByb3Blcmx5IGlu
IHVzZXJzcGFjZSwgSU1ITyB5b3Ugd291bGQgbmVlZDoKLSBzb21lIHByb2Nlc3MgbW9uaXRvcmlu
ZyB0aGUgcHRwIGNsb2NrIGFuZCBkZXRlY3RpbmcganVtcHMKLSB0aGUgcHJvY2VzcyB3b3VsZCBu
ZWVkIHRvIGJlIGF3YXJlIG9mIHRoZSBjdXJyZW50IFFidiBzY2hlZHVsZQotIHdoZW4gYSBqdW1w
IGlzIGRldGVjdGVkLCByZS1kbyB0aGUgUWJ2IGNvbmZpZ3VyYXRpb24KCk92ZXJhbGwsIGhhbmRs
aW5nIHRoZSBpc3N1ZSB0cmFuc3BhcmVudGx5IGluIHRoZSBkcml2ZXIsIHNlZW1zIGxpa2UgYSAK
YmV0dGVyIHNvbHV0aW9uLgoKPiBidXQgdGhpcyBjYXNlIHdpbGwgY2F1c2UgdGhlIGhhcmR3YXJl
IHRvIG5vdCB3b3JrLgo+IAo+Pj4gK8KgwqDCoMKgwqDCoMKgIGJhc2V0aW1lID0gdGltZXNwZWM2
NF90b19rdGltZSh0aW1lKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBjeWNsZV90aW1lID0gcHJpdi0+
cGxhdC0+ZXN0LT5jdHJbMV0gKiBOU0VDX1BFUl9TRUMgKwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHByaXYtPnBsYXQtPmVzdC0+Y3RyWzBdOwo+Pj4gK8KgwqDCoMKgwqDC
oMKgIHRpbWUgPSBzdG1tYWNfY2FsY190YXNfYmFzZXRpbWUoYmFzZXRpbWUsCj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjdXJyZW50X3RpbWVfbnMs
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjeWNs
ZV90aW1lKTsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoCBtdXRleF9sb2NrKCZwcml2LT5wbGF0
LT5lc3QtPmxvY2spOwo+Pgo+PiBIbW0uLi4gdGhlIGxvY2tpbmcgbmVlZHMgdG8gbW92ZSB1cC4g
UmVhZGluZyArIHdyaXR0aW5nIGJ0ci9jdHIgc2hvdWxkIGJlCj4+IGF0b21pYy4KPiBJIHdpbGwg
bW9kaWZ5IHRoaXMuCj4+Cj4+PiArwqDCoMKgwqDCoMKgwqAgcHJpdi0+cGxhdC0+ZXN0LT5idHJb
MF0gPSAodTMyKXRpbWUudHZfbnNlYzsKPj4+ICvCoMKgwqDCoMKgwqDCoCBwcml2LT5wbGF0LT5l
c3QtPmJ0clsxXSA9ICh1MzIpdGltZS50dl9zZWM7Cj4+PiArwqDCoMKgwqDCoMKgwqAgcHJpdi0+
cGxhdC0+ZXN0LT5lbmFibGUgPSB0cnVlOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IHN0bW1h
Y19lc3RfY29uZmlndXJlKHByaXYsIHByaXYtPmlvYWRkciwKPj4+ICtwcml2LT5wbGF0LT5lc3Qs
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJpdi0+
cGxhdC0+Y2xrX3B0cF9yYXRlKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBtdXRleF91bmxvY2soJnBy
aXYtPnBsYXQtPmVzdC0+bG9jayk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5ldGRldl9lcnIocHJpdi0+ZGV2LCAiZmFpbGVkIHRvIGNv
bmZpZ3VyZSBFU1RcbiIpOwo+Pj4gK8KgwqDCoCB9Cj4+PiArCj4+PiAgIMKgwqDCoMKgcmV0dXJu
IDA7Cj4+PiB9Cj4gCj4gVGhhbmtzLAo+IHhpYW9saWFuZwo+IAoKQnIsClJ1aQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
