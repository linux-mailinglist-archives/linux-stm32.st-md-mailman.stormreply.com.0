Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CA66714F9
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jan 2023 08:18:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B66D7C6906E;
	Wed, 18 Jan 2023 07:18:30 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BD9FC6507E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 01:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674004710; x=1705540710;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cEa7gDKc81r4l0f7hwUh7LYdSKG0c++rtIKCeYgmuwc=;
 b=CVKe1of1ujU5R9Mj6beV35QNUmfXiSEyOqTd1OdiDHw8TP+mcGeIH3wI
 jd2W9mbg5xlUARmXEe1VzYjlTn+H0rQaMqKiIaZtYbV+qLkI2L5b3ldk5
 gKJSqFp9FtO1Sfw9i+7qn8JItEd3ilCvgcgF2wE8QZ+H40STZrVm5IQT2
 1qxNrOaBWK4v00dxcX/XjRY7nmcG0JHujn34JjQnf3P8qbk05kZsCxnC1
 eqHuH10d/5hf/t5C1BhQ1pjgif5xccFqIOAr4PnZ/92rjiCgmUB0EQL1Q
 ziGIX7uMnKUyiUPW7ELgtBd1Or4rOFDx2FZJKbBYm8lTDQXPrPvjLRiNq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="305245266"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="305245266"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 17:18:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="904856240"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="904856240"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 17 Jan 2023 17:18:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 17:18:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 17 Jan 2023 17:18:26 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 17 Jan 2023 17:18:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjVXmWqExSDjISjYnpTUw1HKlvPPiRwqvGVjGA1c93MOWgPHv2D+XziADsfp+dFI7/kueLTRnBsYnf9a1J5xwvnElVsMPbop4BjSD2dILexKkmcPOOW2lIbbe7Z/+70DOX4/pscejBTx1vjd7GwdlvOqsOYqcFI0il+UlAixcE931HQb+cnAdd5CxNxSMN9sgPM9I5PuyvKsbm1bG0mMoKtOyGfvrlCO8fXXnLT1nKH8rC6TZ3xXWLQ9MnIysBdH4XbxSolXYtxkCLEW2vtUBP80DLsurL2I9OHkwRxg7crWFjp9C1aQPyI8jM2IHg4qWzqw88Y6TVGzvz0CN7TfTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4DT1zvja5K5n2peI02ls2OVK2RbncehTrgERprA/k0=;
 b=jlRPTwjb0dit4snbnDUWzfgA78IZegMcNSmmUAQhbZV0OaFm7Ai8AJtEyzg0HFHF4212Sx38XcX3qyy5BRxDYrHxUIbpbW1OPO0GC+pT9Xg+WpEiCHDe9yVF1ksheheWIDeIeJajbNC7OtN24XgV0ucPH6vocSRDvazbylcU8d1D6PPeFW1yx0MrJylINDoCv0kjHN7f2rvQqFzwvcouilef/ltMA6mClI3q8cUKmTavA6c8w4blno7trrvNWu3NBvNt0g2ZzW299YNyMzNVVf7xovAVir5iuWKmiJ8rP0bXwLJrefW5566IRAMf47A6tcNrwBkazeex8Gxg2V9CUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DS0PR11MB7334.namprd11.prod.outlook.com (2603:10b6:8:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 01:18:19 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%9]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 01:18:19 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Thread-Topic: [PATCH 6/8] iommu/intel: Add a gfp parameter to
 alloc_pgtable_page()
Thread-Index: AQHZIe30VE0qujIGcUC6i9HTWHZFcq6iBWPggACmeACAAMU/oA==
Date: Wed, 18 Jan 2023 01:18:18 +0000
Message-ID: <BN9PR11MB52769B8225A81D0636FFE5648CC79@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
 <6-v1-6e8b3997c46d+89e-iommu_map_gfp_jgg@nvidia.com>
 <BN9PR11MB5276A8193DE752CA8D8D89928CC69@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Y8ai8i2FpW4CuAX6@nvidia.com>
In-Reply-To: <Y8ai8i2FpW4CuAX6@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DS0PR11MB7334:EE_
x-ms-office365-filtering-correlation-id: 1ea5cf80-1f28-46c0-f429-08daf8f1e21f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dNd7h1DsaP2oGFxbimMWDxRfU+m5fbS0Vl0JVljg5jrl/UOr/dTYXcMTt3lfl44Phs8zArNCFkOqX+5ukqYW3XBzJH94d3XfkDJbffnwOxhfo65+VTGJ3XwdtOcm1GmOjAjHJ7IV8FtrL6FBDNV+9QSvFYzuo/gF9exRM/sn9HFVPEmr2IpFfjLHGNfMOhOja1dwvtO6OlvYypLEw/ggTJrk2mZjWXpJD0gjbMCH5+7dgzvcXq6y+Z/wF8aiCzjBG1ESBpiv6XiLhWwsHbGVVnrf7rcC4+Id66F5d8ebrpivpgZIiWU4nWOVOzmzsbsWrGx0LxoSq+b5GGfOAqc+plmJlVoUg6A4DKGLFmMVmhWf3g8vc86uu0ralhGfMLba84XWY81gPppPRdy0LWzSY2+PHZnScJnLbfmHfASu25sRGTvBPslDlO/5D3x0iwROt5GWArsXJB3/L0zRwJEjROwFOtKpmcL48hVLTUMsD2W/6Y2LjCgfBhoPo+3yztIpzBUvw0oWd/XQpzhIJzNOqmxd7WljwNP+BgakNvYFdcqkEt6MNaKYzX+1+QGHuO/FAs5AEduQ/GbrKr7WGvKw2ScvFJQ2gCAcVBC36zqbZ045uCWrDvLJizbOCPUqXEr/iI1pN1tYI4KFyOZq4ZzDCVSw9C2Sz5Hy5gkA4uJMdt+D113v4TyzYNwET00lquD/1ecwSs7GLlZHalEtv5y02Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199015)(33656002)(55016003)(66556008)(4326008)(5660300002)(8676002)(66446008)(66476007)(6506007)(76116006)(41300700001)(66946007)(64756008)(26005)(9686003)(52536014)(186003)(478600001)(8936002)(7416002)(38070700005)(6916009)(54906003)(316002)(7696005)(71200400001)(82960400001)(2906002)(122000001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z/g/JtLZbP8i+2DuQ6J/KPTZQnycrjSqJg8nZf8fpaVqBSgxVPlRQiYoZ42X?=
 =?us-ascii?Q?FkpE9CUoBUmbYvrq4oBRGuuTjlP5B0l5VSelNQ0GbBtlNjvcXipcVjVYo6Fh?=
 =?us-ascii?Q?a24iyyBHJwTkA02JCwD9WrnPJ+jp2hRo6Exj1g88TvFef9tnSZHcGveVd1hj?=
 =?us-ascii?Q?J0+u1n/L0oy9tpnJfCKDIObZXO8HfWuJD2oYN9oPtymw49w47jwdu4acKAkW?=
 =?us-ascii?Q?WDngl/Xlfscv1HnbUapPvezuWmy43AfW7SywKsjSmBrwhg6wdJI6npdY3O9a?=
 =?us-ascii?Q?Ao0zGaq76+ePx9jEWeDO1V4o9UROT/KYNl/zx/DpeQgzCk1nu4Q4TS34ojxV?=
 =?us-ascii?Q?/kM3ASwHIOoZTmPF4llOQoJyXwFXqU5UacUOE7ycd3e8JShBXnQRyT7jt4nO?=
 =?us-ascii?Q?nyoYIIt/5onBiZ1TEBNlOB6xlUI30PIPTbv2bmqFBQX099tI1CHLZo4rPRJx?=
 =?us-ascii?Q?IhFVxBAiWOf/6d3Pp27GJ75irs+1XtDQ9yj/LO5FV0Z6XbODxh3mxucbRPzI?=
 =?us-ascii?Q?OcnhsN2bl2VvRBnOLSTk9/G2cue6XHaFeeMZLsR87IuuEiYis+9IRVpA39Bc?=
 =?us-ascii?Q?qji2K1KDvQTUSYTrZ9j/CifCffwf7DAmM1JAILhxR5bW99xXk5vG6fGj7fRg?=
 =?us-ascii?Q?to1R+S2AWBDNZjA5jUtZcZposNj7Rfk659oxBFoFzOABUB6xcgHn2NFJSFz/?=
 =?us-ascii?Q?doI8+gOb4PEVaCGaIzuRkFk4izhTQzdo937CyvISWDaSNCtx0Y7mtU9bXkuU?=
 =?us-ascii?Q?rUPh6zbHXviIVRvqlG8q//CF+Hjv46OybBePd4BosFbtbcKGO/F1jxescZ3H?=
 =?us-ascii?Q?cwmrUZmGGePoVaV2ZasucFEHFElN9hg4ttpND8fT6yva7B5256ncx+K3nyF0?=
 =?us-ascii?Q?Nn6hPoGXv3FBMpMQrLrEiRBUJPuq31AiDh7FtNqFgFlmZxRePYNHOVPDY62P?=
 =?us-ascii?Q?Tid8EEq+chK1qA22uEVfEwbUiXlKGols+SkYJ6ZUTefPTPdcTo9F9Q358coN?=
 =?us-ascii?Q?BnPD8cOYLC+5wQkZulNx3vrm1+H4Xb50zhF0SRVF6auW/2/NqdZoyePDqPPo?=
 =?us-ascii?Q?hAMJhcXwjU7n7RO2KQYghnBerwtCo8mO9QIau5fYwUmZWymxM7JcTYdfMfOl?=
 =?us-ascii?Q?HI4Pfi3g4MEW56oR5DwfXN7XSAK6uFmZRlC3CPicCJ77uGBil68VwnJ9uuRI?=
 =?us-ascii?Q?kDc6PEqTkNeohl46dOg9m3MuXKtWP2SH23wGvfGpYxHe3oyQTdgfqY3hx49F?=
 =?us-ascii?Q?gvFK6/eMJhrTBFaDfIkmLw/h/35fTg55PcK5WiIg9ZqZo4YK49zRBjTjWVNw?=
 =?us-ascii?Q?XSmS7oa2N8THCSaSXoY+gbcaxDty4vmp7KPm8TilXTnKI+Q6Mob9Eh4aeXq8?=
 =?us-ascii?Q?wTQiqPS5ZXaaxoxnqFKWppGmxrmM6bJdbColc5qx2B61egpKzsmolZAiIRJ7?=
 =?us-ascii?Q?0/rZc3pMRlYkkd0iAizb8f6I6N/HZn0QZtID9uxS8MX+A+LrYZ5DhzPzhlGE?=
 =?us-ascii?Q?6wfLA/766zwlP10buh5crSjB5w3imk4rDAivOyvMsDVdzIG3JJ2i59/zsx57?=
 =?us-ascii?Q?3iHTo0QllxPxewFwrUZ+AqBVFNCqmivPuXTXKSwo?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea5cf80-1f28-46c0-f429-08daf8f1e21f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2023 01:18:19.0429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8w580r7NJ7K7B07pS3ggPQCI8PvosmoZdGiDz74+ePmU9Qb6sFpkSDKCc/KCHkt8X1vPEb2hHPvy2vDFVFpCfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7334
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Wed, 18 Jan 2023 07:18:27 +0000
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
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
> Sent: Tuesday, January 17, 2023 9:30 PM
> 
> On Tue, Jan 17, 2023 at 03:35:08AM +0000, Tian, Kevin wrote:
> > > From: Jason Gunthorpe <jgg@nvidia.com>
> > > Sent: Saturday, January 7, 2023 12:43 AM
> > >
> > > @@ -2676,7 +2676,7 @@ static int copy_context_table(struct
> intel_iommu
> > > *iommu,
> > >  			if (!old_ce)
> > >  				goto out;
> > >
> > > -			new_ce = alloc_pgtable_page(iommu->node);
> > > +			new_ce = alloc_pgtable_page(iommu->node,
> > > GFP_KERNEL);
> >
> > GFP_ATOMIC
> 
> Can't be:
> 
> 			old_ce = memremap(old_ce_phys, PAGE_SIZE,
> 					MEMREMAP_WB);
> 			if (!old_ce)
> 				goto out;
> 
> 			new_ce = alloc_pgtable_page(iommu->node,
> GFP_KERNEL);
> 			if (!new_ce)
> 
> memremap() is sleeping.
> 
> And the only caller is:
> 
> 	ctxt_tbls = kcalloc(ctxt_table_entries, sizeof(void *), GFP_KERNEL);
> 	if (!ctxt_tbls)
> 		goto out_unmap;
> 
> 	for (bus = 0; bus < 256; bus++) {
> 		ret = copy_context_table(iommu, &old_rt[bus],
> 					 ctxt_tbls, bus, ext);
> 

Yes, but the patch description says "Push the GFP_ATOMIC to all
callers." implying it's purely a refactoring w/o changing those
semantics.

I'm fine with doing this change in this patch, but it should worth
a clarification in the patch description.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
