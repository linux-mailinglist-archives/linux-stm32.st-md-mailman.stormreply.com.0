Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4458FFA56
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2024 06:09:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0EDAC71290;
	Fri,  7 Jun 2024 04:09:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96D97C69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2024 04:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717733389; x=1749269389;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g4FGr0skjJjeoVVkWxZL+M3eUeirPLtwwpce5SgQPzM=;
 b=Rbpg+Vz6uevPDIqV9Rlzt6gtjrQEp3rKwrgxGAkxoqOSAXZeuheQ5JuT
 fRI2skxLoa7X0vEYqzUWxJYIz2+9xe1QOwR2Su/NWaqKz/0RH1g0dUWCe
 bTvj/b6PjW4chuaVeHp47PtbZrvM/akMM7dmrxtV/yicXXRQL+Yw3h2b7
 eotGqYI1h+AXFEHbyhgx6/V1pDcAeVnXzW5CQdxPDN/YDsEstmttLnTCM
 frQ9pfFpWPz6T+wUhGuThmwICQLJ9AF4xRigSotCkljmhvCGZdQ+LaF8m
 seLDlCYjQBLs5aTmfzVNeT5h8aJiMATP/SWm0E9I7qjBInKD2F9+SP6Xe A==;
X-CSE-ConnectionGUID: QeV8UMxVTpqKbTEYmJouxw==
X-CSE-MsgGUID: LMcwx+eTRb2RcUOETSUTVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="39840005"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="39840005"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 21:09:40 -0700
X-CSE-ConnectionGUID: 658yd7r9Sayhdj0CFB4Vfw==
X-CSE-MsgGUID: q1DYkRoMTgWhoXy4gPzfuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="42619704"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 21:09:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 21:09:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 21:09:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 21:09:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 21:09:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxWqe8L2J3VqvgZE2++m+ESOK37cfgM/0RLKYWlXaMwekVbnQO7qUAUl1q7MnGpuiog7dGREEt2Use9MfwUtBa6OknXZvqxCDpNANfMt/SL5lVj3TZAzNCrEhJwCr4SSyFINxIJNZRn13CGGmI+oXVdQSSGdEcMheu/IBo50iSMWK8kVojdg1adbU4RpkHM3c4eVjcBlxKhq+llvOVtNVVz24hSoUxmiToB5HUxHYtCmiDjEbnj9R1H7TqnnmfGOo3ND2VVg4QF9ZuP9FnDz2RhKCbv5TnMEPLlye+yqeb1GE0biYr8wcRnPcvQzB84PIXpSb/W1vXx4qdfVIe3JeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4FGr0skjJjeoVVkWxZL+M3eUeirPLtwwpce5SgQPzM=;
 b=N7RRZB4lIUsEX6iSTSYtE5aYxS+efJT4cyURpalesRiPDzNzMY3Kaujn7nAqHZaWr6KAzxrPIv9Hyggv9JSwAFWiLvJMRnq+GfKiwObi3s0QHCoYCvQGHNqdsdqidK4Becajyyj2yNXZqeyI2T4ICV3XSZgeiTMvee2KbTPM1DexoX2OBWAGODraxDol/4V5E2BFBKhfTUEPmGFRO04RzrhxWZvQMpT/XKU/tePO59OTbEqkmOuCCnjzGYyar+w0+XJ3CtyUqsInuG2WPFdEwenEwRSTrr/HTFT/70g47dchuYYyIVpVxGRgLC8Zm69j3VJ+gP7DXjWG61wayG2ldQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 MW3PR11MB4620.namprd11.prod.outlook.com (2603:10b6:303:54::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.34; Fri, 7 Jun 2024 04:09:37 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%3]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 04:09:37 +0000
From: "Ng, Boon Khai" <boon.khai.ng@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [Enable Designware XGMAC VLAN Stripping Feature v2 1/1] net:
 stmmac: dwxgmac2: Add support for HW-accelerated VLAN Stripping
Thread-Index: AQHasBkLCj07Z540QUGXqLg1tlacPLGrb/8AgAB3OtCAALcdgIACos0AgAA0dwCAB3I7sIABIjSAgAOj/AA=
Date: Fri, 7 Jun 2024 04:09:37 +0000
Message-ID: <DM8PR11MB5751CD3D8EF4DF0B138DEB7FC1FB2@DM8PR11MB5751.namprd11.prod.outlook.com>
References: <20240527093339.30883-1-boon.khai.ng@intel.com>
 <20240527093339.30883-2-boon.khai.ng@intel.com>
 <48176576-e1d2-4c45-967a-91cabb982a21@lunn.ch>
 <DM8PR11MB5751469FAA2B01EB6CEB7B50C1F12@DM8PR11MB5751.namprd11.prod.outlook.com>
 <48673551-cada-4194-865f-bc04c1e19c29@lunn.ch>
 <DM8PR11MB5751194374C75EC5D5889D6AC1F32@DM8PR11MB5751.namprd11.prod.outlook.com>
 <322d8745-7eae-4a68-4606-d9fdb19b4662@linux.intel.com>
 <BL3PR11MB57488DF9B08EACD88D938E2FC1F82@BL3PR11MB5748.namprd11.prod.outlook.com>
 <734c0d46-63f2-457d-85bf-d97159110583@lunn.ch>
In-Reply-To: <734c0d46-63f2-457d-85bf-d97159110583@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|MW3PR11MB4620:EE_
x-ms-office365-filtering-correlation-id: e48e329b-aef0-41e6-b533-08dc86a7a5ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|7416005|1800799015|366007|376005|38070700009; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?hGHeYafBfklSFD8bQ8FxwoNiNE0Trkzw47ldt46+Au9Plj2C2SFGWMrGJQ?=
 =?iso-8859-1?Q?0Smhm7xTgaT4xhWj4IAFiidrsNA7IKeu8fGN5ZNbph2aRbR+QAnsS2ecVV?=
 =?iso-8859-1?Q?7h4YYKnt4yQMpfzJm3HMVTbF3LIZrvcwuYsAoG1JuxKqFJsMlOeeAnfqCN?=
 =?iso-8859-1?Q?HPcOM2UyiD8v3KptnJc90nPtsIn9rKiytVpS1NV91zLpcRr7BSPdNVmuT1?=
 =?iso-8859-1?Q?R/lT0PfIJ9OnvC6Y/3LNOtrqKODBd6ezGa9cnMxx5NxGh8ZnGG9h1Xwzt2?=
 =?iso-8859-1?Q?IY+1uTC5ZRQlZHecXqtIluH3iL4N5fJ8gQqYix/jyrWSD2Qn3T43PKNESa?=
 =?iso-8859-1?Q?shcGP/PixRrP+9o6g8JJZTCv8Ze62a96OCtngOhv1gM3Muv4hevuLCCEtN?=
 =?iso-8859-1?Q?JZ2bSfs7Yz7n0dwY6vsYTt959nl/XyzxmiweVuKb3Usk3L8Zi0z8GF9auj?=
 =?iso-8859-1?Q?AXogQ/l/toR4ccd3CeusVBycMW3vA/mLyqebw/ywo6rgscGg3nJ0iDn7OE?=
 =?iso-8859-1?Q?Une0PtMNuMxIO4pxKYCd8lE3ELJsq/PDsByyYvs5tVYcb3LBG5qZxoWmuz?=
 =?iso-8859-1?Q?ylLJ8ploRISTsZ5QkMRsmN4TsNa7kmQAzAsQuBW1AxjtDPrgZRka+1Nx/d?=
 =?iso-8859-1?Q?WKuVoE6XXcaOlavh7vj4SOcY85uwfHgPl9s3qpdxo8euyovwT3zNPGLs4a?=
 =?iso-8859-1?Q?KI7Xgovf9W0RqEGNa00TW9veABm4xWehaE05VXynwNJKDVsbe3i7VASh3V?=
 =?iso-8859-1?Q?qq+cHqHCddjKsP1wUd6eg8BH0U1S3+pcH5l+DspXjaQ2uzXbieJRbKFgFA?=
 =?iso-8859-1?Q?5lTWAtGNy55N4AaTrTdIIWuZO6Or6qHQ1w/abh5uHd1dZaBRxp4Z6DQCeq?=
 =?iso-8859-1?Q?yVpKDDoO9Jr5mwuMykK9HA/44IwfdjwuhfmE+htfy660U0eyPsSYrR68xV?=
 =?iso-8859-1?Q?u4lJ8P1rShbvCT1v9UWbIlgSWAZXJY6bcRv2/Z+UievMfh4Fhsdmkxk6aQ?=
 =?iso-8859-1?Q?174cih/LMcCpS5zsiUvpK2dEK3OX9aRfFd08tE1eZsXBGyGoVCUeEpoT+O?=
 =?iso-8859-1?Q?+MtYyyRRkcBr8Nu+x8NyroguEAXI6aHHW5dQw4nYwbTfJn7zEPyc4K2Rp2?=
 =?iso-8859-1?Q?/KbrnjxTSWI1Sp/43OMH3c+5cSi0AJCtfC7wMtmUxLHmxLWUO0r2pyBv3E?=
 =?iso-8859-1?Q?PBNEY5MO4tB5122V2zSOTPDIZHdQ0Oq9XlZujDU5slt4MaaIieECbmoO3G?=
 =?iso-8859-1?Q?eq6SbYFtQF+2D+ljSh8IkBBCUsBfxUg14FyIdbzxG8xQUYVEaI+96v0WVc?=
 =?iso-8859-1?Q?uVGkHOjE551CH/zK8xMKx5v5Da0QnTq3+qqKOZHxH1OVoWX6bsqYE5UWRd?=
 =?iso-8859-1?Q?0KNBFmZsDG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(366007)(376005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?wBV/fKJzUOJlXo6McIC+mz9iRCDdOHYdADrsvP4v8lI/cf0dDA+qaSmStz?=
 =?iso-8859-1?Q?zsGaBLt4FuURSL3hCxMZTZhSekmsWkTowxEMX+Sq6K9zTzX/aD0CFixP3Y?=
 =?iso-8859-1?Q?XvLwm84+NFxhfKLfqdFxVFNyOG+fokncb4uTvafOEq94RWVXhaNw5iVWuA?=
 =?iso-8859-1?Q?gBeNtIj/vWr+/vdQbI49rL7W/L/Og6y7T3zMp6eayu8HbIfOQG57gjUjet?=
 =?iso-8859-1?Q?pe5P6rUx9fddWMRhhJZwGN+NOYntuF76Ufl5t2+r7bIW7ikAGMq83f3LkV?=
 =?iso-8859-1?Q?tazmJyS2CRSo6dBDJKZSYlSDVwqIoGcpie1CR0tQPdiTxivTAZ4NIdXDTy?=
 =?iso-8859-1?Q?sOGdJcqtJO8GKlGy/T9SDCiwpaFXEbrj24iMd2/DEWCdAnbmjQ30/HAq5X?=
 =?iso-8859-1?Q?26Y6WkhReON60cI+ePyBwuwb4TXjQd+DH1/T0DBOoXSlGjUizeRLK3gNHz?=
 =?iso-8859-1?Q?6bDdP7pH3qjeZtBUNb3qKdx0HReasAIM+uwFY1jAGzQqYCK1UflSxRTtXD?=
 =?iso-8859-1?Q?pEP4P9SiJ4fYcCptwBsiUub9UklsQnLywNTJPl6Q/A/L42GWC6wwnq+57U?=
 =?iso-8859-1?Q?x1nQhvLa+huB52cY17MIu9i4a5G6HsPYz+PyBEhamA86tqrMel4VBcZefo?=
 =?iso-8859-1?Q?5a6I1FUsufdIbOWaOyEPsoN0R0Kq3XctaId2Qp0zk3fV82pKBCVaVCj07G?=
 =?iso-8859-1?Q?RhI//on0bbtQJMmm0zNPuVm4iyt1cPy8fbcKMbhXGtO0l9DQC8hB0ObL6U?=
 =?iso-8859-1?Q?jl/05Ik0AcGmzwxBHXSsIBIcCgh4ZIKq1E9QcMiT28pB+kyM+8+LROF7ss?=
 =?iso-8859-1?Q?PCC4nMoZJvRFE5ax4sUzSe/BneE7FcVEjf1mo3SoFTuz5kaTH5FEFc1iN9?=
 =?iso-8859-1?Q?ReGBviMAJ9uB7o85ObO3jfH7KfILA6jxcFbiWazijp3gJ0XOhN89Wd/b+S?=
 =?iso-8859-1?Q?Tjmty0mvohzObtKKR5oFieFT7YTz+GFqhILECZgTzUSG5Fx9hLxLs76WJu?=
 =?iso-8859-1?Q?/F+0ck0TvxjPv7kDTa/KhMNVte1cxyuLsQfeTuQeujlSGvnmQnNc8b/BiO?=
 =?iso-8859-1?Q?4Ze8MVWMObYy0AqAlFNHzf4X2g+siL+gKfMc9Nxnyilo5VCcMs8HzcdVRB?=
 =?iso-8859-1?Q?MA6h7gUKmigO81S5ctnw7aLGwkPoNI96lMloQ94TnVkx6GzyksIAuVAzKy?=
 =?iso-8859-1?Q?+CBh9kgK5jDEg9Ws2hKIyOX4p2Eq0kwe9vy6bnBvuUxG+PoS762h7YCFe5?=
 =?iso-8859-1?Q?b7DvXuGgTUGzt/Rq6Ww2ekjSS5tY0u1ccNCEFr9QvUjJwJ0HS3s54wLQwh?=
 =?iso-8859-1?Q?mSv646T13MTZG+1BplwJZglHZlcqa8AZ65IIVFK5MSSpXu6a2Nj3WQSvSD?=
 =?iso-8859-1?Q?XjxeJecnyaMmbEvnvE9b1/dRJBZ6YoZhI1/W4DlA5459klsQX/MqvFq4om?=
 =?iso-8859-1?Q?Wlm29VEj2Eu+KSDvzkstkQk7cVvm7Qp6/zQy8wAWPbDX0+QgkmYiX6FtJH?=
 =?iso-8859-1?Q?A7yWXYx/IF+QKGj3xKk+liKD949cQWAljjd/kT62CZBdL+KYMr5tKOqgok?=
 =?iso-8859-1?Q?dWUgbFSdLz6oSjpT6JaP7T/y0gB3hKT0atM4//Z12+hD9U7C+d07bkdjeS?=
 =?iso-8859-1?Q?VlGiTyFHyvBltSS43T8x3UBL9M8oTwKgiF?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48e329b-aef0-41e6-b533-08dc86a7a5ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 04:09:37.6867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M9xWuZ2rtwiwSI/CB/BUX6v/k2zJ6Lu0d23LScJRQrdhj+8AUBXo22bLSg4wO0Lp8QwpAOCyEU3GkuQAnnk8CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4620
X-OriginatorOrg: intel.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Tham,
 Mun Yew" <mun.yew.tham@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Ang,
 Tien Sung" <tien.sung.ang@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric
 Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, "G Thomas,
 Rohan" <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Looi, Hong Aun" <hong.aun.looi@intel.com>
Subject: Re: [Linux-stm32] [Enable Designware XGMAC VLAN Stripping Feature
 v2 1/1] net: stmmac: dwxgmac2: Add support for HW-accelerated VLAN
 Stripping
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

> 
> Do you have access to all the reference documentation for the IP driven in
> dwmac4_core.c, dwxgmac2_core.c and stmmac_main.c? Is it just VLAN which
> is the same, and everything else is different? Or are other blocks of the
> hardware also identical and the code should be shared?
> If VLAN is all that is identical, then stammc_vlan.c would make sense.

Hi Andrew, I only have access to the document for 
dwmac4_core.c and dwxgmac2_core.c, I notice that in the linux mainline
https://github.com/torvalds/linux/tree/master/drivers/net/ethernet/stmicro/
stmmac

it does have stmmac_est.c and stmmac_ptp.c to that support for both
dwmac4 and dwxgmac2, with that I think it is suitable for introducing
another file called stmmac_vlan?

Regards,
Boon Khai
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
