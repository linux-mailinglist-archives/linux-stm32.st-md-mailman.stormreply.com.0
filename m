Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 810B146BCB0
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Dec 2021 14:32:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E495C5F1E8;
	Tue,  7 Dec 2021 13:32:39 +0000 (UTC)
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A30A7C597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Dec 2021 13:32:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lC96WDSt2c55jHRR3sAdnyheeD17WyI6OgMqUU1GYa92mNOHrga5OACZJY3nJdMn3htUqCf5sfXircS51UzApc0HEe304TV1yGX/dDKsy64nuKNiGwlsVt7vk047uR4TF2C6aEfQf0HakcsfyjCenLw6lvB1lJeXSATAgDQnVNm8flBUOt3N3EN6fjP+uMnpU3mWESWYV6oFUYm4W6ZpqzyzVS4OyK4kKvhmswJC+0Kk5kyPsZuB550hDv0BgAjMsNRt3MjnXp/2hhSnGNeZIFM2KS49bUgK1SlYiDv0tp9YRzIxB0tWgo0qxfO6KN51/bzcCqzc9hKEejC8FcW9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vec0ePLPFW3HOIy0l5tVgAwH4I6lIPn3462hWECxHpE=;
 b=UNcl4u79UZUgA8UeYxVxz9bPIYQ1L3fjLbjIP9PhpsnJ1C3lLteeadqTeBwQLMzy65T6sjrW5mgrnCKT6nmjtP1F606bLvEbq2fdv6cD188GPRwcEIJ4ovALooa3hV+xzTfFFoqE46YWbJmy9JZQ7B5SWkA7cGY2XvOTj+eZ4Mw6KTqav7CgQD3y9UszOTd1CJvMX1329zS3R4NetN1WH+Z7n12HaN/09IgO9vKUkBKLbzXwNzAJ3a1UWWk/Gi/FkwjkHmFRSttK36vdp59i1b2kp953oaZgQmGJXjI0YKiGw2gRl66bbnLBaS7laApozI6Z5FZGt1gdUxD42zenRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vec0ePLPFW3HOIy0l5tVgAwH4I6lIPn3462hWECxHpE=;
 b=PAh+lLjHuuGlQM0M7Ub6bWn5dk44w9XpGiE7+k0+yMJl1rubbpu5RG2f0kaRk4hzuyGuJDTcLAfCLu2LGf4USjGssD1gmMiOK5bWI7oqx9kjG/JWKyxYyVeUvECNoI6hfoJBMD2pywwHE430nMV97R8RRvfHtY4svr5DJ2O652c=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB7035.jpnprd01.prod.outlook.com (2603:1096:604:13c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.15; Tue, 7 Dec
 2021 13:32:32 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 13:32:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>
Thread-Topic: [PATCH v3 3/4] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
 support
Thread-Index: AQHX1/VTNGOVE1u5M0uN8s5g60zIn6waXgOAgAAB8vCAAARVgIAMyDSQ
Date: Tue, 7 Dec 2021 13:32:30 +0000
Message-ID: <OS0PR01MB5922A0170D05F9930F848C2E866E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
 <20211112184413.4391-4-biju.das.jz@bp.renesas.com>
 <c4869451-e879-aa58-29ba-ef3e94b03527@linaro.org>
 <OS0PR01MB592240481D7503FFC505BD5E86669@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUE3A0WwhGYpVK52S0C5xMqccpvHp0hHdnqq3aawzb7DQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUE3A0WwhGYpVK52S0C5xMqccpvHp0hHdnqq3aawzb7DQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1525354a-b2ae-4feb-3520-08d9b98604e0
x-ms-traffictypediagnostic: OSZPR01MB7035:EE_
x-microsoft-antispam-prvs: <OSZPR01MB7035C7CD668D41569313E4EB866E9@OSZPR01MB7035.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EHCRu+mHuSp6I0cHYOfON6EBS3FXXOno/FaqUK+URhLrzzvv+KuLmgZmINqIAnHD/j8sMf10Y3zSFa6O27LO53KOuOWy2Jgtfte6Xd5IFCp5+WYPIztnEW8fgG2TPTp+fHLEvfbero975HCpwnRdQFzeinA/GDjsyui9zvdLkzG8+GqBsjCgs6FasjKcwQ1szgSuokaiTO3QOqPWUU3T8JLMZmSXerxjK4byoAj4YEFcpNKy4GUoiru2vDZpTQ+DKlp0j/6TZmCgvRczcC631JXvt/769YXaDtj9GC27RXAPj1RVJl6KxFmCcU3QoUqFK/G8p8DFiyXbW3iysLBSSfiajSBzDVBZjWqEyT+K+rcrdZSMxvPHMMpxDoWs4fkWp9Mse+kbiAHEoyd4GIk9rGz+iMCQnH/u8ZyrputbU6WwWwL46rW1aPri1OOHhSwbuNazQsBJP4BoTLhmvE2fv7z4IZWQufmJmNK30ib35KGkf9UGl2q31Wv7+aARRu6+WAfF6Un71ygjqyNG8CDt45ouaTb1/9XDxN7dNegjFRQif3yzdXbMIlDQR/NUoca2lbURmcq299Dh+C5+n8S+xOwTqvcM3EsREYMfqy7iEfg+iDiJkDbmoW6di2j7mA5Ni1UpOUNLilOWPlDszt4GlDDv82sCGsobMvAyDzBjKFS3QvBzMh3GwKZX5ON5jTIUauK4LjiFjYUbRY/YvrS4kOBkLT/hK+iUkN1wHm9c/KClADaQ/lFY34O0mqagHAd85v+ukvzN5rdghXfISmxHAn53lg5OUKgjF54RyBDLF8Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(26005)(508600001)(186003)(52536014)(8936002)(53546011)(122000001)(64756008)(66446008)(9686003)(66946007)(76116006)(66476007)(66556008)(8676002)(5660300002)(71200400001)(6506007)(33656002)(966005)(2906002)(4326008)(316002)(54906003)(110136005)(86362001)(7696005)(83380400001)(55016003)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WURkQ21iK3ozM0VhOGt2QnRHUDU2UWkvRE9YSXdZK1M3ZkhRZGVrZjI2RWs2?=
 =?utf-8?B?NFhwaUYvWi90YW5DSS90K3ZQVmVMUm8xbHF2TjB3MmhUbjkxT3NVNDIwRSsx?=
 =?utf-8?B?elphVG51NVYrL0VVTnlhNFJncTMrNTF0Y2Y1cVQ3ZWJhbHZPSnhwMmtZSzRI?=
 =?utf-8?B?ejNROUlEZ1REQUtyMCtkT08yeEdTamxxS0Q0cFloV09icVNNMDBncDJqaXVD?=
 =?utf-8?B?bFVSUHVGVzJjT3Q0dHo1eHlXelJXRmM5a2JtbWpjZjFobmY1OERlZlYvdmty?=
 =?utf-8?B?eHZFOXo0YjI0KzJsYUlJSC9sNFZLdUpuYWoyZVN3TWpJVmg5Rkp3d21yTXQ3?=
 =?utf-8?B?WlN0bTVjekd6R2VLclR4a1Jtb2hKSTAxTGpiaWR5dVlWUHlWQWZzaWwzYXJQ?=
 =?utf-8?B?RFNHUUFLSVAwWUhoZ2ZKZlY3NlBHZFE1Vjl3L3RDbTZ6VnFUVFRXcExIQjJa?=
 =?utf-8?B?dUxLemdxUURjaG80N0k3M0ttNW9kR1RUREViUkROM2lEai9Uc1hYWGR0TENZ?=
 =?utf-8?B?U2dnZWk4NFRxRU1kSDRWQlZub0lyUHNHOC9oN0lueVRkYzRtdkYrV3UyTHJr?=
 =?utf-8?B?TUh3ck02MVZoNWk0cTBKVmVxeml5VmZ3a2k4S3JXbU1BdGJSajRtQ1dLbFRZ?=
 =?utf-8?B?Yjhic1VHQWZ6M2pObVRCRER0NFljYUdlL2lJcEZpUVpRaEpsbHJoRUV2c1RH?=
 =?utf-8?B?UWllMTNRZ01XSXhubzF6QTVLQTYxMlg3Yk5CVlhOV0dQVXBTRWNnWWJrVThw?=
 =?utf-8?B?N2JWREMzNmhOZVJwemhBRHQvNGNIM0RqeTZQTGRvL013VXNLMlNKYlI1ZnJ3?=
 =?utf-8?B?Nk4vM3ozbkhRaFFCYmhySi9BZ0FyRUd6NVlzZWtIS2Y0R1dEWENCc0w2YzRr?=
 =?utf-8?B?eFZDbGMxL044RnQ4L2p5WW9TenIzKzdwSlV5WjdMcFEvaDlyOFJ5aHRuTzlG?=
 =?utf-8?B?d05jK0dON2VvZk40cmNRRDA4d0tkY2Rxa0puc3hJb3JDRStCbkE1dVFVNTVw?=
 =?utf-8?B?aElHUWJkV0V3M3I1Z1VoQTRVekoxT3pSbk15bERFN3BnWUVzYkgxS1NVUExO?=
 =?utf-8?B?ajZTN1VBUTI4MlBlRzdEbjJETzJUNFJ3U1FOZEhqMDNpV0RWZXZHOHdKMHZG?=
 =?utf-8?B?K2NMNllza0JZQStXZWsrRkYyMGVoV2g4Zm9QdllOczA3cVF6WHcyT0FadFZB?=
 =?utf-8?B?ZWpsWm1DbG4zRk1QRGpLRW1jbGh1RkhwYm05VkVHMmthaERUREZaTys5eE52?=
 =?utf-8?B?SndxellvQkhReHEvSzRnbVNqSVRkU09adVpXZjIvdG5vVDkvcUpTQUhqOXdW?=
 =?utf-8?B?ZHB2S3V5T1pXMGhZWDFFdUJGM0NBY2JLcWpYTC9DeFlxZWhJdDBzTkFFYVFY?=
 =?utf-8?B?U2xkclpOK1MxV1dRSHhXaEk5aUtOUitPNnBaZW9udWM5VjY5Z1hsSWlGYnF1?=
 =?utf-8?B?LzBmNWJWWUNJN1pxNVEzZldqUm9BN1MvbVpMQklzSmJLUnFxNTNwQ1RzNWZi?=
 =?utf-8?B?M3ZhUFNjc2RTR1JxclhWRjVTcms5c2hVZ3JDRitMZXFQZE5taFYxdFpYSkJi?=
 =?utf-8?B?eVBiZExXd2VjZnlUSCs0b3Era0l4ZmpjTVE4MmREN0F3WCtzVlI0dnp1QTdY?=
 =?utf-8?B?RElJSVFCcTQyZzk4eThaWU5lR25PLytNV3ZqZkpDOHpCMUxnWGMwZWRMbjc0?=
 =?utf-8?B?aVlJN3BtZFA5a2lQSGRJck1GSUdISVRrc0hzVFFYT2RpS0VoMVlIRWIvSG1q?=
 =?utf-8?B?cFN1ZXZwd2UzUFN3VWRtTDVOTUl1ejZqQkVOQ1RHTTdPa1ltVVcyaHE2Ylkr?=
 =?utf-8?B?aWI4S2RpWUJ5cW5CV2NvRFpFRGdMZHpPTVdLMnJHTVdqT0cycURueXZ3bUcz?=
 =?utf-8?B?RVZKTHczOVhuRVF6YUs4N3pNc2tqbld4SWFOVjU4RGp1d3FPY3l2YllMRnlI?=
 =?utf-8?B?VVJXSUJNNmNxNXlZZk1qRnp2ZVcrSVhLOHoxSzUyUGY0dWtpaUFpT0poOUZo?=
 =?utf-8?B?MVlwVDZ2TXU4YTFNNGFNWGlRZW1Pa0xSdCsyam9LYUpFbHNtVU96aGFzckpp?=
 =?utf-8?B?UVZKVnJrTDEyQjRNOUduMENjYVJwSU0yWUZBK3kxUENWQWRwR1NEQ0gyVHJ5?=
 =?utf-8?B?MGQyNmY5aEZFdHpBOVBXdU1wc2tVa3ZGdXhMc3ZlbGJRY3o0UHBYb3Z0NENs?=
 =?utf-8?B?b1BEN0hyQlRTWklhSlVxeXBoc2U1SEJ4UXFBelJSUmFiNUVpdytFMGZna2cy?=
 =?utf-8?B?UVRzOFhrY05DM2hsRVBjT3FhRWF3PT0=?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1525354a-b2ae-4feb-3520-08d9b98604e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 13:32:30.2529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZLtmuqaSUp3I7PtLosaS3ZUNolAFMQwhb650bqyo/HN5IZUtRtF2+u4+WQKN3lEfOh/dZp/GzB2EqUkC/a0dh//JEdK+adSMdvIF2ljCF8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7035
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v3 3/4] clocksource/drivers/renesas-ostm:
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

Hi All,

Gentle ping.

Are we happy with this patch? Please let me know.

As mentioned in [1], it has dependency on reset patch

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20211112184413.4391-2-biju.das.jz@bp.renesas.com/

Regards,
Biju

> Subject: Re: [PATCH v3 3/4] clocksource/drivers/renesas-ostm: Add RZ/G2L
> OSTM support
> 
> Hi Biju, Daniel,
> 
> On Mon, Nov 29, 2021 at 11:06 AM Biju Das <biju.das.jz@bp.renesas.com>
> wrote:
> > > Subject: Re: [PATCH v3 3/4] clocksource/drivers/renesas-ostm: Add
> > > RZ/G2L OSTM support
> > >
> > > On 12/11/2021 19:44, Biju Das wrote:
> > > > RZ/G2L SoC has Generic Timer Module(a.k.a OSTM) which needs to
> > > > deassert the reset line before accessing any registers.
> > > >
> > > > This patch adds an entry point for RZ/G2L so that we can deassert
> > > > the reset line in probe callback.
> > >
> > > What is the connection between adding the reset line control and the
> > > platform driver at the end of the driver ?
> >
> > The original driver has no arm architecture timer, so it needs to be
> 
> s/driver/SoC used with this driver/
> 
> > called very early in the boot and using of calls for handling the
> clocks.
> 
> Hence must be handled by TIMER_OF_DECLARE().
> 
> > Where as RZ/G2L has arm architecture timer and it needs to release the
> > module Reset before accessing any registers. So it has to be built in
> > and it needs cpg driver which happens at later stage compared to the
> original case, for de-asserting the reset.
> >
> > Geert, please correct me if I am wrong.
> 
> The reset driver is not available yet at TIMER_OF_DECLARE() time, so
> of_reset_control_get_optional_exclusive() returns -EPROBE_DEFER on RZ/G2L.
> Fortunately there is no need to have this timer available early on RZ/G2L,
> as it uses the arm architecture timer as the main clock source.  Still, to
> be available at all, the platform driver is needed to support re-probing
> after the reset driver has become available.
> 
> 
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > Reviewed-by: Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > > v2->v3:
> > > >  * Added reset_control_put() on error path.
> > > >  * enabled suppress_bind_attrs in ostm_device_driver structure
> > > > v1->v2:
> > > >  * Added reset handling inside ostm_init
> > > >  * Used same compatible for builtin driver aswell
> > > > ---
> > > >  drivers/clocksource/renesas-ostm.c | 39
> > > > +++++++++++++++++++++++++++++-
> > > >  1 file changed, 38 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/clocksource/renesas-ostm.c
> > > > b/drivers/clocksource/renesas-ostm.c
> > > > index 3d06ba66008c..21d1392637b8 100644
> > > > --- a/drivers/clocksource/renesas-ostm.c
> > > > +++ b/drivers/clocksource/renesas-ostm.c
> > > > @@ -9,6 +9,8 @@
> > > >  #include <linux/clk.h>
> > > >  #include <linux/clockchips.h>
> > > >  #include <linux/interrupt.h>
> > > > +#include <linux/platform_device.h> #include <linux/reset.h>
> > > >  #include <linux/sched_clock.h>
> > > >  #include <linux/slab.h>
> > > >
> > > > @@ -159,6 +161,7 @@ static int __init ostm_init_clkevt(struct
> > > > timer_of
> > > > *to)
> > > >
> > > >  static int __init ostm_init(struct device_node *np)  {
> > > > +   struct reset_control *rstc;
> > > >     struct timer_of *to;
> > > >     int ret;
> > > >
> > > > @@ -166,6 +169,14 @@ static int __init ostm_init(struct device_node
> *np)
> > > >     if (!to)
> > > >             return -ENOMEM;
> > > >
> > > > +   rstc = of_reset_control_get_optional_exclusive(np, NULL);
> > > > +   if (IS_ERR(rstc)) {
> > > > +           ret = PTR_ERR(rstc);
> > > > +           goto err_free;
> > > > +   }
> > > > +
> > > > +   reset_control_deassert(rstc);
> > > > +
> > > >     to->flags = TIMER_OF_BASE | TIMER_OF_CLOCK;
> > > >     if (system_clock) {
> > > >             /*
> > > > @@ -178,7 +189,7 @@ static int __init ostm_init(struct device_node
> > > > *np)
> > > >
> > > >     ret = timer_of_init(np, to);
> > > >     if (ret)
> > > > -           goto err_free;
> > > > +           goto err_reset;
> > > >
> > > >     /*
> > > >      * First probed device will be used as system clocksource. Any
> > > > @@
> > > > -203,9 +214,35 @@ static int __init ostm_init(struct device_node
> > > > *np)
> > > >
> > > >  err_cleanup:
> > > >     timer_of_cleanup(to);
> > > > +err_reset:
> > > > +   reset_control_assert(rstc);
> > > > +   reset_control_put(rstc);
> > > >  err_free:
> > > >     kfree(to);
> > > >     return ret;
> > > >  }
> > > >
> > > >  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
> > > > +
> > > > +#ifdef CONFIG_ARCH_R9A07G044
> > > > +static int __init ostm_probe(struct platform_device *pdev) {
> > > > +   struct device *dev = &pdev->dev;
> > > > +
> > > > +   return ostm_init(dev->of_node); }
> > > > +
> > > > +static const struct of_device_id ostm_of_table[] = {
> > > > +   { .compatible = "renesas,ostm", },
> > > > +   { /* sentinel */ }
> > > > +};
> > > > +
> > > > +static struct platform_driver ostm_device_driver = {
> > > > +   .driver = {
> > > > +           .name = "renesas_ostm",
> > > > +           .of_match_table = of_match_ptr(ostm_of_table),
> > > > +           .suppress_bind_attrs = true,
> > > > +   },
> > > > +};
> > > > +builtin_platform_driver_probe(ostm_device_driver, ostm_probe);
> > > > +#endif
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
