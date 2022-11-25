Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E07D7638E3E
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Nov 2022 17:30:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82091C65E45;
	Fri, 25 Nov 2022 16:30:38 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A023C64112
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Nov 2022 16:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669393836; x=1700929836;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=V6DdxqwkZSpX5E8S/ITtE6CMyf3+kf8Qg5WE+7osZzw=;
 b=mTUYnZ4n8mWwpA0iyRkfA6bzYHJAct4WPDQ7tMlRbaynziE6U3syu60L
 wOj4Ow0bpYqgSY/g2KnwxnNj9P8r1BbaQLsHcPoSUhve5HBixB1UR1rl+
 XrWwMsYTnmXERtjY0DphuTR/Dd9+lQrkxnK5/mPBLjIXU7T/PLAXWHWwn
 Hj+p4SftHMNZpjXKtILW7olWMQY1PKa9yMCMm1kinigzEqfG0FnFmldvB
 IgyKwCj//ZlsSvF083VUukxDnOUk+I8/Ri1VnArNkqcYu7ug7f3neUaFl
 LZnRBsL1h3xm4W1rMScHiQ/kZRLMrY1Ku2xnXqgreLZ6l4mB2SIZqqf8u w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="302081111"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; 
 d="scan'208,217";a="302081111"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 08:30:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="784982928"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; 
 d="scan'208,217";a="784982928"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2022 08:30:33 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 25 Nov 2022 08:30:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 25 Nov 2022 08:30:32 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 25 Nov 2022 08:30:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fN5nONcgQ9yZGJ2Sgia0nnMRcai/hhGhQeeyvduozBYITEa1B27VCvmGtIkSwcokNbHK6R/pAF7HM0LD5+ctgNM8NaQfeStK/88AFRfqBBUMrtN+LNL3M+ClN/dCvPb68Lt/e8XBgRiBBCBKNw+8vemkprjuQjzxo0eBJi0eD1o5q0Q6wiO6VxS+eX8B/6oEEOD2yagdtTyE9ZQbCVAVIWEeGPtXo1cZ5COBD5JVPsNL7BQRahMreNzZyAYxtmJ8lABrjv7menew38ldXF2GjxVSrOdYZQtgf22aJGnRwb4SjBgYIAwI6eKmG6jNQFrHapXU1MOVpZ3iAl+ozOfvdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGFzp9EMwtHoOPPxYuTV1SOeFvvSxEz/pWXpJOLiImQ=;
 b=im6Z+Rbks8106cIUcgL/DwX1Y64MeU6NiyhMpaSXBlHK/qBUcTiFs2LccSQr71e7LujfTXibzt+RIakxu+45VAAa33W3fsrIXtECthdlVOLNzXWXubHGnIOW+8tRjsqvsCKZozeba64sHIcjZuQUNiKHHS69o169NlhUKeu1SHbi+ZjZroNPcjn3La4toqkWueCUo4pjAffC0DA+zxQfT+cris622Jb5QhyQ/Ak5nz08Ll0doRUUFt/wX97ERdbm8Z7OizPreT1TKts+xtkerDo3DEQcq55ymQD6C/UCCarDDphzIm8Z3xt8hY1HSqClyAryP8kIfS/13qlfmMKk6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5590.namprd11.prod.outlook.com (2603:10b6:8:32::8) by
 MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.20; Fri, 25 Nov 2022 16:30:30 +0000
Received: from DM8PR11MB5590.namprd11.prod.outlook.com
 ([fe80::3cd8:7b78:42ad:fef6]) by DM8PR11MB5590.namprd11.prod.outlook.com
 ([fe80::3cd8:7b78:42ad:fef6%6]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 16:30:29 +0000
From: "Goh, Wei Sheng" <wei.sheng.goh@intel.com>
To: "Lobakin, Alexandr" <alexandr.lobakin@intel.com>
Thread-Topic: [PATCH net v4] net: stmmac: Set MAC's flow control register to
 reflect current settings
Thread-Index: AQHY/ymhvdEBGqbU9Uuf4VkJqqcsh65P0A+AgAAGpXM=
Date: Fri, 25 Nov 2022 16:30:29 +0000
Message-ID: <DM8PR11MB559093DB8A01B527FF9ACE42A30E9@DM8PR11MB5590.namprd11.prod.outlook.com>
References: <20221123105110.23617-1-wei.sheng.goh@intel.com>
 <20221125160135.83994-1-alexandr.lobakin@intel.com>
In-Reply-To: <20221125160135.83994-1-alexandr.lobakin@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5590:EE_|MW5PR11MB5787:EE_
x-ms-office365-filtering-correlation-id: e52577a6-207b-40dc-8440-08dacf025ddf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XBNmcrZApQPOM102phBDPLM5Tj/ux8x/hY6VddPMDyw0qQK0pQVDwZaygwxpXso7TpaZpo6CifyG/p/s+wAEZLmRRRFS1Q8EJuLci67ah8RbBbsi4GsGUT3MRztlAsfa+G0Qt4soaZEh7Fo1FNXKB4ky4EJVjGm/mYoJfG/rlKihjLX6NL67MRH4ogZo6Av9+EkrBIDTT3LXz5Vx2praGbpwvxezWiNHAzbR8fq82/GVhUHJrOj8rMQOV4v2/8vwmgo2WEbp5HAsWMGUx1li1dgS204JABmilnrVRQZ0Ypw1jK7pdb1QG3JpF4RkTqerctJfN2WFS982vtLVCh58fwaGEGtQWN/V57vqrS6ET0oH4vGgMo8L8V8lPPCuxIb0Mu98ayQmCl+S7sXSNVk7psKAEH6szpfsAyYZx+x6hQUZ5wpwX40jfybAs6pjJOtqyvBheLwyAW/OylaLBby5ChfgJoM52L96JM59UZI13siZVojG0DLQdSGcNQ8/XiPNphh7h+XVCXxksA1nMKoB4Oz9lBsCCi3gfiOGH/J46SL7XTSVnCudnMSOq47J8Oo5mamNWODlzXJO0Inp0zt2eLQXgRjS16fTPZ98zROBp9yCRiTzqVsexxwt++LW6vARcGNSvCuAh81LxVSRJneTd6gLPRbtI7fCmpE/H+E11DkDYCGdS1nmhMMhBApGvIwdIu3oL8Z3xjt6EYDmPMNnnzVTuP1YTtPoA38GnBv4i+o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5590.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199015)(966005)(2906002)(55016003)(33656002)(91956017)(76116006)(83380400001)(478600001)(38070700005)(71200400001)(122000001)(6506007)(7696005)(82960400001)(53546011)(107886003)(38100700002)(40265005)(6636002)(166002)(54906003)(316002)(66476007)(66946007)(66556008)(4326008)(64756008)(9686003)(8676002)(66446008)(41300700001)(86362001)(186003)(5660300002)(8936002)(52536014)(7416002)(6862004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?npMMRW9k8u/c+zoFhSyaq4kDwbuDvGtvv2xRVcWFMyDWUmr6aborx2r/sYno?=
 =?us-ascii?Q?MFYDpm+4AHGnFBN/Dyy9AQnOv+5TFu+RvWktG1rbUfIErC7huP3Nf21/Iitz?=
 =?us-ascii?Q?zHINR/CmQsochNKZjhuCQkRVyq+52YCOXenssk95vOcGYNKh1TnEJPqMzPmW?=
 =?us-ascii?Q?/rR66iqdGDKrLFGwa2YG8niB+Tl695nlfX5UuvpoJ5R+xoRUR1moZYWBFD6M?=
 =?us-ascii?Q?yB4+y7/bSqxkT/RrqroAi8w4rlC6GghkKJCqfoEmCr37nF8ldGD2FroQe01I?=
 =?us-ascii?Q?Vh8yyL6rdT2+WPRguAkLNGr4ZPYbDaYZThWsZSyj2n+lVt52TgvviAs3JZoB?=
 =?us-ascii?Q?h6LfByAmJZb5l1BQ1sB99zTBT2f9bMMWcgCg4DC4BbcgkForjDt29vABShbj?=
 =?us-ascii?Q?KrlYzNBX+02PFJSJuubzO+TceT/FD0TL1kohXGQmiin30NE5yd8YuMq7zuei?=
 =?us-ascii?Q?eNDx8DP6Pe87bdM7G6RAWfF/JKdCp1W6e8KH7QUKIVwCQlJZgqHL53VI+C/t?=
 =?us-ascii?Q?5tPvLEu1U4e4bNvE9XazvZ2nlAA05uFWLVWQFwYwfhMY7hrPoRSm7n8jVnfp?=
 =?us-ascii?Q?8QH/Li/dmyoxPe485+Ywq6wP1in3/1cJndc2nOO21EoNRUu7zsMO5KbtufJB?=
 =?us-ascii?Q?kx9ixUOygRgI5AikwMNd7j3tikjhboZyy8DQGacYpEBOMc0EuHKcNgYc/cUO?=
 =?us-ascii?Q?//qkknhKdnhptlZkAD30QBi5rK5sSRYgxyRxqZK+DhaxoXSEGR2TNSCOkOqG?=
 =?us-ascii?Q?ZUbavRVvb9oMNxu/bA7d/O6Gyewz3Xqtfo3PCiIuaIE1dXc9KJFSYuVfDw04?=
 =?us-ascii?Q?5bQd0o+LbCntHJkwzzocrqnaLURZQ/Qg5CvW75XAbuEwtnav5dj0Qd0W1xa8?=
 =?us-ascii?Q?ZXrDmiEHr4FWECznTbnRE+qpRwwVGG5ouju7bZquEAshSu6TzKtOHVVa45Lw?=
 =?us-ascii?Q?VX120JVG9nxl6D5LwbMOpan4ZydM09bOH6y9gf4ebqO0Kfvh6OfE0F0aLEuR?=
 =?us-ascii?Q?XnBlH3LJwfVzrVXjw+OgNVJYj92umYpxEceL+nMG7rT6MhbntiK565SMEGZm?=
 =?us-ascii?Q?Eqmzfbqx34VtpAt9Jc5gaICotAuehBRwuxmFCdLrfXg4zK70C4pjpBkm0ZV5?=
 =?us-ascii?Q?zOz5avfP1WtD370bptfiHd0mKzvXgjMzhleSzBAJGA7EzmioKY2C2xMSCi4e?=
 =?us-ascii?Q?HevdhZhYq1J4rBqeSjXeaxEvVhLGjUBq2ADNEuC5O7qkSr6JxOQdlSMBTJIw?=
 =?us-ascii?Q?7KS5FGZ/io5so5J9hRwlBkoqCSdR5YmShSnwlCGnnLmfLS23kBFWenJkb8ci?=
 =?us-ascii?Q?PjJbYDo0qc6XuqCUnjLSVA7Yv0/g/EUnbEiVLTLHdyehgTanUe7vFl0zL5tg?=
 =?us-ascii?Q?dhvEWW/AEc5oE31U083pjGi4hh+eGqoCPqrV1qoFupVGa4tj1G9m+ZonNtcw?=
 =?us-ascii?Q?W3e/AuzZPSp9VPWajJHXccU9P/imjXYFEyzgFp8I4KzbiJ9KNKPjdLerb/PF?=
 =?us-ascii?Q?NW2SiUMUhHTl8JiBecApYPEr3WKtpCMTa2xsqGUV3GmF7eQdu0TSxnkjSnS1?=
 =?us-ascii?Q?9EbIEJBG0hLg6iZ++h7yCB+OZRlAj0k64AGKYBx0kfyqF6y1NrRJ1EXRgGo7?=
 =?us-ascii?Q?sPS5o4uN/qMENg2pTz5q8LRmluPQGt1r/V4nWrmLmDryrmYZGBqFWQWqT3Gf?=
 =?us-ascii?Q?k/CClw=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5590.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e52577a6-207b-40dc-8440-08dacf025ddf
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2022 16:30:29.7535 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FIKZcicdrBZRZ6dqUCdM5hrMeCQwRy9g2nYreSQO9SPbLmt8GNuPYd5VTz3sp8ODSjVNsaFT2p+vkd5e1/5ZsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
X-OriginatorOrg: intel.com
Cc: Alexandre Torgue <alexandre.torgue@st.com>, "Voon,
 Weifeng" <weifeng.voon@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Tan,
 Tee Min" <tee.min.tan@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose
 Abreu <joabreu@synopsys.com>, "Lobakin, Alexandr" <alexandr.lobakin@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "Ong, Boon Leong" <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "Looi,
 Hong Aun" <hong.aun.looi@intel.com>, Paolo
 Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Ahmad Tarmizi, Noor Azura" <noor.azura.ahmad.tarmizi@intel.com>
Subject: Re: [Linux-stm32] [PATCH net v4] net: stmmac: Set MAC's flow
 control register to reflect current settings
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
Content-Type: multipart/mixed; boundary="===============5654439931726621349=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============5654439931726621349==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_DM8PR11MB559093DB8A01B527FF9ACE42A30E9DM8PR11MB5590namp_"

--_000_DM8PR11MB559093DB8A01B527FF9ACE42A30E9DM8PR11MB5590namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi there,

I would like to apologize for this.
Due to some mistake, I had resubmitted v4 at the same day before you review=
 it.
I am working on v5 based on your review.
Very sorry for the confusion and appreciate your review.

Thanks & Best Regards,
Wei Sheng
________________________________
From: Lobakin, Alexandr <alexandr.lobakin@intel.com>
Sent: Saturday, November 26, 2022 00:02
To: Goh, Wei Sheng <wei.sheng.goh@intel.com>
Cc: Lobakin, Alexandr <alexandr.lobakin@intel.com>; Giuseppe Cavallaro <pep=
pe.cavallaro@st.com>; Alexandre Torgue <alexandre.torgue@st.com>; Jose Abre=
u <joabreu@synopsys.com>; David S . Miller <davem@davemloft.net>; Eric Duma=
zet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni <p=
abeni@redhat.com>; Maxime Coquelin <mcoquelin.stm32@gmail.com>; netdev@vger=
.kernel.org <netdev@vger.kernel.org>; linux-stm32@st-md-mailman.stormreply.=
com <linux-stm32@st-md-mailman.stormreply.com>; linux-arm-kernel@lists.infr=
adead.org <linux-arm-kernel@lists.infradead.org>; linux-kernel@vger.kernel.=
org <linux-kernel@vger.kernel.org>; Alexandre Torgue <alexandre.torgue@foss=
.st.com>; Ong, Boon Leong <boon.leong.ong@intel.com>; Voon, Weifeng <weifen=
g.voon@intel.com>; Tan, Tee Min <tee.min.tan@intel.com>; Ahmad Tarmizi, Noo=
r Azura <noor.azura.ahmad.tarmizi@intel.com>; Looi, Hong Aun <hong.aun.looi=
@intel.com>
Subject: Re: [PATCH net v4] net: stmmac: Set MAC's flow control register to=
 reflect current settings

From: "Goh, Wei Sheng" <wei.sheng.goh@intel.com>
Date: Wed, 23 Nov 2022 18:51:10 +0800

> Currently, pause frame register GMAC_RX_FLOW_CTRL_RFE is not updated
> correctly when 'ethtool -A <IFACE> autoneg off rx off tx off' command
> is issued. This fix ensures the flow control change is reflected directly
> in the GMAC_RX_FLOW_CTRL_RFE register.

Any particular reason why you completely ignored by review comments
to the v3[0]? I'd like to see them fixed or at least replied.

>
> Fixes: 46f69ded988d ("net: stmmac: Use resolved link config in mac_link_u=
p()")
> Cc: <stable@vger.kernel.org> # 5.10.x
> Signed-off-by: Goh, Wei Sheng <wei.sheng.goh@intel.com>
> Signed-off-by: Noor Azura Ahmad Tarmizi <noor.azura.ahmad.tarmizi@intel.c=
om>
> ---
> V3 -> V4: Fix commit message and incorrect insertions(+) value
> V2 -> V3: Removed value assign for 'flow' in else statement based on revi=
ew comments
> V1 -> V2: Removed needless condition based on review comments
>
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c |  2 ++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 ++++++++++--
>  2 files changed, 12 insertions(+), 2 deletions(-)

[...]

> --
> 2.17.1

[0] https://lore.kernel.org/netdev/20221123180947.488302-1-alexandr.lobakin=
@intel.com

Thanks,
Olek

--_000_DM8PR11MB559093DB8A01B527FF9ACE42A30E9DM8PR11MB5590namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<div dir=3D"ltr">
<div></div>
<div>
<div dir=3D"ltr">Hi there,</div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">I would like to apol<span>ogize for this.</span><span></sp=
an></div>
<div dir=3D"ltr"><span>Due to some mistake, I had resubmitted v4 at the sam=
e day before you review it.</span></div>
<div dir=3D"ltr"><span>I am working on v5 based on your review.</span></div=
>
<div dir=3D"ltr">Very sorry for the&nbsp;<span>confusion and appre<span>cia=
te your review.</span></span></div>
<div dir=3D"ltr"><br>
</div>
<div dir=3D"ltr">Thanks &amp; Best Regards,</div>
<div dir=3D"ltr">Wei Sheng</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"ltr">
<div></div>
</div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif"><b=
>From:</b> Lobakin, Alexandr &lt;alexandr.lobakin@intel.com&gt;<br>
<b>Sent:</b> Saturday, November 26, 2022 00:02<br>
<b>To:</b> Goh, Wei Sheng &lt;wei.sheng.goh@intel.com&gt;<br>
<b>Cc:</b> Lobakin, Alexandr &lt;alexandr.lobakin@intel.com&gt;; Giuseppe C=
avallaro &lt;peppe.cavallaro@st.com&gt;; Alexandre Torgue &lt;alexandre.tor=
gue@st.com&gt;; Jose Abreu &lt;joabreu@synopsys.com&gt;; David S . Miller &=
lt;davem@davemloft.net&gt;; Eric Dumazet &lt;edumazet@google.com&gt;;
 Jakub Kicinski &lt;kuba@kernel.org&gt;; Paolo Abeni &lt;pabeni@redhat.com&=
gt;; Maxime Coquelin &lt;mcoquelin.stm32@gmail.com&gt;; netdev@vger.kernel.=
org &lt;netdev@vger.kernel.org&gt;; linux-stm32@st-md-mailman.stormreply.co=
m &lt;linux-stm32@st-md-mailman.stormreply.com&gt;; linux-arm-kernel@lists.=
infradead.org
 &lt;linux-arm-kernel@lists.infradead.org&gt;; linux-kernel@vger.kernel.org=
 &lt;linux-kernel@vger.kernel.org&gt;; Alexandre Torgue &lt;alexandre.torgu=
e@foss.st.com&gt;; Ong, Boon Leong &lt;boon.leong.ong@intel.com&gt;; Voon, =
Weifeng &lt;weifeng.voon@intel.com&gt;; Tan, Tee Min &lt;tee.min.tan@intel.=
com&gt;;
 Ahmad Tarmizi, Noor Azura &lt;noor.azura.ahmad.tarmizi@intel.com&gt;; Looi=
, Hong Aun &lt;hong.aun.looi@intel.com&gt;<br>
<b>Subject:</b> Re: [PATCH net v4] net: stmmac: Set MAC's flow control regi=
ster to reflect current settings
<div>&nbsp;</div>
</font></div>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: &quot;Goh, Wei Sheng&quot; &lt;wei.sheng.goh=
@intel.com&gt;<br>
Date: Wed, 23 Nov 2022 18:51:10 +0800<br>
<br>
&gt; Currently, pause frame register GMAC_RX_FLOW_CTRL_RFE is not updated<b=
r>
&gt; correctly when 'ethtool -A &lt;IFACE&gt; autoneg off rx off tx off' co=
mmand<br>
&gt; is issued. This fix ensures the flow control change is reflected direc=
tly<br>
&gt; in the GMAC_RX_FLOW_CTRL_RFE register.<br>
<br>
Any particular reason why you completely ignored by review comments<br>
to the v3[0]? I'd like to see them fixed or at least replied.<br>
<br>
&gt; <br>
&gt; Fixes: 46f69ded988d (&quot;net: stmmac: Use resolved link config in ma=
c_link_up()&quot;)<br>
&gt; Cc: &lt;stable@vger.kernel.org&gt; # 5.10.x<br>
&gt; Signed-off-by: Goh, Wei Sheng &lt;wei.sheng.goh@intel.com&gt;<br>
&gt; Signed-off-by: Noor Azura Ahmad Tarmizi &lt;noor.azura.ahmad.tarmizi@i=
ntel.com&gt;<br>
&gt; ---<br>
&gt; V3 -&gt; V4: Fix commit message and incorrect insertions(+) value<br>
&gt; V2 -&gt; V3: Removed value assign for 'flow' in else statement based o=
n review comments<br>
&gt; V1 -&gt; V2: Removed needless condition based on review comments<br>
&gt; <br>
&gt;&nbsp; drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c |&nbsp; 2 ++<b=
r>
&gt;&nbsp; drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 +++++++++=
+--<br>
&gt;&nbsp; 2 files changed, 12 insertions(+), 2 deletions(-)<br>
<br>
[...]<br>
<br>
&gt; -- <br>
&gt; 2.17.1<br>
<br>
[0] <a href=3D"https://lore.kernel.org/netdev/20221123180947.488302-1-alexa=
ndr.lobakin@intel.com">
https://lore.kernel.org/netdev/20221123180947.488302-1-alexandr.lobakin@int=
el.com</a><br>
<br>
Thanks,<br>
Olek<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_DM8PR11MB559093DB8A01B527FF9ACE42A30E9DM8PR11MB5590namp_--

--===============5654439931726621349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5654439931726621349==--
