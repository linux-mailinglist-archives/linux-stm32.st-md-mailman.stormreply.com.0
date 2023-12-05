Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9659E8057F6
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 15:55:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8777C6C841;
	Tue,  5 Dec 2023 14:55:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92911C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 14:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701788124; x=1733324124;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=quEpqll2aduFz7+OX3gKJnSwKvMPDKRThVTRfvZV3y4=;
 b=fxXvp6MShznfSOvhNXojdhEbY4aq8FM+TGc0leyKxe9FFvhgfvUUUwAc
 DRrjm0GxwAXhB05a7WO25vy/+12y3qJQmAYAOA4O4+F4z0bLrB3Np4H6/
 lJzjFBIz5lLQmFJusIMt7kfYnCA76DOIuyvHOPiXC45feKuHJPS9ApH7g
 amNU5g9fLrnmCy9g9J7b1Oq0j3/76nGVmcvIoa6Ym2S0GG6jwB4GGdOQ2
 4q5jYd27zEM0t0KWoryL87GtQmmJjSXyLpCSqmPFs03oX96kCtCn3k1L8
 bF59H8fBgQOARe2sF9jJ7u2S3TMBICFaEs/OOFtRw17chfGq/4UzoceDI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="391067702"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="391067702"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 06:55:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="888962999"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="888962999"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 06:55:20 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 06:55:20 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 06:55:20 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 06:55:20 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 06:55:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G58dIvOFV0JFFVB14S23v/JYB4jyiW7IARJXIPSm6KBojvBf5IBOAApa0dyMR/hObD8f4iv0y6bjbom53g0pOhvCkrCZ8WfW1C2P2Bm5b8M6KWEJpKmSbOughPqAjySRiJOeakjbHoCHGaKwndZH3lGceR8mxbnsrvR/PNTcH7egRreA9COsG1ITfBpRs3ioa6Q37wsv5PqHm/RVJh/QNv5Vxog28penySPn70k4LoIJDepsvJOu4xQrcGdKqt66cl9/V9JtNDdXbS211g1GKQGTdKphKsEq5adddySy3trRHoxFhVaQv16ZOW+q3bs+CmiuejTPOaorFy3dJfsrKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quEpqll2aduFz7+OX3gKJnSwKvMPDKRThVTRfvZV3y4=;
 b=dzibRE7DQg/XhNo4EjkY8UcKXtFi6G3brWSgG0HxGp/tw35/DdZr+B7QqAiDaXhve3ZT5Hxs5MEbEzEpIOIe8wVLA1nAagparESu6p97vCmCMc9UyL4LYfBg6ZrJq1nXA311+XugFzHNGDdGkM8H4N1nE7eYxhpKXtvOrujUfW10H8CUXQZJ1u3+/Zyj8sL+y1VYoSAhyJIGjoY3+P8Q2uSqfmyPd+JDhyur+Pd3inc4QvmillFEoMYCAStgDElkXCpGown12ChLyX+N4fQoDjPhBDcwfEGdDwYFz/4CY3715KMvKg9qWYyJ9xAyfXYpr2GpwNviKLxk8IvW89X2gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20)
 by DS0PR11MB8083.namprd11.prod.outlook.com (2603:10b6:8:15e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 14:55:17 +0000
Received: from PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::6ffc:93a3:6d7f:383c]) by PH0PR11MB5830.namprd11.prod.outlook.com
 ([fe80::6ffc:93a3:6d7f:383c%6]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 14:55:17 +0000
From: "Song, Yoong Siang" <yoong.siang.song@intel.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Bjorn Topel
 <bjorn@kernel.org>, "Karlsson, Magnus" <magnus.karlsson@intel.com>,
 "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>, Jonathan Lemon
 <jonathan.lemon@gmail.com>, Alexei Starovoitov <ast@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@google.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Willem de Bruijn <willemb@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrii Nakryiko
 <andrii@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, "Jose
 Abreu" <joabreu@synopsys.com>
Thread-Topic: [xdp-hints] Re: [PATCH bpf-next v3 3/3] selftests/bpf: add
 Launch Time request to xdp_hw_metadata
Thread-Index: AQHaJgkgu2WDkmeo9k63uUvAFocsiLCY6egAgABO/oCAAY4zoA==
Date: Tue, 5 Dec 2023 14:55:17 +0000
Message-ID: <PH0PR11MB5830D9440635CE0E4164BD43D885A@PH0PR11MB5830.namprd11.prod.outlook.com>
References: <20231203165129.1740512-1-yoong.siang.song@intel.com>
 <20231203165129.1740512-4-yoong.siang.song@intel.com>
 <8e20031c-83cb-4927-ab6a-e6b4840e1e42@kernel.org>
 <656de953bcc82_2e983e2949a@willemb.c.googlers.com.notmuch>
In-Reply-To: <656de953bcc82_2e983e2949a@willemb.c.googlers.com.notmuch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5830:EE_|DS0PR11MB8083:EE_
x-ms-office365-filtering-correlation-id: 13f88221-cf4f-4946-90b9-08dbf5a231fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0XLfLlNIslq3F8uZbsC2LEPtHUewGTbCRjPahCxeNjXpdY/SljgIREC4PrS5Y7lJjw5E8wocLaMa14AnzStab2CAfqXkv11RD2YsKokQySCj7ikIb8l66jj1U+edpR+PXYrMsj+/WzQxG7VGtLF33GaqT00CEKVAalpl55CzVLRlkpXYgtkNkZfzWeko5NG6Rmof3o9JTlQmn8J65bO3z1dePFHqrwz7otGdLjl7YavWZ1Aoa/wQtc+VTCQtLyD8sKj3r8Eqcp6cAou0BTbjC3OhKeYHGv9Zb044J1KKfKbPMXjlN4oHQ32zvb9SKC7rBAOGG9JC+P2lSlDBE/MyOP67MoLtUmAO5ntIIaxi2OwE+WeiI/xvhGPM1UokGoAgtSmUQex/HJwQMWj7W6M8NfUSxYHTh1kZh9OLp9/SYhX7thDHLn84K0HxLvdm5yQEwtrbh904KQtPxCfCZRx2O6Jb2uM+eRbxxm5VQQ/QPFgN0M/oHx6UH5AyZ9SQCvU3Rwi5k/pMEZyCmkJn4YEK7Na/5kpK+7u8IWGEeSNM1ni6C1XAtKh1rpF8Ph2i3pJ5rMw6P7iCZy52tmSRcbYU1PKl2ZIDzPRICLgh43TvK/afLpAsqfO4tNWOmckgmYNpBkaLsvZB5I9tSWbkQj/aHg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5830.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(366004)(39860400002)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(2906002)(55016003)(5660300002)(38070700009)(4744005)(921008)(7416002)(7406005)(82960400001)(33656002)(86362001)(38100700002)(122000001)(71200400001)(7696005)(4326008)(9686003)(53546011)(26005)(8676002)(8936002)(52536014)(41300700001)(6506007)(66946007)(316002)(54906003)(110136005)(66476007)(66556008)(64756008)(76116006)(66446008)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0FhMFlCL05rQnN6cE45RlRvSlA3RUN6REtDUjN4MVp4SXRBMkpCT3NSU0JJ?=
 =?utf-8?B?Zjk3cTNiVFM0NXJJRlZSN2c3V2dEc2s1SXBEeWRpeFVBUjREd0h6U0xYbmNR?=
 =?utf-8?B?dEdpcVpsZVpUbG1LMVNvWVRsSGV5TjZBUG9oOHVibjVVaW5zYmdEMHBYZnpW?=
 =?utf-8?B?Wk12dHp6YTltckt0U3Mvd0RsOFA3ODV2a1c1Tm1ESEw3RG9YNXhPckh5RWxE?=
 =?utf-8?B?c2xZQWxNNWlFNjJUMG55cmpsbDZJTEVuWktxN1Q0MDhRKzlCaWp4dmpGVzBW?=
 =?utf-8?B?RzJqK0plU3lubUpJZkp1cmNrQ2hiS0F1MHJSc3F6U2hFYkswSGlnc0RlMXU4?=
 =?utf-8?B?V2N3ekZKYjM4d1B3RzNacGdwaDFJRHB4cU41M0l5NUN0VDZWVXhEeUxCbWJj?=
 =?utf-8?B?aE4wcXFoMndEVXhSaFVsL0Yra2gya0NOMTFXVVY0b0FwTTAxdFBVVHllQWZ1?=
 =?utf-8?B?N29wTzVOUzVzRXZXdXFMVkdMQW8vVVh3NkJtZGFZY2RQVW1UblN3RHpVQmEz?=
 =?utf-8?B?SVkyNzBQTzlXR3FrYitQVm1Ham9wOVFMV2hlTG85cEovSnBqT05NWUdLZ2Jr?=
 =?utf-8?B?K0xTQ29DTVYzL2NEUXJ4LzFqZ3FKeHZkK1NWR1ZvKytLVzRxby9ja1NhQzVs?=
 =?utf-8?B?QTNvZ2NuMWp4VExzcnJPSEowV2JMZWFvdUdWVDgrUWpsWkplOThFbzNBRmx4?=
 =?utf-8?B?UWRFYkFOcFZCUmhGWWttZWVqaGY4NXBweHBxalppYWNoODJJNFBnNkxpNWc4?=
 =?utf-8?B?VndNR3h5RHJ5Vk1NQVNCWUhxaG5CNmNDSG1KWWtaQ3FuemFzOG44Y2pnUkNH?=
 =?utf-8?B?eFhINWpwMUNZK1lyQVRIODBqUWJJOEViV3k4QUl5d0tvaFp2aVpvei94SnV6?=
 =?utf-8?B?a3hDa2EyYUw1K0d5UnRsMjQ0bnhjbnJsVHF4NHQvVGxnQVRLVlkvREZnRDBw?=
 =?utf-8?B?dnE2OFQrME15WERzQ2Zrang5dksrQXQ5Q3FmVWkxbDZPS01rM2k5VW9XTDBP?=
 =?utf-8?B?M05OeVZ5RmpmT1JnLzBJZnRGOGxEODluNitmS2ZUYUpKcUFXdnJDazMyNXZw?=
 =?utf-8?B?NmJvUGtlZXFxMXFnRk50UW1lNnhYQU1uRzdudHFIKzlmTkJFOVFtTURwZzFl?=
 =?utf-8?B?R1FwQ3ovaitQZmRXaUNQNnpVcUcvb2RjSFRoYlk4M1ZNWmhGem85U3RuUks3?=
 =?utf-8?B?SWcyM3pCamNmaWVxME40WmUrUi8wU1ZpMllUcUdFaEMzVkZYOEtTemVWSmxO?=
 =?utf-8?B?aWkvWjZaN043cGdKRVF2N1VvZG5LazcwTGhFQXIxR2pVU1RGNktkSFNLR252?=
 =?utf-8?B?V2lobGZXVkZnR0RWSGVubmdVR2w2OWlZZXNZOVdhN2dzamJaUk1acTdFR2hM?=
 =?utf-8?B?cEhmVXkvcHdrR042V0xmTS9CQnNPZFhaNXlJSmN4T2NjQjc5R3FzU3YyMnVY?=
 =?utf-8?B?dDBoeVVheExYWVJMU2RXUnRlV2NKQTZQMnJtSUxkZGJtUk1kM2lnK1ZZdEZF?=
 =?utf-8?B?WG5vdHNvd0NVd1prU2J0eW1QNDdROW40dU5IRzhMdTFiT215L1duamdzejFx?=
 =?utf-8?B?VmhabnNHRUErMEdBUHlUZGFLSHRvRUN0UnZLTUxaNG9qbDh6eURuZVVmcm1U?=
 =?utf-8?B?S2RtL0JSZzlrYjZ6d25rNkRCdlhpM1NSL0JlRWNabkFJUHV0Z1RpbTBpYXk1?=
 =?utf-8?B?TSt6RVRRWURUTng5OE9kQUtZdUg5RjJwTVBUNzJVOHdzbFl6SXNKMnNlZjBl?=
 =?utf-8?B?cmJSaVVJc2dUcnFSQVZvekdpeDBZZ3J6VUxqUTBrT0hob0F1cFJsSll3bC9Q?=
 =?utf-8?B?eXh5TXVneDYwTkVEa0FZMEZDS0Y0eW15eFJ4cm5rSkpwYmtocGdZcnN6ejlp?=
 =?utf-8?B?cWk0RjZDWGZmazFRK0wwUWVMZlFESWNJQzFZN1BKcVBOQ0Jqa2x3U3NpRy82?=
 =?utf-8?B?WnFNdmx4cElOWWdLaEoybGtCNC91Ly9QUjNhdkhacXZOQk5Ka0VpZHdjS3pq?=
 =?utf-8?B?eW82NlZLRHZrMUlOZ1crL2NCZ3JPeHFNTjhweU5tYzYvdlhFOXZuRGg5L2lz?=
 =?utf-8?B?eDFKam1kRnBpajUzOE5nM01nNSswTWNPTnNycmJEem9VMS9rZ09JQVNTbGZr?=
 =?utf-8?B?KzJsSHpxMng4VXFFSW5Ga0lNYkJiSzhKdkhjN1UvMkEvdHAxcE9leUNIbVJ5?=
 =?utf-8?B?OHc9PQ==?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5830.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f88221-cf4f-4946-90b9-08dbf5a231fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 14:55:17.4865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KMXTy1LlITGWur6llmC2UYSGA0ZgRW2li82bIm3hvwboZHymvmMoxU/ufOd3qjGxR2+kiZR/H5P9x9rWCj8XtjCNG2JlMZFGhGuMsGvAeMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8083
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
Subject: Re: [Linux-stm32] [xdp-hints] Re: [PATCH bpf-next v3 3/3]
 selftests/bpf: add Launch Time request to xdp_hw_metadata
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

On Monday, December 4, 2023 11:00 PM, Willem de Bruijn wrote:
>Jesper Dangaard Brouer wrote:
>>
>>
>> On 12/3/23 17:51, Song Yoong Siang wrote:
>> > This patch is tested with stmmac on Intel Tiger Lake platform. Refer to
>> > result below, the delta between pre-determined launch time and actual HW
>> > transmit complete time is around 24 us.
>>
>> Is there any NIC setup (e.g. ethtool/qdisc) requirements to enable HW
>> for this feature?
>
>Judging from how we currently use this with FQ and ETF, no.
>
>See for instance tools/testing/selftests/net/so_txtime.sh

For stmmac, we need to enable per queue launch time support
by using tc qdisc etf offload command.
I believe igc also using the same way.
I will add into documentation to make it clear that
XDP_TXMD_FLAGS_LAUNCH_TIME only used to pass the
launch time value, not enable launch time feature.
  
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
