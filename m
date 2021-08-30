Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 932243FB22C
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Aug 2021 09:58:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D8C7C5A4D6;
	Mon, 30 Aug 2021 07:57:58 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65C4EC5A4D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Aug 2021 07:57:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1pM6bj8GqP6EiklQ2LjNfavMPA0oTByk53Q1cqbdVyFLxSgbVr3YoQt4ymEp1dT/WY+zPPiatEr1R0EhV1Z4fjuuwKdoyuPGPOonFAYh8tHxwZrS8ZbMtCMvdodhTAQQzwjrLZow5i5ydlNvf0WA8f3AzTApRrSegCQBZVvJCFldf8dXmqMpPNpKJjBMCX+Q/8yRVEzWF8NXI8P1BcT+5UEO3RaS4NTrt384mxhoKA9JuOzZRGMlnKNhw6XAPb+D3/cNIgBbyC6iU6NC8DW4K57rXTodEF4MoRQ5bx3KgH0gtEMqdWA0JZA0hpTdpd1zmK/KtFV4PZgslXtDMMEOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9YdD9gY+9K6fTDZDrlpA5kut8UQlcHwnjC8MH8K63U=;
 b=RF9LoKiIAh33kvFr4AltGS2Y76e7tcEAY5eLYHMIICbdYku16VIcYtoyDJFcAUDmDrPCTi1tUooyvbP25i9YlMlFaZXoGNhGO6+xB1jxMBs2CCF1SNtRUS1jPNKkx+rPf10PPHJtgqgmsP0C6rURzX1H84xGzA1lVJVXL+JqVXF1Xmlj5NC1TEBQk4/bFwIbeB2ciJGNqR1uZjUtBeZLzsETNpjemXW+fPutjcpiayW0JtyKomxOwg8a/ldezFskuDa0azmrkPutKrDRhug6dIXSS6MPBybi93nhIU+yhrJ+JTjDEIIhGSJmmYVBj2AZqnAxN29C8Gi+eqQMiDtPIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9YdD9gY+9K6fTDZDrlpA5kut8UQlcHwnjC8MH8K63U=;
 b=bfyMczhj/TWNwcn220DRcz4xIOkBasVa9HRZ37pWzAJZhH3ZYkyDkfnsL2Z1lKSOENIv8Z3znOyUDhI3yCPcQFTtqwcjiaMBmHNgIQx9rtgv3JxisTegKZu7lgucMi5YLke757vOKTPTntcOz8TIXyhxdHlCJW+BMJB9m1V1McY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wolfvision.net;
Received: from DBBPR08MB4523.eurprd08.prod.outlook.com (2603:10a6:10:c8::19)
 by DB8PR08MB5403.eurprd08.prod.outlook.com (2603:10a6:10:116::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 07:57:53 +0000
Received: from DBBPR08MB4523.eurprd08.prod.outlook.com
 ([fe80::452b:e508:9c57:a6e3]) by DBBPR08MB4523.eurprd08.prod.outlook.com
 ([fe80::452b:e508:9c57:a6e3%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 07:57:53 +0000
To: wens@kernel.org
References: <20210823143754.14294-1-michael.riesch@wolfvision.net>
 <CAGb2v67Duk_56fOKVwZsYn2HKJ99o8WJ+d4jetD2UjDsAt9BcA@mail.gmail.com>
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
Message-ID: <568a0825-ed65-58d7-9c9c-cecb481cf9d9@wolfvision.net>
Date: Mon, 30 Aug 2021 09:57:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <CAGb2v67Duk_56fOKVwZsYn2HKJ99o8WJ+d4jetD2UjDsAt9BcA@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: VE1PR08CA0018.eurprd08.prod.outlook.com
 (2603:10a6:803:104::31) To DBBPR08MB4523.eurprd08.prod.outlook.com
 (2603:10a6:10:c8::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.125] (91.118.163.37) by
 VE1PR08CA0018.eurprd08.prod.outlook.com (2603:10a6:803:104::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Mon, 30 Aug 2021 07:57:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3d7b0fc-cda4-4180-5c98-08d96b8bdeef
X-MS-TrafficTypeDiagnostic: DB8PR08MB5403:
X-Microsoft-Antispam-PRVS: <DB8PR08MB540335F04BE834C588F6F4D4F2CB9@DB8PR08MB5403.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w6VbOm9IPMva7dJqci06vf0xdRitW4whEQsGiFk40rPBSe5ow10T+RuOFGx1bh3OFSM1bh9ut669cRGAySfaBCnSjVK0Z1XDGPZVcTnMkrp9pQW8C7O0FsO4ulzPYT+XFFA9C+PQB1qcKgdZZXy89OzubGxHHCAT13Mz5ADIa7cUdM6V807Jqke3B61QUEa7Qu7iiv2enQrvK+MdQe0eYre6yYMMpqI2HNIufx2wSkzgBRP0wL2EjlFBeigUdq4YWvvK/HD8NT7b72O+DZJDzSjVOuYiA08i/W+srBsMuE11VTUHdFYetrasBVWYbIsWHrKTFeGgKOBdEQCZ+0y+wGHaY6YuCP1g645BjG1UHBKLL0cFwp+1L0dcC7U5KLbsVnDPfGZ3AekyeoFmEZJp7oM0VOBpJqKQlDnBoZIAdwzB/d77PSLr9zsW+2AGHosnAcmzggUZDwg0Ho6o1Re/z28Ilyx4MGJtRORQQEKlHjQaAKNs66q0uqpRLcUY9lQrtbIpShT5CcsBFL6Nsz5hCYTmaS50aVq7gYsC5NPAUSpHHPHx/h+j2zQsKFA5t9HLtwHTPT2Zvk/DjiE4jnLWO5JiAaPteJwTSl3zK+DNeaCWpXZJWn7zak+xfVI5/uyW6tCtit98AraaoTM6/tGcWhP8j6t+9zWG4OZs1kN99b8Hkelof6pMHB5shNeFeNgaIimve1whXzfDzKg2BWTiLzty04hhNKZbXrcTnh/5zcJwyvA/gOt1JYp/JMmPeNP7U3O+iiRnFNWQEqBIv9y6uQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBPR08MB4523.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39840400004)(396003)(366004)(346002)(316002)(7416002)(186003)(53546011)(16576012)(31696002)(8936002)(5660300002)(956004)(26005)(52116002)(38350700002)(54906003)(8676002)(36756003)(44832011)(66946007)(86362001)(4326008)(2616005)(83380400001)(6916009)(66556008)(66476007)(6486002)(2906002)(36916002)(38100700002)(31686004)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2QxNm5ocmJDR05MenR0SHhudW45eEJzbzRXL1ZYNGltV2NQdDlWbVlMRzRH?=
 =?utf-8?B?TllJWDVpclJkWWx2NVU3UmFiUERVc29pYjNIVHJ2KytXZEV0QmN3V0pvbXBy?=
 =?utf-8?B?b2JKVDhZT0lrN0F3SW5wNnlXQTZzVnljcENJTjIveVc1RGNxOVV6ZFZ2WkhV?=
 =?utf-8?B?ZUpIU2ZPU2V0b2tsS1pLY0F6bFdUNHRXeUJNRXdReUh6RVlSRXA0UHptbXdD?=
 =?utf-8?B?Z1Vwdm5GcVBnZThuZ05OZEtuRzB0MHF5bzhicUpUU2s2UHhBVEVlVHYvMEl4?=
 =?utf-8?B?d08zdU1BaFcyTUcyNlk4VlBVVm1aVFh3TEpqdGIxeFhqd05KakMrdXUxaXRX?=
 =?utf-8?B?aFhuTVRyVWxqYlN0ZmRoNWJGeG5JcUlaWWh5Uk9jbnZ5MmJBUWFiVXJqY0d5?=
 =?utf-8?B?QWhBNWI5MUJpcnY5VURwa0N3eURjcEJLNTVyQ1ZQVXVlSTVxa1RhdmVLWmxz?=
 =?utf-8?B?UFpFRWE5U3RNMm9nQ1J0QXNVTXZYUnlpaUhTZkw3RUdHSFBGQVdSNkUvQjdG?=
 =?utf-8?B?WGFwMys2bUtKM2dFQ1owUzRqSUFxMU1KRzljeFdteVpac1ovbzdZWEtpczZ3?=
 =?utf-8?B?NzhIZ0h5WHlTMDY0NkJBTndvd0JYaVVwQmRqd0paRGNyQWMydmdISnBHUWlT?=
 =?utf-8?B?L0gzZm1qVjhNVWpLVDJ5UERhVnNZK0JUVW1mSXY2Q2U5NFU5aDk1NVFKY25p?=
 =?utf-8?B?TEMydTgvTG9Sdlh3QVVET01VU2VGaWczMDRkcU9nelBzRzFDNVhTWUdkSVRO?=
 =?utf-8?B?ai9kQjNkRkZLNW5UNDArcEU1Z2FwckhFZDNYVi9IVS9nUnhjR0lURDNPaGx0?=
 =?utf-8?B?VXdLNkwyZWRkcExXcFd2dmwzbll4cnRCNUFxckJBWHBZNkppczFmZkZwdk1E?=
 =?utf-8?B?TWxGR3Z6ZXpJaHplNld4a2ROWi9XSDNHb3dTZlkycmd1dHNpdkxLUlR5NUxu?=
 =?utf-8?B?VGhHTkUxemVLTXEwcTFSVVd4Z0dpNGFUSWJrWEZCaWJ5dUZVZWJzcDlPZEJC?=
 =?utf-8?B?SEViNXVCUHJ4bWJWc0gvREkxTU5Wclo5SVIvNzFIaS9waDF4VXJONUFycm1O?=
 =?utf-8?B?N3poWDh0cVZaN3ZRNzJyeFFaSjcxVnZSTDdOYU84aTVSeTNtaHljb1BBMWV2?=
 =?utf-8?B?NGVQbG1OQ1M4OFV3ZUhvbTVBT2ZRbkY2d3NHZTZoS2tzcGFxd0RQSlB2WG1H?=
 =?utf-8?B?Z1FJMFhGNnptS0J5cXZqR0VSNVR5TCtZTThoYXlUUWJheWtqUC8yUmdKVmF1?=
 =?utf-8?B?N3l3bUdrNFlETlRVTlVPbjVvU01WeDdIL1g2LzMvSmFsTWxnd2pxOWJqMm5L?=
 =?utf-8?B?anZJdjZUQUpNQUlXcUJCM1h3VDRvQUlWbjRSbW1pVXE0SGVHRms3SDVuVmxK?=
 =?utf-8?B?V0Y1MFZqMFNvcjJaVDVVR1VjKzAvWm8wZlZwRjBHZ0VSeUhycWxIQ050TVQ4?=
 =?utf-8?B?M2Z2SC9LRFJiaFFFQWR6RExjUno0Sk5UcGd1NVl4S2FHaUZSMHhmS29RalY0?=
 =?utf-8?B?WWlzOFJqTHhYRy9vcVgrYVRmWW9NQit4cElYZ3ZycHhha2pnQ0JKOGtudkRJ?=
 =?utf-8?B?a0RtazZJUy9wYVdhRFFKbUUyVy9vM2RJeWhzOTV4VDVpTDc2cmxRT3dPMXda?=
 =?utf-8?B?S29XSWRoaTdIS2U2VDJEbnhQV1NOR1NDYjBvdzdOTlAwY3NBNTl4bFk3ZStn?=
 =?utf-8?B?bEh2RXA4WmxNaW9adkZKdVZPdkJoWjh5YndhTi9ibmFwUmxTVkdFUDYzaUxE?=
 =?utf-8?Q?XDBQltbd9T3dfnSUd/C5GLpwCE2ue96jSOjXYBg?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d7b0fc-cda4-4180-5c98-08d96b8bdeef
X-MS-Exchange-CrossTenant-AuthSource: DBBPR08MB4523.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 07:57:53.6269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCBUP923q+53Y2CyqjXHXxIBZpE1BFWhNLxYb5xJ8jykhbBAs5RUZ0xo1jx7fMik47fHqPCbHqle/We+0f3BzkKcuyQu/shdI+tNWHK3JYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5403
Cc: sashal@kernel.org, "David S . Miller" <davem@davemloft.net>,
 netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-rk: fix unbalanced
 pm_runtime_enable warnings
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

Hi ChenYu,

On 8/29/21 7:48 PM, Chen-Yu Tsai wrote:
> Hi,
> 
> On Mon, Aug 23, 2021 at 10:39 PM Michael Riesch
> <michael.riesch@wolfvision.net> wrote:
>>
>> This reverts commit 2c896fb02e7f65299646f295a007bda043e0f382
>> "net: stmmac: dwmac-rk: add pd_gmac support for rk3399" and fixes
>> unbalanced pm_runtime_enable warnings.
>>
>> In the commit to be reverted, support for power management was
>> introduced to the Rockchip glue code. Later, power management support
>> was introduced to the stmmac core code, resulting in multiple
>> invocations of pm_runtime_{enable,disable,get_sync,put_sync}.
>>
>> The multiple invocations happen in rk_gmac_powerup and
>> stmmac_{dvr_probe, resume} as well as in rk_gmac_powerdown and
>> stmmac_{dvr_remove, suspend}, respectively, which are always called
>> in conjunction.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> 
> I just found that Ethernet stopped working on my RK3399 devices,
> and I bisected it down to this patch.

Oh dear. First patch in a kernel release for a while and I already break
things.

Cc: Sasha as this patch has just been applied to 5.13-stable.

> The symptom I see is no DHCP responses, either because the request
> isn't getting sent over the wire, or the response isn't getting
> received. The PHY seems to be working correctly.

Unfortunately I don't have any RK3399 hardware. Is this a custom
board/special hardware or something that is readily available in the
shops? Maybe this is a good reason to buy a RK3399 based single-board
computer :-)

I am working on the RK3568 EVB1 and have not encountered faulty
behavior. DHCP works fine and I can boot via NFS. Therefore, not sure
whether I can be much of help in this matter, but in case you want to
discuss this further please do not hesitate to contact me off-list.

> ChenYu

Best regards,
Michael
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
