Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CDA54BF0C
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jun 2022 03:06:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 103B1C5A4FD;
	Wed, 15 Jun 2022 01:06:23 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52416C0D2BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jun 2022 01:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655255181; x=1686791181;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r10JIOPXlEAjfXbJOL9cBrT4d2WvyoB3UVii9CKQ2h8=;
 b=NqrDQOMjXt1uMNbSGwQQew1hE0PUtZKel3vOTsgaJP4Gqcc8FTM1tMX6
 CX4Xdee0/FUiL4kiKJ5VFQTvD0f9m4hN/jevJHSwPS/zLWfaam8lOpe8p
 0v76BGbqp4Ap6wuYc/FUkO8vtoJ5xNH38v1VuYwJ8rNrK2SoFPyJvg4p7
 bphuO0L4mIBs1OEVPPt0KaTNfoAQJhLxXx0RYmD2EWWZnwsjWvoIUv9oy
 BwORW1cPvDxiwVmI2OFNOfet0QPYKpV/dLw/veWgS8SXkbOl/WeTbxB0/
 vBTna6W3/1lf2919MBz+dLbAhcb0su+nHChqG7Csy2tsJahMbuVLVXcBa w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="258640649"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="258640649"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 18:06:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="652358548"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga004.fm.intel.com with ESMTP; 14 Jun 2022 18:06:15 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 14 Jun 2022 18:06:15 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 14 Jun 2022 18:06:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 14 Jun 2022 18:06:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 14 Jun 2022 18:06:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NO2T8oY+AfK3/FnBsjQTTFhc0U56UAVHzAawusin4NqCRqR3z7DPAehMSETcnt+dAWkPHx5xPtEZIB7GmkVLvO4CDx+XRhCUIsyW4+kF83rjI/oIC6lryLiZAGzhXwASY6TlH3sPLn0PWtVuzFlYPLfx0imh4hiOlzQsSq7z42CgUnI7Bu/YMe+IH/R65xAA+YkmjbPk0HsjyBEy3snqcMnhaJgKGxwrSepPTELQ/xHwvJsIYiiggnvVQMc9CTDlOUBP5/eg2V5qxkb98SVKrv9qaFLZz4CLno8FlVi3eYY8MheRXV1GdxAq2EsiEb5t1ki8IHW2BiFa76qFQIiJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BmLi0To9cYLyL5y58GrdmzoNn6WcEZnu/FAL/iHWzCU=;
 b=ijQB6ylcQ5uFUKW6CFqBgQQJMmPLZQffcqG1U48V/GRSjXyUmyLHsZyiZPiu7abAtQBqFOOZk56IXaKl1M17vig14zwCMZpKttyKZ5Lg9N/Hjwx1pJofU/945XcYr3KxqwOGrsCbQExzDZ6jIQZddfpL1jjgjU6IbIGYNJpIjzdn45oHO0OaTYfdtcGFAgdKgBvnzOBzhYJ9DaGq+fa50+HO+FOk3Ndkz0ndcrryVI1YraWBRoebl1LEiYQlS5pitCH6Z6DFLuz+f5wxwG8VjfRMPDmZcE8P7gk9nIpkgZEJfNMQr2Ndx3p6REahmPusQvFtcs1b+RXLjTrZ49C5jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6095.namprd11.prod.outlook.com (2603:10b6:8:aa::14) by
 DM6PR11MB3772.namprd11.prod.outlook.com (2603:10b6:5:143::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.14; Wed, 15 Jun 2022 01:06:07 +0000
Received: from DM4PR11MB6095.namprd11.prod.outlook.com
 ([fe80::40e5:e77a:f307:cbb3]) by DM4PR11MB6095.namprd11.prod.outlook.com
 ([fe80::40e5:e77a:f307:cbb3%4]) with mapi id 15.20.5314.019; Wed, 15 Jun 2022
 01:06:07 +0000
From: "Ong, Boon Leong" <boon.leong.ong@intel.com>
To: Russell King <linux@armlinux.org.uk>
Thread-Topic: [PATCH net-next v4 3/5] net: pcs: xpcs: add CL37 1000BASE-X AN
 support
Thread-Index: AQHYf5vBM49Ys7UxNESC60QDi75XP61Ol4yAgAEQwwA=
Date: Wed, 15 Jun 2022 01:06:07 +0000
Message-ID: <DM4PR11MB6095F0AA09EFA775AB0DE09CCAAD9@DM4PR11MB6095.namprd11.prod.outlook.com>
References: <20220614030030.1249850-1-boon.leong.ong@intel.com>
 <20220614030030.1249850-4-boon.leong.ong@intel.com>
 <YqhLI0vWuDWNTQ8h@shell.armlinux.org.uk>
In-Reply-To: <YqhLI0vWuDWNTQ8h@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1124e8c8-44d3-41b7-6e5a-08da4e6b3a96
x-ms-traffictypediagnostic: DM6PR11MB3772:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB3772DD83B9CDF78F3093F019CAAD9@DM6PR11MB3772.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: svgXufTzSXnjQASdadPBvgYnegfRCAWixv02SdGNoeXyW5gE2YjLqDy0WIsPZJnOFhxNLmLtgzK82BbEim2TZnAjUbCwvwaLNl+7sB6xhsmxeBzHmzbuvGQg+p2TpavV4S4vM5FMhtOYX114rKWrVyGai1bJNK1wUGaXh3Y8V93f+3PYt2JIhTvOLxnv4KmaGFzpoe3xhhqMIRLrDNAdPKBKppp0hnOekP0mZXHYb0i11ZXrsL3/mUvBfFs9wCGIb+cEAasltTYu9vW346j/4QIffma1cdR6N0bdqlT1nMirBI4ILU0M1Zs28BnGaXqQ5G/ksA40FYZxjxdu8ec4W0XwgzS8s6T47SlyNfZXkYOiDyft0wbmaF+RtHwaIVGcmMfqGrNXolqpqn/sTrZ7+JNcnBn62/B2rfoi7EzUl/Rn0F6S4gd3FPmA86BYz61N8Jk4BDCX/mV026VJ3/fArHQEnzWGAghAQRw2fhKp4KSGViJTw15VtpAJzzvuy4QMZDfJbjxeZAhUEQriQj7NPXHg0YEHtRlLO4tekzJK6q2r9uDl8SZtgEtY43G2a2fxyi0FCx+8NhHImdiLkTTHl7vOxSDHGbYaYB/hZGLkChluz/iXG5xpNORQSEfRXO7OIcXqdervf1KhuC0h7+XNo14urIe/R+7I5ybPiMxOTVFTlhWsvXFwXt2FUBZpxd018K296x0ZILmTRVuxuq0YGA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(52536014)(6916009)(54906003)(7416002)(8936002)(316002)(66946007)(5660300002)(76116006)(4744005)(71200400001)(66556008)(66476007)(64756008)(66446008)(2906002)(38100700002)(8676002)(4326008)(122000001)(508600001)(38070700005)(26005)(55016003)(186003)(7696005)(9686003)(86362001)(33656002)(6506007)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zmUnKY6Ecp3Mlolzd9PbacNawzhKg6sCOcNLvV6W8iWhdjuzsBLEJYzkdyHo?=
 =?us-ascii?Q?gCQBIaDU6tGQp+LpATDK5qO8iQlBSTrv/R1wcvLOxoTWdypWG5ziNVtnTdAu?=
 =?us-ascii?Q?VBYS/gsMkza1HpGn3Q2nA03DB3Gx9lL6Mb9WwUNxHjUf/v/vKdfLyOFv6oMZ?=
 =?us-ascii?Q?0Ukbh9OC04grhFIlx5PCuBZsl9g+IbYGX+35S71b3GFH/ayfbi41ofkmU1Ss?=
 =?us-ascii?Q?1e5FTk0ryou8t3+UqC1PtuL5nh1bEZd5Os1s94Co/u0mBhDn9uoYynYO2Jgg?=
 =?us-ascii?Q?gLzdVKHP08/U9/wzsqWab/PR+e/jskW/7W8hfooDjAnjWSiaM5vl/Q2AibMo?=
 =?us-ascii?Q?cNxVLQ9TDuYLto+N1oZ5B+4K8jvJzlAK5xT3uCaHs5os029TKE4geFQjWCYX?=
 =?us-ascii?Q?4Y7qIlrY2yX5nUF5BGhEBOtQcn/TpdpuXe1gAIsVeMusqI6wM7lEu34J0nNN?=
 =?us-ascii?Q?3lCjZeiq6NZGV8f4qZmHE/Tvpk8wba/g9kbIMMP2cNfe6V9yJ1VO6678Oq8e?=
 =?us-ascii?Q?Q+ykjBQ9a2xskfiJaiwk6Pd+0BMPxSP4GVPLmJRgXEJFt60Mu++JJ8ZCGzCk?=
 =?us-ascii?Q?9bQbTeqa1QVKpPr6iQ6tx090mLJZ5kpjGnwuMYgWF03BO4NaZ6cFE1lAFQnc?=
 =?us-ascii?Q?bAf3DP6RKaev5mKnYZWWrmyLim9kioiE7MgUZFwlJJ2FvVxRLcP6ROppF2Os?=
 =?us-ascii?Q?vg0OYXPy9uY9pqOefs1PUeeJ+V6aFSHWoIZyjpR/XhCUtaqEDwSRBkm9l8XG?=
 =?us-ascii?Q?vFWupA/afCEvo9Ik713U4XEmwrdkwBPjTFLWouW+mZ98Y+elxU7oNDuGh+1g?=
 =?us-ascii?Q?Z7Wl9xl62JvK6szNepuan53EU52rVIBOgvyc9FFxazwuMSDumVTBiIn07aSH?=
 =?us-ascii?Q?c6hWhDeSa9t8ykoD1Qah2GoRgkAErvNPzkU6N64kbvnsTHqFcPoCfqmxjLGo?=
 =?us-ascii?Q?X/jRvQyB6Z6o/Die4DHbZJhQPb5tNeB+it6Skqe7Xec3Mgz2Z70EMWPnzlKP?=
 =?us-ascii?Q?RoOQyHah45MlpfUEdIzz54uaDxVRKrUT2dQ+w0hBj1hVTCPLR5YzjtkF5BSC?=
 =?us-ascii?Q?5gdaF3rDprCckm8nbGTOtOopsZYWjVld+tGq1vsUKtlvTq1QhP2N24Saptz/?=
 =?us-ascii?Q?hbzgSF7RZc9dQEH6CHuvxsPqrJ8yCHQFfMLPFhWyJiVGiiwYDiLJHKagXRn9?=
 =?us-ascii?Q?/dWwLYg4aaSPr32o+XhJls4jICCc6E2u0VcKfbUdZOPhhUvhWvmqpq2HT+Q4?=
 =?us-ascii?Q?oPi+WqC3iJLgncyxQy/iY3gixAfqz2SM005FZ+UQ0+th7mZXOoRoh0I+ScXB?=
 =?us-ascii?Q?K5JJq2dVNa0+78KYuG79SdbDsrFEWdWcEWthGuNMBzd8UEKpsIQC30jLqC2/?=
 =?us-ascii?Q?hl5Z9X8Iy52d7GW/XGoyUiALfKCuYYbSbzsHx366hfloQnJRyTifj/wxNEXU?=
 =?us-ascii?Q?ZaFGv9i6kVKisc4/0F3URg0w/uRB4jm0o+i+7pFlnUOH9YklPD14/cg4RpmA?=
 =?us-ascii?Q?DV9DKXN8vto14/hQfiiVBESE6Pa+Dui3LsvzwvHh/ccllAinfLJLu/7KENJn?=
 =?us-ascii?Q?fDNaHG8HByNDQx3sS/fbACYC9sl8bpQpHe0QhLH0AAy41L9xJ9ShomPjjv0L?=
 =?us-ascii?Q?ceiOFM1F6gyYRzfnS9i7B2yNCmD64Aam8qrsBdzy7dV2fjrsIfEXk0V7BLoA?=
 =?us-ascii?Q?FE8MLRKHAGryxcU4IdRc6EzsvsuTGDxS4gZtw+dZUzMflnazES4XqjMZpuZo?=
 =?us-ascii?Q?J5f7FZ1NbUvTjJxswjnMefailu8+1ko=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1124e8c8-44d3-41b7-6e5a-08da4e6b3a96
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 01:06:07.7125 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FG9QLw6QjYBOvfa9mDdFSeo4+XQf+d6zcM5j5++bJoTveHREDtTQ88nNwjFKoyRhxeeZtllEWwgR1bnxGreD1DD0lnoTnbFUJb3zL4pQ/Po=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3772
X-OriginatorOrg: intel.com
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Riva,
 Emilio" <emilio.riva@ericsson.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 3/5] net: pcs: xpcs: add CL37
 1000BASE-X AN support
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

>On Tue, Jun 14, 2022 at 11:00:28AM +0800, Ong Boon Leong wrote:
>> +int xpcs_modify_changed(struct dw_xpcs *xpcs, int dev, u32 reg,
>> +			u16 mask, u16 set)
>
>Why is this globally visible? I can find no reason for it in this patch
>set.
Ok. I will make it private.

>
>> +{
>> +	u32 reg_addr = mdiobus_c45_addr(dev, reg);
>> +	struct mii_bus *bus = xpcs->mdiodev->bus;
>> +	int addr = xpcs->mdiodev->addr;
>> +
>> +	return mdiobus_modify_changed(bus, addr, reg_addr, mask, set);
>
>There is a mdiodev_modify_changed() which would be slightly cleaner
>here.
>
Interesting. I could also add another patch to make the same change to
xpcs_read() and xpcs_write(). Ok? 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
