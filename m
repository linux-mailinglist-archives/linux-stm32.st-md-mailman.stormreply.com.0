Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C08044E9BF
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Nov 2021 16:12:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCF25C5EC74;
	Fri, 12 Nov 2021 15:12:14 +0000 (UTC)
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400134.outbound.protection.outlook.com [40.107.140.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64711C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 15:12:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6emgKYQggOTkV7n7UGbQqkjIClkCdKHCS6wePMx7n+d8TEPOVlnFA0QEpGBOkyJD956ztxNgqTn3VmNSPs5GnV+anWKIb59ZeYFinf9g5AVDhx2ZymelPtpT8QTVakpT9pc6FYro6W9+wGOvUNWdtFeOrS7ZlKg/a/4v1wWQqctonAvYaAOTmmC83lDX0VdjHXiF6W3uzRjjOgffQZd2xJHuNLUhhiUevI0IgmV/8LzVREnBD72qdWAAI7UN5I5MakvitbvoSH3hsQ7DKKgbttAXAmUZLzMEDG4LHrLHOB5vsOy2bkOC+16d3lPb8H5YKuebouOthAVVrs1K4Oozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFLuCopi84+AlwwqIKV2F8VOkXWBFFn2TExIY51Vqpg=;
 b=Ezr6VV7wD/tAwtl1M38rtFstlMUK0a+cXfoO3A8PPp8hACEN57vF4PvsAm6CYMDkyFJasbYkS+P4oh8GviMaxLvXt/Ti3CLRjuxxf5KhJwUu+Tuk3Fbf0U1tlgbScZAhzBq74dGxQJ125NHsVhx1BWqd+5EAS9V7sMjAUVs8ykTBdBBvu/+PQcXotZnIIoHn3xNnn6Gr8CC39OesY7g13u4Qrl6TCT5yeWtkDDLSL9tsoTfrz58FrgGr6pQXGzLi4NK6iUUiTIElem8Iswsy9Mnf8RN0QPCLN9hOkaZyKNpemaiDWhQshtSx+0iciGDXZWjgkq2lWtgeyOhV62WwFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFLuCopi84+AlwwqIKV2F8VOkXWBFFn2TExIY51Vqpg=;
 b=Lkv/QJCwpWsq9cMwZJceFvyRsvPjB2kqUTsHqQGXW5/ACIIeslLDEO/Jcgd+Uo1OkTIr+ik+sGI/j3suD7WFGsIYOMLuq5NlwUtkjyZEHmRtSIMeaydLVdMi61a4eQrxuviialrofY7hUHJ19BFxNSKXPxBm1M2DNpnIZ/ryCc4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5957.jpnprd01.prod.outlook.com (2603:1096:604:d3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Fri, 12 Nov
 2021 15:12:09 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4669.021; Fri, 12 Nov 2021
 15:12:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Thread-Topic: [PATCH v2 3/3] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
 support
Thread-Index: AQHX1kga/bAok/kurkSGky574+HrCav//ngAgAAD7ZA=
Date: Fri, 12 Nov 2021 15:12:09 +0000
Message-ID: <OS0PR01MB592261CFF5DB51DA3B4765BA86959@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211110153142.3451-1-biju.das.jz@bp.renesas.com>
 <20211110153142.3451-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUPYJ8kK2h=WzXw3PTzaGve3c3whoyaE_3kqR4XJbk0Jw@mail.gmail.com>
In-Reply-To: <CAMuHMdUPYJ8kK2h=WzXw3PTzaGve3c3whoyaE_3kqR4XJbk0Jw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4fb2622-b562-4d9a-2fba-08d9a5eecc23
x-ms-traffictypediagnostic: OS3PR01MB5957:
x-microsoft-antispam-prvs: <OS3PR01MB5957CFED45A46BD28695B88886959@OS3PR01MB5957.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VzCl82Fo0E958RVjSH3nSUqoZkIsqXcHlaFBIow0JfYNXK5i41KC42FxNv9Z8vssbGVW+KtBEfxRqS2w6zhRQudHIyC2dGdPLN6TtGDKfYta2/Dt0+AQ626BmnxRLzldFOFAuR4wV5J9CF6iiSu62KjbbMTazi2h2KMFizitGfAAR7klYRpASHnMftYI7d0+RDulNG7uOQQkvyZFzG+RQLgipHTeDRmlB/5Mfl3xAF/fea0sdz2p9h+pKVMDAiGttBWddd+VQqpQJS6EjdZDotX7aT8hThr3Ur27uY/sdVf2JnSJUlGWxj/x71Nydg6b2FOHTNuPkdNPvzA0by6GiqYQCz0g5sI+eL7TiQ7P1IataDhVOJgfoJpMIICXDvwQWLmSPn3YE5lMuczWvFuVWshhzEayQVPX5cqyWBcauUKbBMY0xQLVULKt90fNNcWmiHh0pNy2CdTvqA0nF0erATLLHFJzo8hVdVZuLCBydVai1MyqKcCmLXXNu2Lt6RjOHvHrtQeWlKL9jOvsTpSpNGiLh84NzVnBaCDRQQh0LdArttxPtfmSzIXI9NfRmvoGfQhUnpCOtKNDrZJl62MhzNcfG+6FBIbmNsomf/XEXP3lqAmGdnp/9A7Q50GiY44zzgBNiwX8Yk73eexEz+ENWjojNTA6oe0SEQOjqaIdAgkwI6dh+bw435e4Mergv1nawHdwEa8jY7ss8MO8Cv58ww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(33656002)(38100700002)(4326008)(122000001)(6916009)(508600001)(26005)(5660300002)(66446008)(64756008)(76116006)(7696005)(66556008)(86362001)(66946007)(66476007)(316002)(8676002)(53546011)(6506007)(186003)(2906002)(7416002)(52536014)(9686003)(54906003)(8936002)(55016002)(71200400001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rng3Sk82QmNFV0laemhMRGlmKzRrdkRYZlEyWmFkblJvcGoxVzFpZG9qVnpR?=
 =?utf-8?B?TkQzalorYW5YU0ZJYjhMRVd1R2M3bWVSTWhrTUxSMzdwR3FtVGdFV0U4ZGVK?=
 =?utf-8?B?LzhhZnpvWFB5anI4TFVYaTJIZFlGM1JVYlI0eCsxUlRXRXFDMGNNcFloZTQ5?=
 =?utf-8?B?RVVlZk90TTVXQ0duZWZiTFFQWTFHM3dvYzVCSWc3VDdMZjY2WmFNQ2wydUti?=
 =?utf-8?B?SC8zdTNWQ2d1YTkwVkZvK0ZwUFM1SVloRTVvQVRZczg1VmlnbG5YaDV5cDdh?=
 =?utf-8?B?ZlpsSGFSbVYyejVSV3Q4K1kvMFFjZ3Qza0cwL3R0VkMzMkVVMG50YUlSWnh4?=
 =?utf-8?B?Y3hvajJ2MkNVSjNTOUovRkdXK2JEc3FsQ2RQUEtXeWNLazNkaDY3eTlUNzI4?=
 =?utf-8?B?MXRRY2ZUTU9hazVpQ1F4M2pwLzhPY2tpK3FxK2FRbHU2bzBrMXc5ZGtvMEdG?=
 =?utf-8?B?V21QcEtsTjNySDFpTVYrMmduM0ZMT3dnVXNhaVUrMlgyQmtGeUphQTJKanhH?=
 =?utf-8?B?ZEZIVklNSlBtY1AyNTdmNTQ1Q3Y0MU14RUh6SzBUK2lYdGVZVXpDT2FmVWZL?=
 =?utf-8?B?OWQ1R25qakVvYlNJYndiVEVYZ0lpU2RWbUNWQUdXMEw5K3JaOEFmYUwzd1VP?=
 =?utf-8?B?STZzU2FhamlmdnpyV1laUkJiTDVsZ3VMZG9yUjhFMXMxN1AyUkx4VnlwU1VD?=
 =?utf-8?B?QXA5aFpRRmp5VVozQnBaS3B5T1F5bHRGeG1FSGxYWTRCeVZtb1RpTWZJaG9U?=
 =?utf-8?B?OG9YN0xUaStsTEM3TDliYmRGY0ZseFBLNUlMWVEyVlNqa0F2WWg1dzNZQzFk?=
 =?utf-8?B?M1VjU094VktaaG8wKzAwUGZ2NzNUSTRkazd4dEp5TzY1NFNldW9vc05ZS2FX?=
 =?utf-8?B?aUE5cGJoWXRFRGhzU3l2UXNMQnRzcXI4MEdCMG8xMjY5MEpORUl6K3BiVFll?=
 =?utf-8?B?cUVTc3NiOVpFUEo4ZnFObUVTcVhvQk1nYyt5VUI4QkRyaTE0cStZSWpNaGRv?=
 =?utf-8?B?YSs2Zy9aanh1blZUUEM3VW9WYzYwaURrR29HTCtld3h6VGZHV1IxemFTU3o5?=
 =?utf-8?B?eTF3MEllR3l2TTdjSUdZVkdXcG1VUElpNUFYeVJHM1djOXpFckRyRlVhZVBC?=
 =?utf-8?B?eEhhZmdoeTNpN29uWUxtcXlEa2lacWdkYitpMjFvanErdHM1MFBYdHVsN2Jv?=
 =?utf-8?B?QmNjVHFIOWhEZGdyNWJCTDYwWm0zYWhpRTZHWXRFdzhiRzR2WXNabnVnZzBk?=
 =?utf-8?B?Y05MZzI0cEFFOG5nS1RjRnJveUFnQVVUaWhWMUtKUW1KOTl2YlpFblBvcmx4?=
 =?utf-8?B?MGhiaHUwRE9SY00rd0lYK2lVUGkvcStHcmw1bXNjbXo0S2VZaW5Halp3WnB2?=
 =?utf-8?B?YVE4UEVyYWFTcFNta1p6bjVIRkQ2ZHNaSnFEWmFYZ2QzZE9RdGxjTVk5Ri9j?=
 =?utf-8?B?ZkN1UnY3VFhub09PN1kwQnluOGR5bDc4STd2d0hxNzl4K0JVY1gxQWd5aUo0?=
 =?utf-8?B?a08wWWhSc0NVNWtHNXRsczBKVGovUzhhWStaTVNhMExWQkhVQkJmNnRwcnNH?=
 =?utf-8?B?RHl3eFBrSmhpeDRuK3llTXRtNEIvZjZKaUJVTG9sdTdqRFRtcGk2S0MzK3RK?=
 =?utf-8?B?b2t3bjI3WmZBTk14Y0ptMThyUE1MRDVTay82aUNVM2tMSmhabVZaWUxOU1BS?=
 =?utf-8?B?aWp3NVZUUlBmN0Z6V2xSVUhOTG9nMG5yN2tzSkFGNlVNWlhPbHJ2SzBQQWxQ?=
 =?utf-8?B?M1NHME96VVJoNG1WVnRuU2VoQi9ueHQ5TUswTTZ6LzRTMzh2YkIwSHo3ZWJC?=
 =?utf-8?B?RlZWOXBDODlNRGIvdzlWdytJWXQ2UkJPQ1ZLanNWTU9rODFFcU9DeVQzN0du?=
 =?utf-8?B?eXk3MTA5dkNzZVpla0NIaElyUkVIVWJ5M01ta0NtN3ovM3d6Q2E4Z3Bwdkpx?=
 =?utf-8?B?NWIxQm02dGRoVVFhSlhJUUZ6cEZRTzVvbzN6L2dISWlBdzVRRStKRTJOTDJZ?=
 =?utf-8?B?d0xJbjF0RjJuMVJYYkptdFRsYkVFcVVrTEpsSW5XVU5RTCs3WkFTeC9kOFBL?=
 =?utf-8?B?ZEIzaU5FVzRsZkFxbDRlTXlGZUU1TjBxZitvQVhsUS9rTDdrT3R1UDNtck9R?=
 =?utf-8?B?dGNWUVpWa0VGNzlvcFRBR1VnM2Q5N2NDQi9YdHlGNVA2MXlVYkEwTGZ6bENT?=
 =?utf-8?B?WjRkQS9MM1FIMU9BNnZCWnFaRTFsUURVWXBabjJ0TnZyVFpkWTZOQmR6ekp5?=
 =?utf-8?B?Q2R1Z3FaMXRlKzdNOWIxWE9VRGJ3PT0=?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4fb2622-b562-4d9a-2fba-08d9a5eecc23
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2021 15:12:09.3312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TAhaQFTmVPtqkel5kNd+Zi3pQ4k9jtqncY+cSLFRKvCe4toSe9FAeixrBa5KEY7ZDDBYujZSQQxmujAp82/637zTSP9p5HJA5+A5nBCsdpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5957
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] clocksource/drivers/renesas-ostm:
 Add RZ/G2L OSTM support
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

Hi Geert,

Thanks for the feedback.

> Subject: Re: [PATCH v2 3/3] clocksource/drivers/renesas-ostm: Add RZ/G2L
> OSTM support
> 
> Hi Biju,
> 
> On Wed, Nov 10, 2021 at 4:32 PM Biju Das <biju.das.jz@bp.renesas.com>
> wrote:
> > RZ/G2L SoC has Generic Timer Module(a.k.a OSTM) which needs to
> > deassert the reset line before accessing any registers.
> >
> > This patch adds an entry point for RZ/G2L so that we can deassert the
> > reset line in probe callback.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/clocksource/renesas-ostm.c
> > +++ b/drivers/clocksource/renesas-ostm.c
> 
> > @@ -166,6 +169,14 @@ static int __init ostm_init(struct device_node *np)
> >         if (!to)
> >                 return -ENOMEM;
> >
> > +       rstc = of_reset_control_get_optional_exclusive(np, NULL);
> > +       if (IS_ERR(rstc)) {
> > +               ret = PTR_ERR(rstc);
> > +               goto err_free;
> > +       }
> > +
> > +       reset_control_deassert(rstc);
> > +
> >         to->flags = TIMER_OF_BASE | TIMER_OF_CLOCK;
> >         if (system_clock) {
> >                 /*
> > @@ -178,7 +189,7 @@ static int __init ostm_init(struct device_node
> > *np)
> >
> >         ret = timer_of_init(np, to);
> >         if (ret)
> > -               goto err_free;
> > +               goto err_reset;
> >
> >         /*
> >          * First probed device will be used as system clocksource. Any
> > @@ -203,9 +214,33 @@ static int __init ostm_init(struct device_node
> > *np)
> >
> >  err_cleanup:
> >         timer_of_cleanup(to);
> > +err_reset:
> > +       reset_control_assert(rstc);
> 
> Missing reset_control_put(rstc).

Oops. Missed it. Will fix it in next version

Regards,
Biju

> 
> >  err_free:
> >         kfree(to);
> >         return ret;
> >  }
> >
> >  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> > +
> > +#ifdef CONFIG_ARCH_R9A07G044
> > +static int __init ostm_probe(struct platform_device *pdev) {
> > +       struct device *dev = &pdev->dev;
> > +
> > +       return ostm_init(dev->of_node); }
> > +
> > +static const struct of_device_id ostm_of_table[] = {
> > +       { .compatible = "renesas,ostm", },
> > +       { /* sentinel */ }
> > +};
> > +
> > +static struct platform_driver ostm_device_driver = {
> > +       .driver = {
> > +               .name = "renesas_ostm",
> > +               .of_match_table = of_match_ptr(ostm_of_table),
> 
> .suppress_bind_attrs = true?
> 
> > +       },
> > +};
> > +builtin_platform_driver_probe(ostm_device_driver, ostm_probe); #endif
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-
> m68k.org
> 
> In personal conversations with technical people, I call myself a hacker.
> But when I'm talking to journalists I just say "programmer" or something
> like that.
>                                 -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
