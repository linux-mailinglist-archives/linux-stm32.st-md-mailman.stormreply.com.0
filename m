Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F37E473D26
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Dec 2021 07:23:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D91DAC5EC76;
	Tue, 14 Dec 2021 06:23:39 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 376FEC597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Dec 2021 06:23:38 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DC8A1C0455;
 Tue, 14 Dec 2021 06:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1639463016; bh=b1Rftez3WU/fzvHr6NbYovQ3rxg+6BCuLyAj7U5bG+Y=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ZP97Kj2lSPwU0CarnEpjpVwGwFm5lrnbXHEBCw/6w7kv6xSCtiyo5HADLaDPt/ZaK
 eHtyZ4Zr4+hLUB/TEhGI+DPHOv+Zl3jHTNqwf+Hf8GmAATH2/UP4K/kAlSlU2Zxq9E
 3eGz6GkdHp+IzoYyNvA5Cc9CPjbw1OjGbdIhXq2z0cK2GCuFnVAMoQ+olIi0i/0hUh
 34Mf/VoFC1OfBoQdBoYOMJM+XnlWL6a2Sm8s0oIkEdWqUW92X0DIStyIU+0kfQF8ZZ
 kwYGzaZ4Pe73QLLTQpS6tFM5RSVsccYs/b/FNgp211hRgVrvHUYzLCnHgo9e+tWdSN
 tPey+ruANioOA==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 40416A0071;
 Tue, 14 Dec 2021 06:23:36 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2048.outbound.protection.outlook.com [104.47.74.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9737F8024A;
 Tue, 14 Dec 2021 06:23:35 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="fmUhTwql";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7UZX6VNuj6/jSc073V1D3Q3IFNWrWA9oM4RIq29yRgwh/BwNmINsSi0VCWb8UHPYXA+UTy6lDo+Sg5qnSI+2s9B8UyW9CQ2NCs0om0/QhZiQrdCZaPoUSFmzSZ2G4CEFBl/94TvlNSI/Z0uL22s3jenkxyYmIbWCf/QlpM/cqQAWBjtrUJVb+/aIb9aw3BA13/fGESzc89UCF2+mZRwJQIJ4tMgndiZRV+PdgXPHxvbkVd6XHf8xyiG23uig+EDhjcbD9f6C6TLNMAbF+P1Z4ekbCF8bUcEvmuTg/nvx+416MWe/Y0NcnF2R4WjDmdnfX4NWNXTeX/AQyeMCCBrLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1Rftez3WU/fzvHr6NbYovQ3rxg+6BCuLyAj7U5bG+Y=;
 b=MZSnVIUdFiIOPW9OQ3MtlJu4KNSM8rfEqSBny9Yq/p4iP8yhx3e/XpnlH6GF3owTvQE1OfoJVZ8ah/LPaWCF0lSZdUsrjoh8tOgrwgansrVTlRs/K98MoN84JNskB6pUryLrt90ymETBzbxvtc8xGA+5C0HcC8YiJBWNtdvnrqEdJQGFC+FLsjO6nG56/va2wtTWgR57T1lnsJA2urZE7Zy+L6JyY/B60ppCHUwtlmZyGtW4afYW1jWAVCBUNb5sCpFFv6RfZIyFWvPA02gFAzIk4RQgc3jnGoKpPqcCxkMZXE5BjviCeN+JJqOnx6OXZPQqMfVEU2TXpifLHi1Q2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1Rftez3WU/fzvHr6NbYovQ3rxg+6BCuLyAj7U5bG+Y=;
 b=fmUhTwqlzA+3RBI5C47MKlA1yVXqW5qdBikTGgtkJOs2cSQ4eufpsaX8+0UrigQ9z5ADqtZGds5VLc23agAiH8uK9IbHi71i3g+vziKYMt5TiX4fSEXD5EN9Jam2rNItsg2ZpAkKm2jiqiRbSFoaS0QLSprVMZKrlL51mw/1uF4=
Received: from DM6PR12MB3419.namprd12.prod.outlook.com (2603:10b6:5:3c::32) by
 DM6PR12MB3754.namprd12.prod.outlook.com (2603:10b6:5:1c4::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.16; Tue, 14 Dec 2021 06:23:33 +0000
Received: from DM6PR12MB3419.namprd12.prod.outlook.com
 ([fe80::bc96:b3ed:1aa5:57b6]) by DM6PR12MB3419.namprd12.prod.outlook.com
 ([fe80::bc96:b3ed:1aa5:57b6%7]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 06:23:33 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH 1/1] usb: dwc2: fix STM ID/VBUS detection startup delay
 in dwc2_driver_probe
Thread-Index: AQHX62hPh6qLl1iXDU64pqDiqVS4wawxj2mA
Date: Tue, 14 Dec 2021 06:23:32 +0000
Message-ID: <8034e712-1fb1-c8ea-d120-e8381a5f20a3@synopsys.com>
References: <20211207124510.268841-1-amelie.delaunay@foss.st.com>
In-Reply-To: <20211207124510.268841-1-amelie.delaunay@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a3e6c61-60c6-4603-ff4f-08d9beca40ed
x-ms-traffictypediagnostic: DM6PR12MB3754:EE_
x-microsoft-antispam-prvs: <DM6PR12MB375481F4DCBFF5DDD1A50F20A7759@DM6PR12MB3754.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rEUS9oOs9WDwQcRCekKwQTh2cJKG8jjkx8Uv8gYyMcN6ie4o2Cuoe1Py8kvdzjsYusEJ5UqMiymdCf//7mn/L5yOyx3L9SEkrMwlE9ePIqVRxBAW6FOR+qfI7akTEeSmTI5Kimb0jbZdy3xHb443N2787wiBrUfdV7LwByUrWtohJU0LycUW0l0VCQd90W6ggfHeoZF8+i3Z2CxZfg7ey7iXQAtozKcTGt/VFJ1s5v4B2yu/T+lzMi0Ot7oYPEKKOM5zuQmdwxAZOfslAulc620XbiRYHmTtboynB/iWoGVogZlyB6zdnTehGcAQgHyGQEpy2BRonDVn7cwg5IrjXlXRSOhytZlqT4UVoRChQBf5QLFXsWiEyPpeeMSY2wEeMx4rzSNoagsMaIfEMwR6fNqjjlbdwBH33/9zVLRDFsH0nTS73eo/11cRk5Q831oLH77qOFCW3OQki9Q/kb0uKQlqhm+j48PygWLJe0dUn2EaOrkGMiUG20WkbXBUxYe9B8d0uOC3b35rIyYRUuShpbDz+EvMBia9PUjODHSQU7PWgZE0fkoNQITPvGA+Vu8/1/Y0tpEIWmVG19ezNjSOknlRxYdmLx5x6y7C8AfsM79Lh5hR8mYyvMlo380Obq0TIOwt4BkgZ+HfNyb3YWG93P+wewOY9W8f4TxdAsB4AtDcExj8G/fo7sD3FifKbCZH7yOJ7e2/4dowL8Kkxp1kuTx2/htXYWtjkemyyb1MCAXybEbDbAiJxkQQLinRfUaBDrjE43HTdXZ/j7UAvyrtRQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3419.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(53546011)(4326008)(83380400001)(2616005)(31686004)(64756008)(71200400001)(6486002)(8676002)(316002)(31696002)(66476007)(2906002)(26005)(66446008)(66556008)(186003)(76116006)(38070700005)(508600001)(6506007)(91956017)(110136005)(54906003)(8936002)(86362001)(122000001)(6512007)(5660300002)(38100700002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3ZhUVpxNnBoMmZ5N0lWN2pXaUdWOHl3TFhDbTF0aDkyMGdlMys3NmhnRGNi?=
 =?utf-8?B?OWd0SjU1WWZwUllNRGI4UE1pa3RBeXBjQXVaNU85c1RhcGljMlpURDNzUTc3?=
 =?utf-8?B?eUowMzVFN2s3OFBiL2FtenlYN2w5ZVJqaHRFMUw1bHlvL1FZR2VTYmI1R0kr?=
 =?utf-8?B?ZnZIY1pTWkoxWEJQVE1BTmFaSElYc3NZc0EwZVpncGUwdmlnSEtnYlBwZjk1?=
 =?utf-8?B?NWxJUEJnNFhmVHBtUEhXbGZEU2VxVWgyZkhRamUzNGYzT0gvNGM0NHJTT0cv?=
 =?utf-8?B?Y3VjWDlHSU5IVG8velVNT3JBSWR1NW42YzVSMm5LeENCdmJCdS8vZHk1ZDFY?=
 =?utf-8?B?OGIrcUluWkpKb1lZNTN4dFdzeVExK3pGUUNDcFpCNUF3aWZ1SHBQS01MSTkz?=
 =?utf-8?B?K3RLWkVpd3QrRmd2eU5GTlU0SzlPTCt5UVNiSXFUckJVNHlYbS83czZOREpn?=
 =?utf-8?B?dkZibHJETGdNUU02Y3NZV1ArVW50ZkJMVDhISTRYNFEwcEFrcHZtWU5xTjlW?=
 =?utf-8?B?R0Q1OFlPdDAvVUlTbjlHcEFyQllzWm5yL0Z1ZkNlaWlROXI3VXJmTW54M3l6?=
 =?utf-8?B?ZUkrS29keUhhMkluRSthN3kwMEdLRG1SdUZwS2prbnYrYklsTWN1VzVpT0hM?=
 =?utf-8?B?akdlUzZBVVZsNDB5bGFIS0lUYTRRQWtmVjc4aFU4NytNNndaSjlmTVlrRE1P?=
 =?utf-8?B?YnVVMDF3NktlZUVGdjZTSyt1RWlzUVI0RUZVRWUwMUR0K1FNQ0gvNkppLzh1?=
 =?utf-8?B?TUdVS2tHcERqMHpLa0RYQmNDenArTERGczFLU3RuaTJET2lNanpsbTc4dElT?=
 =?utf-8?B?RWJkWElyR29jSFQvbGFuQ3FJQ3gwWFhGMUVjTVd5ZENnTW1uT1puM2JTYmRj?=
 =?utf-8?B?L3VOSUdQc2VqR0M3cktuNXg5QnpQNkdKMzNkZklWRVAxYkFtejdWZERoYnQw?=
 =?utf-8?B?bnRORk9JVTFJZVJDN3R6VTVoVXN3U0M3Vk9vUHAyS05zZlB1c0VhZzBCQ243?=
 =?utf-8?B?R3RFUUNxTDhub29JTWVLbkEwaDhReEtxOVlYR2hJQWdUY0NaWStaZkxDdWFI?=
 =?utf-8?B?MTJjSmlnZ05OelBDR2EwMGZMOUZVRXVHYXFObmNTQTJyUVQ3dldyV2xJTFo1?=
 =?utf-8?B?R1ZaKzBURDdWT1NjdTUwak0zSUtwQnRMVW8xd0dCeXcvSzhyY3k5eUZzcXlh?=
 =?utf-8?B?WjB1Ri9TL0o5aFhuYzFpYWNWV3kyZU44Z05MblRZczRMR3lQczRzc2tlTjl4?=
 =?utf-8?B?QWtCN0NZT0xNN1hzN1VIYUtLQlg3SzdpdVRrV25ZWXJsU1FUdGoyemtldzVQ?=
 =?utf-8?B?MDdSY01TdUVnaWVwMDRlM3QrakhUS0NQZEFQYlgwYlpkMzNSQWZpRzZKYXB6?=
 =?utf-8?B?U295NWtSVitkT1VrRnVPWGlMeExTQjhXTHFlU1h3b1RVaVdmV2VlU0NoS1Vw?=
 =?utf-8?B?OWNGQW1xY0VzbllwMVdrRW03ZXNNeXRlN0haQXNXamtTM0NzazNCMUJySXZ4?=
 =?utf-8?B?MlVPRG03TDlPRTZPN2JzK3RjUW5zTFc2RVpXMkxxWEVIbkQ2ajI5dDBTbWFI?=
 =?utf-8?B?Y3RkaDI0SStJUlQrUWllTVZ0SEU1WC9CdEpyMVRPYTM3WFJSREpKM3pxUHIv?=
 =?utf-8?B?cTV4Nm90YTNtTEFKTUdBak9YaUtkbldQN0NNSUkxOW9GZldENWU4aGhzSm9t?=
 =?utf-8?B?cVJ4bThVdGlwV01QUEd4a2hNNEdta2VhdlBkeFNpTFA3Mkt1L09BRVRiREw5?=
 =?utf-8?B?RGw0T1N2TkdJMzQ3aEFZelJhcktTZVcrb3hINWhFZEEvbTNtMzN3aTFlRU14?=
 =?utf-8?B?TGk3Z0ROeG8wTDJIcFVqdFdJS3NIa2RLb2U3eHhWYjJ5TEJ3MHU5TERnT3E0?=
 =?utf-8?B?TkNmL3VKdVZscWZyUS9nRlRGTTNldk53MXVKMVVVc0xPenBvZ3czMVlhcm1o?=
 =?utf-8?B?Zmg3MUl5Y3c2cWFTUFVTc3ZXRjBUS0FSUlNTN0c2a05GOHJGek1rMHFNek9l?=
 =?utf-8?B?dHhpU3UwZkRQcEtDQkpTVFFRU0xJRkpsVzRRSklaeC9GVDBVODlFZjVzOHpm?=
 =?utf-8?B?a2daTFl5cElJRVh2TEFjSlRiazlncDhPcUdHbVNTQ3VweUtvNnB0Ymd1SEto?=
 =?utf-8?B?UkJkUXlDMnJ0LzhJbno4bXpnOW45c1lqTHhsazA5RWR6a0RqelNmeVRmcEFy?=
 =?utf-8?B?aXc9PQ==?=
Content-ID: <1C2456EDBD50E14EAA7327AA8F6859A6@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3419.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3e6c61-60c6-4603-ff4f-08d9beca40ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 06:23:32.8268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gzWWUGaEupZ+G4BeoJRVR0bt/lgEQd71f7gbp56fJxZcdsiiEpphnhj3fEffEZ6tGkOitZKVuRoFKPQk0DZh4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3754
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH 1/1] usb: dwc2: fix STM ID/VBUS detection
 startup delay in dwc2_driver_probe
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

On 12/7/2021 4:45 PM, Amelie Delaunay wrote:
> When activate_stm_id_vb_detection is enabled, ID and Vbus detection relies
> on sensing comparators. This detection needs time to stabilize.
> A delay was already applied in dwc2_resume() when reactivating the
> detection, but it wasn't done in dwc2_probe().
> This patch adds delay after enabling STM ID/VBUS detection. Then, ID state
> is good when initializing gadget and host, and avoid to get a wrong
> Connector ID Status Change interrupt.
> 
> Fixes: a415083a11cc ("usb: dwc2: add support for STM32MP15 SoCs USB OTG HS and FS")
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

Acked-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>

> ---
>   drivers/usb/dwc2/platform.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index a1feaa09be57..55d7fca6f95c 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -555,6 +555,9 @@ static int dwc2_driver_probe(struct platform_device *dev)
>   		ggpio |= GGPIO_STM32_OTG_GCCFG_IDEN;
>   		ggpio |= GGPIO_STM32_OTG_GCCFG_VBDEN;
>   		dwc2_writel(hsotg, ggpio, GGPIO);
> +
> +		/* ID/VBUS detection startup time */
> +		usleep_range(5000, 7000);
>   	}
>   
>   	retval = dwc2_drd_init(hsotg);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
