Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF55F72BA3
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jul 2019 11:43:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D799C5450A;
	Wed, 24 Jul 2019 09:43:50 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc2-smtprelay2.synopsys.com
 [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C560C544EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jul 2019 09:43:49 +0000 (UTC)
Received: from mailhost.synopsys.com (dc2-mailhost1.synopsys.com
 [10.12.135.161])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 56AF1C1C88;
 Wed, 24 Jul 2019 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1563961427; bh=nsGQjw4xzg93aCMW1JaUJ/Dkct937RNQGjWQGCBBtrw=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=gIsP1Ft2lolpCF46gVqHVxWiCYl8rE4DPyaqCL23EU3G46YbcF5Ed/GvixzQZhg16
 NF5EhupgnBWmLFftQ32ACJJqN3xMrGRUYfyL/gRPGsTcsWcx62cLi1xafJ8/G+QfsG
 nFhGd4CI+aUKpxS4ox7owRgFGtPrz3gxTWe3uqmU94u/SJ6dc8bvtocIoXoP0trG7l
 wEqqpClcMgsCKw8/RAJVCd+GCbj0IbXKzIKQXjo8k6NJdqrZp7LHApjlfV0o4RGRWO
 5a4THDA+J8RU3EI4M2l7tYmnYRu1R9+k8RZWkdqyiG4xs5kycVXy5SicBtBYr3Hocl
 3m2tCrg5Pv7vw==
Received: from us01wehtc1.internal.synopsys.com
 (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id E9A0AA0093;
 Wed, 24 Jul 2019 09:43:43 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 us01wehtc1.internal.synopsys.com (10.12.239.235) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 24 Jul 2019 02:43:31 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 24 Jul 2019 02:43:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VR8h98ihHYxAc9AELg507KZqCpobLQZHIUjnzQT6eUt2zz/8FgDuElAkvBa3RRDqkqUcJLpjruYRAaiUFq6s+QyJEBlskRxFD/y1DVZ7y+v0nvg4dpgQM5KsajhC4PPdN1TpnOYdpCAqwNhMROJQ3qTj6AsnYPIom9GDJqDYKpdcrdmqwzMXeoun2GP4Lft3pJTmyfp2SplSV5GVBjGyeKxWgaQIWuaTTJNLNFudc4JEmLp6uixLPEEOq1i1g9s9yaebTL/Q389EcBY6AoLE99fCv/xehOKdJPE5Jjes8y1QmIZZ06Pxq4s4mUafFFvZ1UfBQrKSz+bOB+0omCx+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgNEFvzUi99+JtKtlM9mU45xe4d7SqyZyIxMW5bcWyA=;
 b=AOdHjRAR+Y6xb3kQNS7tLB5kbVswtTQuNhx4VEA0S1PRvHj9Ym5d6U2jqQT586IGAhyCKX4qkUCrgQ0XUE0Jj+uRAf2JsesLVfew7t3EQPPLE55eOAVf6jzCN4qG+olaJI8KcKZ7SWUINNXoHMgDVpATBuUYhESyYZgcwvH7eSGaep+aIMadHENulypjTJr+wfAOzYdSzizfdUp5eppqncGM9ndYfBoBEv2szxu/F9W+7GJuc10iE3pHPRvXwb65Rci3+xUJh73YqxpcSl0t2T2T0wFVSVbonJAWP5iEWYVbIOSjtccHetiSpyYxCQ4RuHfgIV1QcIo8PZfyHxoZgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=synopsys.com;dmarc=pass action=none
 header.from=synopsys.com;dkim=pass header.d=synopsys.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector1-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgNEFvzUi99+JtKtlM9mU45xe4d7SqyZyIxMW5bcWyA=;
 b=DPfJ1eGstYI3pW/0Ki4wfN+NI9qThNJ7zLSQRoMBaFJoURjzucP47omeYOHHhlHxcl/AJIMgqh1wKM9Ai6EGKxA4POhQM+h3JPgFAHfNkCfRChHL5gFg6FbkWnJb2BPBQdyJNPQs5InZIOnchq2rXS2710IDHUKPhi+ln2qeM1A=
Received: from BYAPR12MB3269.namprd12.prod.outlook.com (20.179.93.146) by
 BYAPR12MB3048.namprd12.prod.outlook.com (20.178.53.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 09:43:29 +0000
Received: from BYAPR12MB3269.namprd12.prod.outlook.com
 ([fe80::f5b8:ac6e:ea68:cb1c]) by BYAPR12MB3269.namprd12.prod.outlook.com
 ([fe80::f5b8:ac6e:ea68:cb1c%4]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 09:43:29 +0000
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>, David Miller
 <davem@davemloft.net>
Thread-Topic: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Thread-Index: AQHVMYtq2Zx4WVoG/U2kL8GCK0bP/abPQEOAgADTx+CABnZ9AIAADuYAgAAFQOCAAAnIAIAABLTAgAFMy7CAAB4gAIAAAO7wgAAG6gCAABvPAIAAcGAAgADrmoCAAA0XIA==
Date: Wed, 24 Jul 2019 09:43:29 +0000
Message-ID: <BYAPR12MB3269AA9955844E317B62A239D3C60@BYAPR12MB3269.namprd12.prod.outlook.com>
References: <BYAPR12MB32692AF2BA127C5DA5B74804D3C70@BYAPR12MB3269.namprd12.prod.outlook.com>
 <6c769226-bdd9-6fe0-b96b-5a0d800fed24@arm.com>
 <8756d681-e167-fe4a-c6f0-47ae2dcbb100@nvidia.com>
 <20190723.115112.1824255524103179323.davem@davemloft.net>
 <20190724085427.GA10736@apalos>
In-Reply-To: <20190724085427.GA10736@apalos>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=joabreu@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 125300b3-56e5-4fef-aa9b-08d7101b6265
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BYAPR12MB3048; 
x-ms-traffictypediagnostic: BYAPR12MB3048:
x-microsoft-antispam-prvs: <BYAPR12MB30481B709FD62FE61A0FA4ABD3C60@BYAPR12MB3048.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(366004)(376002)(346002)(136003)(396003)(199004)(189003)(316002)(229853002)(486006)(186003)(25786009)(305945005)(54906003)(7736002)(81166006)(81156014)(9686003)(8676002)(110136005)(6116002)(3846002)(33656002)(52536014)(66066001)(4326008)(74316002)(476003)(53936002)(256004)(14444005)(11346002)(478600001)(446003)(5660300002)(6246003)(71200400001)(26005)(8936002)(14454004)(71190400001)(7416002)(86362001)(55016002)(2906002)(99286004)(102836004)(76116006)(66946007)(64756008)(66556008)(66476007)(66446008)(6506007)(76176011)(6436002)(68736007)(7696005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB3048;
 H:BYAPR12MB3269.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ft7v7HCjUoHGcFPsuefpcEXJg89UCUXy85K/Lk+ZS1aHOyoiW1omMWRIIlLtgyFPBDW1f0fFMH6OHnaIPQNinvpiIzbKZUWBi2WFw+V1RifomCQHRjOgsDKnkYLKkM4u7oc4gO4z3SQ1VRjVyXCu+4bvg8w7FpbGIbApjrHQahCI57E2zJJLkPdd2JG7sii/TceBR4Kf0Du3nI9kOkPdMnP76BI5fTd1K1jnxj8Hfgayhll0OI1n9mI0HOm587ZeewC4/FBYOuwN+wH/ydjPYQqMhyZ0Fz2OCR4aEN2kokLV2rkgPgIped/DmzcL8B9KcALlpro+Ra04ler38VvWdeiBmnYhPCo+vZVSMyvCViDR9FQyr1xbg/V7ehdp8yLqtIkpmVE+IHNlkLfwRTlRXatRPOiXCrtBCoQ9trI+/F4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 125300b3-56e5-4fef-aa9b-08d7101b6265
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 09:43:29.6686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joabreu@synopsys.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3048
X-OriginatorOrg: synopsys.com
Cc: "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>,
 "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
 "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "wens@csie.org" <wens@csie.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "lists@bofh.nu" <lists@bofh.nu>
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: Introducing
 support for Page Pool
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

From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Jul/24/2019, 09:54:27 (UTC+00:00)

> Hi David, 
> 
> > From: Jon Hunter <jonathanh@nvidia.com>
> > Date: Tue, 23 Jul 2019 13:09:00 +0100
> > 
> > > Setting "iommu.passthrough=1" works for me. However, I am not sure where
> > > to go from here, so any ideas you have would be great.
> > 
> > Then definitely we are accessing outside of a valid IOMMU mapping due
> > to the page pool support changes.
> 
> Yes. On the netsec driver i did test with and without SMMU to make sure i am not
> breaking anything.
> Since we map the whole page on the API i think some offset on the driver causes
> that. In any case i'll have another look on page_pool to make sure we are not
> missing anything. 

Ilias, can it be due to this:

stmmac_main.c:
	pp_params.order = DIV_ROUND_UP(priv->dma_buf_sz, PAGE_SIZE);

page_pool.c:
	dma = dma_map_page_attrs(pool->p.dev, page, 0,
				 (PAGE_SIZE << pool->p.order),
				 pool->p.dma_dir, DMA_ATTR_SKIP_CPU_SYNC);

"order", will be at least 1 and then mapping the page can cause overlap 
?

---
Thanks,
Jose Miguel Abreu
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
