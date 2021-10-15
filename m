Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF52D42EF27
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Oct 2021 12:53:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74632C5C841;
	Fri, 15 Oct 2021 10:53:57 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA363C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Oct 2021 10:53:55 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com
 [10.192.0.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2882E45FE6;
 Fri, 15 Oct 2021 10:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1634295234; bh=N67EYYsKkQ5KlgZnZ9VdNhyNuIwsWR8y4YekWVG/B+8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=BGfHzWuNUaJZXJ6ztAJBqUpd6QrjPbtLEtA7YZwfyJ3MMB4fc2aGmowMURdmHVb4N
 +wMLMfvvWo9ygBXoMJmphc8NkGHYLfidbZt1I4LRnqj2TsuxaDcfEJo7zjhoVCad9S
 tsyZvASKdw+oPA+JzyMi9jU+iDWrDxw1OTBEzhmf4x19bMokqs4yBYA3p542O3ZYkL
 Dgmp3jWIN6EUL96Wu+OVlQgU56xfW0Wf+yXYAKp7eZWZPCTY0b8sYVAFOPWx7MCsBe
 YBttIOgIjT7Jl7Oc1WMPF7BKBc9y359TCTyGZWgkk+if6CO9UuCDypvLCesOSIfhSF
 xuqykstxUmoWw==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com
 [10.4.161.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 59CAAA025A;
 Fri, 15 Oct 2021 10:53:52 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 49E9C80037;
 Fri, 15 Oct 2021 10:53:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="XVKBcd2S";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaObr8obbmUVgy1AQELXJsdeIESNanqYpTojSpHcfzc0K4KZbkRHjT2w2Uj7FeMbYSCEsT6z/87S0u36N0wMKmTzQFjhDXBdYDubX8QLV5gn0srnaoi6H1nlRFTwEWdbnGM2x/uWf8DdtiGRvL81MAgdxQo8SysbTe5NThrfI92XClEzTxjRj1/RsXXOmRsg6JvxHHJJc7HE7rFpoE6yWjNXm318EnIdB3flQmhpv6CvWKdGU/DC5zWpj+NdPTmSWojum8j4Un8TOTubL2DNPOinh9lLSUw2zhmAYh8JoRCkP7WdiSYKNu+mqyS/zuxNb0sTQulmaqQDOmefDrd0Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N67EYYsKkQ5KlgZnZ9VdNhyNuIwsWR8y4YekWVG/B+8=;
 b=EdqEGQJz+cNRM6pycHMxoX/JzrCuoyPYkG2tiazuIh7hIl7vr5LhCNggt5+hwqltQYx+0WVM2Uy5kvuZhwuAf+1lqwO6IkamfRx2iyM+1KO2si+q8WkJeqndoTZyKVJPUnIO4YykJof9/2PejsS7zc+w81wPvURCow/DM3RT38DMtOhFQf7SN7Gh0j2SiB+spYAQ8RXYaLwv+lEk6zqEUtF0EpBB4mUFSNSujH4nXoliJojJdPYH9sazjwvH3WfLkDEn8WaSSqTBE152VfMoptYzX37xCBffQZeynxsJqVf/rkg0itgm+N8R89Di5rQxpDNHNWbjcgIAPATcHHZxfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N67EYYsKkQ5KlgZnZ9VdNhyNuIwsWR8y4YekWVG/B+8=;
 b=XVKBcd2SVUKksSa9dSOdblHaHR6CW7xhntB1MStGFwL/a7xveVx7LkR+wDHwm4QuqlC8GfR+IFmIiOujK1fWiPsdxa6pGmGnjT/ni2Qov6yvUyLSb3M1eophEbMDRBMTwMWZiBx6ggA6KUJpU+0Q5t44QzMCKq07IrpSCNREQoc=
Received: from BN9PR12MB5383.namprd12.prod.outlook.com (2603:10b6:408:104::7)
 by BN9PR12MB5226.namprd12.prod.outlook.com (2603:10b6:408:11f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14; Fri, 15 Oct
 2021 10:53:49 +0000
Received: from BN9PR12MB5383.namprd12.prod.outlook.com
 ([fe80::88fd:96ac:c734:b363]) by BN9PR12MB5383.namprd12.prod.outlook.com
 ([fe80::88fd:96ac:c734:b363%3]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 10:53:49 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH 1/3] usb: dwc2: drd: fix dwc2_force_mode call in
 dwc2_ovr_init
Thread-Index: AQHXuc7cOomckwCOdE2+pMQsJJAXb6vT8kCA
Date: Fri, 15 Oct 2021 10:53:49 +0000
Message-ID: <2e129f26-62a7-cb13-2d6c-ba9aac325a5e@synopsys.com>
References: <20211005095305.66397-1-amelie.delaunay@foss.st.com>
 <20211005095305.66397-2-amelie.delaunay@foss.st.com>
In-Reply-To: <20211005095305.66397-2-amelie.delaunay@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: foss.st.com; dkim=none (message not signed)
 header.d=none;foss.st.com; dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa625b0c-6331-4ac3-5c4c-08d98fca11de
x-ms-traffictypediagnostic: BN9PR12MB5226:
x-microsoft-antispam-prvs: <BN9PR12MB522644E6C1646D20B6F4A6FAA7B99@BN9PR12MB5226.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a/u6z0IodfpVEP+5y4L7N3FN+ud4tMszpw9J6p2Y82QYtbju7XYwln3CwSNVri6gVngR86vFiJfzyHXYj+F/QdRoz8yj+Yi+Mwl2tDFvzBEvCDZshivrtHfz7Q1aCSgRC3XgiwBDYE61cq50WYmQh0zRTQevoaCXOTZUdGZ1/WLrlR7gEktwAmkyUtuqaXqoFN72eI9zh630nZ+En6i+jtgcmaZhcJq6f17ZRYCT/Y9vR4I/v1436E7zgAp9NUFo5VAnYLZgkWaZrE44ky0+pOVCL3afBdZSwNhYYbc3GYavVOfDn8aLt66+08xhe4WdwTpMqTdA9oun2z9PKUNuztHaAHfX03o0GLNu5h9XAqYvHw6sxaL7woghe0z0f6bMHk2Qo1Z0aqFssO3EsU8a+OqgBGhJtqfa2XQFDTznqage7YL2TmRFfuhF6K2k9IIuEx5NEiONjkWVrPBMNUcUQtD2Vl5lPW9AOy4XvCYP+0I2DHeVC05cB6efE8U6qo6WuZm4evRMGw62piSAoia/vdjMafLGcDPUMRAMMpqOjY9s1lrh01/x7g5Y7uNYDZsKEzGA9RfVG8tb03Vl9CFudpp65pytrKDOzte2Z7npNCRvP/eszJsQjf9wHWDR0xP9SCCBvbpAMO4Mtj2y7CD7+zBLKwLD5cTGvBD+WGMTmJd1UnerChz1904bLH5auD24bMqrgFpUUbKDWmq7V7WR+kcwCqB4Eur58NkOH4a8qO5FatIIZQlFQ7JyHBGa8SHG+jy8FBOyE+FI/V0JDJ9Rew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5383.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(53546011)(508600001)(5660300002)(66946007)(76116006)(91956017)(6512007)(31686004)(186003)(31696002)(122000001)(38100700002)(4326008)(83380400001)(26005)(316002)(36756003)(66556008)(8936002)(66446008)(64756008)(66476007)(2616005)(2906002)(38070700005)(110136005)(71200400001)(86362001)(54906003)(8676002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlVKVzdMM01RYWF6RUdEc0NlcS9wcUFRMXQ3aDYwZFRhT2c5NEl2MWNOZU8y?=
 =?utf-8?B?TXYwbjVycXZxbTN3NG5FZlVSNDFrcEhEWml5UEhIT1VzeGpJUzhmWWlTZTMv?=
 =?utf-8?B?RUZlL29iUm80QUNYZFRjZFJMemgwbnc2QWlIRDNWbHJDVmxndkZjdklqK016?=
 =?utf-8?B?dzhwU3ZVaXZSLzlZZytlS0xQSmZvU202alNaWUZuTndkTHgvWFVKK0VqZjBC?=
 =?utf-8?B?cDcwV1BtakVtSkswVFh4enNjMFM1cHViZENSWkUxN1pWT2xqZmdqTFkraG0x?=
 =?utf-8?B?bVM5c0djUlM1U0lZWkVxVEpjUVdhMm1BckxkV1Z5VGtLZGJoaDBLQUJ4UlVm?=
 =?utf-8?B?V0k2VEVGbklTWnM0aGNJeTRBd1dXYkxKYUU0bmVJUnB1SEtxQ0lVeHBXcjI5?=
 =?utf-8?B?SkpiaXdQbWNQem9ZaDAwUlN5YXloQzc0aDI3RzFjY3BCdEJCTTNZZ0RjUW80?=
 =?utf-8?B?T1B1MzZOWEt6SnY5SjJqOWo2alRsL0ZtQkFYZ3lRTXVNZUx2bjlpZGRqUkc4?=
 =?utf-8?B?VVNmeGpZTmMwaDU2ckxpRzFoUTJuVStzQTdFMDlyc1luQXV3NnRNWlNTd25D?=
 =?utf-8?B?ODV4V3VtYzNFeW96N05JcCtiTlg2ai8xWEZMQmF1S2xyblFiU1ZzaE9neS82?=
 =?utf-8?B?NVhHUklKakttSjZXb3g0ODRDZkVjVVhOT2lWV0E5d1NJa0xCTXFmZGl4T3Y5?=
 =?utf-8?B?YUpBRDVGOGRSRGM0eks2S1FFU3JIeWZ6bVlIZGc3MjlpeUVSeTZGMi9JMjJi?=
 =?utf-8?B?TGpzZkpLYXNkRTFzdFltSWkzUHNLMW8zeVpEWGVpdDJqdTJyNkhlZ3dZMjc5?=
 =?utf-8?B?dHg5eHB0VDAyamVrNWRHSktrZUFKMWN2YzN1WUNtTndLZlhlVHdqdHB3TVRj?=
 =?utf-8?B?bWVBanZlVFBLV3NzNnkyK1ZvNzhZclNnMkhhcUxyNVBieHdLdDV1dU16T2Zr?=
 =?utf-8?B?bThuck5IMDN0bTFGQlpkbFRLSVYzQisvc21qVWprMXk2TnA3QmErNjJtVDh0?=
 =?utf-8?B?VGlpNWJnWEV6aC9kUUFBRjhZc0ZIY0lKdjR0NThLSWV6NWJ0Lzlld1BPNzlQ?=
 =?utf-8?B?azc2T3lHSWM4N2R1Tk9aTWRrSXFhZ2EveWdOWnJaclN3WjJPbkNHTjRtVEdx?=
 =?utf-8?B?MENKcU1hODd0N2d6VVBWRVlQaTI3TzdVVzhJVExXcVRBVGtkaHprdXZMUlBY?=
 =?utf-8?B?d0U1eVhvZXN6aWxRL2k0NEttQTJKNEF4Y1U0WUVPRnY3WGViOCtGTXgyYTBH?=
 =?utf-8?B?WDZwWklLZWxCd1d4QkZmaVJrVU1KeFFzcjV5QkVQb1pyeHltS09UOXRnQUFy?=
 =?utf-8?B?VkJrbS9uTlNEKzRDVThHME5IMWVINjNzSnVteEgyeldFbUIrQzFyaDZldHZY?=
 =?utf-8?B?ZjQ3WGJxNEo0Wk1heU91UnJQN0YzUXhIdERaWlJSb0hzbkloQ2Yva1BoUjhy?=
 =?utf-8?B?b29oenJnNjk2MS9TdGRnMkplK0kyUFJuWlEwdE1GSWNRTDJWRVF1TUFPUFUw?=
 =?utf-8?B?Qk5jQjVtRGNHY2V4aE5QSnlxam5LYUNMQU03VVVjMTlsRG11QXdKNG9leTVY?=
 =?utf-8?B?VTFnUXB2dTRiS1FhWkJlcE4rSjhvZHlqQ2tiUFh5dzdZZHJTbmd2RmxJaHR3?=
 =?utf-8?B?ZnhwZE5tY2pyeEhhODZrMVZHZ2s5eTFMZEpMcDVEZ29hZ1ArMHhIQXZ2SXMv?=
 =?utf-8?B?R1hjL3JJZExQelNPZ2tYUXFmM1BJZmZVYzFzY0Rsb1NOemZ2ZXBYNUVGMU5h?=
 =?utf-8?Q?5kPDYqHid0ZYIWA9Us=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <BC12A2A0D6E58F4187535A9AB9691D13@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5383.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa625b0c-6331-4ac3-5c4c-08d98fca11de
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2021 10:53:49.4352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GMwJq2652dVeyjWdOpThKgPbuqFSksRaDGSVxQb6EftP4Xqkp1PBOuG4PU4Ujk7qQtilJjBuLXPD2pcZ8ynvIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5226
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH 1/3] usb: dwc2: drd: fix dwc2_force_mode
 call in dwc2_ovr_init
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

On 10/5/2021 1:53 PM, Amelie Delaunay wrote:
> Instead of forcing the role to Device, check the dr_mode configuration.
> If the core is Host only, force the mode to Host, this to avoid the
> dwc2_force_mode warning:
> WARNING: CPU: 1 PID: 21 at drivers/usb/dwc2/core.c:615 dwc2_drd_init+0x104/0x17c
> 
> When forcing mode to Host, dwc2_force_mode may sleep the time the host
> role is applied. To avoid sleeping while atomic context, move the call
> to dwc2_force_mode after spin_unlock_irqrestore. It is safe, as
> interrupts are not yet unmasked here.
> 
> Fixes: 17f934024e84 ("usb: dwc2: override PHY input signals with usb role switch support")
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

Acked-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>

> ---
>   drivers/usb/dwc2/drd.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
> index 2d4176f5788e..80eae88d76dd 100644
> --- a/drivers/usb/dwc2/drd.c
> +++ b/drivers/usb/dwc2/drd.c
> @@ -25,9 +25,9 @@ static void dwc2_ovr_init(struct dwc2_hsotg *hsotg)
>   	gotgctl &= ~(GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL);
>   	dwc2_writel(hsotg, gotgctl, GOTGCTL);
>   
> -	dwc2_force_mode(hsotg, false);
> -
>   	spin_unlock_irqrestore(&hsotg->lock, flags);
> +
> +	dwc2_force_mode(hsotg, (hsotg->dr_mode == USB_DR_MODE_HOST));
>   }
>   
>   static int dwc2_ovr_avalid(struct dwc2_hsotg *hsotg, bool valid)
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
