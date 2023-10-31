Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 144077DC893
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Oct 2023 09:44:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6907C6B44B;
	Tue, 31 Oct 2023 08:44:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66A78C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Oct 2023 08:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698741871; x=1730277871;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b5Qp8D3q/554yzppPSE4TJdXZ5fsDtxMUvXsg8BviUo=;
 b=JvJPAoI5yYFuVxD+QkT31Z3E4SBQUXVKqkCYsasYLi4aDZsYtAy4EIZi
 EPjQoVrqMb8XEoPfawi9Twk7IlgBxU0/AOrd8I3yLXbIQUMsX2sKocNA1
 CVm+7KygqGb+6NRH8kN4yaFZ5cecaYm2YJy08kuR7JJ2mL4hWi51CsExs
 SrioDQhnhbe/ViwgSPkI4hGvgcj1x32cxb9RzRvHjwTY8d6gZhGgsHqqs
 tTfnMoUWB7O/VS2tXYebC/XQhKbNBqCTSdAoG5ylhHdCvhXYEE3nrWyE7
 LSL8NxuOqFZlG2iTNDClPtvekE+2gss/uMjhhcujfsm3AJnqt55STIK/t Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="373292518"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="373292518"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 01:44:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="764164516"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="764164516"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2023 01:44:26 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 01:44:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 31 Oct 2023 01:44:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 31 Oct 2023 01:44:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOBGYJzreKWuIyg8tzescASetmG2BZx3/t2C6Z0GKGKzOPw2/SK1ZaTLNacmKA6GRqFyGYNKMpupOdrSTEUvCQI74QvmChzzUZastWkFqZZ447hNODWJ5OfI6sPvL+rbqP58CrLzQt/h+DdvNWoWGGYAtNwGpgg+71NYHSQQCHUuNknzeQXzmVUjAhO9f5XDFgtUtTjM6Vv32yNqv8AN+eyVLZDHnSRameK53DcNI4bDcyi5Aq4UQhjICQFdkqZuxQ4FdQ80uPXsEGTdR1flbOjPTbdIE7MSwuXuNQPZVQ4EeTAbq7txGzbz58sZSejgZFZZPPqYEkwsdaAR1P+BtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5Qp8D3q/554yzppPSE4TJdXZ5fsDtxMUvXsg8BviUo=;
 b=OTDKC+OcnhPFUUVAk0CplpTMG19VXByoXfmPXNAlKtO5dnHE0f2twQt55+qFaZpASEjDaE1Dbu95P/0uU75Be8Q+Xh7AAvsTTzjoHix1rQ3hMKqk/zNb5/adozzoAj3VC05KW0Ic0FxlXU3xlkVOOGHwwo/UfGJHelK/+dHnlTqz+xsULHRfqlg+/hqy+cruU/dlvUYMMSSD8OL8756eOrPe5c4wQi7Uk2H3UU5WAMw10IZTk6FWAKpOAlwXlliHI9lrWNIyNzQJHfNE5j7rAuGmiepwAJxak3SqCNqYjD1cL5CgslQx7/POgK9+R9+d2p9ILc4wPKYVqnHSw0bvBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3306.namprd11.prod.outlook.com (2603:10b6:5:5c::18) by
 CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.28; Tue, 31 Oct 2023 08:44:23 +0000
Received: from DM6PR11MB3306.namprd11.prod.outlook.com
 ([fe80::2126:3b64:585d:7da9]) by DM6PR11MB3306.namprd11.prod.outlook.com
 ([fe80::2126:3b64:585d:7da9%7]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 08:44:23 +0000
From: "Gan, Yi Fang" <yi.fang.gan@intel.com>
To: Russell King <linux@armlinux.org.uk>
Thread-Topic: [PATCH net-next 1/1] net: stmmac: add check for advertising
 linkmode request for set-eee
Thread-Index: AQHaCKJwVwif6aPTx0uyiZuY8b+qrrBdP/QAgAZSMzA=
Date: Tue, 31 Oct 2023 08:44:23 +0000
Message-ID: <DM6PR11MB3306A3162F6A6086A4CBA049B9A0A@DM6PR11MB3306.namprd11.prod.outlook.com>
References: <20231027065054.3808352-1-yi.fang.gan@intel.com>
 <ZTtpBCZuB+bjVt9D@shell.armlinux.org.uk>
In-Reply-To: <ZTtpBCZuB+bjVt9D@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3306:EE_|CO1PR11MB5057:EE_
x-ms-office365-filtering-correlation-id: 4937b629-5519-4ec8-2ee3-08dbd9ed9539
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IuarEf2e6QFskCD+uC7K4TRH3N8wBU0YmUAjlugCUAgZvGfUOExEAdunPQHHzJxdfiknZGjulOEHXg5eQwGpcB34uIxiu35/uORMO43CutPjfoT+mGtXjxMsdUfli8816OLZBYriYep+AVtr2/CYGK/fWhubLbcqIo27IP/Lq1VFNI5FdIEb1qo2KCh0yLbLuCqfFVfOG9T4B2vWARltXVUGq/C7jb4aXNezCwZ/mAwLLDqoDadsRelvh4jiglbY26jUqKpgIRiobrHozvwq+le8mqLBihRk6qwVuY2PToqxmVdXS1XQ0HcO9nEmOf4rP5O5j19qm/kqPfS0MUiHhpx/SNvKnUarx1I1XKfPU5Kq1zgV5bLkGkILd0enjobCE6AM9b4Yt8aLwNbPl/1O5Pfq0TRRAHLe/5lC4zCjuhsXg0fTx9IqceL3mTkGfJk4jIa4X0gRrLkDajK8N/CFrsvH82bXCc8k0Cw9uDE2TVHCjrp9n7tGNz+QByL3Qi3lyEN3zz7G51tfrLA5qiq2HQibeL+S7JcarIOknmVbnRynmiQnWiTBZz/PlhokaKg+v8l/NITiWO5l28qVXbZlUZNccDRdxUMz07SNGD20uyQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3306.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(376002)(136003)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(2906002)(86362001)(33656002)(41300700001)(7416002)(8676002)(8936002)(4326008)(52536014)(5660300002)(38070700009)(478600001)(966005)(55016003)(9686003)(122000001)(6506007)(38100700002)(7696005)(71200400001)(53546011)(107886003)(6916009)(316002)(54906003)(64756008)(66556008)(66476007)(66446008)(66946007)(26005)(76116006)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Lr11f5KUEU3bGBG2HCtrQfN4c471UX7X/uq/yRyMNXa7H1/dU8e3ELdP8mas?=
 =?us-ascii?Q?CAk63kgvl3FvfzDHq0KHR3XbKCZmX9c/7xXgoxx8CEeLDRBJtnaoVgttfTUH?=
 =?us-ascii?Q?MbUXxZ5tec4/2Xd2KTsMsOSBilyyFSePwmdSivEtgw5Oz9jTjsH1BpFfVOnW?=
 =?us-ascii?Q?EkXtbVdNrsVGGdaGME8xRD/2D1HIdlyrhPAk19MNkJnF+LLXdAv7EqavZa13?=
 =?us-ascii?Q?NrNQcP9wGcpTQPmHmALutRcur1G6cMvYoKw/j7HSR7dfGn89Rg2oJE6ehdjy?=
 =?us-ascii?Q?1TBw19+L3e+GIdz3QJuyQv+6heZzGv+gYZYEEwQVF5sOENvxPQ18ivSZsivL?=
 =?us-ascii?Q?45XSWuB3HBC2gS4K1igz2xGa1jECcLDS4AXnRRMTW9Pk8wkMMrkJy/1FUC2j?=
 =?us-ascii?Q?AvSyu5qxjYup9SfRPzmcfBgKvoZQL8WIuz9kHLb8zAzuDjsTJJkZwlNVOkol?=
 =?us-ascii?Q?zzByVFjfUfV45LYHXz99Sz6NHRajaCzL0EEA5CjScaAlEXYJgRvaaPiAMNiv?=
 =?us-ascii?Q?yjdrYusmAvruiFQUt2gt16jU2JCDIrBYLhNvbur+ZuPBuXhING+S79BOnlHM?=
 =?us-ascii?Q?IwBga2fjjBd1NBMdDQ3nWLC3IQgTdBweJ8bZLoLJ02UedAEtHsKI9Mnb3dJm?=
 =?us-ascii?Q?NqYEisrHARbgyIkrMj2xvcmGXeEgbuCSKb2rD+Yir0n5NLU7N0D4YR2SMldQ?=
 =?us-ascii?Q?2mfj75H5vhcN7uH+VjpWJ+dsF0Gl16M3JLoyYY1HgcCkFiL4pabEOur6euok?=
 =?us-ascii?Q?Rc/za1JadaRqFKO4WJGQQdcCaQqI7dHkWmxwYiPXaQvNaeiygFGzPoMCCLPd?=
 =?us-ascii?Q?sRCtLs2JjUTQU4wOqPueXyTzASj+s8l2oKi7w37h3Zui+fR0ZSYokwgJC6i0?=
 =?us-ascii?Q?t0bD3fu/NAjjYJPDWA1dODVrqYe/MsVo6tsQZBJ1Lo8roMSbqnZgsQW9rZNx?=
 =?us-ascii?Q?k3bzuRKhFe7suonYxoVll6O3JfOhaJg+rGchQHTDkqEH9lCc9CJ19WBpgvSx?=
 =?us-ascii?Q?pCNCQMabRg42zIA7W3nwhTwMhlt/04zKQFfi+cz8k2i03DfvRPJfi7UrEoc/?=
 =?us-ascii?Q?pNS2OIgwXms7xlES7HOmGvglW1C6qjTO7j6yrazf1lWARGilGEAuPAZJfeC/?=
 =?us-ascii?Q?KVWJ5pMVbLMgDQdJwD8He37qOChXcvdzSK+BIVlNyfDSFDST62y5zVfQTofw?=
 =?us-ascii?Q?LXsBmQAOOBlMJF5r3km1xSL6FoQnsz3x36q0LpAj+GE77/YiySFlrpxyFmif?=
 =?us-ascii?Q?X/rDBWxilre3bE/mIWykRELpUI5IAzUsO6h/VewogXRhE9HXmm+LdehTgYS8?=
 =?us-ascii?Q?UbJpWX14g0GnafiLmoOGz0fVlalB62KHQQS1KwVLVdFckYEQKS8wtsDIu7jQ?=
 =?us-ascii?Q?dqLrr1yZERCfL/HSIZesx+l9EY/cW6c8w9fnv4Jdz3U01TsXLTJu9SKLaaXk?=
 =?us-ascii?Q?vQk6YR+L0DRAqzQE7kHFWGkc3+9/7QkgMielGk65yTumOPe4tsF42CUSIS70?=
 =?us-ascii?Q?qyvIQhGXiKrtK10eQWYk7cyx8zViOqczOrqBPCbjsZCmqTzv7yc+V+LA4Vkt?=
 =?us-ascii?Q?4k+lOH1o9tcr4khCMfr4UqLmXxmrRYa3rA9wqT3i?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3306.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4937b629-5519-4ec8-2ee3-08dbd9ed9539
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2023 08:44:23.7067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3dp81aIfZosGG5sCSwk2P6XK9mmI0Dx+v4lK63x0RDiFbkYjJb/PZLaH+MxDGnMeDQ8Pz4An6lkcshYRpD+fDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5057
X-OriginatorOrg: intel.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Song,
 Yoong Siang" <yoong.siang.song@intel.com>, "Voon,
 Weifeng" <weifeng.voon@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric
 Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Ahmad Tarmizi,
 Noor Azura" <noor.azura.ahmad.tarmizi@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, "Looi, Hong Aun" <hong.aun.looi@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: add check for
 advertising linkmode request for set-eee
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

Hi Russell King,

Why should this functionality be specific to stmmac?
This functionality is not specific to stmmac but other drivers can have their
 own implementation. 
(e.g. https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/qlogic/qede/qede_ethtool.c#L1855)

Why do we need this?
Current implementation will not take any effect if user enters unsupported value but user might
not aware. With this, an error will be prompted if unsupported value is given. 

What is wrong with the checking and masking that phylib is doing?
Nothing wrong with the phylib but there is no error return back to ethtool commands 
if unsupported value is given.

Why should we trust the value in edata->supported provided by the user?
The edata->supported is getting from the current setting and the value is set upon bootup.
Users are not allowed to change it.

Sorry, but no. I see no reason that this should be done, especially not in the stmmac driver.
I understand your reasoning. From your point of view, is this kind of error message/ error handling 
not needed?


Best Regards,
Fang

> -----Original Message-----
> From: Russell King <linux@armlinux.org.uk>
> Sent: Friday, October 27, 2023 3:39 PM
> To: Gan, Yi Fang <yi.fang.gan@intel.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>; Jose Abreu
> <joabreu@synopsys.com>; David S . Miller <davem@davemloft.net>; Eric
> Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo
> Abeni <pabeni@redhat.com>; Maxime Coquelin
> <mcoquelin.stm32@gmail.com>; netdev@vger.kernel.org; linux-stm32@st-
> md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; Looi, Hong Aun <hong.aun.looi@intel.com>; Voon,
> Weifeng <weifeng.voon@intel.com>; Song, Yoong Siang
> <yoong.siang.song@intel.com>; Ahmad Tarmizi, Noor Azura
> <noor.azura.ahmad.tarmizi@intel.com>
> Subject: Re: [PATCH net-next 1/1] net: stmmac: add check for advertising
> linkmode request for set-eee
> 
> On Fri, Oct 27, 2023 at 02:50:54PM +0800, Gan Yi Fang wrote:
> > From: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.com>
> >
> > Add check for advertising linkmode set request with what is currently
> > being supported by PHY before configuring the EEE. Unsupported setting
> > will be rejected and a message will be prompted. No checking is
> > required while setting the EEE to off.
> 
> Why should this functionality be specific to stmmac?
> 
> Why do we need this?
> 
> What is wrong with the checking and masking that phylib is doing?
> 
> Why should we trust the value in edata->supported provided by the user?
> 
> Sorry, but no. I see no reason that this should be done, especially not in the
> stmmac driver.
> 
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
