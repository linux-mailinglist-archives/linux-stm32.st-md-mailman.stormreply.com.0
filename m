Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 838706714F4
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jan 2023 08:18:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 354CDC69058;
	Wed, 18 Jan 2023 07:18:30 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E7FC2C6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jan 2023 03:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673926516; x=1705462516;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X00iEq+wswc+M9vbDEREoKiAkIzRtUNwGnVmM3D89RM=;
 b=RhLFZ7ow6TbD1fskRMFCemVccRsgisTA87OoR2ZkFsZD2R7Mt8m//oL+
 7CNBT+tEBcOHCdu8UkkwvAk/V8tbWhts6N4qZOCTZ412xvPd0Ch9oLYPr
 ogBcK9fNro2jCHWXwKIDwBRZhrGVMN+q0vGE44kwXeBjUeKmN7H5J4wFC
 r5v+4+bFDNoQ8QSb8Zt8jI++bTMkTsybnh+XhkeW4CXWr88NB6YvWGJG9
 k4Lmo4M8V4TyX/bDrh83vmCR18OBeXswqmzG61ytNFZhFzkbQEszhFEAX
 IpLl9roJasvpIaH1ms2xfn0vrz2R902KlqHPPREnHdumh0CppwsKYKSD9 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="304290489"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="304290489"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 19:35:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="689658811"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="689658811"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 16 Jan 2023 19:35:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 16 Jan 2023 19:35:11 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 16 Jan 2023 19:35:10 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 16 Jan 2023 19:35:10 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 16 Jan 2023 19:35:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMNb1P4q3ZVY3DFA7FnoI5Qf48pLFfqiXLZN6De1HE9M55n8Wx0rp9eujh2OTFDbYgSu0i0WXadqphrIjaEH2uJ93kDwRfCmy6TuStQlWkLsoC1XNuPd+pJx2HW+LZgo/9HtK5RFfPcwbFDTSCbn/PyaigFyTyOj1LC9d+kT4iaJ2u8XSHB1h2s6iyriFEZuz3t+T5xPTN5ZBKullhJDZ3TVEbNFd87oo5tFh961x+Io02ooKDvd/piBLdqBIkXpQb9WOcjt2KlWi1TNWC0gji42opji6ZHfVY14vCc4mfwTvaTzkkiQndpxGTv6iFbOb0O6/xbd57dJcspjm3o2Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EKzyfBtFzH6GMPTOXGrg/m9TT2U3MVwV54cEkyYlME=;
 b=BZFITOtnsruxg7zZxC49jGhFxywqT+xoNxP3wgMReLbuzVxBsbf2vW2vlIhy6KyOxcJ90NxFIUtSUSjN2GruHSBXTQVw1OO5cjhYSSSXJfkBhOB28Kh3yeuXEZyzeYMMuI6AR3ay60oGgXoLNqnCUFPtdzKsRxnMZYMQc0j+B+5yTtxP4hWKPyvSowcGlcunqidDqzbK8MXEK0ScbWPi3C2soWb5hsmmPDKCZZob7SP/k+v1JEBseTQ9lzwjbWSmWXI33cjzYVgYzM6Bpojiq8wUE/dfOFQgC/5OrOl5h6YG0HMVpULbMKGwRZwFw6mLfq7ecqOPWhXcLXDClne7Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 03:35:09 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%9]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 03:35:08 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>
Thread-Topic: [PATCH 6/8] iommu/intel: Add a gfp parameter to
 alloc_pgtable_page()
Thread-Index: AQHZIe30VE0qujIGcUC6i9HTWHZFcq6iBWPg
Date: Tue, 17 Jan 2023 03:35:08 +0000
Message-ID: <BN9PR11MB5276A8193DE752CA8D8D89928CC69@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
 <6-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
In-Reply-To: <6-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA2PR11MB4874:EE_
x-ms-office365-filtering-correlation-id: f21960e4-e56a-4178-aaeb-08daf83bd510
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kCPbd2VtI1HW9VFIac27jep3abDo1i4Im+Uv8AxZ1tN9yPt0/8aIpXfHFm9C9TrreevF3r4wmJi9u1G5gddgUVyXMHFhURkL7nKKGJXFV++//a4xc7Gj6OGdPagnrL7UszLXdSlSbuqnMX0pyAXiH4L0HOwWTwnuFJEwWFiBE61FKe+3uyUh/HaliAXR9Pq7A+G4chDPHqwA/1SEXe5ZD0/GF2+27DJVQiOj6jTUv2C9ieo2BTr8TQylKdnXiefXf6SGefKyOtRjM8xffDp2zh0mbCs1Xcdtc8uOdAm/Uwl3U0Ac7xDJAiCi0EfvoFqPnkP35OrYJhxwFVjtbEz7IYis77hywANtyso/7iWLZG1ly/BmqlGbSQDMuMv6ZQlsL7KBUXcEsK0lzhhPDS1tpboUsSxr0PvcKejARjisobD4oCib08oqN5ojDNDWhEgkjS7u0O9/RTVlfaLbYK1iY4g9O1iN1LYiSqmuUPlu+aokgChs8Rf9FBE/gxnNpce+pdx9zsjwGyEmG5Ag8lVQT0AlxKAZUnYNJqwITPFKWLfeA7IW82Xlu+z5KcRWMtVvKFxxbPGhEIaovfnBRnZk9lo/ebzFkJRtSVzgQ8UF/KrJGlEn0ISusCKb1iE3Yf6k7rFruSC2A0y9zVlqaY8lSZ50Kr9GK1h8QQz+2JbYSXT5RhRru3TGRbiLl1j1nW1rQssI+oFnaHP6kKl7KOBc9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(366004)(136003)(376002)(39860400002)(451199015)(86362001)(558084003)(33656002)(186003)(9686003)(26005)(41300700001)(4326008)(64756008)(8676002)(66946007)(66556008)(66476007)(76116006)(66446008)(55016003)(71200400001)(316002)(7696005)(2906002)(6506007)(110136005)(54906003)(478600001)(122000001)(7416002)(38070700005)(38100700002)(52536014)(5660300002)(82960400001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GlZf83d76V76P5/l5vgsCQfHdEbPTs/mAzZH7ATO8MQ9EWiwWs+tI0KbjA+v?=
 =?us-ascii?Q?LpZjM5TMuVHAjmdgjjfcKNx4BCYu2nzH9kSCnhwZUOiVvadNyDD+P8GDpsO1?=
 =?us-ascii?Q?8LBAqy/jMAlx0w2bY37rmgREn4i4guKqVYAaj0OpgDVt3TRWHocbGcHfURxC?=
 =?us-ascii?Q?pNmkubPLizBNDXPY4ABY9gswfB2avrU7EIfNfeqpScTtOfqzyE1ZM3prNb0M?=
 =?us-ascii?Q?FbJ3Z8kBb6e4KjWGDLpVnnxHOWamqKvebOldTBwLfIesXMqC86gCi7NuqLuE?=
 =?us-ascii?Q?F+20vauyIXcZOfKYQhwF2rz5QNrgn/YUJY/jhW8P2k4iQc5uYjnuQRLygOUq?=
 =?us-ascii?Q?VwyHtm+Olyfui3LCBsK7lo+BcoOOSU9JJv8Ts5RSCeWO54uK0sk9CbyULCSf?=
 =?us-ascii?Q?AD1JDWzZCaVZVTZWfSCxyDX0r2dPQrZxDkGaZ1FqGvoAnZ2zKu1oas+4X5lK?=
 =?us-ascii?Q?xu+49UGfOkmzOSAZttMwlsn8v60u2wEOWCjvqrIhQOu6+V/EU7+p1SNAwiqd?=
 =?us-ascii?Q?yRCGKNs5LFWvQK/Vikd7Dt4DmSj4s13htCIMc0WsA65q5C9UKLmnHdQROcoD?=
 =?us-ascii?Q?FOLxnknSIPvqKxeebg7TUP2M8h0NyWiyvVapYh1XtROzmekG9skYaYabPYEj?=
 =?us-ascii?Q?8IvGaSTkBmyUGtOUnROtAtkmaSiodq58F+MYopsRv9Y+k0uHzSJURhRVMmm9?=
 =?us-ascii?Q?NEiYkR4VFQ7vUgRUttxeZRGX27l5QMPYY/i/YTRv0qm//6n5ihMMoU/b4pPS?=
 =?us-ascii?Q?4E/2xf/MIpKJf6Vysd8/f+Lb01K98lR4m0soO0X29DRnAzJO9VZtnvZ+ei+G?=
 =?us-ascii?Q?9vdlzyeOjqNg/aIH3DszQ2cx/x2qwV3jU/Qmffn8qb/9Jjhqrna73HXb3Aaj?=
 =?us-ascii?Q?6ASdX/iIL2r1cPP1Vu625rumuNfxSkz/XTqTC9Q60SutQgTiHecrV4fShtlr?=
 =?us-ascii?Q?JrRwnE2L6wAT3H/qhedvUkekR5SrqMOMLzyD/NkELczNbac9nSFfoJyDPy9/?=
 =?us-ascii?Q?+DcH5ZdVUS+tdk2gTHVp7hkLxsYB5lTZsLx9OE48zMzqXPINEzSF7Qk7c/rw?=
 =?us-ascii?Q?bvxtURGhsZHZ5m+4v4Xpxk4d/KllcAB/To1zjvMT+/om7RsPAJb4AqNBovAJ?=
 =?us-ascii?Q?2GKSVpZjlztOWkCaTcTuBStmOp5JJYCzFOIlDC0TOL4m9jHIDZ68MpVnSn9K?=
 =?us-ascii?Q?PPoLkK4AuuRXdkBv3VelYBmCaR3lYmzoUDgTzA6rrn9E346bholfPdW6HGb+?=
 =?us-ascii?Q?eA6K5g9uYccXuiwgEvYDQG3+ZNQNUXqvTRQaaqcaXhKN0bBVAawdSMkRa4ZM?=
 =?us-ascii?Q?Zch4D07i368f1cAVV6TfG/sV8W1RoO8m2yAHckrf+O/CSc2Wf93Lx1/Roxpx?=
 =?us-ascii?Q?9dYSJZHO+yHOiaKx76d/cKIOiPo/MkH8OU35fz1VnU4aZzc8u3cMcUEyO72Q?=
 =?us-ascii?Q?nbEzukGhWU03XjlaSla1PrQ0/SwzaaNmDj3WNGR3l6xcoXIr98kL+BuzsoWy?=
 =?us-ascii?Q?VJECxGaKcLCIWTjs0rmbfAENdUNyYO+kvELFayu42zxANTxjxIuNNNrKA8tT?=
 =?us-ascii?Q?XQTvUZcCJ+7Zbiqe0pdp+Q0NQ2atBDMVSFsYr2yT?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f21960e4-e56a-4178-aaeb-08daf83bd510
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2023 03:35:08.7432 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aPJuTk1yQn9s5N4feLo+zGc8Xz4UGPDZgSWprDdqKQD+eAl0xPcnysejpNLvdO+J0Uqco+fUtpk3d8qs3PfjBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4874
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Wed, 18 Jan 2023 07:18:27 +0000
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH 6/8] iommu/intel: Add a gfp parameter to
 alloc_pgtable_page()
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

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Saturday, January 7, 2023 12:43 AM
> 
> @@ -2676,7 +2676,7 @@ static int copy_context_table(struct intel_iommu
> *iommu,
>  			if (!old_ce)
>  				goto out;
> 
> -			new_ce = alloc_pgtable_page(iommu->node);
> +			new_ce = alloc_pgtable_page(iommu->node,
> GFP_KERNEL);

GFP_ATOMIC
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
