Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6C48393F8
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jan 2024 16:59:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2208EC6DD6D;
	Tue, 23 Jan 2024 15:59:22 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01olkn2074.outbound.protection.outlook.com [40.92.107.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53DC7C6DD6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jan 2024 15:59:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agNgPqcDFiiw/yX5j6G8Z9Rj5X43OCPatgS06yXuKYGebSxLSWcUt7SdZhl0E+oOQ8qIYqWL1Tt2RVVWlclHGgYEw8n0BG6Ju2PynsJRX1RLDGXIXLNP10quSThpTQPSwZkIxEWnCXqepljd842IOh4ndnI0sGd9gTjdLAWQqt0ut356oKcOnaKLALdlIcriNug/KOMSmSXwTEbqxFbWXV/hlgkSGKzTwlCHBeASzpC/FcTBCQLwXX211FGfXXBlgdxBW/40wmAVUGElOQ7BVR5f9mMWCjpsQUG1Ak/rWj+xjcBa4N16TdVcMBYCSY+ySawthrA98azO8+lUUYWoFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LQR2p0Ri0VFR2HWbWfrx/fjQaSf+EZG2/aQ/SHpexA=;
 b=jtRWQycDGvIkQi2qW4nMjITGMqmYQ5eebDc+tu4FYJAVzt67GiwfLDFyOuOMsZWZVoUwV3xjqLHKrOqT6+jy8F9r2nYEUeRgi0SuDXB71FtC0F7gBdATevZN8WXpF4b7LlIvnF4Xq5gK8qEuvR4mU7Vihl5YivQ+uPKmolOtJAZTYIACRB0AvFPpzpkJGa9tijHDQXA9k4TD6/JvvSnu7G0a2LZRYY/GhBkfG4/u1BIHF7KoGzL0DJ/04L5twG26Ewgo/8JclNH6qugBW9uXcJ4ZoqulrAEyjlE840YkvAE7w9jp4WrdmPYXSgKaqntyuUBfpVdzNsaey8Pgjl9OYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LQR2p0Ri0VFR2HWbWfrx/fjQaSf+EZG2/aQ/SHpexA=;
 b=XY5lowT8vQjivCkPprFAIOa9JMN+B9Xpig/Qgz5T4oHR58sD4sSlHpTk5NzAlIakRLk/UBKUrc/RNBWJ5yBreKEgqaza9eOTAoqnubX/t/w7ZC6BjJOTRQAu+YdQALVXWiWRj9Viqz72i/YIoF2oWX0kMMA5WvNtbarhrlJIpBrlnTOevNtsJK+lQk4H+sb1vpBEOUowAArD3/C9pGgPlX6P2otqTYgg9exqC/HmMRXej4RQPsATPR8CtvgSjLFAn7i8LCY5uAmMN4bTotMeOZoIhN3hHMNhkZRmZZofparwEQN9PEC3mVkYhIxOm+XEPv9Lj0cbXBFW3LT2e3HB5g==
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9) by TYZPR01MB6330.apcprd01.prod.exchangelabs.com
 (2603:1096:405:ae::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.36; Tue, 23 Jan
 2024 15:59:15 +0000
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::a639:b02c:5189:7140]) by TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::a639:b02c:5189:7140%7]) with mapi id 15.20.7202.031; Tue, 23 Jan 2024
 15:59:15 +0000
Message-ID: <TYZPR01MB555648886D03AB911224F6FAC9742@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Date: Tue, 23 Jan 2024 23:58:26 +0800
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB55568ACB534944D7DEB00C7AC9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
From: Ziyang Huang <hzyitc@outlook.com>
In-Reply-To: <TYZPR01MB55568ACB534944D7DEB00C7AC9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-TMN: [8lCv3zEj6h8yEKESM/B8CxmzyO8q/KbC]
X-ClientProxiedBy: TYCP286CA0343.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::11) To TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9)
X-Microsoft-Original-Message-ID: <4f3f8059-d280-46d2-a400-5bda4c654fd8@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5556:EE_|TYZPR01MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bcceb14-649c-41b3-f96f-08dc1c2c3fbe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tA9BmN88n/EUMJkbzif7uNu3qa7ON99vcr1LUJLoRNRf6D7DtqIzXpKB3CmWuRms1Ng4OzaR0w18Wc+ajw46VxWxZCWuz4oIM2CDxuUj/8hrO4JHXvpSH6LYlrAyuvvCMdqrAtL+zWL/1Kmv2EJBOj4ub3zhV1gWqLXEAe+pauoUr59XRkiYeOgQP1KJF+0sKYWp1/K8dfsDk/FjazMUQCvrLApZLh5197HprawPljrt9CIOCTWGwMvJ7WepVfgtgq8oQHGW2/YGPSnsvUJTOMQ/WhtwKWpBBio2twLAExbkeRXtBeAfOsCgo1GVOc3Sig9AHEFE0G53yxfIrehcloW7D9URDq8MnYJIX6rhyFHbF7jtuKKw/uAmFgkzTUhnCifXwTWQLwQXm61E4adwS3KgpAUWohU4euvAixXIYZM08MerB9bJxb21iHfpCKonTaAa/qAGPAQg7eKjPmjyeo8HSNpnsU1yNyelFmEw9sesZ9bL6S4KrfhQhFtuwK7HXkLsiSmEUyWlZ8aXpIsSUDMs6cy/u5qlXpeahYZ/tjVoPaeEqlNOFf5/4IvJgoEc
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3MvalNxd01uZzZpUU9pSk9DSjloOWc5bUFPbVozbUJ5MTZOM2JjQVVNZEFB?=
 =?utf-8?B?b2szMCtOWFFaVTMrZzI5bnY5NG5TZkNNdFpGYjBCa1NMS1dKeFNjaHRPeHdH?=
 =?utf-8?B?UnJSSTVtM241MVNhbWRLaktCdWF3cGZLRjRXSS9FRi9QMUVGSW5jTFM3R3R5?=
 =?utf-8?B?ZStDS2ZpQmhSc3V1VWRkbGVQaitjSVN3by9PNnVacXBvblpGcVptdGdWc2FE?=
 =?utf-8?B?SWF2QXhIR3BhVHVzZ24yd0xtQjUvTzkvWThyQUY4ZjAvL2ZNNVRKSVBrdENZ?=
 =?utf-8?B?NEJKNDF3NzVKRXRpMU55dFZDWlVBUzR3UzgwOUlRMGtyNERHay9hblBFU256?=
 =?utf-8?B?UG5YcTBsbWVqcVFMUG9oLzJSMm1zZ0h1Y25iSGFicWVhU2xnRmh6UzF6ZEpj?=
 =?utf-8?B?QW9acWpvWW9yRkwzaTdQVHlWSHJ6Y0xySUd5MlVpbyt0dng2RUEzeFc1YlNw?=
 =?utf-8?B?VWI3Qkg1QWJSV3ZNWk5sbDMrYmMxenM5YzZ4TVZHMTZhY3daSlNlc0pralJV?=
 =?utf-8?B?cGZROUxJV1ZKdytudXB0WXNodG0rRHJyb3dXWFBDeUs5MlFaUWVDUmY3N1l5?=
 =?utf-8?B?SlF1ZmZuVG9ZcmhrTUI5YWppRGpPTkc4R2s1akFJaFZzNlBmUU5DZ0NLL3Bq?=
 =?utf-8?B?cThsOTBsTXpoY3VEbjAwMmgrcklJTGh5dlIxZWN5YStOWFhmNzNISTJiOHN4?=
 =?utf-8?B?eW5JZUxVcnQvb1lxV2V5RVlPUi9IWmkvQjFrV0w2SWFKd1VucWthNFlIQjFw?=
 =?utf-8?B?cHhDVm8xTTh6WUVyQTFwSXNiSm5vMzR3b0NMVlMrRmFoVGxQUzhrVjA4cEVY?=
 =?utf-8?B?emlKZExCbm1ScXJKNzNuRW5GVDdJU2hUVWd2NHVSQU5pajVmdDZ0OEphTm5F?=
 =?utf-8?B?RCtCSVhOSGlxUXNLbGw1UUU4RFNoaEZiVVhYL2Rqb0FtelJpeklzSlcyV21l?=
 =?utf-8?B?WkZ1S2hmVzJvMTBFRlo1S3pCc3BjQUR3UmJVWUY2czdvZzVFVEJrc2lkYnZ4?=
 =?utf-8?B?MEpORUlaVEpLS3U3eWhKdmxiNlozcm9LNS9PdFlpb3dUVnpCVUowb3I3THI1?=
 =?utf-8?B?MVk3eVRDVmhjdHNQZ3ZCRm9IUG5pQUZUU2tvS1lwOVZsbnEwckhuOUtka0p2?=
 =?utf-8?B?dlphVWpKOW54aTh0bXgvdjV6cXhPOVVaZWVtb2hSNDJTNk82R0FYcmJCSGVz?=
 =?utf-8?B?ajVRRTVUSGdSWG9MRjFJak1CVmdlaUdwWGJtaURYandvc3J3TXB6QjBvS1dP?=
 =?utf-8?B?VDZqYzAydHRBbWpuQ0pIdmM5ZDhJL1J6RHNpVk1BRS9BMDJWeXJvdFoxZ1dD?=
 =?utf-8?B?VWlYMEN3Ynd5bDVoakNXNkdCOUxIZmdhaVVaR3BnRE1ob0I1Zy9kSjBFVW5C?=
 =?utf-8?B?cEMxclNrZVIvWk5nL2hSb3drT0ZkQmtOdmhQM1QyWW9ESEx2OEpnbUUrR0Q0?=
 =?utf-8?B?cHYxYktMY0R6WTVMYkJyQ29yMVYvUXpNdWlzSFdTbEM5ZmF4YUxhNFAyTXEv?=
 =?utf-8?B?eDBNVjhyNFR4d2t3OHZ1THcyV0dDSDRrUG5jczZveEtQemFSVlJrR1RSUm96?=
 =?utf-8?B?VXNaRWxqdnV6cEUzbFRBekx2ampveU90VlRSMkp4alRpc1V0RC9GZWYwcVhO?=
 =?utf-8?B?aXIxem1KSGJQa2FmcDMvY1dVMnBScnc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bcceb14-649c-41b3-f96f-08dc1c2c3fbe
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5556.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 15:59:15.4681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB6330
Cc: mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH 2/8] phy: Introduce Qualcomm ethernet
	uniphy driver
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

5ZyoIDIwMjQvMS8yMSAyMDo0MiwgWml5YW5nIEh1YW5nIOWGmemBkzoKPiArI2RlZmluZSBybXds
KGFkZHIsIG1hc2ssIHZhbCkgXAo+ICsJd3JpdGVsKCgocmVhZGwoYWRkcikgJiB+KG1hc2spKSB8
ICgodmFsKSAmIChtYXNrKSkpLCBhZGRyKQo+ICsKPiArc3RhdGljIGludCBjbW5faW5pdChzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICt7Cj4gKwlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsK
PiArCXZvaWQgX19pb21lbSAqY21uX2Jhc2U7Cj4gKwl2b2lkIF9faW9tZW0gKnRjc3JfYmFzZTsK
PiArCXUzMiB2YWw7Cj4gKwo+ICsJcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZShw
ZGV2LCBJT1JFU09VUkNFX01FTSwgImNtbiIpOwo+ICsJaWYgKCFyZXMpCj4gKwkJcmV0dXJuIDA7
Cj4gKwo+ICsJY21uX2Jhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoJnBkZXYtPmRldiwgcmVz
KTsKPiArCWlmIChJU19FUlJfT1JfTlVMTChjbW5fYmFzZSkpCj4gKwkJcmV0dXJuIFBUUl9FUlIo
Y21uX2Jhc2UpOwo+ICsKPiArCS8qIEZvciBJUFE1MHh4LCB0Y3NyIGlzIG5lY2Vzc2FyeSB0byBl
bmFibGUgY21uIGJsb2NrICovCj4gKwlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1l
KHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAidGNzciIpOwo+ICsJaWYgKHJlcykgewo+ICsJCXRjc3Jf
YmFzZSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCByZXMpOwo+ICsJCWlmIChJ
U19FUlJfT1JfTlVMTCh0Y3NyX2Jhc2UpKQo+ICsJCQlyZXR1cm4gUFRSX0VSUih0Y3NyX2Jhc2Up
Owo+ICsKPiArCQlybXdsKCh0Y3NyX2Jhc2UgKyBUQ1NSX0VUSF9DTU4pLCBUQ1NSX0VUSF9DTU5f
RU5BQkxFLAo+ICsJCSAgICAgVENTUl9FVEhfQ01OX0VOQUJMRSk7Cj4gKwl9Cj4gKwo+ICsJcm13
bCgoY21uX2Jhc2UgKyBDTU5fUExMX1JFRkNMS19TUkMpLAo+ICsJICAgICBDTU5fUExMX1JFRkNM
S19TUkNfRlJPTV9NQVNLLAo+ICsJICAgICBDTU5fUExMX1JFRkNMS19TUkNfRlJPTV9SRUcpOwo+
ICsJcm13bCgoY21uX2Jhc2UgKyBDTU5fUExMX1JFRkNMSyksCj4gKwkgICAgIChDTU5fUExMX1JF
RkNMS19FWFRFUk5BTCB8IENNTl9QTExfUkVGQ0xLX0ZSRVFfTUFTSwo+ICsJICAgICAgfCBDTU5f
UExMX1JFRkNMS19ESVZfTUFTSyksCj4gKwkgICAgIChDTU5fUExMX1JFRkNMS19GUkVRXzQ4TSB8
IENNTl9QTExfUkVGQ0xLX0RJVigyKSkpOwo+ICsKPiArCXJtd2woKGNtbl9iYXNlICsgQ01OX1BM
TF9DVFJMKSwgQ01OX1BMTF9DVFJMX1JTVF9OLCAwKTsKPiArCW1zbGVlcCgxKTsKPiArCXJtd2wo
KGNtbl9iYXNlICsgQ01OX1BMTF9DVFJMKSwgQ01OX1BMTF9DVFJMX1JTVF9OLAo+ICsJICAgICBD
TU5fUExMX0NUUkxfUlNUX04pOwo+ICsJbXNsZWVwKDEpOwo+ICsKPiArCXJldHVybiByZWFkX3Bv
bGxfdGltZW91dChyZWFkbCwgdmFsLAo+ICsJCQkJICh2YWwgJiBDTU5fUExMX1NUQVRVU19MT0NL
RUQpLAo+ICsJCQkJIDEwMCwgMjAwMDAwLCBmYWxzZSwKPiArCQkJCSAoY21uX2Jhc2UgKyBDTU5f
UExMX1NUQVRVUykpOwo+ICt9Cj4gKwoKSGkgQW5kcmV3LAoKU29ycnkgdG8gYm90aGVyIHlvdS4g
QnV0IEkgY2FuJ3QgbWFrZSBhIGRlY2lzaW9uIGhlcmUuCgpUaGUgQ01OIGJsb2NrIChTZWVtIGxp
a2UgdGhlIEFiYnJldmlhdGlvbiBvZiAiY29tcG9uZW50IikgY29udHJvbHMgdGhlIAplbnRpcmUg
bmV0d29yayBibG9jay4gSXQgbmVlZCB0byBiZSBjb25maWd1cmVkIGJlZm9yZSB1bmlwaHksIG1k
aW8sIApnbWFjLCBldGMuLiBJbiB0aGUgcGFzdCwgUXVhbGNvbW0gcHV0IGl0IGluIG1kaW8gZHJp
dmVyLiBCdXQgVU5JUEhZIG5lZWQgCnRvIGJlZW4gaW5pdGlhbGl6YXRlZCBiZWZvcmUgbWRpbyBi
ZWNhdXNlIHNvbWUgUEhZcy9zd2l0Y2hzIHVzZSB0aGUgCm91dGNsayBwcm92aWRlZCBieSBVTklQ
SFkgYXMgdGhlaXIgbWFpbiBjbG9ja3MuCgpTbyBpdCBzZWVtIGxpa2UgdGhhdCBpdCBzaG91bGQg
YmUgZGVzY3JpYmVkIGluIGEgc2VwYXJhdGUgbm9kZS4gQnV0IEkgCmNvdWxkbid0IGZpbmQgYSBz
dWl0YWJsZSBkcml2ZXIgZGlyZWN0b3J5IGZvciBpdC4gQ2FuIHlvdSBwbGVhc2UgZ2l2ZSBtZSAK
c29tZSBzdWdnZXN0aW9ucz8gVGhhbmtzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
