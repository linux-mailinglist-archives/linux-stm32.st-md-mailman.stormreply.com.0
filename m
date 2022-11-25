Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB65263894D
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Nov 2022 12:58:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EEBBC65E4F;
	Fri, 25 Nov 2022 11:58:44 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EE83C65E46
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Nov 2022 11:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669377522; x=1700913522;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pybNBXXH6jDUqs9zbqn4dUjyCOAnNbydZddYXbQeOME=;
 b=mF1Gd8wvYtz5tF7QTDM/jCA/S1wJOKueWYWI/zQmgdIlkis2yvC58NSl
 TWNCxzno6FjyWQsJCXtwsSTNI81EcPA+zf9EG1VmorrQ6gM+Aq4WGfNNe
 Cpp/Fe3C25jaCfIE9QdZERD5Pb4wP0ALd1UrImHv5Xx0wOvIrjm1Nn39A
 BI0OuuELSEK4qNoWqoE/iZJQZ6+5MtvPablxhsGi+f2Zz36yNPFyY76ag
 3hXxsHUQUMLD0hJl4gzP/H+E//TXvl1h/7U+WdtXa4+FL4YEo7ddY835n
 S8b0j0jMRoZImrjeDgBSDlV30BT6ZXanN1eNRUlKvrz8/xk8tVGPpsQ6v A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="294853427"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; d="scan'208";a="294853427"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 03:58:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10541"; a="817122639"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; d="scan'208";a="817122639"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 25 Nov 2022 03:58:39 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 25 Nov 2022 03:58:38 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 25 Nov 2022 03:58:38 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 25 Nov 2022 03:58:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XU50gjTqY1a35p8i3VvVXac6b25tBZSXLI2k6lVWdicwl5TDIcSANz84FqUaOqRGsMq4JRI1WGP1cQwdL5EIm5kpU1zgD643ircFeT4LwHIZ+X/fnCzvtvTErrVCwUUAASOK5XXHpm1ejCM54Kcc0iUO29ijWsvamBwt3eQAe6vxkgsTOb51erB8kg53//siXEJiJuwqpDnroK0mAp5hI9dUmYqVHiNlDUp+QvKrBx7/+YxASbe/oN9NdtBbxwNynJxhy6bub9aqJkHk3OliF4QwkW2RZXv1WqMFhy3dzRtO4wGVIA+gNV9YgMorw0gKy0rXNNIhbInr/YlTVfMuMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cL6+1L/Hu34pakcDF6W3PEe4RkqwL+TvJYgus6lfV0Y=;
 b=k1MExYdXthabHsA+gvVk/VTPEwacenR331DiL8TptPdzPZZ9Gz7lW5XweR3LELLLaXn6eUphnbeVXZUEIrc4gdL3egoevCs/84dVIad8QaL50Ik0lOnkWaENJTY4/SEPxn+JgRayXYdLZCs98cMQznfBabhIZJLWm3ia4GK85D7mJTOa7TiEIXrS9dJVBX64z792uJb/mnvzsqH3HaxGV5RYpXYGVwMy2DvCsTxehtharffBIWfY3AY6PpLPgKq0PXgFEBnoKAwSk9I+0P+ixDzBfv6RgBvxMkitXlPEIKCelNWyTv072oWpcVRNCCjG05owOLYlDQgd+91skst0NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) by
 SN7PR11MB6776.namprd11.prod.outlook.com (2603:10b6:806:263::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 25 Nov
 2022 11:58:37 +0000
Received: from DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::5f39:1ef:13a5:38b6]) by DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::5f39:1ef:13a5:38b6%6]) with mapi id 15.20.5834.009; Fri, 25 Nov 2022
 11:58:37 +0000
Date: Fri, 25 Nov 2022 12:58:23 +0100
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Message-ID: <Y4Ct37sV+/y9rcly@boxer>
References: <20221125105304.3012153-1-vladimir.oltean@nxp.com>
Content-Disposition: inline
In-Reply-To: <20221125105304.3012153-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: CWLP123CA0212.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:19d::18) To DM4PR11MB6117.namprd11.prod.outlook.com
 (2603:10b6:8:b3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6117:EE_|SN7PR11MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b16850f-7090-4b47-ca27-08dacedc62e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jezgkd3VKaBeq7QGrg5Ov/Tn6+Zj7s1/88Lw5SWQiGKODD3kvf7dM5OR1uVZBWHqilvDAIRghtOIVzU8k8LThafZ6J5Bl44Wh/ukJ3PixtZQ9jVLk4qhKrBJWl1ExHvGxGA9s+IJSbhz0tlmTELkJPEPJG2DuUJVVFq8M6TCMcNmsWVcziZgJqq3y5xSw3S7c0iPRdKcIjuImTQdphgIvBmlTh+P6l8pSVZsN6xHK6xlQEDRznHBVfssRawe8g0AhlED+6SIHmv5X5vWGc+2XrThpe7DulzGe+UJyzn39AN3Ll3+atPtJf7Nl9X4gFkoevQYiAzYfemr27c/I44Olgdi85LlpnJgLNMvOJOv0aOHfsfmoiCW8Z8Tdp4NB0RLgkjiybTHmhgyelA2LxQHajwkyHYpEMskspARSYpeSyiKerZjvU9V/shCE8gFZesYcO40UM9NAvv//DRJiVlzKHaKTRWG+RlD1D93xhqarg+J2yVciMdnTZQ+C1Pgbaj2qjYbdQdF7wePXBpLcAD2PrrAdDhThQNvEAQyPEG/uNSENBb+VH6dMGWmvmIzuxzDths3GO7FtSU/9tSyWhOFt/nTtNfgQ6X6kqOrJyEOcz2Q0DeMzvrtt5E5S3CigTso85/Sq+EYvrNyajnh6ogr69DNcigiFOWpcUaiLcUhcre5ufoS3x2MtaWxhmwi9Sjc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6117.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199015)(82960400001)(83380400001)(8676002)(4326008)(66556008)(33716001)(66946007)(66476007)(38100700002)(316002)(6486002)(478600001)(2906002)(86362001)(54906003)(6916009)(6506007)(5660300002)(9686003)(26005)(6512007)(7416002)(44832011)(6666004)(8936002)(186003)(41300700001)(133343001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0lzbEFDdUwzUk5tY3B2RmkzbXFQL2RqUGlLdmpjVkd6UDkxNnJrSjVQMmNu?=
 =?utf-8?B?QzlCL3huczNXWDczUXY5cEVnbzlOWFBZNElsSk9kamZ2NXEvUlVZbG1WemM0?=
 =?utf-8?B?OTdSZUVMT1gvZXlUS1FsV0lqUi9Md0QvSGVWYkJPRkJkN3NnWXlpZ1g3a1Rw?=
 =?utf-8?B?cGhWbXZLVjJMTlUyN2VuQlFXc3Fsd2x0OW1yeDJKSTZuMXRWblMvTGJRRHYr?=
 =?utf-8?B?V1EycFpiZTdUT0FSbkFVQ1NTY3crZDRGd01IaENPZHZtVGxvdE8xYmN5bXRR?=
 =?utf-8?B?NUJSMWJWck1lRjIxNUh3L0E4UVBJT3BwVGE0SEQzYTZsSEkrT29MUGI4dy9K?=
 =?utf-8?B?bVlQQTM1eFNYeTh3L1B0WW5mVVBtR1U2b2I4c0RNM1JUYnpiVElCdURSNE84?=
 =?utf-8?B?Ty82MnQ5eWZIb09ZNjduMU9ra3dhYUplcHdQcWMwdUtNcUhoZlp5S2gxclBs?=
 =?utf-8?B?dGg1SW5HblFmY1IvSTFjRkk4WDZMVkx6VU5EaG1adERBdHZROTE0SjhyV1h2?=
 =?utf-8?B?S3l0N0pLK2U2Y0hmZTJ3cXl4c243RC93RHZiWTRlaXJySHBDSzYwNXFLckFr?=
 =?utf-8?B?UmVZNlJOVGNEVWtuMGpsenM3M1g2SG1JKytSbG9oLzJjMVFWU25GUmJGbG04?=
 =?utf-8?B?a1g1ZFV5cG9TYW1STlpJd2RJbVVGRnpOWkJrNkRES0ZLb3RUVWQzNS9uT2Jq?=
 =?utf-8?B?TytBVCs4WUdxeE9KR01tWVFwMEhRZDRaZlJ1b09qU2svWWw4YW8rS1AvZlFD?=
 =?utf-8?B?aWcveG9EQUc5WUxNNjdQRVRBQmZ4T3VHUlJMbVRrQmZaeFF0RUFVRkRrdGgr?=
 =?utf-8?B?K2lFNE56USt5ZlBJOGdKREJ3YVJ1UFhURHd2NEg3MmM4aGVDVk5XUE1Nald1?=
 =?utf-8?B?UUQ0eEhIeU5jUHI4RVFXRjBpVnJCY0dnd0lWc0hvdEg4WDlVOEtyVzFoT0Ir?=
 =?utf-8?B?RmZ2ZUFWbFdGUHUrZWkzRVF4bGMwOFBlL1U2Q2N2cFZnUVpGUFh3V2NBOG9x?=
 =?utf-8?B?R1VZR21PSmZWaHFVOFJvZVUyL0RCTkNkTW5Ea29xNzg5NWZPeDBFNW5hTHph?=
 =?utf-8?B?ODlJUyt1cmZvazFWTU5Hc0ZKMU4waWxtTDRMb1BHKzF6R1VtOGU3aHJvSEpu?=
 =?utf-8?B?Y1NDcnd6Mno5SVc1THRMTmxZeWxhcWdkOWxYdm9GbmJiNFlzaDBrdnlONnc3?=
 =?utf-8?B?SjhJMnVhQ1YzeWhyeEMyUkhaUzBkODZFOHNlUm5DUzRXbGQvVmlObngyWk82?=
 =?utf-8?B?ZnZVTGN1amdzODJNamh6Z1hPQTg3QXVHdEhodHlaSmZkTVhpYVZoNWdUVzND?=
 =?utf-8?B?ckN1cXFxektsamF5VEFtaXdyTVRXcStOVTVpWHJKZlgvTzI2dVlxSXRSM1U0?=
 =?utf-8?B?SHlQclZ3dUY1d09PMzZUcFFZdFB0WVp2NVFDTmtyNE56VXFWeWlubVpLTURq?=
 =?utf-8?B?ZytnOHVvdis2QWtITHFiR2xtZk5zNzM3OTVDOHpiWHp3TjRlcHdsaUxTTmNI?=
 =?utf-8?B?dlB0MmVUNkpCc3JrQmlDU3pFc0hEWlZqcmhmNmcyQXVEZnd1YUJodm0zQlR3?=
 =?utf-8?B?Z05mMHJJQTViNUFudU5DSUVDSTgza25nM2xoNHhIb3dGY0lwMDl4cVVHOWJE?=
 =?utf-8?B?emxneXJhSkhGV21DTFZ3RWl0dkRrdEdIZ2RoZHNYb0hHSW04YTh6Rm9ENEZn?=
 =?utf-8?B?QU5lbnhXTTlmY2FPa1R2N3c2QldOTlBaM3JqMGNqbm5Sem1GeHpKODRxcWk3?=
 =?utf-8?B?K0twMUduTVR4dXpxOHlnbGpFNDcwUG1oUkZZSDRmZ0dubnowZWtwaVFDalp2?=
 =?utf-8?B?YXVsZHJhZ0NiQjM2bW54Z2E0QmNHWUQxUUxqR1F1OXlXQjdvc1lKZG9Qd0Vv?=
 =?utf-8?B?TVVvaFBSOVRWbENKd3JyUEZEZGhpNzVTdTZkOWptaFA5Q1Z0d0lGVEtGaTQ3?=
 =?utf-8?B?dUpXTmdnU1hJampWY3d6YXpNL1lPelFlaFJPeDZyR2R3R0VUZ0VDZ2g5VjZV?=
 =?utf-8?B?QllCeDBqMHBoeThpa2FsTkdLQnZ3dEwxcTlvU0phaVZPQThmUE1ocDdCMElT?=
 =?utf-8?B?MmVDYTRHUjFqeUsyNUJOK1NFTEV2L2VZaEZzNXFib3J6dG8xM0UrYXRObUNG?=
 =?utf-8?B?aDhkNnVyc0xoaHR2MitkTXRnT3R0QTkrMmVxQjJvcFEreWd0RU1wT2p6dy9N?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b16850f-7090-4b47-ca27-08dacedc62e0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6117.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 11:58:37.4466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7r1p4WYIBbpE7zBDN4o6w9sTNYPINHxPqjya0fzmanp3BMjNXq2SVquGX7YcySDU2gH0c4UA4//pCgAnEY7VntMyFRu54Z44YvirN19YKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6776
X-OriginatorOrg: intel.com
Cc: Xu Panda <xu.panda@zte.com.cn>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Eric
 Dumazet <edumazet@google.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Giuseppe
 Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Yang Yang <yang.yang29@zte.com>
Subject: Re: [Linux-stm32] [PATCH net-next] Revert "net: stmmac: use
 sysfs_streq() instead of strncmp()"
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gRnJpLCBOb3YgMjUsIDIwMjIgYXQgMTI6NTM6MDRQTSArMDIwMCwgVmxhZGltaXIgT2x0ZWFu
IHdyb3RlOgo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgZjcyY2Q3NmIwNWVhMWNlOTI1ODQ4NGU4MTI3
OTMyZDBlYTkyOGYyMi4KPiBUaGlzIHBhdGNoIGlzIHNvIGJyb2tlbiwgaXQgaHVydHMuIEFwcGFy
ZW50bHkgbm8gb25lIHJldmlld2VkIGl0IGFuZCBpdAo+IHBhc3NlZCB0aGUgYnVpbGQgdGVzdGlu
ZyAoYmVjYXVzZSB0aGUgY29kZSB3YXMgY29tcGlsZWQgb3V0KSwgYnV0IGl0IHdhcwo+IG9idmlv
dXNseSBuZXZlciBjb21waWxlLXRlc3RlZCwgc2luY2UgaXQgcHJvZHVjZXMgdGhlIGZvbGxvd2lu
ZyBidWlsZAo+IGVycm9yLCBkdWUgdG8gYW4gaW5jb21wbGV0ZSBjb252ZXJzaW9uIHdoZXJlIGFu
IGV4dHJhIGFyZ3VtZW50IHdhcyBsZWZ0LAo+IGFsdGhvdWdoIHRoZSBmdW5jdGlvbiBiZWluZyBj
YWxsZWQgd2FzIGxlZnQ6Cj4gCj4gc3RtbWFjX21haW4uYzogSW4gZnVuY3Rpb24g4oCYc3RtbWFj
X2NtZGxpbmVfb3B04oCZOgo+IHN0bW1hY19tYWluLmM6NzU4NjoyODogZXJyb3I6IHRvbyBtYW55
IGFyZ3VtZW50cyB0byBmdW5jdGlvbiDigJhzeXNmc19zdHJlceKAmQo+ICA3NTg2IHwgICAgICAg
ICAgICAgICAgIH0gZWxzZSBpZiAoc3lzZnNfc3RyZXEob3B0LCAicGF1c2U6IiwgNikpIHsKPiAg
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+Cj4gSW4gZmlsZSBp
bmNsdWRlZCBmcm9tIC4uL2luY2x1ZGUvbGludXgvYml0bWFwLmg6MTEsCj4gICAgICAgICAgICAg
ICAgICBmcm9tIC4uL2luY2x1ZGUvbGludXgvY3B1bWFzay5oOjEyLAo+ICAgICAgICAgICAgICAg
ICAgZnJvbSAuLi9pbmNsdWRlL2xpbnV4L3NtcC5oOjEzLAo+ICAgICAgICAgICAgICAgICAgZnJv
bSAuLi9pbmNsdWRlL2xpbnV4L2xvY2tkZXAuaDoxNCwKPiAgICAgICAgICAgICAgICAgIGZyb20g
Li4vaW5jbHVkZS9saW51eC9tdXRleC5oOjE3LAo+ICAgICAgICAgICAgICAgICAgZnJvbSAuLi9p
bmNsdWRlL2xpbnV4L25vdGlmaWVyLmg6MTQsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4uL2lu
Y2x1ZGUvbGludXgvY2xrLmg6MTQsCj4gICAgICAgICAgICAgICAgICBmcm9tIC4uL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmM6MTc6Cj4gLi4vaW5jbHVk
ZS9saW51eC9zdHJpbmcuaDoxODU6MTM6IG5vdGU6IGRlY2xhcmVkIGhlcmUKPiAgIDE4NSB8IGV4
dGVybiBib29sIHN5c2ZzX3N0cmVxKGNvbnN0IGNoYXIgKnMxLCBjb25zdCBjaGFyICpzMik7Cj4g
ICAgICAgfCAgICAgICAgICAgICBefn5+fn5+fn5+fgo+IAo+IFdoYXQncyBldmVuIHdvcnNlIGlz
IHRoYXQgdGhlIHBhdGNoIGlzIGZsYXQgb3V0IHdyb25nLiBUaGUgc3RtbWFjX2NtZGxpbmVfb3B0
KCkKPiBmdW5jdGlvbiBkb2VzIG5vdCBwYXJzZSBzeXNmcyBpbnB1dCwgYnV0IGNtZGxpbmUgaW5w
dXQgc3VjaCBhcwo+ICJzdG1tYWNldGg9dGM6MSxwYXVzZToxIi4gVGhlIHBhdHRlcm4gb2YgdXNp
bmcgc3Ryc2VwKCkgZm9sbG93ZWQgYnkKPiBzdHJuY21wKCkgZm9yIHN1Y2ggc3RyaW5ncyBpcyBu
b3QgdW5pcXVlIHRvIHN0bW1hYywgaXQgY2FuIGFsc28gYmUgZm91bmQKPiBtYWlubHkgaW4gZHJp
dmVycyB1bmRlciBkcml2ZXJzL3ZpZGVvL2ZiZGV2Ly4KPiAKPiBXaXRoIHN0cm5jbXAoInRjOiIs
IDMpLCB0aGUgY29kZSBtYXRjaGVzIG9uIHRoZSAidGM6MSIgdG9rZW4gcHJvcGVybHkuCj4gV2l0
aCBzeXNmc19zdHJlcSgidGM6IiksIGl0IGRvZXNuJ3QuCj4gCj4gRml4ZXM6IGY3MmNkNzZiMDVl
YSAoIm5ldDogc3RtbWFjOiB1c2Ugc3lzZnNfc3RyZXEoKSBpbnN0ZWFkIG9mIHN0cm5jbXAoKSIp
Cj4gU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgT2x0ZWFuIDx2bGFkaW1pci5vbHRlYW5AbnhwLmNv
bT4KCkFoIHRoZSBpbmZhbW91cyBzdHJpbmcgaGFuZGxpbmcgaW4gQy4uLgoKQWNrZWQtYnk6IE1h
Y2llaiBGaWphbGtvd3NraSA8bWFjaWVqLmZpamFsa293c2tpQGludGVsLmNvbT4KCkV2ZW4gd2hl
biB0aGVyZSB3b3VsZCBiZSBubyBidWlsZCBlcnJvciBJIGFncmVlIHRoYXQgd2Ugc2hvdWxkIGhh
dmUga2VwdAp0aGUgY29kZSBhcyBpdCB3YXMuCgo+IC0tLQo+ICAuLi4vbmV0L2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgIHwgMTggKysrKysrKysrLS0tLS0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMg
Yi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCj4gaW5k
ZXggMWE4NmU2NmU0NTYwLi4zYWZmYjdkM2EwMDUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwo+ICsrKyBiL2RyaXZlcnMvbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPiBAQCAtNzU2NSwzMSArNzU2
NSwzMSBAQCBzdGF0aWMgaW50IF9faW5pdCBzdG1tYWNfY21kbGluZV9vcHQoY2hhciAqc3RyKQo+
ICAJaWYgKCFzdHIgfHwgISpzdHIpCj4gIAkJcmV0dXJuIDE7Cj4gIAl3aGlsZSAoKG9wdCA9IHN0
cnNlcCgmc3RyLCAiLCIpKSAhPSBOVUxMKSB7Cj4gLQkJaWYgKHN5c2ZzX3N0cmVxKG9wdCwgImRl
YnVnOiIpKSB7Cj4gKwkJaWYgKCFzdHJuY21wKG9wdCwgImRlYnVnOiIsIDYpKSB7Cj4gIAkJCWlm
IChrc3RydG9pbnQob3B0ICsgNiwgMCwgJmRlYnVnKSkKPiAgCQkJCWdvdG8gZXJyOwo+IC0JCX0g
ZWxzZSBpZiAoc3lzZnNfc3RyZXEob3B0LCAicGh5YWRkcjoiKSkgewo+ICsJCX0gZWxzZSBpZiAo
IXN0cm5jbXAob3B0LCAicGh5YWRkcjoiLCA4KSkgewo+ICAJCQlpZiAoa3N0cnRvaW50KG9wdCAr
IDgsIDAsICZwaHlhZGRyKSkKPiAgCQkJCWdvdG8gZXJyOwo+IC0JCX0gZWxzZSBpZiAoc3lzZnNf
c3RyZXEob3B0LCAiYnVmX3N6OiIpKSB7Cj4gKwkJfSBlbHNlIGlmICghc3RybmNtcChvcHQsICJi
dWZfc3o6IiwgNykpIHsKPiAgCQkJaWYgKGtzdHJ0b2ludChvcHQgKyA3LCAwLCAmYnVmX3N6KSkK
PiAgCQkJCWdvdG8gZXJyOwo+IC0JCX0gZWxzZSBpZiAoc3lzZnNfc3RyZXEob3B0LCAidGM6Iikp
IHsKPiArCQl9IGVsc2UgaWYgKCFzdHJuY21wKG9wdCwgInRjOiIsIDMpKSB7Cj4gIAkJCWlmIChr
c3RydG9pbnQob3B0ICsgMywgMCwgJnRjKSkKPiAgCQkJCWdvdG8gZXJyOwo+IC0JCX0gZWxzZSBp
ZiAoc3lzZnNfc3RyZXEob3B0LCAid2F0Y2hkb2c6IikpIHsKPiArCQl9IGVsc2UgaWYgKCFzdHJu
Y21wKG9wdCwgIndhdGNoZG9nOiIsIDkpKSB7Cj4gIAkJCWlmIChrc3RydG9pbnQob3B0ICsgOSwg
MCwgJndhdGNoZG9nKSkKPiAgCQkJCWdvdG8gZXJyOwo+IC0JCX0gZWxzZSBpZiAoc3lzZnNfc3Ry
ZXEob3B0LCAiZmxvd19jdHJsOiIpKSB7Cj4gKwkJfSBlbHNlIGlmICghc3RybmNtcChvcHQsICJm
bG93X2N0cmw6IiwgMTApKSB7Cj4gIAkJCWlmIChrc3RydG9pbnQob3B0ICsgMTAsIDAsICZmbG93
X2N0cmwpKQo+ICAJCQkJZ290byBlcnI7Cj4gLQkJfSBlbHNlIGlmIChzeXNmc19zdHJlcShvcHQs
ICJwYXVzZToiLCA2KSkgewo+ICsJCX0gZWxzZSBpZiAoIXN0cm5jbXAob3B0LCAicGF1c2U6Iiwg
NikpIHsKPiAgCQkJaWYgKGtzdHJ0b2ludChvcHQgKyA2LCAwLCAmcGF1c2UpKQo+ICAJCQkJZ290
byBlcnI7Cj4gLQkJfSBlbHNlIGlmIChzeXNmc19zdHJlcShvcHQsICJlZWVfdGltZXI6IikpIHsK
PiArCQl9IGVsc2UgaWYgKCFzdHJuY21wKG9wdCwgImVlZV90aW1lcjoiLCAxMCkpIHsKPiAgCQkJ
aWYgKGtzdHJ0b2ludChvcHQgKyAxMCwgMCwgJmVlZV90aW1lcikpCj4gIAkJCQlnb3RvIGVycjsK
PiAtCQl9IGVsc2UgaWYgKHN5c2ZzX3N0cmVxKG9wdCwgImNoYWluX21vZGU6IikpIHsKPiArCQl9
IGVsc2UgaWYgKCFzdHJuY21wKG9wdCwgImNoYWluX21vZGU6IiwgMTEpKSB7Cj4gIAkJCWlmIChr
c3RydG9pbnQob3B0ICsgMTEsIDAsICZjaGFpbl9tb2RlKSkKPiAgCQkJCWdvdG8gZXJyOwo+ICAJ
CX0KPiAtLSAKPiAyLjM0LjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
