Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 724DA768DC7
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:17:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A76DC6DD6A;
	Mon, 31 Jul 2023 07:17:29 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF438C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 16:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689957236; x=1721493236;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w3ppgr6Esm/8cktbp5aFx21anIyWmd593fpQOmlHypU=;
 b=Km8lUO9Es1GbraPUBlsR+ilHoPpB+ftTjj6i88o16X4n+MEN+boWF4m+
 Yo2nCSn9kzupT/qIjKbXiGsYv1E+4pOYXaa+DTTZztj1m640Cbu0GSh3F
 TGM0t86muw4XlK0SVSmiCWa8rxj+MhLhN97IKzUexSUdMzhkCrhDAfSbh
 Fz8QYqpqRR4azAri2rtPJ0JAjQHqfPMwyMQmNOjlzYzYK9zqXGkaGdJk/
 dfI7ZAgI11Q80j+o2AVkppoU3xqHk5hoA9X1a2ob3eNtEUM9uqhGxP9rt
 oq1bMRourDKKqtZDW/sZdnoewQ2q0mv+aRzelo3+KuGsMwh0AnP27nfa1 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="347354998"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="347354998"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 09:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="760007461"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="760007461"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 21 Jul 2023 09:33:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 09:33:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 09:33:54 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 09:33:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfUt3s6VKgkfdpuOT8TyrH7jDlibtypmf7MMOy9P0l7qd2Ckg+/hwksH2MRQkVG7+sELJmbNanr8NoQ6UCwFMkY6l/mOa0ejdngOUPUAAHxF8QVos5nfB5dVaUvFyp0fa6eDRgKZqZUlpH4xngaE+Uoyg3juZnBMBvRFyY9KKBiKZ4Vy79nf1jJNWqdRY1lhdGP/lISHr9sWhoSmdROu0uLLvPEpHo+/S8u6WImXlxC2+xwLAz9bv1kRTZ7U18UwOQRSBCQlZqTyCh5Uls75pFAggB6jCX1f+pWKQ933Z2MnklSEY4nC5DoWvZdTTk59Bq4ys8zD60gnewwxBJq6mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3ppgr6Esm/8cktbp5aFx21anIyWmd593fpQOmlHypU=;
 b=natncpVXw1fY+Zqx1QhI/5+MsTY8yTO/AYtHYmMY5GaDth1YpkkK6n1aDRDT0FiUClZRh0F0uBNYCJ3azWl4P2hIiQ1RnxlDLD0FSP9njLiBGVLCh5CVBk1fOxvYwHbFHf1zzl0gH1tRzQIpbSd+T0wm4ZTuTMlHCqbq+Z2rwa5ORKScIVFzdU3cUnjL9S9wVhSMR2DfgT/iNJN8nUFTVTbmV2H6YM2w5+g5gsgJkzjf6WzLr/EiIrVkPNZe+QQQlHcPuGWW2/K559Ezhg2w9HQxieLCSaHNUDyW9/+okKq5P5Gf+csKDAJQRSndUaicp1BuVHt7ckZ/Og95nUr73w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SJ2PR11MB7518.namprd11.prod.outlook.com (2603:10b6:a03:4c5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Fri, 21 Jul
 2023 16:33:51 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6609.025; Fri, 21 Jul 2023
 16:33:51 +0000
From: "Ng, Boon Khai" <boon.khai.ng@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "Boon@ecsmtp.png.intel.com"
 <Boon@ecsmtp.png.intel.com>, "Khai@ecsmtp.png.intel.com"
 <Khai@ecsmtp.png.intel.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
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
Thread-Index: AQHZu5xgG1a+wZGOqU+EmB1OiRdona/EAA+AgABTXyCAABQrAIAAAvSw
Date: Fri, 21 Jul 2023 16:33:51 +0000
Message-ID: <DM8PR11MB5751CB29CB9BF99D240DA2EEC13FA@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20230721062617.9810-1-boon.khai.ng@intel.com>
 <20230721062617.9810-2-boon.khai.ng@intel.com>
 <e552cea3-abbb-93e3-4167-aebe979aac6b@kernel.org>
 <DM8PR11MB5751EAB220E28AECF6153522C13FA@DM8PR11MB5751.namprd11.prod.outlook.com>
 <8e2f9c5f-6249-4325-58b2-a14549eb105d@kernel.org>
In-Reply-To: <8e2f9c5f-6249-4325-58b2-a14549eb105d@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SJ2PR11MB7518:EE_
x-ms-office365-filtering-correlation-id: c27531dc-3e4b-4679-f684-08db8a084466
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pjhmMXVFgfcM69HCg6vwb8iF0X7uPDWzKYdY4n73HG3MQPn9aDQjk3qH24TMf9qTHId8dNo2eEKh37cl/j3r/sqoOroSxCthHKO0m1lDfovhUvZW+tfeKxlwVoFfILbBGokdOMRH+MM3q4l0X4uoeaqkDbYijexvdKlbGyr0NmRRqANt74a4FKIafSVtXzyZ5zIknpuDoq1XrOR/HlO1PmiqpPrJTVE757xpbqDaPqm1tBewvUvdYlJWsoB37HYyOaq3SKV5VFONFfOVRYx79R9uhpiWHwR5xsbO/mHn3hA8mKGb7d2tGZEk/UhINRHOzS6HKWkk3qds/XmCi9kDpQ8aacattCXsCoxz+EzuM16JVW3tnx1M4Bc6f/xVt3aIKHmfsuo2gr/6EZa9p6abDNCIkitxkLZxiFJLNyTIeHQM83zWhgNKI4Uw+GYUL/8Csw6R5T3L5Ea+O12ZDEYC7t0D+5y9UqjeeEoIlDdftEQksmrKg4NBbzdBV+117vNSFGeNeqIEQnBKqTI4qCgP9PLtL5tIbK3canBX10GllLV5GcpxmpyFfB3kSHXUoBImHBzGd4NFk3tE7B57fKRgtkswefCbLqEvagLT7ANScl43sPay9t0ryvWkgCDnRatXG1Ide/rK9XX6dojBeyGYrbbIea2zNWqJ0p3TCRUhPTM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(346002)(39860400002)(366004)(451199021)(2906002)(8936002)(316002)(8676002)(5660300002)(52536014)(7416002)(38070700005)(41300700001)(33656002)(55016003)(86362001)(921005)(122000001)(71200400001)(110136005)(54906003)(478600001)(82960400001)(6506007)(26005)(53546011)(7696005)(186003)(9686003)(4326008)(76116006)(38100700002)(66946007)(66556008)(66446008)(66476007)(64756008)(83380400001)(168613001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGl1V1daRmU3aWxBOWVyVE5LTjV5Zkxoa1p4eThhbVpMTWhJMUZDaEFrYlBB?=
 =?utf-8?B?MmdBTlNOVzdNTUdrc2V3dnN3b1hJemxCQUdZMC9mdllSY2wwVkpEVlFTWG8v?=
 =?utf-8?B?T1hyTmNDTmY3dHNwY1J0UjlWZHZGWXRsKyt0ZDg0WEhkV2xzVmdjT0Q0MUl0?=
 =?utf-8?B?cDFoV3ZZWkxjYkF4RmhyMzAxL3pvRzR0OE5LemZCeDQrZ1U5MnVTY3dzWkEz?=
 =?utf-8?B?S0tRN0Nrb1FyM1VTeUYxOUhpdW56NkErT0N3VkltdjFySnJmVzdwT2ZxejVS?=
 =?utf-8?B?K1NDRTZkU0Vtb2ZCNlpIcHhBaTBIcEpMdEszRlFYeDVVaFFsRCtLMnlWV0Jp?=
 =?utf-8?B?eEVQcStSQks3eDlvNFR2Z2FwdWFKOGZmUE1JVnZYSUVQMzAzOTNWcXNNM2Yy?=
 =?utf-8?B?QXRMUFNYVEpNb29QbHFmN0p4Rm8zTVNpRTZYdFl6UTlvcmlMOGJuMTJOem9O?=
 =?utf-8?B?WGNyYmgyNm54WnFIU1o0QXkrNzJSb0Uvc3RTbHhMeWp4VGxtTE50aVBsWFhr?=
 =?utf-8?B?Uzhncnh6ekpZc21GMG5YaXo1T1R0VlkrRnU4cy9rOWwrRmRQZmZ4bytRY201?=
 =?utf-8?B?Q1kyUG9VRVF4OHF2bnMwcnEya2pKRHp3S01XSVRTaWU3Z3JZc1ZtMlhBMzBM?=
 =?utf-8?B?L05NWXpxaEpWYzZxR1FDMjBjTHc2RlVBdEp6QWo5Z0Ryaks4ZWxHTmtxUXcy?=
 =?utf-8?B?OTMva3NSc0pvUERGQmcwUkxzNWxvalZTMmlaUEVJKzQweGlDRVlMVzZWSFBk?=
 =?utf-8?B?bFRpVGwyQlZ1WUhGa29NUTU5TmFhMm5PbmVxWjlodTZUMFV1cGlxQUtJTzVH?=
 =?utf-8?B?U1U0SmhnSTdDNHdOS2xWUGMyQkVnRmpZU3JVZ2hYL2tKSHVsNG82MTNrVHh4?=
 =?utf-8?B?VTZhR3dkRWZ4L0wwL0w5Rk5UbTJqalFUNnRPUzZ3cVZ3NU9ZOFhkUitYU1NB?=
 =?utf-8?B?SFBTK0tnVWI5Q0R6WTdOUXdUa1dxcjAyell5Rk1LUEdia0s1SUI2TXRpOXVU?=
 =?utf-8?B?UWtqQ3F5TzR1ZHlrclNLV0pLQVRQRFFWajQ0aEowMVQ2NkY1RmFXZW1QMTJ6?=
 =?utf-8?B?Q1Q3KzA4UURlekJqT2F6bXVOSk5BdEMxYVJjWW9BeVBQZy9Nb0tyM2kvbTI1?=
 =?utf-8?B?SjNJQVg5NUNSdlJWQ1lQeGk5TUtVaTZWU1VNc0xrTzlldGwvaFNUV1NmcXpD?=
 =?utf-8?B?V1JrSllZVlBSMi9Xa256L1RCTDJ5UnJDTUthSmN3cWl6NExwSEJ0N0k0eDNq?=
 =?utf-8?B?Z2F2eVpEcm5NbUZGUHBXbzh4THVpQk9xMUR6eUhSQVFsYmVPS2RNM1lhV1FQ?=
 =?utf-8?B?bER2eFUxb2FldEhGTjdPOGpXOVBIcEY3R01ZVUNEUVBWMWVzYVk2eVhnNXhM?=
 =?utf-8?B?a1Nzb3BKL01PenhIZXZkOWRSbFlzVHJaQTlNRHlGY3ZZMkMvbVAwQTdORWww?=
 =?utf-8?B?N2txTnRKQTBiREZrRUd1eDVKdnNKekRkZlhreTIvL0xBK0c5SEkrNjVEb3hP?=
 =?utf-8?B?cjF3TVJsZlNsZjBaWXdUSjVva3Z3U2RDTnZQNFloSll6WmVlUnMwNk9Pb1lk?=
 =?utf-8?B?TEF1T3E5QnVuYmRMaFQ0em5QTUxkVnNocVJTU2xTcGRpYnlOUVVXbXZUdHYw?=
 =?utf-8?B?VGQra2dPOXpUd01ObDJZanNRZjc0SUh4TmpOV29UQkxRSEhOdFhQQ0xTTXhH?=
 =?utf-8?B?UnpSZjJiNWpyVTQyOU9KUFNjelE2aUx1TUhsVFNRTm96USswdkx4ZFl4Mk1Q?=
 =?utf-8?B?OGNKVCt5Vk13c0NGM2Nhc2NRZHdIZm5NTUVNWmIxb0doUDNGRzFZZG1FVDVR?=
 =?utf-8?B?UE5WMWdOaG93cVZpMGFRL0J1Uk4wbkl0czlVVzcyQlRwblBpVDYrRExJWHdZ?=
 =?utf-8?B?NXdpWE94Qk5oVjcrN1RLUUdwbUpjZms4K0tuYmtWYXk5c3lyUk1jNEhOZjN0?=
 =?utf-8?B?Mnc4elg0RUs5MVllZUttYktzT3FFR0p2SFhTZTRFUjkxREUvZHNwWHEzWEw0?=
 =?utf-8?B?dEVKbFk3SGw5ZHVYZFJTZHFaRVJWcHZWVkFMSG1CZVgvR3ZLQTNuRkNsR3pC?=
 =?utf-8?B?bDZmWXNhMWJTcmErNUtweDhiaDUyaHc5cEo2NEYxYXVzRGJSdDc5ZGpycEx6?=
 =?utf-8?Q?mQxc8avKp4Lt5zvv/Et5xUWn/?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27531dc-3e4b-4679-f684-08db8a084466
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 16:33:51.4444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mbGBy7uNQg2AcQpgAE1guGte/9waNNR4Ks5vIDtAAMpaNFh4pbo/QIKC8o/+RmhK9MDHw2PvhoNiFZeV1qBThQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7518
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
> Sent: Saturday, July 22, 2023 12:22 AM
> To: Ng, Boon Khai <boon.khai.ng@intel.com>; Boon@ecsmtp.png.intel.com;
> Khai@ecsmtp.png.intel.com; Giuseppe Cavallaro <peppe.cavallaro@st.com>;
> Alexandre Torgue <alexandre.torgue@foss.st.com>; Jose Abreu
> <joabreu@synopsys.com>; David S . Miller <davem@davemloft.net>; Eric
> Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>;
> Paolo Abeni <pabeni@redhat.com>; Maxime Coquelin
> <mcoquelin.stm32@gmail.com>; netdev@vger.kernel.org; linux-stm32@st-
> md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Cc: Shevchenko, Andriy <andriy.shevchenko@intel.com>; Tham, Mun Yew
> <mun.yew.tham@intel.com>; Swee, Leong Ching
> <leong.ching.swee@intel.com>; G Thomas, Rohan
> <rohan.g.thomas@intel.com>; Shevchenko Andriy
> <andriy.shevchenko@linux.intel.com>
> Subject: Re: [Enable Designware XGMAC VLAN Stripping Feature 1/2] dt-
> bindings: net: snps,dwmac: Add description for rx-vlan-offload
> 
> On 21/07/2023 17:28, Ng, Boon Khai wrote:
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk@kernel.org>
> >> Sent: Friday, July 21, 2023 6:11 PM
> >> To: Boon@ecsmtp.png.intel.com; Khai@ecsmtp.png.intel.com; "Ng
> >> <boon.khai.ng"@intel.com; Giuseppe Cavallaro
> >> <peppe.cavallaro@st.com>; Alexandre Torgue
> >> <alexandre.torgue@foss.st.com>; Jose Abreu <joabreu@synopsys.com>;
> >> David S . Miller <davem@davemloft.net>; Eric Dumazet
> >> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo
> Abeni
> >> <pabeni@redhat.com>; Maxime Coquelin
> <mcoquelin.stm32@gmail.com>;
> >> netdev@vger.kernel.org; linux-stm32@st-md- mailman.stormreply.com;
> >> linux-arm-kernel@lists.infradead.org; linux- kernel@vger.kernel.org
> >> Cc: Ng, Boon Khai <boon.khai.ng@intel.com>; Shevchenko, Andriy
> >> <andriy.shevchenko@intel.com>; Tham, Mun Yew
> >> <mun.yew.tham@intel.com>; Swee, Leong Ching
> >> <leong.ching.swee@intel.com>; G Thomas, Rohan
> >> <rohan.g.thomas@intel.com>; Shevchenko Andriy
> >> <andriy.shevchenko@linux.intel.com>
> >> Subject: Re: [Enable Designware XGMAC VLAN Stripping Feature 1/2] dt-
> bindings:
> >> net: snps,dwmac: Add description for rx-vlan-offload
> >>
> >> On 21/07/2023 08:26, Boon@ecsmtp.png.intel.com wrote:
> >>> From: Boon Khai Ng <boon.khai.ng@intel.com>
> >>>
> >>> This patch is to add the dts setting for the MAC controller on
> >>> synopsys 10G Ethernet MAC which allow the 10G MAC to turn on
> >>> hardware accelerated VLAN stripping. Once the hardware accelerated
> >>> VLAN stripping is turn on, the VLAN tag will be stripped by the
> >>
> >> Subject prefix is totally bogus.
> >>
> >
> > Which part? It's a 10G Ethernet IP from Sysnopsys, in Roman character it is
> X (mean 10), so XGMAC.
> > Even the driver file I'm editing it is dw"xgmac".
> 
> Everything in [].
> 
> >
> >>
> >>> 10G Ethernet MAC.
> >>>
> >>> Signed-off-by: Boon Khai Ng <boon.khai.ng@intel.com>
> >>> Reviewed-by: Shevchenko Andriy <andriy.shevchenko@linux.intel.com>
> >>
> >> Please use scripts/get_maintainers.pl to get a list of necessary
> >> people and lists to CC. It might happen, that command when run on an
> >> older kernel, gives you outdated entries. Therefore please be sure
> >> you base your patches on recent Linux kernel.
> >>
> >
> > This is based on net-next repository suggested by the get maintainer script.
> >
> > I got the latest net-next just now at the Commit-id b44693495af8 which
> > just committed yesterday.
> >
> > $ ./scripts/get_maintainer.pl  --scm  -f
> > drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> 
> That's not how you run it. get_maintainers.pl should be run on patches or on
> all files, not just some selection.
> 
> > Giuseppe Cavallaro <peppe.cavallaro@st.com> (supporter:STMMAC
> ETHERNET
> > DRIVER) Alexandre Torgue <alexandre.torgue@foss.st.com>
> > (supporter:STMMAC ETHERNET DRIVER) Jose Abreu
> <joabreu@synopsys.com>
> > (supporter:STMMAC ETHERNET DRIVER) "David S. Miller"
> > <davem@davemloft.net> (maintainer:NETWORKING DRIVERS) Eric
> Dumazet
> > <edumazet@google.com> (maintainer:NETWORKING DRIVERS) Jakub
> Kicinski
> > <kuba@kernel.org> (maintainer:NETWORKING DRIVERS) Paolo Abeni
> > <pabeni@redhat.com> (maintainer:NETWORKING DRIVERS) Maxime
> Coquelin
> > <mcoquelin.stm32@gmail.com> (maintainer:ARM/STM32 ARCHITECTURE)
> > Richard Cochran <richardcochran@gmail.com> (maintainer:PTP HARDWARE
> > CLOCK SUPPORT) netdev@vger.kernel.org (open list:STMMAC ETHERNET
> > DRIVER) linux-stm32@st-md-mailman.stormreply.com (moderated
> > list:ARM/STM32 ARCHITECTURE) linux-arm-kernel@lists.infradead.org
> > (moderated list:ARM/STM32 ARCHITECTURE) linux-kernel@vger.kernel.org
> > (open list) git
> > git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
> > git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
> > git git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git
> > stm32-next git
> > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >
> >> You missed at least DT list (maybe more), so this won't be tested by
> >> automated tooling. Performing review on untested code might be a
> >> waste of time, thus I will skip this patch entirely till you follow
> >> the process allowing the patch to be tested.
> >>
> >
> > This is a new device bringup, thus the DT is not available yet. The
> > DTS will be upstreamed by my another colleague, unless, if I can upstream
> only my part on the setting?
> 
> You are mixing now DTS and DT bindings. Sorry, we do not talk about DTS.
> 
> Follow our process of submitting patches. For sure there are folks in Intel
> which can explain it to you.
> 

Ah see, so you were saying I'm missing the cc list of the maintainer related to the
DT binding. 

> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
