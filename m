Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D314B1FCE
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Feb 2022 09:04:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9987EC5EC47;
	Fri, 11 Feb 2022 08:04:01 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 820CCC57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Feb 2022 08:03:59 +0000 (UTC)
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 09E01C0186;
 Fri, 11 Feb 2022 08:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1644566638; bh=RUmJjlmhm4ICZVzej6hVVxQ80IwpvALXNrrcwFKkuyk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=KQRqOix1y6gen/yV7eLBbQCsmiVYgRsdoeNKCzjIzLhaoFBpdj7ThDkn426O4d/GQ
 q4A1ULL9Ej8mz5f5y3xpvV045IRmGOtfqkcYUAzFZSyKEaEa8w1Ycc/EVPBgp9jIfN
 wLteFAnCuiVfFp6Zp+V1EoqhqDN6DufpMVXMxVVewsGTImCDjuuuUSlxqimXVOD3wX
 wBqYL70YLV0yLlxYiENqS7XKCucdf153Mco9CHVXk+peICkixgYKiV265HaPqZ/xD8
 jcj8MOQsJrawMqAjYfG1x0m7rG2g7aTQxpi1upZ83N+O8xs4mgN1Qn9r3mrXSk7jAh
 jkzaQ23OajEHw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 838BCA0070;
 Fri, 11 Feb 2022 08:03:55 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1FD77400A3;
 Fri, 11 Feb 2022 08:03:53 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Ub2pxe6l";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ooi9x/WWe8tQhysFI3oh+T9/AdZSWLxYI/mkM06sP9Yo+izYTqJjL5nfq6eBtLJIC00Or6EkbmVDuVg0OJokUH7av3k9GJgdx3jrCtS1vBfX7oQ5QGnYYnG9U8YbaaInKxt3Habp2Wb+kgv4dqNBXpizb3DL6c2otfxipbeZsN16bW1UV3NLNIxW9BhZnlploJ8csQ6hPHXQlWbdEdwAB/NnrLQqc4Xd8OpQ6MPDPuCYR2racqfOEvPaUfaE2/LEotN2WLP9VCsEOQtATF+XQUbUdOHR2KWQnhNUeL29YTvA1XKHnAM1NarqYPHBcDmIY+ZUsSeH3Ts8M7fqZ5dDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUmJjlmhm4ICZVzej6hVVxQ80IwpvALXNrrcwFKkuyk=;
 b=HIbuxCaVKuTrU0py3z0eXUf/RYSaR6FdHphI2QRzuz3DYZwla5HNIQe9p0xB6dy/s3mCm2fVtWLCt1TrbJvfhnmPRTehExBSFlA5k29TzhBglU+9W7uVisxxMA17T018w0nctfdhuWQvv6/wKnv2dg3FVwOl6M3FbnuBhj/AJidqE4mPgUWQtoKVFv7aRugUKmLwJ35W0lyjdRkOJt8d9ib+R7sdGgD0Ja9mZIYaocQ8HEvCTw2Jb7/UcNv+3fNAujiXFoXL1zMcxlgxId3AvfeLz78Y4JGNYSjzaXVcGp+lkZZYcyKa1rqzGGcGU4tDuE7WCck5UoFmbHbxXZaiqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUmJjlmhm4ICZVzej6hVVxQ80IwpvALXNrrcwFKkuyk=;
 b=Ub2pxe6luM0ijoFNAqi+VW4SKvIH3VFhN+l2z/D8BtnW3O/B+p9al+rQYWOTTPuXmuo3yHFsjJXz0T4t2K+R6aR5QATzrJmmKM74jX6rsxMw1mM2o5hZa5ND896IUg/49bV6mRQNZIY3597fKQNKnKpR1LMJvsFpwxNoQBT8sEM=
Received: from BYAPR12MB3399.namprd12.prod.outlook.com (2603:10b6:a03:ad::22)
 by CH0PR12MB5387.namprd12.prod.outlook.com (2603:10b6:610:d6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Fri, 11 Feb
 2022 08:03:51 +0000
Received: from BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::7cb4:759c:b286:34db]) by BYAPR12MB3399.namprd12.prod.outlook.com
 ([fe80::7cb4:759c:b286:34db%5]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 08:03:51 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Thread-Topic: [PATCH] usb: dwc2: drd: fix soft connect when gadget is
 unconfigured
Thread-Index: AQHYHdBfzuoH29Rn60WIbAcjGmU2O6yOAC0A
Date: Fri, 11 Feb 2022 08:03:51 +0000
Message-ID: <7414fa06-ebe1-4ab2-b4c6-294568e89f4c@synopsys.com>
References: <1644423353-17859-1-git-send-email-fabrice.gasnier@foss.st.com>
In-Reply-To: <1644423353-17859-1-git-send-email-fabrice.gasnier@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 111084a1-87a4-44ae-3149-08d9ed350a6c
x-ms-traffictypediagnostic: CH0PR12MB5387:EE_
x-microsoft-antispam-prvs: <CH0PR12MB5387CBFC5FBF00CF7F399AC7A7309@CH0PR12MB5387.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sp5AKFfbQ7hXCmwMhojfneAEaov1dqB5eSKviaMDoO/iYVfhXQmfMyrLYlBnAVruBzfholH5vJ1Ynr3O697MZ+wULr3fcWZ24okvlFjG/wNLzgU1JPDzh7o/MjK2a4N/vD4PKmgVK3+SsPRIgXg93/68mwvlrnN3Tm9Bt9QeBRiqyzsw2a3rirqxGdRxuX/l7hHbvfXIfMhEZRjSaSprHzBGX4W1Hbv0gyBZUnqXffcLQosPXsvlaTahg47WlnqZdfvsNaR8pwJsA5lIi4KZdF8O8aFcku+jNobrRKQNNxuEEzZFC1ujQ288ZIbLtWxsQKwM1BHTwMB3jbMBjYL0qWeGHXbbzOBKUB1HUkDqmYJji/79WqATPKIf06Ajk+GcIH7PpoKpgB4e5U2KkJcoakhFy9xJoNYhPs9LggExbmPxtOiNe/inwh6Ex6kb5EzrOwSBhyVmMAtt1UXiZ1RBAl7z2tt82u9pe36ACrqwfjULTqiHGBPWy7xu7HrZeP/252re4W1cU9SswEKlecGDUZdmIZrhpAXMf/IWZsq5eq86XWO/86i9irR2PZrmKeHg+UeAo7CuLl0OK9hUyejUlGnxEWSeSmU3oxTcn17M32c4+pRvT0YrkQeuXpaI8ySCGNSwSIzk9ka2Txwij1XRQFitY019Kt3OmXkB0R2whquLlQVz+S/RifW0TJ9Fl+q8Y24UnQpfAfF80XTtA8nu951OV8hMmAJam+SowDytFpmq70KvNaHII0CCdwCoVg2vV6bRPDM1SeqSCkdckYk12A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3399.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(5660300002)(186003)(6506007)(2616005)(71200400001)(2906002)(122000001)(53546011)(66946007)(316002)(38070700005)(26005)(6486002)(110136005)(54906003)(66446008)(86362001)(6512007)(8676002)(66556008)(66476007)(508600001)(31686004)(4326008)(76116006)(64756008)(36756003)(38100700002)(8936002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2ZGWUFWdGxMU28wL2xCaVlKUTNkL2Frb0JzcjQyYWsveGxFMk1UTXhwNUdE?=
 =?utf-8?B?YTZCcW9lNzhBUEk1MFd1aWNOQnNkencxeGEveVU2YW5CeXNmY3JaQkg1a0Vs?=
 =?utf-8?B?Rlc0V1pJT3Z0MzVITGhhVEo2MDE0Z3JoRGtSOVYrdjRteWptUFlKa0VRVmxr?=
 =?utf-8?B?d245bFRwWm54RlREQ3ZZSDNhb1lrY3kwejVjVmpUTWpyOG9SNFlqdTlHSWxG?=
 =?utf-8?B?ditieWRhdGR2YUtRN0cxQUxyZi9UbkhUUnBTT3phVG5sZ0ZqRFlOWExTUzRv?=
 =?utf-8?B?b0pabmh6K0J6b2VrdGlycGxGeVFQWW9WcDV6MmR2QXVpbVBtMUpMSXhJUTJK?=
 =?utf-8?B?c0tFOVpkUnJQWkYyRlRSbkx6QklRZ1BKalVZTmFVMnkvY2V3VVFGWEFxZ0Rk?=
 =?utf-8?B?Qm9FNzN6TlFrMVl2SVlucHJrbVd6K1lwdkxDMHhQcDdyeWNtU1kzSTQ1dnJ0?=
 =?utf-8?B?WTU5cmFkSnJRdmJjU2d3U25TVHRMNWFxdkVXcHJUMVgxTktnSjRSSlZSK3Qv?=
 =?utf-8?B?eXdmc2JWZWJMQ1NOZ1RFVlAvVkNWU3FNd2hHVllJeURvWnhmMnZiZDI2VExZ?=
 =?utf-8?B?a0NUcUtJbWY0WkpCZmJnY3RyQ0FPTjJBSG00K0I5UHdhN2dRZVgzcTBxSEdK?=
 =?utf-8?B?Z1JKVEhMWVdrUnMwM2VzUDNSVXhvQ3UvTDBYbWFaZW51cm5Lc0t0RzBaUHJ3?=
 =?utf-8?B?N1JvWmozNVFSa2FmWVA3dTFaOWdLRUc1WEYyOS9jbzZmYktrc0FoeFR1QVFJ?=
 =?utf-8?B?YnJTRDBrMVBxZ2dVejFsQkprWkh3SWZzMEdheDV1ZEFCRDJtb2JuRkJWaXJv?=
 =?utf-8?B?cjhENkFnelZROUlsM2lVRDc1L3ZMdDg2Y1llTUhMalVrSUZZVndJWDFrbnh3?=
 =?utf-8?B?SEg1Wk1SeGdjMUlMckVCYVA0MEFPejhvWUdFN011bkhpTmR3L1J1a3pOK2p4?=
 =?utf-8?B?U2kzNEFLUUs0Z2l1TkNOczFPWVNSNFRER2h4cnEzU0hWYzZodXcrWi9Ha0ov?=
 =?utf-8?B?RngyQ2dGYlFybGhLeThYVXR5bHRjaVhQczRibHJyb01icG1TRDNxU056Rm9H?=
 =?utf-8?B?N3FQZWRhTW5ub3B1TWR1UnlsNGQ5SGdqbmQ1cnlVd2ZwTXVPd0xyRHorVVYx?=
 =?utf-8?B?Q0crQ0c2ajBpd2cvUUIrMUxjcFpRTkRHYnZ6UjNuWUhtZ2x1TCtLSkRVUEc3?=
 =?utf-8?B?dDgydDRNU1FWZFRWdmRyYUsxaDYrM2VSMjBuRWRQdzRnSmYyQmtVSElXbUZn?=
 =?utf-8?B?WG1aWEVxV3Z2ZXZ3U2tIL3A3REFVaHdOdE04Y2E2ZTM0a0s2ZlZaZTlnUjgx?=
 =?utf-8?B?RFJEbmZESFE3SnJpMURuRExXdmlZUDczRDRVWDY1czdaZWU1YlRQNzVEUVo1?=
 =?utf-8?B?TzJRa0I2bFQ0UCs4dzIxaElqekR3b1MxdUVtL3ZyL3h2K091RlhMdFJpUFZw?=
 =?utf-8?B?dUVhdm5BOTcxREdBMmQ0TkkvNXUyMVVvZ3ozT3c0TlRJS29BWVJxb0NaYkFI?=
 =?utf-8?B?TmFQOEQwakRaR1ZlaU1KZGM4dE9SanlNRkNaMENqbWd1UkhmczAyTUlIdVpi?=
 =?utf-8?B?WHlkOXFmVy9SNFpOTkpHMjduRXdQOWM0bkpPNkhLMUhaeDE5UXpTTXJmRWpl?=
 =?utf-8?B?d2hsclJucjlwdit2QWJ3Y3VTU244emxtY2lUcVMxZ2RRSkFkbmU0OXphalA1?=
 =?utf-8?B?SjNDWjBTWFVTWDZvK0Y4REx6TjloZzVFREtyZkFFKzVUSnRHODI1M0prN2JG?=
 =?utf-8?B?RGl1M0hYMzVPbnBkaHdtcnI3V3M5V3NXV253d1FjVjl5cGxmd3VzUjY0cmFa?=
 =?utf-8?B?aXpCNEg0TWUzaytaWVFPd0FuVDdQbGI2YlptckZkbDlMRnd1Mit0a2N1Yyts?=
 =?utf-8?B?RVdjVUM3ODFCMU90SEtCRXFFRXEvTTVjZ2s1UXdOSmVxQ05qSVk2aGpjRnc1?=
 =?utf-8?B?NlhjYkFqRlVWQjRwdzB6SUtWQXJ4eGI4UVNGWTV2cFN4Ym81SEl2aStjc3JC?=
 =?utf-8?B?NnJWcE9GN1hKVWxWSForWGVKdlJucWdJTVNsVUFSOG5qdDhhZ0YrVk1PdHdu?=
 =?utf-8?B?YlFoaEJsTXl2NTZMcGRac2FHU2xmUzZ2YitscHB5N2NPdjhOc0pCeVREK1Vy?=
 =?utf-8?B?cVlPajNlK2J1K1hzdkVlR1gzYjc1TjVoQzB0Rmd0S0w2ZytNRmpDakJNTHFn?=
 =?utf-8?B?Wmc9PQ==?=
Content-ID: <63ECC8637EDF5C4B9DB8F5376A1510C8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3399.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 111084a1-87a4-44ae-3149-08d9ed350a6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 08:03:51.2298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y0TRdHKGBHQQ56LSSyhlFu8fiR5D0kkSUM5dCBMWzm9yjI2gprgEZ/F8wYxixcw/8NN+MbOLRDj1BHCdi8v+ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5387
Cc: "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] usb: dwc2: drd: fix soft connect when
 gadget is unconfigured
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

On 2/9/2022 8:15 PM, Fabrice Gasnier wrote:
> When the gadget driver hasn't been (yet) configured, and the cable is
> connected to a HOST, the SFTDISCON gets cleared unconditionally, so the
> HOST tries to enumerate it.
> At the host side, this can result in a stuck USB port or worse. When
> getting lucky, some dmesg can be observed at the host side:
>   new high-speed USB device number ...
>   device descriptor read/64, error -110
> 
> Fix it in drd, by checking the enabled flag before calling
> dwc2_hsotg_core_connect(). It will be called later, once configured,
> by the normal flow:
> - udc_bind_to_driver
>   - usb_gadget_connect
>     - dwc2_hsotg_pullup
>       - dwc2_hsotg_core_connect
> 
> Fixes: 17f934024e84 ("usb: dwc2: override PHY input signals with usb role switch support")
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Acked-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>

> ---
>   drivers/usb/dwc2/drd.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
> index 1b39c47..9b6d44d 100644
> --- a/drivers/usb/dwc2/drd.c
> +++ b/drivers/usb/dwc2/drd.c
> @@ -130,8 +130,10 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
>   		already = dwc2_ovr_avalid(hsotg, true);
>   	} else if (role == USB_ROLE_DEVICE) {
>   		already = dwc2_ovr_bvalid(hsotg, true);
> -		/* This clear DCTL.SFTDISCON bit */
> -		dwc2_hsotg_core_connect(hsotg);
> +		if (hsotg->enabled) {
> +			/* This clear DCTL.SFTDISCON bit */
> +			dwc2_hsotg_core_connect(hsotg);
> +		}
>   	} else {
>   		if (dwc2_is_device_mode(hsotg)) {
>   			if (!dwc2_ovr_bvalid(hsotg, false))

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
