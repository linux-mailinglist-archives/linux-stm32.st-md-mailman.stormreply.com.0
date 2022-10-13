Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 478D05FE2AF
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Oct 2022 21:28:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8DD2C6410A;
	Thu, 13 Oct 2022 19:28:49 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2080.outbound.protection.outlook.com [40.107.22.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE9CAC640FF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Oct 2022 19:28:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ljfi31VQpOFLGjfBZivfZ/h1KmArHZCONOl77LVMG/OZ+nxobyMLLFSwGrjefA1G0/vtKmRWffBTT6MGY/3dlB1Cn5FB2lofN7Nuz8h1RiUXXfjaNFDcJH0uEZpMAcKTegjo+0tcAVOW2IrW3y5U57GXdePsM8Ud5duL/FYpbhxEf5+YDB7qYlYo5p0ObTHBcL3SVDTQrGxqUdbbcDxshz7t+4TmEkcHFPp2LbTnfaaquILCAqnzhOIYLVrxkMtxbVTvBtmxX3nS/5D4E9pA/GX7JlVQ+f/TK1uZWrClOx/upBNaKXpfvQRa1Ktf6xE/pjBJvyLfbcgbuNdNcuuayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBjuBoXp0HSk2jBkZgyCAUkpmHjAmDb8fO9vGhK4UiU=;
 b=B5YdAhxo+3aXQ7Oecg7DsJe51QOxeURiMxh/9Yq3uCTcXh+ySjNN1Z8LLpolMHgqcG7dElk8cz4/2wa/k42+w2Kyk9a2mmVNCBfJVYalbrajjs9GO0JZrwcT49w2JLHIQKov8BsisO7/esJlFF4uxt1eTXiIcz1u7p/ymXgH6LtfcS2qoOTFhqw9Yw97gA1YmDycFKnxazlpRN/5nUuBwoWblG5468FliRABiANdiEwDW0N/TS0/bdUcXKKu7BuLLMGZw8ssMYXorfD0gq6iaGO/Dpks90F0B+vyGrWELaoVtWMFGzHI3MYfRju+cBnhgUdjddaAKXwaRRpA6D3Fcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBjuBoXp0HSk2jBkZgyCAUkpmHjAmDb8fO9vGhK4UiU=;
 b=X3Td2A2lStJleKj5f4oE2Y0PwBmsUKCS1oCpBeqM7APSVb8EI1T8hwc4wj8kRXzOL+qHKLAM2P2u5OaMyc9Kp1zjFAUgEewB5gCHTJGm0sDVHZcqwQ8D7UPU7/o6Y3zb9QN/O/kO6fYFHvLUi1SO992RT+RZpHb2YfFpIS8Gyjs=
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA4PR04MB7565.eurprd04.prod.outlook.com (2603:10a6:102:e7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 19:28:45 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4d83:404:c74a:7563]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4d83:404:c74a:7563%5]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 19:28:45 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew
 Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Thread-Topic: [EXT] Re: [PATCH v5 1/2] net: phylink: add mac_managed_pm in
 phylink_config structure
Thread-Index: AQHY3wk+RdYbjETnMUqpkhkADdfnU64MqomAgAAKk7A=
Date: Thu, 13 Oct 2022 19:28:45 +0000
Message-ID: <PAXPR04MB9185C63C94CE032DCEE60AE689259@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20221013133904.978802-1-shenwei.wang@nxp.com>
 <20221013133904.978802-2-shenwei.wang@nxp.com>
 <2c861748-b881-f464-abd1-1a1588e2a330@gmail.com>
In-Reply-To: <2c861748-b881-f464-abd1-1a1588e2a330@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PA4PR04MB7565:EE_
x-ms-office365-filtering-correlation-id: 639f9f92-5cae-4064-38f2-08daad51252c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 93jsEM9yzHSqH49xEul3PFIy9dCtMU1Wb+KkLy7K3NDnZoyWWSz2IMEbpkc9p5DrrkLq+dkakadvqbqtAOtCsiiJ/jvmGIqh9u7WhBJ+4lG9MrbP3BJ+9vgOyRn9A5NyeTruukQ0UNyuxIRc17aYU/E/9WZifG/4hmkW/Eymx9AHityHqhN+KgpyzEHoXsJrJ1I+GERL20njxlJSKCYlxt7reJ4alvCwmwqgrc7EadreUeQ1xDfqaoZ8gBeU7PBD9cKFpCUo47pnMh5WvaORf35G3rEeuKSbIEGUnDr0k0KslKq5J9tHY9D7eCtsAk9AZ23LUGLmJzDAVPP7dbp1+ed5gg+/TGmp+68BJvhM1Ud6Ae2UYDhfFMH2aVNjMH2MZdhMFntN5I8YKdkI4Hzy+X1IK+DKL3iCdXTxY3jRZCYLhhQBUe5n4/CyivR8V6QodhgWbmPmg1AATapuofQ8y206N3yWlGzsijRBpI3sbxcSvPZY5nMvKlB0k0rOXh7OL1swYh1F4AzPBsu5C5lxNjC6JitibnsXCWSP/t33J+0//szv7qvSHGWfJ2yqDhbKbZs1lPPoiZvON3HwFcPaKMk2i8U22s3nsddzMv0TsXEYKDB3BonmAH2ogwitpWopolA4FAfU3WkQKy1E7sLnq9E1ZcTxoGM6sgCPeIwNYXlPE7ZFEr9HiDdrsQ1phSzVwKV9YuBCEY2FiUoX6J7PSJ5o2DvJ4bAXZRQbRKul0z8S/C8jY4wB1I+zCQlvyX2E8EQVktpNEgoOE+RGktvv6g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9185.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199015)(44832011)(122000001)(9686003)(110136005)(54906003)(8936002)(316002)(52536014)(83380400001)(76116006)(66946007)(66556008)(33656002)(4326008)(8676002)(66446008)(66476007)(64756008)(55016003)(7696005)(6506007)(41300700001)(2906002)(55236004)(53546011)(86362001)(38070700005)(26005)(186003)(7416002)(71200400001)(5660300002)(38100700002)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjVMQUhFcGk2S2Zvb1pYR0JOc2JBSzZpcDNkTFByUjlKV1BJZnRIKzdmL09q?=
 =?utf-8?B?RzhVNGpzQkVlb2I5UmQzdE9iUWhqYlVhRWlBTWthbmVJbTBENll2azg5Tk04?=
 =?utf-8?B?ZHorWkdMVEpqZmxVMG1RVUZUYnZ2Q211LzM1SllKSzhqWjMvdWtXU1I1OFc0?=
 =?utf-8?B?TVFwdkY0QmgwTW1jSWw2dlpQM3ZnOU1kRDA5bzJKdzdvQ3N4MFpkT1ZMcnlI?=
 =?utf-8?B?Um1ZSWZGVlloV1RJNExMcHZLMlVGdDNSRkI0WDhXenNvbVBSa0tLOUZwZURx?=
 =?utf-8?B?c3puTmxKOENxUTFKMDlKSTJycXFOTmFBMVJGT1pVSzI5NU01QWxtL0p5cEh4?=
 =?utf-8?B?QTRNbmV5UVlxaFVLNWxQYyt6V2dmMmRJaWd3ZndMd1lmSVNvWkllUEQ3Q1lD?=
 =?utf-8?B?L21hbXVNTmRKYnRFRmNkSG5ETXBMMlFjRnZSeGQ1NWdiQ0FhUjlhelhLL25O?=
 =?utf-8?B?dlNYSzN0Z0tnY2tKNUhaSUltT1p6cGJUVWNXZFpwV1o5Mk1tcHoySjNxTVRF?=
 =?utf-8?B?MXlVSjQ4NlZHL2ZFd1dTNFRQTWtBb1lKRzB4NzdBbkFuQkEwaCtBOGswdTBG?=
 =?utf-8?B?N3U1ZzVqTWMrZ21sNlhFM3FhTUhhcndYaFlDd2JsZXltRTVlcnQ3RHdUcnpi?=
 =?utf-8?B?NmtLaG0zeGp2OGFmMTZDN3NXVU00aEdiNVZwbDhKSHVKb2RhYkV4SlZhVFp3?=
 =?utf-8?B?MlliUUU2aEJPaUdtYlBSM1duSVJ2dXRlQys3eXJ0djg3NVNlRGxjd1hqdnlX?=
 =?utf-8?B?Tm9EQXdWeGdZSlMxT0RnMW5MMWVOZGZ5RDhZQ2ltZ09wRWQ0UFBqa1hFcWg4?=
 =?utf-8?B?bEl1TFc5akJhVTF3WWlLdnVPbndqd0lWYU9KanRrRG4yR0xaUkw3V2o1bFZP?=
 =?utf-8?B?bG1qcDZBMzlleUhHbmNsN3ZEOE8wcGlJdGdBWnh5SmQ5S01kaHBYM1hGQm1O?=
 =?utf-8?B?YkpJa3d0OEdZcWRWWHlWNFlXbjlKeXIxSEZvVHVybVRkem5GYTZvNzlRVTVa?=
 =?utf-8?B?cTFRSEFlNW1ScUllU2ZoM2VVZnlwNlRlWmhUcUN2Yy9tMU1Tck5xSWRwc3hK?=
 =?utf-8?B?TFlrMDdLSzQvSG9ocUV1eUhiTGZaL2ZKTkI1WXh3MERsU3RUTEo0UCtZYmU5?=
 =?utf-8?B?MnZMUTYrMlVzOVZFbm1SRzN1WVdyU2FlVEdCa3F6MFJBQlI0Nm1ma3BCKy9m?=
 =?utf-8?B?bXBDclFiMkcrcWNMcEpLZ0NtR2RsTVFPSWZFbS94Ymg0cDR2dTJLK09nQm1X?=
 =?utf-8?B?cFBZQkpYUWlZUUJYWUUxNmdFQU9tNDdiM3lrUG1TUUdBSlRSN1h6aUpTUGQ1?=
 =?utf-8?B?US9rVmllb2FxU21EaVh2SUgreFdHc3JqTHJLNTlVbmNDRytSVXZRUE05K3Jt?=
 =?utf-8?B?RSt1L2lOcHUyQ3hzU0RyS2FabEdxZFRhd21pdERreEd3WGxIZmlWOVhCYjNO?=
 =?utf-8?B?aHNhSDRHSnp0WHRLSmliNy9xUHJjSjVTM1BFZHRhdFJ4czdiVnljSVJndm5u?=
 =?utf-8?B?MXhoVVQ3ejhWR1E1NWNSM2tPdXBwbUhRemdseWROWkN6dlVnanZyZkxNVmxu?=
 =?utf-8?B?Z3lHek83MVFkb2N5bTNuK1hWT1U3MW8vVmpxS2x5Sll1c1IwTFJtTndJTjRw?=
 =?utf-8?B?dVZkVkM0RU5JeTA2OVhPTnlxak9iQXVFZzBsY2I1K1lkM21SN3BFODVNWURh?=
 =?utf-8?B?Yk5WKy9xL1RIUlA4T2xHQUFzTm85K28xcHF0VVhlTEhNRjd3QWZMdHRObFl3?=
 =?utf-8?B?emRJWkwvYWVuNVB5TWx1YXE4c3hua0tvbXViZkxOeEJFaVVFNXkva2d2M2FR?=
 =?utf-8?B?QkY4WnA4VkFVSGIvak5vOE1jVkFCaWNUaW9seUZtKy9CWENoK09kS2EvU3Ir?=
 =?utf-8?B?d2Erb0w5aGQwREF1d2RtSUV1Wkpyb3RHWnlUSkN1Q0I5RWE1ckc1UDdEdlhj?=
 =?utf-8?B?YWE3dHZYQTZEZEtLR0JSV1I0RUNacmpWVElTamgzWldCYTJ2VmY2NStqeUl2?=
 =?utf-8?B?THNnVHlNTU02WDhKeWlESk9YWHdNaG1OTWJlREpTaWJwZXJrUFExVURabVlZ?=
 =?utf-8?B?V29BUzRMMFYweDduY0xHVnQzaGhzdDVaNFJWYVR2VVRhaFpXQW1PdGF3YXdy?=
 =?utf-8?Q?kH9wr3PVhgtFpX4gjrR0r07i6?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 639f9f92-5cae-4064-38f2-08daad51252c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2022 19:28:45.3801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 35oN2BYcPWJ7Ed4tbG2sk+ZQeHRYE3nMtckkaD9W/Ih/ImSVn5/AVoude53FCHPNa1wkGAJbA6b4KGIt1GbS6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7565
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Russell King <rmk+kernel@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [EXT] Re: [PATCH v5 1/2] net: phylink: add
 mac_managed_pm in phylink_config structure
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



> -----Original Message-----
> From: Florian Fainelli <f.fainelli@gmail.com>
> Sent: Thursday, October 13, 2022 1:48 PM
> On 10/13/22 06:39, Shenwei Wang wrote:
> > The recent commit
> >
> > 'commit 47ac7b2f6a1f ("net: phy: Warn about incorrect
> > mdio_bus_phy_resume() state")'
> >
> > requires the MAC driver explicitly tell the phy driver who is managing
> > the PM, otherwise you will see warning during resume stage.
> >
> > Add a boolean property in the phylink_config structure so that the MAC
> > driver can use it to tell the PHY driver if it wants to manage the PM.
> >
> > 'Fixes: 47ac7b2f6a1f ("net: phy: Warn about incorrect
> > mdio_bus_phy_resume() state")'
> 
> This is not the way to provide a Fixse tag, it should simply be:
> 
> Fixes: 47ac7b2f6a1f ("net: phy: Warn about incorrect
> mdio_bus_phy_resume() state"
> 

That was my original format. But it met the following warning when ran checkpatch.pl script:

./scripts/checkpatch.pl 0001-net-phylink-add-mac_managed_pm-in-phylink_config-str.patch 
WARNING: Please use correct Fixes: style 'Fixes: <12 chars of sha1> ("<title line>")' - ie: 'Fixes: e6a39ffcfe22 ("net: stmmac: Enable mac_managed_pm phylink config")'
#20: 
Fixes: 47ac7b2f6a1f ("net: phy: Warn about incorrect

That's why I changed to the current tag format.

Regards,
Shenwei

> With that fixed:
> 
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> as a courtesy, you could CC the author of the patch you are fixing BTW
> --
> Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
