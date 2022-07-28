Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF0958699B
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Aug 2022 14:04:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08D26C640F5;
	Mon,  1 Aug 2022 12:04:43 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48061C03FD3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Jul 2022 10:07:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkLSdMFx0dvLAN8+0Tzkp1zQcaW7hmA81eJf/fUAycv+vEsGM21dykKlOhczsOe9ccmyfCRak5bCWYrsVE5iu71LNkuwClhc11DWFotvSzRAHwITqp1LRaFUmoQPUgek90ru6jgR1UPNayxf/GIKq3LQPvmh9rrs6qFMMrhl8SRh9w7QQfkc5ppFxYlbpVFw/5eb4wCwD51uKiMwkxFPMYFWAn/pI/b7rLrgNUg60il85zCutFlG6/+YJjMWBpbQnXJi2Faj00/3ek1IXLT08kDf2GluFFOQmms5I1jWm5SHP0mrELOL4Xat9G/C5ODyQJBixKwbzk8MjmK8na3U4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rayXoeHM6WPW0RFzGQAzSohmNxgfN0bZyks09tvXHg4=;
 b=FbvIInKE0dipWLRfBRxBhdes579YUagOtipiIT/6gP0kSmEHYpEtBee4KzwOI4+yVS2C5/HRt5Soaytm7ChtSzOBFureTdLcX0HkTNkzNFKViiVseTU02v6jZqWnjt3vuxW4Vu///nnxEGcoXt7SYiyukZZ01d5GDXkuQxOyT6WI/blufcKUTlXwnzYjQcErtDeTKrf0MopIU6z2zDrLqGvzD3CXRwOvesZwXS7H1XQhvaAOi9MTSLNzyHj+2e9t+QQqlo3/JRkkwDlcNkx17tLiB/c5EWyhSj3UURFbbvyyOS/pS0AdZEpAv10C3LSaJTUa+iUBhE83co9mTTTRTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rayXoeHM6WPW0RFzGQAzSohmNxgfN0bZyks09tvXHg4=;
 b=TJjb9jgneZ4hnXoHs5UzI/+nUaHIWzFr866ikiBZIh3uPkmd0V7oAxBOchWynl5yCH6+0jaD+tQyVymp3Ldd0SYT1qMfBdklBFlTHOFr3N2HPntLqb3srqAYsiOtKi5+w/zsgNPoLGFKPrnRiI+VSh9DrzraAsBzs5A76QzayJI=
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com (2603:10a6:20b:a9::13)
 by HE1PR0401MB2617.eurprd04.prod.outlook.com (2603:10a6:3:84::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 10:07:35 +0000
Received: from AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::4ed:ceb6:9cd:e1f3]) by AM6PR04MB5623.eurprd04.prod.outlook.com
 ([fe80::4ed:ceb6:9cd:e1f3%4]) with mapi id 15.20.5458.018; Thu, 28 Jul 2022
 10:07:34 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>
Thread-Topic: stmmac bridge issue
Thread-Index: AdiiaW7BKhPJqEeYREWoKDCgViyYMA==
Date: Thu, 28 Jul 2022 10:07:34 +0000
Message-ID: <AM6PR04MB562359328563158F3BAC9141F3969@AM6PR04MB5623.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8cd6d3e0-1e1e-4576-e173-08da7080fe2d
x-ms-traffictypediagnostic: HE1PR0401MB2617:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: deCnTb+5Ym51Yl0YyTGvNxs8IEq4SI6GyPhYHjJBr7fiKU6jdiWhCi/arFCby+NerkPTxKeZZM2V+aK4rEreM4LExbzd09Trobk/lgvt4AZUqXJwfUyWhdRsyV0AzpTT6lLr72I5f1FxgoziF7NqYQn6W6hXuEXcm/yRDsIDzRp0TI9lpoamq3atSTaJAxEx6S0HKyS7REwrV/KtgPruPMQ6X/VsjwBc4TxQ2//OXleXuASznNMTLuZjRNsMJY1Qc62SFkM/PjlBriqZj4X5R+3R0AlQ4KgxlktW9oMVH39Cwoci9JRNs25T00h5CH+b/swp11FJkD0WkB5vxHilbrMH+rrTPbnOa6fivrlTs49HA1nvILSjIgRiYQETQCzI1U07v+0ksbI8i/+Hy5ji+PbCAS70ztjBYkcmGYyH1IGoUCSvyG5QSOIj6youvKm7oBTA13Okok+R9dnkajMMcqhCD5KoNhdFq75opBxIa+tbsrfM11rFia3HneQf4M/PyoKKM74gBHWhgPusga3zobsCtT4920ytrLewzPDKZa6orqDgaOmRazHEtfdWhvYR+iuVTshEp2L0HgC0DLvv/27e7wlMXT2W/uwUR/b81F2fWkiDnQFCdjAW7fOX9L1wl/ZUfjj8mFs2fcQIx8xCW+zdkQqSLJ7XXpDw0fFfrRZE3beu4kGUWGTSM3CR15l72LuKPq2Tlfye4bMU4MH310FpVAIJ5gkMECjzdsY0Iay21O/kTp9O/06yPgQCwNt67ugeuySdl09LaIeTZXnBW2HtcBYRnlboMiY0KMNmQc8Uz0zTi4R6XUI0VTPMDWxojmZvr1p8UMHNzPf5GriOGA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5623.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(478600001)(71200400001)(316002)(99936003)(33656002)(86362001)(122000001)(38100700002)(41300700001)(186003)(7696005)(6506007)(54906003)(110136005)(26005)(9686003)(55016003)(7116003)(2906002)(52536014)(8936002)(7416002)(5660300002)(4326008)(66446008)(8676002)(66946007)(66476007)(66556008)(64756008)(76116006)(3480700007)(38070700005)(83380400001)(133083001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7/A5STheN7wT/gNNFaGCfIx6x5kfiSeh0eWtOaIqVVmvYYJaFNZvZOJZgOc2?=
 =?us-ascii?Q?XVn4A0nQiKUPqcZDLBoRoLxruntEE9naJMk2+Eiyw2zilPafaKxydBNUZtZC?=
 =?us-ascii?Q?rn2ZWyIhEz7DSynxvFA4Z1lborxr8D8LJ30jUk13fxbMTyeVSaDrN6DB3UN+?=
 =?us-ascii?Q?Fti3cB0Wro1Q2aQAfoytXmJwlX8staeHSKZAlDEohkuVw7FnD17hHw8DxKtx?=
 =?us-ascii?Q?LyV5aoZxX6lZqrxDkLtH1zj3JErg41rdO4TYJdWu/TbIYAjBJxCeyuCvgnCO?=
 =?us-ascii?Q?E1qf5/1jx5rU3NDsSd1Ycf8M2uMh9CG6FnnphnUh38WR2J2j8SBHSsaQK11M?=
 =?us-ascii?Q?dJMt/qcTPqAUvIFC0IieJOknzU4fIZCp1G0i5IFljXJaTUcDpK8peCx70Utb?=
 =?us-ascii?Q?sdApbsdA7ZTL/1mMOa6cCZ52FZRxbI1765EvsLUFRmzZn9MI88/bV2oht1A0?=
 =?us-ascii?Q?o6CqjGAqTd7e5Zh57bJNFQw4GKty2Fbaj9j6Bsiio2z5WZTLbp+T3DQR5X5t?=
 =?us-ascii?Q?3qGdW+3E5rTDGqTOAqXywyd5WitPksmkc6SAHSS3AvVUh6/sjNXH+Xxwmv5t?=
 =?us-ascii?Q?XB6nI8UoGsxkaHUM6Wg0sV8i1WLM64qj8Gqkagqn1kVYFUzWPL1RQCbBRbv6?=
 =?us-ascii?Q?dFfBUIvmyhEepYaBXY5y2G+U3aSiTJmOWTAzmzZzkD+9+2na9juHWgw8/OUX?=
 =?us-ascii?Q?VA3vxdaMCdlCHrhXVohSaEBP/14C9CgyJy3iB1i6wfTleDUWp7MStm+pa+oR?=
 =?us-ascii?Q?2sgQRkagpwL1ImeovgJ9fWjPu0hO1m16GCEBudccHN6oUBHOS8HB+Hf1D4rl?=
 =?us-ascii?Q?8c43Y5haiHspXsP6ZOUoV5CwL86IO49hnga9jgNZDKeDA3J/PjGSRV40NzfB?=
 =?us-ascii?Q?+TwC2abLIeRisVVnoLtXV7iPVXbx3zDDYolSWZ3CPqqjKII8Nu+ZFV+qCBM3?=
 =?us-ascii?Q?tpCv2yi63YeF2ragltt029/K/sRIqKeVbCod2k8gAW0aYAYAeaV9X4OVW0iv?=
 =?us-ascii?Q?oKetR6Y6v7Qd1kOniEzZ/iL1j5ixpkpexyQr5/FSkuw6fn95u4K4lxGTVLkD?=
 =?us-ascii?Q?Gp+n11PoSp3uLC53+RHgHMONf92no+WQ51bUQRar+i4hYf1td/W/1C52dDPm?=
 =?us-ascii?Q?d6qRyIdlpCZJLJaxELY88krvGcIxuUfcqnyTmCPyg5Ed2wq9JRGxnEXSwYGX?=
 =?us-ascii?Q?0s/zputo6TYZoeYySBTerD2UXjPpVn0V2QXK6aQAmcOSjZ9B62bQb/8a8VI/?=
 =?us-ascii?Q?nfe2+7foMtkmsc+77/QFu2f9pQYLDTva9wDc7yuQuGou5P21rE01g0bVaclp?=
 =?us-ascii?Q?JMDWBytrm/mEMFGJNX5/rABIcwglVQMRTc73MCbdyQK/IzniSTuaZV381pb4?=
 =?us-ascii?Q?dDL1b8urMO7wHdn5Zfld0C6w4NLL7qTMdLhDP2HHajKRO8T27qB5RpZtuTJ3?=
 =?us-ascii?Q?V4kl4eB9lGSDaliSjD+6+G28P5Mw9yts5aM+/mEWzSzjxXXUhZze+/qG0aj0?=
 =?us-ascii?Q?6IOqhrQLHURia420ixpCCKkxKlPBGJlvCdUDYwsddI9WkUS/dC+n813W3LPp?=
 =?us-ascii?Q?rnP9oyH58o2lQVBxiIDXDpQ01aTnjV+pPSs7cjrI?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5623.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd6d3e0-1e1e-4576-e173-08da7080fe2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2022 10:07:34.8734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r9zRO97l67MibZdrXzicJjk/nPrJH3+q/WkVM4UpT5TosvKJTvrGwlkY+rcVKZFkcHV4atcAf5AQL1Hk1VQfMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2617
X-Mailman-Approved-At: Mon, 01 Aug 2022 12:04:41 +0000
Cc: "sashal@kernel.org" <sashal@kernel.org>,
 "vee.khee.wong@linux.intel.com" <vee.khee.wong@linux.intel.com>,
 "tee.min.tan@linux.intel.com" <tee.min.tan@linux.intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "mohammad.athari.ismail@intel.com" <mohammad.athari.ismail@intel.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "bhupesh.sharma@linaro.org" <bhupesh.sharma@linaro.org>
Subject: [Linux-stm32] stmmac bridge issue
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
Content-Type: multipart/mixed; boundary="===============0615548752876221032=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============0615548752876221032==
Content-Language: en-US
Content-Type: multipart/related;
	boundary="_004_AM6PR04MB562359328563158F3BAC9141F3969AM6PR04MB5623eurp_";
	type="multipart/alternative"

--_004_AM6PR04MB562359328563158F3BAC9141F3969AM6PR04MB5623eurp_
Content-Type: multipart/alternative;
	boundary="_000_AM6PR04MB562359328563158F3BAC9141F3969AM6PR04MB5623eurp_"

--_000_AM6PR04MB562359328563158F3BAC9141F3969AM6PR04MB5623eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm just starting to learn to use the ENET module. I met a problem related =
with bridge, vlan and promiscuous mode.
I don't quite understand the relationship between them for now and feel tha=
t my solution was not good. Therefore, I hope to seek help in the community=
.
Thank you all in advance!

Here is the issue.
When I try to add stmmac eqos ethernet module to a bridge on i.mx8mp. An er=
ror log will be shown.

root@imx8mp-lpddr4-evk:~# brctl addbr br0

root@imx8mp-lpddr4-evk:~# brctl addif br0 eth1

[ 748.394901] br0: port 1(eth1) entered blocking state

[ 748.399940] br0: port 1(eth1) entered disabled state

[ 748.405738] device eth1 entered promiscuous mode

[ 748.410716] audit: type=3D1700 audit(1637343112.796:5): dev=3Deth1 prom=
=3D256 old_prom=3D0 auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295

[ 748.411373] imx-dwmac 30bf0000.ethernet eth1: Adding VLAN in promisc mode=
 not supported

[ 748.454575] imx-dwmac 30bf0000.ethernet eth1: failed to initialize vlan f=
iltering on this port

[ 748.464156] audit: type=3D1300 audit(1637343112.796:5): arch=3Dc00000b7 s=
yscall=3D29 success=3Dno exit=3D-1 a0=3D3 a1=3D89a2 a2=3Dffffd4626e40 a3=3D=
0 items=3D0 ppid)

[ 748.464177] br0: port 1(eth1) entered blocking state

[ 748.492156] audit: type=3D1327 audit(1637343112.796:5): proctitle=3D62726=
3746C006164646966006272300065746831

[ 748.497085] br0: port 1(eth1) entered disabled state

[ 748.511814] imx-dwmac 30bf0000.ethernet eth1: Adding VLAN in promisc mode=
 not supported

[ 748.537982] imx-dwmac 30bf0000.ethernet eth1: failed to initialize vlan f=
iltering on this port

can't add eth1 to bridge br0: Operation not permitted

I noticed that this error log came from these patches:
ed64639bc1e089 net: stmmac: Add support for VLAN Rx filtering
c89f44ff10fd4c net: stmmac: Add support for VLAN promiscuous mode


If I remove these error path directly, the eth1 can be added and bridge wor=
ks.

+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c

@@ -450,6 +450,12 @@ static int dwmac4_add_hw_vlan_rx_fltr(struct net_devic=
e *dev,

        if (vid > 4095)

                return -EINVAL;



+       if (hw->promisc) {

+               netdev_err(dev,

+                          "Adding VLAN in promisc mode not supported\n");

+               return -EPERM;

+       }

+

        /* Single Rx VLAN Filter */

        if (hw->num_vlan =3D=3D 1) {

                /* For single VLAN filter, VID 0 means VLAN promiscuous */

@@ -499,6 +505,12 @@ static int dwmac4_del_hw_vlan_rx_fltr(struct net_devic=
e *dev,

{

        int i, ret =3D 0;



+       if (hw->promisc) {

+               netdev_err(dev,

+                          "Deleting VLAN in promisc mode not supported\n")=
;

+               return -EPERM;

+       }

Or, I saw those patches above enable vlan_fail_q_en in the dwmac-intel.c.
If I enable this function in dwmac-imx.c, this issue gone.

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/=
ethernet/stmicro/stmmac/dwmac-imx.c

index 8c251db1c6ab..de6b5fddf6d9 100644

--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c

+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c

@@ -291,6 +291,8 @@ static int imx_dwmac_probe(struct platform_device *pdev=
)

        plat_dat->clks_config =3D imx_dwmac_clks_config;

        plat_dat->fix_mac_speed =3D imx_dwmac_fix_speed;

        plat_dat->bsp_priv =3D dwmac;

+       plat_dat->vlan_fail_q_en =3D true;

+       plat_dat->vlan_fail_q =3D 0;

        dwmac->plat_dat =3D plat_dat;



        ret =3D imx_dwmac_clks_config(dwmac, true);

I only found this problem so far. I'm still learning about the connection b=
etween VLAN, promiscuous mode and bridge.
I don't think the two workarounds I've found so far are good solutions to t=
his problem.
Can someone give some ideas to fix this issue?

Thanks again!


Best Regards,
Clark Wang

NXP Semiconductor Suzhou
Mobile: +86-188-6223-0436
Addr: 288 Zhuyuan Road, Suzhou New District, Suzhou, Jiansu 215011, PRC
[cid:image001.png@01D8A290.287A6590]


--_000_AM6PR04MB562359328563158F3BAC9141F3969AM6PR04MB5623eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	text-indent:21.0pt;
	font-size:10.5pt;
	font-family:DengXian;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:Consolas;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:DengXian;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
Hi,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
I'm just starting to learn to use the ENET module. I met a problem related =
with bridge, vlan and promiscuous mode.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
I don&#8217;t quite understand the relationship between them for now and fe=
el that my solution was not good. Therefore, I hope to seek help in the com=
munity.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
Thank you all in advance!<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
Here is the issue.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
When I try to add stmmac eqos ethernet module to a bridge on i.mx8mp. An er=
ror log will be shown.<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">root@imx8mp-lpddr4-evk:~=
# brctl addbr br0<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">root@imx8mp-lpddr4-evk:~=
# <b>brctl addif br0 eth1</b><o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">[ 748.394901] br0: port =
1(eth1) entered blocking state<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">[ 748.399940] br0: port =
1(eth1) entered disabled state<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">[ 748.405738] device eth=
1 entered promiscuous mode<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">[ 748.410716] audit: typ=
e=3D1700 audit(1637343112.796:5): dev=3Deth1 prom=3D256 old_prom=3D0 auid=
=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">[ 748.411373] imx-dwmac =
30bf0000.ethernet eth1:
<b>Adding VLAN in promisc mode not supported</b><o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">[ 748.454575] imx-dwmac =
30bf0000.ethernet eth1: failed to initialize vlan filtering on this port<o:=
p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">[ 748.464156] audit: typ=
e=3D1300 audit(1637343112.796:5): arch=3Dc00000b7 syscall=3D29 success=3Dno=
 exit=3D-1 a0=3D3 a1=3D89a2 a2=3Dffffd4626e40 a3=3D0 items=3D0 ppid)<o:p></=
o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">[ 748.464177] br0: port =
1(eth1) entered blocking state<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">[ 748.492156] audit: typ=
e=3D1327 audit(1637343112.796:5): proctitle=3D627263746C0061646469660062723=
00065746831<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">[ 748.497085] br0: port =
1(eth1) entered disabled state<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">[ 748.511814] imx-dwmac =
30bf0000.ethernet eth1:<b> Adding VLAN in promisc mode not supported</b><o:=
p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">[ 748.537982] imx-dwmac =
30bf0000.ethernet eth1: failed to initialize vlan filtering on this port<o:=
p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">can't add eth1 to bridge=
 br0: Operation not permitted<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
I noticed that this error log came from these patches:<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
ed64639bc1e089 net: stmmac: Add support for VLAN Rx filtering<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
c89f44ff10fd4c net: stmmac: Add support for VLAN promiscuous mode<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
If I remove these error path directly, the eth1 can be added and bridge wor=
ks.<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">+++ b/drivers/net/ethern=
et/stmicro/stmmac/dwmac4_core.c<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">@@ -450,6 +450,12 @@ sta=
tic int dwmac4_add_hw_vlan_rx_fltr(struct net_device *dev,<o:p></o:p></span=
></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; if (vid &gt; 4095)<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -=
EINVAL;<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; if (hw-&gt;promisc) {<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; netdev_err(de=
v,<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Adding VLAN in p=
romisc mode not supported\n&quot;);<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EPERM=
;<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">+<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; /* Single Rx VLAN Filter */<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; if (hw-&gt;num_vlan =3D=3D 1) {<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* For s=
ingle VLAN filter, VID 0 means VLAN promiscuous */<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">@@ -499,6 +505,12 @@ sta=
tic int dwmac4_del_hw_vlan_rx_fltr(struct net_device *dev,<o:p></o:p></span=
></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">{<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; int i, ret =3D 0;<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; if (hw-&gt;promisc) {<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; netdev_err(de=
v,<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Deleting VLAN in=
 promisc mode not supported\n&quot;);<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EPERM=
;<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
Or, I saw those patches above enable vlan_fail_q_en in the dwmac-intel.c.<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
If I enable this function in dwmac-imx.c, this issue gone.<o:p></o:p></span=
></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">diff --git a/drivers/net=
/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/=
dwmac-imx.c<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">index 8c251db1c6ab..de6b=
5fddf6d9 100644<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">--- a/drivers/net/ethern=
et/stmicro/stmmac/dwmac-imx.c<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">+++ b/drivers/net/ethern=
et/stmicro/stmmac/dwmac-imx.c<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">@@ -291,6 +291,8 @@ stat=
ic int imx_dwmac_probe(struct platform_device *pdev)<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; plat_dat-&gt;clks_config =3D imx_dwmac_clks_config;<o:p>=
</o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; plat_dat-&gt;fix_mac_speed =3D imx_dwmac_fix_speed;<o:p>=
</o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; plat_dat-&gt;bsp_priv =3D dwmac;<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"NL">+&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; plat_dat-&gt;vlan_fail_q_en =3D true;<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"NL">+&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; plat_dat-&gt;vlan_fail_q =3D 0;<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"NL">&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; dwmac-&gt;plat_dat =3D plat_dat;<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span lang=3D"NL"><o:p>&nbsp;</o:p></span></p=
>
<p class=3D"MsoListParagraph"><span lang=3D"NL">&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;</span><span lang=3D"EN-US">ret =3D imx_dwmac_clks_con=
fig(dwmac, true);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
I only found this problem so far. I'm still learning about the connection b=
etween VLAN, promiscuous mode and bridge.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
I don't think the two workarounds I've found so far are good solutions to t=
his problem.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
Can someone give some ideas to fix this issue?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
Thanks again!<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Consolas">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"font-family:Consolas">Best Regards,<o:p></o:p></span></=
p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"font-family:Consolas">Clark Wang<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US" style=3D"font-size:8.0pt"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><i><span la=
ng=3D"EN-US" style=3D"font-size:8.0pt">NXP Semiconductor Suzhou<o:p></o:p><=
/span></i></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><i><u><span=
 lang=3D"EN-US" style=3D"font-size:8.0pt">Mobile: +86-188-6223-0436<o:p></o=
:p></span></u></i></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><i><u><span=
 lang=3D"EN-US" style=3D"font-size:8.0pt">Addr: 288 Zhuyuan Road, Suzhou Ne=
w District, Suzhou, Jiansu 215011, PRC<o:p></o:p></span></u></i></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:#3333FF"><img width=3D"288" height=3D"49" style=3D"width:3.0in;height:.508=
3in" id=3D"Picture_x0020_9" src=3D"cid:image001.png@01D8A290.287A6590"></sp=
an><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_AM6PR04MB562359328563158F3BAC9141F3969AM6PR04MB5623eurp_--

--_004_AM6PR04MB562359328563158F3BAC9141F3969AM6PR04MB5623eurp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=22041;
	creation-date="Thu, 28 Jul 2022 10:07:34 GMT";
	modification-date="Thu, 28 Jul 2022 10:07:34 GMT"
Content-ID: <image001.png@01D8A290.287A6590>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAASAAAAAxCAYAAAB6fnQKAAAACXBIWXMAAA7EAAAOxAGVKw4bAAA5
5WlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0w
TXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRh
LyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMwNjcgNzkuMTU3NzQ3LCAyMDE1LzAzLzMw
LTIzOjQwOjQyICAgICAgICAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMu
b3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJk
ZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFw
LzEuMC8iCiAgICAgICAgICAgIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMv
MS4xLyIKICAgICAgICAgICAgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bo
b3Rvc2hvcC8xLjAvIgogICAgICAgICAgICB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNv
bS94YXAvMS4wL21tLyIKICAgICAgICAgICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5j
b20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgICAgICAgICAgeG1sbnM6dGlmZj0i
aHR0cDovL25zLmFkb2JlLmNvbS90aWZmLzEuMC8iCiAgICAgICAgICAgIHhtbG5zOmV4aWY9Imh0
dHA6Ly9ucy5hZG9iZS5jb20vZXhpZi8xLjAvIj4KICAgICAgICAgPHhtcDpDcmVhdG9yVG9vbD5B
ZG9iZSBQaG90b3Nob3AgQ0MgMjAxNSAoTWFjaW50b3NoKTwveG1wOkNyZWF0b3JUb29sPgogICAg
ICAgICA8eG1wOkNyZWF0ZURhdGU+MjAxNS0xMi0wMVQxMDo1OTo1MS0wNjowMDwveG1wOkNyZWF0
ZURhdGU+CiAgICAgICAgIDx4bXA6TW9kaWZ5RGF0ZT4yMDE1LTEyLTAxVDExOjA1OjQwLTA2OjAw
PC94bXA6TW9kaWZ5RGF0ZT4KICAgICAgICAgPHhtcDpNZXRhZGF0YURhdGU+MjAxNS0xMi0wMVQx
MTowNTo0MC0wNjowMDwveG1wOk1ldGFkYXRhRGF0ZT4KICAgICAgICAgPGRjOmZvcm1hdD5pbWFn
ZS9wbmc8L2RjOmZvcm1hdD4KICAgICAgICAgPHBob3Rvc2hvcDpDb2xvck1vZGU+MzwvcGhvdG9z
aG9wOkNvbG9yTW9kZT4KICAgICAgICAgPHhtcE1NOkluc3RhbmNlSUQ+eG1wLmlpZDozNDI2YWFl
OC05MzAwLTRkNTYtODNkMS00YmVlZWY5OTNkY2Y8L3htcE1NOkluc3RhbmNlSUQ+CiAgICAgICAg
IDx4bXBNTTpEb2N1bWVudElEPnhtcC5kaWQ6NmVhNzk0M2EtZThlYy00NTU0LTg4YjYtNzEyYWM0
ODdhOWI3PC94bXBNTTpEb2N1bWVudElEPgogICAgICAgICA8eG1wTU06T3JpZ2luYWxEb2N1bWVu
dElEPnhtcC5kaWQ6NmVhNzk0M2EtZThlYy00NTU0LTg4YjYtNzEyYWM0ODdhOWI3PC94bXBNTTpP
cmlnaW5hbERvY3VtZW50SUQ+CiAgICAgICAgIDx4bXBNTTpIaXN0b3J5PgogICAgICAgICAgICA8
cmRmOlNlcT4KICAgICAgICAgICAgICAgPHJkZjpsaSByZGY6cGFyc2VUeXBlPSJSZXNvdXJjZSI+
CiAgICAgICAgICAgICAgICAgIDxzdEV2dDphY3Rpb24+Y3JlYXRlZDwvc3RFdnQ6YWN0aW9uPgog
ICAgICAgICAgICAgICAgICA8c3RFdnQ6aW5zdGFuY2VJRD54bXAuaWlkOjZlYTc5NDNhLWU4ZWMt
NDU1NC04OGI2LTcxMmFjNDg3YTliNzwvc3RFdnQ6aW5zdGFuY2VJRD4KICAgICAgICAgICAgICAg
ICAgPHN0RXZ0OndoZW4+MjAxNS0xMi0wMVQxMDo1OTo1MS0wNjowMDwvc3RFdnQ6d2hlbj4KICAg
ICAgICAgICAgICAgICAgPHN0RXZ0OnNvZnR3YXJlQWdlbnQ+QWRvYmUgUGhvdG9zaG9wIENDIDIw
MTUgKE1hY2ludG9zaCk8L3N0RXZ0OnNvZnR3YXJlQWdlbnQ+CiAgICAgICAgICAgICAgIDwvcmRm
OmxpPgogICAgICAgICAgICAgICA8cmRmOmxpIHJkZjpwYXJzZVR5cGU9IlJlc291cmNlIj4KICAg
ICAgICAgICAgICAgICAgPHN0RXZ0OmFjdGlvbj5zYXZlZDwvc3RFdnQ6YWN0aW9uPgogICAgICAg
ICAgICAgICAgICA8c3RFdnQ6aW5zdGFuY2VJRD54bXAuaWlkOjM0MjZhYWU4LTkzMDAtNGQ1Ni04
M2QxLTRiZWVlZjk5M2RjZjwvc3RFdnQ6aW5zdGFuY2VJRD4KICAgICAgICAgICAgICAgICAgPHN0
RXZ0OndoZW4+MjAxNS0xMi0wMVQxMTowNTo0MC0wNjowMDwvc3RFdnQ6d2hlbj4KICAgICAgICAg
ICAgICAgICAgPHN0RXZ0OnNvZnR3YXJlQWdlbnQ+QWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKE1h
Y2ludG9zaCk8L3N0RXZ0OnNvZnR3YXJlQWdlbnQ+CiAgICAgICAgICAgICAgICAgIDxzdEV2dDpj
aGFuZ2VkPi88L3N0RXZ0OmNoYW5nZWQ+CiAgICAgICAgICAgICAgIDwvcmRmOmxpPgogICAgICAg
ICAgICA8L3JkZjpTZXE+CiAgICAgICAgIDwveG1wTU06SGlzdG9yeT4KICAgICAgICAgPHRpZmY6
T3JpZW50YXRpb24+MTwvdGlmZjpPcmllbnRhdGlvbj4KICAgICAgICAgPHRpZmY6WFJlc29sdXRp
b24+OTYwMDAwLzEwMDAwPC90aWZmOlhSZXNvbHV0aW9uPgogICAgICAgICA8dGlmZjpZUmVzb2x1
dGlvbj45NjAwMDAvMTAwMDA8L3RpZmY6WVJlc29sdXRpb24+CiAgICAgICAgIDx0aWZmOlJlc29s
dXRpb25Vbml0PjI8L3RpZmY6UmVzb2x1dGlvblVuaXQ+CiAgICAgICAgIDxleGlmOkNvbG9yU3Bh
Y2U+NjU1MzU8L2V4aWY6Q29sb3JTcGFjZT4KICAgICAgICAgPGV4aWY6UGl4ZWxYRGltZW5zaW9u
PjI4ODwvZXhpZjpQaXhlbFhEaW1lbnNpb24+CiAgICAgICAgIDxleGlmOlBpeGVsWURpbWVuc2lv
bj40OTwvZXhpZjpQaXhlbFlEaW1lbnNpb24+CiAgICAgIDwvcmRmOkRlc2NyaXB0aW9uPgogICA8
L3JkZjpSREY+CjwveDp4bXBtZXRhPgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo8P3hwYWNrZXQgZW5k
PSJ3Ij8+BBUoAwAAACBjSFJNAAB6JQAAgIMAAPn/AACA6QAAdTAAAOpgAAA6mAAAF2+SX8VGAAAb
rklEQVR42uydd5wV1dnHv3Pb3u0Lu/ReBERRUCzYQAUbWMJrN1HyWuOrqNGoiZpYYtQoUYyKPbbE
RtTYYlcEFUWpFnrHLbTtu7fNvH+cZ7hnZ+fevQsrrjK/z2c+sztn5sw5Z875nef5nXINy7I2APl4
2F4cB8xKd8OkSZN48sknvZLy4AGwLGvb34al/+dhezAOeC9V4Nq1a+nTp49XSh48uBCQD6jximSH
EEsXeOWVV3ol5MFDCvi8IvjhsGbNGqZPn+4VhAcPHgHtfFx11VVeIXjw4BHQzsfy5cs968eDB4+A
fhw89dRTqYLGAQ96JeRhF8T+wBMeAe0ExOPxVEF9gCO9EvKwC6ILcLRHQDsBWVlZqYJqge+9EvKw
C6IBWO8RkAcPHtoFPALy4MGDR0AePHjY9RAASKx9ELN0JkbYwUcJE4xcAiMesG/NCCvnPcFXi+ZR
XFSEibHtuj9WSWPunmzocAon7pFLp7z0ccZNi5cWxInVvo7R+C6Gv2RbmGFYVNeH6VlcyfB+ZURi
YLa4qMTCMML4fR0IZw2hMO8Iwln9fkrf6z7gPCALWAz8A7gfqAN+iVqXtpt2vwFYwCnAau36n4Fz
gJ5AAngDuBGYB+wB/EHu+c7x/quBAcCF8v8lwBigv3Rm1cCLwN+1Z34HjAJ6OTq+lZKudLhK3jVQ
/v8QuEXOOq4ELtLumwPcAfzb5b59gbuAuY4wO9+3AV8DxwCTgE+Be13S9iSwSOICuEHi7pFBPn8P
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

--_004_AM6PR04MB562359328563158F3BAC9141F3969AM6PR04MB5623eurp_--

--===============0615548752876221032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============0615548752876221032==--
