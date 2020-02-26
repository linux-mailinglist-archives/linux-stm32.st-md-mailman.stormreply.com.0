Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D631707BF
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2020 19:32:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3546DC36B0B;
	Wed, 26 Feb 2020 18:32:59 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99102C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 18:32:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HHYbyzo9CbqJ70o39u/oK2iDC1b3rzLLg0lX6P4Ib1SyXTdAAnlmjZX4667w2vxInhOBH++tPvQCzcNR1VyqUzZ6OBhl+5Hy+v+Qun3BdItdt+X7w2t7SgVhthzA0q0SEJvzkvRiIWZxLuzyABN+ijP8xyM7UNfkDHdVJtKYHS2Bun43/ahoCn0wkfX+AytV4Gel7wvyJ3Ao2AchXRXH/tqFyd8ByA+QCR74zsPfEQEa8OOVlR1Hxnyj+qtXG/TkaYLq8x4AJLUDFV1RlKrmCz7aflVlAyYiWaM7HJ9JSP9idqibawoeztfXBw7GZ8a6IF3h0ke80v2RTOnfIU+VKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOZbHd8rb11IWwTmLIPwcGQSygILwk2WEQIOs0sYfk8=;
 b=T69WxntVRv3fxbEpaqCK9MyKDUV2hsEBdWyohb+tzHNllZSsPCuvuVt4qsfYJWVwcztG6dG5K4oD+ThK58N0SEVpe41o55GUGx527ld0CbcgkxqwSdTsnkNVlkxaNFEeTlScOMzZQkhe2idt93XCgCLnRS2eDyxBOQfpRgy6O2XDru/jkVfb4T/Uuc7Bc6qbVel9p3QJQFKITN1BE08r3FP9uz87R0/BIAeaXPF+dQE8JT7ZWYQcpbyim9sfWylSvKiUYU8Zd66PP7sCLYNWeVQXj697hjQu9Zgq37+HoxtG4u1GajHYvpKHwrH0HHl8xs/42OwmKgAF50MppyurpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOZbHd8rb11IWwTmLIPwcGQSygILwk2WEQIOs0sYfk8=;
 b=XZbg6qS8iW0pzesgXdipzht+Ffmwk9P04mM5quuLbxZDKNm+Xj9iZzG8mEIcii8O1HKoLf2onPiTfkznlTmUThl6air5fEhh7xRlJliqZINgvALtv2kpDAFN7XnnSsHU9vYhcdpq477yM3Zups39slSxc9li/2YSKtOQrBN+aUo=
Received: from DB8PR04MB6828.eurprd04.prod.outlook.com (52.133.240.149) by
 DB8PR04MB6972.eurprd04.prod.outlook.com (52.133.242.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Wed, 26 Feb 2020 18:32:55 +0000
Received: from DB8PR04MB6828.eurprd04.prod.outlook.com
 ([fe80::9484:81c6:c73b:2697]) by DB8PR04MB6828.eurprd04.prod.outlook.com
 ([fe80::9484:81c6:c73b:2697%6]) with mapi id 15.20.2750.021; Wed, 26 Feb 2020
 18:32:55 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Vladimir Oltean <olteanv@gmail.com>, Russell King - ARM Linux admin
 <linux@armlinux.org.uk>
Thread-Topic: [PATCH net-next v2 1/8] net: phylink: propagate resolved link
 config via mac_link_up()
Thread-Index: AQHV7I7foN/8WjpxZUC/+bNDIQ+7u6gtUF0AgAAN5ICAABITAIAACfwAgABPyICAAAA+gIAAAVTw
Date: Wed, 26 Feb 2020 18:32:55 +0000
Message-ID: <DB8PR04MB682837B8182CFC3359B71112E0EA0@DB8PR04MB6828.eurprd04.prod.outlook.com>
References: <20200226102312.GX25745@shell.armlinux.org.uk>
 <E1j6tqv-0003G6-BO@rmk-PC.armlinux.org.uk>
 <CA+h21hrR1Xkx9gwAT2FHqcH38L=xjWiPxmF2Er7-4fHFTrA8pQ@mail.gmail.com>
 <20200226115549.GZ25745@shell.armlinux.org.uk>
 <CA+h21hqjMBjgQDee8t=Csy5DXVUk9f=PP0hHSDfkuA746ZKzSQ@mail.gmail.com>
 <20200226133614.GA25745@shell.armlinux.org.uk>
 <CA+h21hqHfC0joRDhCQP6MntFdVaApFiC51xk=tUf3+y-C7sX_Q@mail.gmail.com>
 <CA+h21hpzCY=+0U4JgFbqGLS=Sh6SjkSt=4J9e0AGVHKJPOHq1A@mail.gmail.com>
In-Reply-To: <CA+h21hpzCY=+0U4JgFbqGLS=Sh6SjkSt=4J9e0AGVHKJPOHq1A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ioana.ciornei@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 78582035-7dfe-4969-9922-08d7baea4c2d
x-ms-traffictypediagnostic: DB8PR04MB6972:|DB8PR04MB6972:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB697259685DB74C669270AD5CE0EA0@DB8PR04MB6972.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0325F6C77B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(199004)(189003)(110136005)(186003)(316002)(81166006)(81156014)(5660300002)(478600001)(8676002)(26005)(7416002)(8936002)(7696005)(86362001)(2906002)(44832011)(33656002)(6506007)(64756008)(66556008)(66476007)(66446008)(9686003)(76116006)(54906003)(52536014)(71200400001)(55016002)(4326008)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB6972;
 H:DB8PR04MB6828.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lk1EnDL2BQJAw6fjFRszpl81GnNK0ZmzPgltBGuI20Z1oyAOd7DqLRE9nrrXkzNUjr0oQCCzvPtB9Z6q55S52uSQxuCx66g1mzzK9VoxW5zCvxG9kyytS0vBxuauHTL6pbrSQ6RebcI5id1OedlkU/uyr8xLYzcq6x2F+jGHXGU6cYDBjV8dlvZWhYixLeNge2Jzd65uHVI1WhNni5PkOxzHdYE5e2mMiwx4lwP7+jADcmUfki/7c2tv47/QfnnIuaVtpx4v1AAQO9Cp1D1FfGc9XzZHWjmKwPMOtNyIxhmFtmFSSnv9tiRQtBfKnsoaXv5HGAPmHFjsKFdKHCcXnwL1G91ARNPMQU8C5nqB+7jAw0aSor+zLOzFN1wtaxCdws0BSA60G6G9Lq30oDbRZQ84OUnAdwWftistIVofdOLllujeIwC8VaeSX5JxC9kP
x-ms-exchange-antispam-messagedata: aG9fEw0NIOt5qbiNd8POUHSzXc1m3jSw7VVJlfUjFipOT88pqB1OhLLXPYfj70mSCAz50BSe9VIVS7b/W4MkmUIGGqyRbXh+LdrSzsIktux1jHQu+LppAEdS0Ba/NshjQI9tlsugCFIXrbK4ylN+Mw==
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78582035-7dfe-4969-9922-08d7baea4c2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2020 18:32:55.8747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8c/Cu6JNceOwLaCX2P1Y+qEJ2Lo+P1DYen/5VBZjZrdvyARe3SHFBjg2VcX9qY8T63+RoHz+QjpZuW6axY2RmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6972
Cc: Andrew Lunn <andrew@lunn.ch>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>,
 Jonathan Corbet <corbet@lwn.net>, Michal Simek <michal.simek@xilinx.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 "David
 S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/8] net: phylink: propagate
 resolved link config via mac_link_up()
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

> Subject: Re: [PATCH net-next v2 1/8] net: phylink: propagate resolved link config
> via mac_link_up()
> 
> On Wed, 26 Feb 2020 at 20:21, Vladimir Oltean <olteanv@gmail.com> wrote:
> >
> > On Wed, 26 Feb 2020 at 15:36, Russell King - ARM Linux admin
> > <linux@armlinux.org.uk> wrote:
> > >
> > >
> > > dpaa2 is complicated by the firmware, and that we can't switch the
> > > interface mode between (SGMII,1000base-X) and 10G.
> > >
> > > If the firmware is in "DPMAC_LINK_TYPE_PHY" mode, it expects to be
> > > told the current link parameters via the dpmac_set_link_state() call
> > > - it isn't clear whether that needs to be called for other modes
> > > with the up/down state (firmware API documentation is poor.)
> > >
> >
> > With PCS control in Linux, I am pretty sure that you don't want
> > anything other than DPMAC_LINK_TYPE_PHY anyway.
> > Basically in DPMAC_LINK_TYPE_FIXED, the MC firmware is in control of
> > the PCS and polls its link state to emit link notifications to objects
> > connected to the DPMAC. So Linux control of PCS would class with
> 
> s/class/clash/
> 
> > firmware control of the PCS, leading to undesirable side-effects to
> > say the least.


If the DPMAC object is in DPMAC_LINK_TYPE_FIXED, the dpaa2-eth in fact
does not even connect to a phy so all the phylink interaction is not happening.
As Vladimir said, in this case it's the MC firmware's job to poll the PCS and
notify any connected objects of a link change.

> >
> > Regards,
> > -Vladimir
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
