Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 12rfG3xUL2pP+gQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 03:25:16 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8981682BCC
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2026 03:25:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67875C5F1E9;
	Mon, 15 Jun 2026 01:25:15 +0000 (UTC)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2128.outbound.protection.partner.outlook.cn [139.219.17.128])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BFDAC424DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2026 01:25:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9EvC2h+1pkhXnuEgUKDpI8lftRJERpGSv0Flf5riGt3yxZvMNtKwNt3QcUVIW9hzCOma0VE0R+Bahfe3/STNJvOdNPmmd4co71TBEFlFsNKqe/X/LQ8O+H5pY78F5bxgBbH32YK+gH0fnvk72NCMar66RQ/ghZbmY3jhgGWE7eBsB/N+j760jVe1oLW/KCD0WiIYj0vCtjSgfZl5F4TnrQvlumgxpHbVbGC9PkkKHulX5blmJwRM435KELYnYfUULTikOFYLwq0DpevWJLa7LpA07EIofYZT6RBP+bl0RcOiMhWCnGyWO/TIcgcRDgHBEo2PEl83nP34s6Ay7PtKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/UWQP0DGSm6A8W1do7ZQEVppFyB01zLmnQNfo+bRJI=;
 b=gEz/q+/TeUhSgjZtjgkRPtPOkvbuCnqvxR/BbqTGuIY/wdXEsdvg9kLzP5VUEdmuTtPjKMjTv/2iAkBZXiyOoDTFp+xPiRpDhtxuhb2Q6ogjRC32ctpstjPYexvOuSXDOv/bTqM1wFwb5/p4NQk+dRrl60S+AiW/3/uOOuyA6XU0ERcYkUvqrPybQVawhrIBfeADx13tCiugQ5smBhNO11UkParjUkwEGKWdXHBacCcad9wYpDwPNYlcvodZZQBK8kDbQRSNXLmdGEy4JrU6qq/dJ9pkAvuE8Ys5Xx2Vwp7RfuzwxgJCjqzOuasCnJZbXiUMARmoCJp+rcASx+UZlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0877.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 01:25:08 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%3])
 with mapi id 15.21.0113.015; Mon, 15 Jun 2026 01:25:08 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [net-next v1 2/6] net: stmmac: Checking whether priv->phylink if
 NULL in NCSI case
Thread-Index: AQHc+KotsU7CSx9q1kuYrR3iPfERvbY3dEMAgAdmAgA=
Date: Mon, 15 Jun 2026 01:25:07 +0000
Message-ID: <SHXPR01MB086317D16524E2E0CEE46D66E6E62@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
References: <20260610072420.64699-1-minda.chen@starfivetech.com>
 <20260610072420.64699-3-minda.chen@starfivetech.com>
 <f3a32c42-27b2-496f-b236-02c33bee1773@lunn.ch>
In-Reply-To: <f3a32c42-27b2-496f-b236-02c33bee1773@lunn.ch>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0863:EE_|SHXPR01MB0877:EE_
x-ms-office365-filtering-correlation-id: 53f4cca8-5fc9-4fcd-7720-08deca7cefb2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|23010399003|1800799024|56012099006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: rcRb6qzZvhDWUvd30Hodq7nsgaLIlFgPOdXq1m/FhM3nYWeZ98PuEB3w18LbLEZGAPUICmqZVvzr0f8Gl/2KK5YWdFT2VD0HDxKLZ5HMLJH/YRi+ewSrDAW7kskoBGZIOvcjJ8obyaTSQy8rln0kD1TmpVniD8hqAGCsfC/9i3SYkIsmqucFQLZSkMvGK3kd8sZ+c3PrqKzrILRb5YdEqE3ACkjvwUNkU7KqNxXZgwgN4vxVxw7z0I1FxlbYZNmV71/IzfflQADrcNgPf+auuKY/Y56lcAIpvUoz4l3Tnw0tzkEzGoKBgx6iTXRjFxvuzuXArfG3vZXAKTEWgqp7h/hbjbLhfD9TuZZ+umzWhDJeBCm1sdsz7cS+1fOiQvpg0Cv52AaGVsyKS4mYUn3SmH3odVvu0PbDq9QrI5Er+rNBUm1nmMsF9sBhSTVBGZ9wg3WRTlQlN7U755C6IL3FbvtEKL2RkhbNBs3axNlvZvQNFE3+8zKVVGGoTswqcThoF1ToIt/+esiYKL9uVs+HUjsUrsHTnKPRefMmcwXN9WOQeMZljWN5rJz88U1f6ePl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(56012099006)(4143699003)(22082099003)(18002099003)(38070700021);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hK7+qHUAvr2za3/vDTPNvZR8LreExHYL0jvADhIwYWByijrG6ZLqD0uA2ZC6?=
 =?us-ascii?Q?rwwKZPSR1CW80j+7JnMvHnTgBUPyT1xWbVx8vtTAOi3fp+vveG6e3A6n/Ez5?=
 =?us-ascii?Q?y5qYNst7Btudx0XEX28vG5xG5qa/5ugxp+SU5aP+W9xniz42T57ISRfFlezt?=
 =?us-ascii?Q?AQaao/dV6YHo7v7vMXhbqaJZkWNfmsZFPiy3EB97MyRDNth8Xzz+1nRdFXmN?=
 =?us-ascii?Q?/S94PB8dAcJPNAMQWSPoD7Dqn8xxJvwK7go/IBDzPOisMAe67x8JE/GYOGa+?=
 =?us-ascii?Q?37K6Rzdq4tfKuV66vu6oKbAy5r5GyIR0rtBl1vdmEuJt1KPsJUWlac9uUY3t?=
 =?us-ascii?Q?e6pV0c/nzszj/qklF/2ZmVf3NUSTeGKJZiRorhPaaeDHgkA4juIUSJbMuFLs?=
 =?us-ascii?Q?s+KsphA2CKFCvAoI0O8y3lkZvFwUhHbgPnyhOnLuRVZZcXst0J5CVDE9Yq5Y?=
 =?us-ascii?Q?je3gMPveonXqkXHT3+ZHIzB1sbSfNuR6ikh8KCXxVPj+UIrqzBBF1wh7oq1+?=
 =?us-ascii?Q?I4MF+FiUz2n1m2YOMLRtlFlLByAeJ7vAjOkgzlBRfQx0xPzIqtuLvOvUAO8a?=
 =?us-ascii?Q?8Y4VFno2YIy6E0W7wQryx845KTj3dw0fV22gp1QcG7ja3xF8V+rZBtJT1rAG?=
 =?us-ascii?Q?7EwAbZJyZUNYRpfclf2BKfaGFd7ZVV48mgXePHZcqY8Ro8amFgCbrFRv/4kF?=
 =?us-ascii?Q?+JwbX1ucd38C4U5dwdj80Kf7Qp/L3nULxUSM2tXnaukGo5doTfe4UjMKZ1Ak?=
 =?us-ascii?Q?cJrzLLltHMyy+OvVaohLq5FPzvlpWrPmdE+wAyjPTBmf1/M0a9d12Ee5x5Ew?=
 =?us-ascii?Q?tFIs4OFbVtUdebm33fgwmwc3l0lWxsURtc4SyQ/tnzc2LzrTwXZ3No+Brgb/?=
 =?us-ascii?Q?x7xTNy/ubBWBkkT9SwI4hQALpLRna1iGrTxA9eDofBb+fROWa9zbHW5LlOwS?=
 =?us-ascii?Q?8Zx7Nivdmw1V5BoYGibw4VJFM3S+pE3BJ/lM7UpgrIt+WYsDK1Y0or8J18Mq?=
 =?us-ascii?Q?8b/+hbCemynot8z9GgVsXnyAhxzabfvk9fNNzv5odR605C7wmJKqGUuKbSkf?=
 =?us-ascii?Q?a8Gje/PO76iqTE01A4fgdDSsWfheph/F7J/gyXexa2iywuOAxKOZ56Yo5hK4?=
 =?us-ascii?Q?zuCPSSz2WXjNMNKKe4v88zTDNEVjHtI6P+//GKZc56rltj9+ieDI5mWLYcd7?=
 =?us-ascii?Q?pApDD+fLjlh/WABNu714MWRVFX75Coa2FPmPggDzQZrpHY8305jC6nqJP8Sb?=
 =?us-ascii?Q?CaID1BcVcYPYirKXQ76y6ISu76oOJzwsCTp4C685lkE8QifcJspivibHpZpk?=
 =?us-ascii?Q?OEreOGZR8ZJm+QzZZ08aKcAmHRS3t2ueffXHmIT5yF805+xcltx4kpmHB1np?=
 =?us-ascii?Q?W6b2PTpxRELUHIG4uRa5/91bJoL77t1Ui/Wl2tKMqdmUsFQc6+/o7q9wZODZ?=
 =?us-ascii?Q?vuBttpMQiGN+8dBuKmO0pcvYrNoHCohe/JPm0r4EG2n1HA7Ej1oI2I1ZQsK/?=
 =?us-ascii?Q?f1HFwCabzOomXBbdb0hCQlYm/dD6nfeWW4fJOcsDpEAx4kgJEZPWZ+4K5jsU?=
 =?us-ascii?Q?PNLzqjVgXl2P2aq9To5fMP/CUb1GBqXuhmCfEFxx5sifgcJ6NoN4WhFmTsri?=
 =?us-ascii?Q?AT8YcG7aOhOv4gLUExRfQZNRD4b64eYcF98WyIPuclbd/wi7b0t+Dj7pH0Vi?=
 =?us-ascii?Q?OTUnhHQsVMFo67aKE+SXlu6svyzE0KENYvq4+/Fhndbck9Al7iMqG+N+C7aW?=
 =?us-ascii?Q?g5knzyUNyg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f4cca8-5fc9-4fcd-7720-08deca7cefb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 01:25:07.8418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IQlHREwQzw7P7T5sN26ypsVBlQtDBl6e6uIxy11gYJ82CkY3nbxySljwbqSydGctx/4h5iiBQGRaIuSgBQZ1LPs7EAL0SbsBfZBQ7Zq/HYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0877
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [net-next v1 2/6] net: stmmac: Checking whether
 priv->phylink if NULL in NCSI case
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux@armlinux.org.uk,m:robh+dt@kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:joabreu@synopsys.com,m:conor@kernel.org,m:mcoquelin.stm32@gmail.com,m:peppe.cavallaro@st.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,armlinux.org.uk,kernel.org,lunn.ch,google.com,synopsys.com,gmail.com,st.com,redhat.com,davemloft.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8981682BCC



> 
> > +static inline bool stmmac_phylink_expects_phy(struct phylink *link) {
> > +	if (link)
> > +		return phylink_expects_phy(link);
> > +
> > +	return false;
> > +}
> > +
> > +static inline int stmmac_phylink_pcs_pre_init(struct phylink *link,
> > +struct phylink_pcs *pcs) {
> > +	if (link)
> > +		return phylink_pcs_pre_init(link, pcs);
> > +
> > +	return 0;
> > +}
> > +
> > +static inline void stmmac_phylink_start(struct phylink *link) {
> > +	if (link)
> > +		phylink_start(link);
> > +}
> > +
> > +static inline void stmmac_phylink_stop(struct phylink *link) {
> > +	if (link)
> > +		phylink_stop(link);
> > +}
> 
> Please take a step back and think about the Linux big picture architecture.
> 
> What is stmmac specific here? If you were to add NCSI support to another driver
> which uses phylink, would it need to replicate all this?
> 
> When you consider how the MAC is configured, does it need to know it is
> connected to an NCSI? Can the MAC tell the difference between NSCI, fixed-link,
> a PHY or an SFP? Or does the MAC just need to know RGMII, the link is up, send
> frames?
> 
> Please look at adding generic support for NSCI in phylink, and see if the existing
> phylink mac ops covers everything needed for configuring the MAC.
> 
> 	Andrew

Thanks. I will try to use fix-PHY link.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
