Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95888103DDA
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2019 16:00:38 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B079C36B0C;
	Wed, 20 Nov 2019 15:00:38 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150075.outbound.protection.outlook.com [40.107.15.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D48C5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Nov 2019 14:30:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaS/VmU3rKOh0JqdNvxNRuVqkon8pg43W8ta3ONRMLMpR5f9l9nb8kn6t9XkqdBBTv3C4tgVycTWMCQm8iqL5gzrAnVeAfCDAf1aEKCQGWEJesHQch7SHCogQ1AXbna5TiNLRCw7vGInToVbeLe4TP7kjv93jHXsazjd4CcJDc3PHgVvbm668yxxOlFY7rm5aCykmMfeHnPiNjrBnlCloCRD8OYYdOF2S7q2XsyJUtTLziKyvfpawBNZfQ7G9wynEGxNbo0bYlqjENO3xxh8xdH4HfSOhl7KDMYlBji8huGdJCRxm891aZ/9wyxIh+VuH+LGLc+1cELSpzr4AeAXTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6fbpwxcECZPnKh2clpW3kRFVgUf4g0hAqWqBZG2Oz4=;
 b=l0nV7InMv5UyVUjbyWCxuX/AwccFvFNUSZYdouH1WOOoi2fuVdHHj7RKmeg47PbPYzmHe5exhzBg9Rhc1Vb3/zHa/0a8bbRoMAU8ImW8TGV1ussPuiGbe+GWQJWm2LzXoB3TfvMeJsIVIsEgvU9wrDim8Dv0grT2gvhLlUkCOjIOg1H2yBJwgqhPHZCglq3+l8pzV7g6hJjoRKQ74dwA1dBxOalXBPpA4pStkXv/UlbreiKhfttrAcE/B1YU9t99C8QYE0Jl0d4Ke0UFKmZJgGN8/mAM7Z9b3kbHvnMQzPjAh6GZqrPdfnH6bSdFFwWRvtTKbeyPAfwL2bSPzSVvvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6fbpwxcECZPnKh2clpW3kRFVgUf4g0hAqWqBZG2Oz4=;
 b=aULmRl+/uNJyPgxO69XePj3iYwZ9b4WR4wI3YClQgb68JJcnskUFQKyv+nGm0MVa2V/j+os6GccW72vg6X08ylEXRQ6e1ntJVS2J6JvrD2Xocn3hhfy1rzEUvKoY2EsITVK9+bmdLZqRluzN/HMS2n1331GX1CZ2mQRyPbKNyQQ=
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB3344.eurprd04.prod.outlook.com (52.134.8.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.22; Wed, 20 Nov 2019 14:30:29 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::89e1:552e:a24d:e72]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::89e1:552e:a24d:e72%3]) with mapi id 15.20.2474.018; Wed, 20 Nov 2019
 14:30:29 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH] crypto: Fix Kconfig indentation
Thread-Index: AQHVn6haznq8vw1WjUKSyFyRA7fljA==
Date: Wed, 20 Nov 2019 14:30:29 +0000
Message-ID: <VI1PR0402MB3485BE88F8060AF214FE56CD984F0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
References: <20191120134221.15774-1-krzk@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 87407e04-47f6-49bd-bf1b-08d76dc6313b
x-ms-traffictypediagnostic: VI1PR0402MB3344:|VI1PR0402MB3344:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB33443C0EF64296BBEA26CA0F984F0@VI1PR0402MB3344.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(199004)(189003)(2906002)(14454004)(476003)(53546011)(8936002)(305945005)(74316002)(7736002)(76176011)(91956017)(66946007)(25786009)(66066001)(6436002)(558084003)(6116002)(54906003)(81166006)(66446008)(64756008)(66556008)(66476007)(110136005)(3846002)(316002)(8676002)(86362001)(81156014)(52536014)(99286004)(7416002)(33656002)(2501003)(76116006)(6506007)(478600001)(7696005)(6246003)(446003)(71190400001)(71200400001)(102836004)(26005)(256004)(186003)(9686003)(55016002)(44832011)(486006)(4326008)(5660300002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0402MB3344;
 H:VI1PR0402MB3485.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IYJI/cbKZhmJLD2KkzEqUAYtAlCXOdeeT5CfNlKgGgc6ogKalUxg/zmDu3tMw7ZABz3//x9vXdJvJbcD2zOrl5Yqbqas4uIOE3Wbx85XlmYbwXviF39bXygkeqYrWigBMzCL8DkitpNCX00BD0Q+WL5nWUIOJa552T6tctjPQ3R9ZQaHMtLC86sGUm+v2zoWG68d/6kmp43PzPMgCkHTwOO/gXc/SAgiyTi/kvPtXy7u48hIl2wnmbX2pZGDJjS6wOtiTrvCkYUg0LGVo48JoDMWDyNEV62fy63zp7xTq9CgTSFPSnbQ+6P8ScOD0l40g2MaYfKwVhbrCjKzYy8nTELwuuR/OjZf+rBYWJEg0dZwHJloDYuuPCqsmWXha9v3olJOumYmmromytal40CPVxMIO4z9MubUGlOd73N0uHF/6nuxCvSWTC6C0UigEj2x
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87407e04-47f6-49bd-bf1b-08d76dc6313b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 14:30:29.2026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pzc5eUsN7Mov9hzlv6L3SQRge0EMpabbM0dpHvc9EAJDRIXypUsAU84YltoHsHTLujRo+apmkDTTgkRhFXaQwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3344
X-Mailman-Approved-At: Wed, 20 Nov 2019 15:00:31 +0000
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Atul Gupta <atul.gupta@chelsio.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [Linux-stm32] [PATCH] crypto: Fix Kconfig indentation
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 11/20/2019 3:42 PM, Krzysztof Kozlowski wrote:
> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
> 	$ sed -e 's/^        /\t/' -i */Kconfig
> =

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Horia Geant=E3 <horia.geanta@nxp.com>

Thanks,
Horia
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
