Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FF744BE54
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Nov 2021 11:14:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE49AC5EC6F;
	Wed, 10 Nov 2021 10:14:21 +0000 (UTC)
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400107.outbound.protection.outlook.com [40.107.140.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A23BFC5EC6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Nov 2021 10:14:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXtyWG9v6DrzNvD6V/0IAuTEN9GJhCGT/BxNTB7sJv4CTctZuRUkT/GcTgAF4Vzh4Th5BWUODuKJZ3IZV8uh6UZPeTYvgmrI+y/HLUsPRYAa/InkNGUY42jgiLFqA3PHeyfZncDkBDK+1Ci5KIlTxxThFiAABRIBeKU77KEAGZP8f+AHav4bBTxFhvqCaeMp/X2RCIXAIQSaScoI7fRGLsgKsE2JoVgZI0IJWJpQr1R+WX9hO2mreWsnGlliixbh7OAmam52Tfr/rbg13PipG7faH2QUgW4rnCdIfTMge3yS8qyneXL6pCcF1ht/QFBEUUIYhMa3bqmVDS3WjXP0Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/oUxj3BMkCSlPZkpnXFRhnv76FyO7gnb7qH5FSORpU=;
 b=mEVqSFgqFtIa2qPg3X+xDz2vYrC4wRFr8i+KNiVdbTSpJFZ32ta4qXJGdC+HlAKP2Od8JvpvzNFyjPYXSRCnObGPwdO5xW/74tgzh0LmdSWhdaHco2CoRW+11j90drEM4emHnhIWr8oHoom5oxDc+R1TCXceN34t/H8ewdpfOtMY76t5N7XSweoC+DfKZPjhrl1+6zUkUKQsUmukVycKFKWlniJyB/de02WE4LlRgrIcoDRAol3l5QLmHYBGXeKOEYvaptZ7vil0adx1gkDwGMA1u2UXfw4HWQhoRlTR8p6+ZO998UVNB1XMlpgb1XENepnBJ9X8+FIbRfrw7y06rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/oUxj3BMkCSlPZkpnXFRhnv76FyO7gnb7qH5FSORpU=;
 b=BRHmfyThzLYFJoC6PzjInmggKWhMgitPVeRX31V3KAN7Ml5fJL9QU76M1FZdrmhJZ7ff+0y1entWR35+F7gkmH/K+H4DnyNPeLBpCJWvth6w972LOapfmo5XHBh4VABIy+uT134NkcxWZ9IaV/jBeol5A+q+NDZx3wdR0YUTvnI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2802.jpnprd01.prod.outlook.com (2603:1096:603:3d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Wed, 10 Nov
 2021 10:14:16 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%9]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 10:14:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Thread-Topic: [PATCH 2/2] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
 support
Thread-Index: AQHX1g1yrO/DEDK5GkyhMVfA7q3phav8iOAAgAABiUA=
Date: Wed, 10 Nov 2021 10:14:15 +0000
Message-ID: <OS0PR01MB5922DA080AFB0AF97228275786939@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211110083152.31144-1-biju.das.jz@bp.renesas.com>
 <20211110083152.31144-3-biju.das.jz@bp.renesas.com>
 <47a188dcc1a16e6147cf403b5ce7781646a87203.camel@pengutronix.de>
In-Reply-To: <47a188dcc1a16e6147cf403b5ce7781646a87203.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efb57005-03f6-4f9e-d079-08d9a432d9c9
x-ms-traffictypediagnostic: OSAPR01MB2802:
x-microsoft-antispam-prvs: <OSAPR01MB2802A399A900FF53686714EC86939@OSAPR01MB2802.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Y7g3q42WTWism9JMq+06heDlqM6gzWuiki00X8NFuCFWgQQyQAgRsVE61KxtkBVt97gnvOVr+uFSSTPALj/BSfgeIq1ILSMMJ8G3K8bA+BcyeXxM+ZgxuX4fVFRBmpbE5bxyBk6trXDXINgH0vGTKRz18j8uJDFq7qjj3bBEnbECpbfDLmMv8WVsnqfMyX0iUHIYvAoUOuvTFNeJs+sXcaInU1DJQDLBOVjdQNqO5gEwimcn7tSpSSi16Xw7NxTgNW8f6t+JRq6WgcVYTG8jfWsKuuu51CKNBmwZntO7X2i3+9gALIf/gXHyrT3K65JZVVsuaYajXoUiDOSAx6EoiMFqUUPVJM/d1pkmWzVvcglxFEWij21mcVUhtJv9FRCQAM7Oq6IHrdXe7GuOJUJQ+aTn7TC7OtkwnhcWo6clIvBtdwxyJ/ObbhfpJQsMyN5OtGk0KbXpE/5DCdonxthOXwcLqWG9GYgn0vb274vKiZaVbncJXtwsjIl0CjQnHKilmNVxyp2sbhs9sUJdGxIehoqxtrkqaTtKyybIikIKM2PI4FuZrvJMvQCmndm96+HKUF/6TC5QMHjOKhzejVGEMei0thooxGpPBPXgaIJMKfa6B564tMs2UrhkeFW6+nDB9zvQBYA7cVN8sGSQ4WhSm/ha7FEd7DEGCIBSEISClM1AgHSrSLCAPMPa6az7ooEOSTLVjRAJ9vK8+LBvErI4A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(38100700002)(4326008)(122000001)(86362001)(316002)(54906003)(186003)(110136005)(8676002)(8936002)(55016002)(76116006)(5660300002)(6506007)(4001150100001)(2906002)(66446008)(71200400001)(508600001)(38070700005)(64756008)(52536014)(9686003)(66946007)(66476007)(83380400001)(33656002)(66556008)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTJrR21ZWVhYZldnTW9KeWIxOEs0WUZVNDk4NlBHM24vSTJyZ01TOUVJejF5?=
 =?utf-8?B?L0ZCTDkwNVlLZmx0RHNnQ01IK0RyQVVBcWVqbUh1UWREMEdLVEZsTWlEZzBi?=
 =?utf-8?B?aWswVTZ5SUtXMXB5dTNpaWFxYmtEQjRkcDlTR2JEZEZWY3h3NUt4QWlJVkp0?=
 =?utf-8?B?N0gwc2NTeEZ3WCtIM0UwMzE1ZTdaS0diOXFtK0Z6eUZyN0orOERVdEU3OVBv?=
 =?utf-8?B?MVNYdFd1Y2crTjJTeDg0dVNobzk5UmwzeVlkdnRwL1Z2VE9mRkR2WGNLYkhE?=
 =?utf-8?B?SHROOG5Xb3Btb0NsaTgrVE8reUFmZ0xsdkZ1NUJBeEw2blZYRzhHVjBqVGZw?=
 =?utf-8?B?OVZKaWtET0RJN1hzeE9JaVFrMC9rYm42L0lmMVRpWTBOTDNybXMrbkJQRjRy?=
 =?utf-8?B?dTd3YkVrZTZ5emVSSmVFNTRHZi9VYkxUaUdWQmFudkFzcXJ2RW9CR2U2TzZj?=
 =?utf-8?B?UWdKUkJBRm1ISloraWRlQlJJKzZaUGN1UUZrZnhDaWVoYVpaNkhJWkF5Qmk1?=
 =?utf-8?B?ZlI3SVN0L2o4RjU5d000VGtjeHdaWnc4c3lLcXV0LzVNelVmOTBxNmo3aEJt?=
 =?utf-8?B?eEMvRmIxMTdncVA5K3hjNVBSRk5PZldyQ1JueXRiaFdDYVgxdW1vVFk5TWV1?=
 =?utf-8?B?cVZQN2h4a2gwRkVPNGlldDhTd1BEcmVLbnJ1UkNMcHUxUnpsdzRHVnBGR1Bt?=
 =?utf-8?B?c0Jhb24rb0cyV1Z4ZWYwVjhkZ09PMHp2SXBQZXBCZHRjazZiMkdzNVFTaGpz?=
 =?utf-8?B?OFRPRDNEckZDYXM5blFkQkU1dWt0QUw1aldjdituZWd0WFpMWkVLZzV3eUdH?=
 =?utf-8?B?eFpEUlZ2NGhYQ1hlVWtCbitWVmttZjBNdmorZkpKR1VyMHVSbmFnQWRVWE5m?=
 =?utf-8?B?Z3I4Z1luWExBUzN0a0xMUVBrWWtUcDBMbTVtcEJaY0F3TTZ3SHYwcnZNWlZH?=
 =?utf-8?B?RmsvMDRTeHh6Tytuc016NjdmNlRMRU9rMnp0Y1dQWWxMa1NNRjRTY3JjcGZs?=
 =?utf-8?B?K1IvSkhlZXM1WVVnMWU1QjV6MExPZEMwWUJ4UXU2MVdaRzhhOGtBdlRlWlVm?=
 =?utf-8?B?VlVOTlluSy8wMXovSTZSQ2RFeTlqNUIyVllVZjhGeUliOUpSTy9vRW8rdlhS?=
 =?utf-8?B?V29sMk1LMkRTOUVLeDFBR1NIQnppdHlQOUlSQ2RTVEFhandOaXRjeXJXVlNK?=
 =?utf-8?B?OUJxcjE3eTAyaW9taU0zVWtzNXN5d2dZT0VsQ3lSc0hXTkRXTzlaVW5vSXM5?=
 =?utf-8?B?SkdoZUwyUkYzNEE4WkprZ0tJTXVzSk5CZXYzZS9MQSt5dzRDbW00bENQeDV6?=
 =?utf-8?B?TFUwLzVLV2lMRU1iQUltNElnaDJYVjVIbDVGYU0zWklxYW5SMXZLVENLVUZK?=
 =?utf-8?B?VnlHSUN3ZVdKdThDNjdEWmoyMVROTUlHcVZlWG1lZWFVSTlNeFVWY3JQWmln?=
 =?utf-8?B?Z2FWYUc3SWZYUkxLVmJDNkowYVRGV1ZkaWZqS2V4MGk1VWVnU2JoZGVzVmtQ?=
 =?utf-8?B?ZTQxQ0hvY1Vva05NMGREZTAvejBmU2VETnB5RUc0UUpFcHJrQ3crUTdPTURV?=
 =?utf-8?B?NzVSQ1B0aitIVktQMnd6SldYZjhGY3c5emduRjRZTmR2MmJBRkZvQ0Vydnp2?=
 =?utf-8?B?KzcycWNlYkpvdzZQYnZEL0lOb0REb3NiVWwxZ1FMc0tFZmpPUHQyVENmNVEr?=
 =?utf-8?B?dkp6aDA0SXF6V1NYYzZqSXJSS2xUU21kZm5mRGJqYTVVV1Q5SkVZOWdqZmlj?=
 =?utf-8?B?NnVrQmtxMnZUY3dDcEpWeVp5RzM1K1ZkQVhMc0d3NVZaN1hETkFvOENwcm0v?=
 =?utf-8?B?bnFtWUwzRnphUjM1aW51QjZSc0tCY2hpZmRleDZrT2l2b3lsY1pWVTF5ZzNQ?=
 =?utf-8?B?UXlFTnZma1hoUHBJdVh2VTQySWFidFNrTlFwRU1vM09kRXNxVmZOdnFlaFJM?=
 =?utf-8?B?MjlGc082ei9UNk5hSlRUZ1hMczFLVURNcm9NLys0cmpYY1RSdy9ib2o1Wnhx?=
 =?utf-8?B?cmRQWkJHZys2WlAydk9uTlRSU2xETmJNMWFxYnhieWJ3WTdDaXBwU0VicGp0?=
 =?utf-8?B?UFQxU0g4TmRqVE9kSWVod1lPTXRwVnNXUVVkNGVYQmEyZCtqbUlmNXVuRmRU?=
 =?utf-8?B?MDduNS9BSzUweDVmRXRTQ0V0WmV3cUhEYmM0ZGhVQ2oyRGFUOUplWER3VDFD?=
 =?utf-8?B?d3JnemVEYWRYWE9wUktWcDZGWE9DcG9VSjROanZkdlpBYWFXVEJ5WHZJd0ph?=
 =?utf-8?B?Qk5FSTNvYk5TRC9VV2d0a2s0OU9nPT0=?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efb57005-03f6-4f9e-d079-08d9a432d9c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 10:14:15.6906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O8Z0awhOszmsLNck37IiyDTAO1Stf/3Ob0ztpLP9SbKo8E5W9LVUKjtQVi+2iOVaNfAbl7Zae6YXdJOqHIjW2V+OPinI5hJATWSb3WZR3Qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2802
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <Chris.Brandt@renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] clocksource/drivers/renesas-ostm: Add
 RZ/G2L OSTM support
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

Hi Philipp Zabel,

Thanks for the feedback.

> Subject: Re: [PATCH 2/2] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM
> support
> 
> On Wed, 2021-11-10 at 08:31 +0000, Biju Das wrote:
> [...]
> > +#ifdef CONFIG_ARCH_R9A07G044
> > +static int __init ostm_probe(struct platform_device *pdev) {
> > +	struct device *dev = &pdev->dev;
> > +	struct reset_control *rstc;
> > +	int ret;
> > +
> > +	rstc = devm_reset_control_get_exclusive(dev, NULL);
> > +	if (IS_ERR(rstc))
> > +		return dev_err_probe(dev, PTR_ERR(rstc), "failed to get
> reset");
> > +
> > +	reset_control_deassert(rstc);
> > +
> > +	ret = ostm_init(dev->of_node);
> > +	if (ret) {
> > +		reset_control_assert(rstc);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id ostm_of_table[] = {
> > +	{ .compatible = "renesas,rzg2l-ostm", },
> > +	{ }
> > +};
> > +
> > +static struct platform_driver ostm_device_driver = {
> > +	.driver		= {
> > +		.name	= "rzg2l_ostm",
> > +		.of_match_table = of_match_ptr(ostm_of_table),
> > +	},
> > +};
> > +builtin_platform_driver_probe(ostm_device_driver, ostm_probe); #endif
> 
> I assuming the corresponding reset controller driver is builtin as well.

Indeed.

Cheers,
Biju

> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> regards
> Philipp

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
