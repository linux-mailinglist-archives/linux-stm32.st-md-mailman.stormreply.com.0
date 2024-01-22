Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4412836919
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jan 2024 16:53:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2375BC6DD6B;
	Mon, 22 Jan 2024 15:53:50 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01olkn2090.outbound.protection.outlook.com [40.92.107.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 856B6C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jan 2024 15:53:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fe/dR51MGYWyNXzX2XEhJAxDDWxlamBBVekOiWnILWLwH6D3aTAmnrhkqCDtKk8ZD9EEOgwVC8o+2kBBJGpGvMCXb9W+pgQZ4DXb8FoTsi9emGig0Vutd1tPG6QIDLwRXFC1uZNs356TInPK0fZ/6hRbXOEwR7fnpvd1oQhjhqQISFLaYY5Xts3KzokddTV+2gZdLdcMJlzkYUUfsjCO5HpnG3tubKWZFOpKuCugkV6ASirAs9ols4BJwiLNzEKWx6TipKI5WkhZMivixfxdOyZbue4z0EsbxVvDzwR55kuctB9gkgyKfV72exv2fze5K7kw/TUvH9sq6pqCkchZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XEg6cxerjWfFSYeEU37Ji9axPwj+NTZ65b9M1vpDyE=;
 b=gY3RIt95AioOQg3WTUeI5JaRzazO1lBgBZYTFd8w7gP1HiuyHONvzyyl6Et/4UV2F2D25GLcwOv6TTHKBcQZSESBrPJ8S2o8CaVZDchx7TWrRZUnb61OamFQVok1HzPS7FVOUv3M0QvZcWYJJonKTB82evo2L0JYxP2UC7mCUt+NMD6PmMk2c9zS+X2E+1vuw9mWJJ70GDJ0a8mvPfdiE7QyUX9iuTCakquqecTf+Ze4qiiJfTODJxM8Mur96HbuDXqlsRfoAblpTCYG+sfsE8NdcznAj2Z+4Dv6vhFMn3VbZ+V8IGl5Ao33ypow+rhYvX+EyhXgyBhoPTBJV2MJzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XEg6cxerjWfFSYeEU37Ji9axPwj+NTZ65b9M1vpDyE=;
 b=eKFSq/99sEqWN4v5vlCKMvltdiIca15lghtvrbtiQ6GySACfoFegqagDwh+fgEMn0vI8F3NQM/Ai7kSNPHOJPvEKPp+xZqub07mGcNaRFMZNHw2wB2zjUVQOLiOCPrYFNrzNIL09CPVD3lFzLufllUHdsNjFpTNUIMjtXjWgJVLTcF8TyFLv29VTF2rgFT2qgQv4cGfwOcS/f68cKiMQ2NDa/GFDfP2svm63Pqp49ZFBgyOFqHTyLqGDDApqXM3DWKtxZVufJ6rsQiJKV3+LrhUDwyC3WewEG6MhuV+3dUa26rLeFuOCf9TAXj4+NAi41yu4bwpyBneClfmyu6Ymzw==
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9) by KL1PR01MB5759.apcprd01.prod.exchangelabs.com
 (2603:1096:820:10e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31; Mon, 22 Jan
 2024 15:53:42 +0000
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::a639:b02c:5189:7140]) by TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::a639:b02c:5189:7140%7]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 15:53:41 +0000
Message-ID: <TYZPR01MB5556603EA4C5D7BAF9C27C6AC9752@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Date: Mon, 22 Jan 2024 23:52:30 +0800
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556FA040B07F48AFE544680C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <b8510b38-3669-4a04-9ca6-dbe937ecbec3@lunn.ch>
From: Ziyang Huang <hzyitc@outlook.com>
In-Reply-To: <b8510b38-3669-4a04-9ca6-dbe937ecbec3@lunn.ch>
X-TMN: [0IRDUKUQfG4l5zt2hhhcomOj+XtQL6Xa]
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9)
X-Microsoft-Original-Message-ID: <22820ed2-135d-46f1-90fa-9b3c925bf92f@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5556:EE_|KL1PR01MB5759:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c5ee07-38e0-4809-d43a-08dc1b624e2b
X-MS-Exchange-SLBlob-MailProps: Cq7lScuPrnozpoe5DD7mC6QHwETenhSvcTJV0/3/2xM0U79+y5QKtvhkuvux0j6/UQU2njVsKIjiF8+aY9LlGtoyaEbeInVxnK5KXZqrjuXC2R4y6+mOjlPVRnDL3/aMtWLke9rCSw04YxrnFVum1PyC4l9qKaPzj3D80gBOz6vk3q//qrJ7HMTB9ubcH6MPNecSdwWMz/gzlZ2qTP/SouuvMLOodmdZ3Hw6WecDI5wCBR2X6W91+LhEfS4fIpiHjT2TOdQHGUN3Z2bCgzIDc/k/R0UTjmFzR5BjsiVAMftpJ1NVxtDSdMGSDsE5BOrINvIlHoRx3lofBHGphywThYbHwV5FjlVnjFycPzRKsG32NDsKIEC2Vq4aS/p+IR8MuZn5C7TCln+0ZsdqKuMZjwg0hAwhpL2hGamjqs0LLlPktbZ/kGijJmvrdU1vg0r2vmwZNlU3mXMLaFaiHIORfLz0KW/70dYgaF9V5BzwGAhFPf7Dju/5Rzt2ums2wbySKcWvWVo7jrngBY/L4cy1Bfn8XyIoVpRN2vBbXTN6U9uTXY+wPv9YCyPj1J6HtMMlBLw2Q/nyxeXaSYzR2NXiIzzazkgrvAkC1rEemuj8XAtZlphML2l9BEuj9B5UaA2x6nrazgs3vSboXEZuPRHDHpMh7I8V/iv4M/hUMpd3kyKjDLByq/rCCvL+adMxc1HgVmtu8YTijAJlwGcDzV/uoFxe4Or477M8GiDDKJE7GHNSSEf2eYwE/TyAhbqa8jubWdHh+U2nJGM=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wkk/ItgTsl3Tk6cqI06PiE2vRyIO1tLUQTuEgQitoKoATCLabWbzPGEkGSFtn5lnaDbWjQo2XsFjSCcxkPijvrs6ZnOD07pNAsr5O5mOeg/0hMo7kMm6Q5MT7hXzJZvSeciLJapxpNZqN2b9iPpYGlqQSeVjWlTHSRnWW6x9powGvPnePgKxMUnYmFTxRtyCvwj9bgrGwlBdH/KTM8m5CKolCC4PuGAmmXTee0cVDa8yXC5/2GKJRkbtoDPvg+54XFLdxt/8W6kL6CHkm3zXcUumnp31fUt7KsDEuzqUbtgvW6CqNu7bWI3EA40UDolxFHUBOt+Hymg9QNrRMTjqgGwXhOLN0tzjdTOj/c8BLvqX7VdUvdj1fkDVRNlJWOtDOMv+t0/LzhglbWj3ap9qm8FxZkwX8PhL+NcRecmN6E2xePXOdDNNWNyX6xwGVDXKslZt/mS02NrwnxgTRgPnDS8y6UchiOi9r8+NNYGUs82sIT4QJBiTESI5Z7ki2cybWERSXo8Ll+FCWUMHP5U0+LwOUcTtc853E7mqjbe/EkrAeLbe9+xfinvkTFVGYXMh
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHVoK2dpK1QvUTVtazZqSmNURm13VVZjRi94NVQ3RTV3d2dwM1lITVR1blpq?=
 =?utf-8?B?UFp3djRkOWNlZFNsVE1tTEMrclRxSWZBZ055YmY0RG5rcjZNdVMyWVN5eUwr?=
 =?utf-8?B?QUhxcGJyRFN3MDFVNWZtaUwyOVlSc3lVekNRSllXaXpBYTFqN2xhclVVQXNE?=
 =?utf-8?B?ajFpS1A3b3lWTXB2eERtY3NVVHZHVVZTaGpIOFZPVFN4MGVGUkl6WlNqbkxO?=
 =?utf-8?B?d3pER21WcjdHeHdMa1hhZWpmbFpwS2YxZjlUc3lNYXJSeVQ5cTNDRHZ2Z0l3?=
 =?utf-8?B?cVlYVXEvUllFVHJQZWt1elVCRTZPMjl0bEFkb1AzVEhnSTFUTDdja0FHc1Vh?=
 =?utf-8?B?SU9xMzBFQmswdzFoRVI1b1p1Mkc0ZEtTOUtnQjR6elRRRTVHRjhPWUxpalJk?=
 =?utf-8?B?R3JVd0ZQRVIvWEppRVpFK1NWK0NWQjl1SGJRdHJ3K1J4dHVuMDJiZk5TV014?=
 =?utf-8?B?RUo5VUw5VDdLcTRlTS9Udk0ydFBPT1hmY3FkTjRsRnJpTTIrdDhSMVVNbFVk?=
 =?utf-8?B?bVF5NTZpb1JFT09nV0YxMGtkb0FRWjJMNFdXNjZoOWpiRlFVSktyeHdpWXQ4?=
 =?utf-8?B?dlJlRDhTc3VLMCtXY29VYi9mWFVHZW9pc25neUROV1FXT3REMWpWdFV0Zndn?=
 =?utf-8?B?eVAvS21SQmN2QTNjdWEvTVZCZlpZQyswNStLaUlIQVZkYlFWMkxGeDQrWjdT?=
 =?utf-8?B?bEtyaWIvV0ZBVHEvejUvR0NuYklRMWsweDdydnF6L3FSRTBOK2pYSEdjMnhC?=
 =?utf-8?B?bG80T1dpcTFPOVZyeWx2elRrY1FDbEJaK2tLTm1sT0sra3A0L3FpcnpCQVY3?=
 =?utf-8?B?UlkvVUR4OFN5WHhRT3l2TndTL29IYWE0c0dtNk45NkNsc203N1VCaXpoYS9p?=
 =?utf-8?B?Szl0K3FLNzhXZTVBVnRWYzlCQUF0ODhwNks2b2Q4N2lwU0FKVHVpbUptSmIz?=
 =?utf-8?B?RHZTYklUcitlUVRGTmpId1VIRVhuSXR5UDYybWhQYUh3R1JwSFhJajJ4WTlo?=
 =?utf-8?B?elQvNnNVY3NMVUlvdmtsU1VjUkp0VEs5U1JCMDgwcGlPZkc2MWN0bWNMN2tt?=
 =?utf-8?B?em9zNUVEWnJ6Uk9DbkU3V2xNQWk0Z0szVkJLUjkzZysxcW9tSGJRd2JJYk9u?=
 =?utf-8?B?ZWZUYXVPblFsaEFFRWRKNGxTRTdIMHY2Z21FRlRoNHA1YzBNdEEvSFFOdnRB?=
 =?utf-8?B?WXdmQmNRVzRISVJXUUNBa3FUUlB3cFVEMFVFdll6amMvdlluVU9HaE9jTFZo?=
 =?utf-8?B?VHpIdjRDc2s2V2t1Rm1UYWZWc1RDbit6cU52MFdGSUhVbUM2aldycFBHbXVn?=
 =?utf-8?B?ZHBYWTczZjNnR0pEMXFHT2xlNGs0QmFJMXYxTUJ2VGczN3VTUzJpKzdzK2hp?=
 =?utf-8?B?UEp3V3UwSnpVT0VHdTRBSElJcitaNEt4Z2MvZnhRb2wwMVcyV3V3VDNsdXZl?=
 =?utf-8?B?K05RSXBiRFlIeGVHckRJVlRacmF5N1ZsN2cvWHU1OHRZbHRURVAxZG5iTENM?=
 =?utf-8?B?ODM1KzhVVGVEd2MvSmlKVHA5YXNqdTZvN3U4cjFUSXJHU2pIdGZXcGRVUTI0?=
 =?utf-8?B?MlhEcGM5WGdnakgrcFlOSkRhOVIydTcvZjdYY0pJNUtJZjV6R0FHbFRKZ3JC?=
 =?utf-8?B?OXY5YWR4UXFPT3lIRDhRTzNJclBUYnc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c5ee07-38e0-4809-d43a-08dc1b624e2b
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5556.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 15:53:41.3448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR01MB5759
Cc: mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH 7/8] arm64: dts: qcom: ipq5018: enable
	ethernet support
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

5ZyoIDIwMjQvMS8yMiAwOjQ1LCBBbmRyZXcgTHVubiDlhpnpgZM6Cj4gT24gU3VuLCBKYW4gMjEs
IDIwMjQgYXQgMDg6NDI6MzZQTSArMDgwMCwgWml5YW5nIEh1YW5nIHdyb3RlOgo+PiBTaWduZWQt
b2ZmLWJ5OiBaaXlhbmcgSHVhbmcgPGh6eWl0Y0BvdXRsb29rLmNvbT4KPj4gLS0tCj4+ICAgYXJj
aC9hcm02NC9ib290L2R0cy9xY29tL2lwcTUwMTguZHRzaSB8IDEyMCArKysrKysrKysrKysrKysr
KysrKysrKysrLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMTYgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9pcHE1
MDE4LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vaXBxNTAxOC5kdHNpCj4+IGluZGV4
IGU1MDJhM2VjZjRiNy4uYjM2ZTVjMjEzNmI3IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL3Fjb20vaXBxNTAxOC5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNv
bS9pcHE1MDE4LmR0c2kKPj4gQEAgLTk0LDYgKzk0LDYzIEBAIHNvYzogc29jQDAgewo+PiAgIAkJ
I3NpemUtY2VsbHMgPSA8MT47Cj4+ICAgCQlyYW5nZXMgPSA8MCAwIDAgMHhmZmZmZmZmZj47Cj4+
ICAgCj4+ICsJCW1kaW8wOiBtZGlvQDg4MDAwIHsKPj4gKwkJCSNhZGRyZXNzLWNlbGxzID0gPDE+
Owo+PiArCQkJI3NpemUtY2VsbHMgPSA8MD47Cj4+ICsJCQljb21wYXRpYmxlID0gInFjb20saXBx
NTAxOC1tZGlvIiwgInFjb20scWNhLW1kaW8iOwo+PiArCQkJcmVnID0gPDB4ODgwMDAgMHg2ND47
Cj4+ICsJCQlyZXNldHMgPSA8JmdjYyBHQ0NfR0VQSFlfTURDX1NXX0FSRVM+LAo+PiArCQkJCSA8
JmdjYyBHQ0NfR0VQSFlfRFNQX0hXX0FSRVM+Owo+IAo+IFdoYXQgZG8gdGhlc2UgdHdvIHJlc2V0
cyBkbz8gQW4gTURJTyBidXMgY29udHJvbGxlciBpcyB1bmxpa2VseSB0bwo+IGhhdmUgYSBEU1Ag
aW4gaXQuIFRoYXQgaXMgc29tZXRoaW5nIGEgUEhZIGlzIG1vcmUgbGlrZWx5IHRvIGhhdmUuIEFu
Cj4gTURJTyBidXMgY29udHJvbGxlciBkb2VzIGhhdmUgYW4gTURDIGxpbmUsIGJ1dCB3aHkgaXMg
aXQKPiBHQ0NfR0VQSFlfTURDX1NXX0FSRVMgbm90IEdDQ19NRElPX01EQ19TV19BUkVTPyBTbyB0
aGlzIGFnYWluIG1ha2VzIG1lCj4gdGhpbmsgdGhpcyBpcyBhIFBIWSByZXNldCwgc28gc2hvdWxk
IGJlIGluIHRoZSBQSFkgbm9kZS4KPiAKCklQUTUwMTggaGFzIHR3byBtZGlvIGJ1cy4gbWRpbzAg
aXMgYW4gaW50ZXJuYWwgYnVzIHdoaWNoIG9ubHkgY29ubmVjdHMgCnRvIGludGVybmFsIFBIWSB3
aGlsZSBtZGlvMSBpcyBvdXRnb2luZyBhbmQgY2FuIGJlIHVzZWQgdG8gY29ubmVjdCBQSFkgCm9y
IHN3aXRjaC4KClNvIEkgdGhvdWdodCBHQ0NfR0VQSFlfTURDX1NXX0FSRVMgaXMgZm9yIG1kaW8w
IGFuZCBHQ0NfTURJT19NRENfU1dfQVJFUyAKaXMgZm9yIG1kaW8xLgoKR0NDX0dFUEhZX0RTUF9I
V19BUkVTIGlzIHNlZW0gbGlrZSBQSFkgcmVzZXQuIEJ1dCBpZiB3ZSBkb24ndCBkZWFzc2VydCAK
aXQsIHRoZSBwaHkgbm9kZSBjYW4ndCBiZSBzY2FuZWQuIFNvIEkgYWRkIGl0IGhlcmUgbGlrZSB3
aGF0IHJlc2V0LWdwaW9zIApkbyAtIHRvIHJlc2V0IFBIWSBvciBzd2l0Y2guCgo+IEEgZGV2aWNl
IHRyZWUgYmluZGluZyB3aWxsIGhlbHAgc29ydCB0aGlzIG91dC4KCkJhc2Ugb24gdGhlIGZ1bmN0
aW9ucyBJIGV4cGxhaW5lZCwgSSBjYW4ndCB3cml0ZSB0aGUgYWNjdXJhdGUgbmFtZXMgYW5kIApu
dW1iZXIgb2YgcmVzZXRzIGhlcmUuCgo+IAo+IAo+ICAgICAgQW5kcmV3Cj4gCj4gLS0tCj4gcHct
Ym90OiBjcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
