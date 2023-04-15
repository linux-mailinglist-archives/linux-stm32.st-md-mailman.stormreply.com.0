Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7382B6E2F21
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Apr 2023 07:16:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1A09C6A611;
	Sat, 15 Apr 2023 05:16:24 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CB19C6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Apr 2023 05:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681535782; x=1713071782;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CrdZENNvmFOsw0oyDC2EXEBFtTAB2BOlPtseeJs45uQ=;
 b=l5xNYUc+RUlN+7TSXKIE+9FIECh+Rpvmskm/MYBQMo/3h8GUuYa30o1H
 39/bbm6ax75NKyxmQlKDUDFdfX3nfOLFczKpsquHQp7rL8Kvf/be+SJQC
 I9XFiE6ktJy1hWr+WuGYYied9sEFG5GkIVSs9zu5QnfoRaB0o9n9VJBLk
 uYaFgkY7bm/Mp4oWrXDsvz7EJB8FqnRImXd7ZFCia/WFXHr/hLdcBL9TJ
 LQxqZt6VxDs71SRRCckjdCAV6BfaRrBmTR+wTBUeMtQNQBjil1nFV/bhb
 /m69xJSfgTtbpenhX7m2F7jHexyoHzJhAZ/p8/Cq5WufnhpTv1FGMy5oA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="407507115"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; d="scan'208";a="407507115"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 22:16:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="864428269"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; d="scan'208";a="864428269"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 14 Apr 2023 22:16:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 22:16:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 22:16:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 22:16:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJlqY28moWvfGZR97rCk/NUgUEqo/ETjS/Ht9Y8VSTxAj7D6YDIXxCKyxkvcTMvkrNVnc3055/bSsut2KFV0f2ExfkXjxyfL2me+xO3LJuV+1WyDxebaGQpRv4buWH1aOXNHeurG+05nHOH29/BxgKrP69WZQxiLI5bjINvXPCzkZI/1j0HosFhx8K8SiqTIXphjqKJlNjKTu17b/dqY3H3GYLcezVqt0KgCOjg73vVY+rPx+4RM5FAVloY0F4DURwuBHCv3fgaFlREqIHCXh4R71A5iv7/i6ZFIwI/JDE7hzSdvWXAI3vBRZavBHoAJmoiXG99SJosb2G/mvUwmdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrdZENNvmFOsw0oyDC2EXEBFtTAB2BOlPtseeJs45uQ=;
 b=e9s2ynT1HROM9lO9f0GdZSqp76t7ZjDgB4RGPE5KYFLIyGvMX7oVFXqEuSm6mvmnqnjrnUKYpiJSyrvImKy8mLFlkUzEOVpnMyeiO8FpqAfD/QuhSYPVYlao7X9S2h0Mm+wtDiuxVInXrQZ80tZhqmev5zaTFxEUVsIpPPnPdzKuvXbhFFDbUr5oXRGaqvK7AWUII22HeZ+KPQuUTMn/FHRdZfwGRp13zh5NoZdBQGpEEIgRahIVCDg53aM/dbJGV/CmBzkaY/UYyADT4NNJmEKbmKZqJ9BzM7Nic2eX+dhu+wTY2EwtsiKMM3WwQ1Y96Xttgyh5XWYp1kcZBvUpzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW5PR11MB5811.namprd11.prod.outlook.com (2603:10b6:303:198::18)
 by DM4PR11MB8201.namprd11.prod.outlook.com (2603:10b6:8:18a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Sat, 15 Apr
 2023 05:16:12 +0000
Received: from MW5PR11MB5811.namprd11.prod.outlook.com
 ([fe80::dbef:d901:ea07:8e01]) by MW5PR11MB5811.namprd11.prod.outlook.com
 ([fe80::dbef:d901:ea07:8e01%6]) with mapi id 15.20.6298.028; Sat, 15 Apr 2023
 05:16:12 +0000
From: "Song, Yoong Siang" <yoong.siang.song@intel.com>
To: Jesper Dangaard Brouer <jbrouer@redhat.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@google.com>, "Alexander
 Duyck" <alexanderduyck@fb.com>, "Ong, Boon Leong" <boon.leong.ong@intel.com>, 
 "Keller, Jacob E" <jacob.e.keller@intel.com>
Thread-Topic: [PATCH net-next v5 2/3] net: stmmac: add Rx HWTS metadata to XDP
 receive pkt
Thread-Index: AQHZbpHf9yH0VmKObUq+yhs/+Sgx268rAgEAgADS2FA=
Date: Sat, 15 Apr 2023 05:16:11 +0000
Message-ID: <MW5PR11MB5811B02733AFE888981B53A3D89E9@MW5PR11MB5811.namprd11.prod.outlook.com>
References: <20230414052651.1871424-1-yoong.siang.song@intel.com>
 <20230414052651.1871424-3-yoong.siang.song@intel.com>
 <d74d570c-3001-4c92-7516-eb20ecb479d7@redhat.com>
In-Reply-To: <d74d570c-3001-4c92-7516-eb20ecb479d7@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR11MB5811:EE_|DM4PR11MB8201:EE_
x-ms-office365-filtering-correlation-id: cbdf847e-f866-4f2e-115f-08db3d70875e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 70a2OZmxVdTrA00bW5gK1YhA1R2IB0Qv9Mw3KQ/59OBKtKU2vbt73Sr6cFAXQhu074nnAQ2ZH5NwmhJoy/zPqhqlKCnVO7NiUoTXctzDmFQ2TaTrpbpyWN4itD5jYwrpLAI/8+U1P4B8wJMKEzXU6s/9lcBCsofXGm5UAfOpDE6gwRXGJwYm2M5jt7laGNUP3/5bhaFJOijEfuoT9SkhBkhuhfgmwoMNiwHyr8y0WNhtlXh1jQLoGwxVcuNE9sM2hEh/gl8nPOJPmOe+ruc1MpNZ1lxON0HqboAE9crztKENKXupBKskTVVCeS72hXmY3+tZ211LKXiTTWtsmJhZIkkhnTRF35OBdX2AwTy4LhXw0RC02Yt0Nw8X+RFf72mlMr6WFlFc19m8l4QYP19KYOtXcc7e7UgmEWFz1vJRW4DaLuAXurxV++6gexknSSzSC9A0jNgKQIHRUgvWsdd09kamoNjGE+s4xGWe1O/JXh+86Rt5U+rI4jyPC9mj78zhdAnMYqo8YAkAo4dtsRzOj2U/xKrrVyiJYGvEz4z46rGsoE/IxikqGyNX7kjgB6WxivFG82y+Qk6eQzvIb2+eAsdM0JGT+AEBqzKVIJE4ZIsQIinwKWRpszTUwEsYZZbSt4coqIqgILd1yWPPDNinbA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR11MB5811.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199021)(316002)(4326008)(38100700002)(64756008)(66446008)(82960400001)(66556008)(66946007)(76116006)(66476007)(5660300002)(52536014)(7696005)(71200400001)(86362001)(41300700001)(55236004)(54906003)(6636002)(186003)(9686003)(53546011)(6506007)(26005)(38070700005)(2906002)(8676002)(7416002)(8936002)(83380400001)(55016003)(478600001)(33656002)(921005)(122000001)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3Y2TVpRZzZJSjQvc0dvcVZTZ1IzeU5MSmhyUVM3TGpWU0FtWS9NU2FrOG5n?=
 =?utf-8?B?Z2NDdCs0cTc2U1hKOXFaL2RRY0J0Yno2ajBmbzBvTDMwTUIvZ1VLSmlzeXBZ?=
 =?utf-8?B?aytwbFJ4ekMwS2xScDZ5Ny9pRmNNLzZNc0RCS3JpRGpIbGFic2V3UGpWTjQx?=
 =?utf-8?B?aS9EeE52QjZoWXFGd3hJdGhrMTVnNzl5TXFwcUF5bWp6UVpFWnlCWjRRRWt5?=
 =?utf-8?B?OG1JVkxNUk5IK24yb25NeFBDLzUrajBtdVZ5K1ZuRzRxZkNsdWtlOFhsQTRr?=
 =?utf-8?B?NmMrSWExbjd6Mk1vM0pPQ2pET09GdUZnbDhOK1VXWGV3RU9NcnF0SUlwTnl3?=
 =?utf-8?B?dnJ3SDVWY2F2RXBCcy84VWlkcDVjZkUralIrQW4wcEFIN0RvOHlQNFlVS1hM?=
 =?utf-8?B?ek1MakFZY05LdDR6WTgwSllGOFFZRmE4Y0ZlL3hxR29GM21WN3IvMFZoMW8w?=
 =?utf-8?B?YlE5V1pyODU4aktDWDhBb0V4VWpxMDVGcmlRakg5YW56Y0ZGdmFUS2I2ZUFj?=
 =?utf-8?B?WmJFK2t3ZFIyMGtUUnhVbXpqcmljam1CTlJpWFVtY3pMTFkxem1EaDZpYnY5?=
 =?utf-8?B?M056YS9KQUxRam8xeDN3bTZqMVl5aTc5R29VczFOWmZUVTI5YnNMMzNaV2xk?=
 =?utf-8?B?U3FEYUF5OVJuMHdHZGR5V1IrNnVTYU9yRnp0OVQrNCtPdk1rRTBreUtXbTJo?=
 =?utf-8?B?eFVOYjg0NTE1Z2VJOTJadGxHaHBOWFZqOGJuMnlZZHc2SlFCTjM4eStIVldh?=
 =?utf-8?B?aHFFMVJrSXJZSXE3a1c4eXVwMDhlUzhZdnlzbTdBTjVlUFprSHpyRjViSkZn?=
 =?utf-8?B?Q1kzbEhvcmVlOXByYmEySUhxQWVyNVlCTXFKcUdHNXc0Z25FU0FEandJYVVZ?=
 =?utf-8?B?eTlqSU9BbnlKaXR6Q1JORFh4NGJrc0lxSTNoaXVrRjF6MnB2dEpkeHBsOW1h?=
 =?utf-8?B?M3FWdU5JUWtyRTBGY2tDMUFiUXpMNWZxU3NtYUUxT25aYTdjVnRQMlcrN2h0?=
 =?utf-8?B?UGFheWphSXJzdVJlREZ2anljRmhsZjJiL1lJbm1lWE9vdjcxeDJVcE1ucFU4?=
 =?utf-8?B?amEyT1I1VERscS9vVmdpcWZUMlMrS3RiWjBybit0YXJVRDJuaCtua2NtM09t?=
 =?utf-8?B?OXVEbHpWVFd0RHNMTWd6UEJybWFsYVJxTTgvNFpsUHNLSmgwZDRLTjRLZUxM?=
 =?utf-8?B?NWdPWHZRZmR4RHAySFY3d0VtUjlCV0wwTGxvK1piNWJGVGFnOERHdlNUclli?=
 =?utf-8?B?UkVzc0cwV2hzb0JDOTh3TFBudW9UeU95cUtBMmZYT2ZiZEY0Qnh5VFlFNFRt?=
 =?utf-8?B?dnlkenlZbThVb1hJVUJQczNEVEIySTZGdDcrQ1phZGtwVDBwRVI5cE84VlRz?=
 =?utf-8?B?cGdhU1dSYnJJYWtCS0RDTlNPcG5JZUE0WFpYeC9oQi9aQUJsVTZCYk1qZEhT?=
 =?utf-8?B?WmZUcElDZW9SbXJsRm8vdmNpSWZMK2lLOUFGcFVhbEFKcS9XMXJpUmFjK3NH?=
 =?utf-8?B?UW0vS0RkNGhNMUxEZERqOC9JaUNYdFB6S0tBR09kWVczcmwrQjZFTHdORFFj?=
 =?utf-8?B?cWhmaWF4bGxwVExNU2p0a1I2OFNJeFZLNEt1dGE2WjVSZ3N3VnppT05aZjFp?=
 =?utf-8?B?eEFqTi9mRGlKY0o0MXBtVEZiK3dGdmZUT2ZKend3RHdQWUtlVENaSnZIeS9K?=
 =?utf-8?B?UnNNTVZpTEZRcTFjZ1ZadGlPWGlEOVBqa0k2VEVORVV6REdFMkM4Z09iZzd0?=
 =?utf-8?B?MW1kcjVRWVNYYWxuREdQTFljcGdEZVJFU2Y4Z1daT3JiR0xXY3RrNWNGa0Ft?=
 =?utf-8?B?RUFmVnB1U3FrNnVscXpMOUxIYkVnb0dWbW5QTnNVYTRCRmhuaEdMbzFpczBR?=
 =?utf-8?B?R1pmbzdXVXNtNXlNMXc4WXhScWpyMnc3TzR5Q0NxZ1VrZlB2d0pDcHZwdEdp?=
 =?utf-8?B?bVdWL1lmUERqOHhSTk1Iamg4c2c4VlBQUmxLcG92VGx5Qmx4L1hQZ1FQZXlE?=
 =?utf-8?B?Tk1YdDQzREg5YVJHenF6OVlNUE9QSEZPMzFVRjYxdFBlVzFEWi9XSkdWUVlQ?=
 =?utf-8?B?TlQ2Q1dydmwrbXNqb0tRYS9YUk5rWnBZVzlJOW1tOURYZ3hTY0RWcmpnQXpn?=
 =?utf-8?Q?4AVji5AMAU9F0gVAaImNlHqtz?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5811.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbdf847e-f866-4f2e-115f-08db3d70875e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2023 05:16:11.9271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oIFa9zfIKxZg30TsmceYJmN3Ms9F6oqS+FeCxM6Ymutp4TK2QlIkNcH1T2ntxl0HsOIoiv0wdyc8DsZgFh7xJNRTKPJymZvMDEHjT6FaEWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8201
X-OriginatorOrg: intel.com
Cc: "xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Brouer,
 Jesper" <brouer@redhat.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next v5 2/3] net: stmmac: add Rx HWTS
 metadata to XDP receive pkt
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

On Saturday, April 15, 2023 12:39 AM, Jesper Dangaard Brouer <jbrouer@redhat.com> wrote:
>On 14/04/2023 07.26, Song Yoong Siang wrote:
>> Add receive hardware timestamp metadata support via kfunc to XDP
>> receive packets.
>>
>> Suggested-by: Stanislav Fomichev <sdf@google.com>
>> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
>> Acked-by: Stanislav Fomichev <sdf@google.com>
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  3 ++
>>   .../net/ethernet/stmicro/stmmac/stmmac_main.c | 40 ++++++++++++++++++-
>>   2 files changed, 42 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
>> b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
>> index ac8ccf851708..826ac0ec88c6 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
>> @@ -94,6 +94,9 @@ struct stmmac_rx_buffer {
>>
>>   struct stmmac_xdp_buff {
>>   	struct xdp_buff xdp;
>> +	struct stmmac_priv *priv;
>> +	struct dma_desc *p;
>> +	struct dma_desc *np;
>
>Hmm, I don't like the naming of the descriptors as "p" and "np".
>If you insist on this naming, at least we need comments describing that this is.
>
>Does "desc" and "ndesc" make sense?  (where "n" means "next")
>

Yup, make sense to have desc and ndesc. I will update the naming in V6.

Thanks & Regards
Siang

>>   };
>>
>>   struct stmmac_rx_queue {
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index 10b9f8912bb2..74f78e5537a3 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -5313,10 +5313,15 @@ static int stmmac_rx(struct stmmac_priv *priv,
>> int limit, u32 queue)
>>
>>   			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
>>   			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
>> -					 buf->page_offset, buf1_len, false);
>> +					 buf->page_offset, buf1_len, true);
>>
>>   			pre_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
>>   				  buf->page_offset;
>> +
>> +			ctx.priv = priv;
>> +			ctx.p = p;
>> +			ctx.np = np;
>> +
>>   			skb = stmmac_xdp_run_prog(priv, &ctx.xdp);
>>   			/* Due xdp_adjust_tail: DMA sync for_device
>>   			 * cover max len CPU touch
>> @@ -7060,6 +7065,37 @@ void stmmac_fpe_handshake(struct stmmac_priv *priv, bool enable)
>>   	}
>>   }
>>
>> +static int stmmac_xdp_rx_timestamp(const struct xdp_md *_ctx, u64
>> +*timestamp) {
>> +	const struct stmmac_xdp_buff *ctx = (void *)_ctx;
>> +	struct stmmac_priv *priv = ctx->priv;
>> +	struct dma_desc *desc = ctx->p;
>> +	struct dma_desc *np = ctx->np;
>> +	struct dma_desc *p = ctx->p;
>> +	u64 ns = 0;
>> +
>> +	if (!priv->hwts_rx_en)
>> +		return -ENODATA;
>> +
>> +	/* For GMAC4, the valid timestamp is from CTX next desc. */
>> +	if (priv->plat->has_gmac4 || priv->plat->has_xgmac)
>> +		desc = np;
>> +
>> +	/* Check if timestamp is available */
>> +	if (stmmac_get_rx_timestamp_status(priv, p, np, priv->adv_ts)) {
>> +		stmmac_get_timestamp(priv, desc, priv->adv_ts, &ns);
>> +		ns -= priv->plat->cdc_error_adj;
>> +		*timestamp = ns_to_ktime(ns);
>> +		return 0;
>> +	}
>> +
>> +	return -ENODATA;
>> +}
>> +
>> +static const struct xdp_metadata_ops stmmac_xdp_metadata_ops = {
>> +	.xmo_rx_timestamp		= stmmac_xdp_rx_timestamp,
>> +};
>> +
>>   /**
>>    * stmmac_dvr_probe
>>    * @device: device pointer
>> @@ -7167,6 +7203,8 @@ int stmmac_dvr_probe(struct device *device,
>>
>>   	ndev->netdev_ops = &stmmac_netdev_ops;
>>
>> +	ndev->xdp_metadata_ops = &stmmac_xdp_metadata_ops;
>> +
>>   	ndev->hw_features = NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM |
>>   			    NETIF_F_RXCSUM;
>>   	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
