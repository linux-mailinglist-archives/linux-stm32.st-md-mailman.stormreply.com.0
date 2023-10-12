Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 559487C6769
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Oct 2023 10:11:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAC0CC6B44B;
	Thu, 12 Oct 2023 08:11:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6131CC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 08:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697098268; x=1728634268;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kM9ngilTmso7LkRppPbBkvglB5lltMACbbxipDGJx18=;
 b=XOGrxPv12kLYxPDvsNxYFs2d5dVYyI+/mX+jIpcPq9ygGWEaT7WPeQXU
 BSV3dBOzJHZjacf3ojGMArUSYNSJqDPwl2Rr7BV/3W8YQztq0COCjvP4g
 DQUK6ejFIEQUW2PCNTWUogZqBVyo/pqyboPGwd68dxgFPg6eeWOtymzYN
 n/jhWjVnSZHmkLuPgY7O16p9oghaIVgke1V7uJMRwMW/j8AMhcKZodOOD
 ljcIiXs2PkpvgRQ+BPJvlBVpFhbppvC1mAhmkCi43IXkzV0gqUEzUpPZY
 j9tJf87u05vY5RjZvZlbjvfuhQjY9nSvi7+dBzo4eReHJxo92q3bxeCRq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="388723756"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="388723756"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 01:11:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="747789710"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="747789710"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 01:11:05 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 01:11:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 01:11:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 01:11:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J164TZ1vVqmP0hapKrBGruWKWOJF8cy4r0S24KQ3GEqoIE0AYXJq/ZEYvyGjHqMEfhTSq/DlXiOTMobmAF72F3ACmyCKTC/2NI6kM2J50vDOUgRcjl4DnEzkeEHOpghIF++FzBEKZEWBY79jDzg2l6/Y3L992BDwHJKOL3z1CznwxWiThQ0Io3WrCuaGMRBdbwwVfKbU/9SEi89EXQOg8S+NsTPS91Wyjh0GNSyErnKuBXjBgn8acE0nOWn+WfSVb/I9WIcJq40enkEaA7wX+o+XVQlmcC8/hG/AbiBepLzhvkDa5Y1rcFg2un4rzp6rYKECIVanreXiyYwXk0jC7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GO5ko0BFURQaI3DsAwwMmVlBWlBrO4Rez2L/XvbaIDE=;
 b=BnsnL7As8HuP/npL/5TY4rk/Wa8YRB2D/ysDtmheZhIILXQCBQ25yoEGop5RDxQfNFVPB2vmmlne4GT8ivC5SxCIwwE4/basByqHPH4CJ+ShmsnkXC1L/zE4oZ6f32ESRDML2f/QH2F7RFbVxqHgqOmXtFUVXh6+POJJmXszX66b2QlQC3JDHlQZenskcC8cei9m2EQIxDRhCXGz9IXAJmpq5iOf5GujypLAGNjF5qZNwbIKDpEvoTj9KzowUvvscgtaoBaHBXca//XPckpAe1EerTs5H9YUMdyOpnEDm/BWYT5a/xC0LUwRoGau+gGe2o+7rDPwTNWR+0wkNYljBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3306.namprd11.prod.outlook.com (2603:10b6:5:5c::18) by
 DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.44; Thu, 12 Oct 2023 08:11:03 +0000
Received: from DM6PR11MB3306.namprd11.prod.outlook.com
 ([fe80::9abf:5e6a:2159:4c42]) by DM6PR11MB3306.namprd11.prod.outlook.com
 ([fe80::9abf:5e6a:2159:4c42%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 08:11:03 +0000
From: "Gan, Yi Fang" <yi.fang.gan@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [PATCH net-next 1/1] net: stmmac: Remove redundant checking for
 rx_coalesce_usecs
Thread-Index: AQHZjT6lWJeK0HW3gkKJmtB494k4Xq9nzv+AgN7dkyA=
Date: Thu, 12 Oct 2023 08:11:03 +0000
Message-ID: <DM6PR11MB3306E3CF8E53A53FB14D5378B9D3A@DM6PR11MB3306.namprd11.prod.outlook.com>
References: <20230523061952.204537-1-yi.fang.gan@intel.com>
 <436aced8-f7c4-4ecb-96f9-25ab707e95af@lunn.ch>
In-Reply-To: <436aced8-f7c4-4ecb-96f9-25ab707e95af@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3306:EE_|DS0PR11MB7925:EE_
x-ms-office365-filtering-correlation-id: afb696ac-3c23-418f-1d35-08dbcafac6f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7gkc5ORuh4BIK50Zwnnru6MQU13PC5o/4vmgzRp68fLBvRKxUiIl2jIo0HMz5DXaMuwI2HFsXqsgJWTJhGfF3QoKf/nAYDHLdwtFAgXHsg8nKsNSRnLJ2E7+fQpAndcKiImDkv7B1g0DWVG4JCyfvhJgc/Y+EQu6GjSjIwj1MGQ5t4UxFVgFUEdvC+wR5Navd6tHMvS2ZrG8647fAHVxwC4tL63KliE+uY60hLAlRLBWrBJsVKPKz0XMcU+5ndlSsdYgWA4M9bXNN0kbODxFPD33v/xeKLRc66GF6dEWzMDMr3U4j5RXY3osMPJcnsMgu7dN0WqHjDnjUPFEJpE0qfOuO2TBvNjL4mpuuPx53EaFXNhzUtilqWo9SVb8N+vx+59BC9b2qPObtKRxlfDq1FMHg0ofbsqOMPD+5XDtEPeD7FDO0tzzyQMe61CXqegr+U/auOWpeOWkShvUq1dWoQQVBWSZgho0CYNvWdq8U0wA9MWjxCeeD567tvf3X6cEGvWOB8RL+0behOituR3SN5JSvdHhPokG6i7KAdoASHqpDYyVCwvvWq11fGLP48eoq+hNByf3CP52KW+eAvlWF9AJdEd/2FHE/vF2lhlI2H3kIuuThBL4vJxitvS20qNx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3306.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(346002)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(66946007)(41300700001)(8676002)(8936002)(76116006)(7416002)(4326008)(82960400001)(122000001)(64756008)(54906003)(66446008)(66556008)(66476007)(316002)(478600001)(38070700005)(38100700002)(5660300002)(6916009)(2906002)(52536014)(26005)(86362001)(71200400001)(55016003)(107886003)(53546011)(6506007)(7696005)(83380400001)(33656002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wgp5TsRzXx/+mJkAVyoHcNN8xe9y3TDZehfkS35SdXfN9ZSQNJhPwCkZVDvk?=
 =?us-ascii?Q?wZagASuRFMMJdsIw/EYBAILusEhpnNAi4ljk9GyBFAoYnGAiUhCaojMVJU6J?=
 =?us-ascii?Q?HqJCO6ijdnbhSQYbu1TzHsjE9y3geuQUBJLxfybbzYZTdWrVwVWuQEgcnUft?=
 =?us-ascii?Q?T7quXAG3ouIC47213rSv9rAp1igUS91Y0LaWQ8ITHjpNuhE6XJd53HPEm80u?=
 =?us-ascii?Q?xuyZ8TEp0Jr2LkIHhCckn2v/pQ9p32/twQgKl3eYHd8jCrizvN4VUvs86amu?=
 =?us-ascii?Q?qHXbjKYkFvVxoP6hQWSQz+/J3pJ78J9KQeQXZB2p7zLncu/B0BJ1hVmVNf+H?=
 =?us-ascii?Q?e3kxjGlWBYd25EEzGuQ/dM44H0A7bWNJcwnahFW8nDggdjLkJ2jlFLCGvaRY?=
 =?us-ascii?Q?oQKrsDbTzyhAPzGBHXq4+M5b4tLYGagmyRrcs0oScX5kcwRo6IeWupHvZa+R?=
 =?us-ascii?Q?DPYKDhNVaMoouNkFC5geO9SaAm41wGZX56hPJ/NqjWNsunuXz3V0t/Q5baCu?=
 =?us-ascii?Q?L3ICK/3wA0FS3dLOt2G/hIo6CRXcoOI4a739Rv8u9UBhLvOClA+uigJfDh1A?=
 =?us-ascii?Q?eDvhe6V/kzigO39nbVIloX43KupKNElsZ0lAmRi0v1XB3YGp6f1GeBT64D/q?=
 =?us-ascii?Q?hs1NyX9pjOk3e07JNtfX/vaT0N4AeR3PE064ivi+kL4SG1AnUJBDqGi6b6zA?=
 =?us-ascii?Q?OMlEvO7VUJjnc7Jn0XCys/5HrHKOWbxRjmifPBN0noMC+4UIsAUkZ3c2hs2N?=
 =?us-ascii?Q?T6rVjIIuaUSnJo49MAtgZxszrZr204lmnHivDR5ZVxBjUj64y4mLwHMZhGCZ?=
 =?us-ascii?Q?fpvW86IpZbZC8Ll6bZ/cwsly8mf3m39qrn2PcqFiUrkRJz81HgOSPyDmFvW7?=
 =?us-ascii?Q?TCtCvYPddZcyt8NnFAaC6qIN/zTZktdOKGOxLuJFl3bkESUL9LiEWGmcoESk?=
 =?us-ascii?Q?xXdyXXo6W99DGVpzakjxIhAS7UUIxCSBN8zMqhCk5gGN/Z86tyMSbmYAMOIj?=
 =?us-ascii?Q?kGXCIEOpwRozIoMfWE81dvqCgTMhc7O/uQb0vUD0hB3wT2OL5DBfpbBWst3c?=
 =?us-ascii?Q?fEUIUK1Eyr4J3GFccfO1noWvUzib9N40BlI2l2PjfwIXFC+VL2CMZ5GJZz3x?=
 =?us-ascii?Q?5jLQIhaPP7CN827LxUnw8kHLk/jKI77VnGFmYE4+d6UZo0km8ByyC5nfoJJK?=
 =?us-ascii?Q?ZN1izw825w5oM9JTgAJy4t1Zq802PwqzTobxkcuv3vvf6NKWmkHr/dlRPEhq?=
 =?us-ascii?Q?us6YN6GmESYjPNyEFKOb9+v67YZANdboZ00PbeWzjFP7vlBAlVIn9rtsdg1/?=
 =?us-ascii?Q?39Kyo4NGNTTbfMmKwkVhWvxK4Lz6PgxLRD7x5VU2NkNfLvJAyO7rq27w+XGB?=
 =?us-ascii?Q?bQbpcaWshemFVlz6ANpzE8YijHiquBFVlKXjKhjBmdsCLsOddbFPR61Nax4v?=
 =?us-ascii?Q?mze4Yl1TeeBkoTLtyVMIOEhe6zX+8bTY4yTN6nxLkuE3t6x0QatkRDv9d00N?=
 =?us-ascii?Q?IHKgwvCkneJQzzv230x+qiaz5GWNBuWVCTj6hpRMQFkvFm87LRqbQDZ7g6al?=
 =?us-ascii?Q?tW13lm0vXaSrBKOdRL8Ll1I81UKwrZHhX883BFi1?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3306.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb696ac-3c23-418f-1d35-08dbcafac6f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 08:11:03.1311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1/Mj1nK8MTv5po3pl9mNbMC5xja/sHflhviGBRo6znoo0pxgJgCZoeiYnJm15wR3Qc0Sa7jfLh2Eez1p38CI2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7925
X-OriginatorOrg: intel.com
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "Sit,
 Michael Wei Hong" <michael.wei.hong.sit@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "Looi,
 Hong Aun" <hong.aun.looi@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next 1/1] net: stmmac: Remove
 redundant checking for rx_coalesce_usecs
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

Hi Andrew,

Thank you for your feedback. I will submit V2 to update the commit message.

The value of rx-usecs will not be affected when the tx-usecs is set. When the command "ethtool -C eth24 tx-usecs 42" is applied, the value of rx-usecs is remaining the same as previously.

Best Regards,
Gan Yi Fang

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Tuesday, May 23, 2023 8:48 PM
> To: Gan, Yi Fang <yi.fang.gan@intel.com>
> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>; Alexandre Torgue
> <alexandre.torgue@st.com>; Jose Abreu <joabreu@synopsys.com>; David S .
> Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub
> Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Maxime
> Coquelin <mcoquelin.stm32@gmail.com>; netdev@vger.kernel.org; linux-
> stm32@st-md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; Looi, Hong Aun <hong.aun.looi@intel.com>; Sit,
> Michael Wei Hong <michael.wei.hong.sit@intel.com>
> Subject: Re: [PATCH net-next 1/1] net: stmmac: Remove redundant checking for
> rx_coalesce_usecs
> 
> On Tue, May 23, 2023 at 02:19:52AM -0400, Gan Yi Fang wrote:
> > The datatype of rx_coalesce_usecs is u32, always larger or equal to zero.
> > Previous checking does not include value 0, this patch removes the
> > checking to handle the value 0.
> >
> > Signed-off-by: Gan Yi Fang <yi.fang.gan@intel.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > index 35c8dd92d369..6ed0e683b5e0 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > @@ -917,7 +917,7 @@ static int __stmmac_set_coalesce(struct net_device
> *dev,
> >  	else if (queue >= max_cnt)
> >  		return -EINVAL;
> >
> > -	if (priv->use_riwt && (ec->rx_coalesce_usecs > 0)) {
> > +	if (priv->use_riwt) {
> >  		rx_riwt = stmmac_usec2riwt(ec->rx_coalesce_usecs, priv);
> >
> >  		if ((rx_riwt > MAX_DMA_RIWT) || (rx_riwt <
> MIN_DMA_RIWT))
> 
> This appears to be a user visible ABI change. For the current code, a value of
> zero here is ignored, and 0 is returned. With this change, 0 will result in rx_riwt
> being calculated as 0, which is less than MIN_DMA_RIWT, so you get -EINVAL
> returned.
> 
> I don't know this uAPI too well. What values are passed to this function for:
> 
> ethtool -C eth24 tx-usecs 42
> 
> where you only want to change transmit coalesce? Is rx_usecs 0?
> 
> At minimum you need to explain in the commit message: "This change in
> behaviour making the value of 0 cause an error is not a problem because...."
> 
>     Andrew
> 
> ---
> pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
