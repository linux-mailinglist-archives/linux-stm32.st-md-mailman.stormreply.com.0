Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7717768DC2
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:17:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A820C6C85C;
	Mon, 31 Jul 2023 07:17:28 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42526C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 15:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689953342; x=1721489342;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0uj7w7D3f4vLnclAo6oRJsghLULyJTPCI+tDXEg7g/I=;
 b=KH1k52eSkxjQblln1IrwvVJ3BBF0E5J5nVIn9ja29aMyQTnjww5yYhn+
 oAmmrxZPapKteNBy+qf1hpm9CeUJz10FPI7dw/7QahMtE2Nvw+7qk529B
 4WUQAed9q8AZUFl2wPRmFIdL6+VMDdSNVroOcaSfZHtiC5rUBnWEhRJhL
 Fp2l9Udnq/Bp/uTTfseIYo6q3S+xT0sUGfPUoJUhnODfb+OUAX/pQ/R+X
 b97mHQC7O6+mdEVDgIESlBCH56s2BDkqRGr6lvg4jm0lA+C974FRFbfnq
 fl97MhgcF2jWv8od1K1TJKSZfJCh5FKvQWIFnA7WBBmqFgQdLKokhFhMU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="369717770"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="369717770"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 08:28:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="848856327"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="848856327"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP; 21 Jul 2023 08:28:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 08:28:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 08:28:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 08:28:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 08:28:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzrA3oSzqViXeEAZ2tA40X4eyRSpbG4Ig8BjBcQeWR9j7+8eTF7SVMmIjLd3uxSCAEqeI6Eidn15dRdkavENI/NRfu7ApnyHeYYJZ/ggX0JZYiRuvFGUffB60WLTKDwavsSgBHZJaXWkxu9ruVBo9KDvjRtCnLRGUfwm/IurcqKKi1sPghNrPlKpCrQo7+ORXFTSgPqBbJjL/pg52/Ba1yTp7XlpngHfML4wJ08zfNXq2ImzlMQqTRtbYAgBq5J6FTBzdoVrqjEVfYr8pJ8Z8RzD8TMxOrwc20MLbhOqTwZdP70CqVqx4IWgLTgzlrr6AD5NtsvW9xGpwJaVuwwDPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uj7w7D3f4vLnclAo6oRJsghLULyJTPCI+tDXEg7g/I=;
 b=YwlGACPLwmKJB0li0sVSnICgAU+SrX/jJaJmtzPQlGBfWdkkSATrtZvUhv/mj3QBiR5HMsknWTlCFX5Dm0eQ87S9zA0g70W7N0n0EYpVHrH/4FNXokUJR/gynMVjGEC0r3xD9SBl0WzIcjDCcyy4zmLd3qgs23nL+XcpYr7WcntwXSLylaC5k23An0tO591MsTYm7M9Cv2arCBPtqM40TnoEuPeqGOFTuPe8q8Eh4bigB6qTpfNyGIZNfwMZUIEn+W616UtPdsIx1Ogr9H/DzskmYipXs6Mf5BE1/UC1A5O9kxYc/OW1ix2x8G3P6+qZD+ebnFDphI0+hrV7Pma6pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CH0PR11MB8167.namprd11.prod.outlook.com (2603:10b6:610:192::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.24; Fri, 21 Jul 2023 15:28:34 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6609.025; Fri, 21 Jul 2023
 15:28:34 +0000
From: "Ng, Boon Khai" <boon.khai.ng@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "Boon@ecsmtp.png.intel.com"
 <Boon@ecsmtp.png.intel.com>, "Khai@ecsmtp.png.intel.com"
 <Khai@ecsmtp.png.intel.com>, "\"Ng <boon.khai.ng\"@intel.com"
 <"Ng <boon.khai.ng"@intel.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [Enable Designware XGMAC VLAN Stripping Feature 1/2]
 dt-bindings: net: snps,dwmac: Add description for rx-vlan-offload
Thread-Index: AQHZu5xgG1a+wZGOqU+EmB1OiRdona/EAA+AgABTXyA=
Date: Fri, 21 Jul 2023 15:28:34 +0000
Message-ID: <DM8PR11MB5751EAB220E28AECF6153522C13FA@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20230721062617.9810-1-boon.khai.ng@intel.com>
 <20230721062617.9810-2-boon.khai.ng@intel.com>
 <e552cea3-abbb-93e3-4167-aebe979aac6b@kernel.org>
In-Reply-To: <e552cea3-abbb-93e3-4167-aebe979aac6b@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CH0PR11MB8167:EE_
x-ms-office365-filtering-correlation-id: 863504ba-7bc5-478b-e717-08db89ff25b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FCVSKZY5ONoi72AWEHq3iMUi4aXvbcxrt8dEUnm/O3AXZq+blIeM136lBaInkZ2nH1RgrSzj9zU/750UPpP7UqrZ3bCQkH5/UrEEDRAy1Zy9nXx2yxWTp0C1aELWRRzxaKrZMt3atH7HNSVGpFgDPd6fzpAMQqawUyOM0rjq+jIaACpIx1r0ayIbqyA5Ls9pDPlMP2cMTutrIe1fS6vRmsz/3t5wQc+BtWTPZskoU65miZEmZbykK3i/cgH7lMiDNOV2EpgQ38uyMGz4tUMo8yZ4BWvcIURblLtIaGso56QdeFLZP8NFct+VQA8DrnVQ+rkmYMRx79NhjaGmMHWuD0TNFPCKmFpeMjxC9bGVxPfHK/jmtEO7LIlfqawaSFCiylqOcWOGMGCkx2mS173+GrkBLj8mmvzbTfGey272vVX7dRVTDBN8zyz+HIcAJDLoHVBlv4howEodofU+ueHR5/stn6vATaZitusco/6wzko/WkPdxahx9n87gehuy5prXzisBlPtM/YmvwggOdq98s+HOjZqh+IzsyWtSGCULr313K+woJ01Wa8ML3yxPEgpSIzStnVaG980DBo41gTXBZvqG9rljhO6amC/fCdf2VqFjlaVXCg0WycEgHgh+LsAgGDiCDYTXYfmGfC21IP/YFhR+JwbMnm+GWFeWM4IzEw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199021)(55016003)(26005)(186003)(6506007)(53546011)(83380400001)(4326008)(64756008)(5660300002)(52536014)(71200400001)(8676002)(8936002)(66946007)(316002)(66476007)(7416002)(66446008)(54906003)(66556008)(76116006)(41300700001)(110136005)(9686003)(2906002)(478600001)(7696005)(122000001)(921005)(33656002)(82960400001)(38070700005)(86362001)(38100700002)(168613001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UExFbERmTDl2MmlHcC8rYUhjeXllb0ViS2NjcFJtQXl2WDBybFRyaFY0ZDVS?=
 =?utf-8?B?ODVqa0JhVGhCWGE2emhrNlhEYXJBVkx1VjEydDVrZkVxaDhIZUlhbmNsMXVS?=
 =?utf-8?B?NEtxRHRFNWhiZ0NiWmZvQjZMMVkrRlRjZUhBbnFBVDAxaVZNREFmYkl6ZW9i?=
 =?utf-8?B?U0ttWld3S1p2QkFmNHBFL3RCdmRxZ3d1ZjNGNWZrZER5MUhERWRJRG11TmJV?=
 =?utf-8?B?Vkk1dEhMTnk4SlpUSXZ5dnNCblJpQXd5Rk1DSjU1djdSaWJiNHQ5MjBwWnVC?=
 =?utf-8?B?bEdwa3JNNi9ITUJDUjNibG1xbUwwa3RGcFhxbmZqUmdBV04zK1phV0J1TEtW?=
 =?utf-8?B?bEJ0U2w4Mk5DdlljUGtGREc4dlo5Yk5lMUxhcWw4OVdaMjdkMHZvR1cvNFZJ?=
 =?utf-8?B?MHQyS1R3djYvTys1Q0NaQXhEWVZRazZudDlNMU9FMHdidGRtQ2dOdTBkYnRD?=
 =?utf-8?B?c0dyQ1M3RjMyRllUSElYRUdNOE9VTU14SExlTnpJQmdGSGphc2M3OUNzVHk5?=
 =?utf-8?B?NzEvdjYxcnQ0YVpmd3lKbG9tWm0vY3RpeDBHQmxZWDJmUVd5bGNTa0srZ3gy?=
 =?utf-8?B?Y0tPQm5Wa29xMjQxSjZnd3NNakhUcy9JUzBiUDgvUmZjQ0NLUy9lWjVrMld2?=
 =?utf-8?B?NHdwZGJ5c3BBTUxkZGpJd2RCdG9jS0FMcFBOWjRscXZ5ZG1penJiMU9qbERX?=
 =?utf-8?B?REdXUXozQmgzd21EZmxZT25sM2JzYWpjSnVKUU9DbWpidjFZdTBKWnA5Qk0z?=
 =?utf-8?B?Rmw3UnJFZHd1RmlhWWpza3FBOHdhaStzUENHNmhDTVRMa203bkJwazR5Ynoy?=
 =?utf-8?B?R0pjbHlkZTkwbEFrcTBURkFVZzNVQWFJWElWY0twYWdlRlBhL1J1T2xoU09q?=
 =?utf-8?B?SG9HODJuK0k0ai9sV28xczFyOU9aVnRpMVpOK3NrNEk0VFFmQ2FHZ25qR2R2?=
 =?utf-8?B?WE9VemZqSG9ITGtCNFdkZmVqdUFRQ3JGMGorNElrSzFveFRveS9VSFdxWThL?=
 =?utf-8?B?VTVZTkpLaGlodVVMUDF0emNCcU1mTHVWd2twSjRubyt3R21lSUY3QnNVcGpv?=
 =?utf-8?B?eFl2cTZhR29QbHlnUU5wRlVNcm9VcGFHVTNBWnhEOFk4TzNkcDNqVkNRMVJY?=
 =?utf-8?B?VSsxOGRDUXd4aEg4OFJINVZZOTVrUEdtSGRtd2M5VFNGT21yVkdNbmJmUzhB?=
 =?utf-8?B?d3dRNkRQMXQzeHV1dTdobGQ1V2VUREFBaURLd1NUcmRmcW9mV1NGMXlQUU9s?=
 =?utf-8?B?MzZublhNYy95N1lCVGovQ3c3R0tDWlZKaUNKM2R1ZzZjSUtYMlVzSW95MVZX?=
 =?utf-8?B?L3g0cVh4cUwwMktrMGxsc1oxTHYwQXlTKzJqVTZyVHJvUzdaSGVmUGYzQVJ4?=
 =?utf-8?B?djZmRlREOVpoVnRUS2k0Ym1FaXgwOG11MDNKMFozNGViaTdJR05JQ3QvazIx?=
 =?utf-8?B?OWM1RXB5RDVPYUgzMWRMa0MrcklnVFVZM2lLM2cvaWJaQVdZKzQxaDA1SUtT?=
 =?utf-8?B?bmF6Mjcwa2tDTkZCN1V6OEd0Um9ibFFWaUEyS2dFYTUyTmpHVjNNbUlmSk11?=
 =?utf-8?B?SWxTQ3ltdFFVWTYvdlF5MSt3cTlkOTFmSzdRU1NDdU1FeklnaEZmeTRYSldx?=
 =?utf-8?B?S2tzMlpOY2FGclF2cUtYbUdTYW54QVlDVHVzN0RITEx1RWgzMlpIMjQzV0ZN?=
 =?utf-8?B?VUt1L0wzYVYyMTUwQ3ROeHp3YjVTc1dZdXdLajBxSGpQR0ZIQmZ4blBPekxq?=
 =?utf-8?B?Sis2Qy9yWnpETVFzQXJQSnZPOHFSY3M2ajRMdUs4MVhYMUNqbDhXbExGZkVD?=
 =?utf-8?B?VW5KeW1DME9QVnNxN1JMcER1d1VwTy8yZU1vbHR3QTRRaWZ6SllLUmRjbDYz?=
 =?utf-8?B?Qm9WTElQZUZSNFJ5eG9UdDRzakVBdS9OTE9WbkduUzdaaFBOaXp5UW0rcllK?=
 =?utf-8?B?cDM2M2pIMWMvQm1YSzhBQkJtRGtNV0c4ak91RTVubjdaV3N3OGZNdmxEeDRh?=
 =?utf-8?B?aUkxa25TVVZXK1V0TGFaZURDZm4vSlhRSEhlN0NCTzd4OVZpMzJYQzlMc1F2?=
 =?utf-8?B?TG9qS2J5SkJzT242QThxNEx6S3JLQWlaclhWc21wT0JqbWRGdTRiQ3Q0ZGVz?=
 =?utf-8?Q?qBl8exmWzfoFtYMQQtXfhuP8M?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 863504ba-7bc5-478b-e717-08db89ff25b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 15:28:34.4913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UK9bTauuKQoMT/Soako6tvyFGat116aCaC70KL2P8lLnA16TMKCzkkC9Rn2/MEJc74kQoL8n4ROA90Up4Ms1UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8167
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:18 +0000
Cc: "Swee, Leong Ching" <leong.ching.swee@intel.com>, "G Thomas,
 Rohan" <rohan.g.thomas@intel.com>,
 Shevchenko Andriy <andriy.shevchenko@linux.intel.com>, "Shevchenko,
 Andriy" <andriy.shevchenko@intel.com>, "Tham,
 Mun Yew" <mun.yew.tham@intel.com>
Subject: Re: [Linux-stm32] [Enable Designware XGMAC VLAN Stripping Feature
 1/2] dt-bindings: net: snps, dwmac: Add description for rx-vlan-offload
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
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Friday, July 21, 2023 6:11 PM
> To: Boon@ecsmtp.png.intel.com; Khai@ecsmtp.png.intel.com; "Ng
> <boon.khai.ng"@intel.com; Giuseppe Cavallaro <peppe.cavallaro@st.com>;
> Alexandre Torgue <alexandre.torgue@foss.st.com>; Jose Abreu
> <joabreu@synopsys.com>; David S . Miller <davem@davemloft.net>; Eric
> Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo
> Abeni <pabeni@redhat.com>; Maxime Coquelin
> <mcoquelin.stm32@gmail.com>; netdev@vger.kernel.org; linux-stm32@st-md-
> mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Cc: Ng, Boon Khai <boon.khai.ng@intel.com>; Shevchenko, Andriy
> <andriy.shevchenko@intel.com>; Tham, Mun Yew <mun.yew.tham@intel.com>;
> Swee, Leong Ching <leong.ching.swee@intel.com>; G Thomas, Rohan
> <rohan.g.thomas@intel.com>; Shevchenko Andriy
> <andriy.shevchenko@linux.intel.com>
> Subject: Re: [Enable Designware XGMAC VLAN Stripping Feature 1/2] dt-bindings:
> net: snps,dwmac: Add description for rx-vlan-offload
> 
> On 21/07/2023 08:26, Boon@ecsmtp.png.intel.com wrote:
> > From: Boon Khai Ng <boon.khai.ng@intel.com>
> >
> > This patch is to add the dts setting for the MAC controller on
> > synopsys 10G Ethernet MAC which allow the 10G MAC to turn on hardware
> > accelerated VLAN stripping. Once the hardware accelerated VLAN
> > stripping is turn on, the VLAN tag will be stripped by the
> 
> Subject prefix is totally bogus.
> 

Which part? It's a 10G Ethernet IP from Sysnopsys, in Roman character it is X (mean 10), so XGMAC.
Even the driver file I'm editing it is dw"xgmac".

> 
> > 10G Ethernet MAC.
> >
> > Signed-off-by: Boon Khai Ng <boon.khai.ng@intel.com>
> > Reviewed-by: Shevchenko Andriy <andriy.shevchenko@linux.intel.com>
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people and lists
> to CC. It might happen, that command when run on an older kernel, gives you
> outdated entries. Therefore please be sure you base your patches on recent
> Linux kernel.
> 

This is based on net-next repository suggested by the get maintainer script.

I got the latest net-next just now at the Commit-id b44693495af8 
which just committed yesterday.

$ ./scripts/get_maintainer.pl  --scm  -f drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
Giuseppe Cavallaro <peppe.cavallaro@st.com> (supporter:STMMAC ETHERNET DRIVER)
Alexandre Torgue <alexandre.torgue@foss.st.com> (supporter:STMMAC ETHERNET DRIVER)
Jose Abreu <joabreu@synopsys.com> (supporter:STMMAC ETHERNET DRIVER)
"David S. Miller" <davem@davemloft.net> (maintainer:NETWORKING DRIVERS)
Eric Dumazet <edumazet@google.com> (maintainer:NETWORKING DRIVERS)
Jakub Kicinski <kuba@kernel.org> (maintainer:NETWORKING DRIVERS)
Paolo Abeni <pabeni@redhat.com> (maintainer:NETWORKING DRIVERS)
Maxime Coquelin <mcoquelin.stm32@gmail.com> (maintainer:ARM/STM32 ARCHITECTURE)
Richard Cochran <richardcochran@gmail.com> (maintainer:PTP HARDWARE CLOCK SUPPORT)
netdev@vger.kernel.org (open list:STMMAC ETHERNET DRIVER)
linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE)
linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE)
linux-kernel@vger.kernel.org (open list)
git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
git git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
git git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

> You missed at least DT list (maybe more), so this won't be tested by automated
> tooling. Performing review on untested code might be a waste of time, thus I
> will skip this patch entirely till you follow the process allowing the patch to be
> tested.
> 

This is a new device bringup, thus the DT is not available yet. The DTS will be upstreamed
by my another colleague, unless, if I can upstream only my part on the setting? 

> Please kindly resend and include all necessary To/Cc entries.
> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
