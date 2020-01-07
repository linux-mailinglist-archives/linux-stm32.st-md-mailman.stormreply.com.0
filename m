Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E8C131F5F
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2020 06:34:34 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3839C36B0B;
	Tue,  7 Jan 2020 05:34:33 +0000 (UTC)
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D63AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 05:34:30 +0000 (UTC)
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200107053427epoutp0160b1e6c54be1c251cf9f5f7cc28da285~ng-F5NXqX1170511705epoutp01m
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 05:34:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200107053427epoutp0160b1e6c54be1c251cf9f5f7cc28da285~ng-F5NXqX1170511705epoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578375267;
 bh=HlAqQtGTg+FoGkYrpVJLgYfHw9gE9j12+g+flN1GrYo=;
 h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
 b=cteF8z9hf9ez0GBDvR+BP7HTw1YcOPlEOanowHGmaHo6Di6BdfFOoR2vJJjZ6Hn6d
 MnRg42IEyxZgtvq5TVseuV48nJP+ybzByNEyD8XWQSp2aSPAZ9NPeu9RFrJTWD18ky
 NDhMIO6op+a8q9pYil086EZxijUsUApe8Ll84a1M=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20200107053426epcas5p14d573e40e17222a2249fc85a3688a885~ng-E54mgn0187701877epcas5p1U;
 Tue,  7 Jan 2020 05:34:26 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 D5.72.19629.268141E5; Tue,  7 Jan 2020 14:34:26 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20200107053425epcas5p14e2b99b27fd39c3cd49ec81b039ee74a~ng-ET9KmM1995119951epcas5p1U;
 Tue,  7 Jan 2020 05:34:25 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200107053425epsmtrp10b1d8ec0bef7676cdb698bdac38938bf~ng-ETIGo71588315883epsmtrp18;
 Tue,  7 Jan 2020 05:34:25 +0000 (GMT)
X-AuditID: b6c32a4b-32dff70000014cad-ac-5e141862d254
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 89.90.10238.168141E5; Tue,  7 Jan 2020 14:34:25 +0900 (KST)
Received: from sriramdash03 (unknown [107.111.85.29]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200107053422epsmtip14b599e4d21758783755461ac0fdb89ed~ng-BKzBuw1857318573epsmtip1w;
 Tue,  7 Jan 2020 05:34:22 +0000 (GMT)
From: "Sriram Dash" <sriram.dash@samsung.com>
To: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, "'Florian
 Fainelli'" <f.fainelli@gmail.com>
In-Reply-To: <1599392.7x4dJXGyiB@diego>
Date: Tue, 7 Jan 2020 11:04:20 +0530
Message-ID: <011901d5c51c$1f93be30$5ebb3a90$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-in
Thread-Index: AQHLzAO/yISlXyWkyxclgJwcl7iTGwGwvbPnApU1MP0CKNLZ9qe/HwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+3bO2Y6j5ecUfdWKWoVkaJZWJ7I0MjlSRCD5R9h06WFJOm2b
 VkJkphbmJUW7DK9RooKmc6Wtm1qZZRejNG8JukmkVpYW2gXreCb43+99v+f5vueBjybkI5Qb
 HaPRc1qNKlYhlpK3H6319DoMTkqf1K8uTL21AzFFr9NI5teXxxJmdniMYh4/vy5iBv9MUIzR
 0k0xb81FYiaz20oxbWXOzJP6UObaran/0rFbiDF0NlFMWf0wCrRnTVW9IvaO4YOEbbh+ms0x
 VSO2sbuEYFsebGBHpu8TrOnhJGInjcv32x2U+kdzsTFJnHb9jkjpkdm2GUnCxPYT7TcryRRU
 6p+J7GjAfjAwPY0ykZSW47sIBqeMtuE7gtm6cyJeJcc/EeSbtsw72qabRILoPoKzBR0SYRhF
 8PnuDcSrxNgLXvakijMRTTthNZx/GcVrCHyZgNmhbDGvscMeYP39Q8KzIz4AFWPlFM8kXg1V
 qRkU75XhrZAyFM6vZdgBnl21kjwT2Bt6CgvEAq+DivIxQgi3AmZGKihh7wJPZrLm9k44GCwz
 lrnQgNskYKlOkwiGIJg0p9vYEUafmmzsBp9yM2x8FN7mfLQ9oIcro+WkwAHQ/K7IFmgJZP+2
 ivjMgGVwPkMuSNbAaH+D7Rp3aK7pEAnMQlZXHXkRrTQsqGZYUM2woJphQZ0yRFYjVy5BF6fm
 dJsSfDXccW+dKk6XqFF7R8XHGdHc5/Pc04SMr/a2IkwjxWLZxaWOSjmlStKdjGtFQBMKJ9mZ
 YAelXBatOpnMaeMjtImxnK4VudOkwkWWT3WFy7FapeeOclwCp50/FdF2bilIuTE577hrfu2y
 kEAyeXhP3rbiwkqP9G9I/MlMlWxSK8dPpb9oD0sKmEp7EHmoM2RX0DkNDr2gX6q/ty+ofGDV
 6WPfnCPDe3z6zA1hk296T20e6Bu071/f71K4eecSv4nS9zXjdMoi845S37/m3cU/otoLMmqK
 bz+0RDTWWlou5UoJBak7otrgSWh1qn+fBwfaeAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsWy7bCSnG6ihEicwcV+XYuNT04zWsw538Ji
 8evdEXaL/49es1ocObWEyeLenw+sFpseX2O1uLxrDptF17UnrBbHFohZHN0YbLFo6xeg0tdb
 GS1mXdjBarFg4yNGB36PLStvMnnsnHWX3WPzknqPvi2rGD22X5vH7HFwn6HH0x97mT227P/M
 6PF5k1wAZxSXTUpqTmZZapG+XQJXxutD59kLnmlUPFx6jbmBcbN8FyMnh4SAicSxHzuYuhi5
 OIQEdjNKvF18gbmLkQMoIS3x864uRI2wxMp/z9khal4wSjx5M5kFJMEmoCtx9kYTG4gtIpAu
 MefqNbBBzAKLmSU+vznNDNFxhFFi258FjCBVnALqEk9+f2UHsYUFgiVuTz8A1s0ioCKxsqmN
 FWQzr4ClRMPDGJAwr4CgxMmZT8CWMQsYSNw/1MEKYWtLLFv4mhniOgWJn0+XQcXFJY7+7GGG
 OMhN4vHPx0wTGIVnIRk1C8moWUhGzULSvoCRZRWjZGpBcW56brFhgWFearlecWJucWleul5y
 fu4mRnD8amnuYLy8JP4QowAHoxIPr4WUcJwQa2JZcWXuIUYJDmYlEd5GN8E4Id6UxMqq1KL8
 +KLSnNTiQ4zSHCxK4rxP845FCgmkJ5akZqemFqQWwWSZODilGhhj3e1k0/o/1Ap2Fi+s+mDE
 xR8as1g3MKCvoWzJmUuX6jzNjor8enhuwdpTkje1pY64/9r/KfYyy/LC803q57atSXv7YdW/
 LV9LeRncAhWvMM+w2WH15srRLJ3G2w1L7HcY2l73da1ax6979MqVjqspa641hp2Q1nP9e+Ld
 Dp6G7zUNpww0pR4psRRnJBpqMRcVJwIAhOBWH9sCAAA=
X-CMS-MailID: 20200107053425epcas5p14e2b99b27fd39c3cd49ec81b039ee74a
X-Msg-Generator: CA
CMS-TYPE: 105P
X-CMS-RootMailID: 20191219102407epcas5p103b26e6fb191f7135d870a3449115c89
References: <CGME20191219102407epcas5p103b26e6fb191f7135d870a3449115c89@epcas5p1.samsung.com>
 <1700835.tBzmY8zkgn@diego> <c25fbdb3-0e60-6e54-d58a-b05e8b805a58@gmail.com>
 <1599392.7x4dJXGyiB@diego>
Cc: Jose.Abreu@synopsys.com, jayati.sahu@samsung.com, rcsekar@samsung.com,
 pankaj.dubey@samsung.com, linux-kernel@vger.kernel.org,
 p.rajanbabu@samsung.com, linux-stm32@st-md-mailman.stormreply.com,
 stable@vger.kernel.org, netdev@vger.kernel.org, peppe.cavallaro@st.com,
 'David Miller' <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: platform: Fix MDIO init for
 platforms without PHY
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

> From: Heiko St=FCbner <heiko@sntech.de>
> Subject: Re: [PATCH] net: stmmac: platform: Fix MDIO init for platforms
without
> PHY
> =

> Hi Florian,
> =

> Am Sonntag, 5. Januar 2020, 23:22:00 CET schrieb Florian Fainelli:
> > On 1/5/2020 12:43 PM, Heiko St=FCbner wrote:
> > > Am Samstag, 21. Dezember 2019, 06:29:18 CET schrieb David Miller:
> > >> From: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> > >> Date: Thu, 19 Dec 2019 15:47:01 +0530
> > >>
> > >>> The current implementation of "stmmac_dt_phy" function initializes
> > >>> the MDIO platform bus data, even in the absence of PHY. This fix
> > >>> will skip MDIO initialization if there is no PHY present.
> > >>>
> > >>> Fixes: 7437127 ("net: stmmac: Convert to phylink and remove phylib
> > >>> logic")
> > >>> Acked-by: Jayati Sahu <jayati.sahu@samsung.com>
> > >>> Signed-off-by: Sriram Dash <sriram.dash@samsung.com>
> > >>> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> > >>
> > >> Applied and queued up for -stable, thanks.
> > >
> > > with this patch applied I now run into issues on multiple rockchip
> > > platforms using a gmac interface.
> >
> > Do you have a list of DTS files that are affected by any chance? For
> > the 32-bit platforms that I looked it, it seems like:
> >

Hi Florian, =

We have listed down the platforms which will break for as they don=92t have
the mdio / snps,dwmac-mdio node.
Arm32 spear* , Arm32 ox820*, arm32 rv1108, arc abilis* , arc axs10x*, arc
vdk_axs10x*, mips pistachio, arm64 rockchip/px30* There might be more
platforms.

> > arch/arm/boot/dts/rk3228-evb.dts is OK because it has a MDIO bus node
> > arch/arm/boot/dts/rk3229-xms6.dts is also OK
> >
> > arch/arm/boot/dts/rk3229-evb.dts is probably broken, there is no
> > phy-handle property or MDIO bus node, so it must be relying on
> > auto-scanning of the bus somehow that this patch broke.
> >
> > And likewise for most 64-bit platforms except a1 and nanopi4.
> =

> I primarily noticed that on the px30-evb.dts and the internal board I'm
working
> on right now. Both don't have that mdio bus node right now.
> =

> =

> > > When probing the driver and trying to establish a connection for a
> > > nfsroot it always runs into a null pointer in mdiobus_get_phy():
> > >
> > > [   26.878839] rk_gmac-dwmac ff360000.ethernet: IRQ eth_wake_irq not
> found
> > > [   26.886322] rk_gmac-dwmac ff360000.ethernet: IRQ eth_lpi not found
> > > [   26.894505] rk_gmac-dwmac ff360000.ethernet: PTP uses main clock
> > > [   26.908209] rk_gmac-dwmac ff360000.ethernet: clock input or output?
> (output).

... snip ...

> > >
> > >
> > > This is torvalds git head and it was still working at -rc1 and all
> > > kernels before that. When I just revert this commit, things also
> > > start working again, so I guess something must be wrong here?
> >
> > Yes, this was also identified to be problematic by the kernelci boot
> > farms on another platform, see [1].
> >
> > [1]:
> > https://lore.kernel.org/linux-arm-kernel/5e0314da.1c69fb81.a7d63.29c1@
> > mx.google.com/
> >
> > Do you mind trying this patch and letting me know if it works for you.
> > Sriram, please also try it on your platforms and let me know if solves
> > the problem you were after. Thanks
> =

> Works on both boards I had that were affected, so
> Tested-by: Heiko Stuebner <heiko@sntech.de>

Nacked-by : Sriram Dash <Sriram.dash@samsung.com>

> =

> =

> Thanks
> Heiko
> =

> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > index cc8d7e7bf9ac..e192b8e0809e 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > @@ -320,7 +320,7 @@ static int stmmac_mtl_setup(struct platform_device
> > *pdev,  static int stmmac_dt_phy(struct plat_stmmacenet_data *plat,
> >                          struct device_node *np, struct device *dev)
> > {
> > -       bool mdio =3D false;
> > +       bool mdio =3D true;
> >         static const struct of_device_id need_mdio_ids[] =3D {
> >                 { .compatible =3D "snps,dwc-qos-ethernet-4.10" },
> >                 {},
> > @@ -341,8 +341,9 @@ static int stmmac_dt_phy(struct
> > plat_stmmacenet_data *plat,
> >         }
> >
> >         if (plat->mdio_node) {

For the platforms which neither have mdio nor snps,dwmac-mdio property in
dt, they will not enter the block.
plat->mdio_node will always be false for them. Which, essentially, preserves
the mdio variable Boolean value defined at the start of the function.

> > -               dev_dbg(dev, "Found MDIO subnode\n");
> > -               mdio =3D true;
> > +               mdio =3D of_device_is_available(plat->mdio_node);
> > +               dev_dbg(dev, "Found MDIO subnode, status: %sabled\n",
> > +                       mdio ? "en" : "dis");
> >         }
> >
> >         if (mdio) {
> >
> =

> =

> =


There is a proposal for this problem solution. You can refer it at :
https://lkml.org/lkml/2020/1/7/14



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
