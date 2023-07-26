Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1D97633AA
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 12:29:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B125C6B442;
	Wed, 26 Jul 2023 10:29:26 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2138.outbound.protection.outlook.com [40.107.237.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1198BC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 10:29:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WuXj93VwR+0MxGBdI5Bs7+Yk3L+zt1pYiyo8PWlcZdTuXFe/q9gKYaD0HVOFm7ZM9YHMZROKk3INPkQ9InK7sJF8JUlvIWvWDzlImr2Nq9sSwsrAEEzhCqxOAxzPqVBJhYzXUVtPdgV39cW/8oHZU8BeB/Q79iFlLQyI1y30DX2kQ2L9oavIR/42zKmrMptmRztwN6pu5XSWp5aAnE4xsFvcIzunN4JT9USO4WD0HkL9wSHiVxdsAgLaDV9opBPBZZG+q5Plfy+xjFB/q9iF17y89Jt4MhO3JdQ9Jh9cL/fbzEbWCr9rUfl3fW0VkXwqIfLL9bF9Z8N//2QLtBPGfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rz6k3zSqoOkqAhMPpBmFEHvbDA7IBgm6YL0kfqXvaoc=;
 b=EBBtPmdbef5vnU3zOAYl5tkB852UalHkhWSMpWVFevAKsIMgcQqJHT7MoMFnjW/kLGvrQ0UfZ62Eo2JJasATTXzhebH6Q4g7rhrQexJR7zaBNas1026S2rOgvSQjSV4R9iIFPV57O6hkQbXFb6q/r2hbTDpdqa1YF41NuoLfk+SADfZSabkTBubHha/St9x1yNtaXjQHjKqsBoXGI3tG/29ZyP1FIUWQII9Cm0xZQXOxx0O/3+dNSTuQhgZRyqFhoDvkj4qC7bkNe1+1tRDkkOiIbxnCE6Tw7W3lBgVNABxePUKQHDIAWcowh3UhYqkelf0FJ64cbkiJ3SpVslbLmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rz6k3zSqoOkqAhMPpBmFEHvbDA7IBgm6YL0kfqXvaoc=;
 b=k7AgQ+EysSAyDRKVAeMi+r1BgtIUsbucRBu9iMkiMVFoyrAkFTyJJEI2ZQbfVwa1YpfkHPfHnMRXF8i3uemxJ3K0erNUEvowFdv5GsPPkrJ0N++T+LcV4qBVuux+hHJL7zA35Pa1stwFDCyyWIbzlmZ1zgVDcVSedmC/gC9q9Xc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by PH0PR13MB5715.namprd13.prod.outlook.com (2603:10b6:510:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Wed, 26 Jul
 2023 10:29:23 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d%7]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 10:29:23 +0000
Date: Wed, 26 Jul 2023 12:29:11 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <ZMD1d9/yIU+pcFgv@corigine.com>
References: <20230725164104.273965-1-gatien.chevallier@foss.st.com>
 <20230725164104.273965-2-gatien.chevallier@foss.st.com>
Content-Disposition: inline
In-Reply-To: <20230725164104.273965-2-gatien.chevallier@foss.st.com>
X-ClientProxiedBy: AM0PR05CA0091.eurprd05.prod.outlook.com
 (2603:10a6:208:136::31) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|PH0PR13MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: 11795e5f-2f65-4145-bc8b-08db8dc32de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KPI93Y77ahbnm/RbaWslc9VaFML6v3Z5WV1yPsL9Wp6ho/dDRE8G/YBIe8n8hNyZvAZnBOx/3OV6dl7S8My+D8j/q6WqLcyfixJJRkupgwqac7oco1v3WMX3Xi50tEDKzi3zQfbiIvYURqHpE2iAV/eGe/IHToSlWt7r1uL8UieOqOHJTSS8LtDmk82RNnyZj7Bnuvf4q5b+z6Z1dEickeE38YfEs4Dav8/G+uBE+vaPpSsW1tb508AudqDu3OOFQIrxln8xs3TkiKtvmJT4qj7khl9IFPvOBeMdskRbXTT15AovE4OHG++EE3X+W5Ri1DiX5HXwrp63qDJvWKg5G+LDCXuXhm32+TB58vK8vcpBWxeER+7EhR12wORf7JbJb9rGLitUB9lDbY0pY1rVZkhqw+saCJej2pkoUmsX9PGKviwpVppp9aTgClUqHWYtKa9ttc9euagp4dVQzdxyx/O5pk2d6t/oY7l2KbNAuNq5LcI3/9dx0LflqTWBQr8uxe5+Bc6zl42KtiRHi636HgWMX2mi3Vk7pPGj2RUCmh6aN7/VlQmkwgn8rAoux25pdNr4pMQ54RtwzodceQ1Odb67FGsc3XhOAuhhJkN3OIA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(39840400004)(366004)(451199021)(6486002)(38100700002)(86362001)(478600001)(6666004)(186003)(66946007)(66476007)(4326008)(66556008)(6916009)(316002)(6512007)(7416002)(41300700001)(4744005)(2616005)(2906002)(36756003)(8936002)(8676002)(7406005)(44832011)(6506007)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4xX/N7ntLtab6htiJ9A+WMRhdBqthD5cQy3Q9Vfqeu/E/bZKEDivxTzDv9QJ?=
 =?us-ascii?Q?DTMtysdJCSyAreox5RakqjCUiSTVv1DttWC+w/uz5o5d+Jh5WtpotRr21vME?=
 =?us-ascii?Q?+xeSTw+BhoT0zuBEbdnQOSsDL1IaypyS/STXnu2P8JjVF6ppZhdcr/9XqxQ6?=
 =?us-ascii?Q?6wziEyMcPJe+N34QyF4M03bZA61HEOQtXs0MibsmB/M6g72rWZg+Tpy+hal5?=
 =?us-ascii?Q?q/9jvISlO5j3dYsNK9onBwm0PiyyzDGZOL79c+Mkopt7jqkVLqSjewj0mTlB?=
 =?us-ascii?Q?yYItuLXa6DUi0+NOnNzh/FTtos7xsjRJC6+DzUjl3HPSSAvZjqQf42vyFp0Q?=
 =?us-ascii?Q?vhHMxvUhkvf1Ducv3ejbh9UWpTQKRGdatFHPJT6+qr+cGvasMP+8Vhf3cnVN?=
 =?us-ascii?Q?oglrWEGKrC0rZgtZCWKJ4aXCECqSctRGlEmc0xBUaiidlM7QhQip6M1mrLA9?=
 =?us-ascii?Q?bXzZJXBcKcLQpK975SlPevkpmb+54WXPeRkEw5u4kliPaAQYFLhpklmE/PL9?=
 =?us-ascii?Q?d0UWMAN+077rNInRAQeLeV6vvh+AN/hitGVu53Pl5hQB3jDVKfnhMEtzCt74?=
 =?us-ascii?Q?hBwwEa7vTcSgBV3q34oiCR+X5dA+v1eK4+w/5G8qP0X5d3BxDGFGXK9aN/9y?=
 =?us-ascii?Q?5XA8f3dbf+juWdql0F1TbgKW2f+tMGGtg78GjzG4xKajjTDBD9IjBZ6mSRbD?=
 =?us-ascii?Q?z3S9KdhLkW3KKDjBAQxObWZjoLn/NWswtYBzez+6GEbJ7bfgnViLqTjdS/xO?=
 =?us-ascii?Q?pa4lWkiPuST1VrerMqcY1UdGfD9uxeCro4WqXNR6oWSTGWXrKA2GTpfmSO6T?=
 =?us-ascii?Q?SexzDrfTE0ZWHq1QWse6+M01tQeRwkwGMiLW4UbfTHuMhu+WlMdyag0Hk6eV?=
 =?us-ascii?Q?JnKZFbqEPfAmVlJMW/iXZNo+fivnK7dJ5OHyYbplWFzfAygOuduyINKKteKm?=
 =?us-ascii?Q?o7dBDcNahPlnwXOGsUwWER59d6Y14mj53VyYf0T8gDzZgzSzJ8/obZ46vdWp?=
 =?us-ascii?Q?YJHIGClSTMaIK0RCOfMBYdMrZEYx6iGg2yFxUz0FEp5kWm7j8iDvDVl+GY3/?=
 =?us-ascii?Q?5Kvnh1PT4tZ8NNyTGLKGn2AiTR4rvp/i7EmnF4136WnPgqvdav4q9a7cfLHA?=
 =?us-ascii?Q?EJCsT6VwAEq0QjIOxt40Tt2cQMNjMEg4nF8D17AYEyn27Ep/7vhFnFGGluZD?=
 =?us-ascii?Q?+cg470YR9WZ3y5tY0/+CxwAE9z2fT5vZCgTIL6IkaMiWK/4SCgHrdakNaJvN?=
 =?us-ascii?Q?5c29UXUqCOFNTjIheQ3tvFGVg5Fbz1EUdt2tSb9643AjG9oHPBZ11dtEY/bC?=
 =?us-ascii?Q?ryoqcbD/qQPfB1hVzhuiuOKKjOuHAPW1e4RzkDlCfYYklUJnmdGwoOgXmYRd?=
 =?us-ascii?Q?hkQjhoSqi7RCE2VVM9VErcsYzhYcOs291KmHm0QPHa5QzsRCbPzSF+FkQzsP?=
 =?us-ascii?Q?BMYt/jFuTR/cX5emCNgbq2t2F4kOxdx4Nhn5znoEOvXotBEVyxyxF7snhbG3?=
 =?us-ascii?Q?FeBuX1RT8AftC19WbFqKB3y081OClix+4KTTiXsBEuxaMVtbH8kHBjs7vYx2?=
 =?us-ascii?Q?blMYJApkrq7gVOh1UwADdelsGYlYFNyXxC/pIW3X2uQVnDfSRHLBP8i1fhVm?=
 =?us-ascii?Q?2rn4uAIUbCu+f22RceKralTMaBxZ+OtEabVmfoFqQk2eYM466sYUx/xYkwNx?=
 =?us-ascii?Q?k1s9vA=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11795e5f-2f65-4145-bc8b-08db8dc32de2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 10:29:23.2962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vh9Z85Jd9neDF5H3ak11XNHNHzAorUvkZwdUUjqAU5GE9kFqoKuH9azr288qPmvrf8L2uBrLvwPU6/yZxh69ybgKloVUfr4Ui0frRHulBvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR13MB5715
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 herbert@gondor.apana.org.au, Frank Rowand <frowand.list@gmail.com>,
 hugues.fruchet@foss.st.com, lee@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, alsa-devel@alsa-project.org, richardcochran@gmail.com,
 robh+dt@kernel.org, linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [IGNORE][PATCH v2 01/11] dt-bindings: Document
 common device controller bindings
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

On Tue, Jul 25, 2023 at 06:40:54PM +0200, Gatien Chevallier wrote:
> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
> 
> Introducing of the common device controller bindings for the controller
> provider and consumer devices. Those bindings are intended to allow
> divided system on chip into muliple domains, that can be used to

nit: muliple -> multiple

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
