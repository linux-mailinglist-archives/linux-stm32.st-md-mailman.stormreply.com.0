Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C71B7DC4C0
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Oct 2023 04:11:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D017DC6B44B;
	Tue, 31 Oct 2023 03:11:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D3A8C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Oct 2023 03:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698721883; x=1730257883;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FyWJ6RB0ywCmqvPSLSgs/2QhWwJnlGYUN1BYC20v9uA=;
 b=Vk1vob6lWr0B6cxWu/GEV2+UJkeN4xZn1X0z4/A9wKjmx2vBu9/rbNSe
 knCy/FAmQK7UIiuFUM5/jcQuCSePoea/ph3b791M9iZJA+6xI051r2Faq
 zPvw/P3r28MOzZ+4uetWLcxWVxhpeZM7aKAZRoMA15nuE6LGs2uFDGgXH
 3ErSU/tt60jBunSHeHLlvvIIwbWnJkEVO85bcyXyqJfYIvQHc8x31a1+q
 K1/IAdqD3Ix4auVQ1cNojc0WnV4VU344pSlVGqrmy2bro7iCSrRpjHt54
 M2RjCN+2r44z40zfpaL5+Xc22Tc3hSmTPjpVL6W9IyRJw0EO7PNoCTwR7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="391080436"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; d="scan'208";a="391080436"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 20:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="754008546"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; d="scan'208";a="754008546"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Oct 2023 20:11:20 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 20:11:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 20:11:20 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 20:11:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 30 Oct 2023 20:11:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iv9GcpUMZQ6OP7NBr2cS/uaTuhLvnl+IsV/Ho2EEbObR4lhehRpOiQ6L9d20ie5hxpmvu7kJjvXrcPjGTuWZ48ddvIqDonPMG1jUfsQbqt0MYRmeVpLUJbLay+ysgFOk3q8QQy1/LJk97udGwZHRPq+6Jo0strY4qaGrNVMtEOX6+3Q+77VQwACwQ4AtLQ7JwrjioRBSb8aXFWqy+U2S+hLdtdzYll1IePo0SHJE6eqzCsyDMprzxgQaQHYOQ0IIYzCyQJOW4h1ezOJICsFSv67eBTQZxx/Da1g3PXruX8YvhPFQgVwYD9MF4PCPIJSlPBycwGzTrLq7dAWz/21UBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FyWJ6RB0ywCmqvPSLSgs/2QhWwJnlGYUN1BYC20v9uA=;
 b=JCL9+h91g9zzwVg/IBp9Vukb5Nv2NkYRlR+/0ws1MwEhBfDaRhsFLzqzbrb0Uod6Xn3aTs7InyaUotbIXWoZgiRJ22Yeh/8EvetaSXaX3yljU1yqJXrzXHT0q37R1/w59zat8p4g9VXS+9APAvFIEjZCChUzoU7W/Gp3276OVGY+QYpJ5Yuud15v16SxXY6uJCLz2MpODrHEowGj9bc0dmZwKKdnd2HUdkFNDlzWlMcbGPikRsPjTNjTdu0MTQ0oD+dSOjdxJ2qeqqj/12MnubaP7AL/zge/YMFtdLZty4RlYq2pIyfOxyoPJyqQgD809ayHt4ku6kASKYze5ubsHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3306.namprd11.prod.outlook.com (2603:10b6:5:5c::18) by
 BL3PR11MB6411.namprd11.prod.outlook.com (2603:10b6:208:3ba::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.29; Tue, 31 Oct 2023 03:11:12 +0000
Received: from DM6PR11MB3306.namprd11.prod.outlook.com
 ([fe80::2126:3b64:585d:7da9]) by DM6PR11MB3306.namprd11.prod.outlook.com
 ([fe80::2126:3b64:585d:7da9%7]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 03:11:10 +0000
From: "Gan, Yi Fang" <yi.fang.gan@intel.com>
To: "Drewek, Wojciech" <wojciech.drewek@intel.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH net-next 1/1] net: stmmac: check CBS input values before
 configuration
Thread-Index: AQHaCJzakEPiAidBQUW5oe8eW8MjxrBdaaCAgAXUTvA=
Date: Tue, 31 Oct 2023 03:11:10 +0000
Message-ID: <DM6PR11MB330631ACFA1BC5FCA1318D03B9A0A@DM6PR11MB3306.namprd11.prod.outlook.com>
References: <20231027061114.3792619-1-yi.fang.gan@intel.com>
 <99233115-89ca-4ae8-8679-a16e1f959727@intel.com>
In-Reply-To: <99233115-89ca-4ae8-8679-a16e1f959727@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3306:EE_|BL3PR11MB6411:EE_
x-ms-office365-filtering-correlation-id: 1c0b7579-2f11-484e-1b18-08dbd9bf082c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aipRBJQhDwABdS9lcC563xqR7M+m60q/+5IFtUDIoz2B7hTAg7Ll6CZTNqI9ExOyO08ZBi6bhg6hWRvC6Dv5woQofGvFplflLb0uNBcG1EOWSP9084M4wWcybHY0wdvauBUoZhocZ21R/HpT3ln4OKe2G3T6z8X5N1JT8ENqQr27+vL7VoO7cZc8TqZjrzzMUAVMyxGEbzs0q76SX1XpKoN6wMI3Wy1e53GV1ZfG/AiZGd+GhNydTkJpS2eezIM4W5xhcKH2EkNlzTk5JeYL7w7tpR8NqRGurix0vtkq53mFjLnrIz0/N7QDlYZqkRWy0FPYbJcSkAIvJl/sWRchh/CxoWEfudnLT9GDZkH+HiMPPh0DhSpAO9wXScgq37zAY6h4dYWauYiE1wEL1a1ZzrrZQD2//jFH2d1hshZPAAVWZI5QoxqNKKZXHLtfxkDgfPqLKGpOTiwWaguwG7Ec+614mENcCqoLxJIy7lkgVitziqZ0maRidVcIkKjYJvmCaJs+0z8HHJggCPiOZnVmYDo26P09ke609EIAMqzkC2m8j+QDuHR/NamHonR126AYnU+Z7X3lUgkRsifZyDdwA/dxSQ7OdmG5WlXIv1SEBzd9LI5Bfza0n7FocLJMKxfPDSpmqiUM2C0HEwq50Yc7iA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3306.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(39860400002)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(55016003)(66946007)(76116006)(66446008)(66556008)(66476007)(64756008)(54906003)(110136005)(316002)(26005)(8936002)(8676002)(4326008)(52536014)(83380400001)(5660300002)(38100700002)(53546011)(478600001)(122000001)(82960400001)(33656002)(7696005)(6506007)(2906002)(9686003)(86362001)(71200400001)(921008)(38070700009)(41300700001)(107886003)(7416002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDU3REtXSHlkK3NZTExFc3F6QThabnpNRzFNNUVsQVRFQ2Y0V3R3SHVPWVYv?=
 =?utf-8?B?bnJzamJFbWtYaGJub3B3V3FOUUY0dGp3bktCSGZ0SEFsTFFOd3REUHJ5TEtt?=
 =?utf-8?B?V2hueUN4bmRNRzBQNEZhMkhocVdteGdrZ3daaU40UjZFMzJWeitZNjNsSWtS?=
 =?utf-8?B?ajVscG5US0YvOUNHNkFoUzkwZEJMaWlkT2ovZ0p0NTE0THBQeXlKN3hxQnRu?=
 =?utf-8?B?WGlHeWo0QVovOW8weEpFN3hxRDN0bXAxT0ZPSWkxMWM3aGpBcmd2WDdWVmdp?=
 =?utf-8?B?THZUeXp5eDVXc0YvY09IOERHWW5RdUxrUjVOVXpqYkJBK2M0eklDMWptRmh1?=
 =?utf-8?B?YTBPNFNuMUhOeFoxUGtyYXRPWTNPcUp5RWZPNi9qN002c0Vla2g4aVFrOXdM?=
 =?utf-8?B?bnpMdWZXaW1mWHZNUFpzUm9XRHdoRmdVUS91dHZPRENocTBxOTNZWnVIV2g4?=
 =?utf-8?B?TXFsL3JMWEJoekFzOGpzOWZrNVlWT3hrUTBsVTI5VEowS3JHc3ZwczBncTNw?=
 =?utf-8?B?N3NTSGZQditVRWxKL1I2ZmdkL3lIdHpWT05EQzV0TzdURlpuNlZVZ2xlbFcr?=
 =?utf-8?B?aHpVMWN4V1BYejQ3K3QzOGQremhuanpzQ205TGQ0UkFzdVA1OFF1NUV0dnhX?=
 =?utf-8?B?bUNoZWxFdlRhdGlWSTM4blNzWDZsUnNMNlpXajdGYk9qNVRhdDJmUUFOU1JM?=
 =?utf-8?B?Q3FPL2U4TDRJQmJSVXRKWDRHYUtoVS9STEx3U1UybmY3ZDU2Y0FzSVk3OVJY?=
 =?utf-8?B?UXVkR3FtTGRIWWZTK2gxVmw2SkxULzZoRVJIcktrL2ZWeWR0VGlxcFRabHFU?=
 =?utf-8?B?Y1Brc29pTEpCekVWMWFJcm5zSjR1eHlqNTQwOUpyb1pXcjZlcUI1MjhQeWtT?=
 =?utf-8?B?czFsSjlMRXlVa0tZYUVLQ29lTU9SeGFvNzNRTFNNMjBlMGR5R0czSTEvKzVJ?=
 =?utf-8?B?OTJjQzZHd1pNbzZIS0VoeG95d1JsTHNiVHVVdmVaN0gzYU1RSHY0cUtvM2hP?=
 =?utf-8?B?TW1wclFGMEcyM0lFUXhQbEk3RjFwZks1RDR2UUhUUk83L1V6ZmF1VkN0MHFW?=
 =?utf-8?B?Q3A2VmpnQmRHV090bytrcnlGN2dMeGtpWFdNRkJPWHdneDVqdjVVTjdGWDBy?=
 =?utf-8?B?dWF3dkhUOG1oYlV2NjhGQ0NDTWpFOGlyNlVtaVBqcElsVE5ON2dNU0kzc0hL?=
 =?utf-8?B?M3ZoaVFmYUx5MHlxMllISW1xcldQT3VOSDJaNkFyYTQ3cW56V3N0ZG9ZV2JZ?=
 =?utf-8?B?b3lhOVVKa3hTNzRYZDJNWFlCc212dkQ5aEFtdnI5dzFNQk5iTUxJVmZXT3ZL?=
 =?utf-8?B?NVpjQXN5THh3eTVBcVlRdFhOQ1NyMGRUbXZYS0VSRnlwT3lYOUwyZUlhNHJN?=
 =?utf-8?B?SEtjSUpqUmZ3VVhVTmJWMTVSR2lCeko5aTg3cXUyMSt5cjNHS04vZ0grYS9i?=
 =?utf-8?B?NzgyeFZ6RUZ0QWlWVDJ4UTdjcWJ5SURORWl2eUlETTlmSEZXVnpiRVFMYWcz?=
 =?utf-8?B?eVVqTDBzOUJNRk5zRWMvYlBSY2lkaFlEOHBIMXFrVVZiZWkrdkVaUlBhc2Fw?=
 =?utf-8?B?SzFjWXloRWl6bGt5M0xYS2hNOW5palJtZllJVFNjUHNMSEx4NWUwbGN6bERl?=
 =?utf-8?B?TTRKMkVvY29TcDFZVG9LMWlzWkpzaElDMDUwS1ZGY2ZJbG5VbzRXMlFHNXNM?=
 =?utf-8?B?MjYwRkcxYVA5ZUkrYnhRc0RSQnQ5aFBnRDE2cmo2RVVqRGRaWlZ5eVpHc1VR?=
 =?utf-8?B?VGhjSVlrUk4reXgvRDRzZ0ZMZGxoVE1oSlM4VUsxNkZ3M3JWMzRieFFOUkRU?=
 =?utf-8?B?WjZXSVpIUzNwWjdCMHJsa01uU1lsYjloOTlBMnhXdS94elpsVks2anplOXJR?=
 =?utf-8?B?Q21jNHBSNFp3K3JBKzNhbzh1K016aHdycVF4ZlN2eEo3eTh2RlRlTFlOR0Ns?=
 =?utf-8?B?QVY2bldtRW5FWFQxTzk1M0Q2dGFaYmR1WmtJb0Z2V3dZUnBSbEQrZFc4cE1K?=
 =?utf-8?B?MTAxbHNXVXZRYWM3L2F4N0xWOVdkNnJXUDUrQmdqaGhxaUVoMEJnNGJTcWhu?=
 =?utf-8?B?MG42SXl0bVhiUXNLaHJKZGcvVE9kOURqNkw5eCs2NnppdmtSemoyYnhjYW16?=
 =?utf-8?Q?HUowgy0Ose+BKY0cR4ReYN1Ct?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3306.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0b7579-2f11-484e-1b18-08dbd9bf082c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 03:11:10.1775 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CGH4vCvWF2McafFTtgIVrCBFra+BHKY7Ns9zJ0Jzd0H77MxYjo9a9X5aFMmMSpo9JBPbpy8BV2piSAhehi3E9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6411
X-OriginatorOrg: intel.com
Cc: "Looi, Hong Aun" <hong.aun.looi@intel.com>, "Song,
 Yoong Siang" <yoong.siang.song@intel.com>, "Voon,
 Weifeng" <weifeng.voon@intel.com>, "Sit,
 Michael Wei Hong" <michael.wei.hong.sit@intel.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: check CBS input
 values before configuration
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

Hi,

Value zero is allowed. I will update V2 with the commit msg updated.

Best regards,
Gan Yi Fang

> -----Original Message-----
> From: Drewek, Wojciech <wojciech.drewek@intel.com>
> Sent: Friday, October 27, 2023 6:08 PM
> To: Gan, Yi Fang <yi.fang.gan@intel.com>; Alexandre Torgue
> <alexandre.torgue@foss.st.com>; Jose Abreu <joabreu@synopsys.com>;
> David S . Miller <davem@davemloft.net>; Eric Dumazet
> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni
> <pabeni@redhat.com>; Maxime Coquelin <mcoquelin.stm32@gmail.com>;
> netdev@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com; linux-
> arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Cc: Looi, Hong Aun <hong.aun.looi@intel.com>; Voon, Weifeng
> <weifeng.voon@intel.com>; Song, Yoong Siang
> <yoong.siang.song@intel.com>; Sit, Michael Wei Hong
> <michael.wei.hong.sit@intel.com>
> Subject: Re: [PATCH net-next 1/1] net: stmmac: check CBS input values before
> configuration
> 
> 
> 
> On 27.10.2023 08:11, Gan Yi Fang wrote:
> > From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> >
> > Add check for below conditions before proceeding to configuration.
> > A message will be prompted if the input value is invalid.
> >
> > Idleslope minus sendslope should equal speed_div.
> > Idleslope is always a positive value.
> > Sendslope is always a negative value.
> > Hicredit is always a positive value.
> > Locredit is always a negative value.
> 
> Can those values be equal to 0? The code allows it but the commit msg
> doesn't mention that.
> Some drivers does not allow 0, lan966x_cbs_add e.g. Would be good to
> double check that.
> 
> >
> > Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> > Signed-off-by: Gan, Yi Fang <yi.fang.gan@intel.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> > index ac41ef4cbd2f..e8a079946f84 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> > @@ -381,6 +381,11 @@ static int tc_setup_cbs(struct stmmac_priv *priv,
> >  		return -EOPNOTSUPP;
> >  	}
> >
> > +	if ((qopt->idleslope - qopt->sendslope != speed_div) ||
> > +	    qopt->idleslope < 0 || qopt->sendslope > 0 ||
> > +	    qopt->hicredit < 0 || qopt->locredit > 0)
> > +		return -EINVAL;
> > +
> >  	mode_to_use = priv->plat->tx_queues_cfg[queue].mode_to_use;
> >  	if (mode_to_use == MTL_QUEUE_DCB && qopt->enable) {
> >  		ret = stmmac_dma_qmode(priv, priv->ioaddr, queue,
> MTL_QUEUE_AVB);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
