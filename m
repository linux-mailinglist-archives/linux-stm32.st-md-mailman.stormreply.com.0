Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF11336FF6
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 11:26:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05179C5718D;
	Thu, 11 Mar 2021 10:26:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA36CC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 10:26:54 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12BAMUVX028034; Thu, 11 Mar 2021 11:26:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=rRSqiHjn7SwHn+GuviTETBtQTqXDQuQNtsb2cje7A+8=;
 b=pCxePe78RKMi+vASvOiTxEjqik+9DaG2c4NxGtjv4/JDtQFGDBJFz+bOPOZ6Nc7+iMc2
 kffPhN4y+SAS5OLaxeUP5cKo3fkZMjH2vsb25kGRqZ2XpR0Jk4Ba4FK+BiApPBu+W8Xo
 4VDeV6qA0uNZ/xzvMEhmKMfspgWLh6Z1dYvf4snnkuR2iVXkhYmR0MLLfmzsgFnUkiXI
 6pW9la6y6IxkjMX30Bb1Bi0j8tfAjOLTxdFP0fQkJYQHf6Djhw2mRZs+eFk+C/KH4mo/
 q+PU3E4oeBEKwSVcIg247YmnBWdz1446fWkTQNJxPW1C4EInl6HHodkawVj0Te+O4fVO 1A== 
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54])
 by mx07-00178001.pphosted.com with ESMTP id 3741y75g62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Mar 2021 11:26:37 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUPLu6KsxbjR9dj+WhCb9YSPEZyPa8G4daS8oWFh33/yXG4aNsRyktSAWoJf1BwjYU/iGXa3gSzSdZT19FNsEbWfgqf5KsW8DwO6mBnvdn+VNwSYRgcCwdbCx81R+31LIFyPpJR2MDU09oSxGIVfQbxTJy+IsETjIEkoafEZFnb/d2rbuRBK4Ajvknh5rmAol/KwjP+PvoweU11XcjhjLHSslAeduR4MP9wBfflicbtR/3lOJDopouYnD5TzWP1pnPiq25UiXo/xX7UAjA4+GAW33AlsUYoOpJLwZMjAxvNEosKE59UHWO7clU2IuL6DavCPPUuHUCe6EMDFQu/oHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRSqiHjn7SwHn+GuviTETBtQTqXDQuQNtsb2cje7A+8=;
 b=IX1H97lJ5SOUowXzuCawf0hcjin4cWUC/Jjmlw6Xyw4vR856UaOatFHE79S8/q0clCfWyXWZ8OJdEbrt2Z0zUt4/5MAutf1Wmxt72iAADwuzpftbIPzv7zS/YJe/gg2bq1pk6l26ekubR8tFO6FBX6yIR3jhke14LbVxMQksoSOjxDOR+8e9RNu4a/zL6wUqpVNFF98quAYSlZEu91OAJQUtQs7jINNq2pV8Vg6mnrXMVOF4qwfYXyEg2/OcISNSPxqb3uxjEgeHvlCUbE4R9jeqpF0aZs4WLaobWPMiTPF0Dp1ugZ1ygEsjZBpKiegXoaoC8CTU+FENjTFY+t85Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
Received: from AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:31d::16)
 by AM6PR10MB3064.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:e3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Thu, 11 Mar
 2021 10:26:35 +0000
Received: from AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e96b:5d97:d0a0:4aac]) by AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e96b:5d97:d0a0:4aac%4]) with mapi id 15.20.3912.031; Thu, 11 Mar 2021
 10:26:35 +0000
From: Alexandre TORGUE <alexandre.torgue@st.com>
To: dillon min <dillon.minfei@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>, Vladimir Murzin <vladimir.murzin@arm.com>,
 "afzal.mohd.ma@gmail.com" <afzal.mohd.ma@gmail.com>
Thread-Topic: [PATCH 0/8] ARM: STM32: add art-pi(stm32h750xbh6) board support
Thread-Index: AQHXEAP9VTLTArh4D0G/CLtaVTOXZ6p9JlgAgAF7XXA=
Date: Thu, 11 Mar 2021 10:26:34 +0000
Message-ID: <AS8PR10MB47127FD40F6782B279B5998BEE909@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
 <CAL9mu0LwT7GqWQY1Dpw3zLnS+oX8KFq=Lrp6NSBJvSgcsxEQVQ@mail.gmail.com>
In-Reply-To: <CAL9mu0LwT7GqWQY1Dpw3zLnS+oX8KFq=Lrp6NSBJvSgcsxEQVQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=st.com;
x-originating-ip: [165.225.76.169]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a5daf7d-185c-4c7e-996c-08d8e4782599
x-ms-traffictypediagnostic: AM6PR10MB3064:
x-microsoft-antispam-prvs: <AM6PR10MB3064284366987B521CBBE449EE909@AM6PR10MB3064.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N1h3ZhRjOIsWEJkNYUaPmxuz0DIO9uPUwrHohsGYttryCSM3kJl82wtXtP66clTAs2B4addZ+aWrheuTWx2KadjNP2FXc8ZrmHUjqOkiVdRUZi59/9B0IrH/BG1xjGls3chXs7zsleoLn07kf5Fq12PtjyZXmAFY2pLNbhehpGPAulxzAm025LzUaohCO+UX3Ii8jOyr+W2QcnrONDHTCnxnC47l2JnubOnlQuKh6UjylooKHHRzH+JHqqkkY4bZljEk3caAl+tNswgUqQEC4tjd1kRWv5SlN+Udk36sf19m42xYR8d2p4ehN9JV47NO5JyQP2KDMXYAsulEznJG86Yfu+KLTOTZtDNpSxWfbpJR3Bk4EujoMtzg9L8Y4rjZReqZjWTmcxQNYFgtBB87ao22z/aAw6x9w+SctUhPX0d6QCUibYkZTdnSow9tbcVKy3a3EV3Ti1xDewzTPPhavCS1NCWEzU2/LXyo6Qx0vHhhGW8A3cBe3iQXW27ARSgfzgM2zHjBH6Mnn16gH6Zt3a/MNkIVAhWuhF9+5CPnIxxZt+7HAVkGfKJYcraoIUHCuN+eex1YARFZwpgQN3J94PWp+WrOb+1DLikS5cFfxrrAdjXqF6zbvXlvuyweQCP7UYytGU4+7Ep1hyxnmId3C8dl5YC0mXuW8RQWdNgMmZfuftyNQkkX43yYHjgV4jVG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(316002)(52536014)(478600001)(66476007)(8936002)(66556008)(76116006)(55016002)(66946007)(9686003)(66446008)(110136005)(53546011)(6506007)(86362001)(7696005)(5660300002)(33656002)(55236004)(64756008)(8676002)(83380400001)(2906002)(921005)(186003)(26005)(7416002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QW1XdWJVQlVZVmFMTWxDaXJPcTZpVjUzbUtlMCtoN2RCb3VxRmlUK2QybEVq?=
 =?utf-8?B?SzFuQ2xTYWluKzNjcGZNQTVYTm4ydythSlZ0WWl4eVZ0ZytDM05JL3hkUGtP?=
 =?utf-8?B?M0wyOWFNWmowNUZWWWMvSUJzRFVRcVRoM2RRcC84OG5zZGQzdTl0YXNROHg1?=
 =?utf-8?B?Vm9PN0tjTnIyL1Q3Zy9kTDQ3NGdjZ2dVNSsxQWJWS2x6WTd1eFdiNTBvWEpv?=
 =?utf-8?B?UVBzbktsUFZMZVpVUXRxTDVBcC9YVVZMMHNzb3QrT1ZsNTN3WDdkSVVNdWZY?=
 =?utf-8?B?Z2pRdjdWdm9RbFFBWmVodStjUzNMWitLdFIxL2I1WGdCNHhMY2hFMG05dnVv?=
 =?utf-8?B?SWFseTkzSnJhUGxHM01sTG5PY2FUeUF3YkpIaGNoT1VoV2FNa0FDMkxyOFBG?=
 =?utf-8?B?eVlWSU1Xb3gxOWtKbWN6OUZCcStlOEc2eElOZDgrNnMwdlA3L25jVzJnRnJk?=
 =?utf-8?B?a0dNdkFTMGg1OWJWQ29JMGhHSnJOQWVYOEJyWXd2VjU1N3NUV1hTVTVCMVly?=
 =?utf-8?B?akRxUU91dC9jWXJXbEl0ODY3NDVWZnZhWGRmZENMTmFmSFBaZ1ZvZkNiSDRN?=
 =?utf-8?B?Z3hQdmV5T0R1bVkrQXJyTmNTN01NWDRSbGV0VFk3WlU0SDZBRE4vR2hxMHVL?=
 =?utf-8?B?N1l0QUxvcHJhVTJ0YjczR09mbTRBWGRRSmFORms5OU9YeDhrN2o5YWF3Wmg2?=
 =?utf-8?B?eTZqZ0czdmVma0tWdEZPLzRUYm5WQjlVVEN5Q3BRQ3J5by83WURYaVVaUUpq?=
 =?utf-8?B?VjN3a0UxVHBuWWhHOVJFS1VILzg1NmkvbXNSS2lzNG9sZWR2K2lZTDEyUEZM?=
 =?utf-8?B?RlBjSjlwUGtPOGJQWDlEaEl4dlNpMDJsN1NYSEJtdGpBYm1lZTY4ZzVjblVU?=
 =?utf-8?B?QmxabWNRbTMxZWtrRXJRZjRleXlxL1c3TGIyU0s4OHFiQmsrQ29ZUkxzdFQx?=
 =?utf-8?B?ZmxTa2IzcmsySURLTkNneGhJNnR6eHYyc2JMbUZVbFFVQzFuaHlBWm9OTEdP?=
 =?utf-8?B?VXRML3hadTMxNGNsZHdDUmxMcnptZDRFSExMQVp3NzJVUWRKUFpJQnpuUnpq?=
 =?utf-8?B?MjAvQTQrQjVKTC9neHBSNVdSMk95eG5RdG5WU00vS0ttMTkzOGlaZ0tZWXVS?=
 =?utf-8?B?UGg1Szh6VlN0Q3pZYktYK2NUaVY3aXhBajFwSHp5bGNpYWpoNGFHNGk4ZEZM?=
 =?utf-8?B?VlRuMGdqZVo5VGdac28ySHo1L3MrOTd3SEtjYzVka3lOVmwvVTFRR3Y2UzBW?=
 =?utf-8?B?Q3o0VXYxZWJLMGo0Um9IS1lHZERTU3QyaTgrenBXa3RhVFJLN3BDTnBLNWRY?=
 =?utf-8?B?dndRT0hES3JNTndMY1dXRkpQQ3N5dXQzWk40TGY0QUpTeElIZWQzV1RjajlH?=
 =?utf-8?B?eTZNdFNudlZTcEZMWkQ2aHZJcm1iQjJXUmhlMkk0WTlVdDdNdlc3VkFCYXpu?=
 =?utf-8?B?OVRrVHFvc2xLemcwLzh2RHR0dkRoZmNqWEZkUHVobEdzZ3cyUlhIdFNrSFlp?=
 =?utf-8?B?dlV5Z0ptQkRJVkk3bHVyRW83NUVQaytpQjRmOVN6WUEzOHdGQXVvd1l4VGI5?=
 =?utf-8?B?clk2eUNIZTB1ZWM3YUkvVlNrRThWdE4vY2pmMTFHbVdHZk1WU3RYYmkwZHV3?=
 =?utf-8?B?cjRkRllOSUo0TzhwbVh3NFJ5d0cvY1pUR2llbnVuQVdTcnc0aVhsZXBzam1o?=
 =?utf-8?B?bXpZZGRMYlU2UGU3MnEzVnJYK2dWeGZ0aTZrMjlOUXg3N3FpYklaZVRMM1dx?=
 =?utf-8?Q?4qTCgik7Bbu2sg5QnGRK3C7waLs2fR1IRhZKW61?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a5daf7d-185c-4c7e-996c-08d8e4782599
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2021 10:26:35.0359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nJkytI/2I9PgAm0PtxP9nsZo/HPXgYEFzwJK+9zwdv18cGEwKKIF0YYau1Nicq6gLJIQOeGhvgSs7ddJVspsRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB3064
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-11_04:2021-03-10,
 2021-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1011 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103110055
Subject: Re: [Linux-stm32] [PATCH 0/8] ARM: STM32: add art-pi(stm32h750xbh6)
	board support
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

Hi Dillon

> -----Original Message-----
> From: dillon min <dillon.minfei@gmail.com>
> Sent: mercredi 10 mars 2021 12:48
> To: Rob Herring <robh+dt@kernel.org>; Maxime Coquelin
> <mcoquelin.stm32@gmail.com>; Alexandre TORGUE
> <alexandre.torgue@st.com>; open list:OPEN FIRMWARE AND FLATTENED
> DEVICE TREE BINDINGS <devicetree@vger.kernel.org>; linux-stm32@st-md-
> mailman.stormreply.com; Linux ARM <linux-arm-
> kernel@lists.infradead.org>; Linux Kernel Mailing List <linux-
> kernel@vger.kernel.org>; linux@armlinux.org.uk; Vladimir Murzin
> <vladimir.murzin@arm.com>; afzal.mohd.ma@gmail.com
> Subject: Re: [PATCH 0/8] ARM: STM32: add art-pi(stm32h750xbh6) board
> support
> 
> for the device tree part , still waiting review. just a gentle ping.
> if Mr Alexandre torgue can take a look, would be great.
> 

Sorry for the delay. For next versions can you send it to
Alexandre.torgue@foss.st.com please.

Thanks
Alex

> thanks,
> 
> On Wed, Mar 3, 2021 at 4:05 PM <dillon.minfei@gmail.com> wrote:
> >
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > This patchset intend to add art-pi board support, this board developed
> > by rt-thread(https://www.rt-thread.org/).
> >
> > Board resources:
> >
> > 8MiB QSPI flash
> > 16MiB SPI flash
> > 32MiB SDRAM
> > AP6212 wifi,bt,fm comb
> >
> > sw context:
> > - as stm32h750 just has 128k bytes internal flash, so running a fw on
> >   internal flash to download u-boot/kernel to qspi flash, boot
> >   u-boot/kernel from qspi flash. this fw is based on rt-thread.
> > - kernel can be xip on qspi flash or load to sdram
> > - root filesystem is jffs2(created by buildroot), stored on spi flash
> >
> > to support the boad, add following changes.
> > - fix r0-r3, r12 register restore failed after svc call,
> > - add dts binding
> > - update yaml doc
> >
> > dillon min (8):
> >   ARM: ARMv7-M: Fix register restore corrupt after svc call
> >   Documentation: arm: stm32: Add stm32h750 value line
> >   dt-bindings: arm: stm32: Add compatible strings for ART-PI board
> >   dt-bindings: pinctrl: stm32: Add stm32h750 pinctrl
> >   ARM: dts: stm32: introduce stm32h7-pinctrl.dtsi to support stm32h75x
> >   ARM: dts: stm32: add stm32h750-pinctrl.dtsi
> >   ARM: dts: stm32: add support for art-pi board based on stm32h750xbh6
> >   ARM: stm32: add initial support for stm32h750
> >
> >  Documentation/arm/index.rst                        |   1 +
> >  Documentation/arm/stm32/stm32h750-overview.rst     |  33 ++
> >  .../devicetree/bindings/arm/stm32/stm32.yaml       |   4 +
> >  .../bindings/pinctrl/st,stm32-pinctrl.yaml         |   1 +
> >  arch/arm/boot/dts/Makefile                         |   1 +
> >  arch/arm/boot/dts/stm32h7-pinctrl.dtsi             | 392
> +++++++++++++++++++++
> >  arch/arm/boot/dts/stm32h743-pinctrl.dtsi           | 307 +---------------
> >  arch/arm/boot/dts/stm32h743.dtsi                   |  30 ++
> >  arch/arm/boot/dts/stm32h750-pinctrl.dtsi           |  11 +
> >  arch/arm/boot/dts/stm32h750.dtsi                   |   5 +
> >  arch/arm/boot/dts/stm32h750i-art-pi.dts            | 227 ++++++++++++
> >  arch/arm/mach-stm32/board-dt.c                     |   1 +
> >  arch/arm/mm/proc-v7m.S                             |   5 +-
> >  13 files changed, 716 insertions(+), 302 deletions(-)  create mode
> > 100644 Documentation/arm/stm32/stm32h750-overview.rst
> >  create mode 100644 arch/arm/boot/dts/stm32h7-pinctrl.dtsi
> >  create mode 100644 arch/arm/boot/dts/stm32h750-pinctrl.dtsi
> >  create mode 100644 arch/arm/boot/dts/stm32h750.dtsi  create mode
> > 100644 arch/arm/boot/dts/stm32h750i-art-pi.dts
> >
> > --
> > 2.7.4
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
