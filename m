Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18253768DC3
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Jul 2023 09:17:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C8CAC6C85E;
	Mon, 31 Jul 2023 07:17:28 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97F3CC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 15:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689953430; x=1721489430;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MtMEMyG6Thc/ee6lfERtyVQ/Sjd7wut0OlzEHes+e4I=;
 b=SIRrHc2+4SxfLrJqDtpm4I2mA86W9My4AFHr40I64PzvJVTVyz1N2V4l
 csfEq6WD1jkCqculaDVkKhvK9qbrXH3WkR9nM/11/ocirkESlsg2+NOMN
 IiJkOFaazJ6GDtdJjntPpvK80ZSr1zD2XtWFWMeHa4D+3srOBDUxmiRyx
 PwPOZnS9Tva7MvDcs3gM8UndIACt/R++lVv5kqc2ezPZy3TinyfEBJjLv
 sKaAG7pxI3yzDNjfNg3XZfNkzOcyna77Dh0SFfmqL6+kqLK5Gn/uoIbK4
 slpI3y4xTPFcPtPzAL6bAQp2PXxqLxTBm/STWFSIH13p2kkUqyC14MwoX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="346649463"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="346649463"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 08:30:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="724904686"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="724904686"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 21 Jul 2023 08:30:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 08:30:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 08:30:25 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 21 Jul 2023 08:30:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8lCh4dKbyWBvO8yrOnsLMGP1ekEH5DMseH01tXk8j4DYRgvkvZqNPMp2T2WcSX5ULobaqKlDShLmCKIOfzl+eLTs7qyf2JiDUr8cmDL1HpbgcwMILooW3Pq05/hxOG+L0ZQ7nfVk4ArcTqh3N2pqCTu9ZZrIdB/5x84iwW5CmLE0fIU3Lb0+iYcyQb/WJkfxFe+2K9E37UKxwpp5x3sAcAoIpYOtn0tmApNyN3YMy/+Je+fgg20w0vwtS4MP5R/RCoKaeam9KWu4r8jWz89oeXINwPjBSA9psv0lcW6krA339t+bppMHAmOo6EbZu3aqPkXeAeBKoIe9Iw1g3JWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtMEMyG6Thc/ee6lfERtyVQ/Sjd7wut0OlzEHes+e4I=;
 b=gW9o0ROjPPGUfSqteymCCf4Amp5VelIa9NvgGtl4BDuNog/TROkSVKEWatdqacyuQDQRyRwLy+UPcS0m0IrXy0vSebvA6Lwl91gGlUPN+LZwCvVaaxI6CprjnlgyQA7W2p79QAMo00G0eFUnBEfta0A6zumnRaXYrrvlxWGqesYPEi04atAfzvGuGrVvXJ0BFWUEgiDXeXLYeSzLMDNDnjBrDQYtJFd4ARqnKvj+fVpgSbJWTQJtn8rrLUqN/jqWvR1daHPIrrO6Blq1aSPbCk29H5AVQjm6GUNKKByoFr98biYcX/AOqUzkqCSxODowuqodlPYsS9Fa2btXR9hINQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CH0PR11MB8167.namprd11.prod.outlook.com (2603:10b6:610:192::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.24; Fri, 21 Jul 2023 15:30:20 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6609.025; Fri, 21 Jul 2023
 15:30:20 +0000
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
Thread-Topic: [Enable Designware XGMAC VLAN Stripping Feature 2/2] net:
 stmmac: dwxgmac2: Add support for HW-accelerated VLAN Stripping
Thread-Index: AQHZu5xgYrDsoI6/ykSzsldNoVNgSq/EADCAgABYqiA=
Date: Fri, 21 Jul 2023 15:30:20 +0000
Message-ID: <DM8PR11MB5751E5388AEFCFB80BCB483FC13FA@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20230721062617.9810-1-boon.khai.ng@intel.com>
 <20230721062617.9810-3-boon.khai.ng@intel.com>
 <cfba8fa4-47e5-7553-f40e-9e34b25d1405@kernel.org>
In-Reply-To: <cfba8fa4-47e5-7553-f40e-9e34b25d1405@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CH0PR11MB8167:EE_
x-ms-office365-filtering-correlation-id: e8e5786d-c9bf-4174-36e8-08db89ff64df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3dnjblAbSA3r/9GZXAm7fr/VVQ3CvdKWDJxSuKG21P+5F5xnwDhfLblzXk7dHmPmBUZafXMG2DJUVTYZv/VLbez6V3tY8spzSkXVtN2HsyEC7R7b3u/RyJDwvI8my+HxLS28ww/edaUAnXBfoptVui/IUExdBVQjHQg3R4yccBQUIO0hzCb+Xsby1QhZrnoR71qU1bk0ez7DJRgzIdyW0lAfV/pMk/6ddnQBywzdBQoxCjZH7ou8WJcazW+yM8OzdizmyoA+HB7SE/ICMidzhvZ1utSTEvVcAeo4qQ8PCX9q/bCp0Qz0hX64RlC3PeyMamp9poNBL1leZuxth6bP4idHFw5vvtKRad41n8VscsBaU3YanFcpJL5PD1RqEL2mOgZ8iF61hSQX1IG6WCjDufk2dYz61lUSoxO7wWH1CZLk4XNXQqWkKWH9w8cil506db19DIUbGnEaU/MOPpWuA+Y7ixZfDXEM/UjwDPty/dW7EXHjm7iR64YKRaKhQ++p6L04jhdbYlCIVCfI/RxLq7aZl04GGM6qqrgSmWu2gnTRNruhW56QCH/lEX+qBbRnVhi5fA6ZxOGLpZUhIlyzB97UXfW6LpoAspnpi6wOrM9ccVUpeLLmbl8j5cYVScncVN1AgZsFKkFOdP0if3Wv9udc2N42IZGfoTlneXD/yjc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199021)(55016003)(26005)(186003)(6506007)(53546011)(83380400001)(4326008)(64756008)(5660300002)(52536014)(71200400001)(8676002)(8936002)(66946007)(316002)(66476007)(7416002)(66446008)(54906003)(66556008)(76116006)(41300700001)(110136005)(9686003)(2906002)(478600001)(7696005)(122000001)(921005)(33656002)(82960400001)(38070700005)(86362001)(38100700002)(168613001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZytsdGo3amd5WTlTblNrUThMS0VVaUpDRGNCUUxGV3AxcGJLQm1MNWVXVE9U?=
 =?utf-8?B?VTM0MUVVb2VaSUpDTEZWUm5nb1JHUFFvZXY0R0FkTHFKNWh4OUlhVW9JN0NU?=
 =?utf-8?B?MHhyVGFzbzR6c3FtMjY2NkswbHNJblRNT2YyUVBlTjVNaTJVR3NnUU9JZlp6?=
 =?utf-8?B?WVQ5RDY1N2ZINlZ2MndVNU9YR3VMNjUyM05FaFBWWTNPdG5SWUtLSHRCdGtq?=
 =?utf-8?B?bDNUM1YxRmtDYmRna00ra2dKeVdpRXBlSWRqczdMRVRYY0NRczhUa2RETWNU?=
 =?utf-8?B?UXhHUWFnKzhBa05ZV01JQ2hoUVNiUXZCeXZDN080N3JEYmhIK2t4Q2hmcXVm?=
 =?utf-8?B?TXZUNVlsYWJmcXczM0pmZjF4NndKYmRiODMrb3RpNFZwZU9NUy9odkVlcXpm?=
 =?utf-8?B?UUxCQjNjRUh3R2MreGdaVGh1M2NycGJHc0UwaXRQUXEvdC9UQkdabXhUYkdV?=
 =?utf-8?B?R2NRQjZVWVI3Z0l6YXV2Yit6c3laMnd6TEF2RlJuWFQ5MlQrc3N1R2swYUNk?=
 =?utf-8?B?SWFJeFh2eE80Ris1OHpkSDFHZ1pIZEVVbnZuSHp4T24zaTN6dW1KUXFFRy9O?=
 =?utf-8?B?aWtwQzVJZnRaOHZsdkRmZ21yRXord1FXa015ckYrU3EvMVBYQncxbVFVSEVL?=
 =?utf-8?B?dVk3SlBrcmJ6Y2taQitZeUFmQWxyR0JKY0lXajRJaERjVkRqTGNXbVE1NStp?=
 =?utf-8?B?OHc4ZU00YjlnSi9OdlRaaHBxbnJjVFBrbWdNbHVaUWNlM3ZxdjF1SE5rb0lG?=
 =?utf-8?B?aFl6djhnZlFtajhPSHpMdzZWOUR5eFRrUVVjV1dVcElMUTlpVXJGK2EvVno3?=
 =?utf-8?B?dnlXVElUcWdoNFZvbHN4V3MzNURsZWNkTzF0MloyelVVbGJ5SHdaa0pSTEMv?=
 =?utf-8?B?aWxPZ3hCcEdMRVhMMjBMVEZ1S1lUaFppL0RhaFV2Ky91ek1YQVFWZk5MOFlB?=
 =?utf-8?B?a3NKbjRPYTZjYytudHBNaEZxNTdKQjBZQ1R2ODl3TmpGbDh5TnZZZTYxSWxV?=
 =?utf-8?B?TDFRNG5FY3B5MDRNb3FQSWF1clZNeHlKcU9oaVNhQlQwdjlGcUdZMmJ5WkFt?=
 =?utf-8?B?VmQwWC9DTTBOQS8veHdyQTFKV2FYeTg1V1NwRDVXcDhnMzB1RzJzREpZRUdL?=
 =?utf-8?B?TEF4ZDd2MXVxaGsxc0hyd2VEelE2enFnZnRyOWhnaU9oTythRy8xWURheXZM?=
 =?utf-8?B?VnlMd3U5TjhOL2JiRHB5aEM5VXBDSkZsNFhuSUtxQS9kQmMvcHBOMHhIQWxM?=
 =?utf-8?B?V1NJUXJTTEFxT3VGenFhbWY0eHgwN1ZGRFYwVUlmaU5qaE1tVThhcDF6MDds?=
 =?utf-8?B?aXF4RWU3STVZaE4vaHk0bzZDbVkwNUowamE0SHdRMnhuWGdnQjd2UTBjZ08z?=
 =?utf-8?B?R2V0cGVkUHM5SFBrbnNyMFRSaE1XUk5rOFQyK2NTVjRHOGNsblo4ZFVtZ0N5?=
 =?utf-8?B?USt0RTBaVlpyQ2w5VFNLdk9yb2RmenIzV3piUURuMWRqZlpWNDQzeUk5VXpB?=
 =?utf-8?B?a3dNUmJsMEVLL0hJeDlpRnQrNGFjZ25XRjJla0Znb2Y4aTZ2b21oWXJMRXZy?=
 =?utf-8?B?RERvNDJJY2UyN1JTSWJsYkNjNTMvMGlRTDBDWXo2QXJaOUtnS1h0bEhNWG9L?=
 =?utf-8?B?RGl5NjYwa1pWaXJOOFUzQTdKNGN5b0F2L09OUXgzakJOeGc1dXI4TzN0YURh?=
 =?utf-8?B?aXhJc2orcE8ySk5HOUtmQm1Wek5jUDNZVy85akF3SHB4d2VUeXpXZis2a1Vk?=
 =?utf-8?B?MzY3Z3FHRWtMaG9LMWlyaGU1TmxzS3I5QzR4TVBlRXlLVEJKTkFCUVVhNmo5?=
 =?utf-8?B?MWlZNjBTT3AvVVdGeEV3WituOHN2cGRTOUFURzQ3dTBScHYzcVFYUW82MXN5?=
 =?utf-8?B?b3lPQWtwY1hyNzI5d3ZkeXBEU2xFbGRBTFlseE96K2UrcmNxRHBhVzExc0tV?=
 =?utf-8?B?dnc2TW9vVFYxZldicmE2Qi9CdnhsY2VxOE40K2ZuWjJmNVFsb2lYOWlrMVQv?=
 =?utf-8?B?Q2dsMFVNS3RvdnE4T3gwWUpUaGhYRVBRWGhFNmY2aDY1ZWU1TDR3R2s3cEM1?=
 =?utf-8?B?Ri9SWVcwWW5CeE1KSDZLZjZNQzdEdDFhUjd5MG5yUTdXdEkrekxGZDFvVDRn?=
 =?utf-8?Q?euxXNfbHYgqPOwTQEn2SiJDhB?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8e5786d-c9bf-4174-36e8-08db89ff64df
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 15:30:20.4583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N/SPA0uKGK8sDaGFdpLyxisDj8gfzJoen5xmyntC5gQGjv/E2N4YHnxUkLD2IS3a6cVWG6flHEyVpQKq8tWuuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8167
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Mon, 31 Jul 2023 07:16:18 +0000
Cc: "Swee, Leong Ching" <leong.ching.swee@intel.com>, "G Thomas,
 Rohan" <rohan.g.thomas@intel.com>,
 Shevchenko Andriy <andriy.shevchenko@linux.intel.com>, "Shevchenko,
 Andriy" <andriy.shevchenko@intel.com>, "Tham,
 Mun Yew" <mun.yew.tham@intel.com>
Subject: Re: [Linux-stm32] [Enable Designware XGMAC VLAN Stripping Feature
 2/2] net: stmmac: dwxgmac2: Add support for HW-accelerated VLAN Stripping
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
> Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>;
> Paolo Abeni <pabeni@redhat.com>; Maxime Coquelin
> <mcoquelin.stm32@gmail.com>; netdev@vger.kernel.org; linux-stm32@st-
> md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Cc: Ng, Boon Khai <boon.khai.ng@intel.com>; Shevchenko, Andriy
> <andriy.shevchenko@intel.com>; Tham, Mun Yew
> <mun.yew.tham@intel.com>; Swee, Leong Ching
> <leong.ching.swee@intel.com>; G Thomas, Rohan
> <rohan.g.thomas@intel.com>; Shevchenko Andriy
> <andriy.shevchenko@linux.intel.com>
> Subject: Re: [Enable Designware XGMAC VLAN Stripping Feature 2/2] net:
> stmmac: dwxgmac2: Add support for HW-accelerated VLAN Stripping
> 
> On 21/07/2023 08:26, Boon@ecsmtp.png.intel.com wrote:
> > From: Boon Khai Ng <boon.khai.ng@intel.com>
> >
> > Currently, VLAN tag stripping is done by software driver in
> > stmmac_rx_vlan(). This patch is to Add support for VLAN tag stripping
> > by the MAC hardware and MAC drivers to support it.
> > This is done by adding rx_hw_vlan() and set_hw_vlan_mode() callbacks
> > at stmmac_ops struct which are called from upper software layer.
> ...
> 
> >  	if (priv->dma_cap.vlhash) {
> >  		ndev->features |= NETIF_F_HW_VLAN_CTAG_FILTER;
> >  		ndev->features |= NETIF_F_HW_VLAN_STAG_FILTER; diff --
> git
> > a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > index 23d53ea04b24..bd7f3326a44c 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > @@ -543,6 +543,12 @@ stmmac_probe_config_dt(struct platform_device
> *pdev, u8 *mac)
> >  			plat->flags |= STMMAC_FLAG_TSO_EN;
> >  	}
> >
> > +	/* Rx VLAN HW Stripping */
> > +	if (of_property_read_bool(np, "snps,rx-vlan-offload")) {
> > +		dev_info(&pdev->dev, "RX VLAN HW Stripping\n");
> 
> Why? Drop.
> 

This is an dts option export to dts for user to choose whether or not they 
Want a Hardware stripping or a software stripping. 

May I know what is the reason to drop this?

> 
> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
