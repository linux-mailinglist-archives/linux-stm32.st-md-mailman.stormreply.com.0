Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 074066A3B9C
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Feb 2023 08:17:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADCC2C6A5EB;
	Mon, 27 Feb 2023 07:17:23 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2054.outbound.protection.outlook.com [40.107.20.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45D19C65E59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Feb 2023 07:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EX7g+8Q+opkPi985X422oUzP3oRc9meQ3clixVTVL90=;
 b=kdUxYGRFbdFRwmCJnnvRXGI85SQg1B6zhK9fdmZw/5NOZqc4szIY1ZFIIXNBTb7//KiN1t/9gbcGsipqhRKyhzY7rqnkizrb7eN/qxmkGRgoaobww4uZFoy4u0J9pW+MrCG4Y19GaGHLf2xG/6jrHnuZWDqGcnYtnEwH6TMI0D0=
Received: from DB6PR0601CA0013.eurprd06.prod.outlook.com (2603:10a6:4:7b::23)
 by GV2PR08MB8509.eurprd08.prod.outlook.com (2603:10a6:150:b1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 07:26:04 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::87) by DB6PR0601CA0013.outlook.office365.com
 (2603:10a6:4:7b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21 via Frontend
 Transport; Thu, 23 Feb 2023 07:26:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21 via Frontend Transport; Thu, 23 Feb 2023 07:26:03 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Thu, 23 Feb 2023 07:26:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0f74d8ddadf09ab7
X-CR-MTA-TID: 64aa7808
Received: from 8f7f82261504.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1F58E066-7C6D-4FCA-A427-C46C43E4D7B0.1; 
 Thu, 23 Feb 2023 07:25:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f7f82261504.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Feb 2023 07:25:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyjo1f8aFDPIvB5yCxeQGlIy3wPtPUK6eCOkv3t/KS/l/T4lMMK+8MuOS2ULN4qIcfuWQuhIwkqjRftIjhb3czgfP8ncoKLPVx5dwjsFKmXd1kUqhpKMnx0JM3U8PQPa4uL2NebdiLlE4gK90BeFRZ9r7P5mYioldlQ4yXOwEhMo0gSDt3+IxQ7mStkkYmOFSFy/2tTxaR6GY0fsugfbNA6sIri3Dj17zXHITT2el3gqmEH8FGyaDwcR5XDuc4hXdlSLi4K5QYnd+UXCWMjVBW7CePoTjlb7EWI+1utaMGvDIyjPKsQy/h6h5pgQF5o5X2zK/fv/XzYkWMldL/SXVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EX7g+8Q+opkPi985X422oUzP3oRc9meQ3clixVTVL90=;
 b=nQm4/VB5wH9UV77jBfySgeW7BBNIjsRNNUnntddOoWy2pH9i9cadcJL3RRcIOD33/uFVAveb7Cl9doR4XdE6JeleJO8mqYvxnKzqOls2Ks4HqkAlDvoL3WnaztQHaOUclWIpKVhWnTX8MCreTzEBORkLLBQY7JHN66h01ruvqdCEw7hnaXz138W6pekAwyHZ6pAFDUJ8RC2K6NaYlkeuS90K4UjQZXV7s6qj2VJJHeZWXxBR2xZ/pEUj4xKhSUKMXY49djRYUD8wunSBhTyoJP4jQ+FnRwY8ApVzPjzRe9nedxM8E45RIQPW3aK1/ZkWd+55yxZr1jh7CateAbhQag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EX7g+8Q+opkPi985X422oUzP3oRc9meQ3clixVTVL90=;
 b=kdUxYGRFbdFRwmCJnnvRXGI85SQg1B6zhK9fdmZw/5NOZqc4szIY1ZFIIXNBTb7//KiN1t/9gbcGsipqhRKyhzY7rqnkizrb7eN/qxmkGRgoaobww4uZFoy4u0J9pW+MrCG4Y19GaGHLf2xG/6jrHnuZWDqGcnYtnEwH6TMI0D0=
Received: from DB9PR08MB7512.eurprd08.prod.outlook.com (2603:10a6:10:303::14)
 by AS2PR08MB9427.eurprd08.prod.outlook.com (2603:10a6:20b:5e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Thu, 23 Feb
 2023 07:25:49 +0000
Received: from DB9PR08MB7512.eurprd08.prod.outlook.com
 ([fe80::8b0a:5651:f5ae:de6a]) by DB9PR08MB7512.eurprd08.prod.outlook.com
 ([fe80::8b0a:5651:f5ae:de6a%4]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 07:25:48 +0000
From: Al Grant <Al.Grant@arm.com>
To: Jinlong Mao <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, Suzuki Poulose <Suzuki.Poulose@arm.com>
Thread-Topic: [RFC] Add trig_ts function in STM to generate TRIG_TS packet
 periodically
Thread-Index: AQHZRcFPZDAyubvjzEa96AtmkpHdCq7azjwAgAAWNACAATO2gIAAA5Gg
Date: Thu, 23 Feb 2023 07:25:47 +0000
Message-ID: <DB9PR08MB7512186594196C032C8CB57986AB9@DB9PR08MB7512.eurprd08.prod.outlook.com>
References: <1dab6648-c177-17a7-0b36-821e21328753@quicinc.com>
 <bf14c6e2-71c4-2987-28c7-e8b51636a46f@arm.com>
 <CAJ9a7Vjyc-T+LjHtBBYO2MS15z1sVUYxQro_5YpZ9oGMiB0GZA@mail.gmail.com>
 <dad2f816-34b5-80d9-ad78-14d759ac45eb@quicinc.com>
In-Reply-To: <dad2f816-34b5-80d9-ad78-14d759ac45eb@quicinc.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DB9PR08MB7512:EE_|AS2PR08MB9427:EE_|DBAEUR03FT043:EE_|GV2PR08MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f54bfa0-ab99-483e-cc2f-08db156f38a2
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Dar4DapOENMORDtv5z4FtMrAe6bIvWlwHteF+Uv3s4vKUh+tzV+Vz0j+Wf5PVn7xhhOxXYBCejdzhIXctzeqr1vnWhEhFxSZtIYrjZJGcfupCtTDgRsBB80he1ohlMs2wABgCyhDZk7bl+KtGI/mZ2vlW5obI0pD5fXf+RuRxovoak6yAU78ikNr62l3uw1GThMB0XtfH9oAdxv+Tw2tbva3lmNmXAoY9LAZztl6e70IIXba1g04d4yaqRpYhB6kgaY4hSQAd3nrdYSb4rtA7QpuiaMUMoR0HXtR3mnlDLyxV7tySx6B4q8/K0yZT9kcoyu+JizPceaxeOU8UQfTUFv4XhQk4VyF95IdG++HsTZKaNOk1pC/HKbnaYbOyFfNGOpMBbgsuspeitxG3RbqXhF6imSNooVLqICJ/wxRCUX03C9IS3Cl02RdvwB7CAcZ2FSvqmHkkZ31Vvs5W1caxAbXaF7g3upQAsS1WJA2TAQv6nzSPolWmNmuwVjaz+56103qzK27CamVPaUTc85f66nJPQWiCBf9IX5mqGk8VasKNHDT6vasHZS72hRv3lKp1/MAQ81vYNi4CBLsdJO9gaQw2udP6BkRkh8clG3sDhB64tiGFlPwC+usNJZv6TW+ZpRHmTslYerwVLpDcuotLfurGpM8Jv9iS6snLzRTxuJayn7M8mIlEqTzIZmDHpp2Me+DHxUdhctxVWLiebiezg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB9PR08MB7512.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199018)(8936002)(66446008)(8676002)(66476007)(66946007)(66556008)(64756008)(52536014)(5660300002)(76116006)(4326008)(316002)(6636002)(54906003)(66899018)(71200400001)(478600001)(110136005)(7696005)(26005)(6506007)(9686003)(53546011)(186003)(41300700001)(2906002)(33656002)(122000001)(55016003)(86362001)(83380400001)(38070700005)(38100700002);
 DIR:OUT; SFP:1101; 
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9427
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f58e0a9e-272c-46e7-1663-08db156f2ef8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ub7JCWSH27VJ4gLqDJ82+um5Cp1OZ9x39hGCBla/ZmJE0tCKQAIg0MEKrsP1DVdLPt/MGngL9urs/ikKXsoNUt3KrVyOadvrYc5Ajb3y0PXOQq4ws3Yw+eUyVzKRpEq9xToYLyXUdpPDG+qqTXfdt4DfCJetuNHH7HTZ8Pf5W93zq+c+aW0mDYMn0w6oQP242Ebm2RdRvB49DKTJGT2LZIWI1/N31axouAatZXspyN/bb3R/jNlQRLwcKImSxZG6bWSoWqJ/nlR4QFET+DKbTFECFRTwe50nYKjA0R20/EoaVvSOusLUkUtEntfM/fk8zGSSkniSjKy6mtGHyo9Bk14pwHiCpCiSRSncDssY5PpAyjHkOHvDUWj+j881rPWnyL+6o9eZOkxK9oImRja5yfxPelxe0619GQjF2t6Rh4Ve2HvaMf3DpWtAK0JRWWwTNvGbpi0G/V389id8NVLWbLfApc3dcEwKsVFJN4CfpDSqE3RBrz0N/RiFlBVdwC4VOWW186b/Gd5TCwxgUIxvOH81Iq0Zdzhf2CUk+kQj/LRWTm15wYFHOYzhItt3k6n0EUD1C2LGCnDSU7nHrVXenWzFWnCbSim8IS+M6O6BhN7T7ggofyw+XYSnIaom/3cOWKN80ntPCvmfZx+NZ73o/UGeL56Kui3FB/019bCmkfydLmb5RVJKgyp8kANkmXXOo2ufInGVLC2VJfAdJMBLew==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199018)(36840700001)(40470700004)(46966006)(316002)(83380400001)(6636002)(110136005)(47076005)(54906003)(478600001)(81166007)(82740400003)(2906002)(82310400005)(86362001)(356005)(40460700003)(70206006)(33656002)(70586007)(4326008)(8676002)(55016003)(8936002)(41300700001)(52536014)(40480700001)(5660300002)(36860700001)(26005)(7696005)(186003)(66899018)(6506007)(53546011)(107886003)(9686003)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 07:26:03.8647 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f54bfa0-ab99-483e-cc2f-08db156f38a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8509
X-Mailman-Approved-At: Mon, 27 Feb 2023 07:17:23 +0000
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>
Subject: Re: [Linux-stm32] [RFC] Add trig_ts function in STM to generate
 TRIG_TS packet periodically
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

PiBGcm9tOiBKaW5sb25nIE1hbyA8cXVpY19qaW5sbWFvQHF1aWNpbmMuY29tPg0KPiBTZW50OiAy
MyBGZWJydWFyeSAyMDIzIDA2OjQxDQo+IE9uIDIvMjIvMjAyMyA4OjE5IFBNLCBNaWtlIExlYWNo
IHdyb3RlOg0KPiA+IEhpDQo+ID4NCj4gPiBBIGNvdXBsZSBhZGRpdGlvbmFsIHBvaW50cy4uLg0K
PiA+DQo+ID4gT24gV2VkLCAyMiBGZWIgMjAyMyBhdCAxMTowMCwgU3V6dWtpIEsgUG91bG9zZSA8
c3V6dWtpLnBvdWxvc2VAYXJtLmNvbT4NCj4gd3JvdGU6DQo+ID4+IE9uIDIxLzAyLzIwMjMgMDY6
NTMsIEppbmxvbmcgTWFvIHdyb3RlOg0KPiA+Pj4gSGkgYWxsLA0KPiA+Pj4NCj4gPj4+IFdoZW4g
dGhlcmUgaXMgc29tZSBzbWFsbCBwYWNrZXQgc2VudCBmcm9tIFNUTSB0byBFVFIsIHRoZSBzbWFs
bA0KPiA+Pj4gcGFja2V0IGNvdWxkIGJlIHN0dWNrIGJldHdlZW4gc291cmNlIGFuZCBzaW5rIGV2
ZW4gaWYgbWFudWFsIGZsdXNoDQo+ID4+PiBpcyBzZXQgd2hlbiBkaXNhYmxlIEVUUi4NCj4gPj4g
V2h5ID8gVGhlIG1hbnVhbCBmbHVzaCBzaG91bGQgdHJpZ2dlciBhIGZsdXNoIHJlcXVlc3QgdXBz
dHJlYW0gYW5kDQo+ID4+IGV2ZW50dWFsbHkgY2F1c2UgYSBmbHVzaCA/IElmIHRoaXMgZG9lc24n
dCB3b3JrIGFzIGV4cGVjdGVkIHdlIHNob3VsZA0KPiA+PiB0cnkgdG8gZ2V0IHRvIHRoZSBib3R0
b20gb2YgdGhhdCBmaXJzdCwgYmVmb3JlIGp1bXBpbmcgaW50byAic29mdHdhcmUNCj4gPj4gd29y
ayBhcm91bmRzIi4NCj4gPj4NCj4gPj4+IFNvIHRoZXJlIGlzIHJlcXVpcmVtZW50IHRoYXQgZmx1
c2ggdGhlIFNUTSB0cmFjZSBwZXJpb2RpY2FsbHkgYWZ0ZXINCj4gPj4+IGVuYWJsaW5nIFNUTSB0
byBFVFIuDQo+ID4+Pg0KPiA+Pj4gU1RNIGNhbiBnZW5lcmF0ZSBUUklHX1RTIHBhY2tldCBieSB3
cml0aW5nIHRvIG9mZnNldCAweEYwIG9mIHRoZQ0KPiA+Pj4gZHJpdmVyIFNUTSBzdGltdWx1cyBw
b3J0Lg0KPiA+Pj4gRVRSIGhhcyBhYmlsaXR5IHRvIGluaXRpYXRlIGEgZmx1c2ggb24gc2VlaW5n
IGEgVFJJR19UUyBwYWNrZXQuDQo+ID4+IFdoeSBpcyB0aGlzIGRpZmZlcmVudCBmcm9tIHRoZSAi
bWFudWFsIGZsdXNoIiBhbmQgaG93IGRvZXMgaXQgaGVscCA/DQo+ID4+IElzIGl0IGJlY2F1c2Ug
b25lIG9mIHRoZSBjb21wb25lbnRzIGRvZXNuJ3QgcmVzcG9uZCBwcm9wZXJseSB0byB0aGUNCj4g
Pj4gZmx1c2ggcmVxdWVzdCA/DQo+ID4+DQo+ID4+DQo+ID4+IEtpbmQgcmVnYXJkcw0KPiA+PiBT
dXp1a2kNCj4gPj4NCj4gPj4+IEZvciB0aGlzIHJlcXVpcmVtZW50LCBJIHdhbnQgdG8gY3JlYXRl
IGEgc3lzZnMgbm9kZSBsaWtlIHRyaWdfdHMgZm9yIFNUTS4NCj4gPj4+IFdoZW4gd3JpdGluZyAx
IHRvIHRoaXMgc3lzZnMgbm9kZSwgYSB0aW1lciB3aXRoIDEgc2Vjb25kIHBlcmlvZGljaXR5DQo+
ID4+PiBpbiBTVE0gd2lsbCBzdGFydCB0byBnZW5lcmF0ZSB0aGUgdHJpZ190cyBwYWNrZXQgdG8g
RVRSLg0KPiA+IElmIHRoaXMgaXMgcmVhbGx5IG5lZWRlZCwgdGhlbiB0aGUgc291cmNlIHdyaXRp
bmcgdGhlIGRhdGEgeW91IHdpc2ggdG8NCj4gPiBmbHVzaCBzaG91bGQgd3JpdGUgdG8gdGhlIHJl
bGV2YW50IFNUTSBzdGltdWx1cyBwb3J0LiBUaGVyZSBpcyBubw0KPiA+IGp1c3RpZmljYXRpb24g
Zm9yIGEgcG9sbGluZyBtZWNoYW5pc20gd2hlbiB0aGUgY2xpZW50IGl0c2VsZiBjYW4gZG8NCj4g
PiB0aGUgd3JpdGUgYXQgYSAgdGltZSB5b3UgYmVsaWV2ZSBpdCB0byBiZSBuZWVkZWQuDQo+ID4N
Cj4gPj4+IE9uY2UgRVRSIHJlY2VpdmUgdGhlIFRSSUdfVFMgcGFja2V0LCBpdCB3aWxsIGluaXRp
YXRlIGEgZmx1c2guDQo+ID4gVGhlIEVUUiBkb2VzIG5vdCBpbnRlcnByZXQgU1RNIHBhY2tldHMg
LSB0aGlzIGFsb25lIHdpbGwgbm90IGluaXRpYXRlIGEgZmx1c2guDQo+ID4NCj4gPiBJdCBpcyBw
b3NzaWJsZSB0byBwcm9ncmFtIHRoZSBFVFIgdG8gcmVzcG9uZCB0byB0aGUgRkxVU0hJTiBvciBU
UklHSU4NCj4gPiBzaWduYWxzIHZpYSB0aGUgRUNUL0NUSSBuZXR3b3JrIG9mIHNpZ25hbHMsIG9y
IGEgdHJpZ2dlciBldmVudCBpbiB0aGUNCj4gPiB0cmFjZSBzdHJlYW0gKEFUSUQ9MHg3RCkgaWYg
YSBzb3VyY2UgKGluIHRoaXMgY2FzZSB0aGUgU1RNKSBpcw0KPiA+IHByb2dyYW1tZWQgdG8gb3V0
cHV0IHRoZXNlIHNwZWNpZmljIHBhY2tldHMgd2hlbiBpdCBnZW5lcmF0ZXMgdHJpZ2dlcg0KPiA+
IHBhY2tldHMgaW4gaXRzIG93biBwcm90b2NvbC4NCj4gPiBQcm9ncmFtbWluZyBiaXRzIGluIHRo
ZSBGRkNSIGNvbnRyb2wgdGhlc2Ugb3BlcmF0aW9ucywgU1RNIG11c3QgYmUNCj4gPiBwcm9ncmFt
bWVkIHNlcGFyYXRlbHkgdG8gZ2VuZXJhdGUgYXBwcm9wcmlhdGUgb3V0cHV0IHJlc3BvbnNlcyBv
bg0KPiA+IHRyaWdnZXIgcGFja2V0cy4NCj4gPg0KPiA+IFJlZ2FyZHMNCj4gPg0KPiA+IE1pa2UN
Cj4gDQo+IEhpIFN1enVraSAmIE1pa2UsDQo+IA0KPiBUaGVyZSBpcyBVU0IgY2FzZSBzdXBwb3J0
IGluIG91ciBpbnRlcm5hbCBkZXZpY2UuDQo+IERhdGEgcGF0aCBpcyB0aGF0wqAgU1RNIGRhdGEg
LS0tPiBFVFIgLS0tLS0+IFVTQiAtLS0tPiBQQyB0b29sLg0KPiANCj4gT24gUEMgdG9vbCwgaXQg
Y2FuIHNob3cgdGhlIGxvZ3MgZnJvbSBFVFIgaW4gcmVhbCB0aW1lLg0KPiANCj4gV2hlbiBvbmUg
c21hbGwgcGFja2V0IHNlbmQgZnJvbSBTVE0gdG8gRVRSLCBpdCBjYW4gYmUgc3R1Y2sgYmV0d2Vl
biBTVE0gYW5kDQo+IEVUUi4NCj4gV2hlbiB0aGUgcGFja2V0IHN0dWNrIGhhcHBlbnMsIGl0IHdp
bGwgYmUgZmx1c2hlZCB0byBFVFIgb25seSB3aGVuIHNvbWUgb3RoZXINCj4gcGFja2V0cyBnZW5l
cmF0ZWQgZnJvbSBTVE0gc291cmNlIG9yIENUSSBmbHVzaCBjb21tYW5kcyBhcmUgc2VudC4gSWYg
dGhlIHRpbWUNCj4gaXMgdG9vIGxvbmcgdG8gd2FpdCBmb3IgbmV4dCBwYWNrZXRzIGNvbWluZywg
dXNlciB3aWxsIGNvbnNpZGVyIHRoYXQgaXNzdWUgaGFwcGVucw0KPiB3aXRoIHByZXZpb3VzIHNt
YWxsIHBhY2tldC4NCj4gQW5kIHVzZXIncyByZXF1aXJlbWVudCBpcyB0aGF0IHBhY2tldCBmcm9t
IFNUTSBjYW4gYmUgZmx1c2hlZCB0byBFVFINCj4gYXV0b21hdGljYWxseSBpbnN0ZWFkIG9mIHNl
bmRpbmcgY29tbWFuZHMgbWFudWFsbHkuDQoNClRoZSBwb2ludCBvZiBpbml0aWF0aW5nIGFuIEFU
QiBmbHVzaCBmcm9tIHRoZSBFVFIgaXMgdG8gZmx1c2gNCm91dCBwYWNrZXRzIGJldHdlZW4gdXBz
dHJlYW0gdHJhY2Ugc291cmNlcyBhbmQgdGhlIEVUUi4NClRoZSBFVFIgdGVsbHMgdXBzdHJlYW0g
c291cmNlcyB0byBmbHVzaCBvdXQgdGhlaXIgZGF0YSBhbmQNCmFja25vd2xlZGdlIHdoZW4gY29t
cGxldGUgYW5kIHRoaXMgcmVxdWVzdCBpcyBwYXNzZWQgdXB3YXJkcw0KdG8gYWxsIHRyYWNlIHNv
dXJjZXMuIEluIGVmZmVjdCB0aGUgRVRSIGlzICJwdWxsaW5nIiBkYXRhIGZyb20NCmFsbCBpdHMg
c291cmNlcy4gVGhlIG1lY2hhbmlzbSBpcyB0aGUgc2FtZSB3aGV0aGVyIGl0IGlzDQppbml0aWF0
ZWQgbWFudWFsbHkgKGJ5IHdyaXRpbmcgRkZDUikgb3IgaW4gcmVzcG9uc2UgdG8gYSB0cmlnZ2Vy
DQpvbiB0aGUgQVRCIHN0cmVhbS4gSWYgaXQncyBub3Qgd29ya2luZyAoZS5nLiBiZWNhdXNlIHNv
bWUNCmRldmljZSBiZXR3ZWVuIHRoZSBTVE0gYW5kIEVUUiBpcyBub3QgcGFzc2luZyBvbiB0aGUN
CmZsdXNoIHJlcXVlc3QgZHVlIHRvIGEgaGFyZHdhcmUgaXNzdWUpLCBpdCBkb2Vzbid0IG1hdHRl
cg0KaG93IHlvdSBpbml0aWF0ZSBpdCBhdCB0aGUgRVRSLiBTbyBpZiBhIG1hbnVhbCBmbHVzaCBk
b2Vzbid0DQp3b3JrIHRoZW4gaXQncyBub3QgZ29pbmcgdG8gd29yayBpZiB0aGUgZmx1c2ggaXMg
aW4gcmVzcG9uc2UNCnRvIGFuIEFUQiB0cmlnZ2VyLg0KDQpNYXliZSB5b3UgYXJlIHNpbXBseSBz
ZWVpbmcgdGhlIGVmZmVjdCBvZiBzZW5kaW5nIG1vcmUNCmRhdGEgZnJvbSB0aGUgU1RNLCB0aGF0
IGJ1bXBzIG91dCB3aGF0ZXZlciBpcyBhaGVhZCBvZiBpdD8NClNvIHlvdSBjb3VsZCBhY2hpZXZl
IHRoZSBzYW1lIGVmZmVjdCBieSBzZW5kaW5nIG91dCBhbnkNCmtpbmQgb2YgZGF0YSBmcm9tIHRo
ZSBTVE0gZS5nLiBhIHBhZGRpbmcgcGFja2V0Lg0KDQo+IElzIGl0IGFwcHJvcHJpYXRlIHRvIGFk
ZCBhIHN5c2ZzIG5vZGUgZm9yIFNUTSB0byBnZW5lcmF0ZSB0aGUgdHJpZ2dlciBwYWNrZXQNCj4g
cGVyaW9kaWNhbGx5IGZvciBzdWNoIGNhc2UgPw0KDQpJdCBzZWVtcyB0byBiZSBzb2x2aW5nIHRo
ZSBwcm9ibGVtIGF0IHRoZSB3cm9uZyBwbGFjZS4NCklmIGl0J3MgdXNlZnVsIGZvciB0aGUgRVRS
IHRvIGRvIGEgcGVyaW9kaWMgQVRCIGZsdXNoLCB0aGVuIHRoYXQNCndvdWxkIGJlIGJldHRlciBk
b25lIGJ5IHRoZSBrZXJuZWwgcGVyaW9kaWNhbGx5IGluaXRpYXRpbmcNCnRoZSBmbHVzaCBtYW51
YWxseSBhdCB0aGUgRVRSLCBub3QgYnkgcGVyaW9kaWNhbGx5IHRlbGxpbmcNCm9uZSBwYXJ0aWN1
bGFyIHRyYWNlIHNvdXJjZSAob3V0IG9mIG1hbnkpIHRvIHNlbmQgYSB0cmlnZ2VyLg0KDQpJZiBB
VEIgZmx1c2ggaXMgYnJva2VuLCB0aGVuIGEgd29ya2Fyb3VuZCB3b3VsZCBiZSB0bw0KaGF2ZSBl
YWNoIHRyYWNlIHNvdXJjZSBwZXJpb2RpY2FsbHkgc2VuZCBhIG51bGwgcGFja2V0IG9mDQpzb21l
IGtpbmQgLSBidXQgaW4gdGhhdCBjYXNlIGl0IHRoZXJlIGlzIG5vdGhpbmcgc3BlY2lhbA0KYWJv
dXQgdHJpZ2dlcnMsIHRoZXkgY291bGQgYmUgYW55IGtpbmQgb2YgcGFkZGluZywgYW5kIGZvcg0K
U1RNIHlvdSBtaWdodCBiZSBhYmxlIHRvIGdlbmVyYXRlIHRoYXQgYnkgc3RpbXVsdXMuDQoNCkFs
DQoNCg0KPiANCj4gDQo+IFRoYW5rcw0KPiBKaW5sb25nIE1hbw0KPiANCj4gDQo+ID4NCj4gPj4+
IENvdWxkIHlvdSBwbGVhc2UgaGVscCB0byBwcm92aWRlIHlvdXIgY29tbWVudHMgb24gdGhpcyBy
ZXF1aXJlbWVudCA/DQo+ID4+Pg0KPiA+Pj4gVGhhbmtzDQo+ID4+PiBKaW5sb25nIE1hbw0KPiA+
Pj4NCj4gPg0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KPiBDb3JlU2lnaHQgbWFpbGluZyBsaXN0IC0tIGNvcmVzaWdodEBsaXN0cy5saW5hcm8ub3Jn
DQo+IFRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gY29yZXNpZ2h0LWxlYXZlQGxpc3Rz
LmxpbmFyby5vcmcNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
