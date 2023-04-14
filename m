Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2386E1977
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Apr 2023 03:13:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E6D3C69066;
	Fri, 14 Apr 2023 01:13:14 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 385C8C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Apr 2023 01:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681434792; x=1712970792;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VCI5DUGxh8ilz8LiajJPQ9HLoNgbFvIdHA3rnCglT/A=;
 b=JCdJBnDTYVjpFzI7FRm7OY1CxDQmNmH+3YoQMg/BxPVz4OZUJ1BWgpTA
 msL4QJOyN4z/aSzP2rOJf9vO8y0V+f5k3EdxQ2QfiqNu3oOZNwGCNeozb
 EGjsVrkUmLcGjoLMO74j/50EUgTGNFa2XO0EH/RBlygzoIYn6NXkOWsCj
 PUPSdEBeAiflrIyyqIpXXkqQ+l6IVFUOTHtfOT0YSyVMQ4o74EQsR5x7+
 BchewSM6fYMA7S7Nm3X2QddwjlJ18mES7PRBSuJ61vjTHnCFoqy3FC20F
 7RUAXwSc6APUcFb62lsAzkVGiyYn16c4zH9deZSvcBFaARfDeL8+KdBB3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="407220622"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="407220622"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 18:10:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="800999413"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="800999413"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2023 18:10:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 18:10:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 18:10:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 13 Apr 2023 18:10:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 13 Apr 2023 18:10:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+g+2svl6rIoJrJpIDJZivuskGoOnuMhKSrNOX2hT5fh3+z9/eiwnZnG+pMDpQOzJQIjAq+Z/e/pvy3PKRPwcZertPTmQePgtqXaOdhCJ5G+4LBwAW7aBxRz3wE66EdV0NcC0nYiGEXTTelkkz7zU+kb8IeMBwfbgUAvy/1aUtV6MViLfB4c6KVNTKBDfzyaxgBmuA6i6zr0zMTb+oLTVg3GDtIJOlMR/QW3Mv3jHsfgFl56YghlTh8zcVuZt1AIi46vLakx9kk0a2DfBdDDDE3n5fJkHm/W/ym95J4yjgaXbsY1FtGyTs7aFaijso+LqNvNNKBgnxLDcmzcSgpF2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCI5DUGxh8ilz8LiajJPQ9HLoNgbFvIdHA3rnCglT/A=;
 b=j7J7oiKpQTTfQ6enjHvvB6BVBZ6L0mjs2XHy4jqTaRS1cu+pvaZj4yZJ+gs6FoxzgZW+YgIwdx4iy0KeBHttlNeCQ2sZZJXgwf3Sx4yq5cLEZ+Ubz9ByoJBMaExFolOHUcFkPL0d6UmWcdQMUiYrtb6a91rHxuuwo+6aKKvOdolMvgKaI27bZjUW76FIZKXP0mF6g9tu5u90gO2QQdXVIa05UM8fwazEqwHSpydZ2hFU16BAwyhyG9e33uhI+gLX0JGSk1wsS8TY4B0gsXw76D/JkUmNhspCL2rRPhbAzmBnPmuf60KvZfL21dAQStGDcc+z1p1AWa2DgCfmhhLWLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 by MN2PR11MB4614.namprd11.prod.outlook.com (2603:10b6:208:268::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 01:10:04 +0000
Received: from PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::1c4e:86ae:810d:1fee]) by PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::1c4e:86ae:810d:1fee%2]) with mapi id 15.20.6277.036; Fri, 14 Apr 2023
 01:10:04 +0000
From: "Song, Yoong Siang" <yoong.siang.song@intel.com>
To: Jesper Dangaard Brouer <jbrouer@redhat.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@google.com>, "Alexander
 Duyck" <alexanderduyck@fb.com>, "Ong, Boon Leong" <boon.leong.ong@intel.com>
Thread-Topic: [PATCH net-next v4 1/3] net: stmmac: introduce wrapper for
 struct xdp_buff
Thread-Index: AQHZbbfAhpk1/Yp8/E+PaSaWefAbMq8peg2AgACFhqA=
Date: Fri, 14 Apr 2023 01:10:04 +0000
Message-ID: <PH0PR11MB58304F87C004D7B243131468D8999@PH0PR11MB5830.namprd11.prod.outlook.com>
References: <20230413032541.885238-1-yoong.siang.song@intel.com>
 <20230413032541.885238-2-yoong.siang.song@intel.com>
 <203ab7d9-3695-f734-92b5-503118444108@redhat.com>
In-Reply-To: <203ab7d9-3695-f734-92b5-503118444108@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5830:EE_|MN2PR11MB4614:EE_
x-ms-office365-filtering-correlation-id: 2adb0ead-15f2-4d0e-157f-08db3c84fab1
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2YR+21GaqBGh7S+jIUp3NQvg7BiZ/Mri3wLCmKpJpnxd5SES1AsCrRD/wJwRJjd1WMVr17KQvXUKMHAINZZgpES0VxszD8evwl7lx5PSw7VLVIsQ1nCMSANi7y2Kg0RoCRLwHnKs2yiYO4BWJ6W1eM5PO46nMeeHFTHZ1Gbcde8eAOz+TZ8fcJYDL9nyIcR/8kiPHuhMCVdNI29JWHyjraclWEU1hZkSWu0KtuSG5gzyws18g4YyseS7gVPI/4cXTZZD/L/6Y6OIM+qtcdPFIxeqd7l4J1nU8zfLvj0c+AOwI/Cr5+uK/Db3ggFIfjhb/1Ye1f4JCJJy7SjmftUSSOR3ujF4XLQ7VzJ9zSoxMHULSCxGByVzDtPUIaCGWXmRCdqMIUlfGcVxxhT/UkkXvrhbx5jrNzzkGzYd/hQpzPxA/YiXarlRX5UOHDSASPU3ufPJVHwrn/586L7ekVbZkarqxI1v036o7W7CTKaRY7PWVighkH0x/SgHGkzdv5RYWAwzB2lX9Ao9P9sSDxUutoImCgFiQkKvCO+Zy9RtDPrvJ+/xqVfAJhxJpBlL4uShaF8vbJqkU6DSDUaFkVlC8TDcRV/6AvIAxLUtHsdRwuTc0DpB1IHZeb/riQPZiXoy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5830.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199021)(316002)(4326008)(38100700002)(64756008)(82960400001)(66446008)(66556008)(66946007)(66476007)(76116006)(5660300002)(41300700001)(52536014)(7696005)(71200400001)(966005)(86362001)(55236004)(54906003)(6636002)(26005)(186003)(9686003)(53546011)(6506007)(38070700005)(2906002)(83380400001)(7416002)(8676002)(8936002)(55016003)(33656002)(478600001)(921005)(122000001)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTRwUUdaMXJla0RtaUxob2FnVXJCM1drRjhDc0tITUlnL1hiYlV1ZUVkeDZh?=
 =?utf-8?B?bGdONFJzcmNZNVBqTDA4V29iWnZtQVhkS1BodWNEMmZ0Rmxqcy9RdzhScUw5?=
 =?utf-8?B?QklHcFRhL1Nvam5SUG5qNkFRNFlHbTlSWkhMd3MxZHM1M1RhSHpvZUNHaC9j?=
 =?utf-8?B?TVVTU1ZiWndQVHZHd2xwVVFDMXBHNXYyM1dnT3M1QllJL1JDR2ltK05QdTJk?=
 =?utf-8?B?QU9YaGxOSjlCbWNWYytQOG9uK1dpd1QrOE14SlZTQll0ajRCTDFaUDZBcGpK?=
 =?utf-8?B?OEsrNDdZOFpDRm16cndqRGJ2Sy96UGU3ZVZlcEl4WVVSTW9sNTBSRFRkZU0v?=
 =?utf-8?B?cnk5eGY4RDRoTktoMkx4dStyalhqcDJiNmdMTG53S0s4azFnYkg1MS9SQkM2?=
 =?utf-8?B?SUJ0aWI0Wm5OQ1IvNmFWMFVEMmRLUVk3ZThpa0tJOHhEdEZIT3lpV0g1UVdS?=
 =?utf-8?B?WVY0MVJoWlNYT3Q1ZTlsNURuMllHLzliSHh0azJYYyszNHh1Nm5CWUNCcU8w?=
 =?utf-8?B?Vmo2bWpZMllQWGJxUlRsbXNpVTF3M05jYmpLajBGeFpacU1OQWRPa3JlZjdV?=
 =?utf-8?B?azVyaElzRzdXZWkxTmRKN1FObThjZFYwdlJvTnBxbkJTRHRYczM0QXhLZXA1?=
 =?utf-8?B?ellhVi91UmdYcGpCbTFseUpublEvTVVzT0FxVFV3TU5ZeEJ1ditRR3VVMFJC?=
 =?utf-8?B?TGZGYnZJSmZ1cUFvNnhtRUpvc3lDZU5Kci8zblBMWkJ5WmRPYU5ndnQyZDc2?=
 =?utf-8?B?dVdTZDQ0SzRNTXQxSkpYT2NxTXBtTXNUNUp0VWdSa1RaeENEc2JROERZMC9G?=
 =?utf-8?B?WTREWEU0UkdCNTZ2QmoyZktuR1lkQTlsWmFIUnUwZ1o0OEN0dEMxTGxKTVFh?=
 =?utf-8?B?NDlRR2RPd21HQ1hLUjR0ZkNJeHlYWTRYd3BHR1JrZHlsMWtmZDJla3dtWit0?=
 =?utf-8?B?M2tqNUFEM2R2SUZKYW5rQTNJazhaR0Z1dzVEdW1FNkFHdzR2QzByNjVia1lW?=
 =?utf-8?B?M3VpdjhOelFXNUV6U00yUXA1bm41UzRlL1RZVmNEMGdhbzgrWVFycU9GbnRI?=
 =?utf-8?B?cXlXNXBMb3JZVndnU0Z4aG5wcktib21zNEVwMU1ua3ovK3NGdXZ6Z24wNmNi?=
 =?utf-8?B?eitYTzNhQzFjUWdjS29KeXRkV2luSWU3aVZaWkROZjRpWWduR0tEaTZrckpl?=
 =?utf-8?B?ZzNsNCtjeXBBTnlIRDZVdnBGNSsyZWZqVCs5M3Uybmp2azBSWTJBY2pHQlcw?=
 =?utf-8?B?Mjdrd0RTeURWMUozMmVlUmg0bXJPbG5JMnREc0g4eCszenJyVXdocnhhbWlY?=
 =?utf-8?B?YnNUNzBDSm9PMThnT2lyYlFvWHIwbU1Wb0FaMXJKQ2NIeDZXUjVtcitRak5H?=
 =?utf-8?B?QmtUUkFQK3dTT0VmYmZOZmlkdEsrMGhVenR2YTVLTDJMV0RBL1FzSmJJMTZm?=
 =?utf-8?B?OGNTNGJWSWtUQ2JvU29jbnZxeStIVVZkZ3V2QmVnV25YVHZTL2xZZzg5Z2JO?=
 =?utf-8?B?L2xENEZrNElOcFNtRUJoTkFxS1paZ2RGVEdTdHBCSEZYcUhUTVRMblRwakNr?=
 =?utf-8?B?bW9PRkNQejhacHVTVzR6bEN6aU14enNTejUxNDcva0JCbS96UURpN1lVZFdZ?=
 =?utf-8?B?UTZ1WFBLRURQNmtOcDF6d2Nwd2NESS9venpLOVNXMktnZ0JKYTRlY2lacnBv?=
 =?utf-8?B?ajBJUHJTUzM2dEYwMkhualVCcndnUFNsUk5vNVhncVhrNVhLSForaFZodUJ5?=
 =?utf-8?B?UjFJbWowU1RpZUhSeDZZSjdUaUNzTjh4Sm5YZm4wbW1EYmY5eFRxUWtZRFVH?=
 =?utf-8?B?NktWUXh0UDh1eFFkRUNhSGdxR3dWMHh0dVI0ZTlNTTJwRXFqaXFzcDdmVlQ4?=
 =?utf-8?B?c3orZy9pVkh6M0FqbnZZTi9SVEpPQWRxdG1nald1ZFROUG9QNlFYYVo1NnNo?=
 =?utf-8?B?RHVjd1hSS3V2eFZuSE9zaUF5OGRMUGYrMm5MYmxiRDFyMXlidFh0K2EvKzRH?=
 =?utf-8?B?QTFEeC9Ec1VRY3lOaytBUS9rRnJabFFvU3VrQ1VGSHdSV0xXc0dyd0NPbE1u?=
 =?utf-8?B?K3VWVGRybXl1ME1CL1JxMnVVMkRYT0g2UlhZUnRWYkYwM0JPZDFDYkJhS2tX?=
 =?utf-8?Q?y4emsdVVSXwductsj0H4FeJ9N?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5830.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2adb0ead-15f2-4d0e-157f-08db3c84fab1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2023 01:10:04.2096 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lRqpDLZCDbC/yEsDacu1MDWDIS447ChNo1p5DzOzJR8HqoFuYFc5uU3r2HyG7uD8KAc1X7GUHMkvHeA827FZqyDR/BEpxCQE0PEuOEVitso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4614
X-OriginatorOrg: intel.com
Cc: "xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Brouer,
 Jesper" <brouer@redhat.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next v4 1/3] net: stmmac: introduce
 wrapper for struct xdp_buff
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

On Friday, April 14, 2023 1:10 AM , Jesper Dangaard Brouer <jbrouer@redhat.com> wrote:
>On 13/04/2023 05.25, Song Yoong Siang wrote:
>> Introduce struct stmmac_xdp_buff as a preparation to support XDP Rx
>> metadata via kfuncs.
>>
>> Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
>> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/stmmac.h   |  4 ++++
>>   .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 +++++++++---------
>>   2 files changed, 13 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
>> b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
>> index 3d15e1e92e18..ac8ccf851708 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
>> @@ -92,6 +92,10 @@ struct stmmac_rx_buffer {
>>   	dma_addr_t sec_addr;
>>   };
>>
>> +struct stmmac_xdp_buff {
>> +	struct xdp_buff xdp;
>> +};
>> +
>>   struct stmmac_rx_queue {
>>   	u32 rx_count_frames;
>>   	u32 queue_index;
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index d7fcab057032..6ffce52ca837 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -5188,9 +5188,9 @@ static int stmmac_rx(struct stmmac_priv *priv, int
>limit, u32 queue)
>>   	int status = 0, coe = priv->hw->rx_csum;
>>   	unsigned int next_entry = rx_q->cur_rx;
>>   	enum dma_data_direction dma_dir;
>> +	struct stmmac_xdp_buff ctx = {};
>
>This code trick {} will zero out the struct.
>
>Is this done purpose and really needed?
>
>On x86_64 this unfortunately generates an asm instruction: rep stos
>
>A repeated store string operation, for zeroing out memory, which is slow.
>(Because[1] it supports be suspended by an exception or interrupt, which requires
>it to store/restore CPU flags).
>
>[1] https://www.felixcloutier.com/x86/rep:repe:repz:repne:repnz#tbl-4-22

Thanks for the useful information and link. I will submit v5 to remove {}.
>
>
>>   	unsigned int desc_size;
>>   	struct sk_buff *skb = NULL;
>> -	struct xdp_buff xdp;
>>   	int xdp_status = 0;
>>   	int buf_sz;
>>
>> @@ -5311,17 +5311,17 @@ static int stmmac_rx(struct stmmac_priv *priv, int
>limit, u32 queue)
>>   			dma_sync_single_for_cpu(priv->device, buf->addr,
>>   						buf1_len, dma_dir);
>>
>> -			xdp_init_buff(&xdp, buf_sz, &rx_q->xdp_rxq);
>> -			xdp_prepare_buff(&xdp, page_address(buf->page),
>> +			xdp_init_buff(&ctx.xdp, buf_sz, &rx_q->xdp_rxq);
>> +			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
>>   					 buf->page_offset, buf1_len, false);
>>
>> -			pre_len = xdp.data_end - xdp.data_hard_start -
>> +			pre_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
>>   				  buf->page_offset;
>> -			skb = stmmac_xdp_run_prog(priv, &xdp);
>> +			skb = stmmac_xdp_run_prog(priv, &ctx.xdp);
>>   			/* Due xdp_adjust_tail: DMA sync for_device
>>   			 * cover max len CPU touch
>>   			 */
>> -			sync_len = xdp.data_end - xdp.data_hard_start -
>> +			sync_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
>>   				   buf->page_offset;
>>   			sync_len = max(sync_len, pre_len);
>>
>> @@ -5331,7 +5331,7 @@ static int stmmac_rx(struct stmmac_priv *priv,
>> int limit, u32 queue)
>>
>>   				if (xdp_res & STMMAC_XDP_CONSUMED) {
>>   					page_pool_put_page(rx_q->page_pool,
>> -
>virt_to_head_page(xdp.data),
>> +
>virt_to_head_page(ctx.xdp.data),
>>   							   sync_len, true);
>>   					buf->page = NULL;
>>   					priv->dev->stats.rx_dropped++;
>> @@ -5359,7 +5359,7 @@ static int stmmac_rx(struct stmmac_priv *priv,
>> int limit, u32 queue)
>>
>>   		if (!skb) {
>>   			/* XDP program may expand or reduce tail */
>> -			buf1_len = xdp.data_end - xdp.data;
>> +			buf1_len = ctx.xdp.data_end - ctx.xdp.data;
>>
>>   			skb = napi_alloc_skb(&ch->rx_napi, buf1_len);
>>   			if (!skb) {
>> @@ -5369,7 +5369,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int
>limit, u32 queue)
>>   			}
>>
>>   			/* XDP program may adjust header */
>> -			skb_copy_to_linear_data(skb, xdp.data, buf1_len);
>> +			skb_copy_to_linear_data(skb, ctx.xdp.data, buf1_len);
>>   			skb_put(skb, buf1_len);
>>
>>   			/* Data payload copied into SKB, page ready for recycle
>*/

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
