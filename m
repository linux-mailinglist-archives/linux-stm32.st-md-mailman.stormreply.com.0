Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tJ6MBIoXwWmcQgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 11:35:54 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8918E2F0320
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Mar 2026 11:35:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CE32C8F260;
	Mon, 23 Mar 2026 10:35:53 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013000.outbound.protection.outlook.com [52.101.72.0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EF6FC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Mar 2026 08:45:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/LgtzbabD14etflT+1aJemZZ7Ri0UPMpfJhd7u1O2lwyu7mtr3Ex/ZnSKuHRuT0PQheIoNg6mLVq5Jw/5uxu+ikIE8JcCjoZOLKvx6IvL2qL3f8wMqsJo3Qmzv66XLaY2HcA7SK7+4eq4nvZsoFXUhqXGGr7y3MqCMNfeBmbgeVpM30zl3//Q4rFGjOHJVaQvHzugLR/C+5lVeeIGtkFv6KmsOq0EiSRJOMo1BHwzg9dNzwEWE8UX7mqxCqFILmEa5+5zwzpRQGfAffQhCjDGHAR5CPoRW9kv+9oxuget5SXAPwExgPs+mP8LPlzADVjTeMsHk+ki/LNGY4Ndenyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJ+WqbSJEcgnnPtug5S3thM0PJCDUvSqbDm5WUAUW9o=;
 b=o7Oi52l8pwFm7JKaFmPCi1gGOFIC0fDtm6kgujNeT1A3QfeY8D/F3BMF1XWVOIoC2NstUYO9tVDfHXAZZR8P43bFW66Kl8gF+xXdVky0qlRfBqTtUOpcjIUJBK5a3/wzOpSXHdy/oPaZ4lk5jAlqaATUFelucrG5DhHO7Zth0MIK1OGqHrYQLJS7GNWkqron/k2jTqpAmd5N5HqxofyLBK+NiTjj/Y1GG7IzTNitmK68hcYDCCJDKGROuKE/t7mDllmLNev+YSorhg2MpAAoWzsOAO5Qvsi+Q03CgzPmmLLEYKWn6hKm09gwRoW8PRzUNanv1317SvoumCxjduK9DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=st.com; dmarc=pass action=none header.from=st.com; dkim=pass
 header.d=st.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ST.COM; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJ+WqbSJEcgnnPtug5S3thM0PJCDUvSqbDm5WUAUW9o=;
 b=uOWITvUCYrAQKfMReMQ02hT8ISQMZGwINyrZ07TTwA+yyOWiTDM7yIa/M3OdMMQNIsO2LKwApnPHSWKbbY1UEnSomed4BMr27OUZHsFNkzjNch+by6PjCpJc40SjBq8k+rPzjXQM0/IQL5svaJ+6SBqL0Tz2gwY4qXVEanb8Nfvxddk75HqdM7AWIfLinubiftGQKAxSriFbjH06az59OqmHE3obRnULbxvxzT2QREb8ZRlaTbxMmNJJxlQlog8mZTDdxOolj+4xMM0YpXIG/lLhkUAUnhPvcDeAleULUKur7JkcQcQckEPhODnhXWRWNHrCvIUINb6NS7TXqoR+0w==
Received: from AM0PR10MB9623.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:73e::24)
 by AS4PR10MB5944.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:51c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 08:45:54 +0000
Received: from AM0PR10MB9623.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e4e:1334:78fc:be1e]) by AM0PR10MB9623.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e4e:1334:78fc:be1e%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 08:45:54 +0000
From: Antonio BORNEO <antonio.borneo@st.com>
To: Denis HUMEAU <denis.humeau@st.com>, Olivier MORCHIPONT
 <olivier.morchipont@st.com>, Arnaud ROSAY <arnaud.rosay@st.com>, Francois
 CHOLEAU <francois.choleau@st.com>, Amelie DELAUNAY <amelie.delaunay@st.com>,
 Antonio BORNEO <antonio.borneo@st.com>, Christophe KERELLO
 <christophe.kerello@st.com>, Christophe ROULLIER
 <christophe.roullier@st.com>, Fabrice GASNIER <fabrice.gasnier@st.com>, Alain
 VOLMAT <alain.volmat@st.com>, Olivier MOYSAN <olivier.moysan@st.com>, Hugues
 FRUCHET <hugues.fruchet@st.com>, Yannick FERTRE <yannick.fertre@st.com>,
 Philippe CORNU <philippe.cornu@st.com>, Arnaud POULIQUEN
 <arnaud.pouliquen@st.com>, Christian BRUEL <christian.bruel@st.com>, Gabriel
 FERNANDEZ <gabriel.fernandez@st.com>, Patrice CHOTARD
 <patrice.chotard@st.com>, Thomas BOURGOIN <thomas.bourgoin@st.com>, Maxime
 MERE <maxime.mere@st.com>, Christophe PRIOUZEAU
 <christophe.priouzeau@st.com>, Patrick DELAUNAY <patrick.delaunay@st.com>,
 Yann GAUTIER <yann.gautier@st.com>, Jean-philippe ROMAIN
 <jean-philippe.romain@st.com>, Valentin CARON <valentin.caron@st.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>, Nicolas LE BAYON
 <nicolas.le.bayon@st.com>, Thomas BOURGOIN <thomas.bourgoin@st.com>, Maxime
 MERE <maxime.mere@st.com>, Michel JAOUEN <michel.jaouen@st.com>, Ludovic
 BARRE <ludovic.barre@st.com>
Thread-Topic: Sashiko: AI code review on Linux Kernel Mailing List
Thread-Index: AQHcup9cvIaMi6/V2EqzqZwdJkvlTg==
Date: Mon, 23 Mar 2026 08:45:53 +0000
Message-ID: <AM0PR10MB962366CB3DB8B9A52D7C4220FB4BA@AM0PR10MB9623.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Enabled=True;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SiteId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_SetDate=2026-03-23T08:45:53.509Z;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Name=Classify
 only; MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_ContentBits=1;
 MSIP_Label_23add6c0-cfdb-4bb9-b90f-bf23b83aa6c0_Method=Privileged; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=st.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR10MB9623:EE_|AS4PR10MB5944:EE_
x-ms-office365-filtering-correlation-id: ad4e1297-b4fa-46b1-581f-08de88b89811
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|19092799006|38070700021|13003099007|921020|18002099003|56012099003|8096899003;
x-microsoft-antispam-message-info: H8d1TDuDjTmy2a7sTQo/qsp9vwA+h9FTGmQjE9y9suocipvrnTvVrpBBPjbO/Fg6SI0Q/dLPSFQDtvqeMGOBM1AKlnHqwM/+RkM4c+6DOKLQqNn+Bss8RcaaJq3Lfp2jskv/ySshHcA6ZufW5GOERc6dN/xr1oSTsHZGBoie8G3m2LVf5oGL62uBJ+m0KpYR1IlthG0OZllXKzC7/kfqIA06w47q7Oi6qmEyrCy0+QzGKQPrhYv7Py65gHRKm+Gq9hapwbxPFG2R1OnkHHknqbIsqDoJBcmcJTOkUoEle1HBz4EMCPe43k5sdS/VGBEiSyaxRWe1r9YwyX7Oq90n9J9LSr6CHI1QsssUSLOqsEr9RC4brdtEPNtgJhFn7iIg5tMhyfO/8a+A32rDW/pyxp0K8y64OuSYjCedbYgzcOa/+ZSQFh4TY0A8kEi5gaqnWbCyWme6YUFDG8v+E9KlEmZ7MsrDfKWTEeFat936ni1rrTcTzpPxf36oIwW17Zib7RRbf/+6i7XIvuGizFqT8LBX2Z8A2cMjFj4M/g35dCtLitz2b1vYkU0VhO0WCg/Ks2J05HHgDFDy9jIABYdkNeD3dUasug2cbvSz4jhci9Sn8tUnmE7+/DK9FVz8tRI/W73wRrHOxt41HURtTVKVtmV2dpV6CqF3fEUNd++ype5uBczt2eSm3wnTrf33wfwR4/Z/z6vKK+smG6x+6+etrS6AgujGUo1ZeUJw7UmZFBENbO6ifnKXr8467etOtViZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB9623.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(38070700021)(13003099007)(921020)(18002099003)(56012099003)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?rq9SBBIJk9oKlCRI5oPiyB/yQI5kREqFy0hw4uiGn7OGloJJTq9Z4CDoOk?=
 =?iso-8859-1?Q?GZvROKDI0yGz/ott+2+hxFhSrx3NoxmRWhRWSKgixo0dHN7x4CMrs7nU+B?=
 =?iso-8859-1?Q?IyrC7bRW++yqhg3yboEjK0UtpW2y5Y+xUoKYXDIDE4zyFs5EDmpkFm5yb+?=
 =?iso-8859-1?Q?x/eglAB0F5lRZDg4LI+Wh7872hNm+STfSrN4iQRlQSvBZhTfcgBCQlaON+?=
 =?iso-8859-1?Q?evefYWYQkNuYtJBdVUPWvZANuRVFfWKxQsRnOiCsKXy4W3m6WgmVFBVIkE?=
 =?iso-8859-1?Q?hIxDVjSWqDy3fmdFSob+YSPM9ObewkaqdzMx1yo7eK7JmUIyJ07ORQs5n4?=
 =?iso-8859-1?Q?8za3+HH/1AiZoBUjTZm1g3H1Ff077vpj162DNuvckXc3TmHKzjuR/QG01P?=
 =?iso-8859-1?Q?OJgxm0OfGA+BTMlO2WOpC7TKjuV38SepL/sxILspY5/A45yzM72nZRtN8T?=
 =?iso-8859-1?Q?WhcAvd/AZAK/IlcWr7P8Vz2qLqMzlyERtBByF6DhX0Rey81r24/rsfFAQ0?=
 =?iso-8859-1?Q?aohwjjdEeycrfqjS1rHOyq9s6vmlnpsIq0u/p6Ocb8T79gFKuxfpM0zrAH?=
 =?iso-8859-1?Q?wrtkjUbtF4bTtOSKWVI1Kuopc5EvGdoWUBlB9OiaQEn+ilxOv/h6LP72FG?=
 =?iso-8859-1?Q?JYbFF55Kt5u6bHdtHRZg2D0nm79dOeunrifNdwTTDtYDXU1DnkByvHF6S3?=
 =?iso-8859-1?Q?5pDxhqsltzecB4g9mimkpCqfLlUO/zsnIIKSjh1wuZ3Lz62diEpSFKEbCf?=
 =?iso-8859-1?Q?ooB42j9yOvbvAbt1QKJvBZw503Y8NVBFBqgfGN9wv72qG/Fcbx8rXUWOnx?=
 =?iso-8859-1?Q?uU8rXgMG2oDqOpciXsDeaIpJsisB44zbXfHmNVIUvGCQb31aFIevulODxX?=
 =?iso-8859-1?Q?tiuce6P5SouaXQZ2yg98Elbz9OGvEWA1PihP5hWKwRSiSklrjNWJqgOhND?=
 =?iso-8859-1?Q?1Pmodk741VJRdgiSYEHgiCGH/VHQ7HypQsjcbUk89Tnh9/FC6wf72h5yDz?=
 =?iso-8859-1?Q?HKe0B+Y1tR56/NmW9zTD7rl1GANGwdPsJc78vVl9UJ1MdpP/q8tTOE4ifC?=
 =?iso-8859-1?Q?fJ6gSOv3ZiufTj0QR/jW2ksMLMM6lBZlilImvOWy6xKejwyoy1SCsmne3A?=
 =?iso-8859-1?Q?B+c2mmxaFraiawwQ/+r6ty4NBZ4A9gQFfS0Fg1aorFks+ga/6jjxFE5Q4Q?=
 =?iso-8859-1?Q?QAW9t7YB5XKJGQC8CIusyCcvRGLsIGxjaegmmAG4cB7SE+3dZdBYW8cYGc?=
 =?iso-8859-1?Q?A1V04Wm0vgRASSKVMgUEPCShveIRROWbFcgJqZPRep7a7RwFC5TSYo5oBv?=
 =?iso-8859-1?Q?3mntjpogTzv3GVBqqzlyzZdcHIJYvwUpq4ZQC34fmq/yh7OZbkvv/+rtCH?=
 =?iso-8859-1?Q?aI34WZOz+i3UARz+lM30rpokep9x6bgJzt5nz3k9+X5KlqjdzRYfbLL060?=
 =?iso-8859-1?Q?9Yc6LPOy1D/qlCk04bYCVXrW2RQqcWMqxW1aooQUoyT7O04nIpkCKKaOuQ?=
 =?iso-8859-1?Q?rxqyqTg2KtzPyG/bOBAD3Fg5mXsYHaLNGEQJ4m/veg2eMgUCcZu6FjFPmz?=
 =?iso-8859-1?Q?t459HY53dTtkPNtpoJtFEdMe7x0TfFjukM1VaBqMQ49ATvTkSNku1IMGYV?=
 =?iso-8859-1?Q?WHXMY0u4i5ByFQ/iQ0TKgv8zcgDpaUd7Q75NIIrNKX4NBo2+fNYroTGl1n?=
 =?iso-8859-1?Q?1WaWIjhDZOVtWqpMgiyvrWf3PgVPtQaC/SIkbRAnSFaR79wsaHHAgzZFYE?=
 =?iso-8859-1?Q?CqIvonTsyMv0Kiu0ZQPVxdXFBtdP+m5vMi868D/xIBiSCa+uXCnrGxgBK8?=
 =?iso-8859-1?Q?SpD9qmulSw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: ST.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB9623.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4e1297-b4fa-46b1-581f-08de88b89811
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 08:45:53.9802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cq/BCREpZFDFgRcr4z0oxeV155Ia5EPIbEvTruBIYfJ6CvLX1HjRNdIxNQYSBu/Dcq/e8e8aknvk95FoGDFOHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5944
X-Mailman-Approved-At: Mon, 23 Mar 2026 10:35:52 +0000
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] Sashiko: AI code review on Linux Kernel Mailing List
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
Content-Type: multipart/mixed; boundary="===============3189833530915234083=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_REJECT(2.00)[st.com : SPF not aligned (relaxed),reject];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[ST.COM:s=selector1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:denis.humeau@st.com,m:olivier.morchipont@st.com,m:arnaud.rosay@st.com,m:francois.choleau@st.com,m:amelie.delaunay@st.com,m:antonio.borneo@st.com,m:christophe.kerello@st.com,m:christophe.roullier@st.com,m:fabrice.gasnier@st.com,m:alain.volmat@st.com,m:olivier.moysan@st.com,m:hugues.fruchet@st.com,m:yannick.fertre@st.com,m:philippe.cornu@st.com,m:arnaud.pouliquen@st.com,m:christian.bruel@st.com,m:gabriel.fernandez@st.com,m:patrice.chotard@st.com,m:thomas.bourgoin@st.com,m:maxime.mere@st.com,m:christophe.priouzeau@st.com,m:patrick.delaunay@st.com,m:yann.gautier@st.com,m:jean-philippe.romain@st.com,m:valentin.caron@st.com,m:alexandre.torgue@st.com,m:nicolas.le.bayon@st.com,m:michel.jaouen@st.com,m:ludovic.barre@st.com,m:linux-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[antonio.borneo@st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	NEURAL_SPAM(0.00)[1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antonio.borneo@st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ST.COM:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linkedin.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 8918E2F0320
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--===============3189833530915234083==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AM0PR10MB962366CB3DB8B9A52D7C4220FB4BAAM0PR10MB9623EURP_"

--_000_AM0PR10MB962366CB3DB8B9A52D7C4220FB4BAAM0PR10MB9623EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Mid last week, the Linux Foundation, in cooperation with Google, has deploy=
ed an AI bot to review the SW patches sent on the Linux Kernel Mailing List=
.
The bot has already triggered three ST patches from me [1], Arnaud [2] and =
Christian [3] (Christian has just sent a V2, still pending for review).

The bot still misses the module to reply to the mailing list, so the review=
s are today only accessible through the website http://sashiko.dev/
You can search for your name or for the whole ST community "foss.st.com"

Click on the logo on http://sashiko.dev/ to have some info on the project, =
or read the initial info on
https://www.phoronix.com/news/Sashiko-Linux-AI-Code-Review
and the improvement on Rust kernel code on
https://www.phoronix.com/news/Sashiko-AI-Reviewing-Rust-Linux

The announcement on Linkedin
https://www.linkedin.com/posts/roman-gushchin-1a95658_im-happy-to-share-the=
-project-i-was-working-activity-7439736656360005632-M-cb/
reports that Sashiko can be deployed locally.
I think it's a good tool to be integrated in ST gerrit for internal code re=
view.
No idea if it can be used effectively for code other than Linux Kernel.

[1] http://sashiko.dev/#/patchset/20260314170142.18290-1-antonio.borneo%40f=
oss.st.com
[2] http://sashiko.dev/#/patchset/20260317180329.1207625-1-arnaud.pouliquen=
%40foss.st.com
[3] http://sashiko.dev/#/patchset/20260323-skip-bar_subrange-tests-if-enosp=
c-v2-0-2080f878134d%40foss.st.com

Regards,
Antonio


ST Restricted

--_000_AM0PR10MB962366CB3DB8B9A52D7C4220FB4BAAM0PR10MB9623EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Mid last week, the Linux Foundation, in cooperation with Google, has deploy=
ed an AI bot to review the SW patches sent on the Linux Kernel Mailing List=
.</div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
The bot has already triggered three ST patches from me [1], Arnaud [2] and =
Christian [3] (Christian has just sent a V2, still pending for review).</di=
v>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
The bot still misses the module to reply to the mailing list, so the review=
s are today only accessible through the website
<span style=3D"color: rgb(46, 52, 54);"><a style=3D"color: rgb(46, 52, 54);=
" class=3D"OWAAutoLink" id=3D"OWA4bc48f99-9865-b3aa-6da2-f2c011153d55" href=
=3D"http://sashiko.dev/">http://sashiko.dev/</a></span></div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
You can search for your name or for the whole ST community &quot;foss.st.co=
m&quot;</div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Click on the logo on <span style=3D"color: rgb(46, 52, 54);"><a style=3D"co=
lor: rgb(46, 52, 54);" class=3D"OWAAutoLink" id=3D"OWAcadd910e-81ca-21c4-70=
67-3c06d3bea8f2" href=3D"http://sashiko.dev/">http://sashiko.dev/</a></span=
>&nbsp;to have some info on the project, or read
 the initial info on</div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(46, 52, 54);" class=3D"elementToProof">
<a style=3D"color: rgb(46, 52, 54);" class=3D"OWAAutoLink" id=3D"OWAf3e5db1=
9-c0a1-f461-945b-aaf505598926" href=3D"https://www.phoronix.com/news/Sashik=
o-Linux-AI-Code-Review">https://www.phoronix.com/news/Sashiko-Linux-AI-Code=
-Review</a></div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
and the improvement on Rust kernel code on</div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(46, 52, 54);" class=3D"elementToProof">
<a style=3D"color: rgb(46, 52, 54);" class=3D"OWAAutoLink" id=3D"OWAc2d6139=
b-e0f8-3b4b-8068-f5dc72fa91e3" href=3D"https://www.phoronix.com/news/Sashik=
o-AI-Reviewing-Rust-Linux">https://www.phoronix.com/news/Sashiko-AI-Reviewi=
ng-Rust-Linux</a></div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
The announcement on Linkedin</div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(46, 52, 54);" class=3D"elementToProof">
<a style=3D"color: rgb(46, 52, 54);" class=3D"OWAAutoLink" id=3D"OWA2a75b13=
3-7888-45f5-27b6-86b3539b003f" href=3D"https://www.linkedin.com/posts/roman=
-gushchin-1a95658_im-happy-to-share-the-project-i-was-working-activity-7439=
736656360005632-M-cb/">https://www.linkedin.com/posts/roman-gushchin-1a9565=
8_im-happy-to-share-the-project-i-was-working-activity-7439736656360005632-=
M-cb/</a></div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
reports that Sashiko can be deployed locally.</div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I think it's a good tool to be integrated in ST gerrit for internal code re=
view.</div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
No idea if it can be used effectively for code other than Linux Kernel.</di=
v>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
[1] <span style=3D"color: rgb(46, 52, 54);"><a style=3D"color: rgb(46, 52, =
54);" class=3D"OWAAutoLink" id=3D"OWA15ddc1d0-7b62-a468-50a9-29aac2307be5" =
href=3D"http://sashiko.dev/#/patchset/20260314170142.18290-1-antonio.borneo=
%40foss.st.com">http://sashiko.dev/#/patchset/20260314170142.18290-1-antoni=
o.borneo%40foss.st.com</a></span></div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
[2] <span style=3D"color: rgb(46, 52, 54);"><a style=3D"color: rgb(46, 52, =
54);" class=3D"OWAAutoLink" id=3D"OWAe0b3fdaf-3c7f-dc56-c0a5-9ea2b1b7808c" =
href=3D"http://sashiko.dev/#/patchset/20260317180329.1207625-1-arnaud.pouli=
quen%40foss.st.com">http://sashiko.dev/#/patchset/20260317180329.1207625-1-=
arnaud.pouliquen%40foss.st.com</a></span></div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
[3] <span style=3D"color: rgb(46, 52, 54);"><a style=3D"color: rgb(46, 52, =
54);" class=3D"OWAAutoLink" id=3D"OWAd4d38c2d-caaa-7b8d-0ec4-19510aee454c" =
href=3D"http://sashiko.dev/#/patchset/20260323-skip-bar_subrange-tests-if-e=
nospc-v2-0-2080f878134d%40foss.st.com">http://sashiko.dev/#/patchset/202603=
23-skip-bar_subrange-tests-if-enospc-v2-0-2080f878134d%40foss.st.com</a></s=
pan></div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"text-align: left; text-indent: 0px; font-family: Aptos, Aptos=
_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Antonio</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div><br>
<div style=3D"font-family: Calibri; text-align: right; color: rgb(255, 0, 0=
); margin-left: 5pt; font-size: 12pt;">
ST Restricted</div>
</div>
</body>
</html>

--_000_AM0PR10MB962366CB3DB8B9A52D7C4220FB4BAAM0PR10MB9623EURP_--

--===============3189833530915234083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3189833530915234083==--
