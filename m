Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F09561F3D5
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Nov 2022 14:00:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C012EC6410B;
	Mon,  7 Nov 2022 13:00:30 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8B8EC04003
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Nov 2022 13:00:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxGeF2wigfvTLyYJ48PIJT7SRZ+P+doXVXM02MmeoSaWCBddlzk1gjFVmMsRtd97JU44+PDo+U1OayjZ1XX67sSa7N1rHp9ARUbmaRtMHxG+eGcQaHee3MxNMa7tAlh1hVJyfoI4yF2l0uLvw5RTepF9/ltOUhYWagHxtU01JbJUSXz369Wy7L37uOnBH5yZWMXKZ3dlogQL1awcQrFwiCez+ZQm25RY7/TSAi4QBGAieTlF50J/DU3ZG2KU5/ZVJDfCBIKkVc57Z9elvXbbLcHAWQ7+qgt3qT+MehAOasBTbkR65mPpU1Ztf1RGJnKHvXyGi9GMWmakwTda0wZecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Y7hXv082RRO177Jkx3+duI0Rsbs+ddNcXnKRWErdsk=;
 b=AAPdl6/eg9sNdbXY2rdqENO2KgO+6H9NyuGabbxmsuNO8D8o70H6/UAuT+hT0IjcR8oJ5/Cu4lHM8RSxIZz2llJz4bktlu4DLXc+SjIFFzCill1JYf88q0cokQkJXLCBgRP+tK5Kx3ap01T4RUUL+0VMbmKd2AYbqWfnWeVkMckXEz7WUDYES6Cmd8q2UujTpNG/T/ikoB99jaSUsNA3lZEb0PxaY/bnRCzwwiOcd3Aj0y8kDWI0XmPnmzl0sLlg53dQOVIcn5d2TYALuCCmSeGdj2YDFwqpCRjZlV1ONNC9Sp85fd49gSj8RMsbGFpLhf+RK61u5D0ACBSpmwf4NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Y7hXv082RRO177Jkx3+duI0Rsbs+ddNcXnKRWErdsk=;
 b=E3D9+FuGVq63URE0UJVOkJSFwmOGqW5DXrju50AbvAK02HpLApi/ALZvSCtm72Tf1AXtk/f3E5P35s1pZWTLiH1+1k/t1WMpwetBUUpu3Uy/OO6B9CLC8Q4SpgBoAptuOVZWeF6pyrztDmPUdYWVJAUl1o+TFZUxmrsVY9b0mHc=
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by DBBPR04MB7548.eurprd04.prod.outlook.com (2603:10a6:10:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Mon, 7 Nov
 2022 13:00:27 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::4a73:29eb:28e3:f66d]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::4a73:29eb:28e3:f66d%7]) with mapi id 15.20.5791.024; Mon, 7 Nov 2022
 13:00:27 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Thread-Topic: [PATCH net-next] net: remove explicit phylink_generic_validate()
 references
Thread-Index: AQHY8HDMdl+vkQ7h8UWdK3AxPmtmWw==
Date: Mon, 7 Nov 2022 13:00:27 +0000
Message-ID: <20221107130027.5itc5uqljcs4eath@skbuf>
References: <E1or0FZ-001tRa-DI@rmk-PC.armlinux.org.uk>
 <E1or0FZ-001tRa-DI@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1or0FZ-001tRa-DI@rmk-PC.armlinux.org.uk>
 <E1or0FZ-001tRa-DI@rmk-PC.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5136:EE_|DBBPR04MB7548:EE_
x-ms-office365-filtering-correlation-id: 8379f2b8-f0ad-4486-a6ab-08dac0c00b0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DxQFl1JEwQoxGUKvmIRgjgq0/HJgmfyYCJtoXSm3p+E5BgFoxX0tTp+qdNdhtKy1xJqcnpAWm6lUku3blX2lAfq1YDoyDwg7Py+lpiKy55rTreIOANiK+TN0fX1g66Kex7Cw35bSogKqAvhi3W3NMiHoyu3+zKL/tNN/suW72uaQI1sC7poys9PoCF598nNd9NXK1LPS+qkzYJaBEdvcWxRh9bjSEwSOose8ptZld++Xrq3N99XUIBKY7ahFK0dUmtlYZKcCHhEfGQoer3V9WeXvH879LMtW1fzacGFh+oYRsnf9hlz2Bvtlt7mVMPai1tJOvs5bY8J2LdZbvNi1sWdAvWEXEJOnYY2HzAQ6LyXfsQhhD3L0afh4Cg7sfE1qMS/4KZyPOa0YdwqdlYqIkJdy39+ZJEOxuZWF7HH8T3jiY0nF26O2S/o9OigZVDFiJUu1K25suFAwDTd1tuyXVl+KDYZT4RBjL6M6s2UpOnOOy57x729wbgSe3cSLipZ0lKBMqI7PIC3Rw9ydIRswvY8HnBYU0i0zfkL9+jUCkMk1cUd6nXmk6VXER+oelDuGMbGlmWWVRrJ65RK2UFat59EZv8Njbb8001XkWjC0mUxxH+rJxXqExvYZhsK2jbDFhzpJ6UAgnQkh/I3sdb9VcAcv1cn//IaI8EGfd7bAvheyz55cw8iYkh0AWyTfGYXf2WEEqidhftlZf9bcOSRoaEthbZ30bDp5e20vLAStVXnEFqrGY5yJAdKgOnijk2qhFBXmYN0Pf5n9y9iyGDrPL/nvozRKoOn2pWRD2V4hzu8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5136.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(7916004)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199015)(26005)(6512007)(9686003)(1076003)(6506007)(186003)(122000001)(83380400001)(44832011)(4744005)(2906002)(8676002)(7406005)(7416002)(33716001)(478600001)(54906003)(71200400001)(38100700002)(6486002)(41300700001)(5660300002)(8936002)(91956017)(4326008)(316002)(76116006)(66446008)(66946007)(66556008)(64756008)(66476007)(38070700005)(86362001)(41533002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?h3I6vsmX68czQxu9DGCd7jkrk/jQBKJSRsTpk98uPf0jgERPs6UnQLwS84sm?=
 =?us-ascii?Q?q+X7moCF2lT/glSJrrUs0uaSLyJRPFs7glgg8Beyqe+JMA5w5ZKvwqo/t2RL?=
 =?us-ascii?Q?0pjiQa/OkhffwNzTCiFzjC/rFjOq40tYeRzAxFX/lBUhZD6Jq66k9GrogiRd?=
 =?us-ascii?Q?Ua11NV4hLY2uevS1LJWnmpnAVRqaRSqAcKkTFvgZlaIECQxevnixIvhLM5Iq?=
 =?us-ascii?Q?dIHdbc2L18ndi+xcMzTcUHrOraFtvnLgjVvAx0jHahulRIhsz2GPkL46ioLU?=
 =?us-ascii?Q?kapg4pMCuOlCYzOszMkuHZTbOlBa+W5eSGSC/UkMTkxraWcQua6+MHLS7nZk?=
 =?us-ascii?Q?xb08nWzcHt4qrieCk5k1GhQbTAP8ckf4UISpdhfDowXuhvoz7RiywEec/mJe?=
 =?us-ascii?Q?BC7/eC9JtLpcyACwMCUH7Wp8Y6VtpoEQj5fXYrt37sRp4pYGdi9rWjvwjKot?=
 =?us-ascii?Q?zL3mQgn1piAsVympLkVcSEwwIh7lveYZK01TXTJsMUpz3nYih49wbv8rXxHz?=
 =?us-ascii?Q?BOctaFpq6uYxW2T0Z072nCuCPLRqcKH53eemZCssGi+Zuf3gNL/fiXPwABR8?=
 =?us-ascii?Q?y0bPCXPMeVlI3O/jx60B3dMxSwBgUWgl9eiVIbl/VYLkF/q0yPGhs90oefVZ?=
 =?us-ascii?Q?yIakqd67Fe6o2DjY0rGqdYInXPv7L98roPeoav/fzbEM46Xp/toki1ICdbZs?=
 =?us-ascii?Q?YJETCrKiG+joGOghMaiXJKeMfajEPhzvwgcJLJBhhDp8qCKsKc1oiRzTwbHA?=
 =?us-ascii?Q?/hiRwbXUa956MwcQkUcHNZ5+r4tEnIekQ0CkYnKxo8w+vjy/+aaS7bfh/1bD?=
 =?us-ascii?Q?tTRrum1f5Uc0E1E3jzZyDk7GoqGVGlKcMnfRLwCUzhlhIf/oX3sXax2/1DRO?=
 =?us-ascii?Q?wzIlOR0NVING7g0uPYhnAk+JAJtsBzeU0HyN0lP3rxNnt+MAKVTD/1UaIzOe?=
 =?us-ascii?Q?wDL79hdxmZqXRTritWRSDhsjYGzSHRae3hYBvQwobiiL7RAVOLMCVlYHy3QL?=
 =?us-ascii?Q?wtpnnyBmgvtkzejDGGUJmidu3id9E6RGDurmsvhsCltjLEyw2VcIhqlmXJdU?=
 =?us-ascii?Q?pYQrYvLhKf9SvVEF0rBDqe+4F2gtgvqnah8bAxyzAkf+34Nb05gr1650OlgG?=
 =?us-ascii?Q?SuFLZX39hT++wj9GtDbUUif8+KJprnRnLieFeJy64VLFWXRkW/1oIz/m0GvW?=
 =?us-ascii?Q?HrR6Wv+zxw/A/YhK0IA4goAI8L5+opNfOHwBbolFYeVMqOcBOJI13MWduwm8?=
 =?us-ascii?Q?MYE6hOqihGY9fEG/5aFgjoBYl0fGp0MLoi1XDxWwvwVvAGdmA2fOLubJh6RY?=
 =?us-ascii?Q?BQojctrcXkWAjHVLGGiaWOJ2NsX4ZAEu7D9chwVCGPmiGz6EN1pQyTgfEYYS?=
 =?us-ascii?Q?bg4Qnq01nl4ic2qOnTloJ55G+QS5NR4hWyLhjyJMD3Ukv7J8tVqKwa0bOraI?=
 =?us-ascii?Q?CfBCLRWoMSbT2/46fqsBzQrC3/0GZnB3FBaZUbwVc8tqz0EtwGIEozceUFxz?=
 =?us-ascii?Q?kq0ofepBO5w/wix8vA3F6h3qHRTdDvAYpB//rFx8cglTZHb2isqSZ1asSWS2?=
 =?us-ascii?Q?LTBHmw+r3B9Z0lXjUlE0p826Gi8MhCmajUOziZFzKSXiFMYi8cjtqv/8HPUT?=
 =?us-ascii?Q?cg=3D=3D?=
Content-ID: <A158BAF6A45039439EFFF98CA61228A9@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8379f2b8-f0ad-4486-a6ab-08dac0c00b0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2022 13:00:27.8019 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1fmwY1au33an5lCPHExcDIMs0WlYNWEWT1Q7c1nIotVpdUp2jT3PjeUG230VmkwZKurFzkBha31ijgKTuvM1XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7548
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Madalin Bucur <madalin.bucur@nxp.com>, Chris Snook <chris.snook@gmail.com>,
 Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Joyce Ooi <joyce.ooi@intel.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
 Michal Simek <michal.simek@xilinx.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Jose Abreu <joabreu@synopsys.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 Sean Wang <sean.wang@mediatek.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Marcin Wojtas <mw@semihalf.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, Taras Chornyi <tchornyi@marvell.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH net-next] net: remove explicit
 phylink_generic_validate() references
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

On Fri, Nov 04, 2022 at 05:13:01PM +0000, Russell King (Oracle) wrote:
> Virtually all conventional network drivers are now converted to use
> phylink_generic_validate() - only DSA drivers and fman_memac remain,
> so lets remove the necessity for network drivers to explicitly set
> this member, and default to phylink_generic_validate() when unset.
> This is possible as .validate must currently be set.
> 
> Any remaining instances that have not been addressed by this patch can
> be fixed up later.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
