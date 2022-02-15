Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 558934B6637
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Feb 2022 09:34:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F3A5C5F1F9;
	Tue, 15 Feb 2022 08:34:50 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130075.outbound.protection.outlook.com [40.107.13.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31963C5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Feb 2022 08:34:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKiqnPR/usSCmHG1uhP8ze9zkX4ZiAAbmDmoae/kUry9I/e4R+dUF1q44a1KIuzrYdmPiBXOcygWMxzQIvzjtG3KFwU6v26lTMJ7/BUQiOyIbfg3GLwdrGX8tV+EbnjTGxP7PFEZgFSVjVZWYemJJOqdHFIvPgaINxUMz8/eCTjbQIAD6Xlu7AWxswbBqmDIc55Lj3VcO4cLj0h62pxDr0s1K+qlBT2d4D1nefTtYWZfO8m/oSga6DS9RFkiVqu8Bnd6X5x0wnHwpK5nsSx4k9kLCSpUpxXixh4NRwzB/3n+greyey09SDtJXO8G4Kh37voRvVbTALCkzrS5AJMjAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FsFPw51qzEk89oKjXpQZSrYUXtW96GExiMxkaq65oA=;
 b=HSjQXDRRnbwklV3RfGemL8yBR50QELWu1GdEu/AuwHo9EPJspHEKSGyJWIDuhtcLhWWPnNTIpkyOKxkpDIl7LXmmeCMYZn6EPK6lOIiFkuk8dJgscJY8XXgFc+SfPWTfKmC9uPxyIZnYfIW5GxKVidJCWVf/pUivK1EzXBYkvyVzAidD7Tvlp7zjm9jVj1Mqgz6nivoMdI03L/scO9yGQR51xEnxul1NEzAMis6irHxTQYl1AD2kcu8YmIhCOELtCMvRw5LhlxzEFyvopRY2dFxGQeBMh+G8P+UN0XJGmz3gQkamIyVR6mcw2ki1Um7JVu2Nsffe9zgyfg1n1sUTJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FsFPw51qzEk89oKjXpQZSrYUXtW96GExiMxkaq65oA=;
 b=gDZ5XiegTBRxMsIZFKU0rlkZh09FzIdrj2p6Sv7qMeXu3Hds0DLf8TkaTNuEsfFw8l9Eg+zblm9IhJV13xovy4V+CXkco7OkO8HIl0oXMYrOhK+bIBzgx7hkmRAX4MF5+C8Mkkvj2DXCWGIh7JQI4VGn+aTgIxQTFmufUQ7cqd4=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PR3PR04MB7434.eurprd04.prod.outlook.com (2603:10a6:102:8e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Tue, 15 Feb
 2022 08:34:46 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::448c:19d:ca9a:123e]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::448c:19d:ca9a:123e%7]) with mapi id 15.20.4975.018; Tue, 15 Feb 2022
 08:34:46 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Thread-Topic: [RFC PATCH v3 0/4] remoteproc: restructure the remoteproc VirtIO
 device
Thread-Index: AQHYEtE0wJ0OgErjykyAoYmEY+BNQKyUZypw
Date: Tue, 15 Feb 2022 08:34:46 +0000
Message-ID: <DU0PR04MB941722D995004F877DC6171D88349@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220126162405.1131323-1-arnaud.pouliquen@foss.st.com>
In-Reply-To: <20220126162405.1131323-1-arnaud.pouliquen@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4cf6a537-5962-4d97-dbef-08d9f05e05e3
x-ms-traffictypediagnostic: PR3PR04MB7434:EE_
x-microsoft-antispam-prvs: <PR3PR04MB74349429ACF6E4989B128EC988349@PR3PR04MB7434.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8iTjSxfwSfOQh1ai/QvMenfj9FHP+thP4veItWzhBUzQlZ8yFeIqtxldilGXbeCi3zL0EtSQ2RjVyx+r1GdfBP820OvOR1TJj0Ug/xOT6O7WOqaz+NhLS5RP+RqzRl6X7NZy1cjvJShMTl+mXMbYvZp5zMg++6XYGV12gpL3wh3ej5+GCRXXdUk2b1skET/QzDNIG6YNOfti7I9A65DQujAlTxjUYoyR9m+JH3j9BqProd6h9+SUmYdD+Jz55T9LeXtUKVpBB8f8en8Q3lSBYLaM3HlKHjLaW9Mtc5zd8GhBsmT8Mmzc6vfN3rMU+0WgnyhGlvgHQfkKiWgpFLObiZyWg0CDxtzWLasPKaxvZQnxNJBWYpm3YXAjefWmYM228IGoDjwF2OWwoy4LH2wdRi3mFfl/orlX/hqJrm0T8mrtuKYS/PLy8EZhDITNd6o9Rws3/hRtfFOVNJZ+Rw/XXuOWJM84MFgA4Rt6MVm2GfDbV+JS60u5kToYQMZayfHlgC/8LqfUL6DEhztJsYPAlYq9V2Rt/7YbWuMqVQBMthNQLwWYoqCcvDX8t9g55wIQC7Vkcc4d5Mrrci44nK1fXkBOCFcr2aaUfaGZULpUs1LBisjoJ5pjMpgVK/gLtzkZShm/Jy/47M8K1q94gTSd+bPCUn+um3wY8sTTTTjkPNYQgtq5S3N+tNzFjLmPcsdtmUc8qQpwnVEEkab5sYetI4qd3+iWxx0EuM1vKuaEeBrlH1PLRXcg+6xFpO7iHyvK2feQq2BN69z78H5Xo+V7NhNhyAEqp94fvhp9a1XK2pEWnUyDtxPDFTJ7+fpaDjuTMaVnSCK5S2rKKqOvV8bqpg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR04MB9417.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(44832011)(71200400001)(2906002)(110136005)(316002)(9686003)(5660300002)(33656002)(55016003)(7416002)(83380400001)(86362001)(38070700005)(8936002)(122000001)(66556008)(64756008)(66446008)(66476007)(76116006)(8676002)(4326008)(7696005)(6506007)(186003)(66946007)(45080400002)(38100700002)(508600001)(52536014)(966005)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qfMV9k/cXjBb8vgCb/hAxS7wxf+bgT2h5KTrB3z4UxfwyAnQxqfh7/5WiSP4?=
 =?us-ascii?Q?a/zGY4D2BOmufVd+4syf3MhRQmNPaQezST8/rp5TE9Z59JWMHdbdAmH5Tk8v?=
 =?us-ascii?Q?/XAiiGGlIw5lSOmOaZnAuB0VxMss/B6pLyirHApcbpESXDiaCjPEm8pgjrvV?=
 =?us-ascii?Q?02EGw1826s7hpgyRikBXRDYlbdjNHDYAg08FtoXN5qcavqIRbK/GPXHZaa9S?=
 =?us-ascii?Q?yWygd7S9zNzK9FqLZoKApZv+HlEqOgSfnPniXav8rhgb2iYy/piHin2Wp4DK?=
 =?us-ascii?Q?RDzjiUFziYkG0+67DDLXBMKD29u2qJjT8tVDSs0yncIDtejdb4sFRcvvgN0j?=
 =?us-ascii?Q?WToA6rnnVtJHI5pTBxilW+qFsa7dKZgGDpn9uju35KcFOHu1wCC/9Q69kq/w?=
 =?us-ascii?Q?TJzpwrnYacxF/4tSb13cNNBHWCB4xPDhCgkRQBI1YNqjkY7iOMTcG/NWZ0NW?=
 =?us-ascii?Q?gkhROJoVnGciYJzIXRwEOBC0OlT8w0rxIfdx1E2FIDpg3ckXHtbL0oqyFXDj?=
 =?us-ascii?Q?crZVgXgAXSP1IzDIlq2tfH/xy0vhjEi3YUtowbeuAfJ86hdWWCAtKmXQMYGm?=
 =?us-ascii?Q?M+p7H58CqsIewWRNwdZvHToZB4nwK0f3oE5x684tTSDcUvc9OMbU89/1aMK+?=
 =?us-ascii?Q?bCCX884lXY3QzavymF3KSVoq6R+LKzc+Bd+BFCQYhVMpik4ZqfQPEbWp5kda?=
 =?us-ascii?Q?0L0UJcyWl7HaGxDDWPL7yADdEVwJPuYgPKWTpJlsA7eVtrc6FbTPN3ZB+HX4?=
 =?us-ascii?Q?Ob8GLCDAIhSMUaQhmE/beSgm2xegrNDQ6c7eYnlWZw7PY1rPsBBTlI9wJxDZ?=
 =?us-ascii?Q?52QzABpGYok6O+cQRVwujVO6Rzby1ho9jfdfkBo5b+YUYFn0/kqUvl7OYtXW?=
 =?us-ascii?Q?KZE3Of8373ogWE6Dwh84bqZlxWTNy0juERcFuooDT+6RPvfP5BRjeXYl4Vde?=
 =?us-ascii?Q?wpDp+RC4nKdU1I9T7f8gBZIQm4Xfs29+yPcDwxQ6dPB9BB+shZ9XclfcoU8G?=
 =?us-ascii?Q?s9el+TnHm5IJsm+bwLJfUvujJuALcmNPuPSnQLiqDh8QWakHXmKdmh+bJqCo?=
 =?us-ascii?Q?Biu1juMBBIcrXF4MOWGNuUGU1lbroxvTfH8OoZvAeUk5sWs8Fa7GnDFeN0Fi?=
 =?us-ascii?Q?/BSmKd/o2anUU0RV8YWk6Ec+Dz49GVr9wXYAKpCjijo1tkZrCnRLl1Gk+Qeu?=
 =?us-ascii?Q?1W4OD6oSUaZJTI1TIhPHYN34Ue5zpqJparqXEkNFnkgP3nVrXIpXytJlkQqC?=
 =?us-ascii?Q?MhOljnYx4RegWdPyxI3Ht6Xoa/Yf9+DAGKJV5JZ7vnX1BXDJwBDzg/JY3K5c?=
 =?us-ascii?Q?Fms2kZnYJDoWC2FOGBUbRKE0kOchgxxfVeJdkYQGpn8esfkt03Pkm+n06TTP?=
 =?us-ascii?Q?SDlkyQ1nv55gkRBYnX7kNGlRDIiQXl+/8ao7fzVfGme/aqsRaD3zooXk0daQ?=
 =?us-ascii?Q?bMmByVaZAfV2TFCosv9B7TsvTdj9FFLeMY0ksS5p7rPGdQZHtECm0L3cLYTo?=
 =?us-ascii?Q?3UyNgqDil0xsdv4jiYN3pHSBxkKABDuHG0RVCG/NMme8OhLHWpu6fpQU6PU2?=
 =?us-ascii?Q?dxh/Hezv+MlxzsJF6fp9tzhqgavB9MrzTntB2UU6ixE2GWuAV/Tlkeee3CMM?=
 =?us-ascii?Q?7w=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf6a537-5962-4d97-dbef-08d9f05e05e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 08:34:46.4797 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XQxU60kRgmM+4uyJzL8dUpvAbtH6hkswVPEa16cf+Lr/s37LEcIeIX5xqG55lJEwe4xi8z6kaEL9W0zPhmPtkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7434
Cc: Rob Herring <robh@kernel.org>, Bruce Ashfield <bruce.ashfield@xilinx.com>,
 Stefano Stabellini <stefanos@xilinx.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-stm32] [RFC PATCH v3 0/4] remoteproc: restructure the
 remoteproc VirtIO device
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

> Subject: [RFC PATCH v3 0/4] remoteproc: restructure the remoteproc VirtIO
> device
> 
> Update from V2 [1]:
> In order to better handle error cases and to have something more
> symmetrical between the functions in charge of rvdev initialization/deletion,
> the patchset has been reworked.
>  - Introduction in the first patch, of rproc_vdev_data structure which allows
> to better
>    decorrelate the rproc from the management of the rvdev structure. This
> structure is reused
>    in the last patch of the series for the creation of the remoteproc virtio
> platform device.
>  - In addition to the previous version, the management of the vring lifecycle
> has been fully
>    migrated to the remoteproc_virtio.c (rproc_parse_vring, rproc_alloc_vring,
> rproc_free_vring)
> 
> [1]
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.or
> g%2Flkml%2F2021%2F12%2F22%2F111&amp;data=04%7C01%7Cpeng.fan%4
> 0nxp.com%7C9e663eefc30a4fbb1fdb08d9e0e855e2%7C686ea1d3bc2b4c6fa
> 92cd99c5c301635%7C0%7C0%7C637788110748757786%7CUnknown%7CT
> WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC
> JXVCI6Mn0%3D%7C3000&amp;sdata=bFfSxpPMpPRGYcMBcwxaQ152mRzf3c
> fwoFPjiJ0SIgw%3D&amp;reserved=0
> 
> Patchset description:
> 
> This series is a part of the work initiated a long time ago in the series
> "remoteproc: Decorelate virtio from core"[2]
> 
> Objective of the work:
> - Update the remoteproc VirtIO device creation (use platform device)
> - Allow to declare remoteproc VirtIO device in DT

This means not using resource table anymore with new approach?
If yes, would that introduce a problem that different M-core images
requires different dtb?

>     - declare resources associated to a remote proc VirtIO
>     - declare a list of VirtIO supported by the platform.
> - Prepare the enhancement to more VirtIO devices (e.g I2C, audio, video, ...).
>   For instance be able to declare a I2C device in a virtio-i2C node.

As my understanding virtio-i2c is a i2c bus, you could declare a i2c device
in the virtual bus without your patchset, would you please share more?

Thanks,
Peng.

> - Keep the legacy working!
> - Try to improve the picture about concerns reported by Christoph Hellwing
> [3][4]
> 
> [2]
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.or
> g%2Flkml%2F2020%2F4%2F16%2F1817&amp;data=04%7C01%7Cpeng.fan%4
> 0nxp.com%7C9e663eefc30a4fbb1fdb08d9e0e855e2%7C686ea1d3bc2b4c6fa
> 92cd99c5c301635%7C0%7C0%7C637788110748757786%7CUnknown%7CT
> WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC
> JXVCI6Mn0%3D%7C3000&amp;sdata=O2BZw5PCY19eD5xMGxrGUKC%2Fty1
> Sdc3LE6rhK4cSXvs%3D&amp;reserved=0
> [3]
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.or
> g%2Flkml%2F2021%2F6%2F23%2F607&amp;data=04%7C01%7Cpeng.fan%40
> nxp.com%7C9e663eefc30a4fbb1fdb08d9e0e855e2%7C686ea1d3bc2b4c6fa9
> 2cd99c5c301635%7C0%7C0%7C637788110748757786%7CUnknown%7CTW
> FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX
> VCI6Mn0%3D%7C3000&amp;sdata=xqX50iDeL%2BtFBOgyADnEUE5HH4gogK
> C0MwyqZSxVqNo%3D&amp;reserved=0
> [4]
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatch
> work.kernel.org%2Fproject%2Flinux-remoteproc%2Fpatch%2FAOKowLclCbO
> CKxyiJ71WeNyuAAj2q8EUtxrXbyky5E%40cp7-web-042.plabs.ch%2F&amp;da
> ta=04%7C01%7Cpeng.fan%40nxp.com%7C9e663eefc30a4fbb1fdb08d9e0e85
> 5e2%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637788110748
> 757786%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2
> luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=mvSm3wM
> LgQ%2BDFhqjXIkG8de58zFjwPSURzw55JhGNaA%3D&amp;reserved=0
> 
> In term of device tree this would result in such hiearchy (stm32mp1 example
> with 2 virtio RPMSG):
> 
> 	m4_rproc: m4@10000000 {
> 		compatible = "st,stm32mp1-m4";
> 		reg = <0x10000000 0x40000>,
> 		      <0x30000000 0x40000>,
> 		      <0x38000000 0x10000>;
>         memory-region = <&retram>, <&mcuram>,<&mcuram2>;
>         mboxes = <&ipcc 2>, <&ipcc 3>;
>         mbox-names = "shutdown", "detach";
>         status = "okay";
> 
>         #address-cells = <1>;
>         #size-cells = <0>;
> 
>         vdev@0 {
> 		compatible = "rproc-virtio";
> 		reg = <0>;
> 		virtio,id = <7>;  /* RPMSG */
> 		memory-region = <&vdev0vring0>, <&vdev0vring1>,
> <&vdev0buffer>;
> 		mboxes = <&ipcc 0>, <&ipcc 1>;
> 		mbox-names = "vq0", "vq1";
> 		status = "okay";
>         };
> 
>         vdev@1 {
> 		compatible = "rproc-virtio";
> 		reg = <1>;
> 		virtio,id = <7>;  /*RPMSG */
> 		memory-region = <&vdev1vring0>, <&vdev1vring1>,
> <&vdev1buffer>;
> 		mboxes = <&ipcc 4>, <&ipcc 5>;
> 		mbox-names = "vq0", "vq1";
> 		status = "okay";
>         };
> };
> 
> I have divided the work in 4 steps to simplify the review, This series
> implements only the step 1:
> step 1:  redefine the remoteproc VirtIO device as a platform device
>   - migrate rvdev management in remoteproc virtio.c,
>   - create a remotproc virtio config ( can be disabled for platform that not use
> VirtIO IPC.
> step 2: add possibility to declare and prob a VirtIO sub node
>   - VirtIO bindings declaration,
>   - multi DT VirtIO devices support,
>   - introduction of a remote proc virtio bind device mechanism , =>
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.
> com%2Farnopo%2Flinux%2Fcommits%2Fstep2-virtio-in-DT&amp;data=04%7
> C01%7Cpeng.fan%40nxp.com%7C9e663eefc30a4fbb1fdb08d9e0e855e2%7C
> 686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637788110748757786
> %7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
> CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=X%2B462681gcxe6
> 2GP%2BV7ji2nef%2FuTbQVvIlddcMQwtmg%3D&amp;reserved=0
> step 3: Add memory declaration in VirtIO subnode =>
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.
> com%2Farnopo%2Flinux%2Fcommits%2Fstep3-virtio-memories&amp;data=0
> 4%7C01%7Cpeng.fan%40nxp.com%7C9e663eefc30a4fbb1fdb08d9e0e855e2
> %7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637788110748757
> 786%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM
> zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=eMlXgCgrV6l46
> h3Ywv1%2BCoX3gLBabdTZs9ybsm4t4ys%3D&amp;reserved=0
> step 4: Add mailbox declaration in VirtIO subnode =>
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.
> com%2Farnopo%2Flinux%2Fcommits%2Fstep4-virtio-mailboxes&amp;data=0
> 4%7C01%7Cpeng.fan%40nxp.com%7C9e663eefc30a4fbb1fdb08d9e0e855e2
> %7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637788110748757
> 786%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM
> zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=75hApOwihqMZ
> UUKz1VcitY2VPDc6KAIwAvH8enEZOPY%3D&amp;reserved=0
> 
> Arnaud Pouliquen (4):
>   remoteproc: core: Introduce virtio device add/remove functions
>   remoteproc: core: Introduce rproc_register_rvdev function
>   remoteproc: Move rproc_vdev management to remoteproc_virtio.c
>   remoteproc: virtio: Create platform device for the remoteproc_virtio
> 
>  drivers/remoteproc/remoteproc_core.c     | 159 +++----------------
>  drivers/remoteproc/remoteproc_internal.h |  33 +++-
>  drivers/remoteproc/remoteproc_virtio.c   | 193
> ++++++++++++++++++++---
>  include/linux/remoteproc.h               |   6 +-
>  4 files changed, 227 insertions(+), 164 deletions(-)
> 
> --
> 2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
