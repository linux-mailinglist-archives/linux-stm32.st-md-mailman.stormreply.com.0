Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEFE800C66
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Dec 2023 14:43:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B7AEC6B47D;
	Fri,  1 Dec 2023 13:43:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7E42C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Dec 2023 13:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701438195; x=1732974195;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XBlab6cUP0UzblnQ1S/5MOz/UggsWJmt5+Nkuwg6rog=;
 b=EJJlT+1L0gBt8E/udwsSXT3gdbd2L0LgG28bsHzckbyQYyQaSAmbHUex
 lFW/Rue526plib5MVC8Q7nJUGI0o+Dd9cJ4vLSApj9+A1+uDsMYZLhsjn
 Ep9jzEH+bUhOo6etm4tYJQub82N5WvQvT0Z+ZHtih7afnwpIT/CrpbC+e
 rpWOIEaZnJ7DaWeQYtnPgspINVMvugzptIQgBgTFX0WKxUCdeDSz8gtNH
 i8Af5jy9kazR7LSM+Cy+e6o2OyFn7zTYiwFs5TBcOHCJuWlM5BNbHUz2n
 IOZrLAibvgb2GTuJgA3WmQkKWk3CaRlBM1X6+sF5w1J0FzUZ5mJNxQVZ/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="396302281"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="396302281"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 05:43:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="798731580"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="798731580"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Dec 2023 05:43:09 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 05:43:09 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 1 Dec 2023 05:43:09 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 1 Dec 2023 05:43:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjyhLFvAwEZHltes+HyTxqivPCckLhnD7/yfX9Ob0YBoKsYk7ZfKrK9rnhY9gYkwJ+NPeu8S7Bxonbbd9Wd6NJSmmswraNmG4brN5annfqgblyykwNpp9fpFt/dR30THZqtBqQnFUP9WV3kkrtMDEkXzu5NdD90BVEsfCqH8/HCCCl58Jp59vTQtHfL2GTxZ49rXYu3KOstih2bvmYhTsudn/MWsLjmOstcIcyl95QQsF2M/oxjoRrQHe4yKjYJ/q1G+FlygpWxCWYxCBA5fi7z559PlI1i7NjcHZvpP2DzeshH+hUbYErFLr3xNzMVF+hGujvrDqv6MpO+/TBzjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBlab6cUP0UzblnQ1S/5MOz/UggsWJmt5+Nkuwg6rog=;
 b=lo455dBYxBHsXGsxzFV6T4kbGpPGA1FINzT2I+QZMN/AZeWqlo7cyGZw2jhhLRlIzvpPA33RkQTy2HADwtZqFFNziEZ2UF9SffbY8y+cqMvlFNMK2qGRSiuXPG9oY/BuFPJe4gEqNf4RG2QiMNNDWqr86yo11jgSYFlnGNCofy5P6xieYPyge70idJMQlQMH7PHwfVABh3w/lMohrq125kDzT6WMSdK0qpPdd/xcmcm0qxZpKkJGGvokLUQShHUyyrujWyLAk2EvO2RYkp74sLP7XlCRMfkC72vNlOC1mwjOgv5pqpAUVP9XaZCcBUJAznArm5ZDgLsm8d+6oMhhTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 by CH0PR11MB5379.namprd11.prod.outlook.com (2603:10b6:610:ba::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 13:43:07 +0000
Received: from PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::6ffc:93a3:6d7f:383c]) by PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::6ffc:93a3:6d7f:383c%6]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 13:43:07 +0000
From: "Song, Yoong Siang" <yoong.siang.song@intel.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet
 <corbet@lwn.net>, Bjorn Topel <bjorn@kernel.org>, "Karlsson, Magnus"
 <magnus.karlsson@intel.com>, "Fijalkowski, Maciej"
 <maciej.fijalkowski@intel.com>, Jonathan Lemon <jonathan.lemon@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev
 <sdf@google.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Tariq Toukan
 <tariqt@nvidia.com>, Willem de Bruijn <willemb@google.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, "Mykola
 Lysenko" <mykolal@fb.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, KP Singh
 <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>
Thread-Topic: [PATCH bpf-next v2 0/3] xsk: TX metadata txtime support
Thread-Index: AQHaJB8W7iUch8mtVUCDEJ1OnRle9bCUPv4AgAAvtGA=
Date: Fri, 1 Dec 2023 13:43:07 +0000
Message-ID: <PH0PR11MB58306C2E50009A6E22F9DAD3D881A@PH0PR11MB5830.namprd11.prod.outlook.com>
References: <20231201062421.1074768-1-yoong.siang.song@intel.com>
 <d4f99931-442c-4cd7-b3cf-80d8681a2986@kernel.org>
In-Reply-To: <d4f99931-442c-4cd7-b3cf-80d8681a2986@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5830:EE_|CH0PR11MB5379:EE_
x-ms-office365-filtering-correlation-id: 835c06d4-d99d-4f1d-49f6-08dbf273736e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bnZS0az6aI0NVCStd90yEaDKJvqG8afoY2V8p4JNGimXpyRktmumw0OuJj21J/tNRKhqSRNDlg3IO6iTx86XMZoOlhPTuj6NTpIqTfNlZoXNw5moAeu0KPM6bPxZQbUpunlAZ8SY1+eCRLO6gJXg81tI2gOLpE6CqdQ/VFhWqpC3YpPWhFGDs8KhKtRinZDw/0LhX9PFQ9MDf24izKv8Sgf0Wf4BLnk+cUKr9oaD0qKkTk79zY0khfl4huuZ5T2EeHwKwsUz+Zsf9FNBnj7JDnxqHol1EApEhozv4igcTf2stDyXIJ1vwwg93q9eyRCjoxLtebP7A4RvjPe7qpE3Ko0pVERxxE1qxPkSzPPMUljsMUNGdX/EO2aIDbYgagG45w88RTnpFxbwBmvLFzWHZMJI0TkfK9ibCKcbsTfY1FIT60Pru5/UNlQTlLT5lpHSihJVzNmZqDm3cPCIfzXcdb4QkiEXOQyjBW1cYOj7eRtbJmZc3BQ6refXVcSVCdE2ysDbZspPj2KKUoGLTeMiw2TlMWFL78VPf/3iG4RUb3W6d7qigDQoM64S1C9xK+bD/4Krfd58ocaAihzaoxPvdmQWKMTyMrOMpDIJAajxBea1bArcBNUrqpMOsegU4sXRxu9NkivHkGPVGPcSDkMfFg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5830.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(376002)(136003)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(2906002)(4326008)(52536014)(8676002)(8936002)(55016003)(26005)(110136005)(316002)(41300700001)(54906003)(76116006)(66476007)(64756008)(66556008)(66446008)(66946007)(5660300002)(7416002)(7406005)(9686003)(53546011)(6506007)(7696005)(83380400001)(38100700002)(82960400001)(122000001)(86362001)(921008)(33656002)(71200400001)(478600001)(38070700009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TC9zZkJIMVIrYlMrSlJZTUJsVU1vRUxrV0JWeW9qNmNWekxmQk4vemNHZUw1?=
 =?utf-8?B?Ym9kQlY4LzZTQ2Q5NWhLdnBKM0YyRzh3aVZwT0EyV24yeGZKOGVRV2REV2k5?=
 =?utf-8?B?UmlTN3NZYk1pRTkwSkV5QUxFcVlORDF4VVZKZ094Z21oT0Z2c1psNXR4UzVu?=
 =?utf-8?B?cnF0RDZDWVkxQlNYVkJHTGVUMmpWaGQ2YTB0Yi8wcElDVVBOYXYvWlJYTVlD?=
 =?utf-8?B?T1JoYklkNlBxSStnN3krZ0FOczlqdkNYRFNyc2pTaElidCt6YS95cC8zeEQ4?=
 =?utf-8?B?VWtITGxkZDdxQkdUdGtjZGhBV2pCRzBkajY3b1Bqc2p4RnRMWWtqWlBXdFhn?=
 =?utf-8?B?QXd1eDlFbTBDNzJELzdyYmovM3N6V1BaelF5VFhzNWRLTUkyNW5jRXRTcmhT?=
 =?utf-8?B?YUFXT0JVUlhlQUVFb0kvM3hqRmpOMFRxeE4xUENUK0huUUhIVU10VU9YZ2t0?=
 =?utf-8?B?ME40UnNKMTBDbzl5eXd5b0YyOFdoM1R2NllSQ0dIdW90TzR4cGZwcTk2V0hp?=
 =?utf-8?B?Ui9Vd0lvbXdJdExENDcrS3VwTmIwRmtnNklNSWJJNHhNaVlXZmFBNHpySHE3?=
 =?utf-8?B?OXZUZ2FSa0dWZjNoVHhmV0Q4MUtnSHdzK3NFVlJzSmVwaFRueGt0QUFMZnJ4?=
 =?utf-8?B?V01GbHFLeGNiRUJSVTlYanB0Y1ExSHlHd3VoV0ZBK3FNNzhpUnlDTTBJSXlN?=
 =?utf-8?B?TVYyTmNGWXNJdkpvdDJ4K1hNL3cycGF4a3J1ZmsxZTBXQlVzY0dhR0xwRjdX?=
 =?utf-8?B?QVFLZjBPQmRNdXkyY1JTR1RuWjgyTXVxTml1MU4vc0YyL3Erb050ZDIyempC?=
 =?utf-8?B?Tm4zd2V3SmIrbEE3MGp5NXNLQ1lWVEtSa0xoRjJzV1ZGcXhYSWZ6YmFYSDhV?=
 =?utf-8?B?LzM5cnk2T2ZEQ2grSkllNGFPZmlrYzcyNTY2YnJBQWlkbGpMckx3VFcrYXlr?=
 =?utf-8?B?Mm1FazlNZURBcjM2MzJTdTExdjd0T0M4clVLZ2NYRDJrYSt2ZXU1WUNBTFZv?=
 =?utf-8?B?SDQ0UXphNEJtSHkrcGVXc1k5SkppeEprcjBBQ3YrTjdRbTBFaFFYVWoyYzZk?=
 =?utf-8?B?cE5tUGZQUERheFNLWHRDVEh0NGsxdm93dXJRS2ZxSEV0dXgrTjVEaFM1VzVC?=
 =?utf-8?B?dU1sL21YOUJ2dC8vMkVOVWJOVy9sTE0wY1lHWDBZd01USUljR0VneGlPd1kv?=
 =?utf-8?B?b2R0ZEU5S1FISWROdE9WbUN3TEpabW12aFpBSzdneTV3OWw1clBvNkNkZkhC?=
 =?utf-8?B?Q0tDN2VXVC9qZXpJcHJJZHl5ejFBcm1WQjBtc2JCTFJpamFqNmxRNDhGQlRi?=
 =?utf-8?B?dzdRV1dDWjE3Mm5oeXMwcEtTd0NubDFOYnY3dnByckNyc3FYK3NjQnFGVDNZ?=
 =?utf-8?B?VHZJZUFHMndzQUh5c3M5d0VLSWNFMkcreTdhZ0dCank3UDF1dzQ1Ti9IZGI2?=
 =?utf-8?B?YWlPNHdrQWM2WUdMRk01NWVhMkEwZFF3Uko0c1dGZnluWkVtU3pvMTBTRmlS?=
 =?utf-8?B?QlJpdlYvai92Mjk5azNYRGtLdC9MOGs0RXU0bnQ1V0FZeDU4RitDUWhDOG1H?=
 =?utf-8?B?MVl0dWxUYkdnQzJQNHI3SXFqTHZlM0ZjU3d5dUhIeTIyUCtpd1B2OEZ3RndY?=
 =?utf-8?B?TlE2cWJqaDd1dEw2OFM1Z0FBQkNXdTFIUUhJZnlIZitPS2pXczE3MGxHT005?=
 =?utf-8?B?Z1dEaFQ0TGdsaGV1S25paFRoTW91K01VV2x2NDF6NCsvSHF2aUhpNDFHMSt2?=
 =?utf-8?B?bGQ3SzZXTUVVS2F4S2V2RTlLWGhpNENkVDJuaWN3ZVRMWEZXQVorQ2pzUUtx?=
 =?utf-8?B?YkZZZVk4Tk5ZTXNrYkgzVzFEVi8rOUZxbU5oVTRQRlJYZVJ3M0J6RHd3dUR2?=
 =?utf-8?B?ekNPd2JsTmhyeUZFZjBhQU91d3NabHZUQUdiSXdVRUl6SlhxVnprcEVLVGZP?=
 =?utf-8?B?MnJSMHIvMlU3dHpBRVJxcU1ZbUFZVlBSRVZZbGR6dzRZMERmTk1kbnp5TWF1?=
 =?utf-8?B?MXd4U0U4UWw2YVlQSFdWY1lxZS9SbEs4VmdjRzhCMlFvTjlTcVF6bWtpVm9R?=
 =?utf-8?B?ajZVanJwaXBtMFdNRGZWd1Y0bDZsbFMzTGFsbUVoblNGT3NPS0RXVXhEY2xn?=
 =?utf-8?B?VUJMbWlwclFMOXNKYVFLd0hPMHI5aWFUd0F2T1BxUXdUQmJOQng0UEpwUWQv?=
 =?utf-8?B?VVE9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5830.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 835c06d4-d99d-4f1d-49f6-08dbf273736e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 13:43:07.4313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LTHtJtvo9PzdK2KByLb8dnkXya/VJPsyHIF0l5CDB71kcRg9dkJdqpCKsfxNd5OMRXenX7I80eLdNWSVbEZwf2wqVChM2c7bHfpXvnhCdRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5379
X-OriginatorOrg: intel.com
Cc: "xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 0/3] xsk: TX metadata txtime
	support
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

On Friday, December 1, 2023 6:46 PM, Jesper Dangaard Brouer <hawk@kernel.org> wrote:
>On 12/1/23 07:24, Song Yoong Siang wrote:
>> This series expands XDP TX metadata framework to include ETF HW offload.
>>
>> Changes since v1:
>> - rename Time-Based Scheduling (TBS) to Earliest TxTime First (ETF)
>> - rename launch-time to txtime
>>
>
>I strongly disagree with this renaming (sorry to disagree with Willem).
>
>The i210 and i225 chips call this LaunchTime in their programmers
>datasheets, and even in the driver code[1].
>
>Using this "txtime" name in the code is also confusing, because how can
>people reading the code know the difference between:
>  - tmo_request_timestamp and tmo_request_txtime
>

Hi Jesper and Willem,

How about using "launch_time" for the flag/variable and
"Earliest TxTime First" for the description/comments?  

Thanks & Regards
Siang

>
>[1]
>https://github.com/xdp-project/xdp-
>project/blob/master/areas/tsn/code01_follow_qdisc_TSN_offload.org
>
>> v1:
>https://patchwork.kernel.org/project/netdevbpf/cover/20231130162028.852006-1-
>yoong.siang.song@intel.com/
>>
>> Song Yoong Siang (3):
>>    xsk: add ETF support to XDP Tx metadata
>>    net: stmmac: Add txtime support to XDP ZC
>>    selftests/bpf: Add txtime to xdp_hw_metadata
>>
>>   Documentation/netlink/specs/netdev.yaml        |  4 ++++
>>   Documentation/networking/xsk-tx-metadata.rst   |  5 +++++
>>   drivers/net/ethernet/stmicro/stmmac/stmmac.h   |  2 ++
>>   .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 13 +++++++++++++
>>   include/net/xdp_sock.h                         |  9 +++++++++
>>   include/net/xdp_sock_drv.h                     |  1 +
>>   include/uapi/linux/if_xdp.h                    |  9 +++++++++
>>   include/uapi/linux/netdev.h                    |  3 +++
>>   net/core/netdev-genl.c                         |  2 ++
>>   net/xdp/xsk.c                                  |  3 +++
>>   tools/include/uapi/linux/if_xdp.h              |  9 +++++++++
>>   tools/include/uapi/linux/netdev.h              |  3 +++
>>   tools/net/ynl/generated/netdev-user.c          |  1 +
>>   tools/testing/selftests/bpf/xdp_hw_metadata.c  | 18 +++++++++++++++++-
>>   14 files changed, 81 insertions(+), 1 deletion(-)
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
