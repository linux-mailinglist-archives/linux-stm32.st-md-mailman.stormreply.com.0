Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGADLdQtFWpmTQcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2026 07:21:24 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A875D0CE6
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2026 07:21:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5059C8F290;
	Tue, 26 May 2026 05:21:23 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012057.outbound.protection.outlook.com [52.101.53.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63E0EC5A4C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2026 05:21:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpWoFX8bFONCcsOhgUTTx3Qd7pow5OaywrbjYfY0gEDxXZfuXy5Zd5acVSWeCBSC1SrC4pytgdxBdzZGSNDBlxa27Mu1b8OoOV3H6+F0bNe59C+jg/Rcu6QAfck0E+WFIBcN2E+UpYiqmYxtMFStFaUJBSAh17w6YzSUcn5Y73ySjw0hL1nUewGFqxNYex5XMOxUE3QVHyz8rzWf89snNNl3FxL2vlDFWPtsFqlqvU2T4/g3ylkcL/6COLJNzjwYVfjT2ZmWlIjmjR4kepnv/cIyes/seBZKYssV18odml+Ti376jBlolIcX9FW4KNXh7ou6h22zRbdE8UXgjhS3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqr5HK7fPNRFJtyD36b/8CmB3cO19aVrDoUmGzRHfYg=;
 b=UfJn1y6yeYD60Du2ObljscGjY/1S4s3dWtlNxqAR7gBAbumrAj57ZtEq5MqAko3clARJZUvnylaua2CrPVixu4EhTcmxv+l1AGyBPsWPU7OYvdmlwa3q2bKRm10kZZkPiDqgwB8q2Xl1vY1cOQC6WHhTxOQIpYLQ9CnEQIJx3jNgm9XzUdl/na0PTv0rdqACuPA7c5R81LxLsHuIoxPoPngDJsguQirwIdiuSluV78L9K4LEAwjZv4ByvI8A/VMKMmacwGX5gamd+3yzCrOTkMAJEFF7wlSSVFXwe+BinxZ0OKHrYcRfTZZLjtlzHKq9AujpHQFLXrV02n/luF3Eng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqr5HK7fPNRFJtyD36b/8CmB3cO19aVrDoUmGzRHfYg=;
 b=d9i/FGI4sWaCJ7ieTKXEEBDfz+SBxhm+fP7DLtVESSY7QSUB6Ypl8yGgWD+R0F85X7xoPwXGK/Gp0GcIsc5WUxMZnDMsysVeSKu+RIK9JdeZCcaurrdi1SNZRjvVl//NQnFJaDzBkzUqPfFfXijOM/NPbs/MQ+axDFVE3nlwoUpgAtHLSYMpgMXQxRRR8QYOSsWb5QmwlmS30K2nFLYfm0sslhDSzCamRJFSzdo4a8+AOiy6qkbHMnpfmG9lHeykaPAcgB+jxIpX2Qc9YxLGw581G4gfxjTLUvf3RLsK4HZaopb9M3Egv3vPnUk4hFj/4+Dl+wtTGF2hFr9E7GN0DA==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by SA1PR03MB989270.namprd03.prod.outlook.com (2603:10b6:806:4f4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 05:21:20 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 05:21:20 +0000
From: "Nazle Asmade, Muhammad Nazim Amirul"
 <muhammad.nazim.amirul.nazle.asmade@altera.com>
To: Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [PATCH] net: stmmac: Improve Tx timer arm logic further
Thread-Index: AQHc7A4Vc3yflw27/0+TxDAE53/a+rYewa4AgAEFKoA=
Date: Tue, 26 May 2026 05:21:19 +0000
Message-ID: <15badd19-15f2-4dea-a57c-334baaa66637@altera.com>
References: <20260525061653.22548-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <3766daef-80d0-4657-935a-579bf17a11d4@lunn.ch>
In-Reply-To: <3766daef-80d0-4657-935a-579bf17a11d4@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6964:EE_|SA1PR03MB989270:EE_
x-ms-office365-filtering-correlation-id: 2ba7f9a9-1f1c-4387-7811-08debae69ea0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|55112099003|38070700021|4143699003|11063799006|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: qzIcq8sSUkcrpfBYuJbWSqMAZgWXZqAYmWRT+LZ8Hog81tHEBJNf33klIa+LmQqC7Mljp+EEh7rmVOrJJ9Tiu5F80amfGf2O1jps8scFPqFmZ/Oid/LZLX9CLf5QkzNYezYKNtPfD2ohK749p8ESzCyTE+M6BKlhPL4hw/2e0TQlmYKWKHlzgJp8tATWzAC7/98ks9ddxXUeFGzPp4S5nZ4c10dkVrARPpnEOBdplJiG/bxYPDLdueJVKEMr1tbTw9IUO10ckP0+vY5wijKvVkvVvxCOgM6T5HQ3JVGjG702RyMYHieLWd+iQG34N0JzOOs5ABl5BP6HZwCeA9cQAfvMmkGfnGDHqo5F8qs3eDtbY/FdvpI2jUDdS/SaWTT0ck7lg1Rsp7WXK692ZhUlpIzC4+TyDseC7/lu0wK+pwRvd3/AwJ2+cZdEiYHLgPb1/AcCk6/U7KkYTVgqfKG27sah8fqK93QP7HPhb45Y98rrAN4MpnuVNSBBOrAnCCWxXTFYFvVTQmCcPYB7SOZ5nTKh+jTflzA2weIQRoXlECqRAj49KT0nyTtISHQGUzJ+9KBdtEMbaYGfne41s0AL19LnToOEA9SyDMAGhJLchlmdSELCwPm9tjGDUcRIfrlZtgOGb1M6/d/gNkMZf25bE4Z7/J2VzSXyzvDJTqgZPPlidUHJZwQk57z04JDjkNggQ2LASwTYJQLfx50y1LAmx1ZVw6ZJQU3wOFpCUql6tf1qo/cgpmYsBDz/YlW1qXRo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR03MB6964.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(55112099003)(38070700021)(4143699003)(11063799006)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDVYYkNINWUwVXhFbWFrNkQ4QnhaVXdGTU0vVFR3OGtjVTNzR09GbndQY1Jq?=
 =?utf-8?B?MVpvNXNlWWptZzFLWEwxRWxub09WcHRKYWNvVnlNeHpxbCtmenRnYUxVeUFV?=
 =?utf-8?B?ekZCWldWa082a202NGtJVXF5Uk4vbVJiRnBxNlVNdlI0Z2NUVGlpSU55OThC?=
 =?utf-8?B?Qi9lNFg0b0wxSHRTdEhHd0hJeTRUMGUydDZwQUVSem9WZ3UwaUdlRDh5emNK?=
 =?utf-8?B?UHBQaW5XQXZQSUJGRWk2cHptaCtQeHc1M3ptSXR2RGpZQVhKanpycEFjSGJR?=
 =?utf-8?B?ekplbzFvclRYRi91VFBOTlE3Mmp5ZVlHSWQxVll0eGR2SEUzdUhocUVKRG1V?=
 =?utf-8?B?dnRpVzBWc3l3RjUwaWhHbnBSY1JQQWRWT25vaDlHUDRwT3JIT0p4SUdZelRn?=
 =?utf-8?B?SGlFVGM1ZlFCOTUxWmhjTHZTZ1BSUVJwVXlBZmxGNWtkc3FyYUp5RXFmb3hL?=
 =?utf-8?B?OWc2Qkw5cGwybzJvR0d1S0pBT1dERW1nQVpRWW5WVzNNTzd2d1V4MDFhb2FR?=
 =?utf-8?B?SklTVVhSdGdCekl5TndQYnlrajhkejg3QnhEeVZyY3FmYUw0TzZNRU1NTFBy?=
 =?utf-8?B?OHRUSHlPeXlBU1FmeDhzL3lvbUIwMU5sU0wrYlV5ZEJ4WjR3OTlkRjdQM3VK?=
 =?utf-8?B?aDhvNXp4azlqZ2l0ZjNmWVFWRFZ2VEpsMUZIWmVPdWxPTXdPVVVsa041b2dH?=
 =?utf-8?B?OU9ScDNCeGUyNGlpTGZQd3R4NUlLOFRnQVdFbTVYOVJlL2QySUpYNzRyTllD?=
 =?utf-8?B?TytZZjVTamhFTkpKV3VOK1BaN0VCRXN0SzluS1RnWWMzNHpMbnJkUEYvZDNv?=
 =?utf-8?B?dG1PYS9YSkNFKzlOeExDNVBHTXBiYnpNQWRyemlBU2xESGdUYkJlNCt1ZUd5?=
 =?utf-8?B?QnVmTjZEWkJiRzU3SUVDNmQwNUVsakg2cWt3czdwSEpPU1JKVEMzcWFza0Z3?=
 =?utf-8?B?dXNrSkZ6a2JCaXhyRDFSSndzc2ZMYlovZHkwQnlqMnNQQ21LQ2ppSUdwRW1w?=
 =?utf-8?B?TmtKSDFtM3h3V3JleWlRdTh3MWhEQS84QUk3RjNZckZQYkNrTnVGV0U4cW51?=
 =?utf-8?B?T0xDUUtZSXo4NkcraEJLZk5WTUpwR29WSE9CSHFJZk0zdW8vdjJKbE5jYmZS?=
 =?utf-8?B?NHVTS2k0YjdYZ24vOHFrYUZpY1RhdGNIZytmUm9IQlU3VUZPMWt3VWR1Vk1Y?=
 =?utf-8?B?VGxERzRBeStTczhvR01GUzV5QjU5VDU5Q05Pa0MxWnhQclpwZTJjMFFyUmFa?=
 =?utf-8?B?TFhndHZlbi9iTUprcDd0dEF4cFFHTzRDemtsaHZKTEhJQlV3KzBMcjVId2JZ?=
 =?utf-8?B?RUxnT0IwTnlTM210ekVRVE1hZlBsNkROVkVvYTJMejN2dlhJWkI1ejVuQmQ2?=
 =?utf-8?B?a3oxTXFFbGkrUmw2QzdiblNBdGp1Sm42MHBaaVFMeUVrR0hKRmJFQTZTMTdO?=
 =?utf-8?B?OVFFVHcyZk1TbGlPcVVLZU5Zbk0rRitsVENXdHJBT1p0M2srOWc1cTUxN1BL?=
 =?utf-8?B?dE0vLzZ2ZGg2cWRSMzYwRVpHUTBiOS9vRVg3aG9MV0NiY1ZrVC9xVTBVdzFW?=
 =?utf-8?B?NlZoK1RyYXlaa3RldHdWd3poQ1VXL3lpQStyMURJelVyQkdyNDU0RGlqUE5r?=
 =?utf-8?B?ZTErTEthaTdhYUcyeXZsTm53cmVUMGlDb3RXMmRrV1JLNk9xekZvR290MHpY?=
 =?utf-8?B?OG5MZGx2czZDS3U3UzlBRFhzZ2tESnZ4Ujk3TWU0MGZURXcwWnFvbHhzMkts?=
 =?utf-8?B?a3lncjlveHpEdWkyMTMrZVI0WitSck5LaXV2WVdLbkJzTjRUN3VSTzU1OHZ1?=
 =?utf-8?B?eWhyS1BGNmxjenEyK0djYmROTExOVDBRWUNabzE5NjBCWVVhdExaMXF1ZDZB?=
 =?utf-8?B?MWlhRWRBME5zVzVhYWkwNkVlOVVvYW5BaHZ3SkFUbHZDV09pbUtyR2RQRXFX?=
 =?utf-8?B?Wkd6VTlFdmhYdE12NFVrL0prMDBxNzQrMldCVG1yM1FkT21YQklMUVlmeGNu?=
 =?utf-8?B?bTV1SGhFT0VUME4rR0lYVkRYOW9CbGk1VEdYcHVtSGFab2ZYeFhWUTlWRmZP?=
 =?utf-8?B?SUsxL0o5eS9TU3J1SmRNcFFXQmx4T2NoZHdTWS9pemNvTk5xRFFZd29iY3V2?=
 =?utf-8?B?MU1pTDJoeENzYUdwWlF1REgwNjNhRkRtaTc0OGpmblF6RlZRZXhmeGlnMnN4?=
 =?utf-8?B?RUtkNSt5ZnhnSlNiMzhoQjgwc08xQS9BOXllR0diQS9MK0Q0L3M3dGp3d3Vp?=
 =?utf-8?B?ZTlkRS9qelBqTXJWd09kaUhSM2VhZ2RSTy9kNEltcXVuaXdVOUpOVkpFUHph?=
 =?utf-8?B?eUpKcjIvOWsrK0lrdXF2UjdMcWpJa2lFRXZUdHlycEtHb1NreFl2MUx0eXVN?=
 =?utf-8?Q?Gv02cLZlMruVgsD0f3gkq96HCIc2Eljle9s6ojvqImLoK?=
x-ms-exchange-antispam-messagedata-1: h1Lhb9opcX0oeA==
Content-ID: <79AD26E532ADB14AADFBD37FFDB35A2D@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba7f9a9-1f1c-4387-7811-08debae69ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 05:21:19.9557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 79LpqjMvgSjwtBK7rvPqJyMXvmfhpGfQ8OHrifCHjEQe+W8QNWsU7d3rAgGx8pN5oBT9dLKl1eEsIu6s+ktgg3gFR2AtbrkixIQ3L9FgRoTKqHpTJSUH80+XYxvP4Y6b5VqB4E3K3QYdFWplHxad4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB989270
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "edumazet@google.com" <edumazet@google.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "rmk+kernel@armlinux.org.uk" <rmk+kernel@armlinux.org.uk>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Improve Tx timer arm logic
	further
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
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[altera.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[altera.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[muhammad.nazim.amirul.nazle.asmade@altera.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,bootlin.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[muhammad.nazim.amirul.nazle.asmade@altera.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[altera.com:-];
	NEURAL_HAM(-0.00)[-0.847];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,altera.com:mid,altera.com:email,intel.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 56A875D0CE6
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On 25/5/2026 9:46 pm, Andrew Lunn wrote:
> On Sun, May 24, 2026 at 11:16:53PM -0700, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
>> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
>>
>> Currently hrtimer_start is called even if hrtimer is
>> active. This is unnecessary and expensive in some targets.
>> This patch avoids calling hrtimer_start unnecessarily.
>>
>> Signed-off-by: Rohan G Thomas <rohan.g.thomas@intel.com>
>> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index 3591755ea30b..35da51c26248 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -3341,12 +3341,14 @@ static void stmmac_tx_timer_arm(struct stmmac_priv *priv, u32 queue)
>>   	 * Try to cancel any timer if napi is scheduled, timer will be armed
>>   	 * again in the next scheduled napi.
>>   	 */
>> -	if (unlikely(!napi_is_scheduled(napi)))
>> -		hrtimer_start(&tx_q->txtimer,
>> -			      STMMAC_COAL_TIMER(tx_coal_timer),
>> -			      HRTIMER_MODE_REL);
>> -	else
>> +	if (unlikely(!napi_is_scheduled(napi))) {
>> +		if (unlikely(!(hrtimer_active(&tx_q->txtimer))))
>> +			hrtimer_start(&tx_q->txtimer,
>> +				      STMMAC_COAL_TIMER(tx_coal_timer),
>> +				      HRTIMER_MODE_REL);
> 
> Is there a race condition here? I've not thought about it enough to
> know if there is/is not.
> 
> Also, does this change the meaning of tx_coal_timer?
> 
> I think the commit message needs expanding, to cover these issues. For
> performance changes, it is also normal to include some performance
> numbers, before/after, in the commit message.
> 
>      Andrew
> 
> ---
> pw-bot: cr
Hi Maxime, Andrew

Thanks for the quick review! I already send out v2 which applied all the 
comments.
https://lore.kernel.org/all/20260526051921.14540-1-muhammad.nazim.amirul.nazle.asmade@altera.com/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
