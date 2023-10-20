Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 777567D06E3
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Oct 2023 05:33:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30D6DC6907A;
	Fri, 20 Oct 2023 03:33:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3405AC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Oct 2023 03:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697772807; x=1729308807;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SNU5EDYgYcy81FbsPHTIP92eRELF/Z2J4Ary7ZHrr5Y=;
 b=GtmVSmmU2UXOHksV4KwnyULyTPr/uWUB9GhlsdyCaJZjEwfYndBtc4Av
 iTcmqdh2DPa8nAFLNw/bRyFxJ3/GqrxlJGYS6guAS/WX1Xyo7laqkH0Iy
 sDyLXGvz9YbJh2qQNQZsueVpZ2AA9zD1XyCLKmhlB9wPRKTybLvT2US7N
 TeyGIcQcb/24Ah/VpvTbDXHkq28Gkatkob+HZWUqkuThdIODW4/jSV4OT
 oGUSp5xC3cqIfRconcsf/d/7bTIOObBk6aUJFQCc487G4EHy0631O3Py+
 QoAUA0yukdni2hiAQG/h4x4T+f8TCI7+7MGM5gT5zlaQ3/kETKKqxgMG0 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="7986657"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="7986657"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 20:33:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="733818520"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="733818520"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 20:33:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 20:33:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 20:33:23 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 20:33:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 20:33:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k48qs8T4ZX6GTNvIAdwHnXOoEdF2TzDht5L9VFrqIjDkh8/dCnDRj/iVawN0AqvrZ9MqtaacDaigTwi/SB6mxTkhwuzghgoQLt7yVWleFfFu4E6wldTySXljK/s72l4jVsz7CZMGpyrodr+bEX5IP1fl6jLCWFSDnwkvyD8urXqldIP0SiVy5tSQ3bVJE6tAm4u78s/4vkHBS417cw4/r/lxwKwWTFRj59H0q57bosiUZfDUtZqw4flew9GpezVbBuhCnfOl0ThM+N47w9Od+RupMG2A3eBRONcVA45VPWTkFzjw1RQfiSL4kiY7dQfHejHP5Cc/kIUzS4zfVUw4WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNU5EDYgYcy81FbsPHTIP92eRELF/Z2J4Ary7ZHrr5Y=;
 b=H2YCwS1z4ZMUUNPgCFxycdwjl1/2gbO4Q6A58ydKfgbBQ3p+Go818K2ojBrMdf9xRQdN36iKNmvzM9/61LVjKcHy4PceHUJJeBJAOJoHYS982WRaCXISMqSocCElF/3X8Axn5gu4My/PH1D3iYJ12NKNcCYtyJ8EXaLLyzfbXZ5XQO8EWjkEbrJXnk95TnZgmAs6ghcPpEJYEgrIRt1lVzMWV3ayKmZDs8WMsvUtj1Hu9JD7a4kt+g21lqQMkXCYLOUo+ebciA6KCtryXTh5voo/xR4jrFWIJCVmS1ibkRRjc1ueoZTNslKBPaxtdF37ZgMzszbd4zQoAcg7i7pVjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3306.namprd11.prod.outlook.com (2603:10b6:5:5c::18) by
 SJ0PR11MB7704.namprd11.prod.outlook.com (2603:10b6:a03:4e7::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.36; Fri, 20 Oct 2023 03:33:16 +0000
Received: from DM6PR11MB3306.namprd11.prod.outlook.com
 ([fe80::9abf:5e6a:2159:4c42]) by DM6PR11MB3306.namprd11.prod.outlook.com
 ([fe80::9abf:5e6a:2159:4c42%5]) with mapi id 15.20.6907.021; Fri, 20 Oct 2023
 03:33:16 +0000
From: "Gan, Yi Fang" <yi.fang.gan@intel.com>
To: Paolo Abeni <pabeni@redhat.com>, "Russell King (Oracle)"
 <linux@armlinux.org.uk>
Thread-Topic: [PATCH net 1/1] net: stmmac: update MAC capabilities when tx
 queues are updated
Thread-Index: AQHaAWvPA7cQKtzl3E6ir6qnnXHKbbBPJZcAgAHEl4CAAR5HgA==
Date: Fri, 20 Oct 2023 03:33:16 +0000
Message-ID: <DM6PR11MB3306B786885299BC47096AD7B9DBA@DM6PR11MB3306.namprd11.prod.outlook.com>
References: <20231018023137.652132-1-yi.fang.gan@intel.com>
 <ZS+IUo5q/AnYm1Gb@shell.armlinux.org.uk>
 <84fbe8a5d47c81142c5eb07b77288711970051e1.camel@redhat.com>
In-Reply-To: <84fbe8a5d47c81142c5eb07b77288711970051e1.camel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3306:EE_|SJ0PR11MB7704:EE_
x-ms-office365-filtering-correlation-id: 8cd8d6ae-22aa-480a-a2fd-08dbd11d4c24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SrklDHdD4QiWOlvMRSt2IuhJ9qdmTcSMp/LQeRTclneQLfufDVZGQDvg6Z4Ol/dPdBHtaGiHxnx7Qz79BWRkTq6PgMA/coCdSjsg2r3qBzoxcOi0Um44wu5gL4iuw9va3oYnrGz1jW4DsosKcuSRUrrPnitWPphLN3viZpdiFHkvyd1zvxYoqYlPXhaC19zRgS6jQzocQazocV0RWWGC7quMhgMx712Tf2zE3OqfPSJGWl+oBn1hrsj/d4Vk+ucsPhlzBr5zhH/dQQ8OfXut8v4C7AsRyVqFn1PlzdLXvN7ZXrdwxLAznj7s/e1ebeJvvAY20W4yva8CkrLC+Ve4Nas6KtmAaYICTifk/yNNoykH4nEwfn4KP5u+PO7UDBcQgxgnIlswY1TmFiZMKyqTEHlYSE/umEJ/PZd2gqfR1MvFQjkLM4/++h+Sv7lqUQitLUbmmMrwuB3W+sZEDGb5zSUK5iTiuMn1I05uhrpGt9ToA+U3UHpbC+BJJ78sT434cuvycWaHuKyct7QMbeJefQAK4YYVYWwVjngb/n9wRKr6rMkkFDDyXP1Nwk/CxBVK9oT3twLT9yKFt+OZy9eWBIbf98ZOM6GVk0I8C1A62uuLZ1UnxmZLnd58dUi5eOWR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3306.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(136003)(396003)(366004)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(4326008)(38070700009)(107886003)(122000001)(26005)(55016003)(66556008)(66476007)(64756008)(66446008)(66946007)(316002)(6506007)(110136005)(76116006)(71200400001)(478600001)(7696005)(82960400001)(9686003)(54906003)(53546011)(5660300002)(4001150100001)(33656002)(41300700001)(86362001)(52536014)(7416002)(15650500001)(2906002)(83380400001)(8676002)(8936002)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K09uQjFQcFBMbXhqblh1T01HZlZ6K2ZJdnAvQ0c3NStETk9CbXJyZkk5T0tP?=
 =?utf-8?B?SU5ubDdJcHdIblRYaFR0cExtMmE0NXk0eUkrcHFnWTFobjBwQzJUU0NONU5J?=
 =?utf-8?B?MDhja3ZHT3RLejVOQUtZMldKWTVwa2tKSGdlSHBweS80cGV3ajBjUDQvZmVF?=
 =?utf-8?B?UFFLTVJhall5N2Nqd1ZGL295MzVmVGhMUmlnTCtYN09UU3htRmhkUkdNMGtM?=
 =?utf-8?B?VVFVb3J3RUtlbm1GTVFHOXlVVklnekVleVZQQVlmc3FoamxxYWlOeW5PNnl6?=
 =?utf-8?B?elNHeER4d3NCdVpaam1kMUtFckZaZkZoNWhROVpUZzFEelRUbGNkOHAvRm9U?=
 =?utf-8?B?Rk9Sd090Mkg5OFdjQTV5WGx3Yld0b0xQMDVxRHJ0K2pDTHR5S2tpdVdGSldq?=
 =?utf-8?B?ejFXS0x0MU9zVzd6REh4VG81MGI0YXQ4L3RENnJ2WE9tRk5Qcmp1YnFERDhi?=
 =?utf-8?B?SEZaZFlnQVg3clpBT05SeGtMRFY2YWZvNmUwdi9iU3VabStSaXF1RU9tZ204?=
 =?utf-8?B?TE40ZXRYa0R4ejVoT1B4ZGtMZDVIUVdBR2xqMmhSVy9WKzVtSUZ2dFZLQ3RO?=
 =?utf-8?B?a0pXRU04Rms1a01SSXdGVU9SNzVzUmpmRk8vYkFZb1NYTHlJOGVra2lrVjBO?=
 =?utf-8?B?dUs1ZEdLeHRRaUtiUEd4akJLai9mMG5sRUtiM09xRjRLbHp0SmR5Q0R4ZTlI?=
 =?utf-8?B?MDRudnFKSTJOanU3VzhEaXNPcFdzS1hyMkVRcndrbWs5aUZXTk5YUXhFbTJh?=
 =?utf-8?B?S3FtY0NIenYvRW0ybTdOMkdHZDBVTExRVXFIbXpibXc5ZWR5VGc0Skd1TS9t?=
 =?utf-8?B?RUQ2R3VqckQ3NHo4NVRYNXlWN08vU2JpZzFrbVVYdndqVWEvcU1uc3cvN0dl?=
 =?utf-8?B?aVR4YjdtQWs0YnB2T0VoMUl6Mk5rZHB4ZzdLaUgwQUtJbGJLTXRyQSt3MjRS?=
 =?utf-8?B?S3FVZlFVUFZDdW4wNjB0WnduWWdZcTE2cUdMVlZuV0NjcXBzQVcrTDRpZWVK?=
 =?utf-8?B?bVo4aENFQ20wMXdoSkVSa2NFNTNUYVplVEdHRVozQ2JTekxISzJab0wyS05I?=
 =?utf-8?B?WENyMHdiTDIyekEyY2VGZmJoSk50a0ltVXRhR2ErZG9Ya0lkMHFRdmY1U0Vw?=
 =?utf-8?B?VkhYakJ0QTFhbkpqMWpFN20vODcxcllzT3lJalZsWUpCRXpzVVNtaDRHQjdO?=
 =?utf-8?B?dWk2MGpFRlMrUFVmazRRQ3A3UWhySitFazM0VVJlUDk2L3B3OEI0SW10NXFZ?=
 =?utf-8?B?TW5NMndEUE9jL0p1TjJ2WlAyM05sc1lveUltL3hCbS9mTmo2a0ZxZVJzN2Zh?=
 =?utf-8?B?U3ZGUDcrM1BzdkhnUUJFU1FhZTU0VWtKUGd3Yy83a2lNQ3E0ay91NjJ3ckFL?=
 =?utf-8?B?YURHVEgycmV4a0VzaDI4OVJGdTZrYmlvUmYxaGxQZkRMam9UdWlCQ0tSNy9m?=
 =?utf-8?B?T0pVS1FiZ09zNEpWTXRrellLRE1iMjFueUl3QVM3TVJaM3VTUE5jZFBHTlJE?=
 =?utf-8?B?eDNMODg5cnE5MGZhd0RITHRNLzlhWXhRaCt0cTBSemRvOFlla2JBZk0zK2Y5?=
 =?utf-8?B?czVNNUJSdzFWTnh2bHpzVjNnMGpSczZmdHhNVnQ5WXlHdjVWYndlN1RUcTVJ?=
 =?utf-8?B?akNvVzJiRGtCTXA5VEFCeG1CUkw3bzE3MGtXUS9RM3oxaUJoNjRlcHJCTnNW?=
 =?utf-8?B?MmZTNVdYUjhVK05lWWMrdUpaVWNtbTlFQlNWaTF3OFJBdnljcnVVN2QzREgr?=
 =?utf-8?B?cDFjMmZRWlliODRjeGJxeXRhL2luYk9kSXF6cTdQTFdsTTFkQ2ViMS9PazVt?=
 =?utf-8?B?UUhhV21MK2o1M3dzbkhqRmFUc1c0MHRIYWMzeUNRbHBNTWsweGNWUTlpUEEy?=
 =?utf-8?B?MCt2TWJqWkdtM3dqb3RmazNPMFZHYW5Xa2V1cjFEakN0Z2F4TzVJRjNkSnhJ?=
 =?utf-8?B?ejE3NEhVZHJldXlmREkyQ3daOXNPdlVqeEFnZXhZbko0bTdUMW9pZ0tGOXVy?=
 =?utf-8?B?ZWluTjk5bGdRRFZNWmtKRzdtSEZtRTNQNmNPRTdpcWV3cVpSR1V2UDV1OTNJ?=
 =?utf-8?B?a2ZuRyt4cVdlejFRWnIrU2J1eHNyYTFkS0Zha1cxczR5aEdmdEpNdHM4aWJ4?=
 =?utf-8?Q?g+r4IThXhn0+6okCH6eQQ3uyj?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3306.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd8d6ae-22aa-480a-a2fd-08dbd11d4c24
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 03:33:16.4251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZcSBdapIshpti1n/ai3jdalQOrCk9euh9/y1PMG9++cHi8asHmIkJjvPbR/DGVXocNo9H5hILWNSLOlZGh80dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7704
X-OriginatorOrg: intel.com
Cc: "Song, Yoong Siang" <yoong.siang.song@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Sit,
 Michael Wei Hong" <michael.wei.hong.sit@intel.com>, "Voon,
 Weifeng" <weifeng.voon@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric
 Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, "Ong,
 Boon Leong" <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 "Looi, Hong Aun" <hong.aun.looi@intel.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: update MAC
 capabilities when tx queues are updated
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

Hi Russell King and Paolo,

Thank you for the feedbacks. I already submit V2 with the helper.

BR,
Fang

> -----Original Message-----
> From: Paolo Abeni <pabeni@redhat.com>
> Sent: Thursday, October 19, 2023 6:25 PM
> To: Russell King (Oracle) <linux@armlinux.org.uk>; Gan, Yi Fang
> <yi.fang.gan@intel.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>; Jose Abreu
> <joabreu@synopsys.com>; David S . Miller <davem@davemloft.net>; Eric
> Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>;
> Maxime Coquelin <mcoquelin.stm32@gmail.com>; Ong, Boon Leong
> <boon.leong.ong@intel.com>; netdev@vger.kernel.org; linux-stm32@st-md-
> mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; Sit, Michael Wei Hong
> <michael.wei.hong.sit@intel.com>; Looi, Hong Aun <hong.aun.looi@intel.com>;
> Voon, Weifeng <weifeng.voon@intel.com>; Song, Yoong Siang
> <yoong.siang.song@intel.com>
> Subject: Re: [PATCH net 1/1] net: stmmac: update MAC capabilities when tx
> queues are updated
> 
> On Wed, 2023-10-18 at 08:25 +0100, Russell King (Oracle) wrote:
> > On Wed, Oct 18, 2023 at 10:31:36AM +0800, Gan, Yi Fang wrote:
> > > From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> > >
> > > Upon boot up, the driver will configure the MAC capabilities based
> > > on the maximum number of tx and rx queues. When the user changes the
> > > tx queues to single queue, the MAC should be capable of supporting
> > > Half Duplex, but the driver does not update the MAC capabilities
> > > when it is configured so.
> > >
> > > Using the stmmac_reinit_queues() to check the number of tx queues
> > > and set the MAC capabilities accordingly.
> >
> > There is other setup elsewhere in the driver that fiddles with this in
> > stmmac_phy_setup(). Maybe provide a helper function so that this
> > decision making can be made in one function called from both these
> > locations, so if the decision making for HD support changes, only one
> > place needs changing?
> 
> Indeed that looks both straight-forward and more robust.
> 
> @Gan, Yi Fang: please send a v2 introducing and using such helper, thanks!
> 
> Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
