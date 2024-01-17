Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D00830B8A
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jan 2024 17:57:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DA51C6DD73;
	Wed, 17 Jan 2024 16:57:02 +0000 (UTC)
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com
 [148.163.158.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EDCAC6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jan 2024 16:57:00 +0000 (UTC)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
 by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40HEYaK0010375; Wed, 17 Jan 2024 08:56:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-transfer-encoding:mime-version; s=
 pfptdkimsnps; bh=VAAh1Yn8H+pIJ8TPk/j+yHv32jQUcfYGu/ReHZ/ppXY=; b=
 WzoO6fiGQWnAS+Wemal6mZZ7HOpQoL/2z0SVpzRV+C5C3DDPKncy1GWtXTf0vPGg
 L+tKyfd6hkv9hRnd5lQ+pvkSWPbAaEbPq0u58RrXufqTa9pALtl/CXF4Pp6i347s
 ZslEvs0y2HhB+K/hDUnOX94Ub/YDKKRk8T1C9tWuB3z/kwQa5K1970RzjZwD6MUh
 jnnfhhX1D1cJzhlyb1OPVsz13qrZxqstyv7FEjKv7iVfLW2rGJCi19OvhppD+OSt
 UUU7lSDuzW491ifwcaolEWl9mmq9VK+whsBF0uDn1fF2eXeEZKFvybwhM1Rey+Y4
 FIe00CqPbEstPRKufmDdtA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3vkt1fm5ya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Jan 2024 08:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1705510564; bh=VAAh1Yn8H+pIJ8TPk/j+yHv32jQUcfYGu/ReHZ/ppXY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=F54ppy3tkA+dGu94yYcHAz2B/XGe2Wdy/6Wsa7IAN5Z85wWsNDaMe2q1TbMyc40IJ
 Xy0OjL2hKTl4D4YY/OxNsL/fY2a5SgzZaxa/lynoiRC8WsYKRM1LWgZ3nYlWbzBUgi
 E/REkGiyueg2+cv5Iy1Qd4x318NJc380f7Ee21Uqsgx2kK//vPpE45Yn8jQT08QF7q
 0tY2WkF3n9a0ouRQpvHdXL21TNUlafbZEl6EYX+5FsI94neCPXwGB9m8T9t/tyM7H4
 jaPiOur0Yr8Mik1mC5EdLyR5mOFbtRNID/+5Bds1qvq0QdLwVyGmuJWFXLp/tpfPHG
 pyY3iNtGDkI3A==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits)
 client-signature RSA-PSS (2048 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CBE7540569;
 Wed, 17 Jan 2024 16:56:00 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 45E8EA0063;
 Wed, 17 Jan 2024 16:56:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=HYeZVVKk; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 370B4401C6;
 Wed, 17 Jan 2024 16:55:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSrjO0xR5/LSmMKy7hwKrc7QuGtRGKA/m8XZn500FCZ0T2ZJPfMzapWrEQOaduEtukIn/W2jQ3zX27LatBiR7K+8zpAsbD6+Zvgm5JWlDaj4rdhy5tJFGr6GzfqNbhl+5ra2hMuGe76A8DQkHV3aCZ8eslKWrloquIxQbTb404+v6NOl8yxL4k56IBMkHwJGx6qHW29zQWXhALBRh81l4+lHfff5/mtKLZih2IjL4/cMJd5zZTAkhKpLLBVhyOc5Xkxw14x+aDKQe3HKJOVBGCmEMaz6gCnCJN+LZWsyD4ga3yFCcx61Ym5G9qGUxT6ojjiruKN6VyKTMYRvtB4RKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAAh1Yn8H+pIJ8TPk/j+yHv32jQUcfYGu/ReHZ/ppXY=;
 b=lGADZsR+KCU+X1eDWOHtr1bU81v0cJCA4y15ZJ1khauJfh8KdAv1QUqeraiQvv3WhESo0wMhLKoWpycqDVFiz9u8SY+tyHHL4ubrAjojj++VyX11kznUKv3Mj2WPQrXt0AM7vj6sxN75aXHaScZIihP3Ewvoz9zkC5PRzNmfH6QJEaV7CjE0f/A5Jvxokm2xswxbLGpmGv9aXt+eaoqSKiW2cL3UuwvcDcAU7NfpA22nZrkKnScocNsUejuFzjbGbjLfj1BGn3jaKqq1VvSgctbjMAFDu0kzGbNbSGgu8XRShN54QeznDYwUXARjW8VtjyR4YSL3cvg57337Ovn8MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAAh1Yn8H+pIJ8TPk/j+yHv32jQUcfYGu/ReHZ/ppXY=;
 b=HYeZVVKk/WeFi1zzq25IM9/WBlArxOS3Otd/7UWJA323/LQz33x8ESKmUVw9Vlsz3+FwX6LNxgR+wKSHbtQH9e3AkbUtGRQc/uJh/kP0G+7yICaxgO8d81YGNDvphfi8XS7eiFFFe0b7g96CJWOBh0yEZ6KUTzXh+omwTYqTaLY=
Received: from DM4PR12MB5088.namprd12.prod.outlook.com (2603:10b6:5:38b::9) by
 MN6PR12MB8469.namprd12.prod.outlook.com (2603:10b6:208:46e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Wed, 17 Jan
 2024 16:55:53 +0000
Received: from DM4PR12MB5088.namprd12.prod.outlook.com
 ([fe80::5d56:80df:e884:3a2e]) by DM4PR12MB5088.namprd12.prod.outlook.com
 ([fe80::5d56:80df:e884:3a2e%6]) with mapi id 15.20.7202.024; Wed, 17 Jan 2024
 16:55:53 +0000
X-SNPS-Relay: synopsys.com
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: Bernd Edlinger <bernd.edlinger@hotmail.de>, Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [PATCH v2] net: stmmac: Wait a bit for the reset to take effect
Thread-Index: AQHaR+f2GstLsKb9/0S+PUQyg8BFNbDdCMAAgAExZgCAAACJsA==
Date: Wed, 17 Jan 2024 16:55:53 +0000
Message-ID: <DM4PR12MB50883D41B18E8627FBDF5E32D3722@DM4PR12MB5088.namprd12.prod.outlook.com>
References: <AS8P193MB1285DECD77863E02EF45828BE4A1A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <AS8P193MB1285EEAFE30C0DE7B201D33CE46C2@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <6e33c038-45a7-4941-b5d9-ce5704e13d48@lunn.ch>
 <AS8P193MB128591BBF397DC664D7D860EE4722@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
In-Reply-To: <AS8P193MB128591BBF397DC664D7D860EE4722@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcam9hYnJldVxhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLTQ0Njg0Y2Q4LWI1NTktMTFlZS04NjNiLTNjMjE5Y2RkNzFiNFxhbWUtdGVzdFw0NDY4NGNkYS1iNTU5LTExZWUtODYzYi0zYzIxOWNkZDcxYjRib2R5LnR4dCIgc3o9IjY5MCIgdD0iMTMzNDk5ODQxNTA5NjcxMzc2IiBoPSJhTTdVTzN4ZmprenJKa0h3VWh3ekhsWFJCR0U9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5088:EE_|MN6PR12MB8469:EE_
x-ms-office365-filtering-correlation-id: cc80d163-f64a-4b51-46f8-08dc177d2a7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BxWUHnZSqXj80NRFUSKPF5tbuVwwlEAUgVL1LItIp6rWOhG+ayP1S+k69hfoLNX6gB0+T21YWoZJQuHD0147vaxZKtwn/T9MEbgXRyMT5Cg3jkkGRA1ou0tiZ+anZbDVw662I99AXCsi8/v0M7P87qVFCMqecCWBYnomR9QKkJTwPYHZuDdm5pMQGOM5gDtfe3KTNfqT6Qh5JOcBuzs/4GbqJ0M88mLvB05k7XYoSmpV9eUM3CV6/6UUl8O4L+4sqZI4Rhj+hwjCdfWm8a4rDI0Ad5ATPtcz2q9NAQXVG7O8tHgJ7fajxmx43W9+S8ZMHgbitHVD6ZP1fZ6BdKHpBNoB1TreIDlkr4Oy1q1l1/7yE1YQGQYPTJGrngLyDpVOjGM9lBQ9iG+j2VWPu26LvvFJiCsIl58NPCUhI2tEnTTVOENU8dmHSXWklR52R4Br2a9hPh/K9VxgWXB6H9CznmS2sAiAw5ZP1ktMl8L+W8XgVMAc0SH9etba1GOb5ext6D3julSvlpV55SGibcxPfGcahwUZjVeIrRSg5M1iBgkz19IpHhRgZxPZnKBmgvQ08lCBka850gZ3BrBzxZ/Ol9zwO04W04tlb98WnTmqxbiCklSriRqf/BqNC/oDhE/r
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5088.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(346002)(366004)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(66946007)(6506007)(7696005)(5660300002)(52536014)(33656002)(66476007)(7416002)(38100700002)(4744005)(122000001)(8936002)(2906002)(4326008)(41300700001)(316002)(66446008)(76116006)(110136005)(54906003)(9686003)(8676002)(66556008)(478600001)(64756008)(107886003)(86362001)(26005)(38070700009)(55016003)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkNlK0hHYVlhWkhqY3FuSFpsTUVCT1JNUng4Z1Q3RnBQa2F6YkxwOEFQM1hG?=
 =?utf-8?B?L3J6akhWNDQyTVUwWFBpSXIydUR3M3h6c1Z1N2RncXhKb0xHcEIrc0J3Vjdt?=
 =?utf-8?B?MGZwTmowam1CS01OeGhwaTRXYTJxbjFqWlNVcXZCTmRjSkE1N0VINEV4VUlS?=
 =?utf-8?B?Y1ZSTitKbGU0T0FhaTRuZXR3YkZwc1FzR2VWajBIV25NYWhIKys5cWFVQUsw?=
 =?utf-8?B?VUxJRUE2VWpzNml6SFI1UURoNWIrQXRaMzJ0S3FrZktldjFlVkdzQmlzTlUw?=
 =?utf-8?B?VDlLMFJVRmt2dEk0WWJVMnczaFpxTXF6eDZrK0xzRlU4SEZhRGRVc0wrT0RJ?=
 =?utf-8?B?YkZmMkE3MDRwQysvSW9zemxVeVJLNjlQODZtUUk4Y0dhMUZJZ0ptZ3JSSkVj?=
 =?utf-8?B?Y3pUSDdnOWhiRkJhWlU5NU5iRDJhSm5RQjI1dGVQRWw0TStiTUgzc01sZ2JE?=
 =?utf-8?B?SkFZdkxYT2twWG5NTUZXTnNseEdhVDByRmdOZTBrbjBQSi96eTFRdHRLb3k4?=
 =?utf-8?B?bVFRekhxVVdSZ3o1SVVhbW1EL0ZTeldZVm93MVNIUFFWY2t0aVNYbVFqQ1Fx?=
 =?utf-8?B?RjA0cWR2WTZjZThTemVwVEY2aW1uYnFOSVR2a1M1YVlaL2h3MVgrb3dZSnhn?=
 =?utf-8?B?T3FGT2ZYQmVDQUVLNUdyNlVrNW5SSmdGWnhpdndtSm5sb283Q1p4bEt1eTVI?=
 =?utf-8?B?UnhGWXdxL1JITHljWmdiZHFadjF6aUhVS3JFaE9WNEtZMWdBLytQb0x1elRI?=
 =?utf-8?B?WE5mM0Z4MHY2aDg0RE9qZ0ZkVFkxWGN2VWhhby83QnU4eVV1T1FqV2o2NE9j?=
 =?utf-8?B?ZURHTWhZbjFwY2cyOGc0K1kzUERUVlBqU0ptU1Y2V21nWEVnTmdWdWdvU2wx?=
 =?utf-8?B?L3FjOXB1czR6TlhuMnJrRVRQcDh3T0srckhzanYvZURUenJNKzFGemZiZDRZ?=
 =?utf-8?B?T3B4emtGdW1hcGJQNUY2eWRDRmQzMW0wNWhSVyt2cjhzdndiWWtFTjdjWUJP?=
 =?utf-8?B?ZjhHakNseWVUbzVhbEUxT3V4blNUWjR4eEtpNEV0S0tKK3dXYUE3YjdKOEMw?=
 =?utf-8?B?Zm50R0d5N0gvejJTTitTMTRaUW8rc3JSczNmcWgzeFBlMkxZNnB3TktBRTFj?=
 =?utf-8?B?UmdESG1RL2V1WW1nOVdPWVBVclZDTWpzZjNUbzE3YXF0NmdtRXk0dXl0LzBB?=
 =?utf-8?B?akgwR292L01QL2c1NEViU05RZjBtZWRKbFBBU2JVR2hycnR0NDcvdmpuVHlO?=
 =?utf-8?B?K3pHSzliMUJ6bDB6ZndaUmJrL2cyWnhjR0p6d2ZUY0pySGs4aTdUVmE3Vkw2?=
 =?utf-8?B?VGx3VFRWZ1NNdmI0N1hzRVFOUUVibndlaFlWZmRUVEhib1E4TUQxQjdMKzFK?=
 =?utf-8?B?Mnl1eklZdHRpS2ZPZGwrYVBqYjBRTHpZa09vczdoZEZxM2pZd3BjanVZbTBj?=
 =?utf-8?B?ZDEyQTc1QWlhTXI5THZRVjB3OGFndi8vdHlBc2VQVHpWallJR1R4bW13OHB6?=
 =?utf-8?B?MHRaTnpwZXFHS2lWRFdPd2tVQWxHRFdVM2R1cVhwZ3QvY2dOUUloZnR1eVRI?=
 =?utf-8?B?TU45cTI0NjlzSVd4YSszbFVHUGV3R212eUxuUy9jR3VUR3FoZnZEZ0Z2Uzhw?=
 =?utf-8?B?b3krMU9OVTJxQzRidVJoam45UDNsd1ppWEZFZlBkckpFRzNzaVVBODBXZzh5?=
 =?utf-8?B?VTJCU2w5clE0U0ZHK2JVVWQveG1jSVUzeTNCY1g4Z1RlMUlNUG1xczJEV3lH?=
 =?utf-8?B?MlBvNkFGajBMQkJGdU1wUVhuSW9oKzhmaEtCWHc4bTZaaXFwMGpkNHlzUld1?=
 =?utf-8?B?eVZWVG1tRTVEUSs1Z2RWdlhIMTRuMHl4VDhRTkJmQW4yOTNvOHFZQVhkMC8w?=
 =?utf-8?B?U2k2N3BnU3YxdEZPVC9WT3ZrSTVYRmlJb3dpV09YZW53emxUb3pLZnZwSnpi?=
 =?utf-8?B?cWJlQ0NOWnh2YjZ0LzJpck5rZyt6clYycTFwZUVTNlYxWXFKMFpOSE8rVDBu?=
 =?utf-8?B?L2FvcW5od25QbnhMUlNNeHBHcjdDOWZRZkZqQlpKNGc0VmExaklYZFZsQ0VM?=
 =?utf-8?B?MkdlblNHVVRGZHQ0QU9NU3FsTW1uNEtoek5zalF6WW8xcUhRM1Q0cnVzSlZ6?=
 =?utf-8?Q?4rz5ICgmHtI6/dQ4yv0si7wem?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: FAWvddGC6iD2YphDMmg6v3Gy5s661s5HqFv4iUs8L8D2FU5jJrWuOio/vPLFaGRyvQ5xzUO8/G4VewZ6eXSSPBdAqeZ7uEjzyOH1Ae186xrvG4/nvWwhPz3wg1ptC5bKjVs/i5zVpwmxszqFwFWLuDY4KziYSp/4mlyeWv9ytIUaDNJ7VY0Sbc3mj/wLWXaB41iGSn434mhYgdkfw08HvFHH2RrfGjB8s3TQIOO8eQpXGph3fzYCp2Zey/jE2rAyPtGEytQSvPmuwk2PSeO2Q0R+wwdaatolnlQ/QsE18EY2ztoL8af+UiLmZv/19RNsxALyVCaYVF5TIKK/StzHjID5r45ivXCairxeFIYWrsxey7gMurPf3JT5ejWEfi80VyEBiBoib8GYMkF/XduW2UQJOtjV9BH/qWEimvg7lp0Kh/HO4KIz1X2bXbD6M4caugee252UFaufQk154PQJBFhFfpUL5D4srNKAJ/Qn1kg9fFOxPYHCnFc5NmFxJFPP02E+GpleVycc4lDkULI+dlO8OCMzQ5SbFhTjZUIgm4P/d9yQ6w2cqKCCFRM2v7EpyOTtrT1pslSY+jFQyUrYCG+V1YESceVJD2bgY87ueGxGRWHKD7OFynJmGoMI2XtTiW7Qrzb0Ykbs7EmoElmx1g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5088.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc80d163-f64a-4b51-46f8-08dc177d2a7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2024 16:55:53.0418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2FfoEH0ATU3c4ju3FXTpWsxyE3zE4aG8kAgcIurGlVl/XRhPU8JydF8u6Q81klq+T6g3yo8bilHH8dXpd1ETug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8469
X-Proofpoint-ORIG-GUID: NWW8khwLGoDqhGrYi55hvzJjXv_xYN9E
X-Proofpoint-GUID: NWW8khwLGoDqhGrYi55hvzJjXv_xYN9E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_10,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1011 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 mlxlogscore=821
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401170123
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiri Pirko <jiri@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: Wait a bit for the reset
	to take effect
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

From: Bernd Edlinger <bernd.edlinger@hotmail.de>
Date: Wed, Jan 17, 2024 at 16:48:22

> I don't know at all.  And actually, I am more concerned that other registers
> might be unreliable within the first microsecond after reset is de-asserted.

Are you guaranteeing that the documented PoR time is achieved before reading registers?

> As I mentioned earlier the VHDL source code is obfuscated and I cannot
> tell anything about it, maybe people from synopsys can shed some light
> on the issue.

This ID must always be present; it should be different than zero.

Thanks,
Jose
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
