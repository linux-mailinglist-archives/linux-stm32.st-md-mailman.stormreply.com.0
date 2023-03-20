Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8043A6C0C6E
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 09:45:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30095C6A5EF;
	Mon, 20 Mar 2023 08:45:53 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04058C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 08:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1679301879; x=1710837879;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wKTdpaobdojiW5TqEa9dMMfB7JrXjbOTF1KBl+DNpco=;
 b=kMuJC7ETMnc9nQbcms+PebvTLcr+FlxJCY42/gomD3eOlya4ZuZIecSK
 76QjRr5LtDdzvfE2Y6j/UtcaSq/VdgQE7o8mvDsRBnGptFnZwCl8nj7un
 X4AY1p0TPXoSKaXEwsYgEjvqIJvDReiz7zGq0LzyBo7LjkFblzr1BDXUd
 x+mkgL3zXFDfitgHzvIbq7RXPrq2DrFvIn1qb6usfeZz4pEFKzTipFE3R
 8s3yb6ISBaLL4AXEKejviHcmllfxh6SwfrI7y4zKGhSpVweJhtV8seGWm
 Gq2ovGPqE7vOCu2+37+Ld+XFb+z8Data/q6ZKSGYUq/PLq3MjE4U+WOIf A==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673938800"; d="scan'208";a="205478554"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Mar 2023 01:44:36 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 01:44:36 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 20 Mar 2023 01:44:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmYnbE8tJYd8S/VeGZ4BQ7PP1RXleBGHLqFQMJA+7aBlD5xRJclec1vnAiOQeBYSuuiN8M6Q3EcC+N0MGvUJANUfx1NUPYwvGR/LTyQw+qgaQhbS5T4pSHnrKInBRZUTraKeGIAB3zRkGEH4sDA7I3KGIKORQFqULmU863hnGzTs2xGLEE75LSNqBmdnTcEUXsMFqmXctjQip1MRB66teFxJmzkzcpQnYjxd3pbZsPix61VkHoR+cxYFWlk/CAIwACnSgkkDP5i8sSt8LPuCnFXTyt5F6evJHMx8PObcZlvk35/hP34PRgOGJuozzNurKoWiPXF8mflMzIrQWqv+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKTdpaobdojiW5TqEa9dMMfB7JrXjbOTF1KBl+DNpco=;
 b=km8nGdtxQ74/D8WhCkvqboWERepSzkMfBeEdciRqjtOORjEd+L5rCS8oOAlAp9t8YYdrbze4wOMdNpdna5pUfLeAMAwppm8MJrNHQKQea00r614ka5Rjw6zqRedlYnG5hSkNHPdLRHvHndtbXqEi4okvwkntVzRjrwHAacptZ3742gCQUHdK3LAJjHqO7cBV8PTAsXXUS5KtI/aQhaPXzzkdz5UwQpvSp4l2fN64wqmfonyFawjrytWlasTZMxUmHTSW2s3mGF2uqn+nmY5U06rVI7DE540ifkY1fqpkUph6Z7h4TWkzJPHa+2rdG7XcAWkRnJFwMrExECWlms6XoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKTdpaobdojiW5TqEa9dMMfB7JrXjbOTF1KBl+DNpco=;
 b=NL60r4/c6iMIg92altDJKPStmRjxdIQtlE1r6GARiUpk+aiufSsN3+s0z/5o2bJ4dPjNX8TeNcikM8u37jLB4l2pODBUiyWMEN7BuIL18xk2MIuGAtRdyfCiuV+vfHgpSquafUV7O9/Llqqx6jlcwzi5jnYwmJsF36WWT+6w62E=
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Mon, 20 Mar 2023 08:44:34 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%4]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 08:44:34 +0000
From: <Steen.Hegelund@microchip.com>
To: <robh@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
 <kuba@kernel.org>, <pabeni@redhat.com>, <krzysztof.kozlowski+dt@linaro.org>,
 <afaerber@suse.de>, <mani@kernel.org>, <wens@csie.org>,
 <jernej.skrabec@gmail.com>, <samuel@sholland.org>, <joel@jms.id.au>,
 <andrew@aj.id.au>, <rafal@milecki.pl>,
 <bcm-kernel-feedback-list@broadcom.com>, <f.fainelli@gmail.com>,
 <appana.durga.rao@xilinx.com>, <naga.sureshkumar.relli@xilinx.com>,
 <wg@grandegger.com>, <mkl@pengutronix.de>, <michal.simek@xilinx.com>,
 <andrew@lunn.ch>, <olteanv@gmail.com>, <hkallweit1@gmail.com>,
 <linux@armlinux.org.uk>, <tobias@waldekranz.com>,
 <Lars.Povlsen@microchip.com>, <Steen.Hegelund@microchip.com>,
 <Daniel.Machon@microchip.com>, <UNGLinuxDriver@microchip.com>,
 <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
 <heiko@sntech.de>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>
Thread-Topic: [PATCH] dt-bindings: net: Drop unneeded quotes
Thread-Index: AQHZWSlQb1R7VXlBZk6nh+Ian9A42K8DXhCA
Date: Mon, 20 Mar 2023 08:44:34 +0000
Message-ID: <CRB2TYK6Y8AF.1EPG0KQWUMUDD@den-dk-m31857>
References: <20230317233605.3967621-1-robh@kernel.org>
In-Reply-To: <20230317233605.3967621-1-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: aerc 0.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5358:EE_|CO6PR11MB5586:EE_
x-ms-office365-filtering-correlation-id: a4b46f5e-bf79-4726-3a3c-08db291f5485
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WZbOKO3bSoX3aXoHkk7nZ6Z7SFtzEnz05PINbab2mZRXaaD2uv9q/POTUi+MBoxNkJq2+Y65kI+oKxFKL4rl0Z5pqxJfqUORRjGIsuICnp9eH8TjgQ0/d/WE/d8A5hoERE4f6+FKvN2180KJHFQi4opbY0Ix2K2FAQlKbik1VjLS3JR2HogY4Pyb5YuoNKwNS6xXZUWGgTNlBeKvbZZgx2U51+mwVaLNZatUVCJwcZW0xam97wwkmRuQ3h0fcq/YfrtwL6xZc5Yr8LVRD+sDRNXxJX8A1zGu6pHZMbhD1HtSOKF4/imi1nh5mB6d1KzxHEGfYgxDMHg6l71rs04mZHMLwakl+36Pr3JVAjDy/1ktUm/RxN67rWDTgtyAwSOER0FS6T0G7Etj7yl3ICtF7gbXMHX9muu8AQUMyRtciToAropm2JoUW3BnNGAiJ1ovm2jdqafYqL8BOYPa+WsACRiQGWXbc2LrbDCQhmI5Ie9sCyvPQ0npVUapLDbk8Q48iM5akFO3xXv8pwoKivE0F6GohSmgR7AbdXQvikyxrNfK3spCLdIUF+GyTeVS+cRdlMRXCViXojhNER/6IerlbJqsg/grQg/mmD+Vm4v26ygNVITXbD2YSOif4RC+IGJC3Tq/pZttaWX5TlhpoLsmw0TBkGgNPDY37juG4zJvebMiyeemNSX0Hi1/IYq+3RVZgFYA2peSBN/qG33R6OvggLyBXcrX4BcK2TJ5eO+Lozo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199018)(83380400001)(38100700002)(38070700005)(86362001)(921005)(122000001)(2906002)(8676002)(4326008)(64756008)(41300700001)(66446008)(66946007)(66476007)(66556008)(91956017)(8936002)(76116006)(5660300002)(6512007)(186003)(26005)(6506007)(9686003)(33656002)(478600001)(110136005)(316002)(54906003)(6486002)(71200400001)(7416002)(7406005)(33716001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1VGZmpGbEFrMnp2VTJad0lPNjhxNkN1WnBraTBqK3pYYUd0allrQjR6emd0?=
 =?utf-8?B?cEpOSHdud3lzZWlqcTRacmJ2MldPQ1RCM3BNRnF5UkdUek1vcHNLQVFRcHEy?=
 =?utf-8?B?clh3T2ZnMDZiaFNpQVhrMXNsN0xCUG5WK1BrQmR0KzVzUnR6SHpnMlpSbGxu?=
 =?utf-8?B?c1Y0TVFMRENaeDVjS0R1OEtCN0pPQWhNMFNNRUpOYSs1UnY2Smc5blFZd0Zk?=
 =?utf-8?B?MmUzbVYxWWV6KzhDam9SeXpYaHNUZ0Iyay9xd2Z1UHNXN25XK0RtckNKcXBU?=
 =?utf-8?B?WFBaejhBL091dURYekU5L3prN250R3dDSmhoTUZoejAvMXNGN0VvSnNsTSs2?=
 =?utf-8?B?UkRpTTVtZXhYZjhqcEtYQWttenBrN2dwY1FRemZMeEdFc2Z0VE1sQkJDZWl5?=
 =?utf-8?B?K3J2clJDSER4Tko3dU83bGg4cjczbjZQTHVCWmhjcTdPTXNQcnFYencwalNN?=
 =?utf-8?B?MTZsT3ZvbnFEaUlRcGJidWlzWWFpK25veHNOM1p1RUtlWjhBK0E3NlhxUHph?=
 =?utf-8?B?aTBhbkNNVXY4T0Y2akduOWhNU1Z4MEx2NjJjS0VjcEJpdHI2VnYxQW8zM0FU?=
 =?utf-8?B?OU9BTU5oZWM5K0pkNXEzQjdIZ1RrRFdtdERsUFVVS0dZSmkyZnY5TElDTjZI?=
 =?utf-8?B?L0NzSG1HRWxxWkhqMVBDWFNwNEg5aVVJSmVTM0x5MUVpN295UnJpZXpMREVR?=
 =?utf-8?B?TlR0MW0rSndXa2JWSi9neWNIZHhjR2JwbkR2OHVDUkNjSGFYY01HTHhPZGQz?=
 =?utf-8?B?WGZMNVBEektTazM1TWJ5ZmNTYkliV3ZXamJGb3p2ZWtaWW14WVBjdUpsK1dn?=
 =?utf-8?B?bDlpbnc5TGYxVVVqWlNMeStjSlVBY3FMRWs3ZndnWDhKcnZWcUIvTk1tREN4?=
 =?utf-8?B?WVE3M0R3R1Rqa2ZvTkc1Q0dvWFcrUDFGK001dVVtbWNnZmtQUDRtOUpWVmRq?=
 =?utf-8?B?aVNDRHNLQXVWK0F1RU5BeEkrcGdZTjhESzc1bkNSbmFnc0hiNlQ5UFc1Sy9m?=
 =?utf-8?B?TitBdFRweXY2eXJ0WUNDSVpwZFY5NWxGY3EwWEZrWWNUUEM3ZE54QTVIbUhr?=
 =?utf-8?B?WFN4d0xGMGhOTkRVVTBVRDBWQkI0VWoxem9YUzVvRW0vUFZKYk4rRHNRVS9B?=
 =?utf-8?B?WU5TeUdJb0pUWStpYVhSQ1pjWGJZV3ZIeVI3ZnloZHhoK3E0VVBSTnFZS2kv?=
 =?utf-8?B?dGt6YXByQWNMempiTXpVWERBQ1BSY3pjdFUzWWVveTA5YjVta3cyZzBkQjlG?=
 =?utf-8?B?dEcyTXVtcmJqRUdvbmUyRmNjOUpoM0Fsa3B2cThvRWNGOCtZOGdNR3IzRW82?=
 =?utf-8?B?YmNHeTZWRU9HU3ozSk0wVm04NWkzd2l5LzE2cURyTjRiMGJhYnpQMGhXc1dJ?=
 =?utf-8?B?a3dRYk1mT3FOMEhWZVJyTnR0N21yQnBwa2ZBVUhkaWFFS1BuZ3oveVovSU40?=
 =?utf-8?B?ZHc0RmpXRzhGb2M0SHl0TnhHZm9xaklZdWxHTnFFbzZWc3UzWW1BWStHQmlE?=
 =?utf-8?B?U3VSWFU3Z3JyeEpyM2cyV2gwWHo5VklLcFQzTU1lMkZBU3lxckNZMWc2ZFEx?=
 =?utf-8?B?OHZKdE1SOStzK0hvZURtQ3V6Z2c0QVdwM21EdjFoSm1Pd1RrdWxrRVVyTmQ3?=
 =?utf-8?B?WDZWQXd3Q0xncWtNY0JCODNWd2hPWU5YWlRGT2h5c01DYkpVcEhZTC8rMng1?=
 =?utf-8?B?dS9zaElZSzRhaG5mSC82MWUwU3dhVnlzMkVzdDB1TkRVaVRxL2dXMFB0aS95?=
 =?utf-8?B?VTZ4RzkxN2pPeVJVaDk4QkZCNjR2TWw0dTYvOWduUTBOUnRROEt2dlpHVUFx?=
 =?utf-8?B?YlY1WFBOZTlxVk1kSHpqaUt4bVVEY0p2Y3NqbkFPYXkzSEthSXJTSmM3SkZ1?=
 =?utf-8?B?TG1Ebkd1YmlsSlBiOTQyc3RJRUNpRW1qZEpjMjd1aFk5STNpeG1BL2hSWXdr?=
 =?utf-8?B?RVVEZ25taDcwRzlXQUF3b1VCckJPdFREYldscTZrQlEyNlgzRTFaNk91aUZ1?=
 =?utf-8?B?YmNXRmlDcDBzUU50d2NHNldzZ2NHdE5VeUtwUTliMFY5dk5rZTc0ODRLVUZX?=
 =?utf-8?B?a01BV1E2dmYxZEN2RGV5UmNqRVlRWDVBUnUxYnpIeFAycEJpbXFLS2Z1cHp0?=
 =?utf-8?B?MkhxTTJYRlFGU2M5RjdtVmU5Ukx6Y2tTaWRxS05KM3hsNkxheEhHckZHRTRV?=
 =?utf-8?Q?UQJSCPkiE2Ol7MEz8TZknYc=3D?=
Content-ID: <D11A41927B824542B5F1C61B5BD8C30E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b46f5e-bf79-4726-3a3c-08db291f5485
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2023 08:44:34.1487 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EN/iqEtTPw9je/T67bCX5oP52blJQ7sGu2z9NHVckH6N9H9ydZ52vw5BaQbEWWJHOI67hZ5YhJiHt/lWjHRsfXmNyPSO4BYWDrJe4V8kkws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5586
X-Mailman-Approved-At: Mon, 20 Mar 2023 08:45:52 +0000
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-can@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: net: Drop unneeded quotes
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

Hi Rob,


On Sat Mar 18, 2023 at 12:36 AM CET, Rob Herring wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/net/actions,owl-emac.yaml  |  2 +-
>  .../bindings/net/allwinner,sun4i-a10-emac.yaml     |  2 +-
>  .../bindings/net/allwinner,sun4i-a10-mdio.yaml     |  2 +-
>  .../devicetree/bindings/net/altr,tse.yaml          |  2 +-
>  .../bindings/net/aspeed,ast2600-mdio.yaml          |  2 +-
>  .../devicetree/bindings/net/brcm,amac.yaml         |  2 +-
>  .../devicetree/bindings/net/brcm,systemport.yaml   |  2 +-
>  .../bindings/net/broadcom-bluetooth.yaml           |  2 +-
>  .../devicetree/bindings/net/can/xilinx,can.yaml    |  6 +++---
>  .../devicetree/bindings/net/dsa/brcm,sf2.yaml      |  2 +-
>  .../devicetree/bindings/net/dsa/qca8k.yaml         |  2 +-
>  .../devicetree/bindings/net/engleder,tsnep.yaml    |  2 +-
>  .../devicetree/bindings/net/ethernet-phy.yaml      |  2 +-
>  .../bindings/net/fsl,qoriq-mc-dpmac.yaml           |  2 +-
>  .../bindings/net/intel,ixp4xx-ethernet.yaml        |  8 ++++----
>  .../devicetree/bindings/net/intel,ixp4xx-hss.yaml  | 14 +++++++-------
>  .../devicetree/bindings/net/marvell,mvusb.yaml     |  2 +-
>  .../devicetree/bindings/net/mdio-gpio.yaml         |  2 +-
>  .../devicetree/bindings/net/mediatek,net.yaml      |  2 +-
>  .../bindings/net/mediatek,star-emac.yaml           |  2 +-
>  .../bindings/net/microchip,lan966x-switch.yaml     |  2 +-

For LAN966x and Sparx5:
Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>

>  .../bindings/net/microchip,sparx5-switch.yaml      |  4 ++--
>  .../devicetree/bindings/net/mscc,miim.yaml         |  2 +-
>  .../devicetree/bindings/net/nfc/marvell,nci.yaml   |  2 +-
>  .../devicetree/bindings/net/nfc/nxp,pn532.yaml     |  2 +-
>  .../bindings/net/pse-pd/podl-pse-regulator.yaml    |  2 +-
>  .../devicetree/bindings/net/qcom,ipq4019-mdio.yaml |  2 +-
>  .../devicetree/bindings/net/qcom,ipq8064-mdio.yaml |  2 +-
>  .../devicetree/bindings/net/rockchip,emac.yaml     |  2 +-
>  .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +-
>  .../devicetree/bindings/net/stm32-dwmac.yaml       |  4 ++--
>  .../devicetree/bindings/net/ti,cpsw-switch.yaml    | 10 +++++-----
>  .../devicetree/bindings/net/ti,davinci-mdio.yaml   |  2 +-
>  .../devicetree/bindings/net/ti,dp83822.yaml        |  2 +-
>  .../devicetree/bindings/net/ti,dp83867.yaml        |  2 +-
>  .../devicetree/bindings/net/ti,dp83869.yaml        |  2 +-
>  36 files changed, 53 insertions(+), 53 deletions(-)

BR
Steen
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
