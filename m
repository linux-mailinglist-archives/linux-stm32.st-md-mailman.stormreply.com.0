Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 681E235037C
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Mar 2021 17:33:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30D74C5662E;
	Wed, 31 Mar 2021 15:33:20 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D465DC32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 15:33:16 +0000 (UTC)
IronPort-SDR: SVF2KIOLhlVbGoXYHsaqA7I4slhw8I9mmd122b7kOieopiE5XfLBZuuOE3YiiK6ODqBE8KkeX3
 3LLjVYfD8VHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="277213840"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="277213840"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 08:33:11 -0700
IronPort-SDR: b+u0o+Bzcc7wvmJYwHoT9SjeVmrpAzAcGIWO8pYEJBZhn/Zl6+oJH8n1DxJGq83ux9lAUCQ6kD
 RplH7cb/qaeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; d="scan'208";a="377311939"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 31 Mar 2021 08:33:10 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 31 Mar 2021 08:33:10 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 31 Mar 2021 08:33:10 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.55) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 31 Mar 2021 08:33:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xzh9P80+eoxqg8Q1pdBj5+C5I6YykFw77AHT8L+NRKIQchkqxX1rTIDTSR/x6zRZy/LvQCWPniKMsTr83WhHUV5A/ejmbIP+H2EcPwnEwi1Zv63lMXmHxJ0ZJvVsuhk2BSkrOKiVx2B7X0UZbNsZ37XMukKsqkBm40mV15Op5tlSn0tFRwmhMbf9iLSyrqtDZjbFZ1/mJ02H1oQ++3mLVXJjYscuP7K/scXLHb1dIEj0msA8cjTkRmDRwU8blXtzy6nke+6BllJ15cXvS3BAPmkj4OSKTTluCbyZDnizvdbdoCkBjSHHFOJW5s0HbfuMBTXzXTDp+AgwShj007Uw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRCbm0tCTIg7bwVPUrjMd87vRAi8e4mOdHuN6rtGkcw=;
 b=MOxnaUeZIG5/3yAMd2MBn0ciAU3mrp8dxzbKR+5ExyMM+kq2E4o3EVURPC5qXaDUkwKxotfNUb7sc4uZOe7LZsMidVE2insocNVB1M+ANYCauC9Rk6j+qZnHAt/SLIqKW+WSURr7jhpUCzNYUSJA2TN4SbjIR4elVOhk5JVThvWo3eAKLsnX31KUopCa9NIMWJi1m53bhCilmxOqEuHBbjSfXD8UAQOcjGKYtUGmNFZMAQq1EvmGK6/PF10cjsVVDi1UWN76mP8xmo1Kd79hHu+/A9RtaU7Hb/xxlq0KzMWF5Oe6J6FQzHC0MGXoR58vhMTj/oT9hISLCfSp+2EnYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NRCbm0tCTIg7bwVPUrjMd87vRAi8e4mOdHuN6rtGkcw=;
 b=YZCrrW+mc6MSBbVegqFsPWhhqdjVW0JSPJoKuKrcCQt/B29NW3LEsvgvl7/9Ywm34hU+oyPnHrTw+ALLFWc7AroyzYhG8/3D2lXLoBCAsSzjKKCS9Z078oiSbaS41FUDqhzt38gW8lUIMTCg+AkAVraPgr2n87RPxkRU/yaC2Y8=
Received: from DM6PR11MB2780.namprd11.prod.outlook.com (2603:10b6:5:c8::19) by
 DM5PR1101MB2153.namprd11.prod.outlook.com (2603:10b6:4:56::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.28; Wed, 31 Mar 2021 15:32:59 +0000
Received: from DM6PR11MB2780.namprd11.prod.outlook.com
 ([fe80::dcb3:eed0:98d1:c864]) by DM6PR11MB2780.namprd11.prod.outlook.com
 ([fe80::dcb3:eed0:98d1:c864%7]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 15:32:59 +0000
From: "Ong, Boon Leong" <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S .
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper
 Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Thread-Topic: [PATCH net-next v3 0/6] stmmac: Add XDP support
Thread-Index: AQHXJkL6V6DW7zDlgUy0wbB2MEpyE6qeOZpQ
Date: Wed, 31 Mar 2021 15:32:58 +0000
Message-ID: <DM6PR11MB27802A13B4946C51570664DFCA7C9@DM6PR11MB2780.namprd11.prod.outlook.com>
References: <20210331153541.1892-1-boon.leong.ong@intel.com>
In-Reply-To: <20210331153541.1892-1-boon.leong.ong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: st.com; dkim=none (message not signed)
 header.d=none;st.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [42.189.169.167]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7dac727-cf0b-42be-9065-08d8f45a438b
x-ms-traffictypediagnostic: DM5PR1101MB2153:
x-microsoft-antispam-prvs: <DM5PR1101MB215321EE7ED418BB6CB2A7BFCA7C9@DM5PR1101MB2153.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i+r9cLtIJqFf5uNwE/vFdHlzWWxVfa/2Y5Al06Lf+cgb5hRjdeg+DgVwjN93mDYd959FySik0FfWGqbRE3+WkK/JIXEWUP6B8N7M/WqyeDCKmdGRsXDS2DINw6Lcop04rz6UPyKlmtJmZuanmUv04kPnLSnMUgByC8nOFq1XWrxjU//FxftoSF1c/W5yXN6eRYEFivCYQie58901zQr3petdIbg2vvevIPtLtkroEk71Xyul7PYRRQutjOBlSvEKd9rcOqEtfSeFe+JinLzw2yCypE3e/jcazPYiDlsycKBIEpB1iyzcSmWgshuXZ4iO/6EIoXlo8e3kBjO/8WzDzm8jQPni7u7T+gkcfQbqog0TVqaOG0GygSiseOop9oloWLAomOlNfv9tfc7bQ1EfXSIRAB1llzN6SCVDm1b+5I8s+eVnObLoqxyxbsL6Wakhd3PQCgJR226kmWj7E7lY7a5X0Mam19txek9UN0nv9ImIoD3gxcvNKa830DLmYNSucub83ptTIOFDGChIRvhGGkkLo9OMqTo2kYHZFhLI6hA+cO4fx0XqEpL43ar/flYuwHwbx4Cc1kEpdXTSYqGZKm2Wtn+JU/afuujkQACerKYfNVNJhUAXKuWmoR8jcYAnYllauRiGlqVYCBEOAOAUcgZaZOQKs3gnzCBp06rWbdfDiCJOfwhrSiGM0jc2cHYO8laIiiJfyC93jfFkiYr+WroV841YuxbzJBTDllt7jfg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2780.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(376002)(136003)(39860400002)(396003)(52536014)(186003)(71200400001)(33656002)(5660300002)(4326008)(66476007)(478600001)(66446008)(64756008)(66556008)(316002)(26005)(76116006)(110136005)(54906003)(66946007)(966005)(38100700001)(7416002)(8936002)(9686003)(6506007)(86362001)(55016002)(7696005)(8676002)(83380400001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?S25reEVrWCtrdmdxNVphcUpCUlY3a2pac1FFNEQ4Z2ZYdkVTbDNHeDl4bnU4?=
 =?utf-8?B?RmxLc2xxdURNQ2M2T1FoVzNpbG9ZYllZSFRkV1BlMFVveDFKMWxHZ1UrL0JC?=
 =?utf-8?B?ZGhUaVlHc1ZkbnJqV0RNUDNEMG9jblJPZ01ydE5RYlZjNWMrQVBtOVZqRHNh?=
 =?utf-8?B?KzREMVM5UWJCcmtTZTZIdGhtdWQxekk1ZE9LclR3QXZsbU9mQUtqcXhDZEFn?=
 =?utf-8?B?U2J3SnN1dDBlSkptbDVHU3Q1cDNrSGpaSXU4cEgxRFF4dWRoOCtiTm0zUHlS?=
 =?utf-8?B?cEVYWTdRaDdScWV2cFFpaDAwMGhFYmVhRTl2ZURYYUI0cktVQ09jajE4N3RC?=
 =?utf-8?B?ME9CT3FlckpNV0JhZmVXeFVsRU92RmNuTWVIWDU0TkR0RjJrSGtOcUduVVRC?=
 =?utf-8?B?cWJmVEdLME9ERjNDck00RFNkUElzaGNycmdmbStGck51TmdlWTdjZlFzaDRh?=
 =?utf-8?B?cGdyZUl2YXhOckdPQUFDbFdocGRUVzBOZU1VTHVtS056V2d5aGd1MTFzYjRw?=
 =?utf-8?B?cWlQYmFxMlVFK3JMeDFTeHoxVEJ4ZURWeHFqRVlPWWlWOHRySktHN3B6WjBH?=
 =?utf-8?B?NDB5dUVLTWM1dmJlZXpJalpuK2dsWkcxc1JZbGpqcG1JREc2UkpWRzFBYStT?=
 =?utf-8?B?cWZ5QW9aOHhXYktieTMwZHlXc2x0RkEzdkNiTTJGb2oxQ1lMVWNsTCs1KzR2?=
 =?utf-8?B?VkJ1ZWRGbjJ5VlJEUHJZcWFsZkZVeGUyclBxdVUyUEZLQTN4L1lDN2NKUFlB?=
 =?utf-8?B?akV0ZEVYQzdNTXN4ZklxRnhvaWdXL1o4UFBLRVU3NXVYZVp2L2hTL0JQTmZ1?=
 =?utf-8?B?NXNLNE1oVlUveEJlQXZnRHU4TE5zd3c3d240M0lYd2ZCT2RGcXFYK0RUUFhJ?=
 =?utf-8?B?VnFwZWRsYnNBbTJtQ0t2VXJJZFVkWm9HL2FpemI1VlVPTWI1Rnp4MzgyUlhT?=
 =?utf-8?B?QjRGU0NLUlVTeGE3ZnhPcVVQNkhFTHRrcmRyV1BrMFk3bXJJY2lrOTF5RDRx?=
 =?utf-8?B?eXV2cktuOTVvd2V3am12UUI5YldCNWZrNnF1NHcvR0JTMXVRQUl6dk9jeURX?=
 =?utf-8?B?QmF2YTNyeEZ0TEc1OElycU1FRWQ0NWdNVUI5eUdYeldheEI4aTBBOERqb1RG?=
 =?utf-8?B?ZzFuanh2TS92WTBKTEtoM3RlRDJDb0JCWGN6dTBNWkp4VXkyTWtVbXR5eEFN?=
 =?utf-8?B?dU9KUzNkQk9mM1B6L3Bkb1RTSU1TTU5UVDJLdkxjS1RXV3pGTm0wLzU3MExk?=
 =?utf-8?B?WjFXWTJlL2VoWGJXOC8vb0dSemNqbG5mM3ozbjc4blNlVnZkanFOQndTVVZK?=
 =?utf-8?B?MStMbzNJZ28yRUdyNlJvbStrSytodHFPem54VU55UkVKS3dHYWRWRUhvN2E1?=
 =?utf-8?B?TDltS1pIdW84RFgwcXYzQmY3czcxUFJLekRrRmJOM0Y1ak5rek9BbkR6REdh?=
 =?utf-8?B?dVYzSy9LKzVzQ1Z0d1poUE5EanZ5UlRyLzUyODJwT1JwY3Y3cDdZK3d2Tk5E?=
 =?utf-8?B?dDR3M1duZ3JuZzYrRHI3WTlvTmhUNW5UYjRNWG9TdXFoTmNMc2lHckJYdDQr?=
 =?utf-8?B?QkhxNWIzYk1DN3dFQVZMakM1cDQ2ZHdCRWFMd3doMGMrV29oT1d1aXJ6cTU5?=
 =?utf-8?B?MGt6cFc5dlNFeDVhU2IxUmN0NjI2UXlhUGdHN0xwVnhuQjZNMy9KMWVEK0JM?=
 =?utf-8?B?U01OT281NmZFSmRsU3JRUEppdVVZaVcxRXQxcEdzNzVTS0tVNVpLZUNXNTFZ?=
 =?utf-8?Q?0hvIWO6skz7f++3LcYCDD23Mr5+dVTX5yAU8VTt?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2780.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7dac727-cf0b-42be-9065-08d8f45a438b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2021 15:32:58.9399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ti4hoeMES6kQ6xDw85TRxRxQ026G/aUJH6wr4SVhgVkjxilgvrDqOwqxFB2otpGPkb0NhEfFj2i4e1mN/yMiVtL4YZZPQ2XNpk95+kevfgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2153
X-OriginatorOrg: intel.com
Cc: Song Liu <songliubraving@fb.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, KP Singh <kpsingh@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Yonghong Song <yhs@fb.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next v3 0/6] stmmac: Add XDP support
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

Pls ignore this. I will resend the real v3. Sorry for glitch on my part. 

>-----Original Message-----
>From: Ong, Boon Leong <boon.leong.ong@intel.com>
>Sent: Wednesday, March 31, 2021 11:36 PM
>To: Giuseppe Cavallaro <peppe.cavallaro@st.com>; Alexandre Torgue
><alexandre.torgue@st.com>; Jose Abreu <joabreu@synopsys.com>; David S .
>Miller <davem@davemloft.net>; Jakub Kicinski <kuba@kernel.org>; Alexei
>Starovoitov <ast@kernel.org>; Daniel Borkmann <daniel@iogearbox.net>;
>Jesper Dangaard Brouer <hawk@kernel.org>; John Fastabend
><john.fastabend@gmail.com>
>Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>; Andrii Nakryiko
><andrii@kernel.org>; Martin KaFai Lau <kafai@fb.com>; Song Liu
><songliubraving@fb.com>; Yonghong Song <yhs@fb.com>; KP Singh
><kpsingh@kernel.org>; netdev@vger.kernel.org; linux-stm32@st-md-
>mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-
>kernel@vger.kernel.org; bpf@vger.kernel.org; Ong, Boon Leong
><boon.leong.ong@intel.com>
>Subject: [PATCH net-next v3 0/6] stmmac: Add XDP support
>
>Hi,
>
>This is the v3 patch series for adding XDP support to stmmac driver.
>
>Summary of the changes in v3 (per feedback from Jakub Kicinski):-
>
>4/6: Factor in XDP buffer header and tail adjustment by XDP prog.
>
>5/6: Added 'nq->trans_start = jiffies' to avoid TX time-out for XDP_TX.
>
>6/6: Added 'nq->trans_start = jiffies' to avoid TX time-out for
>     ndo_xdp_xmit.
>
>I retested this patch series on all the test steps listed in v1 and the
>results look good as expected. I also used xdp_adjust_tail test app in
>samples/bpf for checking out XDP head and tail adjustment introduced in
>4/6 and the result below looks correct too.
>
>
>###########################################################
>#############
>
>DUT > root@intel-corei7-64:~ $ ./xdp_adjust_tail -i eth0 -P 400 -N
>==========================
>icmp "packet too big" sent:          0 pkts
>icmp "packet too big" sent:          0 pkts
>icmp "packet too big" sent:          0 pkts
>icmp "packet too big" sent:          0 pkts
>icmp "packet too big" sent:          1 pkts
>icmp "packet too big" sent:          1 pkts
>icmp "packet too big" sent:          1 pkts
>icmp "packet too big" sent:          2 pkts
>icmp "packet too big" sent:          4 pkts
>icmp "packet too big" sent:          6 pkts
>icmp "packet too big" sent:          8 pkts
>icmp "packet too big" sent:          9 pkts
>icmp "packet too big" sent:         10 pkts
>icmp "packet too big" sent:         10 pkts
>
>LP > root@intel-corei7-64:~# ping 169.254.1.11 -s 300
>PING 169.254.1.11 (169.254.1.11) 300(328) bytes of data.
>308 bytes from 169.254.1.11: icmp_seq=1 ttl=64 time=1.17 ms
>308 bytes from 169.254.1.11: icmp_seq=2 ttl=64 time=0.575 ms
>308 bytes from 169.254.1.11: icmp_seq=3 ttl=64 time=0.582 ms
>308 bytes from 169.254.1.11: icmp_seq=4 ttl=64 time=0.595 ms
>308 bytes from 169.254.1.11: icmp_seq=5 ttl=64 time=0.585 ms
>308 bytes from 169.254.1.11: icmp_seq=6 ttl=64 time=0.591 ms
>308 bytes from 169.254.1.11: icmp_seq=7 ttl=64 time=0.599 ms
>^C
>--- 169.254.1.11 ping statistics ---
>7 packets transmitted, 7 received, 0% packet loss, time 6103ms
>rtt min/avg/max/mdev = 0.575/0.670/1.166/0.202 ms
>
>LP >  root@intel-corei7-64:~# ping 169.254.1.11 -s 500
>PING 169.254.1.11 (169.254.1.11) 500(528) bytes of data.
>From 169.254.1.11 icmp_seq=1 Frag needed and DF set (mtu = 436)
>From 169.254.1.11 icmp_seq=2 Frag needed and DF set (mtu = 436)
>From 169.254.1.11 icmp_seq=3 Frag needed and DF set (mtu = 436)
>From 169.254.1.11 icmp_seq=4 Frag needed and DF set (mtu = 436)
>From 169.254.1.11 icmp_seq=5 Frag needed and DF set (mtu = 436)
>From 169.254.1.11 icmp_seq=6 Frag needed and DF set (mtu = 436)
>
>
>###########################################################
>#############
>
>History of the previous patch series:
>
>v2: https://patchwork.kernel.org/project/netdevbpf/list/?series=457757
>v1: https://patchwork.kernel.org/project/netdevbpf/list/?series=457139
>
>It will be great if community can help to test or review the v3 patch
>series on your platform and provide me any new feedback if any.
>
>Thank you very much.
>Boon Leong
>
>Ong Boon Leong (6):
>  net: stmmac: set IRQ affinity hint for multi MSI vectors
>  net: stmmac: make SPH enable/disable to be configurable
>  net: stmmac: arrange Tx tail pointer update to
>    stmmac_flush_tx_descriptors
>  net: stmmac: Add initial XDP support
>  net: stmmac: Add support for XDP_TX action
>  net: stmmac: Add support for XDP_REDIRECT action
>
> drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  35 +-
> .../net/ethernet/stmicro/stmmac/stmmac_main.c | 529 +++++++++++++++-
>--
> .../net/ethernet/stmicro/stmmac/stmmac_xdp.c  |  40 ++
> .../net/ethernet/stmicro/stmmac/stmmac_xdp.h  |  12 +
> 5 files changed, 537 insertions(+), 80 deletions(-)
> create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
> create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.h
>
>--
>2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
