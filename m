Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD76670F85
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jan 2023 02:07:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2F5CC65E72;
	Wed, 18 Jan 2023 01:07:43 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B69ECC6507E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 01:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674004061; x=1705540061;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xbv2T3PvYrdhjxbRcfv4E9PW5B8SQhhef05dXQGqeLk=;
 b=dR8HgA5lz7RNYWM0NzcKe+/EP07iLYz70wu4dkYYmnX1aoSMNjR8HBaY
 jilwDLj15i0AVrkcEe1W5HZj5Js+bLa7OjxmJQdeTAvI78A2pQx4m9HYF
 48Cn/245blX8YS27OopOVJh+yby2wkJZnEn+d3VOr882mP/7o1iRlgMZc
 X/ooQhbQc540ZdjMUf9Bil6rQOppserml+ukHUqrH++C0pfFCjiST/v9C
 3+ko7q6bqtxUsSywNFRyemfG/HhicjK6cjsHfoplbyNYJqkfRsSGzOwKH
 nzDEynV5u1pcfvNOjqGb6o2zijP/VPCTQD985o5+O4UHQZ/scr0B92IBk w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="326139611"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="326139611"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 17:07:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="801975982"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="801975982"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP; 17 Jan 2023 17:07:37 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 17 Jan 2023 17:07:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 17 Jan 2023 17:07:37 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 17 Jan 2023 17:07:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xi0uQl4SWVxgQvPXnxu//rd+WWAsIu9cVjPd6W2XZRms/9pLXps8qeitFC++OueVs5zMR6qYxywskMoymmdukGcQn6FFupCf4hu7y6sj39s+XxhmVUgSOypN7gECa8f6zv099p1MXbCc7e4b2VPp7z6xCKwIeDIfEKYaf2OZDzzWEwN2ElzctpQQAqMD+4z7QGZGIBJ59pw9+MmFo3diQbGsZ8h6CxWDu5qZrwH06SrkYszhVbsG6Eq+BPtfUhDY9rm3Ujz6MZrqTbenrq2J2aptkFmf8hzBQAWkthO/uXW2UxVgwFP9EY9YxWqg5Mv583V5qaus5f5K/BqEQ5cHhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ypeLEshbIAj2TszFSvEkkEQGpU+fkPzlc8kUg96bpU=;
 b=IWA5j/6oe+rXVMPY/xlkDpRsARVACDrep0kWJX9+R2un2bcl9SA26vPIzCHUsz0z6G/up0xH2sDXDPG1kiqgEYLszOj7iYLJ43n7+hr8p03gCAAuuSP9KXhsPVQ6NljhtWrbV+o5QP7sceagLZjeYiU/w2eyQQUoKOtkv67m3qKl+HeuZzAHq3r3+LpYZfDi9olzOcKUwyn3FvF6zFbbzlJSN5Ewh7ODr3Z4uOE4mtmXw3UT4BNBx7rTxJQgFiVixN6tS0g3t20W7HUZjIpyCaAh6owvusD94p+CcJe6LyGbjMnrO2azX8trchgtWYa+Muf9UCfEx1urRlgK8fSdoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4914.namprd11.prod.outlook.com (2603:10b6:303:90::24)
 by BY1PR11MB8126.namprd11.prod.outlook.com (2603:10b6:a03:52e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 01:07:30 +0000
Received: from CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::c743:ed9a:85d0:262e]) by CO1PR11MB4914.namprd11.prod.outlook.com
 ([fe80::c743:ed9a:85d0:262e%6]) with mapi id 15.20.5986.023; Wed, 18 Jan 2023
 01:07:30 +0000
Message-ID: <517488dc-069d-9e5e-c671-0dcf78e61172@intel.com>
Date: Tue, 17 Jan 2023 17:07:27 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Michael Walle <michael@walle.cc>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Felix Fietkau
 <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "Lorenzo
 Bianconi" <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 <UNGLinuxDriver@microchip.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20230116-net-next-remove-probe-capabilities-v1-0-5aa29738a023@walle.cc>
 <20230116-net-next-remove-probe-capabilities-v1-2-5aa29738a023@walle.cc>
From: Jesse Brandeburg <jesse.brandeburg@intel.com>
In-Reply-To: <20230116-net-next-remove-probe-capabilities-v1-2-5aa29738a023@walle.cc>
X-ClientProxiedBy: BY3PR04CA0027.namprd04.prod.outlook.com
 (2603:10b6:a03:217::32) To CO1PR11MB4914.namprd11.prod.outlook.com
 (2603:10b6:303:90::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4914:EE_|BY1PR11MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: 63bc214f-fcf3-4c8d-e0de-08daf8f05f57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UXtU/clrRqqJwGPBuOJ3rzQV4ZIj7Vq/t0ZLqPUovxktj1SnOzWeRJ9NQxW9EqKeAJcYZs2rmwskow53pUUt2Y+g7/Cd6Kh85cqhdMU36Z8JzG8Dqd83AxVJuzAN20yGs+LKJKCOVWdI0ANH3DbKnf+1HbnlGxLpHP/1WVIYLWu4+4pbAkBPevkryNfwO7/xh7T8w09fm+Av1OFJNgjygAMiqCFP5IWPhdsAv++C+IV5x0pbum1ukAMdFjUbpHrYN6qHyt9nuM3sjQ504jQ0YYqza9u674neajIP10vLjTcydMc3mQWf+kCub7mUbz9wjNXigg39uqhKFz9md5v6WdD94aFlX93UEmfr3QAwmv3Pt1XJPVsU27geU+bOSSXaH0YcmgJtrqH6FSQNe4b0tJynxCn8yr2slRAGHv+FzfhJnvlgiZZsMTZ3SLVNuAIkwBNfF1+jFSv55BPwdNahHehCHBdQyPOAyXAHQ1woqsRLeKT6N8nM4pUrByo/IfYmoL3xmZ6FHZC4mV/jyl3pDgC7AFJh03kVAnHaq7v489UY0fBAPizFi5jOkSbpttLEglvZiXNWVKJURiUrCkjSGRfw2UBv8H+/xNWjfAOM9dUBGwWeNAsYN3vT2+yuP9IaqXL2C+iYTXM/SZq7pKHlsalzfrHqU5MperzcFcNXLa8euc6lEhfPWmFDdyLWHhKsUKOrKaWRFDoU9tyxS0bdZsFL98pW3pqImH+uhBnxufdJ0NaAUdJGS2Kx0vx/xUE5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(136003)(346002)(376002)(366004)(451199015)(83380400001)(38100700002)(66476007)(921005)(4326008)(82960400001)(7416002)(4744005)(66556008)(86362001)(31696002)(2906002)(44832011)(8676002)(8936002)(5660300002)(66946007)(6506007)(53546011)(186003)(6512007)(2616005)(26005)(6666004)(6486002)(478600001)(316002)(41300700001)(110136005)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUlaYWxRVll0eWVtTUJPTFdaYmFTTFdkNDI1ZE5DMnVFTnRPakQwRnRFSjZU?=
 =?utf-8?B?bmt0K2FQdkdPL1JFUVZWbURmaVg5RnF3NjBhNnJraEEvNFVOZHc4cjM1NmJV?=
 =?utf-8?B?UFBWTDBNTUdTYk9ucEYyaDJKQXB2Z1kxMk1kR3RkbXVuKzB5MGFYZGRFc1VV?=
 =?utf-8?B?aVJOOVloamhVWGt3ZUFCc0RKTU8wSkNuRkhtYjhqVlZaZkNHN3Y5eDJXNVhU?=
 =?utf-8?B?QVJVRGlpc2J1ZW14V2lCN0ZQVEV2bVRmbDdrQ2FBNGxlZ1VLMkZvN1ZrRml2?=
 =?utf-8?B?UlVvK3dRYlFuMW1pbXp1eHJEclpZREZqNmJqWHpmQ05MOUlEdzNvL2w2emVz?=
 =?utf-8?B?RmwxWVB0L3NKdzRuR080ZmwyTE9ESGNzYTh2elVhejZCQzhGdWp1anJrY3Nk?=
 =?utf-8?B?cEpyR1JNbFlXa3J0c0pTSEhYMVh6NWpvdXN3OXNmYXJ4TjFUcjhvaFdob2ps?=
 =?utf-8?B?TUhOcEpvdUpVNDVHN2xwcUJ6T0xiOVBZT3NFcTVNVjdrNkJMWmF3NnRDSTM1?=
 =?utf-8?B?MkphbGEwcmFmbFNHWS9nQ1dVWDlPdW5PU1g0eFlGSTRGYkFnQURSOVVudTlq?=
 =?utf-8?B?QkNmUWI4RnFpN3JQUTJmTWhBeXd0RmthdUpTdGVvMlVpZmYvSC9ZKzBZamVj?=
 =?utf-8?B?MjNIbGZSMUlXOVlVbTluVGVVTVRoVGtvNFB2bVRJVDJWK0xIckRUVGx6OGtv?=
 =?utf-8?B?cUJ0Ny9qN1Y5ZTBPM1BRYnFkU0N3dUd2MzIxVUpwY2hYYTEzWDRjeWpaaEgw?=
 =?utf-8?B?b3pIMXVyNFpjUG0yWW94dGNubytwSGxvc0VDN1BMaDlJVVdSOFZIVkV5c0Fm?=
 =?utf-8?B?cHpGOUNISHNyM0M1NEVKdEVRdUxPS1pDcEhWRDl5cmgxamNFZENkWmNzN0Vs?=
 =?utf-8?B?cWJXVG9saDlVM1pjZVpBMTF0MFJNOThJVzZRQnRYYUFoWlB3V0swSVRoR2g1?=
 =?utf-8?B?OXBzTk1Kb2M0YmFkTlc5bHMzTUlrL0IrRXY4d2RYQ29WTHljNUJwY3M4bUtU?=
 =?utf-8?B?K2pUTkY4L0pUZ1pJY2YydG00S3UvUUdBSHNmSms3VXpMMjlVNm54QWxWSXRZ?=
 =?utf-8?B?QTN6Z3JkQjUxRXI1WktUM3dMWW5xOU1kQjh6ZVREeUxDR0RqU3duK2dyb1Mz?=
 =?utf-8?B?dzg0dW9yMXNhRTlTZ3FRVlV5SURFWW5QbWtUNE1rM0Nnbk9RWlpDdCtZSVN2?=
 =?utf-8?B?UXJTZVMza3l6T2lzMUcrdXFDU25NNVF0NS9HL1dYQXBMb2l4eTU1UDB1QjQ4?=
 =?utf-8?B?dVVlUFRRL0NQNlRJTmJxVTVZckRYTFNFNGxqZjFuY2RzSFVRY3VLK0tMT0VT?=
 =?utf-8?B?bEJNMGVaWnF5UWRYdllhZ2FjYXhiY1IvckVTRGc0TURQQ2lFWXRHOFVBbklB?=
 =?utf-8?B?eDVnaWlRT2l1ZVFnblduRXRtdCtZREExVTQ5NGZpZURWQTZ1RmR6SlpVRHpw?=
 =?utf-8?B?cWNIQStCK01YK1lmcjFQckNJamxXVTRabmEvNEdOYlVxZzJ4K2J1aUlJRlFx?=
 =?utf-8?B?RHpPODJIRmd3Sm9EQzJEVTEzdzk4cVBWS0M4SWhZd3laNG93T0hsbnBvNTJX?=
 =?utf-8?B?YnJCdmFva2Nqcit0UXhpMTBMRUMvM1FCKzlGNHlJWDZHbmd0dE92ZTViRExB?=
 =?utf-8?B?aTI3TVhmKzRXQTJJQnFlY1ZjTDdXVDM4WnVlRGJadWk3NDFCRklQSzJqV3Yx?=
 =?utf-8?B?QkFnVEhVU2dtWHZpOXd6ZXVSWHJCSDNZMGFGK0hvK2lmRW8rL0xvRXNZalRx?=
 =?utf-8?B?TG9hcjRuNGxRSUR5NGlPWDNWbE9scCtqL240SFV5MjlIcllZbUpCNTVDRVVN?=
 =?utf-8?B?TC9HNWgvTjRFWGN6VnJQK012S3M4UFlXZVdpSFY2cTJxVTRZeVJzblcrVWcr?=
 =?utf-8?B?V0dNNWJyUW5HckFSaytES0dHTytDdWJlZE55SnVQNHNHbWlCQTBXRW1pYlJ3?=
 =?utf-8?B?TTFoZjJ2K3FOV2ZQMTZiNXNPaE5CRUErcDMyM1ExR0FjQWoyazVqd2hzT29j?=
 =?utf-8?B?R1FPUkFBclJyZ0drSGZmMVRrMk50dWt2NXltTFBWRDgwekZPTkM1K25SRGlD?=
 =?utf-8?B?a2RJclNiODRZS0wyajhRVUVITnpZMkZVWms2R2xxajVKanBGME5Sc2dJenBt?=
 =?utf-8?B?K3FteFpMMGhxZ1ZUNEprdkdDWWNuMDdpbVI1ODRHZDBFMnZKYU50MU5MYnRY?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bc214f-fcf3-4c8d-e0de-08daf8f05f57
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 01:07:30.3186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UB/5a5l/yVBZq+GJdO9xLh3Kq5KKwn4IURIATn/MGhAOEhkG+c1fPB/kPInAVx+UghHopT+wUxuJlptyd40jLZkg+B+r29o1aY5jeB+uZkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8126
X-OriginatorOrg: intel.com
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/6] net: mdio: Rework scanning
 of bus ready for quirks
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 1/16/2023 4:55 AM, Michael Walle wrote:
> From: Andrew Lunn <andrew@lunn.ch>
> 
> Some C22 PHYs do bad things when there are C45 transactions on the
> bus. In order to handle this, the bus needs to be scanned first for
> C22 at all addresses, and then C45 scanned for all addresses.
> 
> The Marvell pxa168 driver scans a specific address on the bus to find
> its PHY. This is a C22 only device, so update it to use the c22
> helper.
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
