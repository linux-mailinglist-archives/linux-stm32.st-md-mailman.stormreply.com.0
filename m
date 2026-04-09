Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGW8D/Ib2Wk1mQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 17:49:06 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8243D9B4F
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Apr 2026 17:49:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35B43C87EC6;
	Fri, 10 Apr 2026 15:49:05 +0000 (UTC)
Received: from esa6.hc2065-58.eu.iphmx.com (esa6.hc2065-58.eu.iphmx.com
 [194.165.214.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC5ABC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2026 17:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=capgemini.com; i=@capgemini.com; q=dns/txt; s=group3;
 t=1775755638; x=1807291638;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=/wABJvLuzjKvW2KJHfY3bTxy3Sm1SLLHHxk7OYYWXEw=;
 b=pJix/PJ9FL/9QiawcwJEMqxTLbIl+Pk8iE4Qui2FM+nShyNyFY4oyMtO
 4LjtM61M93+ejS5pxmZHEPcDWSDCNKB57RaFfFoDg/xJw5UlGR5G59D+k
 y1vKDLhUZ4qzoRl4eBILV9aJa+tdwK0/nalyYpiMzCwuQu/I3x603wa4G
 Wlorkl9LhCXgpRhyQeuW1v83RUU4HcodD+/1RBsO901bxDSxYGmhbM/nD
 LRlZt6Jq7PvaJo1yZj/KArc4txCKuoGWXYwYz+wXjn804sq9O3SMcqCsK
 4Nc2NUsjHhacl5oONj/PEc0/nnNsJLHYRJk3RZDetYFvo8/GDmq/T+oec Q==;
X-CSE-ConnectionGUID: rsTbjqopRqqmkZqCihB0Hg==
X-CSE-MsgGUID: oxCClCS2RCiIdv3iSsEtRg==
X-IronPort-AV: E=Sophos;i="6.23,170,1770591600"; d="scan'208,217";a="29546685"
Received: from spfnldca01.capgemini.com ([80.253.212.216])
 by ob1.hc2065-58.eu.iphmx.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 09 Apr 2026 19:27:18 +0200
X-CSE-ConnectionGUID: s/nJBUJSQG27X8HdPe/w5w==
X-CSE-MsgGUID: PItlqH93Sm2Bo9JlDgcxkQ==
X-IronPort-AV: E=Sophos;i="6.23,170,1770591600"; 
 d="scan'208,217";a="434799829"
Received: from intdlp.capgemini.com (HELO gddlppraplv01p) ([10.247.137.136])
 by IRNLDCA-C695-01-D2-incoming.capgemini.com with
 ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Apr 2026 19:27:18 +0200
Received: from gddlppraplv01p (localhost [127.0.0.1])
 by gddlppraplv01p.localdomain (Service) with ESMTP id B45F48085B;
 Thu,  9 Apr 2026 19:27:17 +0200 (CEST)
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011041.outbound.protection.outlook.com [52.101.57.41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by gddlppraplv01p.localdomain (Service) with ESMTPS id 61EAE8085A;
 Thu,  9 Apr 2026 19:27:17 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvOquPdaS6G0+oNLwy8KqFjyuBMa8C1MwB1pTV24qoYjQMhgx03Mq3mb2tpBUM0y2zsXJQyDQAFAZtbKAmMw0P0etbghzG0dTSqKCY4kbWPqo9YFH9GleArkFM47Sngngdu688LPRszV/b1cgw6SviyJvloeN4O75X2/VEzl1/1Sap55WY7AMb2HhL9jExdUXIoIlP5SENiOzraaY396/STk9+la1iUfze9OoIajsSdnLiUL5byWWFAoUAeyYeAkUa20r4ZSdsxlPJ3KRERs6xjFfr4Achlxz8d3XFcgdHCnlo/EI66nwRkelutOLoKdPV8PQO3r04qymIcwfXGwGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xUT81AP7LQkPPDb3Okijvx9DZfGSwGt1NyNYpPDuAQ=;
 b=ZbzdhNlm9SSQI33P6fG7dhl7IMRPnnBc0SK7LvzX9zGR1E0RhW4ri98gWmSgO8JjUpaXTFAKY9KkDbUi48ylYHlsz5yX7gUZq6K4Q+ZSyOyTcx3F7OseGDa+IalsPD+EXm5sbPdRM2kQkrM8cGOtbwvKOUr3K7CclxcUeAjpBGOwp2dOehkfKMPsE4QGGPoG4zbQ1yTcxcfjYVV8Ag/yXS5NzzMobS/X7XwhB8BvOFyMFAOc+77HVB30xjFTjUS/dBWG+vKZYFzHlNNbEE75oX6CF8nWSjWDwu6B2/PSByMKXYbZl3lZ9Bdm1r8O409W1+E3ahcosNAQbw35kqT6Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=capgemini.com; dmarc=pass action=none
 header.from=capgemini.com; dkim=pass header.d=capgemini.com; arc=none
Received: from BY5PR12MB4066.namprd12.prod.outlook.com (2603:10b6:a03:207::22)
 by CH2PR12MB9541.namprd12.prod.outlook.com (2603:10b6:610:27e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 9 Apr
 2026 17:27:13 +0000
Received: from BY5PR12MB4066.namprd12.prod.outlook.com
 ([fe80::fef4:6e9d:f9de:cc08]) by BY5PR12MB4066.namprd12.prod.outlook.com
 ([fe80::fef4:6e9d:f9de:cc08%4]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 17:27:13 +0000
From: "Monson, Paul" <paul.monson@capgemini.com>
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>, Herbert Xu
 <herbert@gondor.apana.org.au>
Thread-Topic: [PATCH] crypto: tstmgr - guard xxhash tests
Thread-Index: AQHcxsTpkeV8PoBrEU+kUXGV95UNy7XU0EkAgAIrz4CAAAEGFA==
Date: Thu, 9 Apr 2026 17:27:13 +0000
Message-ID: <BY5PR12MB4066DF26FE8A4E5947DA2CE1FE582@BY5PR12MB4066.namprd12.prod.outlook.com>
References: <20260407192859.270745-1-hamzamahfooz@linux.microsoft.com>
 <adYNClYB6RY820Xl@gondor.apana.org.au>
 <adffSYxKIuaDLZit@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
In-Reply-To: <adffSYxKIuaDLZit@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=capgemini.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4066:EE_|CH2PR12MB9541:EE_
x-ms-office365-filtering-correlation-id: e7dce086-87ee-4af5-144b-08de965d3cf8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|38070700021|13003099007|8096899003|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: ron2cqL2s6qH0VhLXmWkjvhcGVrFmKACyXZoOecHiosd9hnTACQW4FKLzFBAmEJ1M4ZbtvaQhPlkq3KPGSJBVx7OcK5N1hZ2eWs2RUFaaOxmk2Esz3phDub14J9pLAXWRgb0RyCWUHOkAKKUJ0rBaRV02s5pg7E7VD1uSI0LNIvAcf4/mPNUZu/XhdSaT3/FsPLkeGHBeFiuqjTUA4MY5tZ/VvVGTDOdnWpD7G0CwcMGBzpGo7Vyo6Ws2n9rjL3dLMXOiqq/NLm8N7zez0HMLa1MPcrQbT23fspS/L5rA28GWpFIXvvwREfRIn83HtO3/y0UI46wJIY+ov/eegysN1Cm148hKt6Q11DqEWEGbnLglkxR9ZHQIejsk7fMr6N64EYiJiqZtLTb1Jva/9nDB1EAFUljEcb5azAVC4OhvalYI6l+YcE8YVkkhh0Dhye7y1RhBw4nilUFnKo8qmjY9GAv4/6vc4oI1J9cVLNPLQx315KO9AdvoULySxO42o5juOmiA6QDMESuyiIRTwMF378fEDirNyizWAONkW7L/1AhAnfh6RJTYDi6XO1ZDFMa5x1i+JgDI49KDX6/KsomQbci4DVq6F3gOvYXd3Jwma1Y6Ra8ggCoUymH/jEo9RJsNOYFmg/juWz8FT6/guz70egAyVJY7U7KRdDhMIRT068DvuAnGt0HEVkn/JpuFlmgiRY1CjBCLiCt2qnMudzEq8hGLXNgoKHD9wVr14JCtSM1psMuao5cLmdlNfTd5xqqAACaoSmvBh0YJemMePAYFssbWLaKk6bplZ8DqeTzKKY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4066.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700021)(13003099007)(8096899003)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sZlvqT1rD1JdNXOkXLgcwrluyJ2/Hv3yEoCug0BetgOw7e2uhiq0pnd7Zx?=
 =?iso-8859-1?Q?mckAnjCQwgeHDcWKZ9cRQbyw2GLXE3Xnbq/F2QDmk+gmc/EXG8RzL4LqHx?=
 =?iso-8859-1?Q?6JkCG/3IClv119DCJgsSb5yEd/6s4qNZQEh4XU+pxp0kDNbPOeTjZj0+/Y?=
 =?iso-8859-1?Q?9v+BTqsZMUuAbgn2SWT6N2TJBJJ+tMjHEN8QQrxKOTkyo8w7OksiO0vysm?=
 =?iso-8859-1?Q?6BEfbD8RzdkL4yuS8T1e6re7zSx4l7a6O2CS76bXLAZ8h8udC66tBzLlS2?=
 =?iso-8859-1?Q?EI59KVRvay5ZWlYHjcPkpQjxbvw/4J8Wr5D2y+DQxYyoyKpPSISvd3Ua2u?=
 =?iso-8859-1?Q?dV7kfjxsdBRkf0y/Dwrx1qwSPDIjlrnr04sjVKpCW+STo+JMUDysDT3r6w?=
 =?iso-8859-1?Q?HGn5Dg6vcak9xrmhjBUVvoJMgUfA2ZfGJrAcJEjylo2nzcStn2eVM89zRT?=
 =?iso-8859-1?Q?+3kmpQgQ9hxHTrer67EmfwFoOHKfPRcb6bxo9ZjGwhwwH81cKyEvCZ6dIF?=
 =?iso-8859-1?Q?jIW/Xap3rWTXBHtN5jxzw0kdgXfxa3/sWduZQ0Tdg3H2LAoRKeN+XH13iY?=
 =?iso-8859-1?Q?kNbv8FsRvojU5Js6r6viPN8wQTH2bszGegu61Jmio6L8mIKcQde3BaZq14?=
 =?iso-8859-1?Q?yReUbR+YhP4UchrP9y8M1rjm/15W4i8jiRSMtYt8FY26kmRyUwYqMHPzae?=
 =?iso-8859-1?Q?QBuFaF9qOMwGnbZXXAK4grwAThZSBU04OGXx4Xkg99x1pxSkrwPjbaGIdX?=
 =?iso-8859-1?Q?se1IuSsSwPVaV4z/7dVCHK6H7BNSsZbnPeMM5Pw6Jv7a/ZS7ilnyBrr46B?=
 =?iso-8859-1?Q?G5feHdz1p09M9UTZBvDOnIX1s0h8ti8Enm7KoHV78lkiinyxR7BpPJRt7G?=
 =?iso-8859-1?Q?LuuytVvkc9WSkEBhpVyc7fMy4PonD+gzwiGS8FhX+V72Pl/Fe3yIGVfSUc?=
 =?iso-8859-1?Q?Kao+Tddts/EfbLDaaoZ4ybvkiPLB/QjWY7su573kZ4hPAC3tKIt+q9ic92?=
 =?iso-8859-1?Q?D6iDowCVoHZ87mvXyNS57TYoT3vvM73oE/Xvo7j9IruabcfsLMxCB17LDf?=
 =?iso-8859-1?Q?/ykTbyh560ss7zuSE6Qu71WVR/F4ImY9Okyf9o3mjjIQGc9Qsyyo/LH1tD?=
 =?iso-8859-1?Q?Oph39wr/gHAC0DTANTxqyipzWsJhY68PExsS04aYZdhpN35ZiTJ+qYaUbc?=
 =?iso-8859-1?Q?vNVjzPMfId0nY5nGxPbizN7DgO2wSm/k/WPzyjvDSgPSUM3jP1t56slORp?=
 =?iso-8859-1?Q?uKUgqVMMuAJb1LDNaLvwUQtQHKjFkcbMr6cfBgvLO2X97l+Qv/iddV8+/f?=
 =?iso-8859-1?Q?PROqdvQ7EpO224+3A+X/lbwzLOL+rea5FktFBNFni1zG2aomuPdCdp1dpv?=
 =?iso-8859-1?Q?bGi38/mU/T1Ea5dMTzEQNQM837ftRfjRhnI7OIP5N484DrNJPrFsGBR6LW?=
 =?iso-8859-1?Q?WSl/l2/cvQjWlZJHpihO1uRm4h0HYmw+LZn+g4xXZHsErSqvq+xJ0R+RkV?=
 =?iso-8859-1?Q?lgltsC6v0Tdhc5cP3HG64tBesClXwqReNsIzbDHopOetHuDHlOvqnn1fhJ?=
 =?iso-8859-1?Q?IE+J2J1lsLRqXG0KzrcNmkrWi5FWfoBxEnbT0UitDCbCqvisMDXGub+6Du?=
 =?iso-8859-1?Q?4csKMOptFCBrlBPB2b5Rc7VWKH0WpXsgYSurZZQ+KDLP00xsoU0JFYDDtY?=
 =?iso-8859-1?Q?5gIRTSQ8IevCZ0/Z7B/sdZlmYZ3fcMH9N4dbSVP1rjMqd02mah6tf0gmi+?=
 =?iso-8859-1?Q?96m+Ei1Sf6GHYxLG7m5cV8fEDP2oz3kiOTy5ENv4esfw70eHxWjbEU8Ghe?=
 =?iso-8859-1?Q?+VRlAa/1VQ=3D=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WQy/ZYPOgXzImsGh1VLcy4b9lLWvQ94GoUrZW3pim7u5A8MucIrKUlz97+74DJ/063MfMO3edV+qn8FB/XIqbfwThCyfQgfyRnJ5D1q6rLaUQfHB2tJBOxnQK9kKIdj/Cy/ChXDKrlH76pscs8pXZcRo5hxm39K74lpjkg4WGJNuUKGckbGQLXGTCokCaCDUzFILHc3cUIlPrpwXqb3rwqfBjzYWeRNUhFdWe/9L+3HqJLsI+53HpdcmIN5PQOdd5TENpuTgB/zqwDFPppHUado65U2eDPOMiudjSzj95bwN5BmBQuhvAwC0dH/gy4EE0PkFeuLt+pqyejxAwqj6NA==
X-OriginatorOrg: capgemini.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4066.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7dce086-87ee-4af5-144b-08de965d3cf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2026 17:27:13.1583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 76a2ae5a-9f00-4f6b-95ed-5d33d77c4d61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fmLgSlmL7VK4CzgW1bOE4XUt19/H27OTZ3qvCNsrr86UAZzvKsxYNZHoSeNpsIg1b1i394AuvmuYF3WIH7yKkSES+ZF/xK2iHAuqSVD1TAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9541
X-Mailman-Approved-At: Fri, 10 Apr 2026 15:49:03 +0000
Cc: Jeff Barnes <jeffbarnes@linux.microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "David S.
 Miller" <davem@davemloft.net>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] crypto: tstmgr - guard xxhash tests
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
Content-Type: multipart/mixed; boundary="===============7859022866692229270=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[capgemini.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[capgemini.com:s=group3];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hamzamahfooz@linux.microsoft.com,m:herbert@gondor.apana.org.au,m:jeffbarnes@linux.microsoft.com,m:linux-kernel@vger.kernel.org,m:davem@davemloft.net,m:linux-crypto@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[paul.monson@capgemini.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[linux.microsoft.com,vger.kernel.org,davemloft.net,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[capgemini.com:email,apana.org.au:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.651];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.monson@capgemini.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[capgemini.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AB8243D9B4F
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

--===============7859022866692229270==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BY5PR12MB4066DF26FE8A4E5947DA2CE1FE582BY5PR12MB4066namp_"

--_000_BY5PR12MB4066DF26FE8A4E5947DA2CE1FE582BY5PR12MB4066namp_
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

  *
Seems like crypto_alg_mod_lookup() [1] fails and that triggers the panic() =
at [2].

Yes. That's what I understand.

In crypto/testmgr.c if the algorithm has fips_allowed=3D1 the selftest is n=
ot allowed to fail when fips=3D1 is passed on the kernel command line.
Setting fips=3D1 results in fips_enabled in testmgr.c


Crypto/testmgr.c (line 5610)
        }, {
#endif
                .alg =3D "xxhash64",
                .test =3D alg_test_hash,
                .fips_allowed =3D 1,
                .suite =3D {
                        .hash =3D __VECS(xxhash64_tv_template)
                }
        }, {


It's probably hitting this code path

crypto/testmgr.c (line 5758)
                if (fips_enabled) {
                        fips_fail_notify();
                        panic("alg: self-tests for %s (%s) failed in fips m=
ode!\n",
                              driver, alg);
                }


________________________________
From: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Sent: Thursday, April 9, 2026 10:18 AM
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org <linux-crypto@vger.kernel.org>; David S. M=
iller <davem@davemloft.net>; Maxime Coquelin <mcoquelin.stm32@gmail.com>; A=
lexandre Torgue <alexandre.torgue@foss.st.com>; linux-stm32@st-md-mailman.s=
tormreply.com <linux-stm32@st-md-mailman.stormreply.com>; linux-arm-kernel@=
lists.infradead.org <linux-arm-kernel@lists.infradead.org>; linux-kernel@vg=
er.kernel.org <linux-kernel@vger.kernel.org>; Jeff Barnes <jeffbarnes@linux=
.microsoft.com>; Monson, Paul <paul.monson@capgemini.com>
Subject: Re: [PATCH] crypto: tstmgr - guard xxhash tests

******This mail has been sent from an external source. Do not reply to it, =
or open any links/attachments unless you are sure of the sender's identity.=
******

On Wed, Apr 08, 2026 at 04:08:42PM +0800, Herbert Xu wrote:
> Please show me the panic.  Normally it's not an issue if an algorithm
> is not present while the test vectors are.
>

alg: hash: failed to allocate transform for xxhash64: -2
Kernel panic - not syncing: alg: self-tests for xxhash64 (xxhash64) failed =
in fips mode!
CPU: 0 PID: 425 Comm: modprobe Not tainted 6.6.130.2-2.azl3 #1
Hardware name: Microsoft Corporation Virtual Machine/Virtual Machine, BIOS =
Hyper-V UEFI Release v4.1 01/08/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0x4c/0x70
 dump_stack+0x14/0x20
 panic+0x179/0x330
 alg_test+0x678/0x680
 ? __alloc_pages+0x1e2/0x340
 do_test+0x26f8/0x7670 [tcrypt]
 do_test+0x72c5/0x7670 [tcrypt]
 tcrypt_mod_init+0x65/0xff0 [tcrypt]
 ? __pfx_tcrypt_mod_init+0x10/0x10 [tcrypt]
 do_one_initcall+0x4e/0x330
 ? kmalloc_trace+0x2e/0xa0
 do_init_module+0x68/0x250
 load_module+0x1f2e/0x2150
 ? __do_sys_init_module+0xe6/0x1d0
 __do_sys_init_module+0x19c/0x1d0
 ? __do_sys_init_module+0x19c/0x1d0
 __x64_sys_init_module+0x1e/0x30
 x64_sys_call+0x11b3/0x1c90
 do_syscall_64+0x5a/0x80
 ? irqentry_exit_to_user_mode+0x29/0x50
 ? irqentry_exit+0x3f/0x50
 ? exc_page_fault+0x87/0x160
 entry_SYSCALL_64_after_hwframe+0x78/0xe2
RIP: 0033:0x7715f70fab9e
Code: 48 8b 0d 85 32 12 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 =
00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 8b 0d 52 32 12 00 f7 d8 64 89 01 48
RSP: 002b:00007ffde8fef6c8 EFLAGS: 00000246 ORIG_RAX: 00000000000000af
RAX: ffffffffffffffda RBX: 00005d0b39626af0 RCX: 00007715f70fab9e
RDX: 00005d0b1710197a RSI: 0000000000028c39 RDI: 00005d0b39635310
RBP: 00005d0b1710197a R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000071 R11: 0000000000000246 R12: 00005d0b39635310
R13: 0000000000000000 R14: 00005d0b39626c20 R15: 00005d0b39626da0
 </TASK>

Seems like crypto_alg_mod_lookup() [1] fails and that triggers the panic() =
at [2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/crypto/api.c?h=3Dv7.0-rc7#n338
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/crypto/testmgr.c?h=3Dv7.0-rc7#n5760

BR,
Hamza

This message contains information that may be privileged or confidential an=
d is the property of the Capgemini Group. It is intended only for the perso=
n to whom it is addressed. If you are not the intended recipient, you are n=
ot authorized to read, print, retain, copy, disseminate, distribute, or use=
 this message or any part thereof. If you receive this message in error, pl=
ease notify the sender immediately and delete all copies of this message.

--_000_BY5PR12MB4066DF26FE8A4E5947DA2CE1FE582BY5PR12MB4066namp_
Content-Type: text/html; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<ul data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:false,&quot;u=
norderedStyleType&quot;:4}" style=3D"margin-top: 0px; margin-bottom: 0px;">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0); list-s=
tyle-type: &quot;&#10146; &quot;;">
<div class=3D"elementToProof" role=3D"presentation">Seems like crypto_alg_m=
od_lookup() [1] fails and that triggers the panic() at [2].</div>
</li></ul>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Yes. That's what I understand.&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
In crypto/testmgr.c if the algorithm has fips_allowed=3D1 the selftest is n=
ot allowed to fail when fips=3D1 is passed on the kernel command line.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt;">
<span style=3D"color: rgb(0, 0, 0);">Setting fips=3D1 results in </span><sp=
an style=3D"color: rgb(0, 0, 0);">fips_enabled in testmgr.c</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Crypto/testmgr.c (line 5610)</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; }, {</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
#endif</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .alg =3D &quot;xxha=
sh64&quot;,</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .test =3D alg_test_=
hash,</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .fips_allowed =3D 1=
,</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; .suite =3D&nbsp;{</=
div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; .hash =3D __VECS(xxhash64_tv_template)</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; }, {</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div><br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
It's probably hitting this code path</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
crypto/testmgr.c (line 5758)</div>
<div class=3D"elementToProof">
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if&nbsp;(fips_enabl=
ed) {</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; fips_fail_notify();</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; panic(&quot;alg: self-tests for %s&nbsp;(%s) failed in fips mode!\=
n&quot;,</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; driver, alg);</div>
<div class=3D"elementToProof" style=3D"line-height: 19px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
</div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Hamza Mahfooz &lt;hamzamahfooz@linux.microsoft.com&gt;<br>
<b>Sent:</b>&nbsp;Thursday, April 9, 2026 10:18 AM<br>
<b>To:</b>&nbsp;Herbert Xu &lt;herbert@gondor.apana.org.au&gt;<br>
<b>Cc:</b>&nbsp;linux-crypto@vger.kernel.org &lt;linux-crypto@vger.kernel.o=
rg&gt;; David S. Miller &lt;davem@davemloft.net&gt;; Maxime Coquelin &lt;mc=
oquelin.stm32@gmail.com&gt;; Alexandre Torgue &lt;alexandre.torgue@foss.st.=
com&gt;; linux-stm32@st-md-mailman.stormreply.com &lt;linux-stm32@st-md-mai=
lman.stormreply.com&gt;;
 linux-arm-kernel@lists.infradead.org &lt;linux-arm-kernel@lists.infradead.=
org&gt;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;;=
 Jeff Barnes &lt;jeffbarnes@linux.microsoft.com&gt;; Monson, Paul &lt;paul.=
monson@capgemini.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH] crypto: tstmgr - guard xxhash tests </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">******This mail has been sent from an exter=
nal source. Do not reply to it, or open any links/attachments unless you ar=
e sure of the sender's identity.******<br>
<br>
On Wed, Apr 08, 2026 at 04:08:42PM +0800, Herbert Xu wrote:<br>
&gt; Please show me the panic.&nbsp; Normally it's not an issue if an algor=
ithm<br>
&gt; is not present while the test vectors are.<br>
&gt;<br>
<br>
alg: hash: failed to allocate transform for xxhash64: -2<br>
Kernel panic - not syncing: alg: self-tests for xxhash64 (xxhash64) failed =
in fips mode!<br>
CPU: 0 PID: 425 Comm: modprobe Not tainted 6.6.130.2-2.azl3 #1<br>
Hardware name: Microsoft Corporation Virtual Machine/Virtual Machine, BIOS =
Hyper-V UEFI Release v4.1 01/08/2026<br>
Call Trace:<br>
&nbsp;&lt;TASK&gt;<br>
&nbsp;dump_stack_lvl+0x4c/0x70<br>
&nbsp;dump_stack+0x14/0x20<br>
&nbsp;panic+0x179/0x330<br>
&nbsp;alg_test+0x678/0x680<br>
&nbsp;? __alloc_pages+0x1e2/0x340<br>
&nbsp;do_test+0x26f8/0x7670 [tcrypt]<br>
&nbsp;do_test+0x72c5/0x7670 [tcrypt]<br>
&nbsp;tcrypt_mod_init+0x65/0xff0 [tcrypt]<br>
&nbsp;? __pfx_tcrypt_mod_init+0x10/0x10 [tcrypt]<br>
&nbsp;do_one_initcall+0x4e/0x330<br>
&nbsp;? kmalloc_trace+0x2e/0xa0<br>
&nbsp;do_init_module+0x68/0x250<br>
&nbsp;load_module+0x1f2e/0x2150<br>
&nbsp;? __do_sys_init_module+0xe6/0x1d0<br>
&nbsp;__do_sys_init_module+0x19c/0x1d0<br>
&nbsp;? __do_sys_init_module+0x19c/0x1d0<br>
&nbsp;__x64_sys_init_module+0x1e/0x30<br>
&nbsp;x64_sys_call+0x11b3/0x1c90<br>
&nbsp;do_syscall_64+0x5a/0x80<br>
&nbsp;? irqentry_exit_to_user_mode+0x29/0x50<br>
&nbsp;? irqentry_exit+0x3f/0x50<br>
&nbsp;? exc_page_fault+0x87/0x160<br>
&nbsp;entry_SYSCALL_64_after_hwframe+0x78/0xe2<br>
RIP: 0033:0x7715f70fab9e<br>
Code: 48 8b 0d 85 32 12 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 =
00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 &lt;48&gt; 3d 01 f=
0 ff ff 73 01 c3 48 8b 0d 52 32 12 00 f7 d8 64 89 01 48<br>
RSP: 002b:00007ffde8fef6c8 EFLAGS: 00000246 ORIG_RAX: 00000000000000af<br>
RAX: ffffffffffffffda RBX: 00005d0b39626af0 RCX: 00007715f70fab9e<br>
RDX: 00005d0b1710197a RSI: 0000000000028c39 RDI: 00005d0b39635310<br>
RBP: 00005d0b1710197a R08: 0000000000000001 R09: 0000000000000000<br>
R10: 0000000000000071 R11: 0000000000000246 R12: 00005d0b39635310<br>
R13: 0000000000000000 R14: 00005d0b39626c20 R15: 00005d0b39626da0<br>
&nbsp;&lt;/TASK&gt;<br>
<br>
Seems like crypto_alg_mod_lookup() [1] fails and that triggers the panic() =
at [2].<br>
<br>
[1] <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux.git/tree/crypto/api.c?h=3Dv7.0-rc7#n338" id=3D"OWA304fec52-c6ce-243d-834=
7-ec263f95d0b6" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/cry=
pto/api.c?h=3Dv7.0-rc7#n338</a><br>
[2] <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux.git/tree/crypto/testmgr.c?h=3Dv7.0-rc7#n5760" id=3D"OWA92fb4d8d-cb08-86c=
9-7fea-e267175cc57f" class=3D"OWAAutoLink" data-auth=3D"NotApplicable">
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/cry=
pto/testmgr.c?h=3Dv7.0-rc7#n5760</a><br>
<br>
BR,<br>
Hamza<br>
<br>
</div>
<span style=3D"font-size: 9px;">This message contains information that may =
be privileged or confidential and is the property of the Capgemini Group. I=
t is intended only for the person to whom it is addressed. If you are not t=
he intended recipient, you are not authorized to read, print, retain, copy,=
 disseminate, distribute, or use this message or any part thereof. If you r=
eceive this message in error, please notify the sender immediately and dele=
te all copies of this message.</span></body>
</html>

--_000_BY5PR12MB4066DF26FE8A4E5947DA2CE1FE582BY5PR12MB4066namp_--


--===============7859022866692229270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7859022866692229270==--

