Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE5435D97A
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 09:58:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15E01C57B78;
	Tue, 13 Apr 2021 07:58:25 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65B73C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 07:58:22 +0000 (UTC)
IronPort-SDR: 1/JSRXsQ4BTlHFoeWhCyXjH18IQJ5NgSEQOSwxyN6KqP2edlrjxl6CyPyRDOvZpUJ/+vQlCrbc
 9RIxEvjY0t9g==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="258338118"
X-IronPort-AV: E=Sophos;i="5.82,218,1613462400"; d="scan'208";a="258338118"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 00:58:17 -0700
IronPort-SDR: ZB+CaTrjgcrIijZM1MHXv2bvQSNppBbyCyU6mBV84Bpt3dMo8/QiW1ZukQo0qoTvH1RuI91rTy
 rJwR6hab85Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,218,1613462400"; d="scan'208";a="388939671"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga007.fm.intel.com with ESMTP; 13 Apr 2021 00:58:16 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 13 Apr 2021 00:58:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Tue, 13 Apr 2021 00:58:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Tue, 13 Apr 2021 00:58:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQD98i/cEObsGpGv4sbIPNwduvzk6ttpuYYrvcmzVmZdmN9IGiOdV20QE0faBADIt72z0wEOzDOqcpRZlnsS/vjVOLgbp5OYBNyvdRiuIO/mjKi68RI+l392siPMZVEOTFhy9R1Kp030NC1KOhUzJUb25CsSh78pIFQsXua74q1MW/esJbJH+7W7MQyH/wuc7TnBUsR+mEq2LILyfIESaikqYCEY9qas3436J5bnyVSaXhK+pVaTZ59U+qGiRLp9U4GRlHVDlHG4SG7oyHob7hpZ5ciZPiqKEkKssPQQgt3JdCZgoEYMqTI7nadadvP4cNTB9BpMKsvbF3n7VUCH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dl4XsTxCZygss3+VhNwl6uFPioqjV0NN78J7NmuxAy4=;
 b=n2fUHAqDAcwm1eWcXi1OGAHLeQ4mtpnVc0EJpMgVrgeBAMOWMbfqvs65z3+HYi++XFcivsUVOVH9s8435Df2EZJ/+MEohqDUjbRPFUjnE0yS/7izXVXanQ+mtNK2Nbs9kx5OC/y0Tk0P+cuohxiep0exITUzMvpT2JN4dBfNuWtFZ83GwmgNvrLuq+gOGAdyIEf4ybA5q7jQ0INcibpr5JJFUlGUF25N5Bx2BH/WGfw5JMAJ4pkt8ZQUx4kJMBIImmlrnBMmdMF99ZrmnlOJ58ssY3rl7yIz91D2Vd0g0zwSOZWpmW9Y2SHlEPqbNRTWDImbpYpJjKtc/RWCAbS9zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dl4XsTxCZygss3+VhNwl6uFPioqjV0NN78J7NmuxAy4=;
 b=yqyHEgQv9bJtu1KqrLsi+yMVpAoF6cb7jKtdBCdJ0fl+qKR4QSO9r+JtSHfs9caWm2XEHx+PBsiSvoYp/thVHDwkfj9ubgpIdT96bhY3kQ44AleOsqlH18USk/ZlqPd0Jz5ToCd6+EbZRM2GoeEOjpo+O+SJAIYGmW2Rec+bFXs=
Received: from DM6PR11MB2780.namprd11.prod.outlook.com (2603:10b6:5:c8::19) by
 DM5PR1101MB2074.namprd11.prod.outlook.com (2603:10b6:4:50::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21; Tue, 13 Apr 2021 07:58:14 +0000
Received: from DM6PR11MB2780.namprd11.prod.outlook.com
 ([fe80::dcb3:eed0:98d1:c864]) by DM6PR11MB2780.namprd11.prod.outlook.com
 ([fe80::dcb3:eed0:98d1:c864%7]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 07:58:14 +0000
From: "Ong, Boon Leong" <boon.leong.ong@intel.com>
To: David Miller <davem@davemloft.net>
Thread-Topic: [PATCH net-next 6/7] net: stmmac: Enable RX via AF_XDP zero-copy
Thread-Index: AQHXL7HKyqleeMWQYU2lo3HbR6/Cf6qxY5gAgACwS2A=
Date: Tue, 13 Apr 2021 07:58:14 +0000
Message-ID: <DM6PR11MB2780C26D19861F18D789B879CA4F9@DM6PR11MB2780.namprd11.prod.outlook.com>
References: <20210412154130.20742-1-boon.leong.ong@intel.com>
 <20210412154130.20742-7-boon.leong.ong@intel.com>
 <20210412.141916.1569200948681549246.davem@davemloft.net>
In-Reply-To: <20210412.141916.1569200948681549246.davem@davemloft.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: davemloft.net; dkim=none (message not signed)
 header.d=none;davemloft.net; dmarc=none action=none header.from=intel.com;
x-originating-ip: [175.138.41.112]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5132002d-969d-4e30-8c9d-08d8fe51e3e1
x-ms-traffictypediagnostic: DM5PR1101MB2074:
x-microsoft-antispam-prvs: <DM5PR1101MB2074883393FFA2B52BA33AEFCA4F9@DM5PR1101MB2074.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fm4OZIi7/5gZZXhUUsp+Xlp/Y1ZrZdC+kspKpVH8oxL7W6FmXM3RfNrDNZusVV6el9uJd+5W+xzf5LBhLnJ4/V8pA007AgScN96/xSGlAM/NxO0ayOQ9K8eQZGjtjdVZnBqNOEvjKC3/Qd9+hWWzFyJKYqTfVz3vY2VAsCyHGj+gH1RHgeD4R60yelznAhh15Kfz/jfVG1jsgBsBC1NUg2wq24cTrGAn4t/Qyhcvidi/o5uPLPFsdLANUEsYB84udKARbvQt7nMx+KQwqh7uBfp6fd/RlN+AT926p674hTyDxSv/KM0d/2x2v9CsLi68SLmP42e96+5RetQERcNdbVH5JdpecM5vQQGfvNgmbEbr3c8F6DNM3pLzrvhWgz4GPaYkif6TunTew3yJso7+0/4Vg6ZO7ddy9Z6RGeeyrj81c0VpJbIMRbLqVzI9wrQUKo0UpOt68m6BTwBFSlPJifqpnkNsAJ1+q4ElprVLXG7B04hFBhHxWf4MLm0GkToqF2WB0yZ5T4tpkRmfllvQ0gbBkfzBrPD58dO1SYdv0czMAogPDXS+mmdzoypxD9HCt+DBbE931JHUyA4FSk8CAYMN3REJmcFCW3ECHmfuHV8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2780.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(396003)(39860400002)(346002)(366004)(64756008)(66556008)(4744005)(38100700002)(52536014)(66476007)(66446008)(76116006)(4326008)(83380400001)(55016002)(8936002)(316002)(9686003)(86362001)(8676002)(7696005)(71200400001)(54906003)(26005)(6916009)(2906002)(6506007)(66946007)(7416002)(33656002)(186003)(5660300002)(55236004)(122000001)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?81FJSkZs+wmeucPYosEOVu8HoWkEpaBtWmzgZYbaaAkK+K7ZkInVsxYzOhdI?=
 =?us-ascii?Q?u5IKpoP2aYsPXqma74NfCTxF+4Qk+R5CEexverb8HVbRu45wShT5/nQlvKl9?=
 =?us-ascii?Q?3xR+f3wRvRzjLoHUQLVEF1yWxo7DG7+DoOilgPDHLM1Me8xyol6WzBLeLxuk?=
 =?us-ascii?Q?/nWQ7B2gSkJo1IF3auFq0xsufWTcY06VYgylS7sicNd+lJ1PPhvg+eR3OFq7?=
 =?us-ascii?Q?UwpqGvkWvrWyDKtBn8nXW6h4NgFp/ZrYhpzDZ2HoXfZPCShUk8otSJZyJKG2?=
 =?us-ascii?Q?TzFuJbQS/+pxqWRH4+q52lGq2LFKWBDFRBn+paaHAXf/XRQK0QZjw4be2zXW?=
 =?us-ascii?Q?KmkqYeHzHxzbtPPx+sBnh5LFZpMhEAQvbPc26BnFkTPvu3PbZYpzjF+aMia7?=
 =?us-ascii?Q?ht9OSGwwWmNsYlOm5qP9VY7RKCbPlSSj5N0pCaEou41kKy/+Rb622orP+8xt?=
 =?us-ascii?Q?p8msbWh12YJiArcxVptQ5aVVW3xl0nU25UFhwQV60gsBqB1vkdj5o8wB9mKI?=
 =?us-ascii?Q?v2hJ7iQ7uTgcJ8hgLp/PcYGh+8trpofMSKI2HzHH+uVWu5StV963/Zrp/N2F?=
 =?us-ascii?Q?ioa7xmetly7XwmmRe0OOLxUE6R1auO+uyR77ow3sJcczUZrbeXyCGBTVjuXi?=
 =?us-ascii?Q?WPmddfN/+Zcm5UNtw+gnfVENnjWQAr2uVk+plg+4ZIEpI8zaSPOxfwAsMf1R?=
 =?us-ascii?Q?MklV/Tg2u4byo1hSKMDIQrqRbWn8r0I4WMos+26CMsUmsMS3xykVwJgx73PA?=
 =?us-ascii?Q?gixuQIyE3WUV8JrNpfAKelipLXA/uZD8GQPnpstkGKINLnb37tvE4B+QRfNi?=
 =?us-ascii?Q?K/g7wm9tc77QRv1Ea2SLymB+LnfiqdkfiqRhi+SwinH1oSr9WzKjwnWhLp9b?=
 =?us-ascii?Q?eqOquQsbpSTaiScV1DSxRHOExaEAwJlhRiGkH7n/jbeqc4KvV2+lV30Tpbix?=
 =?us-ascii?Q?c2sjIGAhOLqrGGZkGOdnZlqZ20WsOysIptAHM9yE5062Y7V+j0jtWIaX569t?=
 =?us-ascii?Q?D6LyLlwFGq1mssqFC9pQG3bAWy5QqVQXfUt9oioH0211iAmAXSQGura8lcwv?=
 =?us-ascii?Q?6ceugQ17LohnNDDirnSCSnYiJ5mt1JC0M+Z31WRcxXXNa6jmWsaOF3RfEA4o?=
 =?us-ascii?Q?uf66TUOETJoKo2X+izBo5JbbcgH1WSGKnH2p9ZvZuSnmsor8WM6+9AzyDBjp?=
 =?us-ascii?Q?ubXVQr3gXLB1dnsEttooCUN29ZpzW7l2iTgqyHE/UtPeBp/+2O6DpS6uYArN?=
 =?us-ascii?Q?HDIe5SCqqJ3IErPFhBCmkiODyh11FOQVu7TOFxW/pGft9EfAcs7wt4jYRPti?=
 =?us-ascii?Q?q2fj8oFZyS7UypssSXPuBwFP?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2780.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5132002d-969d-4e30-8c9d-08d8fe51e3e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2021 07:58:14.1151 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FoF5Uj/QxAXPQcUJL10AbmPQklWeQoo50SlMXcdDy2CTMZoXBgRyQBni9F/rlf1u4reskOCiZdL3ChzyIOztmRp5E28X4/m822JtV/xiQMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2074
X-OriginatorOrg: intel.com
Cc: "songliubraving@fb.com" <songliubraving@fb.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alexandre.torgue@st.com" <alexandre.torgue@st.com>,
 "daniel@iogearbox.net" <daniel@iogearbox.net>, "yhs@fb.com" <yhs@fb.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "john.fastabend@gmail.com" <john.fastabend@gmail.com>,
 "ast@kernel.org" <ast@kernel.org>, "andrii@kernel.org" <andrii@kernel.org>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "kpsingh@kernel.org" <kpsingh@kernel.org>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "kafai@fb.com" <kafai@fb.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "hawk@kernel.org" <hawk@kernel.org>
Subject: Re: [Linux-stm32] [PATCH net-next 6/7] net: stmmac: Enable RX via
	AF_XDP zero-copy
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

>+	/* synchronize_rcu() needed for pending XDP buffers to drain */
>+	for (queue = 0; queue < rx_queues_cnt; queue++) {
>+		rx_q = &priv->rx_queue[queue];
>+		if (rx_q->xsk_pool) {
>+			synchronize_rcu();
>
>Are you sure this is safe here, especially via the ->ndo_setup_tc() code path?
>
Thanks for the feedback.
Will fix this in v2 by introducing below:

Introduce __stmmac_disable_all_queues() to contain the original code that
does napi_disable() and then make stmmac_setup_tc_block_cb(0 to call this.

Add stmmac_disable_all_queues() to perform synchronize_rcu() if
there is preregistered XSK pool before subsequently call 
__stmmac_disable_all_queues() to perform napi_disable(). 

After this, both stmmac_release() and stmmac_suspend() will use
stmmac_disable_all_queues().

Thx
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
