Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 168216D8EBB
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Apr 2023 07:16:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B22F3C6A618;
	Thu,  6 Apr 2023 05:16:53 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C05D2C6A616
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 05:16:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLgHkAp6gm4Ait9v4nUmIp9kGRu8E7lqcBWh8QcfbywTRr0GgE0DoC3OZJ18O9BA0G39e6j0AN13o9vc1fPbIXLRG8RpOcFPrDLRMgUahp8M4bhFot/S/0hIacaSVO5DWWezS9dz8h0altucWhX6NSlieOV063bAerwXiv6ZvXRF3gY5Uz8CCvaU4iELq/j0c6asVxz9+2szuQ4jt6Lhfr14TN7QmKHsdKr4ZP/Cf2J7/3RvEHLKxUKh0swCOY6p0Dc76kC0EAwUZ1q+1ZngckvaZ+gjAmNlN6lio1sNPHZgk6oDKh94QwvqKo5ohNHRd4TZ+BPZtV1Gxibar0nh4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i7edqYaIKDiXvK0e9GzJV/MbfRxPcGjPwfyCRZbI638=;
 b=Fy446DpEUmD4otB1EdETqvdpwAHBBTlJ9AxNsRshJHGavHzBPZzswmgi9DdxjfDQCwSdAA31LKr3qmyxP3Dk2Pn/kM1CrxFkD3YwIuADnNqw5OAhrf1pjzylD2H2Vg2bYq8BTgnvazGxKqy+NA7Ss1vuq/17DSTt7D+Bx/LxIU95231EQq7ZJazc6SM9rHnNaURW+pUrHrFjXuVUxRBP4U1VGN2zI/1VfcPca5vepDA6ruIcHiFgP1EFzlU0siFx82Qt5G56nth8B9/LLzkjJavnlhedVz8955y6nNflS7kcpYiyWHmlE4AAvqF58TiXeM7uaqIJmHxLMS5lST1f4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7edqYaIKDiXvK0e9GzJV/MbfRxPcGjPwfyCRZbI638=;
 b=UjLRsMJPTeRhOA4KHtsfdZn0glgpcq095U1Gpby2o0By4jvu5kDzUeRa1q4xy9xQDXS2cKtCKkVquIk0i4GIPOXGaaKBUK23e6Sa8nMbu6wdNLnxCl9aTnoO4VfVvYDwkk6K5R4HvcYuqKL3k7zatW7ptn8QtvbdemVafyWFgKc=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS8PR04MB7574.eurprd04.prod.outlook.com (2603:10a6:20b:299::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 05:16:49 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::b999:f2c6:a8cc:7b4]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::b999:f2c6:a8cc:7b4%4]) with mapi id 15.20.6254.033; Thu, 6 Apr 2023
 05:16:49 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Bjorn Andersson
 <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Thread-Topic: [PATCH 4/5] remoteproc: stm32: Allow hold boot management by the
 SCMI reset controller
Thread-Index: AQHZY+gfFgW91EuCRkiIW9Op8za+hq8am2PggACtU4CAAn0YIA==
Date: Thu, 6 Apr 2023 05:16:49 +0000
Message-ID: <DU0PR04MB94170A9BD5F46D4157196D0888919@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20230331154651.3107173-1-arnaud.pouliquen@foss.st.com>
 <20230331154651.3107173-5-arnaud.pouliquen@foss.st.com>
 <DU0PR04MB941747DDF6FD2F157A24183288939@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <6bfaef82-458e-256d-b9ba-d6d84c574d4b@foss.st.com>
In-Reply-To: <6bfaef82-458e-256d-b9ba-d6d84c574d4b@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AS8PR04MB7574:EE_
x-ms-office365-filtering-correlation-id: 49a3498a-c28a-427c-b3f2-08db365e2005
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8/qcKWHWzI3mX7XL8XCM2IMZacQCnAx3sqP4e40Gn0eITboU9RPlQiNTdWcE5R1jBlZZbfE/wSx/DI2P9wUfigJu+ZVTDSQMRV+p78uJn9aOusH3vh+XO2q9GPYxzZbGqWhfO8X00QV2QI8cvYwoQiaVlLVyzEJqVUeoYQfu66QISm4fPgxs6Lxf63xLCUeIYzrApmu7KUNDSziBrSn+UqbReaqRWphZXELDH3+FUu7DwxnIk2+ocCwc3nhwhKTfLtTQ9OXpCoikpxTFZ5n5vHi9B2BIw3fD0B9qrG1sp9YhC/oF/O+HX6IR06FeTccVCNlBXo3dPaqd4GYkkle36c/OIAYGTQv/IZxCOfQKKGOdnCyt8ut5spKdfG2DwGdwQyo2waJrv30bIsYpjEUYKXnKXDI8X+UMcMWilQtnKmz3yHMUjwNWHEi3geSZrWzK3yl43X9frOwgYZ2ByVWfDBVJ4VU0nUlnZaJWl0wPZuNyiQ50U3SAgfGD+TmacU5E9GZexWsnpYZtdl1Sc2TWRHXGGyWlxnW0lVwl7NPiuOHCJtM+b9i/0L+i/FYW69/p2W1rhQfjvI455I95VMpN8mtF5k0kXzW3CzZgmrYC8ArUXgPJ5LzVka7pYMyHsrdL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR04MB9417.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199021)(83380400001)(316002)(478600001)(71200400001)(7696005)(110136005)(54906003)(26005)(6506007)(9686003)(186003)(53546011)(5660300002)(2906002)(44832011)(7416002)(33656002)(38100700002)(4326008)(66946007)(76116006)(66446008)(64756008)(8676002)(122000001)(41300700001)(86362001)(66556008)(66476007)(52536014)(8936002)(38070700005)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUM0Y3E3WmFhNHY4aXcxWWxhMHU5elRaNVpwdy9WaW1ZZ1BVZ1AzMlJGa3lr?=
 =?utf-8?B?aXBNOUVaMXF4MVZqV0dzdi9xN05NOUJINkt0REFQRmFnaHZOYUt1OXB0NzN4?=
 =?utf-8?B?ZTR0VGdSaVpyNDFVSG4zK0FwcW9IOWlOaGo5RWV1elBycytWdDUzaDNOQlE2?=
 =?utf-8?B?M2JCdmNZS3hpS1pkSUxmeVhnNytZbEpUK0t6N3ZwcStLUExQOFQrUThvRWpZ?=
 =?utf-8?B?aUJhS1AwaHRESXEvNGZVSjAvWXJlZEdBd1JTTVFqSk9ONThuN0p6dFI0Zk5u?=
 =?utf-8?B?ejEzdEQ1MWhEWitvWG50ZjdISDROUnhSYXkzWDgzWXJmRGFFTjM5TVVobmUw?=
 =?utf-8?B?b3l6YjhES2VWLzE5RGhzMXBhYmtmZEs3c3NuTmdOZ1IxV0JjcWNRa0prMzhH?=
 =?utf-8?B?aWlwWHBjb1RyanF2VTFmS1ZEMDhiTzc1Qm16OXYzU2VvaGlIR1lBZ0VIaW5o?=
 =?utf-8?B?WUI3SmxoOXJsU2d1OG1xdUhYUWxHMWQrOHZLZXlYWWFMdzJIMTJrcURXOFNF?=
 =?utf-8?B?TENzd1VXWjFZSEVJU0FIcWozUVNibC9oeWNyZnd5UEh4c1RYWU15SVJVVy9m?=
 =?utf-8?B?Z1lZWVZxNFJFRCtyOXVnSE9raDJZb3d4YnNuN0hXRms0ZjdsYkFrUzR6dHVI?=
 =?utf-8?B?M2pvaE12a2Jvd2lFUmpGZTZ0QVdNaktxVEpCNmtzVS9jbDR3dFdrdDRadHNK?=
 =?utf-8?B?cUJpOVBFNHNUTmVVV2diNWdOaWQwbTNJYkRqbFVlYzhKd3pwVmM3eW9GaUxO?=
 =?utf-8?B?aHQyWkZKZUtpNk8wTDBHRVM5Vk5EZ0ExNG9YUjRJcmFtc0VGekd0QmRkSG9q?=
 =?utf-8?B?T2JHQmpPMlQ0NVYxY1pHc2p1clVxbGEzWUJoTkM4U2FhZ2ZBblVRV0tDeFMy?=
 =?utf-8?B?OGs2ajZYc24yNnQzS09sRE9KdkdmUzZYWUErdFo5Zms0ZEQ5WW0xV0dkMGww?=
 =?utf-8?B?alltaHRFVEFrMFV0Z2laL1RKZ3I2YUxMUVpRV2FuTHlIbCthVDJsUkRuWXN3?=
 =?utf-8?B?cGtzUmpocExBa1N6YkwxZlB4UEtKdmpxbnZ1NWUwOGdNNndHOG9maHhaSm9R?=
 =?utf-8?B?Y3ZINGRnaG5oNTVZeHhDVU1vTVNDclBTYUJtSFlLZ0JuekdFT3BsNW9aSko2?=
 =?utf-8?B?U01LNy9YdHRlM1IzN2ViTk9iU0NQUTk1RTYvaUtIaktTcHlLN1BsOVRQU0Jw?=
 =?utf-8?B?REFTL2hBMzF5cndITFNaZnZzVkNiMGhvem5tYnZtdWJrMGpCYlE3Z2laUHcz?=
 =?utf-8?B?NE05YWVjYjZEOWRCTkx4dUpwQmRtekhEZVE4K09zRFdDL0N1NHJ1aktFTFFG?=
 =?utf-8?B?QnlDa2lGOW91TFh3SzhnRjRBaEtDVmV5VXY1V29obHJnR3VPc29Xc3ppQW1M?=
 =?utf-8?B?QWRRd09pNFpjdmE1OFl6NU5vQW14dGxldk12UmRWdjJodnFaZlpZeVE3RGt1?=
 =?utf-8?B?QVd3WXJnajcrVFFQa3V0dkc2NWJNUjlLa3I5d2RvdHBhbFhYRG1raHRxQ1lX?=
 =?utf-8?B?dllzaExXWVRla2YxL0hkSGQxWDduUnErS2R3MjUwNnd5VDR5NnJ3MjBEcWtH?=
 =?utf-8?B?R0pYdzRNb0hLeVEyS3phaEtQcm4vYnA5VzBpdElkNW12NnVjako0ZzByZ1c2?=
 =?utf-8?B?dzBHNzk0OHZQY0NkRkNBZ2RqZTZnbnhYUUVXQ3NBSlBXcTdadHJLem5PdDJ1?=
 =?utf-8?B?ZStsN1RPS21PTXVwOEFQdFpqNGNMb3p0M25sK1Z2VXRheXlXZmFpZjVBQ2ZP?=
 =?utf-8?B?ZCtFbVZkSCtuM1krUHZXME85Mk9Wb3c1N0dsVkdNVDhFdDU5V2NDU3FEa3Z4?=
 =?utf-8?B?QkQ4OXFzdzEraXBjaS9qVXNBQ0ZiQys1Z3RnM0h2MGxFQk5RcFhEVzQ1dHJu?=
 =?utf-8?B?Q1hvM2dtdG1UaGk5VEh3N3M0bTU1ckU0VXJMTkt3TjNZVlNJOUhWdHdSM0Qz?=
 =?utf-8?B?S21aS3dXVW5jYTc3YXlycVVYY0wyRms4QjVPNlFLLy9EKzd4WUxrN1EwU2NW?=
 =?utf-8?B?U0QzZGNhekFmakU2VjRFYjBGczhIV1R5M3F1YUtOdWZJVitzNVBydWZWMlZP?=
 =?utf-8?B?Y3lvUTVlejN1YlgyOFlXTzQ2SkJyM1BoVURra05HQzJDK3lyODBxNGtNU1dK?=
 =?utf-8?Q?w/7E=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a3498a-c28a-427c-b3f2-08db365e2005
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2023 05:16:49.5009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D54KQ9wBT5YVdbuEe0XPtQeyZ1Tf4pibqh1ww90ikESJWT5oo4I7KFBrZyyNSLfiR11lW9aTmxUe4PaKozkSaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7574
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH 4/5] remoteproc: stm32: Allow hold boot
 management by the SCMI reset controller
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

> Subject: Re: [PATCH 4/5] remoteproc: stm32: Allow hold boot management
> by the SCMI reset controller
> 
> 
> 
> On 4/4/23 06:55, Peng Fan wrote:
> >> Subject: [PATCH 4/5] remoteproc: stm32: Allow hold boot management
> by
> >> the SCMI reset controller
> >>
> >> The hold boot can be managed by the SCMI controller as a reset.
> >> If the "hold_boot" reset is defined in the device tree, use it.
> >> Else use the syscon controller directly to access to the register.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  drivers/remoteproc/stm32_rproc.c | 34
> >> ++++++++++++++++++++++++++-----
> >> -
> >>  1 file changed, 28 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/stm32_rproc.c
> >> b/drivers/remoteproc/stm32_rproc.c
> >> index 4be651e734ee..6b0d8f30a5c7 100644
> >> --- a/drivers/remoteproc/stm32_rproc.c
> >> +++ b/drivers/remoteproc/stm32_rproc.c
> >> @@ -78,6 +78,7 @@ struct stm32_mbox {
> >>
> >>  struct stm32_rproc {
> >>  	struct reset_control *rst;
> >> +	struct reset_control *hold_boot_rst;
> >>  	struct stm32_syscon hold_boot;
> >>  	struct stm32_syscon pdds;
> >>  	struct stm32_syscon m4_state;
> >> @@ -398,6 +399,14 @@ static int stm32_rproc_set_hold_boot(struct
> >> rproc *rproc, bool hold)
> >>  	struct stm32_syscon hold_boot = ddata->hold_boot;
> >>  	int val, err;
> >>
> >> +	if (ddata->hold_boot_rst) {
> >> +		/* Use the SCMI reset controller */
> >> +		if (!hold)
> >> +			return reset_control_deassert(ddata-
> >>> hold_boot_rst);
> >> +		else
> >> +			return reset_control_assert(ddata->hold_boot_rst);
> >> +	}
> >> +
> >>  	val = hold ? HOLD_BOOT : RELEASE_BOOT;
> >>
> >>  	err = regmap_update_bits(hold_boot.map, hold_boot.reg, @@ -
> >> 693,16 +702,29 @@ static int stm32_rproc_parse_dt(struct
> >> platform_device *pdev,
> >>  		dev_info(dev, "wdg irq registered\n");
> >>  	}
> >>
> >> -	ddata->rst = devm_reset_control_get_by_index(dev, 0);
> >> +	ddata->rst = devm_reset_control_get(dev, "mcu_rst");
> > [Peng Fan]
> > This may break legacy device tree.
> 
> That partially true by the fact that I impose the "reset-names" property (but
> also suppress the "st,syscfg-tz" property)
> 
> But this should not be the case as the arch/arm/boot/dts/stm32mp151.dtsi
> is updated in patch 2/5. The DTS files associated to this chip include it.

DT  maintainers may comment, from my understanding is updating driver
should not break legacy dts, saying 5.15, 5.10 dts.

Regards,
Peng.

> 
> Thanks,
> Arnaud
> 
> 
> >
> > Regards,
> > Peng.
> >
> >>  	if (IS_ERR(ddata->rst))
> >>  		return dev_err_probe(dev, PTR_ERR(ddata->rst),
> >>  				     "failed to get mcu_reset\n");
> >>
> >> -	err = stm32_rproc_get_syscon(np, "st,syscfg-holdboot",
> >> -				     &ddata->hold_boot);
> >> -	if (err) {
> >> -		dev_err(dev, "failed to get hold boot\n");
> >> -		return err;
> >> +	ddata->hold_boot_rst = devm_reset_control_get(dev, "hold_boot");
> >> +	if (IS_ERR(ddata->hold_boot_rst)) {
> >> +		if (PTR_ERR(ddata->hold_boot_rst) == -EPROBE_DEFER)
> >> +			return PTR_ERR(ddata->hold_boot_rst);
> >> +		ddata->hold_boot_rst = NULL;
> >> +	}
> >> +
> >> +	if (!ddata->hold_boot_rst) {
> >> +		/*
> >> +		 * If the hold boot is not managed by the SCMI reset
> >> controller,
> >> +		 * manage it through the syscon controller
> >> +		 */
> >> +		err = stm32_rproc_get_syscon(np, "st,syscfg-holdboot",
> >> +					     &ddata->hold_boot);
> >> +		if (err) {
> >> +			dev_err(dev, "failed to get hold boot\n");
> >> +			return err;
> >> +		}
> >>  	}
> >>
> >>  	err = stm32_rproc_get_syscon(np, "st,syscfg-pdds", &ddata->pdds);
> >> --
> >> 2.25.1
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
