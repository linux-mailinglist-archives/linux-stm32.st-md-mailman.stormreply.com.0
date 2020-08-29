Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F24256A5F
	for <lists+linux-stm32@lfdr.de>; Sat, 29 Aug 2020 23:28:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CDA2C32EA5;
	Sat, 29 Aug 2020 21:28:40 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50106.outbound.protection.outlook.com [40.107.5.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2800C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Aug 2020 21:28:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qkp8yiRbau2QGMvLwYHikux46HblOa+eXnGoWcO/3PE5PEAcXrxTO5igNhxvvGKG/Wke9imI+YPznLn/Zfnfbz8LpE0MkODBjNnlJcLYTnb9Q1HPVjLHWzRZReCUjV2oRhrfDlWd7K1tCNC+ubn6PQs19oE+n95X+W9+AOvRDbksNOtpJ75pphzrRCItbEOx1qL58c9FOU/6Hs5T8f4XcL+LAU23A7B4MFHpBOHL7BlMD0YDLDsz6jf+f2jyyiWpgy9kSd5nCUvIEAN74HQ4yJEw5lXObf9uVXmpR9XLXnt2f5B514tfi+3Z+FMqS7/8J3ggN+T7g/Nutef8P4aXWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqpl+nABph0YIq0iXwPG8VDSjKnqOV3xxQs53IHO0r8=;
 b=L49/Yxzt3bUPgR3dkp/+SAIpICeKcwpFcOQ6MMxbUHruQkcn9ZiWV8QpLnKl0gRowRyzSm6GDNs1KpccxOcxQNcE93605wV4LWraIjo7/jkIdTfDM7yR1h8/D+DQZkXG46xMTfYsb1/FE/BeeqVzcLRQJpKwSpGThr8f+hBbvVbS0d1ffk/fe4OpPMiIfYjHFAU4UIcDNpwQnDYKKUJcSv7C7+e71UwqqxZ4BCq8SOopkBSuS9Hab/rPgD/V5wD4sw1s4COW7sDuqRHO8IZ4eOYgt3KCPQftOAPC3+AX5Ln7iZBdWGwv+zFSFKQ0apS5boXZSWFc63Y2k/Gz305SPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqpl+nABph0YIq0iXwPG8VDSjKnqOV3xxQs53IHO0r8=;
 b=GXtMcPYyE3CKC8M/CoV9QjnF+x5nUWe8wIPHY3wIfLEHEte7Li4Sk4aCfcAqW5rJaiTNJpWENDQkR04nrzrbD4am6Hdf7skGWvjhjnCKmjzS6fsJe+TxOe07hfrMaSC8dJR/R3klbAjo/ef9Y5A/nhl877wL7yHwuI5GEhkTpg8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DBAPR02MB6294.eurprd02.prod.outlook.com (2603:10a6:10:197::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Sat, 29 Aug
 2020 21:28:33 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::3890:7b1:97a6:1e47]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::3890:7b1:97a6:1e47%7]) with mapi id 15.20.3326.023; Sat, 29 Aug 2020
 21:28:33 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20200829064726.26268-1-krzk@kernel.org>
 <20200829064726.26268-3-krzk@kernel.org>
From: Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <4a64c3a5-57d5-dc01-5620-e28dbe544ac4@axentia.se>
Date: Sat, 29 Aug 2020 23:28:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20200829064726.26268-3-krzk@kernel.org>
Content-Language: sv-SE
X-ClientProxiedBy: HE1PR07CA0013.eurprd07.prod.outlook.com
 (2603:10a6:7:67::23) To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.226.217.78) by
 HE1PR07CA0013.eurprd07.prod.outlook.com (2603:10a6:7:67::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.5 via Frontend Transport; Sat, 29 Aug 2020 21:28:32 +0000
X-Originating-IP: [85.226.217.78]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91a9dbac-2b4e-4149-a795-08d84c627b67
X-MS-TrafficTypeDiagnostic: DBAPR02MB6294:
X-Microsoft-Antispam-PRVS: <DBAPR02MB6294CF615C876AA8DA98AAA6BC530@DBAPR02MB6294.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ctPCi8hbj0s0qrX/9yUbMiG2yLcYvgLLBn/xEhN15wFCNJT9XJ/6S4UnTnFUlCaJWCrVlRtOVtbaogrJk1/n59zKNgEudvjBKhvfBRcKb3KV+ItOSEkL8QEkc0yOOw6air7mVoAmc9iM6MHJLRAx+pTpwCXOqWJjiQEdufleJbu7M0sAM6UzX97whs6uimfgvW4jXHA3KKAYgvmSyj+Ik2+NnAwLBWgrRpR8AaypJ1MTR6nw205WVe1dJ2eo/v8FdfPZbKiUM7sKSSdagtnq/Scd8DDs65f5fW4PWkaSRwUtRRsPXLhiBs0LnY/eEF+ZUJoQFUkbjoiPUL9SK3DHf499nzwph6oQ/Jw8Jre6RgOUVAZ54djTW/AA84VRG29Bm6XV4gh+DAL1Hv0RnyQyiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR02MB5482.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(396003)(346002)(136003)(39830400003)(6666004)(7416002)(83380400001)(86362001)(16576012)(316002)(110136005)(6486002)(956004)(36756003)(478600001)(31696002)(2616005)(4744005)(4326008)(16526019)(186003)(8676002)(26005)(66946007)(8936002)(36916002)(5660300002)(52116002)(53546011)(2906002)(31686004)(66556008)(66476007)(921003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: HWLVjc+VlHW1PgkzSK78Rrij58HIXCbdPmeWUmRd0UNAvaLpOGNf51Jrh2QuB2dMyq3pdS/QrBRo0JG790l+bJ7HUxMvAUp678K/Ureg6Vd5pNyVYeOl/p/WxybGTMhEfhxTbE6NJiWWGisjEiIo0a8twviuWqIma9HeiAHCNvbFD2sYUWaGZNV9gEp3kZ8jG0o9dwVR5mfN8MR4Y2L7+EcaWTvTg7QFFEaI1igycGJDjOBYzw0FQXVR9q9CboBbSl8o8Q4TDgjYzPvn8NWjfsrnbXL9rjXK6zJlHYg+MlWy/AseG0k4VrkmdQWmXiAlP1UAkC/flNxg0gcDKwn3w/nR8Bn0EWZJTw3VIV1lNWRM0rSYpainYKkh9q+7uE2Ysjgt+mjCxTH7ekwAv3vpE1LkBnJmHMoIVSD+NnRj/4V9BBLzIvBwolGavLukAx3Ea+H1vGQ5Y7h+SR/kPFZw+EnDTV1auLhej5KqbcNW70Mom+Sd5ACr19iN5Nom7FjrmSBCNMFH2e9JZ+C/AZvAo25qooOQnmNVlPi+1ZdR/1AlQIJo/fpog7fC0IwqCrg1d4X7GMFeTR3gfHPZjyD7Iz0r2fkf62ctU3mqIC4KfM7waGfTXv+4CXQq+JYd+m8EQryG8im6/ieHnUXqfs+umw==
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a9dbac-2b4e-4149-a795-08d84c627b67
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2020 21:28:33.6740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c28KSX2dX7vJnaeO2hM8RE/sSx8Vi5TU8zTQuuFaAe/ZgJ1DDWSxT5kIdiGIeIBl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6294
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 03/18] iio: adc: envelope-detector:
 Simplify with dev_err_probe()
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

On 2020-08-29 08:47, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thanks for the re-spin.

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
