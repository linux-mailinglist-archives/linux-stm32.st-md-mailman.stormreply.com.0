Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F22A47C4F
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 12:35:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED545C7A847;
	Thu, 27 Feb 2025 11:35:14 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2131.outbound.protection.outlook.com [40.107.105.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 652A4C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 11:35:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIdNU5bFKouWFTW9oB2R6e0NOFFwhzEeVc1Dawafkf1t6UaPuENo6/N83rX2vNtgoVde2GaO+nKKvAGgi+7HxoolKXAcib29camnkzC1vxnVN+f9oy6+9j4gW3HCDzyTTfb5xdXSugbWbwVN7XUvUCsQKeyaJBuzMcPaOMRhffIX15GxnbWQjri8PopYQM//Y9Fj2Lsl0oRRmS4/7eVH25NkQoZUwWKE659gaSW4Ym2stn0fgV1rGKr4EnrbGYkxENzc+rmhSVzt7frjg9eyatLO+NHxoozz9iH7CseZINxfnBQVU2+iew4dmAs/HX+WgcACw3Zn3kX0TM4hL0+B6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZjk1aip72gg4ovvRa3m/GJzO4JU4Bcr02RmK5zQsL8=;
 b=SlWj3wGcOjWekkbNfFhOLTnMjiFrg3/BdbEwHhpl6TOX0BrfE6q8VomZnS6NQFrFL2T2v3og7q1JYTAdgwcDGrMMbvkgvUlksaL4P+57vVEGgo9RHq5Io3Dxkgau3hR6Kq93DA1lttvghnRnI9KYxjZkc/7q8/qkFZuu1zHmHipuFi8YU8mQXk928LyySUgaMlqKg9m0WtU6AnR8slzyjLPb8KSd+aX88qwKm1x881jV9dkDqc5KMki2eZSQ6Yxe0ZXqSeysNzSb/X130wo3rLwN1Dl7sLc2cHmorTL7Hw3zSiIw5nn7+gzIk+kpDfu9TpPsksOmXDUkQq1B3krrrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.fr; dmarc=pass action=none header.from=phytec.fr;
 dkim=pass header.d=phytec.fr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phytecmesstechnikgmbh.onmicrosoft.com;
 s=selector1-phytecmesstechnikgmbh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZjk1aip72gg4ovvRa3m/GJzO4JU4Bcr02RmK5zQsL8=;
 b=Q3vInuzbBpg2Qg6POpkpoxJrMUx5INJtn+HBS5QzVEnTalfjzum4y9ABQs7mMutuRmSmNGzvl5FuzxTxvKsU3WFdU2ngDF51wwrr8+wtFmesxjxrnlAl/GXkkvQA5QoZIzYHyH8zu57KJRvRcBVHMn2nkWW8V9ewMm7BT2oWeiU=
Received: from DU0P195MB2197.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:472::20)
 by DB9P195MB1611.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:37e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Thu, 27 Feb
 2025 11:35:10 +0000
Received: from DU0P195MB2197.EURP195.PROD.OUTLOOK.COM
 ([fe80::59ab:3743:c2e2:6e2d]) by DU0P195MB2197.EURP195.PROD.OUTLOOK.COM
 ([fe80::59ab:3743:c2e2:6e2d%7]) with mapi id 15.20.8466.024; Thu, 27 Feb 2025
 11:35:10 +0000
From: Christophe Parant <C.Parant@phytec.fr>
To: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "alexandre.torgue@foss.st.com"
 <alexandre.torgue@foss.st.com>
Thread-Topic: [PATCH 00/11] Rework and fix STM32MP15x PHYTEC dts
Thread-Index: AQHbiPUavvcuIKSpr06jYqunBjSbybNbBWQA
Date: Thu, 27 Feb 2025 11:35:10 +0000
Message-ID: <d4f9b1513c695f75f74774d601c6b9f6a2858bc4.camel@phytec.fr>
References: <20250110150216.309760-1-c.parant@phytec.fr>
 <5467805a-c8a7-4c09-9ff5-1cf77541c3fb@foss.st.com>
In-Reply-To: <5467805a-c8a7-4c09-9ff5-1cf77541c3fb@foss.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.fr;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P195MB2197:EE_|DB9P195MB1611:EE_
x-ms-office365-filtering-correlation-id: 14fe1121-743f-4197-8be8-08dd5722cae4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cWNtSXdZcS8yblFJSm5iWW1GVVVhYkNwV2RESHJkUFpDbkVHRnlINGRCTWNS?=
 =?utf-8?B?UVNoNi93SE1kd0dCR1pYYTZKYVBYN2diZjdFWWFZMW83OXVLcXczZ2poUDEr?=
 =?utf-8?B?OTFaMVZza3VOdTBFTXk0Q0c3RWpmNlJ1bFZPaUxSbjVNdW5qQXJEZU50V0Fz?=
 =?utf-8?B?NUVEeDd0cUtlMlkybFhLQlBzTHBDc1dDZERJV0s4WWhJRUJZck5XRUxpd3J5?=
 =?utf-8?B?RzlrVUxVSjZITE1iMzkwb28vZnQwanpjNmJodWg3V2ZvbmF2U1NKVHdTRjlG?=
 =?utf-8?B?cC9wUVFlTmNxOTlobnQzTUJUTHk3eGxITHordlU1NWV6QWVTNXZUblczaEVt?=
 =?utf-8?B?N1M4SVRiY3Mwd3RGaDBvRWI2Q1ZpanZaU2VaYldaMFRMRHpEbVlXU3pIUCtU?=
 =?utf-8?B?N2Z6dEU1QllkMUZBeXdVMDIxYjlZWkNQVGkzNUgzVVQ4aEM2VUZFK3lOSDZt?=
 =?utf-8?B?MUNwZzV5Y2kzY3NSU0EwYXE1ODA0cG9EbHpTcTExY0lnT25Qd0lyZTcvRm9B?=
 =?utf-8?B?U1RFUFJMOUEyZWhmb1ZJajEraWFuYVJlNGNiWWZpamJxbFk3UTNhejFLOTB0?=
 =?utf-8?B?VnFZdE1HcURBd2JMQUpqU3BEd0RLMXArSjJaS0FqN1dxVkZTUUdPMk1COWM2?=
 =?utf-8?B?ZWpSd1g2N1Q2MmQ1dGdRNmdEd0JoUi91d0cvRjR2c2FPQTRMQ3RsOHBwSWRE?=
 =?utf-8?B?NHhwTUZhVmFUSWpkRmc3MDV0Ri9qS3pTYzVXWmhqZmZWZStJZU8xMlhLMllv?=
 =?utf-8?B?NWRWNXJDSmo3NkQya2R0WFBjZ25Qem5wRVN2cnFiMkF4NHY4M2wzN2pzcU9x?=
 =?utf-8?B?YUhMWjYvVjlUb2ZSNnFDbm1pWW12c09nM3g4c2MzMmprc25LNU1uUjhuOTVY?=
 =?utf-8?B?cWRJTm45b21nM0JJVEFoOTIyNVN6QU90Y3h6NHNSeUtLQmszWXFzdGpPRm5Q?=
 =?utf-8?B?RVhRenFudjJWVCtJVUdGeHdubzZRK0dCcW4yZUVEZDZIV0tCSG5UbzJjS2N6?=
 =?utf-8?B?ZndzNjhDb0ZvdGFTUkRCeGdkSllzZ1pwZU9Gc0NGRlFHZlphOG1tNHhpZ2h5?=
 =?utf-8?B?d1RxaEZKSXhFaGprRHRudVNxVkVWUy9ESlNqZTRZczVxTnptSTA2QnFYZUI5?=
 =?utf-8?B?ZC9PdDgydFp0TmFkMVErZkRKb1BLNFRBL1E2dzlmUUVlenQ0OXZtZW1MOUVY?=
 =?utf-8?B?ckFjKytiSVh6L2pPSStJa3lHVU1YWWdUU3FxUWIxblNuRUFOV1V2UGJ4K3Fz?=
 =?utf-8?B?cEtJNEhadm1DWWRlTFlkcGx4SW1UdE5VQU56cEpKU0Vkb09kZmxmRUQzbmpW?=
 =?utf-8?B?T2lsZEdVVHBuR1lZZjZLQkUwMis4c1N4b0FlbGhrU0wveWdQZXBDVjZnb3h3?=
 =?utf-8?B?UUpEYjl0M2hIOURld1N3eXQ1Vm1SVERsQUdETDBJL3FKc2JwbVNydTNYbURm?=
 =?utf-8?B?dHlodUFlcmFLRXJSd0cvbkxURysvem5vRDBRU1B4TEJtMzhYaVJIL1F6R2p3?=
 =?utf-8?B?MndETWsrQjF1ajhZTVA1ZFZyenFBazZNOXAzRHlBNWo0akI5ZXZPTUJybnNq?=
 =?utf-8?B?NDQ4L1VMQjV5Qk42azR2TTUyM3lnMkFsVEQwcElTZ3JPUDVUd1ZQTVQwdXA5?=
 =?utf-8?B?WlgvYU0xUXVtYXBUSW03SDNndUJsK3NBZ3o3V3NCM1VGK1pBSlI0eFNnQk1U?=
 =?utf-8?B?emc2RzdobFNIQXhBaTljTDZxbVB5Z3dOQ1VGMmo2M3B5QlZWY1kvVUJhS1E3?=
 =?utf-8?B?S1Q1QklXVEpCQmNKUkNaZXJWdTZ1M2RwWWdQNVR0aFBGdU5NUHF0UjlRaE5J?=
 =?utf-8?B?QnlGOVo0dVBlMk9hM1BMOEExbGFNcmk2b213S2FRR0ZoS3NDYmQ2eDJyTlJt?=
 =?utf-8?B?cnYwRDRTM040ZWZ1VHhXVkM0Mzk1eDFuYnJtTW1ZWDRKYktmT28xYmQrVncr?=
 =?utf-8?Q?sMlAfPwrCJYoX20XvRvjCHByyK9dKGC1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0P195MB2197.EURP195.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3Bpekxpci9lVTRhYVRYUG43bXdBZkFUY3ppc1R1NER4RVZEMzEzUTF3NHJ3?=
 =?utf-8?B?ODVOVTlNL0pqaVVPR2g5UXBvRzZUaCswak92U0hXM0NvbmFSSnNrZzlzNTc1?=
 =?utf-8?B?TDZvMTFrdkFrUG1ZdHJOQklIdlIzUzh1TUhsZCt6YjNlc2hHRHZTaHJhWHdG?=
 =?utf-8?B?cG9jWXJPWDU5bmVteVJkVWNKVjdMMWU2VmVIQjR0aGV4U1VaN3BIaWtLcURr?=
 =?utf-8?B?M1hvMkhXM3FXVEVVK2ZOY1pBb2hCT1dUU2t0Vm1VZUV3WCtFTlRiTk9xSEU0?=
 =?utf-8?B?UWpwaGVpUU1tbElINGVwTURrYVRha2NHNDYrUXF4NjlIdENBTlpmcm1ISW5u?=
 =?utf-8?B?SENzcGRLZlV0TVFROUw5NG9VbktWY3dJMlR6eklic1FxeEdFbzd1TUpvdmNl?=
 =?utf-8?B?MUtFNWZwcU81SFcxRkNJbkx3cHFubmZjL0NJYXlmRzRYK2pTQWdDR0p5dTRQ?=
 =?utf-8?B?eHMwc0VLTTl3WlBqZCtVcnJZeTNYdllwL014emcwZzhHdUJPZEtEVHJsMnJp?=
 =?utf-8?B?WHZ5UC9QWDZJTld3eWR2amRpNnRxYUZaTGVQZ1Z0VXNzMWJ3cmNxakhQdnBh?=
 =?utf-8?B?V0VsWTdVZjlna3Vtd1Z6RTR0YXRqZHQvL0tNNVNqam9oTDhzNTAyd1AyWUdO?=
 =?utf-8?B?OXpNUVduQ0JsRCt0WGFkRFhEVWxQdzRYVW9wbVV0RE9jNmttbjdIK1diVDlv?=
 =?utf-8?B?WFg2MVo3aCtBanduVmsxQ2dOZFYrbDY5dENNZ0FVYjNmc2M3bVNNZTRUamM2?=
 =?utf-8?B?dEc4ZTMyQ203NVUyanNBV2N5dFFNMTdYVS9LSGdrdmdqWWFUV2YweW5UalhJ?=
 =?utf-8?B?R2VaNFY0cEdyTmpOVDZ4cHN6TU1ETURwZ3pxYXpPQk9kaW5sSEgxUlFZUS9s?=
 =?utf-8?B?UmNCYnlzTDdBc0JJTkpJc0RMSExtYlhDT3pxdFNFdWFZSmJDajhWaUhHUUpN?=
 =?utf-8?B?MWhtV1YwWS9OMk54WENzb3VDMVJDZFl1cFVRTUJxOWdmNG5ReTJOTUNoaGZR?=
 =?utf-8?B?bGsxTGlvenNBaWQxdWNLeFYwYjhJZmxabG9yQk94bGd6Ni9YaExRcytGV1hE?=
 =?utf-8?B?Mlp1QXgrWVdqVUZKMjVjVFpyYXVQaWxWU0dJR0diU3JEU1NLNmU1bjFkUHBu?=
 =?utf-8?B?VlZkRVlETGMzWXFycEMwZ1dqenVMMzJjVHpOdzBMZkRycUlNRk1uS0pLclBG?=
 =?utf-8?B?ZE5hejlVRDA3bnh1S0RNRUR6TUZERkhIazR3RW1GUlNyK1ZxZUlYT1lMR2xS?=
 =?utf-8?B?TXhnTk9MUjhRVE1rQURBckQ3bDlvSjFKam0ycnZyV1A1QllOQ3daN0hneElm?=
 =?utf-8?B?ZmJqekRqeTFIYXpDaktJcXZrZWN4V1NzNitqRmdCNTdJQWc1bWh3VzlJVU9G?=
 =?utf-8?B?Y3dvVWpGS25BLzZKalFqcmdDeURqcjBBYWY3bnB3ZjFKNVJvYlpjcGtyVEIy?=
 =?utf-8?B?MEtoUXltR1ZrbGVNVU1qc2VVanNxTkRFTk5XdnhzMU15bXp4WXhxSGhDZTRR?=
 =?utf-8?B?dXUzTTcvQXNSOThPT3NTWDhLZTdkektDTjlqWnRIZVB4NC9GaWFQTEV4dW1l?=
 =?utf-8?B?enNEYjBJbktNU0pqZkZTaXh6UGlYQVNUWGRjaWd0Wnd1QnJIQ3ZmSU5hTkdJ?=
 =?utf-8?B?ZXgrWGhReU1pWVBUbmpPUjdqYVdEOGVHUXplNHFpYzdOd2xxSXY5U0h1MnMy?=
 =?utf-8?B?OUZmWm1UYUtwZUxoeG5TMldjdTFxUTdQOFVQdzJXb3B3V1krNkRacG1yMmRp?=
 =?utf-8?B?cVNUWDQyMlFueWlSS1N2YWpZdnB6MkIrbEJMU3pSZzdMS0xrY1AyUHhBSWtS?=
 =?utf-8?B?Y0taNk13alZBNHcwWmdSbXk0MUZXd1lUZ3VSRTRURVBIZlpZeEM1NmdFVDdY?=
 =?utf-8?B?K3hhd3JyWHZjdyt0a250TmcranE2WnJEUW9qdTlmZ3F4aEFrdjVHTnhkOHJs?=
 =?utf-8?B?TjJ0akQyUy83blpqUGEwWkxSWUlBMEk2THo4Q3F3N0lnckpmTFBiVnllRmw5?=
 =?utf-8?B?ZDdlMkFnQStOMitWV3FTd3pFeThzUWYxNWNKbks3azFmK0lOV3BwejhqdWxt?=
 =?utf-8?B?dGxRQ1lNWEx1TmFnKzN1N3NXcUdYUElQS2o4Q2hmTEY5Y3dSTVBvT01DTHVK?=
 =?utf-8?Q?p3N8dJvvxzDlIwIuaZSR9y2fY?=
Content-ID: <A9236556119F474484DD164FE0873A86@EURP195.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: phytec.fr
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P195MB2197.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fe1121-743f-4197-8be8-08dd5722cae4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 11:35:10.0724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DHngdlrRh4TGdP1h57ruuxHJI3kEyd8O4oj/KfUROG34DNxXkfPPd6L3OBja+GcGk21K3rNWnHZnckZ924/KKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1611
Cc: "upstream@lists.phytec.de" <upstream@lists.phytec.de>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 00/11] Rework and fix STM32MP15x PHYTEC dts
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgQWxleGFuZHJlLA0KDQpMZSBqZXVkaSAyNyBmw6l2cmllciAyMDI1IMOgIDA5OjUyICswMTAw
LCBBbGV4YW5kcmUgVE9SR1VFIGEgw6ljcml0wqA6DQo+IEhpIENocmlzdG9waGUNCj4gDQo+IE9u
IDEvMTAvMjUgMTY6MDIsIENocmlzdG9waGUgUGFyYW50IHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2gg
c2VyaWVzIHJlbmFtZSBhbmQgcmVvcmdhbml6ZSB0aGUgU1RNMzJNUDE1eCBQSFlURUMNCj4gPiBi
YXNlYm9hcmQgKHBoeUJPQVJELVNhcmdhcykgYW5kIFNvTSAocGh5Q09SRS1TVE0zMk1QMTV4KSBk
ZXZpY2UNCj4gPiB0cmVlDQo+ID4gZmlsZXMuDQo+ID4gSW5kZWVkLCB0aGUgY3VycmVudCBkZXZp
Y2UgdHJlZSBuYW1pbmcgYW5kIG9yZ2FuaXphdGlvbiBpcyBub3QNCj4gPiByZWFsbHkNCj4gPiBj
b25zaXN0ZW50IGFzIGl0IGRvZXMgbm90IGFsaWduIHdpdGggb3RoZXJzIFNUTTMyTVAgYm9hcmRz
ICh1c2UNCj4gPiBjb21tb24NCj4gPiBkdHNpIGZpbGUgYXMgbXVjaCBhcyBwb3NzaWJsZSwgdXNl
IG9uZSBkdHNpIGZvciBTb00gYW5kIG9uZSBkdHNpDQo+ID4gZm9yDQo+ID4gYmFzZWJvYXJkKS4N
Cj4gPiANCj4gPiBUaGUgc2VyaWVzIGFsc28gZml4ZXMgc29tZSBpbXBvcnRhbnQgcGluY3RybCBp
c3N1ZXMgYW5kIG1pbm9yIG9uZQ0KPiA+IChjb2RpbmcNCj4gPiBzdHlsZSkuIEFkZGl0aW9uYWwg
cGluY3RybCBpcyBhbHNvIGFkZGVkIGZvciB0aGUgb3B0aW9ubmFsDQo+ID4gaW50ZXJmYWNlcw0K
PiA+IHRoYXQgYXJlIG5vdCBlbmFibGVkIGJ5IGRlZmF1bHQgKEZNQywgTFREQywgRENNSSwgUFdN
KS4NCj4gPiANCj4gPiBDaHJpc3RvcGhlIFBhcmFudCAoMTEpOg0KPiA+IMKgwqAgQVJNOiBkdHM6
IHN0bTMybXAxNTogcGh5Y29yZTogUmVuYW1lIGRldmljZSB0cmVlIGZpbGVzDQo+ID4gwqDCoCBB
Uk06IGR0czogc3RtMzJtcDE1OiBwaHlib2FyZC1zYXJnYXM6IEludHJvZHVjZSBTb00gZGV2aWNl
IHRyZWUNCj4gPiDCoMKgIGR0LWJpbmRpbmdzOiBhcm06IHN0bTMyOiBSZW5hbWUgU1RNMzJNUDE1
eCBQaHl0ZWMgYm9hcmQgYW5kIFNvTQ0KPiA+IMKgwqAgQVJNOiBkdHM6IHN0bTMybXAxNTogQWRk
IG5ldyBwaW5tdXggZ3JvdXBzIGZvciBwaHljb3JlIGFuZA0KPiA+IHBoeWJvYXJkDQo+ID4gwqDC
oCBBUk06IGR0czogc3RtMzJtcDE1OiBwaHlib2FyZC1zYXJnYXM6IEZpeCB1YXJ0NCBhbmQgc2Fp
MiBwaW5jdHJsDQo+ID4gwqDCoCBBUk06IGR0czogc3RtMzJtcDE1OiBwaHljb3JlOiBxc3BpOiBG
aXggbWVtb3J5IG1hcCBhbmQgcGluY3RybA0KPiA+IMKgwqAgQVJNOiBkdHM6IHN0bTMybXAxNTog
cGh5Y29yZTogQWRkIGR1bW15IG1lbW9yeS1ub2RlDQo+ID4gwqDCoCBBUk06IGR0czogc3RtMzJt
cDE1OiBwaHlib2FyZC1zYXJnYXM6IE1vdmUgYWxpYXNlcyBmcm9tIGR0cyB0bw0KPiA+IGR0c2kN
Cj4gPiDCoMKgIEFSTTogZHRzOiBzdG0zMm1wMTU6IHBoeWNvcmU6IERpc2FibGUgb3B0aW9uYWwg
U29NIHBlcmlwaGVyYWxzDQo+ID4gwqDCoCBBUk06IGR0czogc3RtMzJtcDE1OiBwaHljb3JlIGFu
ZCBwaHlib2FyZDogRml4IGNvZGluZyBzdHlsZQ0KPiA+IGlzc3Vlcw0KPiA+IMKgwqAgQVJNOiBk
dHM6IHN0bTMybXAxNTogcGh5Y29yZSBhbmQgcGh5Ym9hcmQ6IEFkZCBvcHRpb25hbA0KPiA+IGlu
dGVyZmFjZXMNCj4gPiANCj4gPiDCoCAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vc3RtMzIv
c3RtMzIueWFtbMKgIHzCoMKgIDcgKy0NCj4gPiDCoCBhcmNoL2FybS9ib290L2R0cy9zdC9NYWtl
ZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0NCj4gPiDCoCBh
cmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTUtcGluY3RybC5kdHNpwqDCoCB8IDE2NCArKysr
KysrKysNCj4gPiDCoCAuLi4vc3Qvc3RtMzJtcDE1N2MtcGh5Ym9hcmQtc2FyZ2FzLXJkay5kdHPC
oMKgwqAgfMKgIDQyICsrKw0KPiA+IMKgIC4uLi9kdHMvc3Qvc3RtMzJtcDE1N2MtcGh5Y29yZS1z
dG0zMm1wMS0zLmR0cyB8wqAgNjAgLS0tDQo+ID4gwqAgLi4uL2R0cy9zdC9zdG0zMm1wMTV4eC1w
aHlib2FyZC1zYXJnYXMuZHRzacKgwqAgfCAyODYNCj4gPiArKysrKysrKysrKysrKysNCj4gPiDC
oCAuLi4tc29tLmR0c2kgPT4gc3RtMzJtcDE1eHgtcGh5Y29yZS1zb20uZHRzaX0gfCAzNDQgKysr
Ky0tLS0tLS0tLQ0KPiA+IC0tLS0tDQo+ID4gwqAgNyBmaWxlcyBjaGFuZ2VkLCA1NjQgaW5zZXJ0
aW9ucygrKSwgMzQxIGRlbGV0aW9ucygtKQ0KPiA+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTU3Yy1waHlib2FyZC0NCj4gPiBzYXJnYXMtcmRrLmR0
cw0KPiA+IMKgIGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1w
MTU3Yy1waHljb3JlLQ0KPiA+IHN0bTMybXAxLTMuZHRzDQo+ID4gwqAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LXBoeWJvYXJkLQ0KPiA+IHNhcmdh
cy5kdHNpDQo+ID4gwqAgcmVuYW1lIGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3tzdG0zMm1wMTU3Yy1w
aHljb3JlLXN0bTMybXAxNS0NCj4gPiBzb20uZHRzaSA9PiBzdG0zMm1wMTV4eC1waHljb3JlLXNv
bS5kdHNpfSAoNTMlKQ0KPiA+IA0KPiANCj4gVXNpbmcgYjQgdG8gZ2V0IHlvdXIgc2VyaWVzLCBJ
IGp1c3Qgc2VlIHRoYXQgdGhlcmUgbm8gbWFpbGluZyBsaXN0DQo+IGFuZCANCj4gRHQgbWFpbnRh
aW5lciBpbiBDQyBvZiB5b3VyIHNlcmllcy4gRGlkIHlvdSB1c2UgImdldF9tYWludGFpbmVyLnBs
Ig0KPiBzY3JpcHQgPw0KPiANCk5vLCBJIG9ubHkgcmVsaWVkIG9uIHJlYWRpbmcgdGhlIE1BSU5U
QUlORVIgZmlsZS4gQnV0IHRoYW5rcywgSSBub3cNCmtub3cgdGhhdCBJIGhhdmUgdG8gdXNlIHRo
ZSAiZ2V0X21haW50YWluZXIucGwiIHNjcmlwdC4NCg0KPiBDYW4geW91IHBsZWFzZSByZXNlbmQg
YWRkaW5nIGNvcnJlY3QgQ0MgYW5kIFRPIGxpc3QgPw0KWWVzIHN1cmUuIFNob3VsZCBJIGNvbnRp
bnVlIHRhZ2luZyB0aGUgc2VyaWVzIGFzIHYyID8NCkkgd2lsbCBtYWRlIGEgbmV3IHRpbnkgY29k
aW5nIHN0eWxlIGZpeCBkZXRlY3RlZCBieSBjaGVja3BhdGgucGwgKHRvb2wNCnRoYXQgSSBoYXZu
J3QgcnVuIGJlZm9yZSkuIFNvIGl0IHdvdWxkIGJlIGEgdjMgaW4gdGhpcyBjYXNlLg0KPiANCj4g
Tm90ZTogQVJNOiBkdHM6IHN0bTMybXAxNTogLS0+IEFSTTogZHRzOiBzdG0zMg0KT2sgSSB3aWxs
IGNvcnJlY3QgdGhhdC4gQXMgUEhZVEVDIHByb3ZpZGVzIHBoeWNvcmUgZm9yIGJvdGggTVAxNXgg
YW5kDQpNUDEzeCBzdG0zMiBTb0MsIEkgd2FudGVkIHRvIHVzZSB0aGlzIHN5bnRheCB0byBtYWtl
IGRpc3RpbmN0aW9uLiBJIHdhcw0Kbm90IHN1cmUgdGhpcyB3YXMgYWxsb3dlZC4NCg0KUmVnYXJk
cywNCkNocmlzdG9waGUNCj4gDQo+IHRoYW5rcw0KPiBBbGV4DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
