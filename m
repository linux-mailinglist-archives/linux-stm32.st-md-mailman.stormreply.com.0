Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C6476CC37
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Aug 2023 14:02:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7363AC6A5FA;
	Wed,  2 Aug 2023 12:02:29 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA97CC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Aug 2023 14:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690898454; x=1722434454;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I7NnYXrglZJTjYpKeXbezqsYzyxBWg7pjctLcZOLsOU=;
 b=N+yXvLeOLLKKEjrcw+GWSOJtuB1+Pvz0qvhtFs5qkRXcwLV6dYmxtdAv
 rL2o5Ei3BWjvDsWp2g8UYe12/bQeINwo/EwXneeXHKrMgbeLjAFSgIIi6
 5bTNfB+BavkKpb89+6+6xi0Bie6QH/0ug5NPOSp9dALnZTE9iPEBzIS7r
 ZioeM4NZNuPsfouTfbRg1ijlxn3WT7jqexcTLjz90uvzSS/Bu6AOt3Hgf
 CRabg0HQqQU2/H7uFM+rJP3yn7mJpL1HKnCOmj/md58nFZ+1XCklK+LwR
 Qhpc1CnznGV0kybtUghRu97fxcLBl6iCaLPCiMqO2nNyXJpwojLh0fC2w Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="372016708"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="372016708"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 07:00:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="794195720"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; d="scan'208";a="794195720"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 01 Aug 2023 07:00:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 07:00:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 1 Aug 2023 07:00:45 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 1 Aug 2023 07:00:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIAW3bjQL/JVYgVlo6UDk0xFnVa38Y7ij2V4TK0ES9hZalubtGiXpmljR0DFPu2vPSgMqn51ojYJa+kF/kKrcwXC/zLwAXeStmNMqiPZ0UPXS6gYQ9yhdCI8jPIJFYEwgO+fHWP4sNs7Jm6s+Ad3Vs2WqreFH4iPmjJxexgtmWHWlqJXi+VkAlwGUqYN9N5zR/mKwrEvCd6BlblRmCR9oR6m+X+7R7EMnII9y8nZleyxGDEWzkijdifo7iZIeeh94dPndQ4gdVKNj0D5Fq/mkIsggPBlyYoX/obVUe1Fu8pCDOZgVLBNSK7ZNrjYOjqb9Lf/gHqOGYfVX6SLfxzMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8zL6Cnty2q0fbIBJUtrhbm13vfz3Zl0f9C4tjAWOZo=;
 b=cWeXEE/D3CEpiuMheanDbwOPWN4M7eGZ1VnOYpcMlK/Sh5tLzPNlTHeefXSaq1L38eS3K0EpNuWn/PyN9CiY49EtXal/9T4hX6xPy/aopYCFt4KvSr1slOkfHrW0TyrvuBTP6Bfuo1vxssvYx51qtMpCHCLfc3GJC3h5uSmMiLpnA9DSNEwxmyorEktxPgoTk+ven6dp73IYV23/FNl+rk6JJDXPipHpfn6MKaZHsmzxlRAQWZDbNefAyYF+Gh2F+SCRyJrfJ1B9hh0++Pr2RKBTnbEdj1WVqjb0LqZRCZxEZxRE6I8UGRa+YtL603Vp1I0VqP7JQKzYIi46dym/TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3625.namprd11.prod.outlook.com (2603:10b6:5:13a::21)
 by CY8PR11MB7338.namprd11.prod.outlook.com (2603:10b6:930:9e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 14:00:40 +0000
Received: from DM6PR11MB3625.namprd11.prod.outlook.com
 ([fe80::44ff:6a5:9aa4:124a]) by DM6PR11MB3625.namprd11.prod.outlook.com
 ([fe80::44ff:6a5:9aa4:124a%7]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 14:00:39 +0000
Message-ID: <903d9329-c157-b48b-4f80-82b997efcc2a@intel.com>
Date: Tue, 1 Aug 2023 15:58:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Alexander Lobakin <aleksander.lobakin@intel.com>
To: Ratheesh Kannoth <rkannoth@marvell.com>
References: <20230728232215.2071351-1-rkannoth@marvell.com>
Content-Language: en-US
In-Reply-To: <20230728232215.2071351-1-rkannoth@marvell.com>
X-ClientProxiedBy: FRYP281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::21)
 To DM6PR11MB3625.namprd11.prod.outlook.com
 (2603:10b6:5:13a::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3625:EE_|CY8PR11MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ab67e7a-c808-42cc-3c6e-08db9297b00a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6JHgG9NEvwTeXYcPzlhLhfmWuScZDOw3ixPS6VSW+hTy6jF1Wysc28cnJWy7ilLy8B/DuEFhaX5P3EkIlikjzwRw01F5FppZqlEBK5+NpCNp1kX4Zmzkxyx4+FZQpC5rSa/80uou3OIJwtv2YOKSACSrJAhIjxXP+5GMzX+JLeo95gqgEMZBdGNi+3oz5R9SGj63IRvKqUeWgSR87jpBtBrqe/Q3Nebr/z60zm7U3eW7nNThV8obTgv6FSMiKtj2JOoOHQDJYaqmIjEISccOQCH9CnBQTUXU0g0MZkpSytZ94Y/I9RAS39H37RcvR6UoZ/7TuYvkbm1l16wlBR9J/uqNnG4vSQLpNghZ2XeuF1GzRpqpGkZcGLlMLlGvkAvM0Qo7o5K75pHe/eocOFy3PtBnx+UiNrrAZTLzmHG3qHxg8gdDe/M488llFJscUnaG8DdT162O/4fOdS1YSe1956AvsmJ+eFBXKh/IJ1aBQ6qTavvkOThuLFk00xOWO3rFh2dn9E4s4fpkirf/0tuGQUbTqsDQXGMhudU+AcX0TS90eZTpxFl5wl+MqnCAlrty/KxN9YKPrFuvq7Fp02dkDne779WEj/BCg46MY+0YeGhUSCiK+3hF3qNp6c99mMUcP72JsZF3s1kKmO7BZ6RawQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3625.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(82960400001)(6512007)(966005)(26005)(6506007)(6486002)(36756003)(8936002)(6666004)(8676002)(5660300002)(66556008)(66946007)(66476007)(6916009)(4326008)(2906002)(4744005)(2616005)(41300700001)(478600001)(31686004)(86362001)(31696002)(186003)(7406005)(7366002)(7416002)(38100700002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEcySWZRYUYvVlZpS3hWRS9JNHpZa0FqSHJRTDQwT2NsZ1ROTUxMd1ZCcTRi?=
 =?utf-8?B?aG9aaHZucXZ3REhObkRBNStlTHRPTnJuaEZnNnFobDQ5OVV2djFueks3NW8r?=
 =?utf-8?B?Tm00MTRSekxCdTNHWTNtb20vMkFuYzM1a2ZKZzM3cFVZa0hJWTdwYzMveUFK?=
 =?utf-8?B?UDlNbUlyNEt6WUFEc1dyMERyY1VhZk9sKzA2L1JodUFaaXpKZDNvUWZRN1hP?=
 =?utf-8?B?azdRV3JrWThzaEVYMVd0czQxUm9iZ1hzaDVMeXV2d1NjZjF5SEN0K3FYeTd2?=
 =?utf-8?B?ZnlXcGVVSmRseEV4VmNnNk5iMWE1S3JwZHVuc0FseTJ2YnN1QzlQUGllQlo2?=
 =?utf-8?B?WnJiNVA4aENySUJTSkVhejRsUXpUSnJkK04yU2ZHUjdMMEZkNUxrTU1mOG5Z?=
 =?utf-8?B?TmsxSmdRQUlDdFl6K1p1VnFmZUMyL0p1Z2hzWUpwOElDOG4rZ2ZYclJ2OVRE?=
 =?utf-8?B?elg3MVdrUGVnNmZTV3FRTjNOelpnTXI0ZGlaeDNwdnRUWmtnTFVVN09aWStN?=
 =?utf-8?B?ZE5YSy9IZ1NxYlFlUEJRNnZKUnpEdkt1cGI0cFRPVFl2STFSOW5Vd1dwRW00?=
 =?utf-8?B?S1pFbGk3UExCcmZrSTR3LzJwMEZ5TmQ3QVdTRno3aHAyT0tJbU85QklNclhq?=
 =?utf-8?B?cTNhcXpTR3FpdXdHR3U0SWRtc3hoSG91OUQ0d3lCWm5LV00xWlVhbGZtWmU1?=
 =?utf-8?B?aEF5RjBIYW1XM29aMTNnU0hWSGE3NnM5K0duVGRUNnlFZksyU0IrSkp5TnNT?=
 =?utf-8?B?N084Vy9NOVR6ajFGV1UzVTFQY0hiTXRzWjJOWlVvODFrVVhXVDlHSERjTi9D?=
 =?utf-8?B?bmJVWFlYS3Qxc2tzVmU5aXR4SkhmZWQ3WHNjZlpCM2xRUEo2dHlOR3N4QkJD?=
 =?utf-8?B?V3BoSitUOXhQbXc4REttV3JDQmx6eFFES2p6RGM4N0Y0MVRrYTlKUGhrTExL?=
 =?utf-8?B?UGoxMU1rTVZPVkt4MHU4UlcvTWFZTmxWaXplRk5qSjdUZnJXS2RuVUs5Z1pB?=
 =?utf-8?B?a0lCYTIrLyswaUJSRVZTQ0ZuY0o0Q0JhMjBIdmdXVERRNFRkVzl6RzA2dm1F?=
 =?utf-8?B?TU5SdHpvSEpFSE41WHcwMXhVWHE3TUxtSEY2c2lkOUJ5alpmQ3ZnU1llRERK?=
 =?utf-8?B?MTc0S3k1NjU1Qm0rcEF4ZEp0b25sZHc3cFBDSGo0OGJXT1hZT2VUYXY1S042?=
 =?utf-8?B?SVlCOEUxOFpXWGpkRUNGSjNGMlVGa3pSeUVzRyt4YnFncVBoeGk2NFNaTGZJ?=
 =?utf-8?B?eWVCV2xTTlRwelFGdXhNWGo0V2RQQno1U0VUWnNvSjFTRVNXdllMNE1PQ1M3?=
 =?utf-8?B?Zk1CQXJYVnlWZ3hpWWFaSjF5ZXlGWEs2WDdlaVBDNzNzdXpzRkgwZ0JOeEJa?=
 =?utf-8?B?WitxeGxZa3Q4QlYwelc5UlBPWHhJM1RNSDNTY0NBdjhUSDBQUGJIOVlWUk1E?=
 =?utf-8?B?TTFMMUt1ZUtKTk1jT2V2SE54Y2ovd3V2bkVXN3Y3WHNpZnJGNzlCK29UVEtX?=
 =?utf-8?B?Y0NvdjNVcC9ieW02UUkyaXFzN3JLcXNneDlaMFNIWHBtM0VlTE9nNjhTaFpG?=
 =?utf-8?B?aG5sZDZwSFlqK3I4N29xZE5YY3E5Sm1QdXpBUG1EbU5nREJWSER5WnI0OFQz?=
 =?utf-8?B?cWR5TU9QQXFCM1cvOHhWSE12YWIwdE5LWTFDVGJpemJLdmdSeGxHU3ZqQWxD?=
 =?utf-8?B?RVJhNWtpRmszcFJjRGI5a3pWSXpGU0dxZmljMGY0ZFVaUnpuV1RXY1VYK1hv?=
 =?utf-8?B?WG15aXdrUmlEdGVhKytJYThYVXE5REZBb2J0S0xPM2Jvb2lFM1BFWmNSZUtG?=
 =?utf-8?B?M2ZscmpVUks2eklWM1FwNUJLV1VKKy9Bc2xYdEtrZ25ZSCsxdGhMYk56REli?=
 =?utf-8?B?YkVqaTlKRzRNTmZhd2lUU2Jack9oNWRqbTVjSUtrWjIxdlZVdGdTMW5WeEVn?=
 =?utf-8?B?Q0pkdEVSQmt4QzAxNjUwdG80T1NIVFlRK1V0dXRHcXBRMUs1WWlBQlpDdVF4?=
 =?utf-8?B?K0xwNTZCZktxQ2kyV1FpRExyOUJlNHhPZnBZc2s2R0xyelN6OC8xOFh2Q1hF?=
 =?utf-8?B?bkF2SHdqNzR6ZFAyN1Byd2xKL3hSTHpid28rZVBUdmJRY1BZUUl0eXFzcXJj?=
 =?utf-8?B?ZHZCT2NDM2lRNm03eEdtbGpxalY2ci9BU0UvNEcyQ1E4eUFLdzBJMWkrejNz?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab67e7a-c808-42cc-3c6e-08db9297b00a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 14:00:39.7336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfbP3AwsXDf5hW1XairtEJ7Vc1hGkNMKbmR0KNDoFXRdHXifG32WxajZ8udDpNC/lm9No6TEbSVXVnLX+6jsQGcQYqmhr/BV9Z5spA5PBrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7338
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Wed, 02 Aug 2023 12:02:28 +0000
Cc: taras.chornyi@plvision.eu, andrew@lunn.ch, alexandre.belloni@bootlin.com,
 vladimir.oltean@nxp.com, jdamato@fastly.com, kurt@linutronix.de,
 edumazet@google.com, davem@davemloft.net, anthony.l.nguyen@intel.com,
 ioana.ciornei@nxp.com, gerhard@engleder-embedded.com, kadlec@netfilter.org,
 horatiu.vultur@microchip.com, lanhao@huawei.com, louis.peens@corigine.com,
 f.fainelli@gmail.com, leon@kernel.org, ecree.xilinx@gmail.com,
 linux-net-drivers@amd.com, Steen.Hegelund@microchip.com, shenjian15@huawei.com,
 jesse.brandeburg@intel.com, linux-stm32@st-md-mailman.stormreply.com,
 joabreu@synopsys.com, intel-wired-lan@lists.osuosl.org,
 lars.povlsen@microchip.com, simon.horman@corigine.com, kuba@kernel.org,
 d-tatianin@yandex-team.ru, pabeni@redhat.com, yisen.zhuang@huawei.com,
 pablo@netfilter.org, petrm@nvidia.com, grygorii.strashko@ti.com,
 aelior@marvell.com, daniel.machon@microchip.com, idosch@nvidia.com,
 rajur@chelsio.com, claudiu.manoil@nxp.com, coreteam@netfilter.org,
 habetsm.xilinx@gmail.com, hui.zhou@corigine.com, peppe.cavallaro@st.com,
 michael.chan@broadcom.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, huangguangbin2@huawei.com,
 salil.mehta@huawei.com, wentao.jia@corigine.com, manishc@marvell.com,
 netdev@vger.kernel.org, oss-drivers@corigine.com, fw@strlen.de,
 linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com,
 linux-rdma@vger.kernel.org, netfilter-devel@vger.kernel.org,
 shmulik.ladkani@gmail.com, mcoquelin.stm32@gmail.com,
 wenjuan.geng@corigine.com, olteanv@gmail.com, zdoychev@maxlinear.com,
 saeedm@nvidia.com
Subject: Re: [Linux-stm32] [Intel-wired-lan] [PATCH v3 net-next] net:
 flow_dissector: Use 64bits for used_keys
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

From: Ratheesh Kannoth <rkannoth@marvell.com>
Date: Sat, 29 Jul 2023 04:52:15 +0530

> As 32bits of dissector->used_keys are exhausted,
> increase the size to 64bits.

bloat-o-meter results and possible perf impact for 32-bit platforms
would be nice to see :D

> 
> This is base change for ESP/AH flow dissector patch.
> Please find patch and discussions at
> https://lore.kernel.org/netdev/ZMDNjD46BvZ5zp5I@corigine.com/T/#t

Thanks,
Olek
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
