Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF175947F
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2019 08:59:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5226CC1634B;
	Fri, 28 Jun 2019 06:59:28 +0000 (UTC)
Received: from esa5.microchip.iphmx.com (esa5.microchip.iphmx.com
 [216.71.150.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20601C16333
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2019 13:31:45 +0000 (UTC)
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Eugen.Hristev@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Eugen.Hristev@microchip.com";
 x-sender="Eugen.Hristev@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Eugen.Hristev@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="37590056"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jun 2019 06:31:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 27 Jun 2019 06:31:40 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 27 Jun 2019 06:31:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvkkDxd7qua1jKxbqrbV5M/smHOB7b/4ya5cpeUvVJc=;
 b=Z7dFU7HL32HK4PfMOB21N4rRyPfAAjnP6ulSpv8SVeGJ3AKoghtTjsC89FBfl5WpFSzZa3+tZx4vw6KuMVQZgJG1iEu/wHbfshPn5+/amF3evEsNrDE2nZhEF4CCYaD7T8DoVururtixArya2FqS1R1o/H/X9vnMVlTwW4ik594=
Received: from DM5PR11MB1242.namprd11.prod.outlook.com (10.168.108.8) by
 DM5PR11MB1291.namprd11.prod.outlook.com (10.168.108.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 27 Jun 2019 13:31:39 +0000
Received: from DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322]) by DM5PR11MB1242.namprd11.prod.outlook.com
 ([fe80::6476:ace0:bf3a:322%9]) with mapi id 15.20.2008.018; Thu, 27 Jun 2019
 13:31:39 +0000
From: <Eugen.Hristev@microchip.com>
To: <alexandre.belloni@bootlin.com>, <wsa@the-dreams.de>
Thread-Topic: I2C filtering (was Re: [PATCH v2 6/9] dt-bindings: i2c: at91:
 add binding for enable-ana-filt)
Thread-Index: AQHVKzw4jzAkF3hUn0CaRzOhl90Jh6avgCEAgAABogA=
Date: Thu, 27 Jun 2019 13:31:39 +0000
Message-ID: <eb2d87b7-437c-53ee-a1ca-37c4d3fadea6@microchip.com>
References: <1561449642-26956-1-git-send-email-eugen.hristev@microchip.com>
 <1561449642-26956-7-git-send-email-eugen.hristev@microchip.com>
 <4e81d3c9-25f3-ca6e-f2d5-17fad5905bb8@axentia.se>
 <84628b5e-bea7-7d91-f790-f3a2650040fa@microchip.com>
 <20190625093156.GF5690@piout.net> <20190625095533.GC1688@kunai>
 <20190627132200.GK3692@piout.net>
In-Reply-To: <20190627132200.GK3692@piout.net>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0102.eurprd09.prod.outlook.com
 (2603:10a6:803:78::25) To DM5PR11MB1242.namprd11.prod.outlook.com
 (2603:10b6:3:14::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190627162750239
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e86efaf9-7aeb-4ede-285f-08d6fb03c8bc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR11MB1291; 
x-ms-traffictypediagnostic: DM5PR11MB1291:
x-microsoft-antispam-prvs: <DM5PR11MB12912B60821954FD8EABBAD5E8FD0@DM5PR11MB1291.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(346002)(136003)(39860400002)(396003)(199004)(189003)(53936002)(66446008)(66946007)(73956011)(2906002)(14444005)(256004)(305945005)(81166006)(478600001)(66476007)(64756008)(66556008)(6512007)(66066001)(476003)(486006)(186003)(36756003)(81156014)(14454004)(2616005)(229853002)(8676002)(11346002)(446003)(3846002)(72206003)(6116002)(7736002)(31696002)(102836004)(26005)(8936002)(6486002)(54906003)(110136005)(6506007)(53546011)(386003)(7416002)(6246003)(5660300002)(76176011)(99286004)(68736007)(86362001)(52116002)(31686004)(6436002)(25786009)(71200400001)(71190400001)(316002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR11MB1291;
 H:DM5PR11MB1242.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2LE75PUXJdyykuNYTbjJAMwX6uENZmVBD7cTEJSO8x1eWvYGYc3lHXm03jaaskM/6AuIxgdSk6p3NSRkvWrED/r5WKKlz0mlppWX1dBe/izfrp3JBZNeIEgkHAJiw6sjdLgIpJ+X8B4ew0LJJ9jBU3b9KvK2DfRduPOj0kKdGwppWmi2gjtZ9EnBhe4QWVuScTGDHIczLonmb4XhUEjH9cveUBDxcL7F+KXaERqnePEW+BxZTRAfObUsA+WTwlGoVh0dvm6gf2qW2oJTIhnGqo8eoJkjG81kxvvvJUZXGw+rHug1YifmraroK6TeiXfmuDXGr4Ncw06UCauEyPXQQWEQ/nC4+qAFYoHzJc24R0KnTp27En65nkf8EjpX6QSKgRxYxnhQPjaW6MyiFkmcojRHLAsIM46x0Kb6nW7BR+M=
Content-ID: <20927CEDF033F540A4940D155C88D127@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e86efaf9-7aeb-4ede-285f-08d6fb03c8bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 13:31:39.3694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eugen.hristev@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1291
X-Mailman-Approved-At: Fri, 28 Jun 2019 06:59:26 +0000
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Nicolas.Ferre@microchip.com,
 pierre-yves.mordret@st.com, linux-kernel@vger.kernel.org,
 Ludovic.Desroches@microchip.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 peda@axentia.se, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] I2C filtering (was Re: [PATCH v2 6/9]
 dt-bindings: i2c: at91: add binding for enable-ana-filt)
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



On 27.06.2019 16:22, Alexandre Belloni wrote:
> External E-Mail
> 
> 
> On 25/06/2019 11:55:33+0200, Wolfram Sang wrote:
>> On Tue, Jun 25, 2019 at 11:31:56AM +0200, Alexandre Belloni wrote:
>>> On 25/06/2019 09:14:13+0000, Eugen.Hristev@microchip.com wrote:
>>>>> Perhaps
>>>>>
>>>>> 	microchip,digital-filter;
>>>>> 	microchip,analog-filter;
>>>>>
>>>>> ?
>>>>
>>>> Hi Peter,
>>>>
>>>> Thanks for reviewing. The name of the property does not matter much to
>>>> me, and we have properties prefixed with vendor, and some are not.
>>>>
>>>> @Alexandre Belloni: which name you think it's best ?
>>>>
>>>
>>> I'm not sure, it depends on whether Wolfram thinks it is generic enough
>>> to be used without a vendor prefix.
>>
>> I could imagine that we design a generic property for filters. The ones
>> above make me wonder, though, because they are bool. I'd think you can
>> configure the filters in some way, too?
>>
> 
> Apart from enabling the filter there is indeed one configuration
> setting, the maximum pulse width of spikes to be suppressed by the input
> filter.

Hello,

This is a number 0 to 7 (3 bits) that represents the width of the spike 
in periph clock cycles.
I am looking to see what is PADFCFG , as it's related to the PAD analog 
filter configuration. It may be unused by the filter.

Eugen

> 
>> I never used such filtering, so I am unaware of the parameters needed /
>> suitable. Quick grepping through I2C master drivers reveals that
>> i2c-stm32f7.c also handles filters, but only with default values. Maybe
>> DT configuration would be benefitial to that driver, too?
>>
>> Adding some people to CC.
>>
> 
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
