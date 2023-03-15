Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A851D6BAAD8
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Mar 2023 09:35:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48E89C65E60;
	Wed, 15 Mar 2023 08:35:16 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69309C64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Mar 2023 08:35:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQdK8PNAMnJQRn/l4AQRcZbqOf25yjQQfaEgTupt3vRP1h0eoWIqjZm3FzuIoXUUTv7SrW3PLXTzhA+YppeoDWKPtav6esEJTCObKK7HXxNxm+lPX0YBgfe7abd41PG6pLeiBwzDobbbKJ0cLXevNIL8XmZhOu6MRxzEJ1ATfosjk90gP227cjdWWj/vJUF50EG0WnFOWnO29PNDkE4BVab7PCPBM4aDVwyHKY4j+c2dHMHtoLVXB1I4qFpRb38+jcrg55nqMxwAz6JYoILl6r5PDnqTpBkgNbZtytdVrWnDB1VghPuGCVxvOyjHL86dNmPetB5Nb98+SVXAjIfTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+WVG9GQG16dgubbwWX9vkz5rEUgV2C7+S0x+w/w2xA=;
 b=YqyEKYkQo+2HQx7wvYRk0/V4b2B7r2LNfEnZB9O9vbA7vtesSvcdVSFRgcjmarGY9Y6JlAROMJaH2Dx7LL2foKjz64wVOMX0D/d9FkqaJOwQUC2plZES5B3qKiPnSThPdM+MJv+hPGRC9nuUjwlt7j7xX8mHKqT1zAvJDPPfBlumRIUvhPha6hE0Ozt4CCBun2Az2yAfkXD9SvQB+2PPytGBfHJFfHb//GuOVxRUskDVyroq+ZCycGJK/8thb5EiBbiIy/eAbOqglraO38/H2PHrgLDDZ7wX8PkDLBFLr7HBujtzIKXDZFk4/3MP6ej+cEY8KOsjyDkp+TS1bCUJFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+WVG9GQG16dgubbwWX9vkz5rEUgV2C7+S0x+w/w2xA=;
 b=Wo0ZFe8U+IzIz1SWngykfZhT7nVbJvYgMQdDL0P+Tkb8rEzWVwxP5w1mg7C7OIr3akaIfGYxG8uNywV0GAH/YSTkY9Xh82ukQ0eSYQYsVR4sm5/59q5Rn1Um4dOqvwrE+j8rmhH7YtNxrEyUMBB0LH5VW8jk5dmn9Z+XOEG1HX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by SA1PR13MB6053.namprd13.prod.outlook.com (2603:10b6:806:33a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Wed, 15 Mar
 2023 08:35:12 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::85f5:bdb:fb9e:294c]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::85f5:bdb:fb9e:294c%2]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 08:35:12 +0000
Date: Wed, 15 Mar 2023 09:35:02 +0100
From: Simon Horman <simon.horman@corigine.com>
To: Rob Herring <robh@kernel.org>
Message-ID: <ZBGDNlelN0WFBaq6@corigine.com>
References: <20230310144718.1544169-1-robh@kernel.org>
 <ZAxrBtNdou28yPPB@corigine.com>
 <CAL_JsqJTsgmdwZZTfcMRnqaUfCNbgjO2mshxtAQK-qwoFqwCyw@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJTsgmdwZZTfcMRnqaUfCNbgjO2mshxtAQK-qwoFqwCyw@mail.gmail.com>
X-ClientProxiedBy: AM4PR07CA0033.eurprd07.prod.outlook.com
 (2603:10a6:205:1::46) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|SA1PR13MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a21e76e-9097-4f70-2db4-08db25303130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S1Nm8tSp+cN/CqWBydj5jewXt2IcaxgcJMI0BWk5P0qhZSxXdCzovpiZt/2wWHD90/GLEyvV19e074mZDp9mZnli7r4YGjaPVzCflx8PtoQK08vLFpYMBpKGgkGlPnugtOzi2FbCK3Wc/kVP+Z46Rhh4HrR9Tz6yHrZRz7YXUjyiseEYRWvz5ci2WsA0gLPOhqQZvcwNeGxQxFtka4G0GlaBsoCXAhOxIGwXxFu7QfhqXLyKffZBGG7E4HGzrx2krzQzPypaMsrhJOQqRfYp65PFNRxlTya7r5tAP0qmEbUIKwzcTm5qF+iZ7/nlkV4IMDcB7HeVIH5mz42qV9Zwlp7JplipL98C5RX2AG73MkElaj1lAlktBVHUL09LxSX+uQeYFbpvtdw2d88kw3OA5djkiAEyJ0SVY8yIOg0W5z9XWzMe8Kc//ktY6L6GSUmyLymoh1NSCOS1I3UIlYckpj1PXTqP8//JfLrVAEXo3Cgqm1dJp8giZj6T2QTu2+nlL0Ba6GR6H05nJNo/yiktovVGnasdQCnPxkT7fXWe+xEv/MxtHSw/zyAD4tTILB+8GzqmxnnOfcMH88FXHUfdkJVro/CsWztLcyz9v+Ca7EBYBKvNZ55emYZ4A0txVeZfWE3QgesFLFGIIXQ6QCrzEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39840400004)(366004)(376002)(136003)(396003)(346002)(451199018)(7406005)(2906002)(316002)(53546011)(7416002)(44832011)(8936002)(478600001)(54906003)(38100700002)(86362001)(6486002)(2616005)(36756003)(41300700001)(66946007)(66556008)(6666004)(66476007)(6916009)(8676002)(6506007)(6512007)(4326008)(186003)(5660300002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1FzQ2Y2ZFdYWENoWVBJaGx0aS9tKytCMXJ6aE9KT1dlZjRtQjR4eVhtWGxL?=
 =?utf-8?B?Wm0xMS9EcW1USlozeEYxRzgrVGZUYmVOejVYajBNYzFxQWNPRWsxdnhwVWRQ?=
 =?utf-8?B?ZlRZNVRvTTZQOXF3bUFOMURmNE9LYmVScDJpSGFYaGQ2WlpRTXZRZmNXNFdo?=
 =?utf-8?B?NnVxYXh5TTVzWERsQTRjWnB1Q1ozRUp1M2NLc2hUYUhkZnhaZ1EwR0g2czZ1?=
 =?utf-8?B?NGFZMWRaVEtHRHI5ZHpiU01mMVpndGdLdFV2ekZUYzMzOXR1d09zbW5YeDAx?=
 =?utf-8?B?SnhpdmxCMWpLS3hRRm9RSko3RUtCbDJBdTJRT3p0U0F1VzloVktTRjlQWnNW?=
 =?utf-8?B?OEV2SnloYU9MSXBEKzlDTjNnTGJ2d25RLzlEMXJhakRpem5WZUNzOVl4c1pT?=
 =?utf-8?B?aG5jRGNsRXBkMWZUYmRmNjFFQWZZK0xUVTgvNGYyck9Sc3N4cFJ5UXIxb1dZ?=
 =?utf-8?B?Z0J4WHVtYStJbFhiMW1wMHlibzVHWHNJWkFzNldGNUFwdWJobkJWWDVDSklX?=
 =?utf-8?B?d0d2MVNDNllrSktjcUYvUDBLMEhwTkRsTE5ZOFRvM0hlYTJYeEpzU3QxRWxC?=
 =?utf-8?B?NHBJVFVrYzRRdWt6Q1N1Yzc2bFd2SEdtMWZTWUFpWGQrQzFUV0hNazdCRDFn?=
 =?utf-8?B?VXN0dU95Zmx3bmV5MU1Qb0ZVdzFGaHZWM1dtbGxFeW9MdXlwOEQ4TUs4bGZN?=
 =?utf-8?B?V25pNXN0RG1kTHVCek1VWnNNNzljSUtBMFZNUnZ0K3FtU29vMkpEMjRNVzcz?=
 =?utf-8?B?UjF6blJRQ3pPNjZiZ0dmdjluR3J1NEsxZmlXYkVpM2NxOS9kUklHM0hsQ1M1?=
 =?utf-8?B?b0c4c3Fidmg2ckpMZmErUTNhOFJDQUhUUEdvOUFaSGJrUXV2dU8vbEhveitE?=
 =?utf-8?B?K3VYb0xmT1BEdlJqSVBsRkY0VjZRdGFmSjhLTW1wd25zQytWdFlXR3VvN2k2?=
 =?utf-8?B?ZURoYkwvMkxrUlhoWk9DRG1lMFVkRlZtWXRYaEVnOTFJQ2NhalBGSVE1QWgz?=
 =?utf-8?B?K1J0dzIyQ2p3azFKemNTcWRBQlJseHJMMGxrcTFCd2ZFbTZISjFUS1VZWlVt?=
 =?utf-8?B?RkNuUVJqZkM0YVNCRDFibThEWmc0djlucGRkRGdtMTVUS2FreHRScmRyNmE1?=
 =?utf-8?B?eDVSS0dNbDVkZmJkb3Awb1g3Z0N5RXcveDJjRkV4bWkxeE52WkNXNGRqdWxO?=
 =?utf-8?B?bnJiN1FWbFNsaU9WbTBUM29jckZwdmhSK1g1ZDQ3TUFaaFFYRTFrajBKTEdH?=
 =?utf-8?B?ME80MGZaTFVQTTMvdEdQZzlFbFNvSmFNWjB4UGFPeUhBbFptd3hEandoZmxF?=
 =?utf-8?B?TkZ5aHc0YXY0cFBoSWd6S08vK01MOUNlOFBkUllZWTZka1FibUE5RVBjdmhQ?=
 =?utf-8?B?T3lkaDJQd1VVbm02aGFwK2dSRmx4ZnZUQ1U4NlZES0FkdUJWMDM2cEg5a3hm?=
 =?utf-8?B?aEZsZVBCRzR6T2UyeVFiVmdnQUxiOS9MZjVPaXZ2TWpzQXU1RDY2L25YaVEw?=
 =?utf-8?B?YmtjYTNtUkY1KzZFMEs1ZDMwZjJpY3FXRzR1ZzJuVDVIR2hkMHFxN3J3bldq?=
 =?utf-8?B?Y09MaFNHN1VLbUxBQnJ6TTZDd0dCN1ZtQzcxc2FJS0c0RjI5NkZENlZVOGZQ?=
 =?utf-8?B?Zk5kMTVUbmZ3UzFvNjh6SVlsU3FuMU9uYU5kZjJrZHliVUxQSU5uN1BlNzV5?=
 =?utf-8?B?eFhOTHBRcjdxOXErR2tybG9sVDhHRWREQnhiWHM5RVp0R09tWU9Vdlg3bmJj?=
 =?utf-8?B?ZjI4aUNXcmFaSkw0M2gzV05oWDdxdDh1eDREdUxGYzJjT29nczAvUkFJNUVV?=
 =?utf-8?B?d3pzYjIyRE1kcDVsUFY4OGNmcmhNNndOcDdCL1VSVTZ0UUVwMUo1ZG90Vy84?=
 =?utf-8?B?Nm9qbzByYU9BZXJLSXlWNGZkeU9pR01VZkk4UkRDVUx5MGFjZVBwRFBVVjhl?=
 =?utf-8?B?RFdDemxqblZ0bzJlSzU5TGZKOUd2eFRUYStlck0zekRmaDJtbmQ4Z01qWFA0?=
 =?utf-8?B?ZVRlcUp5azcvcGYydWdUeG01RDBnQ0FGS3lNS2FYRmFINEhxT0RLTDFCR3N1?=
 =?utf-8?B?MmcvZEh0VnVrMG84MjVEaEZ1UkRTTnJ4NDlaNkdBTTFFVlMwck8zRkt2Q1d6?=
 =?utf-8?B?a1dOWU1BbDAvbXdGZmR5Z2QvTE5od0hXeTBpenV3enhSNWdMcU1OK3NOOElR?=
 =?utf-8?B?bGsxNGNoZXJ5R3VWK3Ftc2lMcGhKRk9QQVR4VjV2VmRVckliUVREN3VJYldJ?=
 =?utf-8?B?cDY4K2hqZVR3REFJNGdxWSs5ZnVRPT0=?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a21e76e-9097-4f70-2db4-08db25303130
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 08:35:11.8674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bb7YzuZoBKahmnvFKIYzQ7COHjRqbRgcIm2g5LuBmZM568jCzQm6Tqj3sDoWFQkuq40t3+NBBdTDjjTgF78WaLepAQUK8Udi7mV1A3D5niQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR13MB6053
Cc: linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Zhao Qiang <qiang.zhao@nxp.com>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
 Francois Romieu <romieu@fr.zoreil.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>,
 Wolfgang Grandegger <wg@grandegger.com>, devicetree@vger.kernel.org,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-can@vger.kernel.org, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Wei Fang <wei.fang@nxp.com>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [Linux-stm32] [PATCH] net: Use of_property_read_bool() for
	boolean properties
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

T24gVHVlLCBNYXIgMTQsIDIwMjMgYXQgMDI6MTQ6MzdQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgNTo1MOKAr0FNIFNpbW9uIEhvcm1hbiA8c2lt
b24uaG9ybWFuQGNvcmlnaW5lLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBNYXIgMTAsIDIw
MjMgYXQgMDg6NDc6MTZBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+IEl0IGlzIHBy
ZWZlcnJlZCB0byB1c2UgdHlwZWQgcHJvcGVydHkgYWNjZXNzIGZ1bmN0aW9ucyAoaS5lLgo+ID4g
PiBvZl9wcm9wZXJ0eV9yZWFkXzx0eXBlPiBmdW5jdGlvbnMpIHJhdGhlciB0aGFuIGxvdy1sZXZl
bAo+ID4gPiBvZl9nZXRfcHJvcGVydHkvb2ZfZmluZF9wcm9wZXJ0eSBmdW5jdGlvbnMgZm9yIHJl
YWRpbmcgcHJvcGVydGllcy4KPiA+ID4gQ29udmVydCByZWFkaW5nIGJvb2xlYW4gcHJvcGVydGll
cyB0byB0byBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2woKS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1i
eTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+Cj4gPiBSZXZpZXdlZC1ieTogU2lt
b24gSG9ybWFuIDxzaW1vbi5ob3JtYW5AY29yaWdpbmUuY29tPgo+ID4KPiA+IC4uLgo+ID4KPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3ZpYS92aWEtdmVsb2NpdHkuYyBi
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3ZpYS92aWEtdmVsb2NpdHkuYwo+ID4gPiBpbmRleCBhNTAy
ODEyYWM0MTguLjg2Zjc4NDNiNDU5MSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRo
ZXJuZXQvdmlhL3ZpYS12ZWxvY2l0eS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0
L3ZpYS92aWEtdmVsb2NpdHkuYwo+ID4gPiBAQCAtMjcwOSw4ICsyNzA5LDcgQEAgc3RhdGljIGlu
dCB2ZWxvY2l0eV9nZXRfcGxhdGZvcm1faW5mbyhzdHJ1Y3QgdmVsb2NpdHlfaW5mbyAqdnB0cikK
PiA+ID4gICAgICAgc3RydWN0IHJlc291cmNlIHJlczsKPiA+ID4gICAgICAgaW50IHJldDsKPiA+
ID4KPiA+ID4gLSAgICAgaWYgKG9mX2dldF9wcm9wZXJ0eSh2cHRyLT5kZXYtPm9mX25vZGUsICJu
by1lZXByb20iLCBOVUxMKSkKPiA+ID4gLSAgICAgICAgICAgICB2cHRyLT5ub19lZXByb20gPSAx
Owo+ID4gPiArICAgICB2cHRyLT5ub19lZXByb20gPSBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wodnB0
ci0+ZGV2LT5vZl9ub2RlLCAibm8tZWVwcm9tIik7Cj4gPgo+ID4gQXMgcGVyIG15IGNvbW1lbnQg
b24gIltQQVRDSF0gbmZjOiBtcnZsOiBVc2Ugb2ZfcHJvcGVydHlfcmVhZF9ib29sKCkgZm9yCj4g
PiBib29sZWFuIHByb3BlcnRpZXMiLgo+ID4KPiA+IEknbSBub3QgdGhhdCBlbnRodXNpYXN0aWMg
YWJvdXQgYXNzaWduaW5nIGEgYm9vbCB2YWx1ZSB0byBhIGZpZWxkCj4gPiB3aXRoIGFuIGludGVn
ZXIgdHlwZS4gQnV0IHRoYXQgaXMgbGlrZWx5IGEgdG9waWMgZm9yIGFub3RoZXIgcGF0Y2guCj4g
Pgo+ID4gPiAgICAgICByZXQgPSBvZl9hZGRyZXNzX3RvX3Jlc291cmNlKHZwdHItPmRldi0+b2Zf
bm9kZSwgMCwgJnJlcyk7Cj4gPiA+ICAgICAgIGlmIChyZXQpIHsKPiA+Cj4gPiAuLi4KPiA+Cj4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93YW4vZnNsX3VjY19oZGxjLmMgYi9kcml2ZXJz
L25ldC93YW4vZnNsX3VjY19oZGxjLmMKPiA+ID4gaW5kZXggMWM1M2I1NTQ2OTI3Li40N2MyYWQ3
YTNlNDIgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3dhbi9mc2xfdWNjX2hkbGMuYwo+
ID4gPiArKysgYi9kcml2ZXJzL25ldC93YW4vZnNsX3VjY19oZGxjLmMKPiA+ID4gQEAgLTExNzcs
MTQgKzExNzcsOSBAQCBzdGF0aWMgaW50IHVjY19oZGxjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gPiA+ICAgICAgIHVoZGxjX3ByaXYtPmRldiA9ICZwZGV2LT5kZXY7Cj4g
PiA+ICAgICAgIHVoZGxjX3ByaXYtPnV0X2luZm8gPSB1dF9pbmZvOwo+ID4gPgo+ID4gPiAtICAg
ICBpZiAob2ZfZ2V0X3Byb3BlcnR5KG5wLCAiZnNsLHRkbS1pbnRlcmZhY2UiLCBOVUxMKSkKPiA+
ID4gLSAgICAgICAgICAgICB1aGRsY19wcml2LT50c2EgPSAxOwo+ID4gPiAtCj4gPiA+IC0gICAg
IGlmIChvZl9nZXRfcHJvcGVydHkobnAsICJmc2wsdWNjLWludGVybmFsLWxvb3BiYWNrIiwgTlVM
TCkpCj4gPiA+IC0gICAgICAgICAgICAgdWhkbGNfcHJpdi0+bG9vcGJhY2sgPSAxOwo+ID4gPiAt
Cj4gPiA+IC0gICAgIGlmIChvZl9nZXRfcHJvcGVydHkobnAsICJmc2wsaGRsYy1idXMiLCBOVUxM
KSkKPiA+ID4gLSAgICAgICAgICAgICB1aGRsY19wcml2LT5oZGxjX2J1cyA9IDE7Cj4gPiA+ICsg
ICAgIHVoZGxjX3ByaXYtPnRzYSA9IG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgImZzbCx0ZG0t
aW50ZXJmYWNlIik7Cj4gPgo+ID4gSGVyZSB0b28uCj4gCj4gVGhlc2UgYXJlIGFscmVhZHkgYm9v
bC4KClNvcnJ5LCBJIHRob3VnaHQgSSBjaGVja2VkLiBCdXQgY2xlYXJseSBJIG1lc3NlZCBpdCB1
cCBzb21laG93LgoKPiBUdXJucyBvdXQgdGhlIG9ubHkgb25lIHRoYXQgbmVlZHMgY2hhbmdpbmcg
aXMKPiBub19lZXByb20uIG5ldGRldiBmb2xrcyBtYXJrZWQgdGhpcyBhcyBjaGFuZ2VzIHJlcXVl
c3RlZCwgc28gSSdsbCBhZGQKPiB0aGF0IGluIHYyLgoKVGhhbmtzLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
