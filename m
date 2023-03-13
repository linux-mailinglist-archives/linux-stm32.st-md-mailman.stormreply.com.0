Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCD56B7D71
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 17:27:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7401AC035BB;
	Mon, 13 Mar 2023 16:27:17 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0036C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 16:27:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nD1uRkwmnH3hH4+rh16UJ+oT784gg5LCYfAqIv6SupjWfAbPvoGD6lO3D1VOWH9N8iroXGOUQ+kkaIFfBafDp7aX8tcBtF1Pam5biA/o/T3ENE/iHmzoUDw00U6ThVrTrHibvbv1NP5FoYd1F0BH8Ps2JTr0BHK8LN9WGqqVvTabR9dueOuf+ODQwoj6/LzpbDgq65aOLVj6NQ0b6O5+EN6WYtdyNepTnSyzEEdK9FYRbWMfXg477386dFnsWmUszxEpQFH6Zm4ZR2eDfhPRe5ovY9nFywxp551i2MIKlHaXnKfLSvbkuqH30lY8ejufMll/vxCAJl5stctRjcB+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAXS6ii+etQp0yOiEnirA3b/sCjkOuk8g88FCKQgLpM=;
 b=XC7apJy5cGRV2uC7/sQMjyZOEtB4fax10Xlk/MkgzWmQMMTLD1SG7Pxb2tNdqlpzzy3FWelQhuiNQrMWkAjUCMHf3MWYCMMd3aFrjD1EC1OHY2PcdhX+eAxkoci1UB8XkLQCImEHmugwn/e7QLlPIbSLI9KMOEO27pWhy40KnmhDcO8axis5Ygg8HF2q5ChWEkGgguq53NyrwAfJPDR/wFfLXCqwNTmnBssp3E3cuMUmkopxQlPeICR/H5jEFp5E7sVgoPepzgffojNso5JqqNlTf1kB/Bwl01iWwlHmZAAcMfVpE2gjJiYdz1TnAXJkARUlvxRq8IobzrGB8iSPxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAXS6ii+etQp0yOiEnirA3b/sCjkOuk8g88FCKQgLpM=;
 b=CyBkPUWumCU/eD32zBnidSDfgwfiZAi52QMs9rGg+caHQoHLVskLFbSEeJayoXstyKIp4KOX6SUTfbcGBVD4jAiwZW+0toso4nEZ3wFPT0PMAVBO8RX/dQXlzYwZ+KotnYs+w/BmoxTNRt9c0ZX7kwVPDlpi7Sij4811ZSDdlsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by BY3PR13MB4865.namprd13.prod.outlook.com (2603:10b6:a03:36c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:27:14 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::85f5:bdb:fb9e:294c]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::85f5:bdb:fb9e:294c%2]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 16:27:14 +0000
Date: Mon, 13 Mar 2023 17:27:07 +0100
From: Simon Horman <simon.horman@corigine.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <ZA9O22A+mZQz/qAg@corigine.com>
References: <20230310214632.275648-1-krzysztof.kozlowski@linaro.org>
 <20230310214632.275648-5-krzysztof.kozlowski@linaro.org>
Content-Disposition: inline
In-Reply-To: <20230310214632.275648-5-krzysztof.kozlowski@linaro.org>
X-ClientProxiedBy: AM9P193CA0025.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::30) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|BY3PR13MB4865:EE_
X-MS-Office365-Filtering-Correlation-Id: c478da9e-1624-49d0-2eae-08db23dfcde6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KI+5rvEDMcfXsvt5h2AooD4G1VUwYJtzk9iJTUvL2Q7pdVGtW4Q+204aXzMKIcbvP+gZckWt5a1M5vM5IaH+Lh10A98niEHmKKq0os/VP/5V1oYuqrg3Ir1wOP9Xh55ZnMnvnulZv3nzxl00nE7tlRevpJtDi4mAP5RDBSJcpFiIvuajamBRsNbD0YuoJJz2uKCoZXRD7AUPiGFVLmPZ5itDMSqhxxfrNFYk7nknVvvxmk6SKkzB7F2ie5iXmWKOmRBgoPAOdcyTMiMWLHImdsuTIjch60w7k0W3dnQqWb156uwUahTvD9LjWcNju3TpyW6dix6ivv6v4M84qT0qkNeHl5I9uwHoQwKp3G3h/6+rrq0yL8NWjL7RPFFQ52DFvUJHGCrwg5fbGv6W93s/3v07Ztc1mIfJV7jR6mxbnoYXBS+kARw8ZiLE53AZy1p6G7MkBRdBZRMIjEvMeEmKg1iYmVQmu3yzoDVpz0gDdPzp4WSb9jKbXDwiGtT3/2Q6LheVgrCO5HpDXxZUH2ghoZ1h8cczGWBxJGfhhIPm/hd53D3BCdTY/4ZrimbvPdDrQv0ZuWLSndWCQnCgbHbhpOmph6a6M4FfqN85IFxjfKcuHuC7iodCkNRgFQIiYTiJPQ+h8PzBpvPto8eG8U/Y5pocb4UF0/1a09Uk7rfJAIWpzc15m1+3COFuXxVK1hlu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39840400004)(136003)(366004)(376002)(346002)(451199018)(36756003)(7416002)(8936002)(5660300002)(4744005)(44832011)(2906002)(86362001)(38100700002)(66476007)(478600001)(66946007)(8676002)(66556008)(6666004)(6486002)(41300700001)(4326008)(6916009)(54906003)(186003)(316002)(2616005)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzJhSmxvbEhFYTRibkJDZ05qRUVxMVhoc2o2WDVCU1dVV3JzbnQ0aU9ibFJy?=
 =?utf-8?B?bGhoU0t5Z3EwazczbEhsOThUd3JDTW00V1FJQm9IZ09odkV4eVhyNFdUeER0?=
 =?utf-8?B?a3V3NWh4Vi9TTWNHL2x4U3ZpRlJHdEVrRWd2a0FBemxaWjRHclFScDhkellt?=
 =?utf-8?B?bWVmQnhXMEtERXZWN0NjSXg4ZXh6ckovbkJNWEkyNEF0Zk5EQW0vKzNpeVpJ?=
 =?utf-8?B?SlVkbEFVSXdqZzd3SVJaeFFDVGZ4a1RKa1hJMVBST0Ira3BUd0pjYUx2bk8x?=
 =?utf-8?B?UG5WTllSbTBETU5nV0JiSy8wbG5RNEh2bkkyaUhiNUo3MDcyNXQ1MG94QjZt?=
 =?utf-8?B?UUpmSmVDc21TSCtOOGVVbUtPSitXYmJTZ3k3cUtCWENVdmZHZWZhVG1FTmNq?=
 =?utf-8?B?bzVzdHVUbHNOOVhUZHJjdWRYLzM5T2RvUEo1U200M2hHb09YSE80UVAzclVM?=
 =?utf-8?B?ckdwYitkZFdTUUNGdVdEMmhDazlsMUV2WkhkYzA4VTN1MTVpZEZSS29FaWFP?=
 =?utf-8?B?eHNQOVJMWEZZbDI4MlYvSTdaK1FLUzdEOTZnaE1CSEx0b21DSHZYOCtzM2lo?=
 =?utf-8?B?Y040OWlMZUpyRVNxMzcvZlRzcXhLUkZIN3BXZE9FVk8xYVBaUkJjSjVTMGpG?=
 =?utf-8?B?Y0RYeG1aS2gwUlR4dE54T2xrTzFsSGZwS2xBY2d4SHdJQkFiYjNySFhzOEFi?=
 =?utf-8?B?aER3ZEtsc0w3aEc5cDVMaVl1VkdTS1JZWUhYYzlBcG1INXh0SzZ5bjQwZW4v?=
 =?utf-8?B?VloyaTRjZHdXWCsxYmovOExpUjRWVGhpY2dGTjZ3clFnaThURkd6b084WlJS?=
 =?utf-8?B?RkFUeFhtOW5lRTZHalJpRzhQUnVjbTJKYXVoSzNFSnJ3dCt4OVJvNTRCWm04?=
 =?utf-8?B?SnM2Q013SmxQMEN1bVZBR01aZUU4ZjJ3MW01REtnbGFXOS9kVTNURGJackEx?=
 =?utf-8?B?NGNHTnBoai9uUWtuWmlYN1A0Z2xmQ29vdkU0Q1F2UU4xT0pXaDRJVkdWb1Ba?=
 =?utf-8?B?WkF2RHBCVDhabkNvL01UeXJNVk9lVkpIY0s5aTJFcTFxcWRyMUJjNXlzSFpa?=
 =?utf-8?B?dVNyM2Z2T0NCZUhKK2YzQk51ZzNyWUVSQXpMMXVwd1FFQzQyY0hGS0owbWxh?=
 =?utf-8?B?MGNIdFhIcXI2a3FLamxTUUdDMFlRalpXbkpzL29aa2YyL1A3clZ6bzBGakpp?=
 =?utf-8?B?ekFqczZiRk9wNCt3Ym1wRmdUYlROb2w4OHJwQVkzNThWV1EzckNWclpOcWRE?=
 =?utf-8?B?enlWdEozRzh4MnRwNFowSWNpeS93Y3lGQ2pIOHF4ZkN4Zm5iamtjZ1J1OG1k?=
 =?utf-8?B?Zk04enNxdm1vdGZieGE0YThZeXBZc2g2ZHNkVlBUVkg0ZnI2dXVDbGplUDNV?=
 =?utf-8?B?Q0hMaHZNUy9rRnVKT1Z4WEw5ZGZDYkZrNkdZN2R3SDI2UHZEMFBvTkVEd2dY?=
 =?utf-8?B?UkIwVjIxaW9XQUhOT1BxUExnY0ZkWFBOeVBDL1FteFhkakdUUVFvRE1XdTB6?=
 =?utf-8?B?WUR2emo0NGh3K1hNYmNiNHplV1lpeHlKMmhlSU53WXFZMWZlak5kNzltVWJx?=
 =?utf-8?B?Q2svTnR2S3M1Kzc4d1IrZ1NZQmFkeENINTkveGtlZkxkYk1waHRTbHJnWGpl?=
 =?utf-8?B?RFNvMklEYzNlWng1SW5oOFh1NWM2d0xRbkpFWXVrTVp1UGVOb2NSMnpMaDZM?=
 =?utf-8?B?OVFTdEhRdHduV0NNaC85S1V6aDhTdEpWczkrUnFOcS9PY1FTODhaRHVvdm9U?=
 =?utf-8?B?aSt1dlpBNDJLekpaUXAwWXg0U1JMVlcvQ3k0ZGNubmFTVDAxNklIbFp2MWhx?=
 =?utf-8?B?eFlvdVh4cW92eFVjcmtRTTVqcG02cXYyeWFkVFg1aG53NU05aEp2NnEzUFJr?=
 =?utf-8?B?dzJXbEJvUS8raElBSk1kT3Jwb3F6TXRKZzVkVnQrbzNqQitOSFE2QVI4dUJp?=
 =?utf-8?B?Ujdpb0Y2NmV4U01oNGFKQTVNbElZZ2NSRXJaeC8xdmc0YXdxYW03KzdKOVNX?=
 =?utf-8?B?am1OTVV5SVU0TkJjR3VueGQ4bTVPL1dPVHBDVVlPdEl1NWpENHdaTXQzUGt1?=
 =?utf-8?B?VTV0RlY0dXVKeEs3M0Naa0w0RVZqQW1QSFJzdXl5OThVLzRwbm53SWlmcEpk?=
 =?utf-8?B?N25Oa1lveFdTVFFpQnBSWjg5eEhicklNYjVTM1VOV2tTNFdJLzlBTUlrUFgv?=
 =?utf-8?B?amppRnd6bHlFbHZlUFV1anJNQWlkTHdlUWhEVGdOdThvb2VOYWRxemZCNmw1?=
 =?utf-8?B?K3BDdWFYWXlIYWdHWkxSVmtlNU13PT0=?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c478da9e-1624-49d0-2eae-08db23dfcde6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 16:27:14.4025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KblzQc4IL9593K011knf7XeYVDVNLQ34SQ098REfoSxGEKgDyCW8P3kbipXnjGUTSw2lg0Hf15n49EEfvwbScyGYCSB+VtnbLDvF5Q/7HHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR13MB4865
Cc: Vinod Koul <vkoul@kernel.org>, Byungho An <bh74.an@samsung.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/5] net: ni: drop of_match_ptr for ID
	table
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

T24gRnJpLCBNYXIgMTAsIDIwMjMgYXQgMTA6NDY6MzJQTSArMDEwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBUaGUgZHJpdmVyIGNhbiBtYXRjaCBvbmx5IHZpYSB0aGUgRFQgdGFibGUg
c28gdGhlIHRhYmxlIHNob3VsZCBiZSBhbHdheXMKPiB1c2VkIGFuZCB0aGUgb2ZfbWF0Y2hfcHRy
IGRvZXMgbm90IGhhdmUgYW55IHNlbnNlICh0aGlzIGFsc28gYWxsb3dzIEFDUEkKPiBtYXRjaGlu
ZyB2aWEgUFJQMDAwMSwgZXZlbiB0aG91Z2ggaXQgaXMgbm90IHJlbGV2YW50IGhlcmUpLgo+IAo+
ICAgZHJpdmVycy9uZXQvZXRoZXJuZXQvbmkvbml4Z2UuYzoxMjUzOjM0OiBlcnJvcjog4oCYbml4
Z2VfZHRfaWRz4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12
YXJpYWJsZT1dCj4gCj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6
dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgoKUmV2aWV3ZWQtYnk6IFNpbW9uIEhvcm1hbiA8c2lt
b24uaG9ybWFuQGNvcmlnaW5lLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
